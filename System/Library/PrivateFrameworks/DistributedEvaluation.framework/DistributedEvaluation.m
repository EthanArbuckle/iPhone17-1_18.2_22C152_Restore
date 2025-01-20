void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;
  uint64_t v10;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_3_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_1BECCEA00(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

uint64_t DESBfloat16TransportReadFrom(uint64_t a1, uint64_t a2)
{
  v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 2)
      {
        char v19 = 0;
        unsigned int v20 = 0;
        uint64_t v21 = 0;
        *(unsigned char *)(a1 + 24) |= 1u;
        while (1)
        {
          uint64_t v22 = *v3;
          unint64_t v23 = *(void *)(a2 + v22);
          if (v23 == -1 || v23 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v24 = *(unsigned char *)(*(void *)(a2 + *v7) + v23);
          *(void *)(a2 + v22) = v23 + 1;
          v21 |= (unint64_t)(v24 & 0x7F) << v19;
          if ((v24 & 0x80) == 0) {
            goto LABEL_31;
          }
          v19 += 7;
          BOOL v14 = v20++ >= 9;
          if (v14)
          {
            LODWORD(v21) = 0;
            goto LABEL_33;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_31:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v21) = 0;
        }
LABEL_33:
        *(_DWORD *)(a1 + 8) = v21;
      }
      else if ((v10 >> 3) == 1)
      {
        uint64_t v17 = PBReaderReadData();
        v18 = *(void **)(a1 + 16);
        *(void *)(a1 + 16) = v17;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t DESIsInternalInstall()
{
  return MEMORY[0x1F40CD648]("");
}

BOOL DESDiagnosticsSubmissionAllowed()
{
  v0 = [MEMORY[0x1E4F74230] sharedConnection];
  BOOL v1 = [v0 effectiveBoolValueForSetting:*MEMORY[0x1E4F73FB8]] == 1;

  return v1;
}

BOOL DESServiceAvailable()
{
  v0 = (void *)MGCopyAnswer();
  if ([v0 BOOLValue])
  {
    BOOL v1 = 1;
  }
  else
  {
    uint64_t v2 = MGGetProductType();
    BOOL v1 = v2 == 4240173202 || v2 == 2702125347;
  }

  return v1;
}

id DESGetDeviceClass()
{
  v0 = (void *)MGCopyAnswer();

  return v0;
}

id DESGetDeviceID()
{
  if (DESGetDeviceID_onceToken != -1) {
    dispatch_once(&DESGetDeviceID_onceToken, &__block_literal_global);
  }
  v0 = (void *)DESGetDeviceID_deviceID;

  return v0;
}

uint64_t __DESGetDeviceID_block_invoke()
{
  DESGetDeviceID_deviceID = MGCopyAnswer();

  return MEMORY[0x1F41817F8]();
}

id DESGetDeviceType()
{
  v0 = (void *)MGCopyAnswer();

  return v0;
}

id DESGetOSVersion()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  size_t v3 = 256;
  int v0 = sysctlbyname("kern.osversion", v4, &v3, 0, 0);
  BOOL v1 = 0;
  if (!v0)
  {
    BOOL v1 = [NSString stringWithUTF8String:v4];
  }

  return v1;
}

id DESGetDeviceLocale()
{
  int v0 = (void *)MEMORY[0x1E4F1CA20];
  BOOL v1 = [MEMORY[0x1E4F1CA20] currentLocale];
  uint64_t v2 = [v1 localeIdentifier];
  size_t v3 = [v0 canonicalLocaleIdentifierFromString:v2];

  return v3;
}

uint64_t DESPathHasFileVault()
{
  return 0;
}

void DESApplyAsynchronousEnumeratorWithCompletion(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  v7 = a3;
  char v8 = [v5 nextObject];
  if (v8)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __DESApplyAsynchronousEnumeratorWithCompletion_block_invoke;
    v9[3] = &unk_1E63C19D0;
    id v10 = v5;
    id v11 = v6;
    unint64_t v12 = v7;
    (*((void (**)(id, void *, void *))v6 + 2))(v11, v8, v9);
  }
  else
  {
    v7[2](v7);
  }
}

uint64_t __DESApplyAsynchronousEnumeratorWithCompletion_block_invoke(void *a1)
{
  return DESApplyAsynchronousEnumeratorWithCompletion(a1[4], a1[5], a1[6]);
}

void DESApplyAsynchronousEnumerator(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = [v3 nextObject];
  if (v5)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __DESApplyAsynchronousEnumerator_block_invoke;
    v7[3] = &unk_1E63C19F8;
    id v8 = v3;
    id v9 = v4;
    (*((void (**)(id, void *, void *, uint64_t))v4 + 2))(v9, v5, v7, v6);
  }
}

uint64_t __DESApplyAsynchronousEnumerator_block_invoke(uint64_t a1)
{
  return DESApplyAsynchronousEnumerator(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

id DESSubmissionLogFileURLs(void *a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  DESSubmissionLogGarbageCollect();
  uint64_t v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v3 = DESSubmissionLogDirectoryURL();
  v9[0] = *MEMORY[0x1E4F1D738];
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  id v8 = 0;
  id v5 = [v2 contentsOfDirectoryAtURL:v3 includingPropertiesForKeys:v4 options:0 error:&v8];
  id v6 = v8;

  if (a1 && v6) {
    *a1 = v6;
  }

  return v5;
}

id DESSubmissionLogDirectoryURL()
{
  int v0 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/var/mobile/Library/DES/" isDirectory:1];
  BOOL v1 = [v0 URLByAppendingPathComponent:@"SubmissionLogs/" isDirectory:1];

  return v1;
}

uint64_t DESShouldAlwaysParticipate()
{
  int v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v1 = [v0 BOOLForKey:@"ShouldAlwaysParticipate"];

  if (v1)
  {
    uint64_t v2 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      DESShouldAlwaysParticipate_cold_1(v2);
    }
  }
  return v1;
}

id DESTemporaryDownloadDirectoryURL()
{
  int v0 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v1 = NSTemporaryDirectory();
  uint64_t v2 = [v1 stringByAppendingPathComponent:@"dodML-Attachments"];
  id v3 = [v0 fileURLWithPath:v2 isDirectory:1];

  return v3;
}

BOOL almostEqual(float a1, float a2)
{
  return vabds_f32(a1, a2) <= 0.00000011921;
}

BOOL almostEqualWithAccuracy(float a1, float a2, float a3)
{
  return vabds_f32(a1, a2) <= a3;
}

BOOL almostEqualDBL(double a1, double a2)
{
  return vabdd_f64(a1, a2) <= 2.22044605e-16;
}

BOOL almostEqualDBLWithAccuracy(double a1, double a2, double a3)
{
  return vabdd_f64(a1, a2) <= a3;
}

uint64_t binaryGCD(unint64_t a1, unint64_t a2)
{
  uint64_t v2 = 1;
  if (a1 != a2)
  {
    unint64_t v3 = a1;
    a1 = a2;
    while (1)
    {
      if (!v3) {
        return a1 * v2;
      }
      if (!a1)
      {
        a1 = v3;
        return a1 * v2;
      }
      if (((a1 | v3) & 1) == 0) {
        break;
      }
      if (a1 & 1) == 0 || (v3)
      {
        if ((a1 & 1) != 0 || (v3 & 1) == 0)
        {
          unint64_t v4 = (a1 - v3) >> 1;
          if (v3 > a1)
          {
            unint64_t v3 = (v3 - a1) >> 1;
          }
          else
          {
            a1 = v3;
            unint64_t v3 = v4;
          }
          goto LABEL_11;
        }
        goto LABEL_10;
      }
      v3 >>= 1;
LABEL_11:
      if (v3 == a1) {
        return a1 * v2;
      }
    }
    v2 *= 2;
    v3 >>= 1;
LABEL_10:
    a1 >>= 1;
    goto LABEL_11;
  }
  return a1 * v2;
}

uint64_t allowCustomWakeUpPeriod()
{
  return 0;
}

uint64_t DESRootURL()
{
  return [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/var/mobile/Library/DES/" isDirectory:1];
}

id DESDeviceIdentifierStoreURL()
{
  int v0 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/var/mobile/Library/DES/" isDirectory:1];
  uint64_t v1 = [v0 URLByAppendingPathComponent:@"deviceIdentifiers.json" isDirectory:0];

  return v1;
}

id DESRecordRootURL()
{
  int v0 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/var/mobile/Library/DES/" isDirectory:1];
  uint64_t v1 = [v0 URLByAppendingPathComponent:@"Records/" isDirectory:1];

  return v1;
}

uint64_t DESHourOfDayInUTC()
{
  int v0 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
  uint64_t v1 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  uint64_t v2 = [MEMORY[0x1E4F1C9C8] date];
  unint64_t v3 = [v1 componentsInTimeZone:v0 fromDate:v2];

  uint64_t v4 = [v3 hour];
  return v4;
}

id DESLogAndReturnSunsetError()
{
  if (DESLogAndReturnSunsetError_onceToken != -1) {
    dispatch_once(&DESLogAndReturnSunsetError_onceToken, &__block_literal_global_48);
  }
  int v0 = +[DESLogging coreChannel];
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    DESLogAndReturnSunsetError_cold_1(v0);
  }

  uint64_t v1 = (void *)DESLogAndReturnSunsetError_sunSetError;

  return v1;
}

void __DESLogAndReturnSunsetError_block_invoke()
{
  v5[1] = *MEMORY[0x1E4F143B8];
  int v0 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v4 = *MEMORY[0x1E4F28568];
  v5[0] = @"DodML is already sunset. Pls migrate.";
  uint64_t v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  uint64_t v2 = [v0 errorWithDomain:@"kDESDistributedEvaluationErrorDomain" code:1533 userInfo:v1];
  unint64_t v3 = (void *)DESLogAndReturnSunsetError_sunSetError;
  DESLogAndReturnSunsetError_sunSetError = v2;
}

void *DESLogAndSetSunsetError(void *result)
{
  if (result)
  {
    uint64_t v1 = result;
    DESLogAndReturnSunsetError();
    uint64_t result = (id)objc_claimAutoreleasedReturnValue();
    *uint64_t v1 = result;
  }
  return result;
}

id RecordDirPathForRecordType(void *a1)
{
  uint64_t v1 = RecordDirURLForRecordType(a1);
  uint64_t v2 = [v1 path];

  return v2;
}

id RecordDirURLForRecordType(void *a1)
{
  id v1 = a1;
  uint64_t v2 = DESRecordRootURL();
  unint64_t v3 = [v2 URLByAppendingPathComponent:v1 isDirectory:1];

  return v3;
}

void GarbageCollectOldRecords(void *a1)
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = RecordDirPathForRecordType(v1);
  unint64_t v3 = +[DESRecordStorePolicyManager sharedInstance];
  uint64_t v4 = [v3 maximumNumberOfRecordsForPluginID:v1];
  uint64_t v5 = [v3 daysToExpirationOfRecordsForPluginID:v1];
  id v6 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  id v71 = 0;
  v7 = [v6 contentsOfDirectoryAtPath:v2 error:&v71];
  id v8 = v71;
  id v9 = v8;
  if (v7)
  {
    v49 = v3;
    id v50 = v1;
    unint64_t v54 = 2 * v4;
    v51 = v2;
    [v6 changeCurrentDirectoryPath:v2];
    id v10 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_3];
    v48 = v7;
    id v11 = [v7 filteredArrayUsingPredicate:v10];

    id v53 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    unint64_t v12 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    char v13 = [MEMORY[0x1E4F1C9C8] date];
    BOOL v14 = [v12 dateByAddingUnit:16 value:-v5 toDate:v13 options:0];

    id v52 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v67 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    int v15 = v11;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v67 objects:v80 count:16];
    obuint64_t j = v15;
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v68;
      uint64_t v19 = *MEMORY[0x1E4F282C0];
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          uint64_t v21 = v9;
          if (*(void *)v68 != v18) {
            objc_enumerationMutation(obj);
          }
          uint64_t v22 = *(void **)(*((void *)&v67 + 1) + 8 * i);
          id v66 = v9;
          unint64_t v23 = [v6 attributesOfItemAtPath:v22 error:&v66];
          id v9 = v66;

          char v24 = [v23 objectForKey:v19];

          if (v24)
          {
            if ([v24 compare:v14] == -1)
            {
              v25 = [v22 stringByDeletingPathExtension];
              [v53 addObject:v25];
            }
            else
            {
              [v52 addObject:v24];
            }
          }
        }
        int v15 = obj;
        uint64_t v17 = [obj countByEnumeratingWithState:&v67 objects:v80 count:16];
      }
      while (v17);
    }

    if ([v52 count] >= v54)
    {
      [v52 sortUsingComparator:&__block_literal_global_35];
      v55 = [v52 objectAtIndex:v54 - 1];

      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      v27 = [v6 contentsOfDirectoryAtPath:v51 error:0];
      uint64_t v28 = [v27 countByEnumeratingWithState:&v62 objects:v79 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v63;
        uint64_t v31 = *MEMORY[0x1E4F282C0];
        do
        {
          uint64_t v32 = 0;
          v33 = v9;
          do
          {
            if (*(void *)v63 != v30) {
              objc_enumerationMutation(v27);
            }
            v34 = *(void **)(*((void *)&v62 + 1) + 8 * v32);
            id v61 = v33;
            v35 = [v6 attributesOfItemAtPath:v34 error:&v61];
            id v9 = v61;

            v36 = [v35 objectForKey:v31];

            if ([v36 compare:v55] == -1)
            {
              v37 = [v34 stringByDeletingPathExtension];
              [v53 addObject:v37];
            }
            ++v32;
            v33 = v9;
          }
          while (v29 != v32);
          uint64_t v29 = [v27 countByEnumeratingWithState:&v62 objects:v79 count:16];
        }
        while (v29);
      }
    }
    else
    {
      v55 = v14;
    }
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v38 = v53;
    uint64_t v39 = [v38 countByEnumeratingWithState:&v57 objects:v78 count:16];
    if (v39)
    {
      uint64_t v40 = v39;
      v41 = 0;
      uint64_t v42 = *(void *)v58;
      do
      {
        for (uint64_t j = 0; j != v40; ++j)
        {
          if (*(void *)v58 != v42) {
            objc_enumerationMutation(v38);
          }
          v44 = *(void **)(*((void *)&v57 + 1) + 8 * j);
          uint64_t v45 = (uint64_t)v41 + DeleteFileWithBasePath(v6, v44, @"json");
          v41 = (void *)(v45 + DeleteFileWithBasePath(v6, v44, @"desdata"));
        }
        uint64_t v40 = [v38 countByEnumeratingWithState:&v57 objects:v78 count:16];
      }
      while (v40);

      if (v41)
      {
        id v1 = v50;
        +[DESCoreAnalyticsEventManager sendEventDeleteRecordForBundleID:v50 removedCount:v41];
LABEL_39:
        v46 = +[DESLogging coreChannel];
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v47 = [v38 count];
          *(_DWORD *)buf = 134218498;
          id v73 = v41;
          __int16 v74 = 2048;
          uint64_t v75 = v47;
          __int16 v76 = 2112;
          id v77 = v1;
          _os_log_debug_impl(&dword_1BECCB000, v46, OS_LOG_TYPE_DEBUG, "Garbage collected %lu file(s) and %lu record(s) for %@", buf, 0x20u);
        }

        uint64_t v2 = v51;
        v7 = v48;
        unint64_t v3 = v49;
        v26 = obj;
LABEL_42:

        goto LABEL_43;
      }
    }
    else
    {

      v41 = 0;
    }
    id v1 = v50;
    goto LABEL_39;
  }
  if ([v8 code] != 260)
  {
    v26 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v73 = v9;
      _os_log_impl(&dword_1BECCB000, v26, OS_LOG_TYPE_DEFAULT, "Couldn't read old DES records: %@", buf, 0xCu);
    }
    goto LABEL_42;
  }
