@interface ENTemporaryExposureKeyManager
+ (id)temporaryExposureKeyFromRawKey:(id)a3 error:(id *)a4;
- (BOOL)requireKeyReleasePromptForClient:(id)a3;
- (ENTemporaryExposureKey)oldestTEK;
- (ENTemporaryExposureKeyManager)initWithQueue:(id)a3;
- (ENTemporaryExposureKeyManagerDelegate)delegate;
- (NSDate)nextPromptDate;
- (id)_getTemporaryExposureKeysFromRollingStart:(unsigned int)a3 includingActive:(BOOL)a4 refresh:(BOOL)a5 error:(id *)a6;
- (id)getTemporaryExposureKeysForClient:(id)a3 fromRollingStart:(unsigned int)a4 didPrompt:(BOOL)a5 forTesting:(BOOL)a6 forceRefresh:(BOOL)a7 error:(id *)a8;
- (unsigned)lastTEKRequestENIN;
- (void)resetClientState;
- (void)setDelegate:(id)a3;
- (void)setNextPromptDate:(id)a3;
@end

@implementation ENTemporaryExposureKeyManager

- (ENTemporaryExposureKeyManager)initWithQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ENTemporaryExposureKeyManager;
  v6 = [(ENTemporaryExposureKeyManager *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_queue, a3);
  }

  return v7;
}

- (BOOL)requireKeyReleasePromptForClient:(id)a3
{
  nextPromptDate = self->_nextPromptDate;
  if (!nextPromptDate) {
    return 1;
  }
  id v4 = a3;
  [(NSDate *)nextPromptDate timeIntervalSinceNow];
  double v6 = v5;
  int v7 = [v4 appAPIVersion];

  return v6 <= 0.0 || v7 > 1;
}

