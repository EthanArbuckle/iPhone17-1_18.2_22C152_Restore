uint64_t DiagnosticLogSubmissionEnabled()
{
  return checkMCFeature("MCFeatureDiagnosticsSubmissionAllowed", &DiagnosticLogSubmissionEnabled_featureDiagnosticsSubmissionAllowed);
}

uint64_t checkMCFeature(const char *a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1B3E6FDA0]();
  if (!checkMCFeature_dylib_handle)
  {
    checkMCFeature_dylib_handle = (uint64_t)dlopen("/System/Library/PrivateFrameworks/ManagedConfiguration.framework/ManagedConfiguration", 4);
    if (!checkMCFeature_dylib_handle)
    {
      if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_15;
      }
      int v9 = 136446210;
      v10 = dlerror();
      v6 = MEMORY[0x1E4F14500];
      v7 = "Unable to load ManagedConfiguration dylib ('%{public}s')";
      goto LABEL_14;
    }
  }
  if (!checkMCFeature_profileConnectionObj)
  {
    checkMCFeature_profileConnectionObj = (uint64_t)objc_getClass("MCProfileConnection");
    if (!checkMCFeature_profileConnectionObj && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_1AE71D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Unable to find class MCProfileConnection", (uint8_t *)&v9, 2u);
    }
  }
  if (!*a2)
  {
    v5 = dlsym((void *)checkMCFeature_dylib_handle, a1);
    if (v5)
    {
      *a2 = *v5;
      goto LABEL_15;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136446210;
      v10 = (char *)a1;
      v6 = MEMORY[0x1E4F14500];
      v7 = "Unable to load symbol %{public}s";
LABEL_14:
      _os_log_impl(&dword_1AE71D000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v9, 0xCu);
    }
  }
LABEL_15:
  uint64_t result = checkMCFeature_profileConnectionObj;
  if (checkMCFeature_profileConnectionObj) {
    return *a2
  }
        && objc_msgSend((id)objc_msgSend((id)checkMCFeature_profileConnectionObj, "sharedConnection"), "effectiveBoolValueForSetting:", *a2) == 1;
  return result;
}

uint64_t OSAPreferencesSetValue(void *a1, void *a2, void *a3)
{
  v5 = a1;
  id v6 = a2;
  v7 = a3;
  v8 = [MEMORY[0x1E4F83948] sharedInstance];
  char v9 = [v8 multiUserMode];

  if (v9)
  {
    v10 = _preferencesForDomain(v7);
    uint64_t v11 = v10;
    if (v6)
    {
      if (!v10)
      {
        uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
      }
      [v11 setObject:v6 forKeyedSubscript:v5];
      if (v11) {
        goto LABEL_6;
      }
    }
    else
    {
      [v10 removeObjectForKey:v5];
      if (v11)
      {
LABEL_6:
        uint64_t v12 = _savePreferencesForDomain(v11, v7);
LABEL_10:

        goto LABEL_11;
      }
    }
    uint64_t v12 = 0;
    goto LABEL_10;
  }
  CFPreferencesSetValue(v5, v6, v7, @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3E0]);
  uint64_t v12 = 1;
LABEL_11:

  return v12;
}

id _preferencesForDomain(void *a1)
{
  id v1 = a1;
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  v8 = __Block_byref_object_copy_;
  char v9 = __Block_byref_object_dispose_;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = ___preferencesForDomain_block_invoke;
  v4[3] = &unk_1E5F05300;
  v4[4] = &v5;
  _performOnFileBackingDomain((uint64_t)v1, v4);
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void sub_1AE71F478(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _savePreferencesForDomain(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = ___savePreferencesForDomain_block_invoke;
  v8[3] = &unk_1E5F05350;
  id v10 = &v11;
  id v5 = v3;
  id v9 = v5;
  _performOnFileBackingDomain((uint64_t)v4, v8);
  uint64_t v6 = *((unsigned __int8 *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return v6;
}

void sub_1AE71F570(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

CFIndex OSAPreferencesGetIntegerValue(void *a1, void *a2, Boolean *a3)
{
  id v5 = a1;
  uint64_t v6 = (void *)MEMORY[0x1E4F83948];
  uint64_t v7 = a2;
  v8 = [v6 sharedInstance];
  LOBYTE(v6) = [v8 multiUserMode];

  if (v6)
  {
    if (a3) {
      *a3 = 0;
    }
    id v9 = _preferencesForDomain(v7);

    if (v9)
    {
      id v10 = [v9 objectForKeyedSubscript:v5];
      if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        if (a3) {
          *a3 = 1;
        }
        CFIndex AppIntegerValue = [v10 integerValue];
      }
      else
      {
        CFIndex AppIntegerValue = 0;
      }
    }
    else
    {
      CFIndex AppIntegerValue = 0;
    }
  }
  else
  {
    CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(v5, v7, a3);
    id v9 = v7;
  }

  return AppIntegerValue;
}

uint64_t OSAPreferencesGetBoolValue(void *a1, void *a2, Boolean *a3)
{
  id v5 = a1;
  uint64_t v6 = (void *)MEMORY[0x1E4F83948];
  uint64_t v7 = a2;
  v8 = [v6 sharedInstance];
  LOBYTE(v6) = [v8 multiUserMode];

  if (v6)
  {
    if (a3) {
      *a3 = 0;
    }
    id v9 = _preferencesForDomain(v7);

    if (v9)
    {
      id v10 = [v9 objectForKeyedSubscript:v5];
      if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        if (a3) {
          *a3 = 1;
        }
        uint64_t v11 = [v10 BOOLValue];
      }
      else
      {
        uint64_t v11 = 0;
      }
    }
    else
    {
      uint64_t v11 = 0;
    }
  }
  else
  {
    int AppBooleanValue = CFPreferencesGetAppBooleanValue(v5, v7, a3);

    uint64_t v11 = AppBooleanValue != 0;
  }

  return v11;
}

id OSAPreferencesGetValue(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = (void *)MEMORY[0x1E4F83948];
  id v5 = a2;
  uint64_t v6 = [v4 sharedInstance];
  char v7 = [v6 multiUserMode];

  if (v7)
  {
    _preferencesForDomain(v5);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

    id v9 = [(__CFString *)v8 objectForKeyedSubscript:v3];
    id v5 = v8;
  }
  else
  {
    id v9 = (void *)CFPreferencesCopyValue(v3, v5, @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3E0]);
  }

  return v9;
}

BOOL OSAPreferencesSynchronize(void *a1)
{
  id v1 = a1;
  id v2 = [MEMORY[0x1E4F83948] sharedInstance];
  char v3 = [v2 multiUserMode];

  BOOL v4 = (v3 & 1) != 0 || CFPreferencesSynchronize(v1, @"mobile", (CFStringRef)*MEMORY[0x1E4F1D3E0]) != 0;
  return v4;
}

id OSAGetDATaskingValue(void *a1)
{
  return OSAPreferencesGetValue(a1, @"com.apple.da");
}

uint64_t OSASetDATaskingValue(void *a1, void *a2)
{
  return OSAPreferencesSetValue(a1, a2, @"com.apple.da");
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

void _performOnFileBackingDomain(uint64_t a1, void *a2)
{
  v10[2] = *MEMORY[0x1E4F143B8];
  char v3 = a2;
  BOOL v4 = [NSString stringWithFormat:@"%@.plist", a1];
  if (v4)
  {
    id v5 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v6 = [MEMORY[0x1E4F83948] sharedInstance];
    char v7 = [v6 pathPreferences];
    v10[0] = v7;
    v10[1] = v4;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
    id v9 = [v5 fileURLWithPathComponents:v8];

    if (v9) {
      v3[2](v3, v9);
    }
  }
}

uint64_t ___preferencesForDomain_block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [MEMORY[0x1E4F1CA60] dictionaryWithContentsOfURL:a2];

  return MEMORY[0x1F41817F8]();
}

void ___savePreferencesForDomain_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = [v3 path];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = ___savePreferencesForDomain_block_invoke_2;
  v9[3] = &unk_1E5F05328;
  id v10 = v3;
  id v11 = v4;
  long long v8 = *(_OWORD *)(a1 + 32);
  id v5 = (id)v8;
  long long v12 = v8;
  id v6 = v4;
  id v7 = v3;
  ___savePreferencesForDomain_block_invoke_2((uint64_t)v9);
}

uint64_t ___savePreferencesForDomain_block_invoke_2(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if (([*(id *)(a1 + 32) checkResourceIsReachableAndReturnError:0] & 1) == 0)
  {
    id v2 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v6 = *MEMORY[0x1E4F28330];
    v7[0] = &unk_1F0629FE0;
    BOOL v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
    [v2 createFileAtPath:v3 contents:0 attributes:v4];
  }
  uint64_t result = [*(id *)(a1 + 48) writeToURL:*(void *)(a1 + 32) atomically:1];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  return result;
}

uint64_t _createDirectoryIfNeeded(void *a1, char a2, uint64_t *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  if ([v5 checkResourceIsReachableAndReturnError:a3])
  {
    uint64_t v6 = 1;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *a3;
      *(_DWORD *)buf = 138412546;
      id v24 = v5;
      __int16 v25 = 2112;
      uint64_t v26 = v7;
      _os_log_impl(&dword_1AE71D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%@ doesn't exist - %@. Creating it.", buf, 0x16u);
    }
    if (a2)
    {
      uint64_t v8 = *MEMORY[0x1E4F28370];
      uint64_t v19 = *MEMORY[0x1E4F28330];
      uint64_t v20 = v8;
      uint64_t v9 = *MEMORY[0x1E4F28378];
      v21 = &unk_1F0629FF8;
      uint64_t v22 = v9;
      id v10 = (void *)MEMORY[0x1E4F1C9E8];
      id v11 = &v21;
      long long v12 = &v19;
      uint64_t v13 = 2;
    }
    else
    {
      uint64_t v17 = *MEMORY[0x1E4F28330];
      v18 = &unk_1F0629FF8;
      id v10 = (void *)MEMORY[0x1E4F1C9E8];
      id v11 = &v18;
      long long v12 = &v17;
      uint64_t v13 = 1;
    }
    char v14 = objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v11, v12, v13, v17, v18, v19, v20, v21, v22);
    v15 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v6 = [v15 createDirectoryAtURL:v5 withIntermediateDirectories:1 attributes:v14 error:a3];
  }
  return v6;
}