LABEL_43:
}

uint64_t __GarbageCollectOldRecords_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 pathExtension];
  if ([v2 isEqualToString:@"json"]) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = [v2 isEqualToString:@"desdata"];
  }

  return v3;
}

uint64_t __GarbageCollectOldRecords_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

uint64_t DeleteFileWithBasePath(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  id v6 = [a2 stringByAppendingPathExtension:a3];
  id v12 = 0;
  uint64_t v7 = objc_msgSend(v5, "_fides_removeItemAtPath:error:", v6, &v12);

  id v8 = v12;
  id v9 = +[DESLogging coreChannel];
  id v10 = v9;
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      DeleteFileWithBasePath_cold_1();
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    DeleteFileWithBasePath_cold_2();
  }

  return v7;
}

void GarbageCollectAllRecords()
{
  v34[1] = *MEMORY[0x1E4F143B8];
  int v0 = DESRecordRootURL();
  id v1 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v2 = *MEMORY[0x1E4F1C628];
  v34[0] = *MEMORY[0x1E4F1C628];
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:1];
  id v28 = 0;
  uint64_t v4 = [v1 contentsOfDirectoryAtURL:v0 includingPropertiesForKeys:v3 options:4 error:&v28];
  id v5 = v28;

  if (v4)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (!v7) {
      goto LABEL_19;
    }
    uint64_t v8 = v7;
    uint64_t v19 = v4;
    unsigned int v20 = v1;
    uint64_t v21 = v0;
    uint64_t v9 = *(void *)v25;
    while (1)
    {
      uint64_t v10 = 0;
      do
      {
        id v11 = v5;
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(v6);
        }
        id v12 = *(void **)(*((void *)&v24 + 1) + 8 * v10);
        id v22 = 0;
        id v23 = 0;
        [v12 getResourceValue:&v23 forKey:v2 error:&v22];
        id v13 = v23;
        id v5 = v22;

        if (!v13)
        {
          BOOL v14 = +[DESLogging coreChannel];
          if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
            goto LABEL_13;
          }
          *(_DWORD *)buf = 138412546;
          uint64_t v31 = v12;
          __int16 v32 = 2112;
          id v33 = v5;
          int v15 = v14;
          uint64_t v16 = "Fail to read isDirectory for %@ with error=%@";
          uint32_t v17 = 22;
          goto LABEL_16;
        }
        if ([v13 BOOLValue])
        {
          BOOL v14 = [v12 lastPathComponent];
          GarbageCollectOldRecords(v14);
          goto LABEL_13;
        }
        BOOL v14 = +[DESLogging coreChannel];
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v31 = v12;
          int v15 = v14;
          uint64_t v16 = "Unexpected file in DES record root: %@";
          uint32_t v17 = 12;
LABEL_16:
          _os_log_error_impl(&dword_1BECCB000, v15, OS_LOG_TYPE_ERROR, v16, buf, v17);
        }
LABEL_13:

        ++v10;
      }
      while (v8 != v10);
      uint64_t v18 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
      uint64_t v8 = v18;
      if (!v18)
      {
        id v1 = v20;
        int v0 = v21;
        uint64_t v4 = v19;
        goto LABEL_19;
      }
    }
  }
  if ([v5 code] != 260)
  {
    id v6 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v31 = v0;
      __int16 v32 = 2112;
      id v33 = v5;
      _os_log_impl(&dword_1BECCB000, v6, OS_LOG_TYPE_DEFAULT, "Couldn't find any directories in %@ with error=%@", buf, 0x16u);
    }
LABEL_19:
  }
}

id DESAmendedRecordInfo(void *a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v21 = a1;
  id v5 = a2;
  id v6 = a3;
  size_t v22 = 256;
  uint64_t v7 = 0;
  if (!sysctlbyname("kern.osversion", buf, &v22, 0, 0))
  {
    uint64_t v7 = [NSString stringWithUTF8String:buf];
  }
  uint64_t v8 = DESGetDeviceType();
  if ((int)[v6 length] >= 4) {
    uint64_t v9 = (int)([v6 length] - 4);
  }
  else {
    uint64_t v9 = 0;
  }
  uint64_t v10 = [v6 substringFromIndex:v9];
  if ([v10 length]
    && ((int)[v10 length] < 1 ? (uint64_t v11 = 0) : (uint64_t v11 = (int)(objc_msgSend(v10, "length") - 1)),
        uint64_t v12 = (char)[v10 characterAtIndex:v11] - 48,
        v12 <= 3))
  {
    id v13 = off_1E63C1C30[v12];
  }
  else
  {
    id v13 = @"train";
  }
  BOOL v14 = [MEMORY[0x1E4F1CA60] dictionary];
  [v14 setValue:v7 forKey:@"$device_os"];
  [v14 setValue:v8 forKey:@"$device_type"];
  [v14 setValue:v10 forKey:@"$dodml_device_identifier"];
  [v14 setValue:v13 forKey:@"$dodml_dataset"];
  [v14 setValue:v5 forKey:@"$record_type"];
  int v15 = +[DESLogging coreChannel];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138478083;
    long long v24 = v10;
    __int16 v25 = 2112;
    long long v26 = v13;
    _os_log_impl(&dword_1BECCB000, v15, OS_LOG_TYPE_INFO, "DES identifier: %{private}@, dataset: %@", buf, 0x16u);
  }

  uint64_t v16 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint32_t v17 = [NSString stringWithFormat:@"InfoKeys-%@", v5];
  uint64_t v18 = [v16 dictionaryForKey:v17];
  if (v18)
  {
    uint64_t v19 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      long long v24 = v18;
      _os_log_impl(&dword_1BECCB000, v19, OS_LOG_TYPE_INFO, "Using custom info key/value pairs set by device owner: %@", buf, 0xCu);
    }

    [v14 addEntriesFromDictionary:v18];
  }
  [v14 addEntriesFromDictionary:v21];

  return v14;
}

