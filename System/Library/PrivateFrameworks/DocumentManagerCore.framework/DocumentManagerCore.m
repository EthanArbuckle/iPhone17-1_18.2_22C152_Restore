uint64_t DOCProviderDomainIDIsSharedServerDomainID(void *a1, const char *a2)
{
  return [a1 hasPrefix:@"com.apple.SMBClientProvider.FileProvider"];
}

uint64_t DOCProviderDomainIDIsExternalDevice(void *a1, const char *a2)
{
  return [a1 hasPrefix:@"com.apple.filesystems.UserFS.FileProvider"];
}

id DOCLocalizedProviderOnlyDisplayName(void *a1)
{
  id v1 = a1;
  v2 = [v1 identifier];
  int v3 = [v2 isEqualToString:@"com.apple.FileProvider.LocalStorage"];

  if (v3) {
    DOCLocalProviderLocalizedDisplayName();
  }
  else {
  v4 = [v1 providerDisplayName];
  }

  return v4;
}

id DOCLocalizedDisplayName(void *a1)
{
  id v1 = a1;
  v2 = [v1 identifier];
  int v3 = [v2 isEqualToString:@"com.apple.FileProvider.LocalStorage"];

  if (v3)
  {
    v4 = DOCLocalProviderLocalizedDisplayName();
  }
  else
  {
    v5 = [v1 domainDisplayName];

    v4 = [v1 providerDisplayName];
    if (v5)
    {
      v6 = NSString;
      v7 = [v1 domainDisplayName];
      v8 = [v6 stringWithFormat:@" — %@", v7];
      uint64_t v9 = [v4 stringByAppendingString:v8];

      v4 = (void *)v9;
    }
  }

  return v4;
}

id DOCLocalProviderLocalizedDisplayName()
{
  v0 = (void *)MGCopyAnswer();
  if ([v0 isEqualToString:@"iPhone"])
  {
    id v1 = _DocumentManagerBundle();
    v2 = v1;
    int v3 = @"On My iPhone";
  }
  else if ([v0 isEqualToString:@"iPad"])
  {
    id v1 = _DocumentManagerBundle();
    v2 = v1;
    int v3 = @"On My iPad";
  }
  else if ([v0 isEqualToString:@"iPod touch"])
  {
    id v1 = _DocumentManagerBundle();
    v2 = v1;
    int v3 = @"On My iPod";
  }
  else if ([v0 isEqualToString:@"Apple Vision"])
  {
    id v1 = _DocumentManagerBundle();
    v2 = v1;
    int v3 = @"On My Apple Vision Pro";
  }
  else
  {
    if ([v0 length])
    {
      v4 = [MEMORY[0x263F086E0] mainBundle];
      v2 = [v4 localizedStringForKey:@"On My %@" value:&stru_26C404058 table:0];

      uint64_t v5 = objc_msgSend(NSString, "stringWithFormat:", v2, v0);
      goto LABEL_13;
    }
    id v1 = _DocumentManagerBundle();
    v2 = v1;
    int v3 = @"On My Device";
  }
  uint64_t v5 = [v1 localizedStringForKey:v3 value:v3 table:@"Localizable"];
LABEL_13:
  v6 = (void *)v5;

  return v6;
}

uint64_t _DocumentManagerBundle()
{
  return [MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/DocumentManager.framework"];
}

void sub_213673978(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

id DOCContentTypesReadableByApplicationWithBundleIdentifier(void *a1)
{
  v15[1] = *MEMORY[0x263EF8340];
  id v1 = a1;
  if ([v1 isEqualToString:@"com.apple.DocumentsApp"])
  {
    v15[0] = *MEMORY[0x263F1DB38];
    v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:1];
  }
  else
  {
    if (v1)
    {
      id v3 = v1;
    }
    else
    {
      v4 = [MEMORY[0x263F086E0] mainBundle];
      id v3 = [v4 bundleIdentifier];
    }
    uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:v3 allowPlaceholder:0 error:0];
    v6 = v5;
    if (v5)
    {
      v7 = [v5 claimRecords];
      v8 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v7, "count"));
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __DOCContentTypesReadableByApplicationWithBundleIdentifier_block_invoke;
      v13[3] = &unk_2641B5A88;
      id v14 = v8;
      id v9 = v8;
      [v7 enumerateObjectsUsingBlock:v13];
      v2 = objc_msgSend(MEMORY[0x263F1D920], "doc_contentTypesForIdentifiers:", v9);

      if (![v2 count])
      {
        v10 = docLogHandle;
        if (!docLogHandle)
        {
          DOCInitLogging();
          v10 = docLogHandle;
        }
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          DOCContentTypesReadableByApplicationWithBundleIdentifier_cold_2(v10);
        }
      }
    }
    else
    {
      v11 = docLogHandle;
      if (!docLogHandle)
      {
        DOCInitLogging();
        v11 = docLogHandle;
      }
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        DOCContentTypesReadableByApplicationWithBundleIdentifier_cold_1((uint64_t)v1, v11);
      }
      v2 = (void *)MEMORY[0x263EFFA68];
    }
  }
  return v2;
}

id composedID(void *a1, void *a2)
{
  v8[2] = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  if ([v4 length])
  {
    v8[0] = v3;
    v8[1] = v4;
    uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:2];
    id v6 = [v5 componentsJoinedByString:@"."];
  }
  else
  {
    id v6 = v3;
  }

  return v6;
}

uint64_t DOCProviderDomainIDIsLegacyWebDAV(void *a1)
{
  id v1 = a1;
  if (DOCProviderDomainIDIsWebDAV(v1))
  {
    v2 = [MEMORY[0x263F01890] bundleRecordWithBundleIdentifier:v1 allowPlaceholder:0 error:0];
    id v3 = [v2 bundleVersion];
    id v4 = [MEMORY[0x263F01880] defaultWorkspace];
    int v5 = [v4 isVersion:v3 greaterThanOrEqualToVersion:@"5.2"];

    uint64_t v6 = v5 ^ 1u;
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

id DOCTagsFromFPTags(void *a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v1 = a1;
  v2 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v1, "count"));
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = DOCTagFromFPTag(*(void **)(*((void *)&v10 + 1) + 8 * i));
        objc_msgSend(v2, "addObject:", v8, (void)v10);
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return v2;
}