id LogsContainerLocation()
{
  if (LogsContainerLocation_onceToken != -1) {
    dispatch_once(&LogsContainerLocation_onceToken, &__block_literal_global);
  }
  v0 = (void *)LogsContainerLocation_sLogsContainerLocation;

  return v0;
}

void __LogsContainerLocation_block_invoke()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = container_system_group_path_for_identifier();
  if (v0)
  {
    id v1 = (void *)v0;
    uint64_t v2 = [MEMORY[0x1E4F1CB10] fileURLWithFileSystemRepresentation:v0 isDirectory:1 relativeToURL:0];
    uint64_t v3 = (void *)LogsContainerLocation_sLogsContainerLocation;
    LogsContainerLocation_sLogsContainerLocation = v2;

    free(v1);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v7 = 1;
      _os_log_impl(&dword_1AE71D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Error getting system group container: %llu", buf, 0xCu);
    }
    uint64_t v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/var/mobile/Library/Logs/CrashReporter" isDirectory:1];
    id v5 = (void *)LogsContainerLocation_sLogsContainerLocation;
    LogsContainerLocation_sLogsContainerLocation = v4;
  }
}

id OSACreateTempSubmittableLog(void *a1, void *a2, void *a3, void *a4)
{
  v23[3] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  if (v8)
  {
    uint64_t v9 = v8;
    id v10 = a3;
    id v11 = a1;
    long long v12 = (void *)[v9 mutableCopy];
    uint64_t v13 = MEMORY[0x1E4F1CC38];
    [v12 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F839D0]];
    char v14 = [v7 path];
    [v12 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F83A00]];

    [v12 setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F839E8]];
  }
  else
  {
    uint64_t v15 = *MEMORY[0x1E4F83A00];
    v22[0] = *MEMORY[0x1E4F839D0];
    v22[1] = v15;
    v23[0] = MEMORY[0x1E4F1CC38];
    v23[1] = v7;
    v22[2] = *MEMORY[0x1E4F839E8];
    v23[2] = MEMORY[0x1E4F1CC38];
    v16 = (void *)MEMORY[0x1E4F1C9E8];
    id v17 = a3;
    id v18 = a1;
    long long v12 = [v16 dictionaryWithObjects:v23 forKeys:v22 count:3];
  }
  uint64_t v19 = [MEMORY[0x1E4F83930] createForSubmission:a1 metadata:a3 options:v12 error:0 writing:0];

  uint64_t v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28CB0]), "initWithFileDescriptor:", fileno((FILE *)objc_msgSend(v19, "stream")));

  return v20;
}

BOOL OSAWriteLogForSubmission(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v9 = a1;
  id v10 = a2;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if ([v10 length])
  {
    if (v12)
    {
      char v14 = (void *)[v12 mutableCopy];
      [v14 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F839F8]];

      id v12 = v14;
    }
    else
    {
      uint64_t v18 = *MEMORY[0x1E4F839F8];
      v19[0] = v10;
      id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    }
  }
  uint64_t v15 = [MEMORY[0x1E4F83930] createForSubmission:v9 metadata:v11 options:v12 error:0 writing:v13];
  BOOL v16 = v15 != 0;

  return v16;
}

BOOL OSAMoveFileForSubmissions(void *a1, void *a2, void *a3)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  if (v6)
  {
    id v7 = v6;
    id v8 = a3;
    id v9 = (void *)[v7 mutableCopy];
    id v10 = [v8 path];

    [v9 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F839E0]];
  }
  else
  {
    uint64_t v16 = *MEMORY[0x1E4F839E0];
    id v11 = a3;
    id v7 = [v11 path];

    v17[0] = v7;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
  }

  uint64_t v15 = 0;
  id v12 = (id)[MEMORY[0x1E4F83930] createForSubmission:v5 metadata:0 options:v9 error:&v15 writing:0];
  BOOL v13 = v15 == 0;

  return v13;
}

uint64_t OSAMoveFileForSyncing()
{
  return 0;
}

void OSAIterateSubmittableLogsWithBlock(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = (void *)MEMORY[0x1B3E6FDA0]();
  if (v3) {
    uint64_t v6 = [v3 mutableCopy];
  }
  else {
    uint64_t v6 = objc_opt_new();
  }
  id v7 = (void *)v6;
  uint64_t v8 = *MEMORY[0x1E4F83A08];
  id v9 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F83A08]];

  if (!v9) {
    [v7 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v8];
  }
  id v10 = (void *)MEMORY[0x1E4F83930];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __OSAIterateSubmittableLogsWithBlock_block_invoke;
  v12[3] = &unk_1E5F05468;
  id v13 = &unk_1F062A058;
  id v11 = v4;
  id v14 = v11;
  [v10 iterateLogsWithOptions:v7 usingBlock:v12];
}

void __OSAIterateSubmittableLogsWithBlock_block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [v6 pathExtension];
  if ([v3 isEqualToString:@"synced"])
  {
    id v4 = [v6 URLByDeletingPathExtension];
    uint64_t v5 = [v4 pathExtension];

    id v3 = (void *)v5;
  }
  if ([*(id *)(a1 + 32) containsObject:v3]) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

id OSAGetSubmittableLogs(void *a1)
{
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1) {
    id v3 = (void *)[v1 mutableCopy];
  }
  else {
    id v3 = objc_opt_new();
  }
  id v4 = v3;
  uint64_t v5 = *MEMORY[0x1E4F839D8];
  id v6 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F839D8]];

  if (!v6) {
    [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v5];
  }
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __OSAGetSubmittableLogs_block_invoke;
  v13[3] = &unk_1E5F05490;
  id v14 = v4;
  id v8 = v7;
  id v15 = v8;
  id v9 = v4;
  OSAIterateSubmittableLogsWithBlock(v9, v13);
  id v10 = v15;
  id v11 = v8;

  return v11;
}

void __OSAGetSubmittableLogs_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (const char *)[v3 fileSystemRepresentation];
  if (getxattr(v4, "DoNotSubmit", 0, 0, 0, 0) >= 1
    && ([*(id *)(a1 + 32) objectForKeyedSubscript:*MEMORY[0x1E4F839D8]],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 BOOLValue],
        v5,
        v6))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      int v7 = 136315138;
      id v8 = v4;
      _os_log_impl(&dword_1AE71D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Skipping DoNotSubmit tagged report at %s", (uint8_t *)&v7, 0xCu);
    }
  }
  else
  {
    [*(id *)(a1 + 40) addObject:v3];
  }
}

id OSASubmittableLogs()
{
  v4[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F839D8];
  v4[0] = MEMORY[0x1E4F1CC28];
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v4 forKeys:&v3 count:1];
  id v1 = OSAGetSubmittableLogs(v0);

  return v1;
}

uint64_t OSAGetSyncableLogs()
{
  return 0;
}

id OSAOSVersion()
{
  uint64_t v0 = [MEMORY[0x1E4F83948] sharedInstance];
  id v1 = [v0 productNameVersionBuildString];

  return v1;
}

id OSAProductName()
{
  uint64_t v0 = [MEMORY[0x1E4F83948] sharedInstance];
  id v1 = [v0 productName];

  return v1;
}

uint64_t OSAInMultiUserMode()
{
  uint64_t v0 = [MEMORY[0x1E4F83948] sharedInstance];
  uint64_t v1 = [v0 multiUserMode];

  return v1;
}

uint64_t OSAContainerOTALoggingLibraryLocation()
{
  return 0;
}

