uint64_t DDSObjectsAreEqualOrNil(unint64_t a1, uint64_t a2)
{
  if (a1 | a2) {
    return [(id)a1 isEqual:a2];
  }
  else {
    return 1;
  }
}

void sub_1E41D8C54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL DDS_LOG_REDACTED()
{
  v0 = DefaultLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
  {
    BOOL v1 = 1;
  }
  else
  {
    v2 = QueryLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      BOOL v1 = 1;
    }
    else
    {
      v3 = UpdateLog();
      BOOL v1 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
    }
  }

  return v1;
}

id QueryLog()
{
  if (QueryLog_onceToken != -1) {
    dispatch_once(&QueryLog_onceToken, &__block_literal_global_4);
  }
  v0 = (void *)QueryLog_logFacility;
  return v0;
}

id DefaultLog()
{
  if (DefaultLog_onceToken != -1) {
    dispatch_once(&DefaultLog_onceToken, &__block_literal_global_3);
  }
  v0 = (void *)DefaultLog_logFacility;
  return v0;
}

id UpdateLog()
{
  if (UpdateLog_onceToken != -1) {
    dispatch_once(&UpdateLog_onceToken, &__block_literal_global_7);
  }
  v0 = (void *)UpdateLog_logFacility;
  return v0;
}