uint64_t DOCProviderDomainIDIsWebDAV(void *a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v1 = a1;
  if (DOCProviderDomainIDIsWebDAV_onceToken != -1) {
    dispatch_once(&DOCProviderDomainIDIsWebDAV_onceToken, &__block_literal_global_5);
  }
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  id v2 = (id)DOCProviderDomainIDIsWebDAV_webDAVProviderIdentifiers;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(v1, "hasPrefix:", *(void *)(*((void *)&v7 + 1) + 8 * i), (void)v7))
        {
          uint64_t v3 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v3;
}

DOCTag *DOCTagFromFPTag(void *a1)
{
  id v1 = a1;
  id v2 = +[DOCTagRegistry sharedInstance];
  uint64_t v3 = [v1 label];
  uint64_t v4 = [v2 tagForName:v3];

  if (v4 && [v4 type] == 1
    || ([v1 color] & 0x80000000) != 0
    || (int)[v1 color] >= 8)
  {
    uint64_t v5 = v4;
  }
  else
  {
    uint64_t v6 = [DOCTag alloc];
    long long v7 = [v1 label];
    uint64_t v5 = -[DOCTag initWithDisplayName:labelIndex:type:](v6, "initWithDisplayName:labelIndex:type:", v7, (int)[v1 color], 0);
  }
  return v5;
}

BOOL DOCDeviceIsPhone()
{
  return MGGetSInt32Answer() == 1;
}

BOOL DOCDeviceIsPad()
{
  return MGGetSInt32Answer() != 1;
}

uint64_t DOCProviderDomainIDIsDefaultSharedServer(void *a1, const char *a2)
{
  return [a1 isEqualToString:@"com.apple.SMBClientProvider.FileProvider"];
}

void sub_21367741C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void DOCRunInMainThread(void *a1)
{
  id v1 = a1;
  if (!v1) {
    DOCRunInMainThread_cold_1();
  }
  block = v1;
  if ([MEMORY[0x263F08B88] isMainThread]) {
    block[2]();
  }
  else {
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void sub_213678B6C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213678EE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2136796B0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2136798E8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_213679A60(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void _FFInitLog(void *a1, int a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a1;
  uint64_t v4 = @"NO";
  if (a2) {
    uint64_t v4 = @"YES";
  }
  uint64_t v5 = v4;
  uint64_t v6 = docLogHandle;
  if (!docLogHandle)
  {
    DOCInitLogging();
    uint64_t v6 = docLogHandle;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412546;
    id v8 = v3;
    __int16 v9 = 2112;
    long long v10 = v5;
    _os_log_impl(&dword_213670000, v6, OS_LOG_TYPE_DEFAULT, "[Feature Flag] Initializing %@ to value = %@", (uint8_t *)&v7, 0x16u);
  }
}

void DOCInitLogging()
{
  if (DOCInitLogging_once != -1) {
    dispatch_once(&DOCInitLogging_once, &__block_literal_global_0);
  }
}

void sub_21367A67C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21367A920(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21367AB6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
}

uint64_t DOCProviderDomainIsSharedServerDomain(void *a1)
{
  id v1 = [a1 identifier];
  uint64_t v2 = [v1 hasPrefix:@"com.apple.SMBClientProvider.FileProvider"];

  return v2;
}

uint64_t DOCProviderDomainIDIsRemovable(void *a1)
{
  id v1 = a1;
  if ([v1 hasPrefix:@"com.apple.SMBClientProvider.FileProvider"]) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = [v1 hasPrefix:@"com.apple.filesystems.UserFS.FileProvider"];
  }

  return v2;
}

uint64_t __StartFINode_block_invoke()
{
  return [MEMORY[0x263F397B0] start];
}

void __DOCProviderDomainIDIsWebDAV_block_invoke()
{
  v0 = (void *)DOCProviderDomainIDIsWebDAV_webDAVProviderIdentifiers;
  DOCProviderDomainIDIsWebDAV_webDAVProviderIdentifiers = (uint64_t)&unk_26C40CBB0;
}

void StartFINode()
{
  if (StartFINode_onceToken != -1) {
    dispatch_once(&StartFINode_onceToken, &__block_literal_global_3);
  }
}

void sub_21367C5D4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id containingBundleForBundle(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = [v4 objectForKey:v3];
  if (v5)
  {
    id v6 = v5;
  }
  else
  {
    int v7 = (void *)[objc_alloc(MEMORY[0x263F01858]) initWithBundleIdentifier:v3 error:0];
    id v8 = v7;
    if (v7)
    {
      __int16 v9 = [v7 containingBundleRecord];
      id v6 = [v9 bundleIdentifier];

      if (v6)
      {
        [v4 setObject:v6 forKey:v3];
        id v6 = v6;
      }
    }
    else
    {
      id v6 = 0;
    }
  }
  return v6;
}

void __DOCSelfCanMapLSDatabase_block_invoke()
{
  v0 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x263EFFB08]);
  if (v0)
  {
    id v1 = v0;
    uint64_t v2 = (__SecTask *)SecTaskCopyValueForEntitlement(v0, @"com.apple.private.coreservices.canmaplsdatabase", 0);
    if (v2)
    {
      id v3 = v2;
      CFTypeID TypeID = CFBooleanGetTypeID();
      BOOL v5 = TypeID == CFGetTypeID(v3) && CFBooleanGetValue(v3) != 0;
      CFRelease(v1);
    }
    else
    {
      BOOL v5 = 0;
      id v3 = v1;
    }
    CFRelease(v3);
  }
  else
  {
    BOOL v5 = 0;
  }
  DOCSelfCanMapLSDatabase_canMapLSDatabase = v5;
}