id OSACreateRelPathInContainer(void *a1, int a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = v3;
  if (a2)
  {
    id v5 = [v3 stringByDeletingLastPathComponent];
    int v6 = [v4 lastPathComponent];
  }
  else
  {
    id v5 = v3;
    int v6 = 0;
  }
  int v7 = [MEMORY[0x1E4F83948] sharedInstance];
  if ([v7 multiUserMode]) {
    LogsContainerLocation();
  }
  else {
  id v8 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/var/mobile" isDirectory:1];
  }

  uint64_t v9 = [v8 URLByAppendingPathComponent:v5 isDirectory:1];
  id v10 = v9;
  if (v9)
  {
    id v26 = 0;
    int DirectoryIfNeeded = _createDirectoryIfNeeded(v9, 1, (uint64_t *)&v26);
    id v12 = v26;
    id v13 = v12;
    if (DirectoryIfNeeded)
    {
      if (v6)
      {
        id v14 = [v10 URLByAppendingPathComponent:v6];
        id v15 = [v14 path];
        id v25 = v13;
        char v16 = [v14 checkResourceIsReachableAndReturnError:&v25];
        id v17 = v25;

        if ((v16 & 1) == 0)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v30 = v14;
            __int16 v31 = 2112;
            id v32 = v17;
            _os_log_impl(&dword_1AE71D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%@ doesn't exist - %@. Creating it.", buf, 0x16u);
          }
          v23 = [MEMORY[0x1E4F28CB8] defaultManager];
          id v24 = [v14 path];
          uint64_t v18 = *MEMORY[0x1E4F28370];
          v27[0] = *MEMORY[0x1E4F28330];
          v27[1] = v18;
          uint64_t v19 = *MEMORY[0x1E4F28378];
          v28[0] = &unk_1F062A010;
          v28[1] = v19;
          uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];
          char v22 = [v23 createFileAtPath:v24 contents:0 attributes:v20];

          if ((v22 & 1) == 0)
          {

            id v15 = 0;
          }
        }
      }
      else
      {
        id v15 = [v10 path];
        id v17 = v13;
      }
      goto LABEL_21;
    }
    id v17 = v12;
  }
  else
  {
    id v17 = 0;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v30 = v10;
    __int16 v31 = 2112;
    id v32 = v17;
    _os_log_impl(&dword_1AE71D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Couldn't create directory %@. Error: %@", buf, 0x16u);
  }
  id v15 = 0;
LABEL_21:

  return v15;
}

uint64_t CRIsAppleInternal()
{
  return MGGetBoolAnswer();
}

void logForAppleCare(void *a1, double a2)
{
  id v4 = (void *)MEMORY[0x1B3E6FDA0]();
  if ([a1 count])
  {
    initR3();
    int v5 = openR3((uint64_t)&initR3_r3, objc_msgSend((id)qword_1E9A82B08, "containsObject:", objc_msgSend(a1, "objectAtIndexedSubscript:", 0)), a2);
    if ((v5 & 0x80000000) == 0)
    {
      int v6 = (void *)[(id)objc_msgSend(NSString stringWithFormat:@"%@,%@\n", OSADateFormat(), objc_msgSend(a1, "componentsJoinedByString:", @",", "dataUsingEncoding:allowLossyConversion:", 4, 1];
      if (v6)
      {
        write(v5, (const void *)[v6 bytes], objc_msgSend(v6, "length"));
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
          logForAppleCare_cold_1(a1);
        }
      }
    }
    close(v5);
  }
}

void initR3()
{
  initR3_r3 = (int)time(0) / 86400;
  if (initR3_onceToken != -1)
  {
    dispatch_once(&initR3_onceToken, &__block_literal_global_0);
  }
}

uint64_t openR3(uint64_t a1, int a2, double a3)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = *(void **)(a1 + 16);
  if (v4)
  {
    int v7 = (const std::__fs::filesystem::path *)objc_msgSend((id)objc_msgSend(v4, "stringByAppendingPathComponent:", @"general.log"), "fileSystemRepresentation");
    memset(&v39, 0, sizeof(v39));
    mode_t v8 = umask(0);
    if (lstat((const char *)v7, &v39) < 0)
    {
      if (*__error() != 2) {
        goto LABEL_30;
      }
      uint64_t v14 = a1;
      id v15 = (char *)v7;
      double v16 = a3;
      double v17 = a3;
    }
    else
    {
      uint64_t R3 = 0xFFFFFFFFLL;
      if ((v39.st_mode & 0xF000) != 0x8000 || v39.st_nlink != 1 || v39.st_uid != *(_DWORD *)(a1 + 4)) {
        goto LABEL_31;
      }
      int v10 = v39.st_uid ? 384 : 420;
      if ((v39.st_mode & 0xFFF) != v10) {
        goto LABEL_31;
      }
      uint64_t v11 = open((const char *)v7, 42);
      uint64_t R3 = v11;
      if ((v11 & 0x80000000) != 0)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          int v26 = *__error();
          uint64_t v27 = __error();
          v28 = strerror(*v27);
          v43.st_dev = 67109634;
          *(_DWORD *)&v43.st_mode = v26;
          LOWORD(v43.st_ino) = 2080;
          *(__darwin_ino64_t *)((char *)&v43.st_ino + 2) = (__darwin_ino64_t)v7;
          HIWORD(v43.st_uid) = 2080;
          *(void *)&v43.st_gid = v28;
          _os_log_impl(&dword_1AE71D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "AppleCareSupport: ERROR[%d] opening %s, %s", (uint8_t *)&v43, 0x1Cu);
        }
        goto LABEL_31;
      }
      memset(&v43, 0, sizeof(v43));
      if (fstat(v11, &v43)
        && v43.st_nlink == v39.st_nlink
        && v43.st_uid == v39.st_uid
        && v43.st_mode == v39.st_mode
        && v43.st_ino == v39.st_ino
        && v43.st_dev == v39.st_dev)
      {
        goto LABEL_25;
      }
      value[0] = *(_OWORD *)"<legacy>";
      memset(&value[1], 0, 48);
      unsigned int v38 = 0;
      double v36 = a3;
      double v37 = a3;
      ssize_t v12 = fgetxattr(R3, "Version", value, 0x3FuLL, 0, 0);
      if (v12 >= 1) {
        *((unsigned char *)value + v12) = 0;
      }
      int v13 = objc_msgSend(*(id *)(a1 + 24), "isEqualToString:", objc_msgSend(NSString, "stringWithUTF8String:", value));
      fgetxattr(R3, "Day_Seq", &v38, 4uLL, 0, 0);
      fgetxattr(R3, "Install", &v37, 8uLL, 0, 0);
      if (v13)
      {
        fgetxattr(R3, "Upgrade", &v36, 8uLL, 0, 0);
        if (v38 == *(_DWORD *)a1)
        {
          if (!a2 || v43.st_size <= 307200)
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
              openR3_cold_1((uint64_t)v7, v29, v30, v31, v32, v33, v34, v35);
            }
            goto LABEL_31;
          }
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1AE71D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "AppleCareSupport: WARN: limit exceeded, ignoring event", buf, 2u);
          }
LABEL_25:
          close(R3);
LABEL_30:
          uint64_t R3 = 0xFFFFFFFFLL;
          goto LABEL_31;
        }
      }
      close(R3);
      uint64_t v19 = (void *)[*(id *)(a1 + 16) stringByAppendingPathComponent:objc_msgSend(NSString, "stringWithFormat:", @"general-%d-%s.log", v38, value)];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v41 = v19;
        _os_log_impl(&dword_1AE71D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "AppleCareSupport: rolling log -> %@", buf, 0xCu);
      }
      uint64_t v20 = (const std::__fs::filesystem::path *)[v19 fileSystemRepresentation];
      rename(v7, v20, v21);
      if (v22)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          int v23 = *__error();
          id v24 = __error();
          id v25 = strerror(*v24);
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v41 = v23;
          *(_WORD *)&v41[4] = 2080;
          *(void *)&v41[6] = v25;
          _os_log_impl(&dword_1AE71D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "AppleCareSupport: ERROR[%d] rename failed, %s", buf, 0x12u);
        }
        unlink((const char *)v7);
      }
      double v17 = v36;
      double v16 = v37;
      uint64_t v14 = a1;
      id v15 = (char *)v7;
    }
    uint64_t R3 = createR3(v14, v15, v16, v17);
LABEL_31:
    umask(v8);
    return R3;
  }
  return 0xFFFFFFFFLL;
}

uint64_t logEventForAppleCare(void *a1)
{
  double Current = CFAbsoluteTimeGetCurrent();
  logForAppleCare(a1, Current);
  return 0;
}

void logLineForAppleCare(uint64_t a1, uint64_t a2, double a3)
{
  int v5 = (void *)[[NSString alloc] initWithUTF8String:a1];
  int v6 = (void *)[[NSString alloc] initWithUTF8String:a2];
  id v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v5, v6, 0);
  logForAppleCare(v7, a3);
}