- (id)getTemporaryExposureKeysForClient:(id)a3 fromRollingStart:(unsigned int)a4 didPrompt:(BOOL)a5 forTesting:(BOOL)a6 forceRefresh:(BOOL)a7 error:(id *)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  BOOL v11 = a5;
  uint64_t v12 = *(void *)&a4;
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  v15 = v14;
  if (v9)
  {
    uint64_t v16 = 1;
  }
  else if ((int)[v14 appAPIVersion] > 1)
  {
    uint64_t v16 = v10 ^ 1;
  }
  else
  {
    uint64_t v16 = 0;
  }
  uint64_t v17 = [(ENTemporaryExposureKeyManager *)self _getTemporaryExposureKeysFromRollingStart:v12 includingActive:v10 refresh:v16 error:a8];
  if (v17)
  {
    v18 = (void *)v17;
    [(NSDate *)self->_nextPromptDate timeIntervalSinceNow];
    double v20 = v19;
    uint64_t v80 = v12;
    if ([v18 count])
    {
      v21 = [v18 objectAtIndexedSubscript:0];
      uint64_t v22 = [v21 rollingStartNumber];
      uint64_t v23 = [v21 rollingPeriod];
    }
    else
    {
      uint64_t v22 = 0;
      uint64_t v23 = 0;
    }
    v24 = +[ENLoggingPrefs sharedENLoggingPrefs];
    int v25 = [v24 isSensitiveLoggingAllowed];

    if (v25
      && gLogCategory_ENTemporaryExposureKeyManager <= 30
      && (gLogCategory_ENTemporaryExposureKeyManager != -1 || _LogCategory_Initialize()))
    {
      v26 = v18;
      if (v10) {
        v27 = "yes";
      }
      else {
        v27 = "no";
      }
      v76 = v27;
      uint64_t v78 = v22;
      if (v9) {
        v28 = "yes";
      }
      else {
        v28 = "no";
      }
      BOOL v29 = v11;
      if (v11) {
        v30 = "yes";
      }
      else {
        v30 = "no";
      }
      uint64_t v31 = [v26 count];
      v72 = CUPrintDuration32();
      uint64_t lastTEKRequestENIN = self->_lastTEKRequestENIN;
      v70 = v30;
      uint64_t v71 = v31;
      BOOL v11 = v29;
      v69 = v28;
      uint64_t v22 = v78;
      v18 = v26;
      uint64_t v65 = v80;
      v67 = v76;
      v62 = v15;
      LogPrintF_safe();
    }
    v32 = +[ENLoggingPrefs sharedENLoggingPrefs];
    int v33 = [v32 isRPILoggingAllowed];

    if (v33
      && gLogCategory_ENTemporaryExposureKeyManager <= 30
      && (gLogCategory_ENTemporaryExposureKeyManager != -1 || _LogCategory_Initialize()))
    {
      [(ENTemporaryExposureKey *)self->_oldestTEK keyData];
      v68 = uint64_t v66 = v23;
      uint64_t v63 = v22;
      LogPrintF_safe();
    }
    if ((int)objc_msgSend(v15, "appAPIVersion", v63, v66, v68) > 1) {
      goto LABEL_73;
    }
    if (v11 || v10 || !self->_nextPromptDate)
    {
LABEL_68:
      if (v11)
      {
        if (!self->_nextPromptDate || v20 <= 0.0)
        {
          v56 = [MEMORY[0x1E4F1C9C0] dateWithTimeIntervalSinceNow:108000.0];
          nextPromptDate = self->_nextPromptDate;
          self->_nextPromptDate = v56;
        }
        self->_uint64_t lastTEKRequestENIN = v22;
        v58 = [v18 lastObject];
        oldestTEK = self->_oldestTEK;
        self->_oldestTEK = v58;
      }
LABEL_73:
      v60 = (void *)[v18 copy];

      goto LABEL_74;
    }
    if (self->_lastTEKRequestENIN)
    {
      v77 = v15;
      int v79 = v22;
      id v34 = objc_alloc_init(MEMORY[0x1E4F1CA40]);
      long long v81 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      v75 = v18;
      id v35 = v18;
      uint64_t v36 = [v35 countByEnumeratingWithState:&v81 objects:v86 count:16];
      BOOL v74 = v11;
      if (v36)
      {
        uint64_t v37 = v36;
        uint64_t v38 = *(void *)v82;
        char v39 = 1;
        do
        {
          for (uint64_t i = 0; i != v37; ++i)
          {
            if (*(void *)v82 != v38) {
              objc_enumerationMutation(v35);
            }
            v41 = *(void **)(*((void *)&v81 + 1) + 8 * i);
            if ([v41 rollingStartNumber] <= self->_lastTEKRequestENIN + 144) {
              [v34 addObject:v41];
            }
            v42 = [(ENTemporaryExposureKey *)self->_oldestTEK keyData];
            v43 = [v41 keyData];
            char v44 = [v42 isEqualToData:v43];

            v39 &= v44 ^ 1;
          }
          uint64_t v37 = [v35 countByEnumeratingWithState:&v81 objects:v86 count:16];
        }
        while (v37);
      }
      else
      {
        char v39 = 1;
      }

      unint64_t v47 = [v34 count];
      v18 = v75;
      LODWORD(v22) = v79;
      if (v47 < [v35 count])
      {
        v48 = +[ENLoggingPrefs sharedENLoggingPrefs];
        int v49 = [v48 isSensitiveLoggingAllowed];

        if (v49
          && gLogCategory_ENTemporaryExposureKeyManager <= 30
          && (gLogCategory_ENTemporaryExposureKeyManager != -1 || _LogCategory_Initialize()))
        {
          uint64_t v50 = [v35 count];
          uint64_t v64 = v50 - [v34 count];
          LogPrintF_safe();
        }
        v51 = self->_oldestTEK;
        v52 = v51;
        if (v51) {
          char v53 = v39;
        }
        else {
          char v53 = 0;
        }
        if ((v53 & 1) != 0
          && [(ENTemporaryExposureKey *)v51 rollingStartNumber] >= v80)
        {
          v54 = +[ENLoggingPrefs sharedENLoggingPrefs];
          int v55 = [v54 isSensitiveLoggingAllowed];

          if (v55
            && gLogCategory_ENTemporaryExposureKeyManager <= 30
            && (gLogCategory_ENTemporaryExposureKeyManager != -1 || _LogCategory_Initialize()))
          {
            LogPrintF_safe();
          }
          objc_msgSend(v34, "addObject:", v52, v64);
        }
      }
      uint64_t v46 = objc_msgSend(v34, "copy", v64);
      BOOL v11 = v74;
    }
    else
    {
      uint64_t v45 = [v18 lastObject];
      id v34 = (id)v45;
      if (!v45)
      {
LABEL_67:

        goto LABEL_68;
      }
      v77 = v15;
      uint64_t v85 = v45;
      uint64_t v46 = [MEMORY[0x1E4F1C970] arrayWithObjects:&v85 count:1];
    }

    v18 = (void *)v46;
    v15 = v77;
    goto LABEL_67;
  }
  v60 = 0;