uint64_t __DOCInitLogging_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.DocumentManager", "DocumentManager");
  id v1 = (void *)docLogHandle;
  docLogHandle = (uint64_t)v0;

  os_log_t v2 = os_log_create("com.apple.DocumentManager", "UI");
  id v3 = (void *)docUILogHandle;
  docUILogHandle = (uint64_t)v2;

  os_log_t v4 = os_log_create("com.apple.DocumentManager", "DocumentCreation");
  BOOL v5 = (void *)docDocumentCreationLogHandle;
  docDocumentCreationLogHandle = (uint64_t)v4;

  os_log_t v6 = os_log_create("com.apple.DocumentManager", "ServicePresentation");
  int v7 = (void *)docServicePresentationHandle;
  docServicePresentationHandle = (uint64_t)v6;

  os_log_t v8 = os_log_create("com.apple.DocumentManager", "Persona");
  __int16 v9 = (void *)docPersonaLogHandle;
  docPersonaLogHandle = (uint64_t)v8;

  os_log_t v10 = os_log_create("com.apple.DocumentManager", "SmartFolders");
  uint64_t v11 = (void *)docSmartFolderLogHandle;
  docSmartFolderLogHandle = (uint64_t)v10;

  os_log_t v12 = os_log_create("com.apple.DocumentManager", "Source");
  long long v13 = (void *)docSourceLogHandle;
  docSourceLogHandle = (uint64_t)v12;

  os_log_t v14 = os_log_create("com.apple.DocumentManager", "Picker");
  uint64_t v15 = (void *)docPickerLogHandle;
  docPickerLogHandle = (uint64_t)v14;

  os_log_t v16 = os_log_create("com.apple.DocumentManager", "Rename");
  v17 = (void *)docRenameLogHandle;
  docRenameLogHandle = (uint64_t)v16;

  os_log_t v18 = os_log_create("com.apple.DocumentManager", "History");
  v19 = (void *)docBrowserHistoryLogHandle;
  docBrowserHistoryLogHandle = (uint64_t)v18;

  os_log_t v20 = os_log_create("com.apple.DocumentManager", "Tests");
  v21 = (void *)docTestsLogHandle;
  docTestsLogHandle = (uint64_t)v20;

  os_log_t v22 = os_log_create("com.apple.DocumentManager", "DownloadService");
  v23 = (void *)docDownloadServiceLogHandle;
  docDownloadServiceLogHandle = (uint64_t)v22;

  os_log_t v24 = os_log_create("com.apple.DocumentManager", "StateStore");
  v25 = (void *)docStateStoreHandle;
  docStateStoreHandle = (uint64_t)v24;

  os_log_t v26 = os_log_create("com.apple.DocumentManager", "Analytics");
  v27 = (void *)docAnalyticsLogHandle;
  docAnalyticsLogHandle = (uint64_t)v26;

  os_log_t v28 = os_log_create("com.apple.DocumentManager", "Application");
  v29 = (void *)docApplicationLogHandle;
  docApplicationLogHandle = (uint64_t)v28;

  os_log_t v30 = os_log_create("com.apple.DocumentManager", "ProgressUI");
  v31 = (void *)docProgressUILogHandle;
  docProgressUILogHandle = (uint64_t)v30;

  os_log_t v32 = os_log_create("com.apple.DocumentManager", "Enumeration");
  v33 = (void *)docEnumerationLogHandle;
  docEnumerationLogHandle = (uint64_t)v32;

  os_log_t v34 = os_log_create("com.apple.DocumentManager", "AppIntents");
  v35 = (void *)docAppIntentsLogHandle;
  docAppIntentsLogHandle = (uint64_t)v34;

  os_log_t v36 = os_log_create("com.apple.DocumentManager", "FileProviderSyncState");
  v37 = (void *)docFileProviderSyncStateLogHandle;
  docFileProviderSyncStateLogHandle = (uint64_t)v36;

  os_log_t v38 = os_log_create("com.apple.DocumentManager", "Sidebar");
  v39 = (void *)docSidebarLogHandle;
  docSidebarLogHandle = (uint64_t)v38;

  os_log_t v40 = os_log_create("com.apple.DocumentManager", "Preview");
  uint64_t v41 = docPreviewLogHandle;
  docPreviewLogHandle = (uint64_t)v40;
  return MEMORY[0x270F9A758](v40, v41);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
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

void DOCLogAssertionFailureMessage_Swift(void *a1, uint64_t a2, void *a3, void *a4)
{
  int v7 = (objc_class *)NSString;
  id v8 = a4;
  id v9 = a3;
  id v10 = a1;
  uint64_t v11 = (void *)[[v7 alloc] initWithFormat:@"DocumentManager assertion on %@:%d \"%@\" failed: %@", v10, a2, v9, v8];

  if (LoadCrashSupportIfNecessary_once != -1) {
    dispatch_once(&LoadCrashSupportIfNecessary_once, &__block_literal_global_36);
  }
  os_log_t v12 = (void (*)(uint64_t, uint64_t, void *))DOCSimulateCrash;
  if (DOCSimulateCrash)
  {
    uint64_t v13 = getpid();
    v12(v13, 5, v11);
  }
  os_log_t v14 = docLogHandle;
  if (!docLogHandle)
  {
    if (DOCInitLogging_once != -1) {
      dispatch_once(&DOCInitLogging_once, &__block_literal_global_0);
    }
    os_log_t v14 = docLogHandle;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    DOCLogAssertionFailureMessage_Swift_cold_1((uint64_t)v11, v14);
  }
}

void DOCLogAssertionFailure(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  os_log_t v12 = (objc_class *)NSString;
  id v13 = a5;
  os_log_t v14 = (void *)[[v12 alloc] initWithFormat:v13 arguments:&a9];

  uint64_t v15 = (void *)[[NSString alloc] initWithFormat:@"DocumentManager assertion on %s:%d \"%s\" failed: %@", a2, a4, a1, v14];
  if (LoadCrashSupportIfNecessary_once != -1) {
    dispatch_once(&LoadCrashSupportIfNecessary_once, &__block_literal_global_36);
  }
  os_log_t v16 = (void (*)(uint64_t, uint64_t, void *))DOCSimulateCrash;
  if (DOCSimulateCrash)
  {
    uint64_t v17 = getpid();
    v16(v17, 5, v15);
  }
  os_log_t v18 = docLogHandle;
  if (!docLogHandle)
  {
    if (DOCInitLogging_once != -1) {
      dispatch_once(&DOCInitLogging_once, &__block_literal_global_0);
    }
    os_log_t v18 = docLogHandle;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    DOCLogAssertionFailureMessage_Swift_cold_1((uint64_t)v15, v18);
  }
}