void rollAppleCareLogs()
{
  uint64_t v0 = (void *)MEMORY[0x1B3E6FDA0]();
  initR3();
  int v5 = initR3_r3;
  long long v9 = (unint64_t)qword_1E9A82B00;
  uid_t v1 = getuid();
  uid_t v6 = v1;
  uint64_t v7 = getgid();
  mode_t v8 = @"/Library/Logs/AppleSupport/";
  double Current = CFAbsoluteTimeGetCurrent();
  int v3 = openR3((uint64_t)&initR3_r3, 0, Current);
  if ((v3 & 0x80000000) == 0) {
    close(v3);
  }
  if (!v1)
  {
    int v4 = openR3((uint64_t)&v5, 0, Current);
    if ((v4 & 0x80000000) == 0) {
      close(v4);
    }
  }
  purgeR3Logs(&initR3_r3);
  if (!v6) {
    purgeR3Logs(&v5);
  }
}

void purgeR3Logs(int *a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)*((void *)a1 + 2);
  if (v2)
  {
    int v3 = (const char *)[v2 fileSystemRepresentation];
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
      purgeR3Logs_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);
    }
    uint64_t v11 = opendir(v3);
    if (v11)
    {
      ssize_t v12 = v11;
      int v13 = readdir(v11);
      if (v13)
      {
        id v15 = v13;
        *(void *)&long long v14 = 67109634;
        long long v27 = v14;
        do
        {
          d_name = v15->d_name;
          uint64_t v17 = objc_msgSend((id)objc_msgSend(NSString, "stringWithUTF8String:", v15->d_name, v27), "rangeOfString:options:", @"general.*\\.log", 1024);
          if (v15->d_type == 8 && v17 != 0x7FFFFFFFFFFFFFFFLL)
          {
            int value = 0;
            uint64_t v19 = (const char *)objc_msgSend((id)objc_msgSend(*((id *)a1 + 2), "stringByAppendingPathComponent:", objc_msgSend(NSString, "stringWithUTF8String:", d_name)), "fileSystemRepresentation");
            getxattr(v19, "Day_Seq", &value, 4uLL, 0, 0);
            int v20 = value;
            int v21 = *a1;
            int v22 = privacyWindow;
            if (value <= *a1 - privacyWindow)
            {
              if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
              {
                int v23 = v21 - v20;
                *(_DWORD *)buf = v27;
                if (v21 - v20 >= 365) {
                  int v23 = -1;
                }
                int v30 = v22;
                __int16 v31 = 1024;
                *(_DWORD *)uint64_t v32 = v23;
                *(_WORD *)&v32[4] = 2080;
                *(void *)&v32[6] = d_name;
                _os_log_impl(&dword_1AE71D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "AppleCareSupport: purging old (limit %d vs actual %d) %s", buf, 0x18u);
              }
              unlink(v19);
            }
          }
          id v15 = readdir(v12);
        }
        while (v15);
      }
      closedir(v12);
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v24 = *__error();
      id v25 = __error();
      int v26 = strerror(*v25);
      *(_DWORD *)buf = 67109634;
      int v30 = v24;
      __int16 v31 = 2080;
      *(void *)uint64_t v32 = v3;
      *(_WORD *)&v32[8] = 2080;
      *(void *)&v32[10] = v26;
      _os_log_impl(&dword_1AE71D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "AppleCareSupport: ERROR[%d] scanning '%s', %s", buf, 0x1Cu);
    }
  }
}

uint64_t __initR3_block_invoke()
{
  uint64_t v0 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F83948], "sharedInstance"), "getPrefsKey:forDomain:withOptions:", @"R3PrivacyWindow", @"com.apple.CrashReporterSupport", 0);
  if (v0 && (uid_t v1 = v0, (int)[v0 intValue] >= 1)) {
    int v2 = [v1 intValue];
  }
  else {
    int v2 = 14;
  }
  privacyWindow = v2;
  qword_1E9A82AEC = 0;
  int v3 = getpwnam("mobile");
  if (v3)
  {
    qword_1E9A82AEC = *(void *)&v3->pw_uid;
    *(void *)&algn_1E9A82AF4[4] = (id)objc_msgSend((id)objc_msgSend(NSString, "stringWithUTF8String:", v3->pw_dir), "stringByAppendingPathComponent:", @"/Library/Logs/AppleSupport/");
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1AE71D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "AppleCareSupport: ERROR unable to intialize data", v5, 2u);
  }
  endpwent();
  qword_1E9A82B00 = MGCopyAnswer();
  uint64_t result = [objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:&unk_1F062A070];
  qword_1E9A82B08 = result;
  return result;
}

uint64_t createR3(uint64_t a1, char *a2, double a3, double a4)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  double v29 = a4;
  double value = a3;
  uint64_t v6 = 384;
  if (!*(_DWORD *)(a1 + 4)) {
    uint64_t v6 = 420;
  }
  uint64_t v7 = open_dprotected_np(a2, 2594, 4, 0, v6);
  uint64_t v8 = v7;
  if ((v7 & 0x80000000) != 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v24 = *__error();
      id v25 = __error();
      int v26 = strerror(*v25);
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)uint64_t v34 = v24;
      *(_WORD *)&v34[4] = 2080;
      *(void *)&v34[6] = a2;
      __int16 v35 = 2080;
      double v36 = v26;
      int v21 = MEMORY[0x1E4F14500];
      int v22 = "AppleCareSupport: ERROR[%d] failed to create %s, %s";
      uint32_t v23 = 28;
      goto LABEL_20;
    }
  }
  else
  {
    uid_t v9 = *(_DWORD *)(a1 + 4);
    if (v9) {
      fchown(v7, v9, *(_DWORD *)(a1 + 8));
    }
    uint64_t v10 = (const char *)[*(id *)(a1 + 24) UTF8String];
    if (!v10
      || (uint64_t v11 = v10, !*v10)
      || (size_t v12 = strlen(v10), fsetxattr(v8, "Version", v11, v12, 0, 0))
      || fsetxattr(v8, "Install", &value, 8uLL, 0, 0)
      || fsetxattr(v8, "Upgrade", &v29, 8uLL, 0, 0)
      || fsetxattr(v8, "Day_Seq", (const void *)a1, 4uLL, 0, 0))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        int v13 = *__error();
        long long v14 = __error();
        id v15 = strerror(*v14);
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)uint64_t v34 = v13;
        *(_WORD *)&v34[4] = 2080;
        *(void *)&v34[6] = a2;
        __int16 v35 = 2080;
        double v36 = v15;
        _os_log_impl(&dword_1AE71D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "AppleCareSupport: ERROR[%d] setting xattrs on %s, %s", buf, 0x1Cu);
      }
    }
    uint64_t v28 = 0;
    double v16 = (__CFString *)MGCopyAnswer();
    v31[0] = @"report";
    v31[1] = @"version";
    v32[0] = @"Device Software Diagnostic Log";
    v32[1] = &unk_1F062A028;
    v31[2] = @"os_build";
    v32[2] = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F83948], "sharedInstance"), "productNameVersionBuildString");
    v31[3] = @"model";
    uint64_t v17 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F83948], "sharedInstance"), "modelCode");
    uint64_t v18 = @"<no_sn>";
    if (v16) {
      uint64_t v18 = v16;
    }
    v32[3] = v17;
    v32[4] = v18;
    v31[4] = @"serial";
    v31[5] = @"installed";
    v32[5] = OSADateFormat();
    v31[6] = @"updated";
    v32[6] = OSADateFormat();
    uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:v31 count:7];

    int v20 = (void *)[MEMORY[0x1E4F28D90] dataWithJSONObject:v19 options:0 error:&v28];
    write(v8, (const void *)[v20 bytes], objc_msgSend(v20, "length"));
    write(v8, "\n", 1uLL);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)uint64_t v34 = a2;
      int v21 = MEMORY[0x1E4F14500];
      int v22 = "AppleCareSupport: new %s";
      uint32_t v23 = 12;