BOOL AddRecordsForTypeWithUUIDs(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v35 = a1;
  id v9 = a2;
  id v34 = a3;
  id v33 = a4;
  if (a5) {
    *a5 = 0;
  }
  uint64_t v10 = RecordDirPathForRecordType(v35);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  obuint64_t j = v9;
  uint64_t v37 = [obj countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (v37)
  {
    uint64_t v11 = *(void *)v39;
    uint64_t v12 = @"json";
    unint64_t v13 = 0x1E4F1C000uLL;
    __int16 v32 = a5;
    do
    {
      for (uint64_t i = 0; i != v37; ++i)
      {
        if (*(void *)v39 != v11) {
          objc_enumerationMutation(obj);
        }
        int v15 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        uint64_t v16 = objc_msgSend(v15, "UUIDString", v32);
        uint32_t v17 = [v10 stringByAppendingPathComponent:v16];
        uint64_t v18 = [v17 stringByAppendingPathExtension:v12];

        uint64_t v19 = (void *)[objc_alloc(*(Class *)(v13 + 2488)) initWithContentsOfFile:v18 options:1 error:a5];
        if (v19)
        {
          unsigned int v20 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v19 options:0 error:a5];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            DESAmendedRecordInfo(v20, v35, v33);
            unint64_t v21 = v13;
            uint64_t v22 = v11;
            id v23 = v10;
            v25 = long long v24 = v12;

            [v34 setObject:v25 forKey:v15];
            unsigned int v20 = v25;
            uint64_t v12 = v24;
            uint64_t v10 = v23;
            uint64_t v11 = v22;
            unint64_t v13 = v21;
            a5 = v32;
          }
          else
          {
            uint64_t v27 = +[DESLogging coreChannel];
            if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              if (a5) {
                uint64_t v28 = *a5;
              }
              else {
                uint64_t v28 = 0;
              }
              *(_DWORD *)buf = 138412546;
              v43 = v18;
              __int16 v44 = 2112;
              uint64_t v45 = v28;
              _os_log_impl(&dword_1BECCB000, v27, OS_LOG_TYPE_INFO, "Skipping unparsable record: %@, %@", buf, 0x16u);
            }
          }
        }
        else
        {
          unsigned int v20 = +[DESLogging coreChannel];
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            if (a5) {
              uint64_t v26 = *a5;
            }
            else {
              uint64_t v26 = 0;
            }
            *(_DWORD *)buf = 138412546;
            v43 = v18;
            __int16 v44 = 2112;
            uint64_t v45 = v26;
            _os_log_impl(&dword_1BECCB000, v20, OS_LOG_TYPE_INFO, "Skipping unreadable record: %@, %@", buf, 0x16u);
          }
        }
      }
      uint64_t v37 = [obj countByEnumeratingWithState:&v38 objects:v46 count:16];
    }
    while (v37);
  }

  uint64_t v29 = [obj count];
  BOOL v30 = !a5 || v29 || !*a5;

  return v30;
}

id AddRecordsForType(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  id v38 = a2;
  id v37 = a3;
  GarbageCollectOldRecords(v7);
  if (a4) {
    *a4 = 0;
  }
  long long v39 = a4;
  id v34 = v7;
  uint64_t v8 = RecordDirPathForRecordType(v7);
  id v35 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  v36 = (void *)v8;
  id v9 = [v35 enumeratorAtPath:v8];
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v11 = v9;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v41 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        objc_msgSend(v11, "skipDescendants", v34);
        uint32_t v17 = [v16 pathExtension];
        int v18 = [v17 isEqualToString:@"json"];

        if (v18)
        {
          id v19 = objc_alloc(MEMORY[0x1E4F29128]);
          unsigned int v20 = [v16 stringByDeletingPathExtension];
          unint64_t v21 = (void *)[v19 initWithUUIDString:v20];

          if (v21)
          {
            [v10 addObject:v21];
          }
          else
          {
            uint64_t v22 = +[DESLogging coreChannel];
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v45 = v16;
              _os_log_impl(&dword_1BECCB000, v22, OS_LOG_TYPE_INFO, "Skipping bad record name: %@", buf, 0xCu);
            }
          }
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v40 objects:v46 count:16];
    }
    while (v13);
  }

  id v23 = v10;
  uint64_t v24 = [v10 count];
  if (!v39 || v24)
  {
    uint64_t v29 = v34;
    uint64_t v28 = v35;
    uint64_t v26 = v37;
    uint64_t v25 = v38;
    uint64_t v27 = v36;
  }
  else
  {
    uint64_t v26 = v37;
    uint64_t v25 = v38;
    uint64_t v28 = v35;
    uint64_t v27 = v36;
    if (*v39)
    {

      id v23 = 0;
    }
    uint64_t v29 = v34;
  }

  if (v23 && AddRecordsForTypeWithUUIDs(v29, v23, v25, v26, v39))
  {
    BOOL v30 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v31 = [v25 allKeys];
    __int16 v32 = [v30 setWithArray:v31];
  }
  else
  {
    __int16 v32 = 0;
  }

  return v32;
}

id FindRecordTypeForRecordUUID(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy__0;
  int v15 = __Block_byref_object_dispose__0;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __FindRecordTypeForRecordUUID_block_invoke;
  v8[3] = &unk_1E63C1B48;
  id v5 = v4;
  id v9 = v5;
  id v10 = &v11;
  [v3 enumerateKeysAndObjectsUsingBlock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v6;
}

void sub_1BECD7C38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void __FindRecordTypeForRecordUUID_block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v8 = a2;
  if ([a3 containsObject:*(void *)(a1 + 32)])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }
}

id RecordDataForUUID(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = RecordDirPathForRecordType(a1);
  id v7 = [v5 UUIDString];

  id v8 = [v6 stringByAppendingPathComponent:v7];
  id v9 = [v8 stringByAppendingPathExtension:@"desdata"];

  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v9 options:1 error:a3];

  return v10;
}

id RecordInfoForUUID(void *a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = RecordDirPathForRecordType(a1);
  id v7 = [v5 UUIDString];

  id v8 = [v6 stringByAppendingPathComponent:v7];
  id v9 = [v8 stringByAppendingPathExtension:@"json"];

  id v19 = 0;
  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v9 options:1 error:&v19];
  id v11 = v19;
  if (v10)
  {
    id v18 = v11;
    uint64_t v12 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v10 options:0 error:&v18];
    id v13 = v18;

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = v12;
    }
    else
    {
      id v16 = +[DESLogging coreChannel];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        unint64_t v21 = v9;
        __int16 v22 = 2112;
        id v23 = v13;
        _os_log_impl(&dword_1BECCB000, v16, OS_LOG_TYPE_INFO, "Unparsable record: %@, %@", buf, 0x16u);
      }

      id v14 = 0;
      if (a3) {
        *a3 = v13;
      }
    }
  }
  else
  {
    int v15 = +[DESLogging coreChannel];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      unint64_t v21 = v9;
      __int16 v22 = 2112;
      id v23 = v11;
      _os_log_impl(&dword_1BECCB000, v15, OS_LOG_TYPE_INFO, "Unreadable record: %@, %@", buf, 0x16u);
    }

    if (a3)
    {
      id v13 = v11;
      id v14 = 0;
      *a3 = v13;
    }
    else
    {
      id v14 = 0;
      id v13 = v11;
    }
  }

  return v14;
}

void sub_1BECD8B94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va1, a10);
  va_start(va, a10);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

id DESServiceGetXPCInterface(uint64_t a1)
{
  v32[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = &protocolRef_DESRecordStoreService;
  if (a1 == 1) {
    uint64_t v2 = &protocolRef_DESFullService;
  }
  id v3 = [MEMORY[0x1E4F29280] interfaceWithProtocol:*v2];
  if (a1 == 1)
  {
    id v4 = (void *)MEMORY[0x1E4F1CAD0];
    v32[0] = objc_opt_class();
    v32[1] = objc_opt_class();
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:2];
    id v6 = [v4 setWithArray:v5];
    [v3 setClasses:v6 forSelector:sel_runEvaluationForBundleId_recipePath_recordUUIDs_attachments_sandboxExtensions_completion_ argumentIndex:2 ofReply:0];

    id v7 = (void *)MEMORY[0x1E4F1CAD0];
    v31[0] = objc_opt_class();
    v31[1] = objc_opt_class();
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
    id v9 = [v7 setWithArray:v8];
    [v3 setClasses:v9 forSelector:sel_runEvaluationForBundleId_recipePath_recordUUIDs_attachments_sandboxExtensions_completion_ argumentIndex:3 ofReply:0];

    id v10 = (void *)MEMORY[0x1E4F1CAD0];
    v30[0] = objc_opt_class();
    v30[1] = objc_opt_class();
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:2];
    uint64_t v12 = [v10 setWithArray:v11];
    [v3 setClasses:v12 forSelector:sel_runEvaluationForBundleId_recipePath_recordUUIDs_attachments_sandboxExtensions_completion_ argumentIndex:4 ofReply:0];

    uint64_t v13 = (void *)MEMORY[0x1E4F1CAD0];
    v29[0] = objc_opt_class();
    v29[1] = objc_opt_class();
    v29[2] = objc_opt_class();
    v29[3] = objc_opt_class();
    uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:4];
    uint64_t v15 = [v13 setWithArray:v14];
    [v3 setClasses:v15 forSelector:sel_fetchRecordsForBundleId_completion_ argumentIndex:0 ofReply:1];

    uint64_t v16 = (void *)MEMORY[0x1E4F1CAD0];
    v28[0] = objc_opt_class();
    v28[1] = objc_opt_class();
    v28[2] = objc_opt_class();
    v28[3] = objc_opt_class();
    v28[4] = objc_opt_class();
    v28[5] = objc_opt_class();
    v28[6] = objc_opt_class();
    uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:7];
    id v18 = [v16 setWithArray:v17];
    [v3 setClasses:v18 forSelector:sel_fetchRecordsForBundleId_completion_ argumentIndex:1 ofReply:1];

    id v19 = (void *)MEMORY[0x1E4F1CAD0];
    v27[0] = objc_opt_class();
    v27[1] = objc_opt_class();
    v27[2] = objc_opt_class();
    v27[3] = objc_opt_class();
    v27[4] = objc_opt_class();
    unsigned int v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:5];
    unint64_t v21 = [v19 setWithArray:v20];
    [v3 setClasses:v21 forSelector:sel_runLiveEvaluationForBundleId_taskSource_baseURL_localeIdentifier_completion_ argumentIndex:0 ofReply:1];
  }
  __int16 v22 = (void *)MEMORY[0x1E4F1CAD0];
  v26[0] = objc_opt_class();
  v26[1] = objc_opt_class();
  v26[2] = objc_opt_class();
  v26[3] = objc_opt_class();
  v26[4] = objc_opt_class();
  v26[5] = objc_opt_class();
  v26[6] = objc_opt_class();
  id v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:7];
  uint64_t v24 = [v22 setWithArray:v23];
  [v3 setClasses:v24 forSelector:sel_fetchSavedRecordInfoForRecordType_completion_ argumentIndex:0 ofReply:1];

  return v3;
}