void DOCLogBacktrace(void *a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  BOOL v5 = a1;
  id v6 = a2;
  id v7 = a3;
  id v8 = [MEMORY[0x263F08B88] callStackSymbols];
  id v9 = [MEMORY[0x263F089D8] string];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        [(__CFString *)v9 appendFormat:@"%@ %@\n", @"[DocMgrBT] ", *(void *)(*((void *)&v15 + 1) + 8 * v14++), (void)v15];
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v25 count:16];
    }
    while (v12);
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    os_log_t v20 = @"[DocMgrBT] ";
    __int16 v21 = 2112;
    id v22 = v6;
    __int16 v23 = 2112;
    id v24 = v7;
    _os_log_impl(&dword_213670000, v5, OS_LOG_TYPE_DEFAULT, "%@ %@: '%@'", buf, 0x20u);
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    os_log_t v20 = v9;
    _os_log_impl(&dword_213670000, v5, OS_LOG_TYPE_DEFAULT, "\n%@", buf, 0xCu);
  }
}

void __LoadCrashSupportIfNecessary_block_invoke()
{
  os_log_t v0 = dlopen((const char *)[@"/System/Library/PrivateFrameworks/CrashReporterSupport.framework/CrashReporterSupport" fileSystemRepresentation], 1);
  LoadCrashSupportIfNecessary___CrashReportHandle = (uint64_t)v0;
  if (v0)
  {
    DOCSimulateCrash = dlsym(v0, "SimulateCrash");
  }
  else
  {
    id v1 = docLogHandle;
    if (!docLogHandle)
    {
      if (DOCInitLogging_once != -1) {
        dispatch_once(&DOCInitLogging_once, &__block_literal_global_0);
      }
      id v1 = docLogHandle;
    }
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      __LoadCrashSupportIfNecessary_block_invoke_cold_1(v1);
    }
  }
}

void sub_213680C04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21368122C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id DOCRandomRankBetween(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = a1 + 1;
  if (a1 + 1 >= a2)
  {
    BOOL v5 = 0;
  }
  else
  {
    unint64_t __buf = 0;
    arc4random_buf(&__buf, 8uLL);
    BOOL v5 = [NSNumber numberWithUnsignedLongLong:v2 + __buf % (~a1 + a2)];
  }
  return v5;
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

id DOCEnumerationLogHandle()
{
  os_log_t v0 = (void *)docEnumerationLogHandle;
  if (!docEnumerationLogHandle)
  {
    DOCInitLogging();
    os_log_t v0 = (void *)docEnumerationLogHandle;
  }
  return v0;
}

id DOCNodeFromCoder(void *a1)
{
  id v1 = a1;
  int v2 = [v1 decodeIntForKey:@"DOCNodeEncodedTypeKey"];
  if (!v2) {
    goto LABEL_4;
  }
  if (v2 == 1)
  {
    id v3 = +[DOCNodeStartupManager shared];
    [v3 startIfNeeded];

LABEL_4:
    uint64_t v4 = [v1 decodeObjectOfClass:objc_opt_class() forKey:@"DOCNodeEncodedObjectKey"];
    goto LABEL_6;
  }
  uint64_t v4 = 0;
LABEL_6:

  return v4;
}

void sub_21368624C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2136865A8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2136868C4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void __DOCContentTypesReadableByApplicationWithBundleIdentifier_block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [v6 handlerRank];
  if (([v3 isEqualToString:*MEMORY[0x263F018F0]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x263F018E0]] & 1) != 0
    || [v3 isEqualToString:*MEMORY[0x263F018E8]])
  {
    uint64_t v4 = *(void **)(a1 + 32);
    BOOL v5 = [v6 typeIdentifiers];
    [v4 addObjectsFromArray:v5];
  }
}

BOOL DOCApplicationWithBundleIdentifierSupportsDocuments(void *a1)
{
  id v1 = DOCContentTypesReadableByApplicationWithBundleIdentifier(a1);
  BOOL v2 = [v1 count] != 0;

  return v2;
}

void sub_213688C00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
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

void sub_213689AB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
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

void sub_213689DF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void sub_21368A184(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_21368B9AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_21368C00C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21368CA34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t DOCShouldApplicationShowRecentsPopover(void *a1)
{
  v16[1] = *MEMORY[0x263EF8340];
  id v1 = a1;
  BOOL v2 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:v1 allowPlaceholder:0 error:0];
  if ([v2 supportsOpenInPlace])
  {
    id v3 = DOCContentTypesReadableByApplicationWithBundleIdentifier(v1);
    uint64_t v4 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      uint64_t v4 = docLogHandle;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      DOCShouldApplicationShowRecentsPopover_cold_4((uint64_t)v1, v4, v3);
    }
    if ([v3 count])
    {
      BOOL v5 = objc_msgSend(MEMORY[0x263F1D920], "doc_identifiersForContentTypes:", v3);
      id v6 = [(id)*MEMORY[0x263F1DAB0] identifier];
      v16[0] = v6;
      id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];

      id v8 = +[DOCManagedPermission defaultPermission];
      uint64_t v9 = [v8 allowedFileProviderBundleIdentifiersForHostBundleIdentifier:v1];

      id v10 = docLogHandle;
      if (!docLogHandle)
      {
        DOCInitLogging();
        id v10 = docLogHandle;
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        DOCShouldApplicationShowRecentsPopover_cold_3((uint64_t)v1, (uint64_t)v3, v10);
      }
      uint64_t v11 = [MEMORY[0x263F054C0] isAnyDocumentRecentlyUsed:v5 excludedFileTypes:v7 allowedFileProviderIdentifiers:v9];
      uint64_t v12 = docLogHandle;
      if (!docLogHandle)
      {
        DOCInitLogging();
        uint64_t v12 = docLogHandle;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        DOCShouldApplicationShowRecentsPopover_cold_2((uint64_t)v1, v12, v11);
      }
    }
    else
    {
      uint64_t v14 = docLogHandle;
      if (!docLogHandle)
      {
        DOCInitLogging();
        uint64_t v14 = docLogHandle;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        DOCShouldApplicationShowRecentsPopover_cold_1((uint64_t)v1, v14);
      }
      uint64_t v11 = 0;
    }
  }
  else
  {
    uint64_t v13 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      uint64_t v13 = docLogHandle;
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      DOCShouldApplicationShowRecentsPopover_cold_5((uint64_t)v1, v13);
    }
    uint64_t v11 = 0;
  }

  return v11;
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_213690198(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{
}

void OUTLINED_FUNCTION_1_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x20u);
}