LABEL_20:
      _os_log_impl(&dword_1AE71D000, v21, OS_LOG_TYPE_DEFAULT, v22, buf, v23);
    }
  }
  return v8;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_1AE722094(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AE7221BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AE722360(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_1AE72254C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AE722B24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void ConfigureCarrierDebugging(uint64_t a1)
{
}

void ConfigureCarrierDebuggingWithPower(uint64_t a1)
{
  if (ConfigureCarrierDebuggingWithPower___CoreTelephonyHandle)
  {
    int v2 = ConfigureCarrierDebuggingWithPower_CTServerConnectionSetTracePropertyHandle;
  }
  else
  {
    int v3 = dlopen("/System/Library/Frameworks/CoreTelephony.framework/CoreTelephony", 1);
    ConfigureCarrierDebuggingWithPower___CoreTelephonyHandle = (uint64_t)v3;
    if (!v3)
    {
      NSLog(&cfstr_Crashreporters.isa);
      return;
    }
    ConfigureCarrierDebuggingWithPower_CTServerConnectionCreateHandle = dlsym(v3, "_CTServerConnectionCreate");
    int v2 = (uint64_t (*)(void))dlsym((void *)ConfigureCarrierDebuggingWithPower___CoreTelephonyHandle, "_CTServerConnectionSetTraceProperty");
    ConfigureCarrierDebuggingWithPower_CTServerConnectionSetTracePropertyHandle = v2;
  }
  if (ConfigureCarrierDebuggingWithPower_CTServerConnectionCreateHandle) {
    BOOL v4 = v2 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    NSLog(&cfstr_UnableToLocate.isa);
  }
  else
  {
    uint64_t v9 = 0;
    memset(v8, 0, sizeof(v8));
    uint64_t v5 = ((uint64_t (*)(void, uint64_t (*)(), _OWORD *))ConfigureCarrierDebuggingWithPower_CTServerConnectionCreateHandle)(*MEMORY[0x1E4F1CF80], _ServerConnectionCallBack, v8);
    if (v5)
    {
      uint64_t v6 = (const void *)v5;
      ConfigureCarrierDebuggingWithPower_CTServerConnectionSetTracePropertyHandle();
      CFRelease(v6);
    }
    OSAPreferencesSetValue(@"DisableLogObfuscation", (void *)[NSNumber numberWithBool:a1], @"com.apple.CrashReporter");
    if (a1) {
      uint64_t v7 = (void *)[NSNumber numberWithInt:0xFFFFFFFFLL];
    }
    else {
      uint64_t v7 = 0;
    }
    OSAPreferencesSetValue(@"BasebandLogLimit", v7, @"com.apple.CrashReporter");
    OSAPreferencesSynchronize(@"com.apple.CrashReporter");
  }
}

void ConfigureInternalDebugging(uint64_t a1)
{
}

void ConfigureInternalDebuggingWithPower(uint64_t a1)
{
}

void *GetThermalState()
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = (void *)[MEMORY[0x1E4F1CA48] array];
  int out_token = 0;
  if (!notify_register_check("com.apple.system.maxthermalsensorvalue", &out_token))
  {
    *(void *)state64 = 0;
    if (!notify_get_state(out_token, (uint64_t *)state64)) {
      objc_msgSend(v0, "addObject:", objc_msgSend(NSNumber, "numberWithInt:", *(unsigned int *)state64));
    }
    notify_cancel(out_token);
  }
  strcpy(state64, "com.apple.system.thermalSensorValues");
  char v12 = 0;
  __int16 v13 = 0;
  uid_t v1 = &state64[strlen(state64)];
  for (unsigned int i = 1; i != 20; ++i)
  {
    if (i >= 2) {
      sprintf(v1, "%d", i);
    }
    uint64_t v9 = 0;
    if (!notify_register_check(state64, &out_token))
    {
      notify_get_state(out_token, &v9);
      notify_cancel(out_token);
    }
    if (!v9) {
      break;
    }
    objc_msgSend(v0, "addObject:", objc_msgSend(NSNumber, "numberWithInt:", (unsigned __int16)v9));
    objc_msgSend(v0, "addObject:", objc_msgSend(NSNumber, "numberWithInt:", WORD1(v9)));
    objc_msgSend(v0, "addObject:", objc_msgSend(NSNumber, "numberWithInt:", WORD2(v9)));
    objc_msgSend(v0, "addObject:", objc_msgSend(NSNumber, "numberWithInt:", HIWORD(v9)));
  }
  int v3 = [v0 count];
  int v4 = v3;
  if (v3 <= 4) {
    int v5 = 4;
  }
  else {
    int v5 = v3;
  }
  int v6 = v5 - 3;
  if (v5 - 3 < v3)
  {
    uint64_t v7 = (v3 - 1);
    do
    {
      if (objc_msgSend((id)objc_msgSend(v0, "objectAtIndex:", v7), "intValue")) {
        break;
      }
      [v0 removeLastObject];
      --v7;
      --v4;
    }
    while (v6 < v4);
  }
  if ([v0 count]) {
    return v0;
  }
  else {
    return 0;
  }
}

uint64_t AppAnalyticsEnabled()
{
  return checkMCFeature("MCFeatureAppAnalyticsAllowed", &AppAnalyticsEnabled_featureAppAnalyticsAllowed);
}

uint64_t DiagnosticLogSubmissionPreferenceExists()
{
  return 1;
}

uint64_t setDiagnosticLogSubmission()
{
  return 0;
}

void SubmitDiagnosticLogs()
{
}

void softLinkAndSubmit(uint64_t a1)
{
  int v2 = (void *)MEMORY[0x1B3E6FDA0]();
  if (softLinkAndSubmit_onceToken != -1) {
    dispatch_once(&softLinkAndSubmit_onceToken, &__block_literal_global_144);
  }
  if (softLinkAndSubmit_submissionClientObj)
  {
    id v3 = objc_alloc_init((Class)softLinkAndSubmit_submissionClientObj);
    [v3 submitWithOptions:a1 resultsCallback:0];
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl(&dword_1AE71D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "unable to dylink OSASubmissionClient", v4, 2u);
  }
}

void SubmitDiagnosticLogsIfFavorable()
{
}

void SubmitDiagnosticLogPathsWithIdentifier(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (a3 == 4)
  {
    v4[0] = @"mode";
    v4[1] = @"logs";
    v5[0] = @"appletv-diagnostic";
    v5[1] = a1;
    void v4[2] = @"submission_info";
    v5[2] = a2;
    softLinkAndSubmit([MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:3]);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v7 = a3;
    _os_log_impl(&dword_1AE71D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Logs not submitted: unrecognized submission routing type %d.", buf, 8u);
  }
}

uint64_t GetHardwareModel()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F83948] sharedInstance];

  return [v0 modelCode];
}

__CFString *GetIncidentID()
{
  CFAllocatorRef v0 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFUUIDRef v1 = CFUUIDCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
  int v2 = (__CFString *)CFUUIDCreateString(v0, v1);
  CFRelease(v1);

  return v2;
}

uint64_t GetSystemVersion()
{
  CFAllocatorRef v0 = (void *)[MEMORY[0x1E4F83948] sharedInstance];

  return [v0 productNameVersionBuildString];
}

__CFString *GetSysIDWithDescription(int a1)
{
  memset(&v8, 0, sizeof(v8));
  if (stat("/AppleInternal/Library/PreferenceBundles/Carrier Settings.bundle", &v8)) {
    return &stru_1F06294B8;
  }
  id v3 = (__CFString *)MGCopyAnswer();
  if (v3)
  {
    int v4 = v3;
    CFTypeID v5 = CFGetTypeID(v3);
    if (v5 != CFStringGetTypeID())
    {
      CFRelease(v4);
      int v4 = @"ERROR UDID was not a string";
    }
  }
  else
  {
    int v4 = @"UDID was null";
  }
  if (a1) {
    int v6 = @"UDID:            %@\n";
  }
  else {
    int v6 = @"%@";
  }
  uint64_t v2 = objc_msgSend(NSString, "stringWithFormat:", v6, v4);
  CFRelease(v4);
  return (__CFString *)v2;
}

__CFString *GetNameForLogType(int a1)
{
  if (a1 > 183)
  {
    if (a1 == 184)
    {
      return @"GPURestart";
    }
    else if (a1 == 201)
    {
      return @"Siri";
    }
    else
    {
      return 0;
    }
  }
  else
  {
    switch(a1)
    {
      case 166:
        uint64_t result = @"KeyboardAccuracy";
        break;
      case 167:
        uint64_t result = @"TCCService";
        break;
      case 168:
        uint64_t result = @"Ultra_1";
        break;
      case 169:
      case 170:
      case 171:
      case 173:
      case 174:
      case 175:
        return 0;
      case 172:
        uint64_t result = @"ECCEvent";
        break;
      case 176:
        uint64_t result = @"FlashStatus";
        break;
      default:
        if (a1 != 156) {
          return 0;
        }
        uint64_t result = @"CoreTime";
        break;
    }
  }
  return result;
}

uint64_t GetDeviceConfig()
{
  uint64_t result = config;
  if (!config)
  {
    id v1 = [NSString alloc];
    uint64_t v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F83948], "sharedInstance"), "modelCode");
    uint64_t result = [v1 initWithFormat:@"Hardware Model: %@\nOS Version: %@\nSystem ID: %@", v2, objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F83948], "sharedInstance"), "productNameVersionBuildString"), GetSysIDWithDescription(0)];
    config = result;
  }
  return result;
}

void CRLogStructuredData(int a1, void *a2)
{
  if (a2)
  {
    if (CRLogStructuredData_onceToken != -1) {
      dispatch_once(&CRLogStructuredData_onceToken, &__block_literal_global_2);
    }
    if (CRLogStructuredData_opt_in)
    {
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      id v5 = (id)[a2 copy];
      if (initForLoggingStructuredData_once != -1) {
        dispatch_once(&initForLoggingStructuredData_once, &__block_literal_global_148);
      }
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __CRLogStructuredData_block_invoke_2;
      block[3] = &unk_1E5F056B0;
      int v7 = a1;
      *(CFAbsoluteTime *)&block[5] = Current;
      block[4] = v5;
      dispatch_async((dispatch_queue_t)dispatchQueue, block);
    }
  }
}