void sub_1BECDD664(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void DESSubmissionLogGarbageCollect()
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  int v0 = DESSubmissionLogDirectoryURL();
  id v1 = [v0 path];

  id v65 = 0;
  id v50 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  uint64_t v2 = [v50 contentsOfDirectoryAtPath:v1 error:&v65];
  id v3 = v65;
  if (v2)
  {
    id v4 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_5];
    long long v42 = v2;
    id v5 = [v2 filteredArrayUsingPredicate:v4];

    id v48 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v46 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v6 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    id v7 = [MEMORY[0x1E4F1C9C8] date];
    __int16 v44 = [v6 dateByAddingUnit:16 value:-28 toDate:v7 options:0];

    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    obuint64_t j = v5;
    uint64_t v8 = [obj countByEnumeratingWithState:&v61 objects:v75 count:16];
    uint64_t v45 = v1;
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v62;
      uint64_t v49 = *MEMORY[0x1E4F282C0];
      uint64_t v11 = *MEMORY[0x1E4F28390];
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          uint64_t v13 = v3;
          if (*(void *)v62 != v10) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = [v1 stringByAppendingPathComponent:*(void *)(*((void *)&v61 + 1) + 8 * i)];
          id v60 = v3;
          uint64_t v15 = [v50 attributesOfItemAtPath:v14 error:&v60];
          id v3 = v60;

          if (v15)
          {
            uint64_t v16 = [v15 objectForKey:v49];
            uint64_t v17 = [v15 objectForKey:v11];
            id v18 = (void *)v17;
            if (v16) {
              BOOL v19 = v17 == 0;
            }
            else {
              BOOL v19 = 1;
            }
            if (!v19)
            {
              if ([v16 compare:v44] == -1) {
                [v48 addObject:v14];
              }
              v73[0] = @"Size";
              v73[1] = @"Date";
              v74[0] = v18;
              v74[1] = v16;
              v73[2] = @"Path";
              v74[2] = v14;
              unsigned int v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v74 forKeys:v73 count:3];
              [v46 addObject:v20];

              id v1 = v45;
            }
          }
          else
          {
            uint64_t v16 = +[DESLogging coreChannel];
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              id v67 = v3;
              _os_log_error_impl(&dword_1BECCB000, v16, OS_LOG_TYPE_ERROR, "Failed to get file attributes: %@", buf, 0xCu);
            }
          }
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v61 objects:v75 count:16];
      }
      while (v9);
    }

    long long v43 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"Date" ascending:0];
    v72 = v43;
    unint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v72 count:1];
    __int16 v22 = [v46 sortedArrayUsingDescriptors:v21];

    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v23 = v22;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v56 objects:v71 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      unint64_t v26 = 0;
      uint64_t v27 = *(void *)v57;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v57 != v27) {
            objc_enumerationMutation(v23);
          }
          uint64_t v29 = *(void **)(*((void *)&v56 + 1) + 8 * j);
          BOOL v30 = [v29 objectForKey:@"Size"];
          v26 += [v30 unsignedLongLongValue];

          if (v26 > 0xA00000)
          {
            uint64_t v31 = [v29 objectForKey:@"Path"];
            [v48 addObject:v31];
          }
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v56 objects:v71 count:16];
      }
      while (v25);
    }

    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v32 = v48;
    uint64_t v33 = [v32 countByEnumeratingWithState:&v52 objects:v70 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v53;
      do
      {
        for (uint64_t k = 0; k != v34; ++k)
        {
          id v37 = v3;
          if (*(void *)v53 != v35) {
            objc_enumerationMutation(v32);
          }
          id v38 = *(void **)(*((void *)&v52 + 1) + 8 * k);
          id v51 = v3;
          int v39 = [v50 removeItemAtPath:v38 error:&v51];
          id v3 = v51;

          long long v40 = +[DESLogging coreChannel];
          long long v41 = v40;
          if (v39)
          {
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              id v67 = v38;
              _os_log_debug_impl(&dword_1BECCB000, v41, OS_LOG_TYPE_DEBUG, "Garbage collected DES submission log file %@", buf, 0xCu);
            }
          }
          else if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            id v67 = v38;
            __int16 v68 = 2112;
            id v69 = v3;
            _os_log_error_impl(&dword_1BECCB000, v41, OS_LOG_TYPE_ERROR, "Could not garbage collect old DES submission log file %@: %@", buf, 0x16u);
          }
        }
        uint64_t v34 = [v32 countByEnumeratingWithState:&v52 objects:v70 count:16];
      }
      while (v34);
    }

    id v1 = v45;
    uint64_t v2 = v42;
  }
  else
  {
    obuint64_t j = +[DESLogging coreChannel];
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR)) {
      DESSubmissionLogGarbageCollect_cold_1((uint64_t)v3, obj);
    }
  }
}

uint64_t __DESSubmissionLogGarbageCollect_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 pathExtension];
  uint64_t v3 = [v2 isEqualToString:@"submissionlog"];

  return v3;
}

uint64_t DESWriteSubmissionLogData(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a1;
  id v7 = DESSubmissionLogDirectoryURL();
  uint64_t v8 = [v7 path];

  if (DESSubmissionLogsDateFormatter_onceToken != -1) {
    dispatch_once(&DESSubmissionLogsDateFormatter_onceToken, &__block_literal_global_26);
  }
  id v9 = (id)DESSubmissionLogsDateFormatter_formatter;
  uint64_t v10 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v11 = [v9 stringFromDate:v10];

  uint64_t v12 = NSString;
  uint64_t v13 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v14 = [v13 UUIDString];
  uint64_t v15 = [v12 stringWithFormat:@"%@%@-%@.%@", v6, v14, v11, @"submissionlog"];

  uint64_t v16 = [v8 stringByAppendingPathComponent:v15];
  if (!sDESSubmissionLogHandler)
  {
    id v18 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
    id v29 = 0;
    char v19 = [v18 createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:0 error:&v29];
    id v20 = v29;
    id v21 = v20;
    if ((v19 & 1) == 0)
    {
      uint64_t v24 = +[DESLogging coreChannel];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        DESWriteSubmissionLogData_cold_2((uint64_t)v8, (uint64_t)v21, v24);
      }

      if (a3)
      {
        id v21 = v21;
        uint64_t v17 = 0;
        *a3 = v21;
      }
      else
      {
        uint64_t v17 = 0;
      }
      goto LABEL_20;
    }
    id v27 = v18;
    id v28 = v20;
    char v22 = [v5 writeToFile:v16 options:805306368 error:&v28];
    id v23 = v28;

    if (v22)
    {
      DESSubmissionLogGarbageCollect();
      uint64_t v17 = 1;
    }
    else
    {
      uint64_t v25 = +[DESLogging coreChannel];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        DESWriteSubmissionLogData_cold_1((uint64_t)v23, v25);
      }

      if (a3)
      {
        id v21 = v23;
        uint64_t v17 = 0;
        *a3 = v21;
LABEL_19:
        id v18 = v27;
LABEL_20:

        goto LABEL_21;
      }
      uint64_t v17 = 0;
    }
    id v21 = v23;
    goto LABEL_19;
  }
  uint64_t v17 = (*(uint64_t (**)(void))(sDESSubmissionLogHandler + 16))();
LABEL_21:

  return v17;
}

uint64_t DESSubmissionLogSetHandler(void *a1)
{
  sDESSubmissionLogHandler = [a1 copy];

  return MEMORY[0x1F41817F8]();
}

uint64_t __DESSubmissionLogsDateFormatter_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  id v1 = (void *)DESSubmissionLogsDateFormatter_formatter;
  DESSubmissionLogsDateFormatter_formatter = (uint64_t)v0;

  uint64_t v2 = (void *)DESSubmissionLogsDateFormatter_formatter;

  return [v2 setDateFormat:@"YYYYMMdd'T'HHmmss"];
}