void OUTLINED_FUNCTION_8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x2Au);
}

uint64_t OUTLINED_FUNCTION_10()
{
  return v0;
}

void OUTLINED_FUNCTION_12(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x1Cu);
}

void OUTLINED_FUNCTION_13(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

uint64_t OUTLINED_FUNCTION_14()
{
  return v0;
}

void OUTLINED_FUNCTION_18(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_19(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x2Cu);
}

uint64_t OUTLINED_FUNCTION_22()
{
  return v0;
}

id documentmanager_perf_log()
{
  if (documentmanager_perf_log_once != -1) {
    dispatch_once(&documentmanager_perf_log_once, &__block_literal_global_9);
  }
  uint64_t v0 = (void *)documentmanager_perf_log_logger;
  return v0;
}

uint64_t __documentmanager_perf_log_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.DocumentManager", "performance");
  uint64_t v1 = documentmanager_perf_log_logger;
  documentmanager_perf_log_logger = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

void sub_213690FB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va1, a8);
  va_start(va, a8);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{
}

id FPTagFromDOCTag(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 labelIndex];
  id v3 = objc_alloc(MEMORY[0x263F05510]);
  uint64_t v4 = [v1 displayName];

  uint64_t v5 = (void *)[v3 initWithLabel:v4 color:v2];
  return v5;
}

id FPTagsFromDOCTags(void *a1)
{
  id v1 = (void *)MEMORY[0x263EFF980];
  id v2 = a1;
  id v3 = objc_msgSend(v1, "arrayWithCapacity:", objc_msgSend(v2, "count"));
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __FPTagsFromDOCTags_block_invoke;
  v6[3] = &unk_2641B5FD0;
  id v4 = v3;
  id v7 = v4;
  [v2 enumerateObjectsUsingBlock:v6];

  return v4;
}

void __FPTagsFromDOCTags_block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  FPTagFromDOCTag(a2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObject:v3];
}