uint64_t __CRLogStructuredData_block_invoke()
{
  uint64_t result = checkMCFeature("MCFeatureDiagnosticsSubmissionAllowed", &DiagnosticLogSubmissionEnabled_featureDiagnosticsSubmissionAllowed);
  CRLogStructuredData_opt_in = result;
  return result;
}

void __CRLogStructuredData_block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1B3E6FDA0]();
  uint64_t v3 = *(unsigned int *)(a1 + 48);
  NameForLogType = GetNameForLogType(*(_DWORD *)(a1 + 48));
  if (NameForLogType)
  {
    id v5 = (void *)[NSString stringWithFormat:@"%@%@.log", @"/var/mobile/Library/Logs/", NameForLogType];
    CRDumpOldStructuredLog(*(unsigned int *)(a1 + 48), v5, *(double *)(a1 + 40));
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    void v7[2] = __CRLogStructuredData_block_invoke_3;
    v7[3] = &unk_1E5F05688;
    uint64_t v6 = *(void *)(a1 + 32);
    v7[4] = v5;
    v7[5] = v6;
    v7[6] = *(void *)(a1 + 40);
    __CRLogStructuredData_block_invoke_3((uint64_t)v7);
  }
  else
  {
    NSLog(&cfstr_UnrecognizedLo.isa, v3);
  }
}

uint64_t CRDumpOldStructuredLog(uint64_t a1, void *a2, double a3)
{
  uint64_t result = [a2 length];
  if (result)
  {
    uint64_t result = [a2 fileSystemRepresentation];
    if (result)
    {
      int v7 = (const char *)result;
      memset(&v9, 0, sizeof(v9));
      uint64_t result = stat((const char *)result, &v9);
      if (!result
        && v9.st_mtimespec.tv_sec / 86400 != (uint64_t)(*MEMORY[0x1E4F1CF78] + (double)(uint64_t)floor(a3)) / 86400)
      {
        stat v8 = [[StructuredDataReport alloc] initWithType:a1 withFile:a2];
        [(OSAReport *)v8 saveWithOptions:0];

        return unlink(v7);
      }
    }
  }
  return result;
}

void __CRLogStructuredData_block_invoke_3(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = fopen((const char *)[*(id *)(a1 + 32) UTF8String], "a+");
  if (v2)
  {
    __int16 v13 = v2;
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    int v4 = *(void **)(a1 + 40);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          uint64_t v10 = [*(id *)(a1 + 40) objectForKey:v9];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              [v3 addObject:objc_msgSend(NSString, "stringWithFormat:", @"%@:%@", v9, v10)];
            }
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v6);
    }
    uint64_t v11 = (void *)[MEMORY[0x1E4F28F80] processInfo];
    char v12 = (const char *)objc_msgSend((id)objc_msgSend(NSString, "stringWithFormat:", @"%@ %@[%d]: %@\n", OSADateFormat(), objc_msgSend(v11, "processName"), objc_msgSend(v11, "processIdentifier"), objc_msgSend(v3, "componentsJoinedByString:", @";")),
                          "UTF8String");
    fputs(v12, v13);
    fclose(v13);
  }
  else
  {
    NSLog(&cfstr_Crashreporters_0.isa);
  }
}

uint64_t CRDumpAllOldStructuredDataLogs()
{
  if (initForLoggingStructuredData_once != -1) {
    dispatch_once(&initForLoggingStructuredData_once, &__block_literal_global_148);
  }
  dispatch_sync((dispatch_queue_t)dispatchQueue, &__block_literal_global_119);
  double Current = CFAbsoluteTimeGetCurrent();
  for (uint64_t i = 0; i != 8; ++i)
  {
    uint64_t v2 = dword_1AE7259F0[i];
    id v3 = (void *)[NSString stringWithFormat:@"%@%@.log", @"/var/mobile/Library/Logs/", GetNameForLogType(dword_1AE7259F0[i])];
    uint64_t result = CRDumpOldStructuredLog(v2, v3, Current);
  }
  return result;
}

void *IsCarryDeviceWithHangtracerEnabled()
{
  uint64_t result = (void *)MGGetBoolAnswer();
  if (result)
  {
    uint64_t result = (void *)[MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:@"/var/mobile/Library/Preferences/.GlobalPreferences.plist"];
    if (result)
    {
      uint64_t v1 = 0;
      uint64_t result = (void *)[MEMORY[0x1E4F28F98] propertyListWithData:result options:0 format:0 error:&v1];
      if (result) {
        return objc_msgSend((id)objc_msgSend(result, "valueForKey:", @"HangTracerEnabled"), "BOOLValue");
      }
    }
  }
  return result;
}

void dlaggd_addScalarForKey(uint64_t a1, uint64_t a2)
{
  if (dlaggd_addScalarForKey_onceToken != -1) {
    dispatch_once(&dlaggd_addScalarForKey_onceToken, &__block_literal_global_132);
  }
  int v4 = (void (*)(uint64_t, uint64_t))dlaggd_addScalarForKey___ADClientAddValueForScalarKey;
  if (dlaggd_addScalarForKey___ADClientAddValueForScalarKey)
  {
    v4(a1, a2);
  }
}

void *__dlaggd_addScalarForKey_block_invoke()
{
  uint64_t result = dlopen("/System/Library/PrivateFrameworks/AggregateDictionary.framework/AggregateDictionary", 1);
  if (result)
  {
    uint64_t result = dlsym(result, "ADClientAddValueForScalarKey");
    dlaggd_addScalarForKey___ADClientAddValueForScalarKey = result;
  }
  return result;
}

void dlaggd_pushDistrubtionForKey(uint64_t a1, __n128 a2)
{
  unint64_t v2 = a2.n128_u64[0];
  if (dlaggd_pushDistrubtionForKey_onceToken != -1) {
    dispatch_once(&dlaggd_pushDistrubtionForKey_onceToken, &__block_literal_global_136);
  }
  int v4 = (void (*)(uint64_t, __n128))dlaggd_pushDistrubtionForKey___ADClientPushValueForDistributionKey;
  if (dlaggd_pushDistrubtionForKey___ADClientPushValueForDistributionKey)
  {
    a2.n128_u64[0] = v2;
    v4(a1, a2);
  }
}

void *__dlaggd_pushDistrubtionForKey_block_invoke()
{
  uint64_t result = dlopen("/System/Library/PrivateFrameworks/AggregateDictionary.framework/AggregateDictionary", 1);
  if (result)
  {
    uint64_t result = dlsym(result, "ADClientPushValueForDistributionKey");
    dlaggd_pushDistrubtionForKey___ADClientPushValueForDistributionKey = result;
  }
  return result;
}

uint64_t CRGetReporterKey()
{
  CFAllocatorRef v0 = (void *)[MEMORY[0x1E4F83948] sharedInstance];

  return [v0 crashReporterKey];
}