uint64_t DESBinary32TransportReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v6 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v7 = 0;
      unsigned int v8 = 0;
      unint64_t v9 = 0;
      while (1)
      {
        uint64_t v10 = *v3;
        uint64_t v11 = *(void *)(a2 + v10);
        unint64_t v12 = v11 + 1;
        if (v11 == -1 || v12 > *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v6) + v11);
        *(void *)(a2 + v10) = v12;
        v9 |= (unint64_t)(v13 & 0x7F) << v7;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v7 += 7;
        if (v8++ >= 9)
        {
          unint64_t v9 = 0;
          uint64_t v15 = *v5;
          int v16 = *(unsigned __int8 *)(a2 + v15);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      uint64_t v15 = *v5;
      int v16 = *(unsigned __int8 *)(a2 + v15);
      if (*(unsigned char *)(a2 + v15)) {
        unint64_t v9 = 0;
      }
LABEL_14:
      int v17 = v9 & 7;
      if (v16 || v17 == 4) {
        break;
      }
      if ((v9 >> 3) == 1)
      {
        if (v17 == 2)
        {
          uint64_t result = PBReaderPlaceMark();
          if (!result) {
            return result;
          }
          while (1)
          {
            id v20 = (unint64_t *)(a2 + *v3);
            unint64_t v21 = *v20;
            unint64_t v22 = *(void *)(a2 + *v4);
            if (*v20 >= v22) {
              break;
            }
            uint64_t v23 = *v5;
            if (*(unsigned char *)(a2 + v23)) {
              break;
            }
            if (v21 > 0xFFFFFFFFFFFFFFFBLL || v21 + 4 > v22) {
              *(unsigned char *)(a2 + v23) = 1;
            }
            else {
              *id v20 = v21 + 4;
            }
            PBRepeatedFloatAdd();
          }
          PBReaderRecallMark();
        }
        else
        {
          uint64_t v24 = *v3;
          unint64_t v25 = *(void *)(a2 + v24);
          if (v25 <= 0xFFFFFFFFFFFFFFFBLL && v25 + 4 <= *(void *)(a2 + *v4)) {
            *(void *)(a2 + v24) = v25 + 4;
          }
          else {
            *(unsigned char *)(a2 + v15) = 1;
          }
          PBRepeatedFloatAdd();
        }
      }
      else if ((PBReaderSkipValueWithTag() & 1) == 0)
      {
        return 0;
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t DESBinary64TransportReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    id v6 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v7 = 0;
      unsigned int v8 = 0;
      unint64_t v9 = 0;
      while (1)
      {
        uint64_t v10 = *v3;
        uint64_t v11 = *(void *)(a2 + v10);
        unint64_t v12 = v11 + 1;
        if (v11 == -1 || v12 > *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v6) + v11);
        *(void *)(a2 + v10) = v12;
        v9 |= (unint64_t)(v13 & 0x7F) << v7;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v7 += 7;
        if (v8++ >= 9)
        {
          unint64_t v9 = 0;
          uint64_t v15 = *v5;
          int v16 = *(unsigned __int8 *)(a2 + v15);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      uint64_t v15 = *v5;
      int v16 = *(unsigned __int8 *)(a2 + v15);
      if (*(unsigned char *)(a2 + v15)) {
        unint64_t v9 = 0;
      }
LABEL_14:
      int v17 = v9 & 7;
      if (v16 || v17 == 4) {
        break;
      }
      if ((v9 >> 3) == 1)
      {
        if (v17 == 2)
        {
          uint64_t result = PBReaderPlaceMark();
          if (!result) {
            return result;
          }
          while (1)
          {
            id v20 = (unint64_t *)(a2 + *v3);
            unint64_t v21 = *v20;
            unint64_t v22 = *(void *)(a2 + *v4);
            if (*v20 >= v22) {
              break;
            }
            uint64_t v23 = *v5;
            if (*(unsigned char *)(a2 + v23)) {
              break;
            }
            if (v21 > 0xFFFFFFFFFFFFFFF7 || v21 + 8 > v22) {
              *(unsigned char *)(a2 + v23) = 1;
            }
            else {
              *id v20 = v21 + 8;
            }
            PBRepeatedDoubleAdd();
          }
          PBReaderRecallMark();
        }
        else
        {
          uint64_t v24 = *v3;
          unint64_t v25 = *(void *)(a2 + v24);
          if (v25 <= 0xFFFFFFFFFFFFFFF7 && v25 + 8 <= *(void *)(a2 + *v4)) {
            *(void *)(a2 + v24) = v25 + 8;
          }
          else {
            *(unsigned char *)(a2 + v15) = 1;
          }
          PBRepeatedDoubleAdd();
        }
      }
      else if ((PBReaderSkipValueWithTag() & 1) == 0)
      {
        return 0;
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t DESPFLNoisableReadFrom(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) >= *(void *)(a2 + (int)*MEMORY[0x1E4F940E0])) {
    return *(unsigned char *)(a2 + *v5) == 0;
  }
  unint64_t v7 = 0x1EA131000uLL;
  unint64_t v8 = 0x1EA131000uLL;
  unint64_t v9 = (int *)MEMORY[0x1E4F940B8];
  unint64_t v10 = 0x1EA131000uLL;
  while (2)
  {
    if (*(unsigned char *)(a2 + *v5)) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    char v11 = 0;
    unsigned int v12 = 0;
    unint64_t v13 = 0;
    while (1)
    {
      uint64_t v14 = *v3;
      uint64_t v15 = *(void *)(a2 + v14);
      unint64_t v16 = v15 + 1;
      if (v15 == -1 || v16 > *(void *)(a2 + *v4)) {
        break;
      }
      char v17 = *(unsigned char *)(*(void *)(a2 + *v9) + v15);
      *(void *)(a2 + v14) = v16;
      v13 |= (unint64_t)(v17 & 0x7F) << v11;
      if ((v17 & 0x80) == 0) {
        goto LABEL_12;
      }
      v11 += 7;
      BOOL v18 = v12++ >= 9;
      if (v18)
      {
        unint64_t v13 = 0;
        uint64_t v19 = *v5;
        int v20 = *(unsigned __int8 *)(a2 + v19);
        goto LABEL_14;
      }
    }
    *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
    uint64_t v19 = *v5;
    int v20 = *(unsigned __int8 *)(a2 + v19);
    if (*(unsigned char *)(a2 + v19)) {
      unint64_t v13 = 0;
    }
LABEL_14:
    int v21 = v13 & 7;
    if (v20 || v21 == 4) {
      return *(unsigned char *)(a2 + *v5) == 0;
    }
    switch((v13 >> 3))
    {
      case 1u:
        char v23 = 0;
        unsigned int v24 = 0;
        uint64_t v25 = 0;
        *(unsigned char *)(a1 + *(int *)(v7 + 2940)) |= 4u;
        while (1)
        {
          uint64_t v26 = *v3;
          uint64_t v27 = *(void *)(a2 + v26);
          unint64_t v28 = v27 + 1;
          if (v27 == -1 || v28 > *(void *)(a2 + *v4)) {
            break;
          }
          char v29 = *(unsigned char *)(*(void *)(a2 + *v9) + v27);
          *(void *)(a2 + v26) = v28;
          v25 |= (unint64_t)(v29 & 0x7F) << v23;
          if ((v29 & 0x80) == 0) {
            goto LABEL_64;
          }
          v23 += 7;
          BOOL v18 = v24++ >= 9;
          if (v18)
          {
            LODWORD(v25) = 0;
            goto LABEL_66;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_64:
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v25) = 0;
        }
LABEL_66:
        uint64_t v55 = *(int *)(v8 + 2944);
        goto LABEL_71;
      case 2u:
        uint64_t v30 = PBReaderReadString();
        uint64_t v31 = *(int *)(v10 + 2948);
        goto LABEL_58;
      case 3u:
        char v32 = 0;
        unsigned int v33 = 0;
        uint64_t v25 = 0;
        *(unsigned char *)(a1 + *(int *)(v7 + 2940)) |= 2u;
        while (2)
        {
          uint64_t v34 = *v3;
          uint64_t v35 = *(void *)(a2 + v34);
          unint64_t v36 = v35 + 1;
          if (v35 == -1 || v36 > *(void *)(a2 + *v4))
          {
            *(unsigned char *)(a2 + *v5) = 1;
          }
          else
          {
            char v37 = *(unsigned char *)(*(void *)(a2 + *v9) + v35);
            *(void *)(a2 + v34) = v36;
            v25 |= (unint64_t)(v37 & 0x7F) << v32;
            if (v37 < 0)
            {
              v32 += 7;
              BOOL v18 = v33++ >= 9;
              if (v18)
              {
                LODWORD(v25) = 0;
                goto LABEL_70;
              }
              continue;
            }
          }
          break;
        }
        if (*(unsigned char *)(a2 + *v5)) {
          LODWORD(v25) = 0;
        }
LABEL_70:
        uint64_t v55 = 72;
LABEL_71:
        *(_DWORD *)(a1 + v55) = v25;
        goto LABEL_84;
      case 4u:
        *(unsigned char *)(a1 + *(int *)(v7 + 2940)) |= 1u;
        uint64_t v38 = *v3;
        unint64_t v39 = *(void *)(a2 + v38);
        if (v39 <= 0xFFFFFFFFFFFFFFF7 && v39 + 8 <= *(void *)(a2 + *v4))
        {
          uint64_t v40 = *(void *)(*(void *)(a2 + *v9) + v39);
          *(void *)(a2 + v38) = v39 + 8;
        }
        else
        {
          *(unsigned char *)(a2 + *v5) = 1;
          uint64_t v40 = 0;
        }
        *(void *)(a1 + 56) = v40;
        goto LABEL_84;
      case 5u:
        if (v21 != 2)
        {
          uint64_t v56 = *v3;
          unint64_t v57 = *(void *)(a2 + v56);
          if (v57 <= 0xFFFFFFFFFFFFFFF7 && v57 + 8 <= *(void *)(a2 + *v4)) {
            *(void *)(a2 + v56) = v57 + 8;
          }
          else {
            *(unsigned char *)(a2 + v19) = 1;
          }
          PBRepeatedDoubleAdd();
          goto LABEL_84;
        }
        uint64_t result = PBReaderPlaceMark();
        if (!result) {
          return result;
        }
        while (1)
        {
          long long v42 = (unint64_t *)(a2 + *v3);
          unint64_t v43 = *v42;
          unint64_t v44 = *(void *)(a2 + *v4);
          if (*v42 >= v44) {
            break;
          }
          uint64_t v45 = *v5;
          if (*(unsigned char *)(a2 + v45)) {
            break;
          }
          if (v43 > 0xFFFFFFFFFFFFFFF7 || v43 + 8 > v44) {
            *(unsigned char *)(a2 + v45) = 1;
          }
          else {
            *long long v42 = v43 + 8;
          }
          PBRepeatedDoubleAdd();
        }
        goto LABEL_62;
      case 6u:
        if (v21 == 2)
        {
          uint64_t result = PBReaderPlaceMark();
          if (!result) {
            return result;
          }
          while (1)
          {
            id v46 = (unint64_t *)(a2 + *v3);
            unint64_t v47 = *v46;
            unint64_t v48 = *(void *)(a2 + *v4);
            if (*v46 >= v48) {
              break;
            }
            uint64_t v49 = *v5;
            if (*(unsigned char *)(a2 + v49)) {
              break;
            }
            if (v47 > 0xFFFFFFFFFFFFFFFBLL || v47 + 4 > v48) {
              *(unsigned char *)(a2 + v49) = 1;
            }
            else {
              unint64_t *v46 = v47 + 4;
            }
            PBRepeatedFloatAdd();
          }
LABEL_62:
          PBReaderRecallMark();
        }
        else
        {
          uint64_t v58 = *v3;
          unint64_t v59 = *(void *)(a2 + v58);
          if (v59 <= 0xFFFFFFFFFFFFFFFBLL && v59 + 4 <= *(void *)(a2 + *v4)) {
            *(void *)(a2 + v58) = v59 + 4;
          }
          else {
            *(unsigned char *)(a2 + v19) = 1;
          }
          PBRepeatedFloatAdd();
        }
        goto LABEL_84;
      case 7u:
        uint64_t v30 = PBReaderReadString();
        uint64_t v31 = 88;
LABEL_58:
        id v50 = *(void **)(a1 + v31);
        *(void *)(a1 + v31) = v30;

        goto LABEL_84;
      case 8u:
        unint64_t v51 = v10;
        unint64_t v52 = v8;
        unint64_t v53 = v7;
        long long v54 = objc_alloc_init(DESDataTransport);
        objc_storeStrong((id *)(a1 + 64), v54);
        if (PBReaderPlaceMark() && DESDataTransportReadFrom((id *)&v54->super.super.isa, a2))
        {
          PBReaderRecallMark();

          unint64_t v7 = v53;
          unint64_t v8 = v52;
          unint64_t v10 = v51;
LABEL_84:
          if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
            return *(unsigned char *)(a2 + *v5) == 0;
          }
          continue;
        }

        return 0;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0) {
          return 0;
        }
        goto LABEL_84;
    }
  }
}

