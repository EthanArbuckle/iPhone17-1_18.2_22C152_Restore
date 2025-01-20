@interface ENTextMessageManager
- (BOOL)_readIfNecessaryWithError:(id *)a3;
- (BOOL)_verifyTextMessage:(id)a3 phoneNumber:(id)a4 verificationDate:(id)a5 publicKey:(id)a6 publicKeyVersion:(id)a7 reportType:(id)a8 outError:(id *)a9;
- (BOOL)verifyTextMessage:(id)a3 phoneNumber:(id)a4 verificationDate:(id)a5 publicKey:(id)a6 publicKeyVersion:(id)a7 userReport:(BOOL *)a8 outError:(id *)a9;
- (ENSecureArchiveFileWrapper)textMessageHistoryFileWrapper;
- (ENTextMessageManager)initWithDirectoryURL:(id)a3;
- (ENTextMessageManagerDelegate)delegate;
- (NSMutableDictionary)textMessageHashes;
- (void)_purgeOldHashes;
- (void)activateIfNeeded;
- (void)invalidate;
- (void)purgeAllHashes;
- (void)purgeOldHashes;
- (void)setDelegate:(id)a3;
- (void)setTextMessageHashes:(id)a3;
- (void)setTextMessageHistoryFileWrapper:(id)a3;
@end

@implementation ENTextMessageManager