LABEL_74:

  return v60;
}

- (id)_getTemporaryExposureKeysFromRollingStart:(unsigned int)a3 includingActive:(BOOL)a4 refresh:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  BOOL v11 = [(ENTemporaryExposureKeyManager *)self delegate];
  uint64_t v12 = v11;
  if (v11)
  {
    v13 = [v11 temporaryExposureKeyManager:self retrieveTEKHistoryIncludingActive:v8 generateNewTEK:v7];
    if (v13)
    {
      v24 = v12;
      id v14 = objc_alloc_init(MEMORY[0x1E4F1CA40]);
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v15 = v13;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v26;
        while (2)
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v26 != v18) {
              objc_enumerationMutation(v15);
            }
            double v20 = [(id)objc_opt_class() temporaryExposureKeyFromRawKey:*(void *)(*((void *)&v25 + 1) + 8 * i) error:a6];
            if (!v20)
            {

              id v22 = 0;
              goto LABEL_15;
            }
            v21 = v20;
            if ([v20 rollingStartNumber] >= a3) {
              [v14 addObject:v21];
            }
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
          if (v17) {
            continue;
          }
          break;
        }
      }

      id v22 = v14;
LABEL_15:

      uint64_t v12 = v24;
    }
    else if (a6)
    {
      ENErrorF();
      id v22 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v22 = 0;
    }
  }
  else if (a6)
  {
    ENErrorF();
    id v22 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v22 = 0;
  }

  return v22;
}

- (void)resetClientState
{
  v3 = +[ENLoggingPrefs sharedENLoggingPrefs];
  int v4 = [v3 isSensitiveLoggingAllowed];

  if (v4
    && gLogCategory_ENTemporaryExposureKeyManager <= 50
    && (gLogCategory_ENTemporaryExposureKeyManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  nextPromptDate = self->_nextPromptDate;
  self->_nextPromptDate = 0;

  self->_uint64_t lastTEKRequestENIN = 0;
  oldestTEK = self->_oldestTEK;
  self->_oldestTEK = 0;
}

+ (id)temporaryExposureKeyFromRawKey:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 length];
  id v7 = v5;
  uint64_t v8 = [v7 bytes];
  if (v6 == 21)
  {
    uint64_t v9 = v8;
    id v10 = objc_alloc_init(MEMORY[0x1E4F25800]);
    BOOL v11 = objc_msgSend(v7, "subdataWithRange:", 0, 16);
    [v10 setKeyData:v11];

    [v10 setRollingStartNumber:*(unsigned int *)(v9 + 16)];
    [v10 setRollingPeriod:*(unsigned __int8 *)(v9 + 20)];
  }
  else if (a4)
  {
    ENErrorF();
    id v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (NSDate)nextPromptDate
{
  return self->_nextPromptDate;
}

- (void)setNextPromptDate:(id)a3
{
}

- (ENTemporaryExposureKeyManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ENTemporaryExposureKeyManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (ENTemporaryExposureKey)oldestTEK
{
  return self->_oldestTEK;
}

- (unsigned)lastTEKRequestENIN
{
  return self->_lastTEKRequestENIN;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oldestTEK, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_nextPromptDate, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end