void *calculateSigmaFromEpsilonAndDeltaForUnitL2Norm(long double a1, long double a2)
{
  void v8[4] = *MEMORY[0x1E4F143B8];
  if (a2 != 0.0 && a1 != 0.0)
  {
    long double v4 = erfc(-0.0) * 0.5;
    double v5 = exp(a1);
    if (v4 - v5 * (erfc(sqrt(a1 + a1) / 1.41421356) * 0.5) <= a2)
    {
      v8[0] = &unk_1F19D9048;
      *(long double *)&v8[1] = a1;
      *(long double *)&v8[2] = a2;
      v8[3] = v8;
      bisect((uint64_t)v8);
      return std::__function::__value_func<double ()(double)>::~__value_func[abi:ne180100](v8);
    }
    else
    {
      v7[0] = &unk_1F19D90A0;
      *(long double *)&v7[1] = a1;
      *(long double *)&v7[2] = a2;
      v7[3] = v7;
      bisect((uint64_t)v7);
      return std::__function::__value_func<double ()(double)>::~__value_func[abi:ne180100](v7);
    }
  }
  return result;
}

void sub_1BECEA440(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  std::__function::__value_func<double ()(double)>::~__value_func[abi:ne180100]((uint64_t *)va);
  _Unwind_Resume(a1);
}

double bisect(uint64_t a1)
{
  double v2 = 0.0;
  std::function<double ()(double)>::operator()(a1, 0.0);
  double v4 = v3;
  double v5 = 1000.0;
  std::function<double ()(double)>::operator()(a1, 1000.0);
  if (v4 * v6 >= 0.0) {
    return NAN;
  }
  do
  {
    double v7 = (v2 + v5) * 0.5;
    std::function<double ()(double)>::operator()(a1, v7);
    if (fabs(v8) <= 2.22044605e-16) {
      break;
    }
    std::function<double ()(double)>::operator()(a1, (v2 + v5) * 0.5);
    double v10 = v9;
    std::function<double ()(double)>::operator()(a1, v2);
    if (v10 * v11 < 0.0) {
      double v5 = (v2 + v5) * 0.5;
    }
    else {
      double v2 = (v2 + v5) * 0.5;
    }
  }
  while (v5 - v2 >= 2.22044605e-16);
  return v7;
}

uint64_t std::function<double ()(double)>::operator()(uint64_t a1, double a2)
{
  double v4 = a2;
  uint64_t v2 = *(void *)(a1 + 24);
  if (!v2) {
    std::__throw_bad_function_call[abi:ne180100]();
  }
  return (*(uint64_t (**)(uint64_t, double *))(*(void *)v2 + 48))(v2, &v4);
}

void std::__throw_bad_function_call[abi:ne180100]()
{
  exception = __cxa_allocate_exception(8uLL);
}

void std::bad_function_call::~bad_function_call(std::bad_function_call *this)
{
  std::exception::~exception(this);

  JUMPOUT(0x1C189B000);
}

void std::__function::__func<calculateSigmaFromEpsilonAndDeltaForUnitL2Norm::$_0,std::allocator<calculateSigmaFromEpsilonAndDeltaForUnitL2Norm::$_0>,double ()(double)>::~__func()
{
}