void CRCreateDirectoryStructure()
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uid_t v0 = getuid();
  BOOL v1 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT);
  if (v0)
  {
    if (v1)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AE71D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Called to create CR directory as non-root user. Weird!!", buf, 2u);
    }
    return;
  }
  if (v1)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AE71D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Trying to create CR directory structure as root", buf, 2u);
  }
  unint64_t v2 = getpwnam("mobile");
  if (v2) {
    uid_t pw_uid = v2->pw_uid;
  }
  else {
    uid_t pw_uid = 0;
  }
  endpwent();
  int v4 = getpwnam("_analyticsd");
  if (v4) {
    uid_t v5 = v4->pw_uid;
  }
  else {
    uid_t v5 = 0;
  }
  endpwent();
  uint64_t v6 = getgrnam("_analyticsusers");
  if (v6) {
    gid_t gr_gid = v6->gr_gid;
  }
  else {
    gid_t gr_gid = 0;
  }
  endgrent();
  mode_t v8 = umask(2u);
  ensure_dir_perms_analytics("/private/var/logs");
  ensure_dir_perms_analytics("/Library/Logs/CrashReporter");
  ensure_dir_perms_analytics("/Library/Logs/CrashReporter/Baseband");
  ensure_dir_perms_analytics("/Library/Logs/CrashReporter/Panics");
  ensure_dir_perms_analytics("/Library/Logs/AppleSupport");
  ensure_dir_perms_analytics("/Library/Logs/OTACrashCopier");
  if (!pw_uid || !gr_gid)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AE71D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Not attempting to create CR directory as UID/GID information is missing", buf, 2u);
    }
    goto LABEL_62;
  }
  if (!access("/Library/CoreAnalytics", 0))
  {
    *(void *)__int16 v31 = 0;
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "removeItemAtPath:error:", @"/Library/CoreAnalytics", v31);
    uint32_t v23 = *(__CFString **)v31;
    if (*(void *)v31)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v33 = v23;
        _os_log_impl(&dword_1AE71D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Couldn't delete /Library/CoreAnalytics, error = %@", buf, 0xCu);
      }
    }
  }
  create_dir_with_owners_and_perms_with_analytics("/private/var/mobile/Library/Logs", 509, pw_uid, gr_gid);
  if (!objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F83948], "sharedInstance"), "multiUserMode"))
  {
    create_dir_with_owners_and_perms_with_analytics("/private/var/mobile/Library/Logs/CrashReporter", 509, pw_uid, gr_gid);
    goto LABEL_61;
  }
  uid_t v28 = v5;
  if (create_symlink_to_system_container_onceToken != -1) {
    dispatch_once(&create_symlink_to_system_container_onceToken, &__block_literal_global_225);
  }
  uint64_t v30 = 0;
  uint64_t v9 = (void *)create_symlink_to_system_container_containerLocation;
  uint64_t v10 = [NSNumber numberWithBool:1];
  if (([v9 setResourceValue:v10 forKey:*MEMORY[0x1E4F1C630] error:&v30] & 1) == 0
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = [(id)create_symlink_to_system_container_containerLocation lastPathComponent];
    *(_DWORD *)buf = 138412546;
    uint64_t v33 = (__CFString *)v11;
    __int16 v34 = 2112;
    uint64_t v35 = v30;
    _os_log_impl(&dword_1AE71D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Error excluding %@ from backup %@", buf, 0x16u);
  }
  uid_t v26 = geteuid();
  gid_t v25 = getegid();
  gid_t v27 = gr_gid;
  setegid(gr_gid);
  seteuid(pw_uid);
  uint64_t v12 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/private/var/mobile/Library/Logs/CrashReporter"];
  int v13 = -5;
  char v29 = 0;
  uint64_t v14 = *MEMORY[0x1E4F283B8];
  uint64_t v15 = *MEMORY[0x1E4F283D0];
  long long v16 = MEMORY[0x1E4F14500];
  while (1)
  {
    long long v17 = (void *)[MEMORY[0x1E4F28CB8] defaultManager];
    int v18 = [v17 fileExistsAtPath:@"/private/var/mobile/Library/Logs/CrashReporter" isDirectory:&v29];
    int v19 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v17, "attributesOfItemAtPath:error:", @"/private/var/mobile/Library/Logs/CrashReporter", 0), "objectForKeyedSubscript:", v14), "isEqualToString:", v15);
    if (v18 && v29 != 0) {
      break;
    }
    if (((v18 | v19 ^ 1) & 1) == 0
      && ([v17 removeItemAtPath:@"/private/var/mobile/Library/Logs/CrashReporter" error:&v30] & 1) == 0
      && os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      CRCreateDirectoryStructure_cold_1(v31, &v31[4]);
    }
    if ([v17 createSymbolicLinkAtURL:v12 withDestinationURL:create_symlink_to_system_container_containerLocation error:&v30])goto LABEL_60; {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    }
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v33 = (__CFString *)v12;
      __int16 v34 = 2112;
      uint64_t v35 = create_symlink_to_system_container_containerLocation;
      __int16 v36 = 2112;
      uint64_t v37 = v30;
      _os_log_impl(&dword_1AE71D000, v16, OS_LOG_TYPE_DEFAULT, "Couldn't symlink %@ to %@. Error: %@", buf, 0x20u);
    }
LABEL_48:
    if (__CFADD__(v13++, 1)) {
      goto LABEL_60;
    }
  }
  if (v19) {
    goto LABEL_60;
  }
  uint64_t v21 = objc_msgSend(NSString, "stringWithFormat:", @"/private/var/mobile/Library/Logs/CrashReporter-%d", (v13 + 6));
  if ([v17 moveItemAtPath:@"/private/var/mobile/Library/Logs/CrashReporter" toPath:v21 error:&v30])
  {
    [v17 removeItemAtPath:v21 error:0];
    if ([v17 createSymbolicLinkAtURL:v12 withDestinationURL:create_symlink_to_system_container_containerLocation error:&v30])
    {
      int v24 = @"com.apple.osanalytics.system_group_container_symlink_creation.success";
      goto LABEL_59;
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v33 = (__CFString *)v12;
      __int16 v34 = 2112;
      uint64_t v35 = create_symlink_to_system_container_containerLocation;
      __int16 v36 = 2112;
      uint64_t v37 = v30;
      _os_log_impl(&dword_1AE71D000, v16, OS_LOG_TYPE_DEFAULT, "Couldn't symlink %@ to %@. Error: %@", buf, 0x20u);
    }
    if (v13 == -1)
    {
      int v24 = @"com.apple.osanalytics.system_group_container_symlink_creation.fail";
      goto LABEL_59;
    }
    goto LABEL_47;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v33 = @"/private/var/mobile/Library/Logs/CrashReporter";
    __int16 v34 = 2112;
    uint64_t v35 = v21;
    _os_log_impl(&dword_1AE71D000, v16, OS_LOG_TYPE_DEFAULT, "Couldn't move %@ to %@", buf, 0x16u);
  }
  if (v13 != -1)
  {
LABEL_47:
    usleep(0xC350u);
    goto LABEL_48;
  }
  int v24 = @"com.apple.osanalytics.system_group_container_symlink_creation.movement_fail";
LABEL_59:
  dlaggd_addScalarForKey((uint64_t)v24, 1);
LABEL_60:
  seteuid(v26);
  setegid(v25);
  uid_t v5 = v28;
  gid_t gr_gid = v27;
LABEL_61:
  create_dir_with_owners_and_perms_with_analytics("/private/var/mobile/Library/Logs/AppleSupport", 509, pw_uid, gr_gid);
LABEL_62:
  if (v5) {
    create_dir_with_owners_and_perms_with_analytics("/private/var/db/analyticsd", 488, v5, v5);
  }
  umask(v8);
}

Class __softLinkAndSubmit_block_invoke()
{
  softLinkAndSubmit_dylib_handle = (uint64_t)dlopen("/System/Library/PrivateFrameworks/OSASubmissionClient.framework/OSASubmissionClient", 4);
  Class result = objc_getClass("OSASubmissionClient");
  softLinkAndSubmit_submissionClientObj = (uint64_t)result;
  return result;
}

dispatch_queue_t __initForLoggingStructuredData_block_invoke()
{
  uid_t v0 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  dispatch_queue_t result = dispatch_queue_create("com.apple.CrashReporterSupport.LoggingQueue", v0);
  dispatchQueue = (uint64_t)result;
  return result;
}

int *ensure_dir_perms_analytics(const char *a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  dispatch_queue_t result = (int *)mkdir(a1, 0x1EDu);
  if (result == -1)
  {
    dispatch_queue_t result = __error();
    if (*result == 17)
    {
      bzero(v18, 0x400uLL);
      getcwd(v18, 0x400uLL);
      memset(&v5, 0, sizeof(v5));
      int v3 = stat(a1, &v5);
      int v4 = fchmodat(-2, a1, 0x1EDu, 32);
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136447490;
        uint64_t v7 = a1;
        __int16 v8 = 2082;
        uint64_t v9 = v18;
        __int16 v10 = 1024;
        BOOL v11 = v3 == 0;
        __int16 v12 = 1024;
        BOOL v13 = v4 == 0;
        __int16 v14 = 1024;
        int st_mode = v5.st_mode;
        __int16 v16 = 1024;
        int v17 = 493;
        _os_log_impl(&dword_1AE71D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "=== CC ensured dir %{public}s had correct permissions {startPath: %{public}s, statSuccess: %d, successModifyPerms: %d, origninalMode: 0x%X, modifyMode: 0x%X}", buf, 0x2Eu);
      }
      return (int *)send_analytics();
    }
  }
  return result;
}

int *create_dir_with_owners_and_perms_with_analytics(const char *a1, int a2, uid_t a3, gid_t a4)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (!mkdir(a1, a2) || (dispatch_queue_t result = __error(), *result == 17))
  {
    bzero(v31, 0x400uLL);
    getcwd(v31, 0x400uLL);
    memset(&v12, 0, sizeof(v12));
    int v9 = stat(a1, &v12);
    int v10 = fchownat(-2, a1, a3, a4, 32);
    int v11 = fchmodat(-2, a1, a2, 32);
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136448258;
      __int16 v14 = a1;
      __int16 v15 = 2082;
      __int16 v16 = v31;
      __int16 v17 = 1024;
      BOOL v18 = v9 == 0;
      __int16 v19 = 1024;
      BOOL v20 = v10 == 0;
      __int16 v21 = 1024;
      gid_t st_gid = v12.st_gid;
      __int16 v23 = 1024;
      gid_t v24 = a4;
      __int16 v25 = 1024;
      BOOL v26 = v11 == 0;
      __int16 v27 = 1024;
      int st_mode = v12.st_mode;
      __int16 v29 = 1024;
      int v30 = a2;
      _os_log_impl(&dword_1AE71D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "=== CC create dir %{public}s with owners and permissions {startPath: %{public}s, statSuccess: %d, successModifyGID: %d, origninalGID: %d, modifyGID: %d, successModifyPerms: %d, origninalMode: 0x%X, modifyMode: 0x%X}", buf, 0x40u);
    }
    return (int *)send_analytics();
  }
  return result;
}