- (ENTextMessageManager)initWithDirectoryURL:(id)a3
{
  id v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)ENTextMessageManager;
  v6 = [(ENTextMessageManager *)&v24 init];
  if (v6)
  {
    v7 = [v5 path];
    if (!v7)
    {
      v20 = [MEMORY[0x1E4F28B08] currentHandler];
      [v20 handleFailureInMethod:a2, v6, @"ENTextMessageManager.m", 39, @"Invalid parameter not satisfying: %@", @"directoryPath != nil" object file lineNumber description];
    }
    v8 = [v5 URLByAppendingPathComponent:@"verificationHashes.dat"];
    v9 = [v8 path];

    if (v9)
    {
      id v10 = objc_alloc_init(MEMORY[0x1E4F28CC0]);
      id v23 = 0;
      int v11 = [v10 createDirectoryAtPath:v7 withIntermediateDirectories:1 attributes:0 error:&v23];
      id v12 = v23;
      v13 = v12;
      if (v11)
      {
        uint64_t v14 = *MEMORY[0x1E4F1C638];
        id v22 = v12;
        char v15 = [v5 setResourceValue:MEMORY[0x1E4F1CC30] forKey:v14 error:&v22];
        id v16 = v22;

        if ((v15 & 1) == 0
          && gLogCategory_ENTextMessageManager <= 90
          && (gLogCategory_ENTextMessageManager != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        v17 = [[ENSecureArchiveFileWrapper alloc] initWithPath:v9];
        textMessageHistoryFileWrapper = v6->_textMessageHistoryFileWrapper;
        v6->_textMessageHistoryFileWrapper = v17;

        v13 = v16;
      }
      else if (gLogCategory_ENTextMessageManager <= 90 {
             && (gLogCategory_ENTextMessageManager != -1 || _LogCategory_Initialize()))
      }
      {
        LogPrintF();
      }

      if (v11) {
        goto LABEL_18;
      }
    }
    else
    {
    }
    v19 = 0;
    goto LABEL_21;
  }
LABEL_18:
  v19 = v6;
LABEL_21:

  return v19;
}

- (void)activateIfNeeded
{
  id v4 = 0;
  BOOL v2 = [(ENTextMessageManager *)self _readIfNecessaryWithError:&v4];
  id v3 = v4;
  if (!v2
    && gLogCategory__ENTextMessageManager <= 90
    && (gLogCategory__ENTextMessageManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (BOOL)_readIfNecessaryWithError:(id *)a3
{
  v21[3] = *MEMORY[0x1E4F143B8];
  BOOL v5 = -[ENSecureArchiveFileWrapper openWithError:](self->_textMessageHistoryFileWrapper, "openWithError:");
  if (v5)
  {
    if (!self->_textMessageHashes)
    {
      v6 = (void *)MEMORY[0x1E4F1CAD8];
      v21[0] = objc_opt_class();
      v21[1] = objc_opt_class();
      v21[2] = objc_opt_class();
      v7 = [MEMORY[0x1E4F1C970] arrayWithObjects:v21 count:3];
      v8 = [v6 setWithArray:v7];

      textMessageHistoryFileWrapper = self->_textMessageHistoryFileWrapper;
      id v20 = 0;
      BOOL v10 = [(ENSecureArchiveFileWrapper *)textMessageHistoryFileWrapper readObject:&v20 ofClasses:v8 error:a3];
      id v11 = v20;
      if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        id v12 = [MEMORY[0x1E4F1CA68] dictionaryWithDictionary:v11];
      }
      else
      {
        id v13 = *a3;
        uint64_t v14 = [v13 domain];
        if ([v14 isEqualToString:*MEMORY[0x1E4F25700]])
        {
          uint64_t v15 = [v13 code];

          if (v15 == 16)
          {

            LOBYTE(v5) = 0;
            return v5;
          }
        }
        else
        {
        }
        id v12 = [MEMORY[0x1E4F1CA68] dictionaryWithCapacity:1];
      }
      textMessageHashes = self->_textMessageHashes;
      self->_textMessageHashes = v12;
    }
    v17 = +[ENLoggingPrefs sharedENLoggingPrefs];
    int v18 = [v17 isSensitiveLoggingAllowed];

    if (v18
      && gLogCategory_ENTextMessageManager <= 10
      && (gLogCategory_ENTextMessageManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (void)invalidate
{
  [(ENSecureArchiveFileWrapper *)self->_textMessageHistoryFileWrapper close];
  textMessageHashes = self->_textMessageHashes;
  self->_textMessageHashes = 0;
}

- (void)purgeAllHashes
{
  id v3 = [MEMORY[0x1E4F28CC0] defaultManager];
  id v4 = [(ENSecureArchiveFileWrapper *)self->_textMessageHistoryFileWrapper path];
  id v7 = 0;
  char v5 = [v3 removeItemAtPath:v4 error:&v7];
  id v6 = v7;

  if ((v5 & 1) == 0
    && gLogCategory__ENTextMessageManager <= 90
    && (gLogCategory__ENTextMessageManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)purgeOldHashes
{
  if (self->_textMessageHashes) {
    goto LABEL_4;
  }
  id v8 = 0;
  BOOL v3 = [(ENTextMessageManager *)self _readIfNecessaryWithError:&v8];
  id v4 = v8;
  if (v3)
  {

LABEL_4:
    [(ENTextMessageManager *)self _purgeOldHashes];
    return;
  }
  if (gLogCategory__ENTextMessageManager <= 90)
  {
    if (gLogCategory__ENTextMessageManager != -1 || (v6 = v4, v7 = _LogCategory_Initialize(), id v4 = v6, v7))
    {
      id v5 = v4;
      LogPrintF();
      id v4 = v5;
    }
  }
}

- (void)_purgeOldHashes
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  BOOL v3 = self->_textMessageHashes;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v4 = [(NSMutableDictionary *)v3 allKeys];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        BOOL v10 = [(NSMutableDictionary *)v3 objectForKey:v9];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = [MEMORY[0x1E4F1C9C0] date];
          [v11 timeIntervalSinceDate:v10];
          double v13 = v12;

          if (v13 > 172800.0) {
            [(NSMutableDictionary *)self->_textMessageHashes removeObjectForKey:v9];
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v6);
  }

  textMessageHashes = self->_textMessageHashes;
  if (textMessageHashes)
  {
    textMessageHistoryFileWrapper = self->_textMessageHistoryFileWrapper;
    id v18 = 0;
    BOOL v16 = [(ENSecureArchiveFileWrapper *)textMessageHistoryFileWrapper saveObject:textMessageHashes error:&v18];
    id v17 = v18;
    if (!v16
      && gLogCategory__ENTextMessageManager <= 90
      && (gLogCategory__ENTextMessageManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    id v17 = 0;
  }
}

- (BOOL)verifyTextMessage:(id)a3 phoneNumber:(id)a4 verificationDate:(id)a5 publicKey:(id)a6 publicKeyVersion:(id)a7 userReport:(BOOL *)a8 outError:(id *)a9
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v60 = a4;
  id v16 = a5;
  id v59 = a6;
  id v17 = a7;
  if (!self->_textMessageHashes
    && ![(ENTextMessageManager *)self _readIfNecessaryWithError:a9])
  {
    BOOL v44 = 0;
    goto LABEL_58;
  }
  id v18 = +[ENLoggingPrefs sharedENLoggingPrefs];
  int v19 = [v18 isSensitiveLoggingAllowed];

  if (v19
    && gLogCategory_ENTextMessageManager <= 10
    && (gLogCategory_ENTextMessageManager != -1 || _LogCategory_Initialize()))
  {
    textMessageHashes = self->_textMessageHashes;
    LogPrintF();
  }
  long long v20 = objc_msgSend(v15, "testVerificationCode", textMessageHashes);
  if (v20)
  {
    long long v21 = [(NSMutableDictionary *)self->_textMessageHashes objectForKey:v20];

    if (!v21)
    {
      v56 = v20;
      long long v22 = v16;
      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      uint64_t v23 = [&unk_1F2B35C50 countByEnumeratingWithState:&v64 objects:v68 count:16];
      id v58 = v15;
      if (v23)
      {
        uint64_t v24 = v23;
        v55 = a8;
        id v25 = 0;
        uint64_t v57 = *(void *)v65;
        while (2)
        {
          for (uint64_t i = 0; i != v24; ++i)
          {
            if (*(void *)v65 != v57) {
              objc_enumerationMutation(&unk_1F2B35C50);
            }
            v27 = *(void **)(*((void *)&v64 + 1) + 8 * i);
            v28 = +[ENLoggingPrefs sharedENLoggingPrefs];
            int v29 = [v28 isSensitiveLoggingAllowed];

            if (v29
              && gLogCategory_ENTextMessageManager <= 30
              && (gLogCategory_ENTextMessageManager != -1 || _LogCategory_Initialize()))
            {
              id v53 = v59;
              id v54 = v17;
              id v51 = v60;
              v52 = v22;
              id v50 = v15;
              LogPrintF();
            }

            id v63 = 0;
            BOOL v30 = [(ENTextMessageManager *)self _verifyTextMessage:v15 phoneNumber:v60 verificationDate:v22 publicKey:v59 publicKeyVersion:v17 reportType:v27 outError:&v63];
            id v31 = v63;
            id v25 = v31;
            if (v30) {
              goto LABEL_27;
            }

            v32 = [v22 dateByAddingTimeInterval:-86400.0];
            v33 = +[ENLoggingPrefs sharedENLoggingPrefs];
            int v34 = [v33 isSensitiveLoggingAllowed];

            if (v34
              && gLogCategory_ENTextMessageManager <= 30
              && (gLogCategory_ENTextMessageManager != -1 || _LogCategory_Initialize()))
            {
              LogPrintF();
            }
            id v62 = 0;
            BOOL v35 = -[ENTextMessageManager _verifyTextMessage:phoneNumber:verificationDate:publicKey:publicKeyVersion:reportType:outError:](self, "_verifyTextMessage:phoneNumber:verificationDate:publicKey:publicKeyVersion:reportType:outError:", v15, v60, v32, v59, v17, v27, &v62, v50, v51, v52, v53, v54);
            id v25 = v62;

            if (v35)
            {
LABEL_27:
              BOOL v36 = 1;
            }
            else
            {

              v37 = [v22 dateByAddingTimeInterval:86400.0];
              v38 = +[ENLoggingPrefs sharedENLoggingPrefs];
              int v39 = [v38 isSensitiveLoggingAllowed];

              if (v39
                && gLogCategory_ENTextMessageManager <= 30
                && (gLogCategory_ENTextMessageManager != -1 || _LogCategory_Initialize()))
              {
                LogPrintF();
              }
              id v61 = 0;
              BOOL v36 = [(ENTextMessageManager *)self _verifyTextMessage:v15 phoneNumber:v60 verificationDate:v37 publicKey:v59 publicKeyVersion:v17 reportType:v27 outError:&v61];
              id v25 = v61;
            }
            v40 = +[ENLoggingPrefs sharedENLoggingPrefs];
            int v41 = [v40 isSensitiveLoggingAllowed];

            if (v41
              && gLogCategory_ENTextMessageManager <= 40
              && (gLogCategory_ENTextMessageManager != -1 || _LogCategory_Initialize()))
            {
              v42 = "no";
              if (v36) {
                v42 = "yes";
              }
              v49 = v42;
              id v50 = v27;
              LogPrintF();
            }
            if (v36)
            {
              int v43 = [v27 isEqualToString:@"User Report"];
              BOOL v44 = 1;
              if (v43) {
                BOOL *v55 = 1;
              }
              goto LABEL_51;
            }
            id v15 = v58;
          }
          uint64_t v24 = [&unk_1F2B35C50 countByEnumeratingWithState:&v64 objects:v68 count:16];
          if (v24) {
            continue;
          }
          break;
        }
      }
      else
      {
        id v25 = 0;
      }
      if (a9)
      {
        id v25 = v25;
        BOOL v44 = 0;
        *a9 = v25;
      }
      else
      {
        BOOL v44 = 0;
      }
LABEL_51:
      id v16 = v22;
      long long v20 = v56;
      v45 = +[ENLoggingPrefs sharedENLoggingPrefs];
      int v46 = [v45 isSensitiveLoggingAllowed];

      if (v46
        && gLogCategory_ENTextMessageManager <= 10
        && (gLogCategory_ENTextMessageManager != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }

      id v15 = v58;
      goto LABEL_57;
    }
    if (a9) {
      goto LABEL_62;
    }
LABEL_63:
    BOOL v44 = 0;
    goto LABEL_57;
  }
  if (!a9) {
    goto LABEL_63;
  }
LABEL_62:
  ENErrorF();
  BOOL v44 = 0;
  *a9 = (id)objc_claimAutoreleasedReturnValue();
LABEL_57:

LABEL_58:
  return v44;
}

- (BOOL)_verifyTextMessage:(id)a3 phoneNumber:(id)a4 verificationDate:(id)a5 publicKey:(id)a6 publicKeyVersion:(id)a7 reportType:(id)a8 outError:(id *)a9
{
  id v14 = a3;
  id v15 = a6;
  id v16 = a7;
  id v17 = (void *)MEMORY[0x1E4F1C9A0];
  uint64_t v18 = *MEMORY[0x1E4F1C310];
  id v19 = a8;
  id v20 = a5;
  id v21 = a4;
  long long v22 = [v17 calendarWithIdentifier:v18];
  uint64_t v23 = [MEMORY[0x1E4F1CAE8] timeZoneForSecondsFromGMT:0];
  [v22 setTimeZone:v23];
  id v24 = objc_alloc_init(MEMORY[0x1E4F28C08]);
  [v24 setDateFormat:@"yyyy-MM-dd"];
  [v24 setCalendar:v22];
  uint64_t v25 = [v24 stringFromDate:v20];

  long long v67 = (void *)v25;
  v70 = [MEMORY[0x1E4F29020] stringWithFormat:@"%@.%@.%@", v19, v21, v25];

  v26 = +[ENLoggingPrefs sharedENLoggingPrefs];
  LODWORD(v21) = [v26 isSensitiveLoggingAllowed];

  if (v21
    && gLogCategory_ENTextMessageManager <= 30
    && (gLogCategory_ENTextMessageManager != -1 || _LogCategory_Initialize()))
  {
    id v58 = v70;
    LogPrintF();
  }
  v27 = +[ENLoggingPrefs sharedENLoggingPrefs];
  int v28 = [v27 isSensitiveLoggingAllowed];

  if (v28
    && gLogCategory_ENTextMessageManager <= 10
    && (gLogCategory_ENTextMessageManager != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v68 = v16;
  if (v15 && v16)
  {
    uint64_t v29 = [v14 verificationString];
    BOOL v30 = (void *)v29;
    if (!v29)
    {
      id v54 = (void *)v23;
      if (a9)
      {
        ENErrorF();
        BOOL v56 = 0;
        *a9 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        BOOL v56 = 0;
      }
      v55 = v67;
      goto LABEL_45;
    }
    long long v66 = (void *)v29;
    id v31 = (void *)MEMORY[0x1E4F29020];
    v32 = [v14 verificationString];
    v33 = [v31 stringWithFormat:@"%@.%@", v70, v32];

    int v34 = +[ENLoggingPrefs sharedENLoggingPrefs];
    LODWORD(v32) = [v34 isSensitiveLoggingAllowed];

    if (v32
      && gLogCategory_ENTextMessageManager <= 30
      && (gLogCategory_ENTextMessageManager != -1 || _LogCategory_Initialize()))
    {
      id v59 = v33;
      LogPrintF();
    }
    uint64_t v69 = objc_msgSend(v14, "signature", v59);
    BOOL v35 = +[ENLoggingPrefs sharedENLoggingPrefs];
    int v36 = [v35 isSensitiveLoggingAllowed];

    if (v36
      && gLogCategory_ENTextMessageManager <= 30
      && (gLogCategory_ENTextMessageManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (!v69)
    {
      id v54 = (void *)v23;
      v55 = (void *)v25;
      if (a9)
      {
        ENErrorF();
        BOOL v56 = 0;
        *a9 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        BOOL v56 = 0;
      }
      BOOL v30 = v66;
      goto LABEL_44;
    }
    v37 = [v14 message];
    if (([v37 containsString:v16] & 1) == 0)
    {
      id v54 = (void *)v23;
      if (a9)
      {
        ENErrorF();
        BOOL v49 = 0;
        *a9 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        BOOL v49 = 0;
      }
      BOOL v30 = v66;
      v55 = v67;
LABEL_43:

      BOOL v56 = v49;
LABEL_44:

LABEL_45:
      goto LABEL_46;
    }
    id v63 = v37;
    long long v64 = (void *)v23;
    long long v65 = v22;
    CFDataRef v38 = [v33 dataUsingEncoding:4];
    int v39 = [v14 signature];
    uint64_t v40 = objc_msgSend(v39, "en_base64PaddedString");

    id v62 = (void *)v40;
    CFDataRef v41 = (const __CFData *)[objc_alloc(MEMORY[0x1E4F1C9B0]) initWithBase64EncodedString:v40 options:1];
    CFErrorRef error = 0;
    v42 = (__SecKey *)[v15 keyRef];
    int v43 = SecKeyVerifySignature(v42, (SecKeyAlgorithm)*MEMORY[0x1E4F3BA78], v38, v41, &error);
    CFErrorRef v44 = error;
    if (!error)
    {
LABEL_38:
      BOOL v49 = v43 != 0;
      if (v43)
      {
        CFDataRef v60 = v41;
        CFDataRef v50 = v38;
        id v51 = [v14 testVerificationCode];
        textMessageHashes = self->_textMessageHashes;
        id v53 = [MEMORY[0x1E4F1C9C0] date];
        [(NSMutableDictionary *)textMessageHashes setObject:v53 forKey:v51];

        [(ENTextMessageManager *)self purgeOldHashes];
        if (a9) {
          *a9 = 0;
        }

        CFDataRef v38 = v50;
        CFDataRef v41 = v60;
      }

      id v54 = v64;
      long long v22 = v65;
      BOOL v30 = v66;
      v55 = v67;
      v37 = v63;
      goto LABEL_43;
    }
    v45 = [(__CFError *)error domain];
    if ([v45 isEqualToString:*MEMORY[0x1E4F28768]])
    {
      CFDataRef v46 = v38;
      uint64_t v47 = [(__CFError *)v44 code];

      uint64_t v48 = v47 + 0x10000;
      CFDataRef v38 = v46;
      if (v48 == -2272)
      {
LABEL_35:
        if (a9) {
          *a9 = v44;
        }

        goto LABEL_38;
      }
    }
    else
    {
    }
    if (gLogCategory__ENTextMessageManager <= 90
      && (gLogCategory__ENTextMessageManager != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    goto LABEL_35;
  }
  id v54 = (void *)v23;
  v55 = (void *)v25;
  if (a9)
  {
    ENErrorF();
    BOOL v56 = 0;
    *a9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v56 = 0;
  }
LABEL_46:

  return v56;
}

- (ENTextMessageManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ENTextMessageManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (ENSecureArchiveFileWrapper)textMessageHistoryFileWrapper
{
  return self->_textMessageHistoryFileWrapper;
}

- (void)setTextMessageHistoryFileWrapper:(id)a3
{
}

- (NSMutableDictionary)textMessageHashes
{
  return self->_textMessageHashes;
}

- (void)setTextMessageHashes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textMessageHashes, 0);
  objc_storeStrong((id *)&self->_textMessageHistoryFileWrapper, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end