void sub_213692834(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_213692E78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{
}

uint64_t hasEqual_defaultEffectiveTabIdentifierForLocationRestore(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = [v3 defaultEffectiveTabIdentifierForLocationRestore];
  id v6 = [v4 defaultEffectiveTabIdentifierForLocationRestore];
  if (v5 == v6)
  {
    uint64_t v9 = 1;
  }
  else
  {
    id v7 = [v3 defaultEffectiveTabIdentifierForLocationRestore];
    id v8 = [v4 defaultEffectiveTabIdentifierForLocationRestore];
    uint64_t v9 = [v7 isEqualToString:v8];
  }
  return v9;
}

__CFString *NSStringFromContentMode(unint64_t a1)
{
  if (a1 > 2) {
    return @"????";
  }
  else {
    return off_2641B6278[a1];
  }
}

__CFString *NSStringFromLandingMode(uint64_t a1)
{
  id v1 = @"????";
  if (a1 == 1) {
    id v1 = @"chin";
  }
  if (a1) {
    return v1;
  }
  else {
    return @"fullscreen";
  }
}

void sub_213694D04(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2136956A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{
}

void sub_213697348(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_213697D10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

void sub_213697DFC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_3_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void sub_213698E44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

uint64_t sub_213699A34()
{
  return sub_21369F628();
}

uint64_t sub_213699AC4()
{
  return sub_21369F618();
}

uint64_t sub_213699B44()
{
  return sub_21369F628();
}

uint64_t sub_213699BD4()
{
  return sub_21369F618();
}

uint64_t DOCUIPBrowserState.contentMode.getter()
{
  return *(void *)v0;
}

{
  uint64_t v0;

  return *(void *)(v0 + OBJC_IVAR___DOCUIPBrowserState__impl);
}

uint64_t DOCUIPBrowserState.contentMode.setter(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

{
  uint64_t v1;

  *(void *)(v1 + OBJC_IVAR___DOCUIPBrowserState__impl) = result;
  return result;
}

uint64_t (*DOCUIPBrowserState.contentMode.modify())()
{
  return nullsub_1;
}

uint64_t DOCUIPBrowserState.documentLandingMode.getter()
{
  return *(void *)(v0 + 8);
}

{
  uint64_t v0;

  return *(void *)(v0 + OBJC_IVAR___DOCUIPBrowserState__impl + 8);
}

uint64_t DOCUIPBrowserState.documentLandingMode.setter(uint64_t result)
{
  *(void *)(v1 + 8) = result;
  return result;
}

{
  uint64_t v1;

  *(void *)(v1 + OBJC_IVAR___DOCUIPBrowserState__impl + 8) = result;
  return result;
}

uint64_t (*DOCUIPBrowserState.documentLandingMode.modify())()
{
  return nullsub_1;
}

void DOCUIPBrowserState.init()(void *a1@<X8>)
{
  *a1 = -1;
  a1[1] = -1;
}

uint64_t sub_213699CC4(char *a1, char *a2)
{
  return sub_213699CD0(*a1, *a2);
}

uint64_t sub_213699CD0(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    unint64_t v3 = 0xD000000000000013;
  }
  else {
    unint64_t v3 = 0x4D746E65746E6F63;
  }
  if (v2) {
    unint64_t v4 = 0xEB0000000065646FLL;
  }
  else {
    unint64_t v4 = 0x80000002136A6810;
  }
  if (a2) {
    unint64_t v5 = 0xD000000000000013;
  }
  else {
    unint64_t v5 = 0x4D746E65746E6F63;
  }
  if (a2) {
    unint64_t v6 = 0x80000002136A6810;
  }
  else {
    unint64_t v6 = 0xEB0000000065646FLL;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_21369F6B8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_213699D84()
{
  return sub_21369F6E8();
}

uint64_t sub_213699E14()
{
  sub_21369F5F8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_213699E90()
{
  return sub_21369F6E8();
}

uint64_t sub_213699F1C@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_21369F688();
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 == 1) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  if (!v2) {
    char v4 = 0;
  }
  *a1 = v4;
  return result;
}

void sub_213699F7C(unint64_t *a1@<X8>)
{
  unint64_t v2 = 0x4D746E65746E6F63;
  if (*v1) {
    unint64_t v2 = 0xD000000000000013;
  }
  unint64_t v3 = 0x80000002136A6810;
  if (!*v1) {
    unint64_t v3 = 0xEB0000000065646FLL;
  }
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_213699FC8()
{
  if (*v0) {
    return 0xD000000000000013;
  }
  else {
    return 0x4D746E65746E6F63;
  }
}

uint64_t sub_21369A010@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_21369F688();
  uint64_t result = swift_bridgeObjectRelease();
  if (v2 == 1) {
    char v4 = 1;
  }
  else {
    char v4 = 2;
  }
  if (!v2) {
    char v4 = 0;
  }
  *a1 = v4;
  return result;
}

uint64_t sub_21369A074()
{
  return 0;
}

void sub_21369A080(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_21369A08C(uint64_t a1)
{
  unint64_t v2 = sub_21369A394();
  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_21369A0C8(uint64_t a1)
{
  unint64_t v2 = sub_21369A394();
  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t DOCUIPBrowserState.encode(to:)(void *a1)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2677EDBF0);
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  char v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *v1;
  uint64_t v10 = v1[1];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21369A394();
  sub_21369F708();
  uint64_t v12 = v8;
  char v11 = 0;
  type metadata accessor for DOCUIPBrowserContentMode(0);
  sub_21369A458(&qword_2677EDC00, type metadata accessor for DOCUIPBrowserContentMode);
  sub_21369F6A8();
  if (!v2)
  {
    uint64_t v12 = v10;
    char v11 = 1;
    type metadata accessor for DOCUIPDocumentLandingMode(0);
    sub_21369A458(&qword_2677EDC08, type metadata accessor for DOCUIPDocumentLandingMode);
    sub_21369F6A8();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_21369A394()
{
  unint64_t result = qword_2677EDBF8;
  if (!qword_2677EDBF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2677EDBF8);
  }
  return result;
}

void type metadata accessor for DOCUIPBrowserContentMode(uint64_t a1)
{
}

void type metadata accessor for DOCUIPDocumentLandingMode(uint64_t a1)
{
}

void sub_21369A410(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_21369A458(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t DOCUIPBrowserState.init(from:)@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2677EDC10);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_21369A394();
  sub_21369F6F8();
  if (!v2)
  {
    type metadata accessor for DOCUIPBrowserContentMode(0);
    char v13 = 0;
    sub_21369A458(&qword_2677EDC18, type metadata accessor for DOCUIPBrowserContentMode);
    sub_21369F698();
    uint64_t v9 = v14;
    type metadata accessor for DOCUIPDocumentLandingMode(0);
    char v13 = 1;
    sub_21369A458(&qword_2677EDC20, type metadata accessor for DOCUIPDocumentLandingMode);
    sub_21369F698();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    uint64_t v10 = v14;
    *a2 = v9;
    a2[1] = v10;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_21369A730(void *a1)
{
  return DOCUIPBrowserState.encode(to:)(a1);
}

uint64_t sub_21369A748@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  return DOCUIPBrowserState.init(from:)(a1, a2);
}

void __swiftcall DOCUIPBrowserState.init()(DOCUIPBrowserState *__return_ptr retstr)
{
  id v1 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  objc_msgSend(v1, sel_init);
}

id DOCUIPBrowserState.init()()
{
  id v1 = (void *)(v0 + OBJC_IVAR___DOCUIPBrowserState__impl);
  *id v1 = -1;
  v1[1] = -1;
  v3.super_class = (Class)DOCUIPBrowserState;
  return objc_msgSendSuper2(&v3, sel_init);
}

id sub_21369A870@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_contentMode);
  *a2 = result;
  return result;
}

id sub_21369A8A4(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setContentMode_, *a1);
}

id sub_21369A908@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = objc_msgSend(*a1, sel_documentLandingMode);
  *a2 = result;
  return result;
}

id sub_21369A93C(void *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setDocumentLandingMode_, *a1);
}

void __swiftcall DOCUIPBrowserState.init(coder:)(DOCUIPBrowserState_optional *__return_ptr retstr, NSCoder coder)
{
}

id DOCUIPBrowserState.init(coder:)(void *a1)
{
  objc_super v3 = &v1[OBJC_IVAR___DOCUIPBrowserState__impl];
  *(void *)objc_super v3 = -1;
  *((void *)v3 + 1) = -1;
  uint64_t v4 = v1;
  sub_21369AA6C(1819307369, 0xE400000000000000, (uint64_t)&v9);
  if (v10 == 1)
  {

    type metadata accessor for DOCUIPBrowserState(v5);
    swift_deallocPartialClassInstance();
    return 0;
  }
  else
  {
    *(_OWORD *)objc_super v3 = v9;

    v8.receiver = v4;
    v8.super_class = (Class)DOCUIPBrowserState;
    id v6 = objc_msgSendSuper2(&v8, sel_init);
  }
  return v6;
}

uint64_t sub_21369AA6C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  sub_21369B76C(0, &qword_2677EDCD8);
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  swift_bridgeObjectRetain();
  sub_21369F608();
  id v6 = (void *)sub_21369F658();
  uint64_t result = swift_bridgeObjectRelease();
  if (!v6) {
    goto LABEL_3;
  }
  uint64_t v8 = sub_21369F5D8();
  unint64_t v10 = v9;

  id v11 = objc_allocWithZone(MEMORY[0x263F08928]);
  sub_21369B868(v8, v10);
  id v12 = sub_21369B7A8();
  sub_21369B8C0(v8, v10);
  if (!v12)
  {
    uint64_t result = sub_21369B8C0(v8, v10);
LABEL_3:
    *(void *)a3 = 0;
    *(void *)(a3 + 8) = 0;
    *(unsigned char *)(a3 + 16) = 1;
    return result;
  }
  sub_21369B918();
  sub_21369F648();
  *(void *)a3 = v13;
  *(void *)(a3 + 8) = v14;
  *(unsigned char *)(a3 + 16) = (v15 & 1) != 0;
  objc_msgSend(v12, sel_finishDecoding, v13);

  return sub_21369B8C0(v8, v10);
}

uint64_t type metadata accessor for DOCUIPBrowserState(uint64_t a1)
{
  return sub_21369B76C(a1, &qword_2677EDC90);
}

void sub_21369AC4C()
{
  id v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F08910]), sel_initRequiringSecureCoding_, 1);
  sub_21369B718();
  sub_21369F638();
  objc_msgSend(v1, sel_finishEncoding);
  id v2 = objc_msgSend(v1, sel_encodedData);
  if (v2)
  {
    objc_super v3 = v2;
    swift_bridgeObjectRetain();
    sub_21369F608();
    uint64_t v4 = (void *)sub_21369F5E8();
    swift_bridgeObjectRelease();
    objc_msgSend(v0, sel_encodeObject_forKey_, v3, v4);
  }
  else
  {
    __break(1u);
  }
}

