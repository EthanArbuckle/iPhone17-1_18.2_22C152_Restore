@interface _DPLHBitacoraLogger
+ (BOOL)donateEventToBitacoraForKey:(id)a3 eventPhase:(int)a4 uuid:(id)a5 succeeded:(BOOL)a6 errorCode:(int)a7 errorMessage:(id)a8 aggregateFunction:(int)a9 count:(int)a10 telemetryAllowed:(BOOL)a11;
+ (id)bitacoraDprivacydEventWithEventPhase:(int)a3 uuid:(id)a4 succeeded:(BOOL)a5 errorCode:(int)a6 errorMessage:(id)a7 aggregateFunction:(int)a8 count:(int)a9;
+ (id)trialIdentifiersForKey:(id)a3;
@end

@implementation _DPLHBitacoraLogger

+ (BOOL)donateEventToBitacoraForKey:(id)a3 eventPhase:(int)a4 uuid:(id)a5 succeeded:(BOOL)a6 errorCode:(int)a7 errorMessage:(id)a8 aggregateFunction:(int)a9 count:(int)a10 telemetryAllowed:(BOOL)a11
{
  uint64_t v12 = *(void *)&a7;
  BOOL v13 = a6;
  uint64_t v15 = *(void *)&a4;
  id v17 = a3;
  id v18 = a5;
  id v19 = a8;
  if (!a11) {
    goto LABEL_4;
  }
  if (a10 < 1)
  {
    char v20 = 1;
    goto LABEL_19;
  }
  if (([v17 hasPrefix:@"fedstats:com.apple.dedisco.telemetry"] & 1) == 0)
  {
    v21 = [a1 trialIdentifiersForKey:v17];
    if (v21)
    {
      LODWORD(v29) = a10;
      v22 = [a1 bitacoraDprivacydEventWithEventPhase:v15 uuid:v18 succeeded:v13 errorCode:v12 errorMessage:v19 aggregateFunction:a9 count:v29];
      if (v22)
      {
        uint64_t v32 = 0;
        v33 = &v32;
        uint64_t v34 = 0x2050000000;
        v23 = (void *)getLBFEventManagerClass_softClass;
        uint64_t v35 = getLBFEventManagerClass_softClass;
        if (!getLBFEventManagerClass_softClass)
        {
          v31[0] = MEMORY[0x1E4F143A8];
          v31[1] = 3221225472;
          v31[2] = __getLBFEventManagerClass_block_invoke;
          v31[3] = &unk_1E6C44780;
          v31[4] = &v32;
          __getLBFEventManagerClass_block_invoke((uint64_t)v31);
          v23 = (void *)v33[3];
        }
        id v24 = v23;
        _Block_object_dispose(&v32, 8);
        v25 = [v24 sharedInstance];
        id v30 = 0;
        char v20 = [v25 addDprivacydEvent:v22 identifiers:v21 error:&v30];
        id v26 = v30;
        if ((v20 & 1) == 0)
        {
          v27 = +[_DPLog framework];
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
            +[_DPLHBitacoraLogger donateEventToBitacoraForKey:eventPhase:uuid:succeeded:errorCode:errorMessage:aggregateFunction:count:telemetryAllowed:]((uint64_t)v17, v26, v27);
          }
        }
      }
      else
      {
        char v20 = 0;
      }
    }
    else
    {
      char v20 = 0;
    }
  }
  else
  {
LABEL_4:
    char v20 = 0;
  }
LABEL_19:

  return v20;
}