__n128 std::__function::__func<calculateSigmaFromEpsilonAndDeltaForUnitL2Norm::$_0,std::allocator<calculateSigmaFromEpsilonAndDeltaForUnitL2Norm::$_0>,double ()(double)>::__clone(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_1F19D9048;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 std::__function::__func<calculateSigmaFromEpsilonAndDeltaForUnitL2Norm::$_0,std::allocator<calculateSigmaFromEpsilonAndDeltaForUnitL2Norm::$_0>,double ()(double)>::__clone(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_1F19D9048;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

long double std::__function::__func<calculateSigmaFromEpsilonAndDeltaForUnitL2Norm::$_0,std::allocator<calculateSigmaFromEpsilonAndDeltaForUnitL2Norm::$_0>,double ()(double)>::operator()(uint64_t a1, double *a2)
{
  double v3 = *a2;
  long double v4 = *(double *)(a1 + 8);
  long double v5 = erfc(sqrt(*a2 * v4) / -1.41421356) * 0.5;
  double v6 = exp(v4);
  return v5 - v6 * (erfc(sqrt((v3 + 2.0) * v4) / 1.41421356) * 0.5) - *(double *)(a1 + 16);
}

uint64_t std::__function::__func<calculateSigmaFromEpsilonAndDeltaForUnitL2Norm::$_0,std::allocator<calculateSigmaFromEpsilonAndDeltaForUnitL2Norm::$_0>,double ()(double)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<calculateSigmaFromEpsilonAndDeltaForUnitL2Norm::$_0,std::allocator<calculateSigmaFromEpsilonAndDeltaForUnitL2Norm::$_0>,double ()(double)>::target_type()
{
}

BOOL std::type_info::operator==[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a2 + 8);
  if (v2 == v3) {
    return 1;
  }
  if ((v3 & v2) < 0 != __OFSUB__(v2, v3)) {
    return strcmp((const char *)(v2 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  }
  return 0;
}

void *std::__function::__value_func<double ()(double)>::~__value_func[abi:ne180100](void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

void std::__function::__func<calculateSigmaFromEpsilonAndDeltaForUnitL2Norm::$_1,std::allocator<calculateSigmaFromEpsilonAndDeltaForUnitL2Norm::$_1>,double ()(double)>::~__func()
{
}

__n128 std::__function::__func<calculateSigmaFromEpsilonAndDeltaForUnitL2Norm::$_1,std::allocator<calculateSigmaFromEpsilonAndDeltaForUnitL2Norm::$_1>,double ()(double)>::__clone(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_1F19D90A0;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 std::__function::__func<calculateSigmaFromEpsilonAndDeltaForUnitL2Norm::$_1,std::allocator<calculateSigmaFromEpsilonAndDeltaForUnitL2Norm::$_1>,double ()(double)>::__clone(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_1F19D90A0;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

long double std::__function::__func<calculateSigmaFromEpsilonAndDeltaForUnitL2Norm::$_1,std::allocator<calculateSigmaFromEpsilonAndDeltaForUnitL2Norm::$_1>,double ()(double)>::operator()(uint64_t a1, double *a2)
{
  double v3 = *a2;
  long double v4 = *(double *)(a1 + 8);
  long double v5 = erfc(sqrt(*a2 * v4) / 1.41421356) * 0.5;
  double v6 = exp(v4);
  return v5 - v6 * (erfc(sqrt((v3 + 2.0) * v4) / 1.41421356) * 0.5) - *(double *)(a1 + 16);
}

uint64_t std::__function::__func<calculateSigmaFromEpsilonAndDeltaForUnitL2Norm::$_1,std::allocator<calculateSigmaFromEpsilonAndDeltaForUnitL2Norm::$_1>,double ()(double)>::target(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

void *std::__function::__func<calculateSigmaFromEpsilonAndDeltaForUnitL2Norm::$_1,std::allocator<calculateSigmaFromEpsilonAndDeltaForUnitL2Norm::$_1>,double ()(double)>::target_type()
{
}

void sub_1BECEB848(_Unwind_Exception *a1)
{
}

void __DESLoggingGetCoreChannel_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.MLRuntime", "MLRuntime");
  id v1 = (void *)DESLoggingGetCoreChannel_coreChannel;
  DESLoggingGetCoreChannel_coreChannel = (uint64_t)v0;

  if (!DESLoggingGetCoreChannel_coreChannel && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    __DESLoggingGetCoreChannel_block_invoke_cold_1();
  }
}

uint64_t DESEncryptedDataReadFrom(uint64_t a1, uint64_t a2)
{
  double v3 = (int *)MEMORY[0x1E4F940E8];
  long double v4 = (int *)MEMORY[0x1E4F940E0];
  long double v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    double v7 = (int *)MEMORY[0x1E4F940B8];
    while (2)
    {
      if (!*(unsigned char *)(a2 + *v5))
      {
        char v8 = 0;
        unsigned int v9 = 0;
        unint64_t v10 = 0;
        while (1)
        {
          uint64_t v11 = *v3;
          unint64_t v12 = *(void *)(a2 + v11);
          if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
          *(void *)(a2 + v11) = v12 + 1;
          v10 |= (unint64_t)(v13 & 0x7F) << v8;
          if ((v13 & 0x80) == 0) {
            goto LABEL_12;
          }
          v8 += 7;
          BOOL v14 = v9++ >= 9;
          if (v14)
          {
            unint64_t v10 = 0;
            int v15 = *(unsigned __int8 *)(a2 + *v5);
            goto LABEL_14;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
        int v15 = *(unsigned __int8 *)(a2 + *v5);
        if (*(unsigned char *)(a2 + *v5)) {
          unint64_t v10 = 0;
        }
LABEL_14:
        if (v15) {
          BOOL v16 = 1;
        }
        else {
          BOOL v16 = (v10 & 7) == 4;
        }
        if (!v16)
        {
          switch((v10 >> 3))
          {
            case 1u:
              char v17 = 0;
              unsigned int v18 = 0;
              uint64_t v19 = 0;
              *(unsigned char *)(a1 + 36) |= 1u;
              break;
            case 2u:
              uint64_t v24 = PBReaderReadData();
              uint64_t v25 = 16;
              goto LABEL_31;
            case 3u:
              uint64_t v24 = PBReaderReadData();
              uint64_t v25 = 24;
              goto LABEL_31;
            case 4u:
              uint64_t v24 = PBReaderReadString();
              uint64_t v25 = 8;
LABEL_31:
              uint64_t v26 = *(void **)(a1 + v25);
              *(void *)(a1 + v25) = v24;

              goto LABEL_36;
            default:
              uint64_t result = PBReaderSkipValueWithTag();
              if (!result) {
                return result;
              }
LABEL_36:
              if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
                return *(unsigned char *)(a2 + *v5) == 0;
              }
              continue;
          }
          while (1)
          {
            uint64_t v20 = *v3;
            unint64_t v21 = *(void *)(a2 + v20);
            if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
              break;
            }
            char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
            *(void *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0) {
              goto LABEL_33;
            }
            v17 += 7;
            BOOL v14 = v18++ >= 9;
            if (v14)
            {
              LODWORD(v19) = 0;
              goto LABEL_35;
            }
          }
          *(unsigned char *)(a2 + *v5) = 1;
LABEL_33:
          if (*(unsigned char *)(a2 + *v5)) {
            LODWORD(v19) = 0;
          }
LABEL_35:
          *(_DWORD *)(a1 + 32) = v19;
          goto LABEL_36;
        }
      }
      break;
    }
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

id getFedStatsDataEncoderClass()
{
  uint64_t v4 = 0;
  long double v5 = &v4;
  uint64_t v6 = 0x2050000000;
  os_log_t v0 = (void *)getFedStatsDataEncoderClass_softClass;
  uint64_t v7 = getFedStatsDataEncoderClass_softClass;
  if (!getFedStatsDataEncoderClass_softClass)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __getFedStatsDataEncoderClass_block_invoke;
    v3[3] = &unk_1E63C2148;
    v3[4] = &v4;
    __getFedStatsDataEncoderClass_block_invoke((uint64_t)v3);
    os_log_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1BECED0E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t PrivateFederatedLearningLibraryCore()
{
  if (!PrivateFederatedLearningLibraryCore_frameworkLibrary) {
    PrivateFederatedLearningLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return PrivateFederatedLearningLibraryCore_frameworkLibrary;
}

uint64_t __PrivateFederatedLearningLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PrivateFederatedLearningLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getFedStatsDataEncoderClass_block_invoke(uint64_t a1)
{
  double v3 = 0;
  if (!PrivateFederatedLearningLibraryCore()) {
    __getFedStatsDataEncoderClass_block_invoke_cold_1(&v3);
  }
  Class result = objc_getClass("FedStatsDataEncoder");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getFedStatsDataEncoderClass_block_invoke_cold_2();
  }
  getFedStatsDataEncoderClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1BECEDC54(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, long long buf, int a12, __int16 a13, __int16 a14, id a15, long long a16)
{
  if (a2)
  {
    id v19 = objc_begin_catch(a1);
    if (a2 == 2)
    {
      id v20 = v19;
      unint64_t v21 = +[DESLogging coreChannel];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(v17);
        id v29 = (id)objc_claimAutoreleasedReturnValue();
        char v23 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        id v24 = [v23 bundleIdentifier];
        uint64_t v25 = [v20 callStackSymbols];
        LODWORD(buf) = 138413058;
        *(void *)((char *)&buf + 4) = v29;
        WORD6(buf) = 2112;
        *(void *)((char *)&buf + 14) = v24;
        a14 = 2112;
        a15 = v20;
        LOWORD(a16) = 2112;
        *(void *)((char *)&a16 + 2) = v25;
        _os_log_error_impl(&dword_1BECCB000, v21, OS_LOG_TYPE_ERROR, "Caught exception during %@ for plugin %@: %@, %@", (uint8_t *)&buf, 0x2Au);
      }
      if (v16)
      {
        ErrorFromException(v20);
        *BOOL v16 = (id)objc_claimAutoreleasedReturnValue();
      }

      objc_end_catch();
    }
    else
    {
      char v22 = +[DESLogging coreChannel];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(v17);
        id v26 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v27 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        unint64_t v28 = [v27 bundleIdentifier];
        LODWORD(buf) = 138412546;
        *(void *)((char *)&buf + 4) = v26;
        WORD6(buf) = 2112;
        *(void *)((char *)&buf + 14) = v28;
        _os_log_error_impl(&dword_1BECCB000, v22, OS_LOG_TYPE_ERROR, "Caught non-ObjC exception during %@ for plugin %@", (uint8_t *)&buf, 0x16u);
      }
      if (v16)
      {
        ErrorFromException(0);
        *BOOL v16 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_end_catch();
    }
    JUMPOUT(0x1BECEDBF4);
  }
  _Unwind_Resume(a1);
}

id ErrorFromException(void *a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v1 = (void *)MEMORY[0x1E4F28C58];
  if (a1)
  {
    uint64_t v6 = @"callStackSymbols";
    uint64_t v2 = [a1 callStackSymbols];
    v7[0] = v2;
    double v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
    uint64_t v4 = [v1 errorWithDomain:@"kDESDistributedEvaluationErrorDomain" code:4000 userInfo:v3];
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"kDESDistributedEvaluationErrorDomain" code:4000 userInfo:0];
  }

  return v4;
}

void sub_1BECEE090(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, long long a9, int a10, __int16 a11, __int16 a12, uint64_t a13, long long a14)
{
  if (a2)
  {
    id v17 = objc_begin_catch(exception_object);
    if (a2 == 2)
    {
      id v18 = v17;
      id v19 = +[DESLogging coreChannel];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(v15);
        id v21 = (id)objc_claimAutoreleasedReturnValue();
        char v22 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        id v23 = [v22 bundleIdentifier];
        id v24 = [v18 callStackSymbols];
        LODWORD(a9) = 138413058;
        *(void *)((char *)&a9 + 4) = v21;
        WORD6(a9) = 2112;
        *(void *)((char *)&a9 + 14) = v23;
        a12 = 2112;
        a13 = (uint64_t)v18;
        LOWORD(a14) = 2112;
        *(void *)((char *)&a14 + 2) = v24;
        _os_log_error_impl(&dword_1BECCB000, v19, OS_LOG_TYPE_ERROR, "Caught exception during %@ for plugin %@: %@, %@", (uint8_t *)&a9, 0x2Au);
      }
      if (v14)
      {
        ErrorFromException(v18);
        *BOOL v14 = (id)objc_claimAutoreleasedReturnValue();
      }

      objc_end_catch();
    }
    else
    {
      id v20 = +[DESLogging coreChannel];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(v15);
        id v25 = (id)objc_claimAutoreleasedReturnValue();
        id v26 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        uint64_t v27 = [v26 bundleIdentifier];
        LODWORD(a9) = 138412546;
        *(void *)((char *)&a9 + 4) = v25;
        WORD6(a9) = 2112;
        *(void *)((char *)&a9 + 14) = v27;
        _os_log_error_impl(&dword_1BECCB000, v20, OS_LOG_TYPE_ERROR, "Caught non-ObjC exception during %@ for plugin %@", (uint8_t *)&a9, 0x16u);
      }
      if (v14)
      {
        ErrorFromException(0);
        *BOOL v14 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_end_catch();
    }
    JUMPOUT(0x1BECEE038);
  }
  _Unwind_Resume(exception_object);
}

void sub_1BECEE3B0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, long long a9, int a10, __int16 a11, __int16 a12, uint64_t a13, long long a14)
{
  if (a2)
  {
    id v17 = objc_begin_catch(exception_object);
    if (a2 == 2)
    {
      id v18 = v17;
      id v19 = +[DESLogging coreChannel];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(v15);
        id v21 = (id)objc_claimAutoreleasedReturnValue();
        char v22 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        id v23 = [v22 bundleIdentifier];
        id v24 = [v18 callStackSymbols];
        LODWORD(a9) = 138413058;
        *(void *)((char *)&a9 + 4) = v21;
        WORD6(a9) = 2112;
        *(void *)((char *)&a9 + 14) = v23;
        a12 = 2112;
        a13 = (uint64_t)v18;
        LOWORD(a14) = 2112;
        *(void *)((char *)&a14 + 2) = v24;
        _os_log_error_impl(&dword_1BECCB000, v19, OS_LOG_TYPE_ERROR, "Caught exception during %@ for plugin %@: %@, %@", (uint8_t *)&a9, 0x2Au);
      }
      if (v14)
      {
        ErrorFromException(v18);
        *BOOL v14 = (id)objc_claimAutoreleasedReturnValue();
      }

      objc_end_catch();
    }
    else
    {
      id v20 = +[DESLogging coreChannel];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(v15);
        id v25 = (id)objc_claimAutoreleasedReturnValue();
        id v26 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        uint64_t v27 = [v26 bundleIdentifier];
        LODWORD(a9) = 138412546;
        *(void *)((char *)&a9 + 4) = v25;
        WORD6(a9) = 2112;
        *(void *)((char *)&a9 + 14) = v27;
        _os_log_error_impl(&dword_1BECCB000, v20, OS_LOG_TYPE_ERROR, "Caught non-ObjC exception during %@ for plugin %@", (uint8_t *)&a9, 0x16u);
      }
      if (v14)
      {
        ErrorFromException(0);
        *BOOL v14 = (id)objc_claimAutoreleasedReturnValue();
      }
      objc_end_catch();
    }
    JUMPOUT(0x1BECEE358);
  }
  _Unwind_Resume(exception_object);
}

void sub_1BECEE688(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, long long a9, int a10, __int16 a11, __int16 a12, uint64_t a13, long long a14)
{
  if (a2)
  {
    id v17 = objc_begin_catch(exception_object);
    if (a2 == 2)
    {
      id v18 = v17;
      id v19 = +[DESLogging coreChannel];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(v15);
        id v23 = (id)objc_claimAutoreleasedReturnValue();
        id v24 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        id v25 = [v24 bundleIdentifier];
        id v26 = [v18 callStackSymbols];
        LODWORD(a9) = 138413058;
        *(void *)((char *)&a9 + 4) = v23;
        WORD6(a9) = 2112;
        *(void *)((char *)&a9 + 14) = v25;
        a12 = 2112;
        a13 = (uint64_t)v18;
        LOWORD(a14) = 2112;
        *(void *)((char *)&a14 + 2) = v26;
        _os_log_error_impl(&dword_1BECCB000, v19, OS_LOG_TYPE_ERROR, "Caught exception during %@ for plugin %@: %@, %@", (uint8_t *)&a9, 0x2Au);
      }
      id v20 = ErrorFromException(v18);
      [v14 completeWithError:v20 completionHandler:&__block_literal_global_8];

      objc_end_catch();
    }
    else
    {
      id v21 = +[DESLogging coreChannel];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(v15);
        id v27 = (id)objc_claimAutoreleasedReturnValue();
        unint64_t v28 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        id v29 = [v28 bundleIdentifier];
        LODWORD(a9) = 138412546;
        *(void *)((char *)&a9 + 4) = v27;
        WORD6(a9) = 2112;
        *(void *)((char *)&a9 + 14) = v29;
        _os_log_error_impl(&dword_1BECCB000, v21, OS_LOG_TYPE_ERROR, "Caught non-ObjC exception during %@ for plugin %@", (uint8_t *)&a9, 0x16u);
      }
      char v22 = ErrorFromException(0);
      [v14 completeWithError:v22 completionHandler:&__block_literal_global_4_0];

      objc_end_catch();
    }
    JUMPOUT(0x1BECEE64CLL);
  }
  _Unwind_Resume(exception_object);
}

BOOL DESDataTransportReadFrom(id *a1, uint64_t a2)
{
  double v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  long double v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    while (1)
    {
      if (*(unsigned char *)(a2 + *v5)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        if (v9++ >= 9)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
      unint64_t v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        id v18 = objc_alloc_init(DESBfloat16Transport);
        objc_storeStrong(a1 + 1, v18);
        if (!PBReaderPlaceMark() || (DESBfloat16TransportReadFrom((uint64_t)v18, a2) & 1) == 0)
        {
LABEL_34:

          return 0;
        }
        goto LABEL_29;
      }
      if (v17 == 2) {
        break;
      }
      if (v17 == 1)
      {
        id v18 = objc_alloc_init(DESBinary64Transport);
        objc_storeStrong(a1 + 3, v18);
        if (!PBReaderPlaceMark() || (DESBinary64TransportReadFrom((uint64_t)v18, a2) & 1) == 0) {
          goto LABEL_34;
        }
LABEL_29:
        PBReaderRecallMark();

        goto LABEL_31;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_31:
      if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
        return *(unsigned char *)(a2 + *v5) == 0;
      }
    }
    id v18 = objc_alloc_init(DESBinary32Transport);
    objc_storeStrong(a1 + 2, v18);
    if (!PBReaderPlaceMark() || (DESBinary32TransportReadFrom((uint64_t)v18, a2) & 1) == 0) {
      goto LABEL_34;
    }
    goto LABEL_29;
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void DESShouldAlwaysParticipate_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138412290;
  uint64_t v2 = @"ShouldAlwaysParticipate";
  _os_log_debug_impl(&dword_1BECCB000, log, OS_LOG_TYPE_DEBUG, "Detected override preference key: %@", (uint8_t *)&v1, 0xCu);
}

void DESLogAndReturnSunsetError_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138477827;
  uint64_t v2 = @"DodML is already sunset. Pls refer to #help-pfl for more details";
  _os_log_error_impl(&dword_1BECCB000, log, OS_LOG_TYPE_ERROR, "%{private}@", (uint8_t *)&v1, 0xCu);
}