uint64_t DOCUIPBrowserState.debugDescription.getter()
{
  sub_21369F668();
  sub_21369F608();
  objc_msgSend(v0, sel_contentMode);
  type metadata accessor for DOCUIPBrowserContentMode(0);
  sub_21369F678();
  sub_21369F608();
  objc_msgSend(v0, sel_documentLandingMode);
  type metadata accessor for DOCUIPDocumentLandingMode(0);
  sub_21369F678();
  sub_21369F608();
  return 0;
}

void __swiftcall DOCUIPBrowserState._bridgeToObjectiveC()(DOCUIPBrowserState *__return_ptr retstr)
{
  uint64_t v2 = *v1;
  uint64_t v3 = v1[1];
  uint64_t v4 = (char *)objc_msgSend(objc_allocWithZone((Class)DOCUIPBrowserState), sel_init);
  uint64_t v5 = &v4[OBJC_IVAR___DOCUIPBrowserState__impl];
  *(void *)uint64_t v5 = v2;
  *((void *)v5 + 1) = v3;
}

__n128 static DOCUIPBrowserState._forceBridgeFromObjectiveC(_:result:)(uint64_t a1, __n128 *a2)
{
  __n128 result = *(__n128 *)(a1 + OBJC_IVAR___DOCUIPBrowserState__impl);
  *a2 = result;
  a2[1].n128_u8[0] = 0;
  return result;
}

uint64_t static DOCUIPBrowserState._conditionallyBridgeFromObjectiveC(_:result:)(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a2 = *(_OWORD *)(a1 + OBJC_IVAR___DOCUIPBrowserState__impl);
  *(unsigned char *)(a2 + 16) = 0;
  return 1;
}

uint64_t static DOCUIPBrowserState._unconditionallyBridgeFromObjectiveC(_:)@<X0>(uint64_t result@<X0>, _OWORD *a2@<X8>)
{
  if (result) {
    *a2 = *(_OWORD *)(result + OBJC_IVAR___DOCUIPBrowserState__impl);
  }
  else {
    __break(1u);
  }
  return result;
}

char *sub_21369B048()
{
  uint64_t v1 = *v0;
  uint64_t v2 = v0[1];
  __n128 result = (char *)objc_msgSend(objc_allocWithZone((Class)DOCUIPBrowserState), sel_init);
  uint64_t v4 = &result[OBJC_IVAR___DOCUIPBrowserState__impl];
  *(void *)uint64_t v4 = v1;
  *((void *)v4 + 1) = v2;
  return result;
}

__n128 sub_21369B090(uint64_t a1, __n128 *a2)
{
  __n128 result = *(__n128 *)(a1 + OBJC_IVAR___DOCUIPBrowserState__impl);
  *a2 = result;
  a2[1].n128_u8[0] = 0;
  return result;
}

uint64_t sub_21369B0A8(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a2 = *(_OWORD *)(a1 + OBJC_IVAR___DOCUIPBrowserState__impl);
  *(unsigned char *)(a2 + 16) = 0;
  return 1;
}

uint64_t sub_21369B0C4@<X0>(uint64_t result@<X0>, _OWORD *a2@<X8>)
{
  if (result) {
    *a2 = *(_OWORD *)(result + OBJC_IVAR___DOCUIPBrowserState__impl);
  }
  else {
    __break(1u);
  }
  return result;
}

uint64_t DOCUIPBrowserContentMode.debugDescription.getter(uint64_t a1)
{
  uint64_t v1 = a1 + 1;
  uint64_t result = 0x6669636570736E75;
  switch(v1)
  {
    case 0:
      return result;
    case 1:
      uint64_t result = 0x73746E65636572;
      break;
    case 2:
      uint64_t result = 0x646572616873;
      break;
    case 3:
      uint64_t result = 0x726573776F7262;
      break;
    default:
      type metadata accessor for DOCUIPBrowserContentMode(0);
      sub_21369F6C8();
      __break(1u);
      JUMPOUT(0x21369B1A8);
  }
  return result;
}

uint64_t sub_21369B1B8()
{
  uint64_t result = 0x6669636570736E75;
  switch(*v0)
  {
    case 0xFFFFFFFFFFFFFFFFLL:
      return result;
    case 0:
      uint64_t result = 0x73746E65636572;
      break;
    case 1:
      uint64_t result = 0x646572616873;
      break;
    case 2:
      uint64_t result = 0x726573776F7262;
      break;
    default:
      sub_21369F6C8();
      __break(1u);
      JUMPOUT(0x21369B27CLL);
  }
  return result;
}

uint64_t DOCUIPDocumentLandingMode.debugDescription.getter(uint64_t a1)
{
  switch(a1)
  {
    case -1:
      return 0x6669636570736E75;
    case 1:
      unsigned int v1 = 1852401763;
      return v1 | 0x6F72622D00000000;
    case 0:
      unsigned int v1 = 1819047270;
      return v1 | 0x6F72622D00000000;
  }
  type metadata accessor for DOCUIPDocumentLandingMode(0);
  uint64_t result = sub_21369F6C8();
  __break(1u);
  return result;
}

uint64_t sub_21369B328()
{
  uint64_t v1 = *v0;
  if (*v0 == -1) {
    return 0x6669636570736E75;
  }
  if (v1 == 1)
  {
    unsigned int v2 = 1852401763;
  }
  else
  {
    if (v1)
    {
      uint64_t result = sub_21369F6C8();
      __break(1u);
      return result;
    }
    unsigned int v2 = 1819047270;
  }
  return v2 | 0x6F72622D00000000;
}

char *keypath_get_selector_contentMode()
{
  return sel_contentMode;
}