+ (id)trialIdentifiersForKey:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 componentsSeparatedByString:@":"];
  unint64_t v5 = [v4 count];
  if (v5 > 4)
  {
    unint64_t v8 = v5;
    v6 = [v4 objectAtIndexedSubscript:v5 - 3];
    v9 = [v4 objectAtIndexedSubscript:v8 - 2];
    v10 = [v4 objectAtIndexedSubscript:v8 - 1];
    v11 = [NSString stringWithFormat:@"%@:%@:%@", v6, v9, v10];
    uint64_t v15 = 0;
    v16 = &v15;
    uint64_t v17 = 0x2050000000;
    uint64_t v12 = (void *)getLBFTrialIdentifiersClass_softClass;
    uint64_t v18 = getLBFTrialIdentifiersClass_softClass;
    if (!getLBFTrialIdentifiersClass_softClass)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getLBFTrialIdentifiersClass_block_invoke;
      char v20 = &unk_1E6C44780;
      v21 = &v15;
      __getLBFTrialIdentifiersClass_block_invoke((uint64_t)buf);
      uint64_t v12 = (void *)v16[3];
    }
    BOOL v13 = v12;
    _Block_object_dispose(&v15, 8);
    v7 = (void *)[[v13 alloc] initWithBMLTTaskID:v11 deploymentID:0];
  }
  else
  {
    v6 = +[_DPLog framework];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v3;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = 5;
      _os_log_impl(&dword_1DC55E000, v6, OS_LOG_TYPE_INFO, "Skipping donation to Bitacora; malformed collection ID %@. The number of colon separated components is less than %ld",
        buf,
        0x16u);
    }
    v7 = 0;
  }

  return v7;
}

+ (id)bitacoraDprivacydEventWithEventPhase:(int)a3 uuid:(id)a4 succeeded:(BOOL)a5 errorCode:(int)a6 errorMessage:(id)a7 aggregateFunction:(int)a8 count:(int)a9
{
  uint64_t v9 = *(void *)&a8;
  BOOL v12 = a5;
  uint64_t v13 = *(void *)&a3;
  id v14 = a4;
  uint64_t v22 = (__CFString *)a7;
  if (!v13)
  {
    v23 = +[_DPLog framework];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      +[_DPLHBitacoraLogger bitacoraDprivacydEventWithEventPhase:uuid:succeeded:errorCode:errorMessage:aggregateFunction:count:](v23);
    }
    goto LABEL_8;
  }
  if (!a6 && !v12)
  {
    v23 = +[_DPLog framework];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      +[_DPLHBitacoraLogger bitacoraDprivacydEventWithEventPhase:uuid:succeeded:errorCode:errorMessage:aggregateFunction:count:](v23);
    }
LABEL_8:
    id v24 = 0;
    goto LABEL_19;
  }
  if (a6 || !v12)
  {
    if (v22) {
      v25 = v22;
    }
    else {
      v25 = &stru_1F3681BE0;
    }
    v23 = +[_DPDediscoError errorWithCode:a6 description:v25];
  }
  else
  {
    v23 = 0;
  }
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x2050000000;
  id v26 = (void *)getLBFDprivacydEventClass_softClass;
  uint64_t v34 = getLBFDprivacydEventClass_softClass;
  if (!getLBFDprivacydEventClass_softClass)
  {
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __getLBFDprivacydEventClass_block_invoke;
    v30[3] = &unk_1E6C44780;
    v30[4] = &v31;
    __getLBFDprivacydEventClass_block_invoke((uint64_t)v30, v15, v16, v17, v18, v19, v20, v21, v29);
    id v26 = (void *)v32[3];
  }
  v27 = v26;
  _Block_object_dispose(&v31, 8);
  id v24 = (void *)[[v27 alloc] initWithEventPhase:v13 eventUUID:v14 succeeded:v12 error:v23 aggregateFunction:v9 count:a9];
LABEL_19:

  return v24;
}

+ (void)donateEventToBitacoraForKey:(NSObject *)a3 eventPhase:uuid:succeeded:errorCode:errorMessage:aggregateFunction:count:telemetryAllowed:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = [a2 localizedDescription];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_error_impl(&dword_1DC55E000, a3, OS_LOG_TYPE_ERROR, "Failed to donate to Bitacora for key %@ with error: %@", (uint8_t *)&v6, 0x16u);
}

+ (void)bitacoraDprivacydEventWithEventPhase:(os_log_t)log uuid:succeeded:errorCode:errorMessage:aggregateFunction:count:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DC55E000, log, OS_LOG_TYPE_ERROR, "Failed to donate to Bitacora; event phase is unknown",
    v1,
    2u);
}

+ (void)bitacoraDprivacydEventWithEventPhase:(os_log_t)log uuid:succeeded:errorCode:errorMessage:aggregateFunction:count:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DC55E000, log, OS_LOG_TYPE_ERROR, "Failed to donate to Bitacora; event is not succeeded but no error code provided",
    v1,
    2u);
}

@end