void DeleteFileWithBasePath_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_1BECCB000, v0, OS_LOG_TYPE_DEBUG, "Garbage collected old DES record file %@", v1, 0xCu);
}

void DeleteFileWithBasePath_cold_2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_3_0(&dword_1BECCB000, v0, v1, "Could not garbage collect old DES record file %@: %@");
}

void DESSubmissionLogGarbageCollect_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BECCB000, a2, OS_LOG_TYPE_ERROR, "Couldn't read DES submission logs: %@", (uint8_t *)&v2, 0xCu);
}

void DESWriteSubmissionLogData_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1BECCB000, a2, OS_LOG_TYPE_ERROR, "Failed to write submission log data to file: %@", (uint8_t *)&v2, 0xCu);
}

void DESWriteSubmissionLogData_cold_2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1BECCB000, log, OS_LOG_TYPE_ERROR, "Failed to create submission logs directory: %@. Error: %@", (uint8_t *)&v3, 0x16u);
}

void __DESLoggingGetCoreChannel_block_invoke_cold_1()
{
  *(_WORD *)uint64_t v0 = 0;
  _os_log_error_impl(&dword_1BECCB000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Couldn't create os_log_t coreChannel", v0, 2u);
}

void __getFedStatsDataEncoderClass_block_invoke_cold_1(void *a1)
{
  int v2 = [MEMORY[0x1E4F28B00] currentHandler];
  int v3 = [NSString stringWithUTF8String:"void *PrivateFederatedLearningLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"DESFedStatsRecorder.m", 21, @"%s", *a1);

  __break(1u);
}

void __getFedStatsDataEncoderClass_block_invoke_cold_2()
{
  uint64_t v0 = [MEMORY[0x1E4F28B00] currentHandler];
  os_log_t v1 = [NSString stringWithUTF8String:"Class getFedStatsDataEncoderClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"DESFedStatsRecorder.m", 22, @"Unable to find class %s", "FedStatsDataEncoder");

  __break(1u);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1F40D7420]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGGetProductType()
{
  return MEMORY[0x1F417CE18]();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E72C8]();
}

uint64_t PBDataWriterPlaceMark()
{
  return MEMORY[0x1F4147180]();
}

uint64_t PBDataWriterRecallMark()
{
  return MEMORY[0x1F4147188]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x1F41471B0]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x1F41471C0]();
}

uint64_t PBDataWriterWriteFloatField()
{
  return MEMORY[0x1F41471D8]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x1F41471E0]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x1F4147220]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x1F4147230]();
}

uint64_t PBDataWriterWriteUint32Field()
{
  return MEMORY[0x1F4147240]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x1F4147268]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x1F4147278]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x1F4147280]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x1F41472A0]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x1F41472A8]();
}

uint64_t PBRepeatedDoubleAdd()
{
  return MEMORY[0x1F41472F0]();
}

uint64_t PBRepeatedDoubleClear()
{
  return MEMORY[0x1F41472F8]();
}

uint64_t PBRepeatedDoubleCopy()
{
  return MEMORY[0x1F4147300]();
}

uint64_t PBRepeatedDoubleHash()
{
  return MEMORY[0x1F4147308]();
}

uint64_t PBRepeatedDoubleIsEqual()
{
  return MEMORY[0x1F4147310]();
}

uint64_t PBRepeatedDoubleNSArray()
{
  return MEMORY[0x1F4147318]();
}

uint64_t PBRepeatedFloatAdd()
{
  return MEMORY[0x1F4147328]();
}

uint64_t PBRepeatedFloatClear()
{
  return MEMORY[0x1F4147330]();
}

uint64_t PBRepeatedFloatCopy()
{
  return MEMORY[0x1F4147338]();
}

uint64_t PBRepeatedFloatHash()
{
  return MEMORY[0x1F4147340]();
}

uint64_t PBRepeatedFloatIsEqual()
{
  return MEMORY[0x1F4147348]();
}

uint64_t PBRepeatedFloatNSArray()
{
  return MEMORY[0x1F4147350]();
}

OSStatus SecCertificateCopyCommonName(SecCertificateRef certificate, CFStringRef *commonName)
{
  return MEMORY[0x1F40F6AB8](certificate, commonName);
}

SecKeyRef SecCertificateCopyKey(SecCertificateRef certificate)
{
  return (SecKeyRef)MEMORY[0x1F40F6B10](certificate);
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x1F40F6B80](allocator, data);
}

CFStringRef SecCopyErrorMessageString(OSStatus status, void *reserved)
{
  return (CFStringRef)MEMORY[0x1F40F6D68](*(void *)&status, reserved);
}

Boolean SecKeyIsAlgorithmSupported(SecKeyRef key, SecKeyOperationType operation, SecKeyAlgorithm algorithm)
{
  return MEMORY[0x1F40F6F60](key, operation, algorithm);
}

Boolean SecKeyVerifySignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef signedData, CFDataRef signature, CFErrorRef *error)
{
  return MEMORY[0x1F40F6F80](key, algorithm, signedData, signature, error);
}

uint64_t SecPolicyCreateApplePinned()
{
  return MEMORY[0x1F40F7028]();
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return MEMORY[0x1F40F71E0](certificates, policies, trust);
}

BOOL SecTrustEvaluateWithError(SecTrustRef trust, CFErrorRef *error)
{
  return MEMORY[0x1F40F7210](trust, error);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void std::exception::~exception(std::exception *this)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1F417EF30](thrown_size);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1F40CA3C0](*(void *)&__upper_bound);
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

long double erfc(long double __x)
{
  MEMORY[0x1F40CBF58](__x);
  return result;
}

long double exp(long double __x)
{
  MEMORY[0x1F40CBFE0](__x);
  return result;
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x1F40CC1A0](__x, __y);
  return result;
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1F40CC2B8](*(void *)&a1, a2);
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1F40CCE40](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1F40CCE88](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

void objc_exception_throw(id exception)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1F40CD558](log);
}

long double pow(long double __x, long double __y)
{
  MEMORY[0x1F40CD818](__x, __y);
  return result;
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1F40CDDF8]();
}

uint64_t sandbox_extension_issue_file_to_process()
{
  return MEMORY[0x1F40CDE08]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1F40CDE50]();
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1F40CE3D0](a1, a2, a3, a4, a5);
}