char *keypath_get_selector_documentLandingMode()
{
  return sel_documentLandingMode;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for DOCUIPBrowserState(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for DOCUIPBrowserState(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 16) = v3;
  return result;
}

ValueMetadata *type metadata accessor for DOCUIPBrowserState()
{
  return &type metadata for DOCUIPBrowserState;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for DOCUIPBrowserState.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for DOCUIPBrowserState.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *__n128 result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x21369B5A8);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *__n128 result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t sub_21369B5D0(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_21369B5D8(unsigned char *result, char a2)
{
  *__n128 result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for DOCUIPBrowserState.CodingKeys()
{
  return &type metadata for DOCUIPBrowserState.CodingKeys;
}

unint64_t sub_21369B5F8()
{
  unint64_t result = qword_2677EDCA8;
  if (!qword_2677EDCA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2677EDCA8);
  }
  return result;
}

void *sub_21369B64C@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_21369B65C(void *a1@<X8>)
{
  *a1 = *v1;
}

unint64_t sub_21369B66C()
{
  unint64_t result = qword_2677EDCB0;
  if (!qword_2677EDCB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2677EDCB0);
  }
  return result;
}

unint64_t sub_21369B6C4()
{
  unint64_t result = qword_2677EDCB8;
  if (!qword_2677EDCB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2677EDCB8);
  }
  return result;
}

unint64_t sub_21369B718()
{
  unint64_t result = qword_2677EDCC0;
  if (!qword_2677EDCC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2677EDCC0);
  }
  return result;
}

uint64_t sub_21369B76C(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

id sub_21369B7A8()
{
  v6[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v1 = (void *)sub_21369F5C8();
  v6[0] = 0;
  id v2 = objc_msgSend(v0, sel_initForReadingFromData_error_, v1, v6);

  if (v2)
  {
    id v3 = v6[0];
  }
  else
  {
    id v4 = v6[0];
    sub_21369F5B8();

    swift_willThrow();
  }
  return v2;
}

uint64_t sub_21369B868(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }
  return swift_retain();
}

uint64_t sub_21369B8C0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }
  return swift_release();
}

unint64_t sub_21369B918()
{
  unint64_t result = qword_2677EDCE0;
  if (!qword_2677EDCE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_2677EDCE0);
  }
  return result;
}

void DOCLogAssertionFailureMessage_Swift_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_213670000, a2, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v2, 0xCu);
}

void __LoadCrashSupportIfNecessary_block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_213670000, log, OS_LOG_TYPE_ERROR, "Unable to load CrashReporterSupport framework.", v1, 2u);
}

void DOCContentTypesReadableByApplicationWithBundleIdentifier_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_213670000, a2, OS_LOG_TYPE_ERROR, "No application found for bundle identifier %@", (uint8_t *)&v2, 0xCu);
}

void DOCContentTypesReadableByApplicationWithBundleIdentifier_cold_2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_213670000, log, OS_LOG_TYPE_ERROR, "No supported document types specified.", v1, 2u);
}

void DOCShouldApplicationShowRecentsPopover_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_213670000, a2, OS_LOG_TYPE_DEBUG, "%@ does not open any content types.", (uint8_t *)&v2, 0xCu);
}

void DOCShouldApplicationShowRecentsPopover_cold_2(uint64_t a1, void *a2, char a3)
{
  uint64_t v4 = NSNumber;
  id v5 = a2;
  unsigned int v6 = [v4 numberWithBool:a3 & 1];
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_213670000, v7, v8, "%@ supports popovers: %@", v9, v10, v11, v12, v13);
}

void DOCShouldApplicationShowRecentsPopover_cold_3(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_213670000, log, OS_LOG_TYPE_DEBUG, "%@ can open: %@", (uint8_t *)&v3, 0x16u);
}

void DOCShouldApplicationShowRecentsPopover_cold_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = NSNumber;
  id v5 = a2;
  uint64_t v6 = objc_msgSend(v4, "numberWithInt:", objc_msgSend(a3, "count") != 0);
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_1_1(&dword_213670000, v7, v8, "%@ supports recent documents: %@", v9, v10, v11, v12, v13);
}

void DOCShouldApplicationShowRecentsPopover_cold_5(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_213670000, a2, OS_LOG_TYPE_DEBUG, "%@ doesn't support open in place, so no recents popover.", (uint8_t *)&v2, 0xCu);
}

void DOCRunInMainThread_cold_1()
{
  __assert_rtn("DOCRunInMainThread", "DOCDocumentManagerCoreUtilities.m", 104, "block != nil");
}

uint64_t sub_21369F5A8()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_21369F5B8()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_21369F5C8()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_21369F5D8()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_21369F5E8()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_21369F5F8()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_21369F608()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_21369F618()
{
  return MEMORY[0x270F9DA98]();
}

uint64_t sub_21369F628()
{
  return MEMORY[0x270F9DB18]();
}

uint64_t sub_21369F638()
{
  return MEMORY[0x270EF1F18]();
}

uint64_t sub_21369F648()
{
  return MEMORY[0x270EF1F58]();
}

uint64_t sub_21369F658()
{
  return MEMORY[0x270EF20F8]();
}

uint64_t sub_21369F668()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_21369F678()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_21369F688()
{
  return MEMORY[0x270F9F230]();
}

uint64_t sub_21369F698()
{
  return MEMORY[0x270F9F318]();
}

uint64_t sub_21369F6A8()
{
  return MEMORY[0x270F9F458]();
}

uint64_t sub_21369F6B8()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_21369F6C8()
{
  return MEMORY[0x270F9FA68]();
}

uint64_t sub_21369F6D8()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_21369F6E8()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_21369F6F8()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_21369F708()
{
  return MEMORY[0x270F9FD98]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

void CFRelease(CFTypeRef cf)
{
}

CFArrayRef CGImageDestinationCopyTypeIdentifiers(void)
{
  return (CFArrayRef)MEMORY[0x270EF4F18]();
}

CFArrayRef CGImageSourceCopyTypeIdentifiers(void)
{
  return (CFArrayRef)MEMORY[0x270EF5008]();
}

uint64_t FPIsCloudDocsWithFPFSEnabled()
{
  return MEMORY[0x270EEBB08]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x270F95FE8]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x270EFDCB0](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x270EFDCD0](allocator);
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

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
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

void arc4random_buf(void *__buf, size_t __nbytes)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x270ED9718]();
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x270EDA760](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x270F9A648](object, key);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x270EDAA60](log);
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x270FA03D0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}