void sub_1E41DA200(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t DDS_IS_INTERNAL_INSTALL()
{
  if (DDS_IS_INTERNAL_INSTALL_once_token != -1) {
    dispatch_once(&DDS_IS_INTERNAL_INSTALL_once_token, &__block_literal_global_1);
  }
  return DDS_IS_INTERNAL_INSTALL_is_internal_install;
}

__CFString *shortNameWithAttributes(void *a1)
{
  id v1 = a1;
  v2 = [v1 objectForKey:@"LinguisticAssetType"];
  if (v2
    || ([v1 objectForKey:@"AssetType"], (v2 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v3 = [&stru_1F3FA8828 stringByAppendingString:v2];
  }
  else
  {
    v3 = &stru_1F3FA8828;
  }
  uint64_t v4 = [v1 objectForKey:@"AssetLocale"];
  v5 = (void *)v4;
  if (v4)
  {
    uint64_t v6 = [(__CFString *)v3 stringByAppendingFormat:@"-%@", v4];

    v3 = (__CFString *)v6;
  }

  return v3;
}

__CFString *assetUUIDWithLocalURL(void *a1)
{
  id v1 = [a1 pathComponents];
  if ((unint64_t)[v1 count] < 2)
  {
    v2 = &stru_1F3FA8828;
  }
  else
  {
    objc_msgSend(v1, "objectAtIndexedSubscript:", objc_msgSend(v1, "count") - 2);
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v2;
}

__CFString *uniqueIdentifierWithAttributes(void *a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  v2 = [v1 objectForKey:@"LinguisticAssetType"];
  if (v2
    || ([v1 objectForKey:@"AssetType"], (v2 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v3 = [&stru_1F3FA8828 stringByAppendingString:v2];
  }
  else
  {
    v3 = &stru_1F3FA8828;
  }
  uint64_t v4 = [v1 objectForKey:@"AssetLocale"];
  if (v4)
  {
    uint64_t v5 = [NSString stringWithFormat:@"%@-%@", v4, v3];

    v3 = (__CFString *)v5;
  }
  uint64_t v6 = [v1 objectForKey:@"AssetRegion"];
  if (v6)
  {
    v17 = v4;
    id v18 = v1;
    v7 = [MEMORY[0x1E4F28E78] string];
    [v7 appendString:@"{ "];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v8 = [v6 allKeys];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          v14 = [v6 objectForKeyedSubscript:v13];
          [v7 appendFormat:@"%@ : %@, ", v13, v14];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v10);
    }

    [v7 appendString:@"}"];
    uint64_t v15 = [(__CFString *)v3 stringByAppendingFormat:@"-%@", v7];

    v3 = (__CFString *)v15;
    uint64_t v4 = v17;
    id v1 = v18;
  }

  return v3;
}

uint64_t __UpdateLog_block_invoke()
{
  UpdateLog_logFacility = (uint64_t)os_log_create("com.apple.DataDeliveryServices", "Update");
  return MEMORY[0x1F41817F8]();
}

uint64_t __QueryLog_block_invoke()
{
  QueryLog_logFacility = (uint64_t)os_log_create("com.apple.DataDeliveryServices", "Query");
  return MEMORY[0x1F41817F8]();
}

uint64_t __DefaultLog_block_invoke()
{
  DefaultLog_logFacility = (uint64_t)os_log_create("com.apple.DataDeliveryServices", "Default");
  return MEMORY[0x1F41817F8]();
}

void sub_1E41DDDF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void _DDSBeginMocking()
{
  __isMocking = 1;
}

void _DDSEndMocking()
{
  __isMocking = 0;
}

uint64_t _DDSIsMocking()
{
  return __isMocking;
}

void _DDSBeginMockingServices()
{
  __isMockingServices = 1;
}

void _DDSEndMockingServices()
{
  __isMockingServices = 0;
}

uint64_t _DDSIsMockingServices()
{
  return __isMockingServices;
}

void sub_1E41DEDC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

uint64_t DDS_USE_MA_V2()
{
  return MEMORY[0x1F40C9FB0]("Keyboards", "DataDeliveryServices");
}

id DDS_BUILD_VERSION_STRING()
{
  if (DDS_BUILD_VERSION_STRING_onceToken != -1) {
    dispatch_once(&DDS_BUILD_VERSION_STRING_onceToken, &__block_literal_global_14);
  }
  v0 = (void *)DDS_BUILD_VERSION_STRING_build;
  return v0;
}

id DDS_STRING_FROM_DATE(void *a1)
{
  uint64_t v1 = DDS_STRING_FROM_DATE_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&DDS_STRING_FROM_DATE_onceToken, &__block_literal_global_19);
  }
  v3 = [(id)DDS_STRING_FROM_DATE_formatter stringFromDate:v2];

  return v3;
}

id DDSAssetDownloadUIError(void *a1)
{
  switch((unint64_t)a1)
  {
    case 0uLL:
      v3 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v4 = &unk_1F3FB2248;
      uint64_t v5 = 0;
      goto LABEL_10;
    case 1uLL:
      v3 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v4 = &unk_1F3FB2270;
      uint64_t v5 = 1;
      goto LABEL_10;
    case 2uLL:
      v3 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v4 = &unk_1F3FB2298;
      uint64_t v5 = 2;
      goto LABEL_10;
    case 3uLL:
      v3 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v4 = &unk_1F3FB22C0;
      uint64_t v5 = 3;
      goto LABEL_10;
    case 4uLL:
      v3 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v4 = &unk_1F3FB22E8;
      uint64_t v5 = 4;
LABEL_10:
      a1 = objc_msgSend(v3, "errorWithDomain:code:userInfo:", @"DDSAssetDownloadUIErrorDomain", v5, v4, v1);
      break;
    default:
      break;
  }
  return a1;
}

uint64_t DDSTrialErrorWithCode(uint64_t a1)
{
  return [MEMORY[0x1E4F28C58] errorWithDomain:@"DDSTrialErrorDomain" code:a1 userInfo:0];
}

void *DDSReadCompatabilityVersionFromFile(void *a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = [@"/System/Library/LinguisticData" stringByAppendingPathComponent:v1];
  v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v4 = [v3 fileExistsAtPath:v2];

  if (!v4) {
    goto LABEL_5;
  }
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v2 options:1 error:0];
  if (!v5) {
    goto LABEL_6;
  }
  uint64_t v6 = [MEMORY[0x1E4F28F98] propertyListWithData:v5 options:0 format:0 error:0];
  v7 = [v6 objectForKey:@"MobileAssetProperties"];
  v8 = [v7 objectForKey:@"_CompatibilityVersion"];

  if (v8)
  {
    uint64_t v5 = (void *)[v8 integerValue];
  }
  else
  {
LABEL_5:
    uint64_t v5 = 0;
  }
LABEL_6:
  uint64_t v9 = DefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 134218242;
    v12 = v5;
    __int16 v13 = 2112;
    id v14 = v1;
    _os_log_impl(&dword_1E41D6000, v9, OS_LOG_TYPE_DEFAULT, "Supported compatibility version = %ld in file: %@", (uint8_t *)&v11, 0x16u);
  }

  return v5;
}

id DDSReadSupportedPriorityAssetSpecifiersFromFile(void *a1)
{
  id v1 = (void *)MEMORY[0x1E4F1CA80];
  id v2 = a1;
  v3 = [v1 set];
  int v4 = [@"/System/Library/LinguisticData" stringByAppendingPathComponent:v2];

  uint64_t v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v6 = [v5 fileExistsAtPath:v4];

  if (v6)
  {
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v4 options:1 error:0];
    if (v7)
    {
      v8 = [MEMORY[0x1E4F28F98] propertyListWithData:v7 options:0 format:0 error:0];
      uint64_t v9 = [v8 objectForKey:@"MobileAssetProperties"];
      uint64_t v10 = [v9 objectForKey:@"PriorityAssetSpecifiers"];
      if (v10) {
        [v3 addObjectsFromArray:v10];
      }
    }
  }

  return v3;
}