uint64_t send_analytics()
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  [v0 setUsesSignificantDigits:1];
  [v0 setMaximumSignificantDigits:2];
  getprogname();
  *(void *)int v9 = 0x1500000001;
  v8[0] = 0uLL;
  size_t v7 = 16;
  if (sysctl(v9, 2u, v8, &v7, 0, 0) != -1)
  {
    if (*(void *)&v8[0])
    {
      uint64_t v1 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:(double)*(uint64_t *)&v8[0]];
      if (v1)
      {
        unint64_t v2 = NSNumber;
        objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9C8], "date"), "timeIntervalSinceDate:", v1);
        objc_msgSend(v0, "stringForObjectValue:", objc_msgSend(v2, "numberWithDouble:"));
      }
    }
  }
  pid_t v3 = getpid();
  *(void *)int v9 = 0xE00000001;
  int v10 = 1;
  pid_t v11 = v3;
  memset(v8, 0, 512);
  size_t v7 = 648;
  if ((sysctl(v9, 4u, v8, &v7, 0, 0) & 0x80000000) == 0)
  {
    uint64_t v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:(double)*(uint64_t *)&v8[0]];
    if (v4)
    {
      stat v5 = NSNumber;
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9C8], "date"), "timeIntervalSinceDate:", v4);
      objc_msgSend(v0, "stringForObjectValue:", objc_msgSend(v5, "numberWithDouble:"));
    }
  }

  return AnalyticsSendEventLazy();
}

uint64_t __send_analytics_block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v8[0] = @"progname";
  if (*(void *)(a1 + 48)) {
    unint64_t v2 = (__CFString *)objc_msgSend(NSString, "stringWithUTF8String:");
  }
  else {
    unint64_t v2 = @"<unknown>";
  }
  v9[0] = v2;
  v8[1] = @"path";
  if (*(void *)(a1 + 56)) {
    pid_t v3 = (__CFString *)objc_msgSend(NSString, "stringWithUTF8String:");
  }
  else {
    pid_t v3 = @"<unknown>";
  }
  v9[1] = v3;
  _OWORD v8[2] = @"start_path";
  if (*(void *)(a1 + 64)) {
    uint64_t v4 = (__CFString *)objc_msgSend(NSString, "stringWithUTF8String:");
  }
  else {
    uint64_t v4 = @"<unknown>";
  }
  int v9[2] = v4;
  v8[3] = @"original_perms";
  if (*(unsigned char *)(a1 + 84)) {
    stat v5 = (void *)[NSNumber numberWithUnsignedShort:*(unsigned __int16 *)(a1 + 80)];
  }
  else {
    stat v5 = &unk_1F062A040;
  }
  v9[3] = v5;
  void v8[4] = @"modify_perms";
  void v9[4] = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 85)];
  v8[5] = @"modify_perms_success";
  v9[5] = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 86)];
  v8[6] = @"modify_perms_value";
  v9[6] = [NSNumber numberWithUnsignedShort:*(unsigned __int16 *)(a1 + 82)];
  v8[7] = @"original_gid";
  if (*(unsigned char *)(a1 + 84)) {
    uint64_t v6 = (void *)[NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 72)];
  }
  else {
    uint64_t v6 = &unk_1F062A040;
  }
  v9[7] = v6;
  v8[8] = @"modify_gid";
  v9[8] = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 87)];
  v8[9] = @"modify_gid_success";
  v9[9] = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 88)];
  v8[10] = @"modify_gid_value";
  v9[10] = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 76)];
  v8[11] = @"boot_time_appx";
  v8[12] = @"proc_uptime_appx";
  long long v10 = *(_OWORD *)(a1 + 32);
  v8[13] = @"framework";
  pid_t v11 = @"CrashCatcher";
  return [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:14];
}

void __create_symlink_to_system_container_block_invoke()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v0 = (void *)[LogsContainerLocation() URLByAppendingPathComponent:@"Library/Logs/DiagnosticReports" isDirectory:1];
  uint64_t v1 = (uint64_t)v0;
  uint64_t v2 = 0;
  if (v0 && _createDirectoryIfNeeded(v0, 1, &v2))
  {
    create_symlink_to_system_container_containerLocation = v1;
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v4 = v1;
    __int16 v5 = 2112;
    uint64_t v6 = v2;
    _os_log_impl(&dword_1AE71D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Couldn't create directory %@. Error: %@", buf, 0x16u);
  }
}

void logForAppleCare_cold_1(void *a1)
{
  [a1 componentsJoinedByString:@","];
  OUTLINED_FUNCTION_0(&dword_1AE71D000, MEMORY[0x1E4F14500], v1, "AppleCareSupport: event \"%@\"", v2, v3, v4, v5, 2u);
}

void openR3_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void purgeR3Logs_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void CRCreateDirectoryStructure_cold_1(uint8_t *buf, void *a2)
{
  *(_DWORD *)buf = 138543362;
  *a2 = @"/private/var/mobile/Library/Logs/CrashReporter";
  _os_log_error_impl(&dword_1AE71D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error removing old symlink at %{public}@", buf, 0xCu);
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1F41138B8]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7ED0](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE0](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE8](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x1F40D7F10](applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1F40D85F0]();
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x1F40D8988](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x1F40D89B0](alloc, uuid);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

void NSLog(NSString *format, ...)
{
}

uint64_t OSADateFormat()
{
  return MEMORY[0x1F4139E50]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
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

int access(const char *a1, int a2)
{
  return MEMORY[0x1F40CA210](a1, *(void *)&a2);
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x1F40CB400](a1);
}

uint64_t container_system_group_path_for_identifier()
{
  return MEMORY[0x1F40CB7F8]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1F40CBDB0]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

void endgrent(void)
{
}

void endpwent(void)
{
}

int fchmodat(int a1, const char *a2, mode_t a3, int a4)
{
  return MEMORY[0x1F40CC030](*(void *)&a1, a2, a3, *(void *)&a4);
}

int fchown(int a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x1F40CC038](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

int fchownat(int a1, const char *a2, uid_t a3, gid_t a4, int a5)
{
  return MEMORY[0x1F40CC040](*(void *)&a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5);
}

int fclose(FILE *a1)
{
  return MEMORY[0x1F40CC050](a1);
}

int feof(FILE *a1)
{
  return MEMORY[0x1F40CC098](a1);
}

int ferror(FILE *a1)
{
  return MEMORY[0x1F40CC0A0](a1);
}

ssize_t fgetxattr(int fd, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1F40CC108](*(void *)&fd, name, value, size, *(void *)&position, *(void *)&options);
}

int fileno(FILE *a1)
{
  return MEMORY[0x1F40CC110](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1F40CC1C0](__filename, __mode);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x1F40CC1F0](a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC200](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

int fsetxattr(int fd, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1F40CC2A8](*(void *)&fd, name, value, size, *(void *)&position, *(void *)&options);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1F40CC2B8](*(void *)&a1, a2);
}

char *__cdecl getcwd(char *a1, size_t a2)
{
  return (char *)MEMORY[0x1F40CC398](a1, a2);
}

gid_t getegid(void)
{
  return MEMORY[0x1F40CC3A8]();
}

uid_t geteuid(void)
{
  return MEMORY[0x1F40CC3B8]();
}

gid_t getgid(void)
{
  return MEMORY[0x1F40CC3D0]();
}

group *__cdecl getgrnam(const char *a1)
{
  return (group *)MEMORY[0x1F40CC3E0](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1F40CC4C0]();
}

passwd *__cdecl getpwnam(const char *a1)
{
  return (passwd *)MEMORY[0x1F40CC4D8](a1);
}

uid_t getuid(void)
{
  return MEMORY[0x1F40CC570]();
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x1F40CC590](path, name, value, size, *(void *)&position, *(void *)&options);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CC900](a1, a2);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1F40CCDD0](a1, a2);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1F40CD040](*(void *)&token, state64);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1F40CD058](name, out_token);
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_enumerationMutation(id obj)
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

void objc_storeStrong(id *location, id obj)
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

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return MEMORY[0x1F40CD0F0](a1, *(void *)&a2, *(void *)&a3, *(void *)&a4);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x1F40CD120](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x1F40CDC60](a1);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

int setegid(gid_t a1)
{
  return MEMORY[0x1F40CDF58](*(void *)&a1);
}

int seteuid(uid_t a1)
{
  return MEMORY[0x1F40CDF68](*(void *)&a1);
}

int sprintf(char *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CE0A0](a1, a2);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CE110](a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1F40CE3C0](a1, *(void *)&a2, a3, a4, a5, a6);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1F40CE588](a1);
}

mode_t umask(mode_t a1)
{
  return MEMORY[0x1F40CE5C0](a1);
}

int unlink(const char *a1)
{
  return MEMORY[0x1F40CE5E0](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1F40CE608](*(void *)&a1);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1F40CE928](*(void *)&__fd, __buf, __nbyte);
}