void sub_1E41E04B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_1E41E32F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

CFStringRef DDSGetPreferenceIntForKey(const __CFString *result)
{
  if (result) {
    return (const __CFString *)CFPreferencesGetAppIntegerValue(result, @"com.apple.DataDeliveryServices", 0);
  }
  return result;
}

__CFString *DDSGetPreferenceObjectForKey(__CFString *a1)
{
  if (a1)
  {
    a1 = (__CFString *)CFPreferencesCopyAppValue(a1, @"com.apple.DataDeliveryServices");
    uint64_t v1 = vars8;
  }
  return a1;
}

CFStringRef DDSSetPreferenceObjectForKey(const __CFString *result, const void *a2)
{
  if (result)
  {
    CFPreferencesSetAppValue(result, a2, @"com.apple.DataDeliveryServices");
    return (const __CFString *)CFPreferencesAppSynchronize(@"com.apple.DataDeliveryServices");
  }
  return result;
}

void sub_1E41E4398(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_1E41E458C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E41E7CF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id AutoAssetLog()
{
  if (AutoAssetLog_onceToken != -1) {
    dispatch_once(&AutoAssetLog_onceToken, &__block_literal_global_10_0);
  }
  v0 = (void *)AutoAssetLog_logFacility;
  return v0;
}

uint64_t __AutoAssetLog_block_invoke()
{
  AutoAssetLog_logFacility = (uint64_t)os_log_create("com.apple.DataDeliveryServices", "AutoAsset");
  return MEMORY[0x1F41817F8]();
}

void sub_1E41E9600(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
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

void assetUpdatedNotificationCallback(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  v8 = DefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = v7;
    _os_log_impl(&dword_1E41D6000, v8, OS_LOG_TYPE_DEFAULT, "User info in callback: %@", buf, 0xCu);
  }

  id v9 = a3;
  id v10 = [v9 stringByReplacingOccurrencesOfString:@".dds.assets-updated" withString:&stru_1F3FA8828];
  if (a2)
  {
    int v11 = a2;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v12 = [v11 autoAssetTypes];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      long long v21 = v10;
      uint64_t v15 = *(void *)v23;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v23 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          id v18 = objc_msgSend(MEMORY[0x1E4F77FD0], "notifyRegistrationName:forAssetType:", @"ASSET_VERSION_DOWNLOADED", v17, v21);
          if ([v18 isEqualToString:v9])
          {
            id v10 = v17;

            goto LABEL_14;
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v30 count:16];
        if (v14) {
          continue;
        }
        break;
      }
      id v10 = v21;
    }
LABEL_14:

    long long v19 = DefaultLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v27 = v9;
      __int16 v28 = 2112;
      id v29 = v10;
      _os_log_impl(&dword_1E41D6000, v19, OS_LOG_TYPE_DEFAULT, "Observed asset change notification: %@, type: %@", buf, 0x16u);
    }

    long long v20 = [v11 delegate];
    [v20 serverDidUpdateAssetsWithType:v10];
  }
  else
  {
    int v11 = DefaultLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E41D6000, v11, OS_LOG_TYPE_DEFAULT, "Unexpected nil AssetObserver in CFNotification callback", buf, 2u);
    }
  }
}

void sub_1E41EBE90(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
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

void sub_1E41EC488(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
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

void sub_1E41EF438(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void sub_1E41EF5F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E41EFCEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1E41F0144(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E41F0748(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E41F1044(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E41F1510(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E41F1658(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_1E41F262C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  objc_destroyWeak((id *)(v10 - 56));
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

void sub_1E41F38D8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1E41F5250(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1E41F6458(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1E41F65C4(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_1E41F6C9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1E41F6F60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

void sub_1E41F7410(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1E41F758C(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_1E41F8B28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1E41F8F90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose((const void *)(v31 - 160), 8);
  _Block_object_dispose(&a31, 8);
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

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1F41138B8]();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1F40D7420]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1F40D7B80](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1F40D7E90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE8](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t MACleanV1Repository()
{
  return MEMORY[0x1F412F578]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1F417CDE0]();
}

uint64_t MGCopyAnswerWithError()
{
  return MEMORY[0x1F417CDE8]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x1F40E7110]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
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

double __exp10(double a1)
{
  MEMORY[0x1F40C9B90](a1);
  return result;
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint32_t arc4random(void)
{
  return MEMORY[0x1F40CA3A8]();
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

long double log10(long double __x)
{
  MEMORY[0x1F40CC880](__x);
  return result;
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCD8](__s, *(void *)&__c, __n);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F4181798](a1, a2);
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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
  return (id)MEMORY[0x1F4181A18](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}