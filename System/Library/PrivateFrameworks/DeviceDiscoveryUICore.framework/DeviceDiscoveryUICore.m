__CFString *DDUINotificationResultString(unint64_t a1)
{
  if (a1 > 5) {
    return @"Unexpected Response!";
  }
  else {
    return off_1E685F820[a1];
  }
}

os_log_t _DDUICoreLog()
{
  os_log_t v0 = os_log_create("com.apple.DeviceDiscoveryUI", "core");
  return v0;
}

id DDUICorePrimaryQueue()
{
  if (DDUICorePrimaryQueue_onceToken != -1) {
    dispatch_once(&DDUICorePrimaryQueue_onceToken, &__block_literal_global);
  }
  os_log_t v0 = (void *)DDUICorePrimaryQueue_primaryQueue;
  return v0;
}

void __DDUICorePrimaryQueue_block_invoke()
{
  attr = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  os_log_t v0 = dispatch_get_global_queue(25, 0);
  dispatch_queue_t v1 = dispatch_queue_create_with_target_V2("com.apple.DeviceDiscoveryUI.queue", attr, v0);
  v2 = (void *)DDUICorePrimaryQueue_primaryQueue;
  DDUICorePrimaryQueue_primaryQueue = (uint64_t)v1;
}

__CFString *DDUILocalizedString(void *a1)
{
  id v1 = a1;
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.DeviceDiscoveryUI"];
  v3 = v2;
  if (v2)
  {
    v4 = [v2 localizedStringForKey:v1 value:&stru_1F264DD98 table:0];
  }
  else
  {
    v4 = &stru_1F264DD98;
  }

  return v4;
}

__CFString *DDUICoreLocalizedString(void *a1)
{
  id v1 = a1;
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.DeviceDiscoveryUICore"];
  v3 = v2;
  if (v2)
  {
    v4 = [v2 localizedStringForKey:v1 value:&stru_1F264DD98 table:0];
  }
  else
  {
    v4 = &stru_1F264DD98;
  }

  return v4;
}

__CFString *DDUILocalizedUsageStringForBundle(__CFBundle *a1, uint64_t a2, void *a3)
{
  v5 = NSString;
  v6 = a3;
  v7 = (__CFString *)CFBundleCopyLocalizedString(a1, (CFStringRef)[v5 stringWithFormat:@"%@-UsageDescription", a2], v6, @"InfoPlist");

  return v7;
}

id DDUILocalizedUsageStringWithSuffixForBundle(__CFBundle *a1, uint64_t a2, uint64_t a3, void *a4)
{
  v7 = NSString;
  id v8 = a4;
  v9 = [v7 stringWithFormat:@"%@-%@", a2, a3];
  v10 = DDUILocalizedUsageStringForBundle(a1, (uint64_t)v9, v8);

  return v10;
}

id DDUIBuildLocalizedKeyForDeviceTypes(void *a1, char a2)
{
  id v3 = a1;
  id v4 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v5 = v4;
  if ((a2 & 8) != 0)
  {
    [v4 appendString:@"_WATCH"];
    if ((a2 & 1) == 0)
    {
LABEL_3:
      if ((a2 & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((a2 & 1) == 0)
  {
    goto LABEL_3;
  }
  [v5 appendString:@"_PHONE"];
  if ((a2 & 2) != 0) {
LABEL_4:
  }
    [v5 appendString:@"_PAD"];
LABEL_5:
  v6 = [NSString stringWithFormat:@"%@%@", v3, v5, 0];

  return v6;
}

_DDUIRapportPairingTransport *DDUIEndpointPairingBrowsingTransportForOptions(uint64_t a1)
{
  if (a1)
  {
    id v3 = [[_DDUIRapportPairingTransport alloc] initWithMode:0];
  }
  else
  {
    v2 = _DDUICoreLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      DDUIEndpointPairingBrowsingTransportForOptions_cold_1(a1, v2);
    }

    id v3 = 0;
  }
  return v3;
}

_DDUIRapportPairingTransport *DDUIEndpointPairingListeningTransportForOptions(uint64_t a1)
{
  if (a1)
  {
    id v3 = [[_DDUIRapportPairingTransport alloc] initWithMode:1];
  }
  else
  {
    v2 = _DDUICoreLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      DDUIEndpointPairingListeningTransportForOptions_cold_1(a1, v2);
    }

    id v3 = 0;
  }
  return v3;
}

os_log_t _DDUICoreRapportLog()
{
  os_log_t v0 = os_log_create("com.apple.DeviceDiscoveryUI", "rapport");
  return v0;
}

void sub_1CFC75CA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CFC76410(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1CFC76858(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_1CFC77900(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  uint64_t result = MEMORY[0x1D25DB000](*(void *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_1CFC78220(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_1CFC791AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CFC79428(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1CFC797F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id UnsupportedErrorWithDescription(void *a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v1 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v2 = *MEMORY[0x1E4F28798];
  uint64_t v8 = *MEMORY[0x1E4F28568];
  v9[0] = a1;
  id v3 = (void *)MEMORY[0x1E4F1C9E8];
  id v4 = a1;
  v5 = [v3 dictionaryWithObjects:v9 forKeys:&v8 count:1];
  v6 = [v1 errorWithDomain:v2 code:19 userInfo:v5];

  return v6;
}

uint64_t initFigContinuityCaptureGetUserPreferenceDisabled()
{
  if (CMCaptureLibrary_sOnce != -1) {
    dispatch_once(&CMCaptureLibrary_sOnce, &__block_literal_global_1);
  }
  os_log_t v0 = (uint64_t (*)())dlsym((void *)CMCaptureLibrary_sLib, "FigContinuityCaptureGetUserPreferenceDisabled");
  softLinkFigContinuityCaptureGetUserPreferenceDisabled = v0;
  return v0();
}

void *__CMCaptureLibrary_block_invoke()
{
  uint64_t result = dlopen("/System/Library/PrivateFrameworks/CMCapture.framework/CMCapture", 2);
  CMCaptureLibrary_sLib = (uint64_t)result;
  return result;
}

Class initCPSDedicatedCameraRequest()
{
  if (CompanionServicesLibrary_sOnce != -1) {
    dispatch_once(&CompanionServicesLibrary_sOnce, &__block_literal_global_65);
  }
  Class result = objc_getClass("CPSDedicatedCameraRequest");
  classCPSDedicatedCameraRequest = (uint64_t)result;
  getCPSDedicatedCameraRequestClass[0] = (uint64_t (*)())CPSDedicatedCameraRequestFunction;
  return result;
}

id CPSDedicatedCameraRequestFunction()
{
  return (id)classCPSDedicatedCameraRequest;
}

void *__CompanionServicesLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/CompanionServices.framework/CompanionServices", 2);
  CompanionServicesLibrary_sLib = (uint64_t)result;
  return result;
}

Class initCPSAuthenticationSession()
{
  if (CompanionServicesLibrary_sOnce != -1) {
    dispatch_once(&CompanionServicesLibrary_sOnce, &__block_literal_global_65);
  }
  Class result = objc_getClass("CPSAuthenticationSession");
  classCPSAuthenticationSession = (uint64_t)result;
  getCPSAuthenticationSessionClass[0] = (uint64_t (*)())CPSAuthenticationSessionFunction;
  return result;
}

id CPSAuthenticationSessionFunction()
{
  return (id)classCPSAuthenticationSession;
}

void sub_1CFC7B06C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location)
{
  objc_destroyWeak(v28);
  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *DDUIEndpointPairingSessionResultString(uint64_t a1)
{
  id v1 = &stru_1F264DD98;
  if (a1 == 1) {
    id v1 = @"Cancelled";
  }
  if (a1) {
    return v1;
  }
  else {
    return @"Accepted";
  }
}

void sub_1CFC7C6E8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 88));
  _Unwind_Resume(a1);
}

void sub_1CFC7CA30(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

uint64_t DDUIDeviceTypeForModelString(void *a1)
{
  id v1 = a1;
  if ([v1 hasPrefix:@"Watch"])
  {
    uint64_t v2 = 8;
  }
  else if (([v1 hasPrefix:@"iPhone"] & 1) != 0 {
         || ([v1 hasPrefix:@"iPod"] & 1) != 0)
  }
  {
    uint64_t v2 = 1;
  }
  else if ([v1 hasPrefix:@"iPad"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 hasPrefix:@"AppleTV"])
  {
    uint64_t v2 = 16;
  }
  else if ([v1 containsString:@"Mac"])
  {
    uint64_t v2 = 4;
  }
  else
  {
    uint64_t v4 = _DDUICoreLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      DDUIDeviceTypeForModelString_cold_1((uint64_t)v1, v4);
    }

    uint64_t v2 = 0;
  }

  return v2;
}

void sub_1CFC7FEDC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 88));
  _Unwind_Resume(a1);
}

void sub_1CFC80394(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1CFC80F18(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 112));
  _Unwind_Resume(a1);
}

DDUIInfoPlist *DDUIInfoPlistFromTopLevelDictionary(void *a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  uint64_t v2 = objc_alloc_init(DDUIInfoPlist);
  id v3 = [v1 objectForKey:@"Browses"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = DDUIInfoPlistServiceMapFromArray(v3);
    [(DDUIInfoPlist *)v2 setBrowsesByIdentifier:v4];
  }
  v5 = [v1 objectForKey:@"Advertises"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = DDUIInfoPlistServiceMapFromArray(v5);
    [(DDUIInfoPlist *)v2 setAdvertisesByIdentifier:v6];
  }
  v7 = _DDUICoreLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412546;
    v10 = v2;
    __int16 v11 = 2112;
    id v12 = v1;
    _os_log_impl(&dword_1CFC71000, v7, OS_LOG_TYPE_INFO, "Loaded info plist %@ from %@", (uint8_t *)&v9, 0x16u);
  }

  return v2;
}

id DDUIInfoPlistServiceMapFromArray(void *a1)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v29 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v2 = v1;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v37 objects:v44 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v38;
    uint64_t v25 = *(void *)v38;
    id v26 = v2;
    do
    {
      uint64_t v6 = 0;
      uint64_t v30 = v4;
      do
      {
        if (*(void *)v38 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v37 + 1) + 8 * v6);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v8 = v7;
          uint64_t v9 = [v8 objectForKey:@"NSApplicationServiceIdentifier"];
          v32 = (void *)v9;
          if (v9 && (uint64_t v10 = v9, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            __int16 v11 = objc_alloc_init(DDUIInfoPlistService);
            uint64_t v12 = v10;
            p_super = &v11->super;
            [(DDUIInfoPlistService *)v11 setIdentifier:v12];
            uint64_t v14 = [v8 objectForKey:@"NSApplicationServiceUsageDescription"];
            objc_opt_class();
            v31 = (void *)v14;
            if (objc_opt_isKindOfClass()) {
              [p_super setUsageDescription:v14];
            }
            v15 = [v8 objectForKey:@"NSApplicationServicePlatformSupport", v25, v26];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v27 = p_super;
              v28 = v8;
              long long v35 = 0u;
              long long v36 = 0u;
              long long v33 = 0u;
              long long v34 = 0u;
              id v16 = v15;
              uint64_t v17 = [v16 countByEnumeratingWithState:&v33 objects:v41 count:16];
              if (v17)
              {
                uint64_t v18 = v17;
                uint64_t v19 = 0;
                uint64_t v20 = *(void *)v34;
                do
                {
                  for (uint64_t i = 0; i != v18; ++i)
                  {
                    if (*(void *)v34 != v20) {
                      objc_enumerationMutation(v16);
                    }
                    v22 = *(void **)(*((void *)&v33 + 1) + 8 * i);
                    objc_opt_class();
                    if (objc_opt_isKindOfClass())
                    {
                      if ([v22 isEqualToString:@"iOS"])
                      {
                        uint64_t v19 = v19 | 1;
                      }
                      else if ([v22 isEqualToString:@"iPadOS"])
                      {
                        uint64_t v19 = v19 | 2;
                      }
                      else if ([v22 isEqualToString:@"watchOS"])
                      {
                        uint64_t v19 = v19 | 8;
                      }
                      else
                      {
                        uint64_t v19 = v19;
                      }
                    }
                  }
                  uint64_t v18 = [v16 countByEnumeratingWithState:&v33 objects:v41 count:16];
                }
                while (v18);
              }
              else
              {
                uint64_t v19 = 0;
              }

              p_super = v27;
              [v27 setDeviceTypes:v19];
              uint64_t v5 = v25;
              id v2 = v26;
              uint64_t v8 = v28;
            }
            v23 = [p_super identifier];
            [v29 setObject:p_super forKey:v23];

            uint64_t v4 = v30;
          }
          else
          {
            p_super = _DDUICoreLog();
            if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v43 = @"NSApplicationServiceIdentifier";
              _os_log_impl(&dword_1CFC71000, p_super, OS_LOG_TYPE_DEFAULT, "Identifier item under %@, is not of class NSString", buf, 0xCu);
            }
          }
        }
        else
        {
          uint64_t v8 = _DDUICoreLog();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v43 = @"NSApplicationServices";
            _os_log_impl(&dword_1CFC71000, v8, OS_LOG_TYPE_DEFAULT, "Top level item under %@, is not of class NSDictionary", buf, 0xCu);
          }
        }

        ++v6;
      }
      while (v6 != v4);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v37 objects:v44 count:16];
    }
    while (v4);
  }

  return v29;
}

id DDUIFetchInfoPlistFromRecord(void *a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v2 = _DDUICoreLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [v1 URL];
    int v9 = 138412290;
    uint64_t v10 = v3;
    _os_log_impl(&dword_1CFC71000, v2, OS_LOG_TYPE_DEFAULT, "Looking for bundle at %@", (uint8_t *)&v9, 0xCu);
  }
  uint64_t v4 = [v1 infoDictionary];
  uint64_t v5 = [v4 objectForKey:@"NSApplicationServices" ofClass:objc_opt_class()];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = DDUIInfoPlistFromTopLevelDictionary(v5);
  }
  else
  {
    v7 = _DDUICoreLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543874;
      uint64_t v10 = @"NSApplicationServices";
      __int16 v11 = 2112;
      uint64_t v12 = v5;
      __int16 v13 = 2112;
      id v14 = v1;
      _os_log_impl(&dword_1CFC71000, v7, OS_LOG_TYPE_DEFAULT, "Invalid %{public}@ value found. %@ is not an NSDictionary from %@", (uint8_t *)&v9, 0x20u);
    }

    uint64_t v6 = 0;
  }

  return v6;
}

id DDUIDeviceTypeString(char a1)
{
  id v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithString:", @"(");
  uint64_t v3 = v2;
  if ((a1 & 8) == 0)
  {
    if ((a1 & 1) == 0)
    {
      if ((a1 & 2) == 0)
      {
        if ((a1 & 0x10) == 0)
        {
          if ((a1 & 4) == 0) {
            goto LABEL_20;
          }
LABEL_19:
          [v3 appendString:@"Mac"];
          goto LABEL_20;
        }
        goto LABEL_17;
      }
LABEL_15:
      [v3 appendString:@"iPad"];
      if ((a1 & 0x10) != 0) {
        goto LABEL_16;
      }
      goto LABEL_10;
    }
LABEL_13:
    [v3 appendString:@"iPhone"];
    if ((a1 & 2) != 0) {
      goto LABEL_14;
    }
    goto LABEL_9;
  }
  [v2 appendString:@"Watch"];
  if (a1)
  {
    [v3 appendString:@"|"];
    goto LABEL_13;
  }
  if ((a1 & 2) != 0)
  {
LABEL_14:
    [v3 appendString:@"|"];
    goto LABEL_15;
  }
LABEL_9:
  if ((a1 & 0x10) != 0)
  {
LABEL_16:
    [v3 appendString:@"|"];
LABEL_17:
    [v3 appendString:@"TV"];
    if ((a1 & 4) == 0) {
      goto LABEL_20;
    }
    goto LABEL_18;
  }
LABEL_10:
  if ((a1 & 4) != 0)
  {
LABEL_18:
    [v3 appendString:@"|"];
    goto LABEL_19;
  }
LABEL_20:
  [v3 appendString:@""]);
  return v3;
}

uint64_t sub_1CFC82B60()
{
  uint64_t v0 = sub_1CFC89778();
  __swift_allocate_value_buffer(v0, qword_1EA61FB98);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EA61FB98);
  return sub_1CFC89768();
}

uint64_t sub_1CFC82BE0()
{
  uint64_t v0 = sub_1CFC89778();
  __swift_allocate_value_buffer(v0, qword_1EA61FBB8);
  uint64_t v1 = __swift_project_value_buffer(v0, (uint64_t)qword_1EA61FBB8);
  if (qword_1EA61FB90 != -1) {
    swift_once();
  }
  uint64_t v2 = __swift_project_value_buffer(v0, (uint64_t)qword_1EA61FB98);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 16);
  return v3(v1, v2, v0);
}

void sub_1CFC82CA8()
{
  type metadata accessor for NameDropIdentity();
  uint64_t v0 = swift_allocObject();
  *(void *)(v0 + 16) = 0;
  *(void *)(v0 + 24) = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F6BD58]), sel_init);
  NameDropIdentity.fetchNickname()();
  static NameDropIdentity.shared = v0;
}

uint64_t *NameDropIdentity.shared.unsafeMutableAddressor()
{
  if (qword_1EA61FBD0 != -1) {
    swift_once();
  }
  return &static NameDropIdentity.shared;
}

uint64_t static NameDropIdentity.shared.getter()
{
  if (qword_1EA61FBD0 != -1) {
    swift_once();
  }
  return swift_retain();
}

uint64_t variable initialization expression of NameDropIdentity.cachedNickname()
{
  return 0;
}

id variable initialization expression of NameDropIdentity.nicknameProvider()
{
  id v0 = objc_allocWithZone(MEMORY[0x1E4F6BD58]);
  return objc_msgSend(v0, sel_init);
}

Swift::Void __swiftcall NameDropIdentity.fetchNickname()()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA61F8F0);
  MEMORY[0x1F4188790]();
  uint64_t v3 = (char *)v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1CFC89878();
  uint64_t v5 = *(void *)(v4 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
  uint64_t v6 = (void *)swift_allocObject();
  v6[2] = 0;
  v6[3] = 0;
  v6[4] = v1;
  int v7 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4);
  swift_retain();
  if (v7 == 1)
  {
    sub_1CFC83740((uint64_t)v3);
    uint64_t v8 = 0;
    uint64_t v9 = 0;
  }
  else
  {
    sub_1CFC89868();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v3, v4);
    if (v6[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v8 = sub_1CFC89858();
      uint64_t v9 = v10;
      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v8 = 0;
      uint64_t v9 = 0;
    }
  }
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = &unk_1EA61F900;
  *(void *)(v11 + 24) = v6;
  if (v9 | v8)
  {
    v12[0] = 0;
    v12[1] = 0;
    v12[2] = v8;
    v12[3] = v9;
  }
  swift_task_create();
  swift_release();
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

uint64_t sub_1CFC8306C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 128) = a4;
  return MEMORY[0x1F4188298](sub_1CFC830FC, 0, 0);
}

uint64_t sub_1CFC830FC()
{
  uint64_t v1 = *(void **)(v0[16] + 24);
  v0[2] = v0;
  v0[7] = v0 + 15;
  v0[3] = sub_1CFC83228;
  uint64_t v2 = swift_continuation_init();
  v0[10] = MEMORY[0x1E4F143A8];
  v0[11] = 0x40000000;
  v0[12] = sub_1CFC837A0;
  v0[13] = &block_descriptor;
  v0[14] = v2;
  objc_msgSend(v1, sel_nicknameForCurrentUserWithCompletionHandler_, v0 + 10);
  return MEMORY[0x1F41881E8](v0 + 2);
}

uint64_t sub_1CFC83228()
{
  return MEMORY[0x1F4188298](sub_1CFC83334, 0, 0);
}

uint64_t sub_1CFC83334()
{
  uint64_t v1 = v0[16];
  uint64_t v2 = *(void **)(v1 + 16);
  *(void *)(v1 + 16) = v0[15];

  if (qword_1EA61FBB0 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_1CFC89778();
  __swift_project_value_buffer(v3, (uint64_t)qword_1EA61FBB8);
  swift_retain_n();
  uint64_t v4 = sub_1CFC89758();
  os_log_type_t v5 = sub_1CFC898A8();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    int v7 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 138412290;
    uint64_t v8 = *(void **)(v1 + 16);
    if (v8)
    {
      v0[10] = v8;
      id v9 = v8;
    }
    else
    {
      v0[10] = 0;
    }
    sub_1CFC898C8();
    void *v7 = v8;
    swift_release_n();
    _os_log_impl(&dword_1CFC71000, v4, v5, "Nickname found: %@", v6, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA61F928);
    swift_arrayDestroy();
    MEMORY[0x1D25DB340](v7, -1, -1);
    MEMORY[0x1D25DB340](v6, -1, -1);
  }
  else
  {
    swift_release_n();
  }

  uint64_t v10 = (uint64_t (*)(void))v0[1];
  return v10();
}

uint64_t sub_1CFC83560()
{
  swift_unknownObjectRelease();
  swift_release();
  return MEMORY[0x1F4186498](v0, 40, 7);
}

uint64_t sub_1CFC835A0()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  void *v3 = v1;
  v3[1] = sub_1CFC8364C;
  v3[16] = v2;
  return MEMORY[0x1F4188298](sub_1CFC830FC, 0, 0);
}

uint64_t sub_1CFC8364C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1CFC83740(uint64_t a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA61F8F0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1CFC837A0(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  **(void **)(*(void *)(v2 + 64) + 40) = a2;
  id v3 = a2;
  return MEMORY[0x1F41881F8](v2);
}

CNContact_optional __swiftcall NameDropIdentity.contact()()
{
  uint64_t v2 = v0;
  unint64_t v3 = (unint64_t)_s21DeviceDiscoveryUICore17MeContactProviderV8contactsSaySo9CNContactCGyF_0();
  unint64_t v4 = v3;
  if (v3 >> 62)
  {
    if (sub_1CFC89968())
    {
LABEL_3:
      if ((v4 & 0xC000000000000001) != 0)
      {
        id v5 = (id)MEMORY[0x1D25DAAA0](0, v4);
      }
      else
      {
        if (!*(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
          goto LABEL_47;
        }
        id v5 = *(id *)(v4 + 32);
      }
      uint64_t v1 = v5;
      swift_bridgeObjectRelease();
      if (qword_1EA61FBB0 == -1)
      {
LABEL_7:
        uint64_t v6 = sub_1CFC89778();
        uint64_t v7 = __swift_project_value_buffer(v6, (uint64_t)qword_1EA61FBB8);
        id v8 = v1;
        uint64_t v40 = v7;
        id v9 = sub_1CFC89758();
        os_log_type_t v10 = sub_1CFC898A8();
        if (os_log_type_enabled(v9, v10))
        {
          uint64_t v11 = (uint8_t *)swift_slowAlloc();
          uint64_t v12 = (void *)swift_slowAlloc();
          *(_DWORD *)uint64_t v11 = 138412290;
          id v13 = v8;
          sub_1CFC898C8();
          *uint64_t v12 = v8;

          _os_log_impl(&dword_1CFC71000, v9, v10, "NameDrop from Me Card: %@", v11, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EA61F928);
          swift_arrayDestroy();
          MEMORY[0x1D25DB340](v12, -1, -1);
          MEMORY[0x1D25DB340](v11, -1, -1);
        }
        else
        {
        }
        id v14 = objc_msgSend(v8, sel_emailAddresses);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EA61F920);
        unint64_t v15 = sub_1CFC89818();

        if (v15 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v16 = sub_1CFC89968();
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v16 = *(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10);
        }
        swift_bridgeObjectRelease();
        if (!v16)
        {
          id v18 = objc_msgSend(v8, sel_phoneNumbers);
          unint64_t v19 = sub_1CFC89818();

          if (v19 >> 62)
          {
            swift_bridgeObjectRetain();
            uint64_t v20 = sub_1CFC89968();
            swift_bridgeObjectRelease();
          }
          else
          {
            uint64_t v20 = *(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10);
          }
          swift_bridgeObjectRelease();
          if (!v20)
          {
            v21 = sub_1CFC89758();
            os_log_type_t v22 = sub_1CFC89898();
            if (os_log_type_enabled(v21, v22))
            {
              v23 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)v23 = 0;
              _os_log_impl(&dword_1CFC71000, v21, v22, "Me Card has no handles; sourcing them from iCloud & SIM",
                v23,
                2u);
              MEMORY[0x1D25DB340](v23, -1, -1);
            }

            objc_msgSend(v8, sel_mutableCopy);
            sub_1CFC898F8();
            swift_unknownObjectRelease();
            sub_1CFC890EC(0, &qword_1EA61F918);
            if (swift_dynamicCast())
            {
              sub_1CFC88534(v41);

              id v8 = v41;
            }
          }
        }
        if (!v8)
        {
          v24 = 0;
          goto LABEL_44;
        }
        v24 = v8;
        uint64_t v25 = *(void **)(v2 + 16);
        if (!v25) {
          goto LABEL_44;
        }
        goto LABEL_37;
      }
LABEL_47:
      swift_once();
      goto LABEL_7;
    }
  }
  else if (*(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  swift_bridgeObjectRelease();
  id v26 = sub_1CFC88214();
  if (v26)
  {
    v24 = v26;
    if (qword_1EA61FBB0 != -1) {
      swift_once();
    }
    uint64_t v27 = sub_1CFC89778();
    __swift_project_value_buffer(v27, (uint64_t)qword_1EA61FBB8);
    id v8 = v24;
    v28 = sub_1CFC89758();
    os_log_type_t v29 = sub_1CFC898A8();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = (uint8_t *)swift_slowAlloc();
      v31 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v30 = 138412290;
      id v8 = v8;
      sub_1CFC898C8();
      void *v31 = v24;

      _os_log_impl(&dword_1CFC71000, v28, v29, "NameDrop from iCloud+SIM: %@", v30, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA61F928);
      swift_arrayDestroy();
      MEMORY[0x1D25DB340](v31, -1, -1);
      MEMORY[0x1D25DB340](v30, -1, -1);
    }
    else
    {
    }
    uint64_t v25 = *(void **)(v2 + 16);
    if (v25)
    {
LABEL_37:
      id v36 = v25;
      objc_msgSend(v8, sel_mutableCopy);
      sub_1CFC898F8();
      swift_unknownObjectRelease();
      sub_1CFC890EC(0, &qword_1EA61F918);
      if (swift_dynamicCast())
      {
        v24 = v41;
        id v37 = objc_msgSend(v36, sel_firstName);
        if (!v37)
        {
          sub_1CFC897A8();
          id v37 = (id)sub_1CFC89798();
          swift_bridgeObjectRelease();
        }
        objc_msgSend(v41, sel_setGivenName_, v37, v40);

        id v38 = objc_msgSend(v36, sel_lastName);
        if (!v38)
        {
          sub_1CFC897A8();
          id v38 = (id)sub_1CFC89798();
          swift_bridgeObjectRelease();
        }
        objc_msgSend(v41, sel_setFamilyName_, v38);
      }
    }
  }
  else
  {
    if (qword_1EA61FBB0 != -1) {
      swift_once();
    }
    uint64_t v32 = sub_1CFC89778();
    __swift_project_value_buffer(v32, (uint64_t)qword_1EA61FBB8);
    long long v33 = sub_1CFC89758();
    os_log_type_t v34 = sub_1CFC89898();
    if (os_log_type_enabled(v33, v34))
    {
      long long v35 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)long long v35 = 0;
      _os_log_impl(&dword_1CFC71000, v33, v34, "Nothing to NameDrop", v35, 2u);
      MEMORY[0x1D25DB340](v35, -1, -1);
    }

    v24 = 0;
  }
LABEL_44:
  long long v39 = (objc_class *)v24;
  result.value.super.isa = v39;
  result.is_nil = v17;
  return result;
}

BOOL CNContact.isNameDroppable.getter()
{
  id v1 = objc_msgSend(v0, sel_emailAddresses);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA61F920);
  unint64_t v2 = sub_1CFC89818();

  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_1CFC89968();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v3) {
    return 1;
  }
  id v5 = objc_msgSend(v0, sel_phoneNumbers);
  unint64_t v6 = sub_1CFC89818();

  if (v6 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_1CFC89968();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  return v7 != 0;
}

uint64_t NameDropIdentity.deinit()
{
  return v0;
}

uint64_t NameDropIdentity.__deallocating_deinit()
{
  return MEMORY[0x1F4186488](v0, 32, 7);
}

uint64_t vCardContactProvider.contacts()()
{
  v18[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v0 = self;
  id v1 = (void *)sub_1CFC89718();
  v18[0] = 0;
  id v2 = objc_msgSend(v0, sel_contactsWithData_error_, v1, v18);

  id v3 = v18[0];
  if (v2)
  {
    sub_1CFC890EC(0, &qword_1EA61F930);
    uint64_t v4 = sub_1CFC89818();
    id v5 = v3;
  }
  else
  {
    id v6 = v18[0];
    uint64_t v7 = (void *)sub_1CFC89708();

    swift_willThrow();
    if (qword_1EA61FBB0 != -1) {
      swift_once();
    }
    uint64_t v8 = sub_1CFC89778();
    __swift_project_value_buffer(v8, (uint64_t)qword_1EA61FBB8);
    id v9 = v7;
    id v10 = v7;
    uint64_t v11 = sub_1CFC89758();
    os_log_type_t v12 = sub_1CFC89898();
    if (os_log_type_enabled(v11, v12))
    {
      id v13 = (uint8_t *)swift_slowAlloc();
      id v14 = (void *)swift_slowAlloc();
      *(_DWORD *)id v13 = 138412290;
      id v15 = v7;
      uint64_t v16 = (void *)_swift_stdlib_bridgeErrorToNSError();
      v18[0] = v16;
      sub_1CFC898C8();
      *id v14 = v16;

      _os_log_impl(&dword_1CFC71000, v11, v12, "Could not decode vCard: %@", v13, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA61F928);
      swift_arrayDestroy();
      MEMORY[0x1D25DB340](v14, -1, -1);
      MEMORY[0x1D25DB340](v13, -1, -1);
    }
    else
    {
    }
    return MEMORY[0x1E4FBC860];
  }
  return v4;
}

uint64_t sub_1CFC8437C()
{
  return vCardContactProvider.contacts()();
}

uint64_t CNContact.boopPresentedName.getter()
{
  id v1 = v0;
  id v2 = objc_msgSend(v0, sel_givenName);
  uint64_t v3 = sub_1CFC897A8();
  unint64_t v5 = v4;

  swift_bridgeObjectRelease();
  uint64_t v6 = HIBYTE(v5) & 0xF;
  if ((v5 & 0x2000000000000000) == 0) {
    uint64_t v6 = v3 & 0xFFFFFFFFFFFFLL;
  }
  if (!v6)
  {
    id v7 = objc_msgSend(v1, sel_familyName);
    uint64_t v8 = sub_1CFC897A8();
    unint64_t v10 = v9;

    swift_bridgeObjectRelease();
    uint64_t v11 = HIBYTE(v10) & 0xF;
    if ((v10 & 0x2000000000000000) == 0) {
      uint64_t v11 = v8 & 0xFFFFFFFFFFFFLL;
    }
    if (!v11) {
      return 0;
    }
  }
  id v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F1B910]), sel_init);
  objc_msgSend(v1, sel_mutableCopy);
  sub_1CFC898F8();
  swift_unknownObjectRelease();
  sub_1CFC890EC(0, &qword_1EA61F918);
  swift_dynamicCast();
  id v13 = (void *)sub_1CFC89798();
  objc_msgSend(v35, sel_setMiddleName_, v13);

  id v14 = (void *)sub_1CFC89798();
  objc_msgSend(v35, sel_setNamePrefix_, v14);

  id v15 = (void *)sub_1CFC89798();
  objc_msgSend(v35, sel_setNameSuffix_, v15);

  id v16 = objc_msgSend(v12, sel_stringFromContact_, v35);
  if (!v16)
  {

    return 0;
  }
  Swift::Bool v17 = v16;
  uint64_t v18 = sub_1CFC897A8();
  int v19 = CNIsChineseJapaneseKoreanString();

  if (v19)
  {
  }
  else
  {
    swift_bridgeObjectRelease();
    id v21 = objc_msgSend(v1, sel_givenName);
    uint64_t v22 = sub_1CFC897A8();
    unint64_t v24 = v23;

    swift_bridgeObjectRelease();
    if ((v24 & 0x2000000000000000) != 0) {
      uint64_t v25 = HIBYTE(v24) & 0xF;
    }
    else {
      uint64_t v25 = v22 & 0xFFFFFFFFFFFFLL;
    }
    id v26 = objc_msgSend(v1, sel_familyName);
    uint64_t v18 = sub_1CFC897A8();
    unint64_t v28 = v27;
    if (v25)
    {

      swift_bridgeObjectRelease();
      uint64_t v29 = HIBYTE(v28) & 0xF;
      if ((v28 & 0x2000000000000000) == 0) {
        uint64_t v29 = v18 & 0xFFFFFFFFFFFFLL;
      }
      if (v29)
      {
        if (objc_msgSend(self, sel_nameOrderForContact_, v35) == (id)2)
        {
          id v30 = objc_msgSend(v1, sel_familyName);
          uint64_t v31 = sub_1CFC897A8();

          swift_bridgeObjectRetain();
          sub_1CFC897C8();
          swift_bridgeObjectRelease();
          id v32 = objc_msgSend(v1, sel_givenName);
        }
        else
        {
          id v34 = objc_msgSend(v1, sel_givenName);
          uint64_t v31 = sub_1CFC897A8();

          swift_bridgeObjectRetain();
          sub_1CFC897C8();
          swift_bridgeObjectRelease();
          id v32 = objc_msgSend(v1, sel_familyName);
        }
        sub_1CFC897A8();

        swift_bridgeObjectRetain();
        sub_1CFC897C8();

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return v31;
      }
      else
      {
        id v33 = objc_msgSend(v1, sel_givenName);
        uint64_t v18 = sub_1CFC897A8();
      }
    }
    else
    {
    }
  }
  return v18;
}

uint64_t CNContact.boopPresentedHandles.getter()
{
  id v1 = v0;
  id v2 = objc_msgSend(v0, sel_emailAddresses);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA61F920);
  unint64_t v4 = sub_1CFC89818();

  if (v4 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_1CFC89968();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = *(void *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v6 = MEMORY[0x1E4FBC860];
  if (v5)
  {
    uint64_t v41 = MEMORY[0x1E4FBC860];
    uint64_t result = sub_1CFC8705C(0, v5 & ~(v5 >> 63), 0);
    if (v5 < 0)
    {
      __break(1u);
      goto LABEL_32;
    }
    uint64_t v37 = v3;
    long long v39 = v1;
    uint64_t v8 = 0;
    do
    {
      if ((v4 & 0xC000000000000001) != 0) {
        id v9 = (id)MEMORY[0x1D25DAAA0](v8, v4);
      }
      else {
        id v9 = *(id *)(v4 + 8 * v8 + 32);
      }
      unint64_t v10 = v9;
      id v11 = objc_msgSend(v9, sel_value, v37, v39);
      sub_1CFC897A8();

      uint64_t v12 = sub_1CFC897E8();
      uint64_t v14 = v13;

      unint64_t v16 = *(void *)(v41 + 16);
      unint64_t v15 = *(void *)(v41 + 24);
      if (v16 >= v15 >> 1) {
        sub_1CFC8705C(v15 > 1, v16 + 1, 1);
      }
      ++v8;
      *(void *)(v41 + 16) = v16 + 1;
      uint64_t v17 = v41 + 16 * v16;
      *(void *)(v17 + 32) = v12;
      *(void *)(v17 + 40) = v14;
    }
    while (v5 != v8);
    swift_bridgeObjectRelease();
    id v1 = v39;
    uint64_t v6 = MEMORY[0x1E4FBC860];
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  uint64_t v18 = swift_bridgeObjectRetain();
  uint64_t v19 = sub_1CFC8890C(v18);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v20 = objc_msgSend(v1, sel_phoneNumbers);
  unint64_t v21 = sub_1CFC89818();

  if (!(v21 >> 62))
  {
    uint64_t v22 = *(void *)((v21 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v22) {
      goto LABEL_16;
    }
LABEL_29:
    swift_bridgeObjectRelease();
LABEL_30:
    uint64_t v35 = swift_bridgeObjectRetain();
    uint64_t v36 = sub_1CFC8890C(v35);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1CFC86F04(v19);
    return v36;
  }
  swift_bridgeObjectRetain();
  uint64_t v22 = sub_1CFC89968();
  swift_bridgeObjectRelease();
  if (!v22) {
    goto LABEL_29;
  }
LABEL_16:
  uint64_t result = sub_1CFC8705C(0, v22 & ~(v22 >> 63), 0);
  if ((v22 & 0x8000000000000000) == 0)
  {
    uint64_t v38 = 0;
    uint64_t v40 = v19;
    uint64_t v23 = 0;
    do
    {
      if ((v21 & 0xC000000000000001) != 0) {
        id v24 = (id)MEMORY[0x1D25DAAA0](v23, v21);
      }
      else {
        id v24 = *(id *)(v21 + 8 * v23 + 32);
      }
      uint64_t v25 = v24;
      id v26 = objc_msgSend(v24, sel_value, v38, v40);
      id v27 = objc_msgSend(v26, sel_formattedStringValue);

      if (!v27)
      {
        id v28 = objc_msgSend(v25, sel_value);
        id v27 = objc_msgSend(v28, sel_stringValue);
      }
      sub_1CFC897A8();

      uint64_t v29 = sub_1CFC897E8();
      uint64_t v31 = v30;

      unint64_t v33 = *(void *)(v6 + 16);
      unint64_t v32 = *(void *)(v6 + 24);
      if (v33 >= v32 >> 1) {
        sub_1CFC8705C(v32 > 1, v33 + 1, 1);
      }
      ++v23;
      *(void *)(v6 + 16) = v33 + 1;
      uint64_t v34 = v6 + 16 * v33;
      *(void *)(v34 + 32) = v29;
      *(void *)(v34 + 40) = v31;
    }
    while (v22 != v23);
    swift_bridgeObjectRelease();
    uint64_t v19 = v40;
    goto LABEL_30;
  }
LABEL_32:
  __break(1u);
  return result;
}

void CNContact.boopDefaultHandleIndex.getter()
{
  uint64_t v0 = sub_1CFC89778();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790]();
  uint64_t v3 = (char *)&v43 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = 0;
  if (qword_1EA61FBD0 != -1) {
    swift_once();
  }
  sub_1CFC87FA4();
  unint64_t v4 = 0x1EA61F000uLL;
  if (v5)
  {
    id v6 = objc_allocWithZone(MEMORY[0x1E4F1BA70]);
    id v7 = (void *)sub_1CFC89798();
    swift_bridgeObjectRelease();
    id v8 = objc_msgSend(v6, sel_initWithStringValue_, v7);

    uint64_t v9 = CNContact.boopPresentedHandles.getter();
    id v10 = v8;
    uint64_t v11 = sub_1CFC88B6C(v9, (uint64_t)v10);
    char v13 = v12;
    swift_bridgeObjectRelease();

    if ((v13 & 1) == 0)
    {
      if (qword_1EA61FBB0 != -1) {
        swift_once();
      }
      __swift_project_value_buffer(v0, (uint64_t)qword_1EA61FBB8);
      id v14 = v10;
      unint64_t v15 = sub_1CFC89758();
      os_log_type_t v16 = sub_1CFC89888();
      if (os_log_type_enabled(v15, v16))
      {
        uint64_t v46 = v11;
        uint64_t v17 = (uint8_t *)swift_slowAlloc();
        uint64_t v18 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v17 = 138412290;
        v48[0] = v14;
        id v19 = v14;
        unint64_t v4 = 0x1EA61F000;
        sub_1CFC898C8();
        *uint64_t v18 = v14;

        _os_log_impl(&dword_1CFC71000, v15, v16, "Preferring voice SIM for NameDrop: %@", v17, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EA61F928);
        swift_arrayDestroy();
        MEMORY[0x1D25DB340](v18, -1, -1);
        MEMORY[0x1D25DB340](v17, -1, -1);

        uint64_t v49 = v46;
      }
      else
      {

        uint64_t v49 = v11;
      }
      goto LABEL_23;
    }
  }
  id v20 = objc_msgSend(self, sel_defaultStore);
  if (v20)
  {
    unint64_t v21 = v20;
    id v22 = objc_msgSend(v20, sel_aa_primaryAppleAccount);
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = CNContact.boopPresentedHandles.getter();
      id v25 = v23;
      uint64_t v26 = sub_1CFC88C5C(v24, v25);
      LOBYTE(v23) = v27;
      swift_bridgeObjectRelease();

      if (v23)
      {
      }
      else
      {
        if (qword_1EA61FBB0 != -1) {
          swift_once();
        }
        uint64_t v28 = __swift_project_value_buffer(v0, (uint64_t)qword_1EA61FBB8);
        (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v28, v0);
        id v29 = v25;
        uint64_t v30 = sub_1CFC89758();
        os_log_type_t v31 = sub_1CFC89888();
        if (os_log_type_enabled(v30, v31))
        {
          uint64_t v45 = v26;
          uint64_t v46 = v1;
          unint64_t v32 = (uint8_t *)swift_slowAlloc();
          uint64_t v44 = swift_slowAlloc();
          v48[0] = (id)v44;
          *(_DWORD *)unint64_t v32 = 136315138;
          id v33 = objc_msgSend(v29, sel_username);
          if (!v33)
          {

            __break(1u);
            return;
          }
          uint64_t v34 = v33;
          v43 = v32 + 4;
          uint64_t v35 = sub_1CFC897A8();
          unint64_t v37 = v36;

          uint64_t v47 = sub_1CFC868AC(v35, v37, (uint64_t *)v48);
          sub_1CFC898C8();

          swift_bridgeObjectRelease();
          _os_log_impl(&dword_1CFC71000, v30, v31, "Preferring iCloud email for NameDrop: %s", v32, 0xCu);
          uint64_t v38 = v44;
          swift_arrayDestroy();
          MEMORY[0x1D25DB340](v38, -1, -1);
          MEMORY[0x1D25DB340](v32, -1, -1);

          (*(void (**)(char *, uint64_t))(v46 + 8))(v3, v0);
          unint64_t v4 = 0x1EA61F000;
          uint64_t v26 = v45;
        }
        else
        {

          (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
        }
        uint64_t v49 = v26;
      }
    }
    else
    {
    }
  }
LABEL_23:
  if (*(void *)(v4 + 2992) != -1) {
    swift_once();
  }
  __swift_project_value_buffer(v0, (uint64_t)qword_1EA61FBB8);
  uint64_t v39 = v49;
  uint64_t v40 = sub_1CFC89758();
  os_log_type_t v41 = sub_1CFC89888();
  if (os_log_type_enabled(v40, v41))
  {
    v42 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v42 = 134217984;
    v48[0] = (id)v39;
    sub_1CFC898C8();
    _os_log_impl(&dword_1CFC71000, v40, v41, "Default NameDrop handle index: %ld", v42, 0xCu);
    MEMORY[0x1D25DB340](v42, -1, -1);
  }

  swift_beginAccess();
}

void CNContact.boopDefaultHandle.getter()
{
  uint64_t v0 = CNContact.boopPresentedHandles.getter();
  if (!*(void *)(v0 + 16)) {
    goto LABEL_5;
  }
  CNContact.boopDefaultHandleIndex.getter();
  if ((v1 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v1 < *(void *)(v0 + 16))
  {
    swift_bridgeObjectRetain();
LABEL_5:
    swift_bridgeObjectRelease();
    return;
  }
  __break(1u);
}

void CNContact.boopDefaultHandleIsEmail.getter()
{
  uint64_t v0 = CNContact.boopPresentedHandles.getter();
  if (!*(void *)(v0 + 16)) {
    goto LABEL_5;
  }
  CNContact.boopDefaultHandleIndex.getter();
  if ((v1 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v1 < *(void *)(v0 + 16))
  {
    swift_bridgeObjectRetain();
LABEL_5:
    swift_bridgeObjectRelease();
    sub_1CFC88D78();
    sub_1CFC898E8();
    swift_bridgeObjectRelease();
    return;
  }
  __break(1u);
}

CNContact __swiftcall CNContact.boopDefaultHandleAsContact()()
{
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F1BA40]), sel_init);
  uint64_t v1 = CNContact.boopPresentedHandles.getter();
  if (*(void *)(v1 + 16))
  {
    CNContact.boopDefaultHandleIndex.getter();
    if ((v2 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (v2 < *(void *)(v1 + 16))
    {
      uint64_t v3 = v1 + 16 * v2;
      uint64_t v5 = *(void *)(v3 + 32);
      unint64_t v4 = *(void *)(v3 + 40);
      swift_bridgeObjectRetain();
      goto LABEL_6;
    }
    __break(1u);
LABEL_24:
    swift_once();
    goto LABEL_14;
  }
  uint64_t v5 = 0;
  unint64_t v4 = 0xE000000000000000;
LABEL_6:
  swift_bridgeObjectRelease();
  uint64_t v6 = HIBYTE(v4) & 0xF;
  if ((v4 & 0x2000000000000000) == 0) {
    uint64_t v6 = v5 & 0xFFFFFFFFFFFFLL;
  }
  if (v6)
  {
    CNContact.boopDefaultHandleIsEmail.getter();
    if (v7)
    {
      id v8 = (void *)sub_1CFC89798();
      swift_bridgeObjectRelease();
      id v9 = objc_allocWithZone(MEMORY[0x1E4F1BA20]);
      id v10 = (void *)sub_1CFC89798();
      objc_msgSend(v9, sel_initWithLabel_value_, v10, v8);

      id v11 = objc_msgSend(v0, sel_emailAddresses);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA61F920);
      uint64_t v12 = sub_1CFC89818();

      MEMORY[0x1D25DA960]();
      if (*(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_1CFC89838();
      }
      sub_1CFC89848();
      sub_1CFC89828();
      char v13 = (void *)sub_1CFC89808();
      swift_bridgeObjectRelease();
      objc_msgSend(v0, sel_setEmailAddresses_, v13);
    }
    else
    {
      id v18 = objc_allocWithZone(MEMORY[0x1E4F1BA70]);
      id v19 = (void *)sub_1CFC89798();
      swift_bridgeObjectRelease();
      id v20 = objc_msgSend(v18, sel_initWithStringValue_, v19);

      id v21 = objc_allocWithZone(MEMORY[0x1E4F1BA20]);
      id v22 = (void *)sub_1CFC89798();
      objc_msgSend(v21, sel_initWithLabel_value_, v22, v20);

      id v23 = objc_msgSend(v0, sel_phoneNumbers);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA61F920);
      uint64_t v24 = sub_1CFC89818();

      MEMORY[0x1D25DA960]();
      if (*(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v24 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_1CFC89838();
      }
      sub_1CFC89848();
      sub_1CFC89828();
      char v13 = (void *)sub_1CFC89808();
      swift_bridgeObjectRelease();
      objc_msgSend(v0, sel_setPhoneNumbers_, v13);
    }

    return (CNContact)v0;
  }
  swift_bridgeObjectRelease();
  if (qword_1EA61FBB0 != -1) {
    goto LABEL_24;
  }
LABEL_14:
  uint64_t v14 = sub_1CFC89778();
  __swift_project_value_buffer(v14, (uint64_t)qword_1EA61FBB8);
  unint64_t v15 = sub_1CFC89758();
  os_log_type_t v16 = sub_1CFC89898();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v17 = 0;
    _os_log_impl(&dword_1CFC71000, v15, v16, "No default handle!", v17, 2u);
    MEMORY[0x1D25DB340](v17, -1, -1);
  }

  return (CNContact)v0;
}

void CNContact.vCardForBoopingDefaultHandle()()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA61F940);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1CFC8B1C0;
  uint64_t v1 = CNContact.boopPresentedHandles.getter();
  if (!*(void *)(v1 + 16))
  {
    uint64_t v5 = 0;
    unint64_t v4 = 0xE000000000000000;
    goto LABEL_6;
  }
  CNContact.boopDefaultHandleIndex.getter();
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v2 < *(void *)(v1 + 16))
  {
    uint64_t v3 = v1 + 16 * v2;
    uint64_t v5 = *(void *)(v3 + 32);
    unint64_t v4 = *(void *)(v3 + 40);
    swift_bridgeObjectRetain();
LABEL_6:
    swift_bridgeObjectRelease();
    *(void *)(inited + 32) = v5;
    *(void *)(inited + 40) = v4;
    CNContact.vCardForBooping(with:)(inited);
    swift_setDeallocating();
    swift_arrayDestroy();
    return;
  }
  __break(1u);
}

uint64_t CNContact.vCardForBooping(with:)(uint64_t a1)
{
  unint64_t v2 = v1;
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F1BA40]), sel_init);
  id v5 = objc_msgSend(v1, sel_givenName);
  if (!v5)
  {
    sub_1CFC897A8();
    id v5 = (id)sub_1CFC89798();
    swift_bridgeObjectRelease();
  }
  objc_msgSend(v4, sel_setGivenName_, v5);

  id v6 = objc_msgSend(v2, sel_familyName);
  if (!v6)
  {
    sub_1CFC897A8();
    id v6 = (id)sub_1CFC89798();
    swift_bridgeObjectRelease();
  }
  objc_msgSend(v4, sel_setFamilyName_, v6);

  objc_msgSend(v4, sel_setContactType_, 0);
  CNContact.boopPresentedName.getter();
  char v7 = (void *)sub_1CFC89798();
  swift_bridgeObjectRelease();
  int v8 = CNIsChineseJapaneseKoreanString();

  if (v8)
  {
    id v9 = objc_msgSend(v2, sel_phoneticGivenName);
    if (!v9)
    {
      sub_1CFC897A8();
      id v9 = (id)sub_1CFC89798();
      swift_bridgeObjectRelease();
    }
    objc_msgSend(v4, sel_setPhoneticGivenName_, v9);

    id v10 = objc_msgSend(v2, sel_phoneticMiddleName);
    if (!v10)
    {
      sub_1CFC897A8();
      id v10 = (id)sub_1CFC89798();
      swift_bridgeObjectRelease();
    }
    objc_msgSend(v4, sel_setPhoneticMiddleName_, v10);

    id v11 = objc_msgSend(v2, sel_phoneticFamilyName);
    if (!v11)
    {
      sub_1CFC897A8();
      id v11 = (id)sub_1CFC89798();
      swift_bridgeObjectRelease();
    }
    objc_msgSend(v4, sel_setPhoneticFamilyName_, v11);
  }
  uint64_t v65 = MEMORY[0x1E4FBC860];
  uint64_t v66 = MEMORY[0x1E4FBC860];
  uint64_t v12 = *(void *)(a1 + 16);
  if (v12)
  {
    v62 = v2;
    id v63 = v4;
    char v13 = (void **)(a1 + 40);
    swift_bridgeObjectRetain();
    uint64_t v14 = 1;
    sub_1CFC88D78();
    unint64_t v15 = &unk_1E6860000;
    while (1)
    {
      os_log_type_t v16 = *v13;
      v64[0] = *(v13 - 1);
      v64[1] = v16;
      swift_bridgeObjectRetain();
      if (sub_1CFC898E8())
      {
        uint64_t v17 = (void *)sub_1CFC89798();
        id v18 = objc_allocWithZone(MEMORY[0x1E4F1BA20]);
        id v19 = (void *)sub_1CFC89798();
        objc_msgSend(v18, sel_initWithLabel_value_, v19, v17);

        MEMORY[0x1D25DA960]();
        if (*(void *)((v66 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v66 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_1CFC89838();
        }
      }
      else
      {
        id v20 = objc_allocWithZone(MEMORY[0x1E4F1BA70]);
        swift_bridgeObjectRetain();
        id v21 = (void *)sub_1CFC89798();
        swift_bridgeObjectRelease();
        id v22 = objc_msgSend(v20, sel_initWithStringValue_, v21);

        id v23 = objc_allocWithZone(MEMORY[0x1E4F1BA20]);
        uint64_t v24 = (void *)sub_1CFC89798();
        objc_msgSend(v23, sel_initWithLabel_value_, v24, v22);

        MEMORY[0x1D25DA960]();
        if (*(void *)((v65 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v65 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_1CFC89838();
        }
      }
      sub_1CFC89848();
      sub_1CFC89828();
      swift_bridgeObjectRelease();
      if (v12 == v14) {
        break;
      }
      v13 += 2;
      if (__OFADD__(v14++, 1))
      {
        __break(1u);
        goto LABEL_42;
      }
    }
    swift_bridgeObjectRelease();
    unint64_t v2 = v62;
    id v4 = v63;
  }
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA61F920);
  uint64_t v26 = (void *)sub_1CFC89808();
  swift_bridgeObjectRelease();
  objc_msgSend(v4, sel_setEmailAddresses_, v26);

  swift_bridgeObjectRetain();
  char v27 = (void *)sub_1CFC89808();
  swift_bridgeObjectRelease();
  objc_msgSend(v4, sel_setPhoneNumbers_, v27);

  id v28 = objc_msgSend(v2, sel_thumbnailImageData);
  if (v28 || (id v28 = objc_msgSend(v2, sel_imageData)) != 0)
  {
    uint64_t v29 = sub_1CFC89728();
    unint64_t v31 = v30;

    id v28 = (id)sub_1CFC89718();
    sub_1CFC88DCC(v29, v31);
  }
  objc_msgSend(v4, sel_setThumbnailImageData_, v28);

  if (CNSNaPWallpaperEnabled())
  {
    id v32 = objc_msgSend(v2, sel_wallpaper);
    if (v32)
    {
      id v33 = v32;
      id v34 = objc_msgSend(v32, sel_posterArchiveData);

      uint64_t v35 = sub_1CFC89728();
      unint64_t v37 = v36;

      sub_1CFC88DCC(v35, v37);
      id v38 = objc_msgSend(v2, sel_wallpaper);
      objc_msgSend(v4, sel_setWallpaper_, v38);

      objc_msgSend(v4, sel_setSharedPhotoDisplayPreference_, 1);
    }
  }
  id v39 = objc_msgSend(v2, sel_watchWallpaperImageData);
  if (v39)
  {
    uint64_t v40 = sub_1CFC89728();
    unint64_t v42 = v41;

    id v39 = (id)sub_1CFC89718();
    sub_1CFC88DCC(v40, v42);
  }
  objc_msgSend(v4, sel_setWatchWallpaperImageData_, v39);

  id v43 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB8C18]), sel_init);
  objc_msgSend(v43, sel_setIncludePhotos_, 1);
  objc_msgSend(v43, sel_setIncludeWallpaper_, 1);
  uint64_t v44 = self;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA61F948);
  uint64_t v45 = swift_allocObject();
  *(_OWORD *)(v45 + 16) = xmmword_1CFC8B1D0;
  *(void *)(v45 + 32) = v4;
  sub_1CFC89828();
  sub_1CFC890EC(0, &qword_1EA61F930);
  id v46 = v4;
  uint64_t v47 = (void *)sub_1CFC89808();
  swift_bridgeObjectRelease();
  v64[0] = 0;
  id v48 = objc_msgSend(v44, sel_dataWithContacts_options_error_, v47, v43, v64);

  id v49 = v64[0];
  if (v48)
  {
    uint64_t v50 = sub_1CFC89728();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    v51 = v49;
    unint64_t v15 = (void *)sub_1CFC89708();

    swift_willThrow();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_1EA61FBB0 != -1) {
LABEL_42:
    }
      swift_once();
    uint64_t v52 = sub_1CFC89778();
    __swift_project_value_buffer(v52, (uint64_t)qword_1EA61FBB8);
    id v53 = v15;
    id v54 = v15;
    v55 = sub_1CFC89758();
    os_log_type_t v56 = sub_1CFC89898();
    if (os_log_type_enabled(v55, v56))
    {
      v57 = (uint8_t *)swift_slowAlloc();
      v58 = (void *)swift_slowAlloc();
      *(_DWORD *)v57 = 138412290;
      id v59 = v15;
      v60 = (void *)_swift_stdlib_bridgeErrorToNSError();
      v64[0] = v60;
      sub_1CFC898C8();
      void *v58 = v60;

      _os_log_impl(&dword_1CFC71000, v55, v56, "Could not encode vCard: %@", v57, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA61F928);
      swift_arrayDestroy();
      MEMORY[0x1D25DB340](v58, -1, -1);
      MEMORY[0x1D25DB340](v57, -1, -1);
    }
    else
    {
    }
    return 0;
  }
  return v50;
}

uint64_t CNContact.avatarImageData.getter()
{
  id v1 = objc_msgSend(v0, sel_thumbnailImageData);
  if (!v1)
  {
    id v1 = objc_msgSend(v0, sel_imageData);
    if (!v1) {
      return 0;
    }
  }
  uint64_t v2 = sub_1CFC89728();

  return v2;
}

void *CNContact.posterArchiveData.getter()
{
  if (!CNSNaPWallpaperEnabled()) {
    return 0;
  }
  id v1 = objc_msgSend(v0, sel_wallpaper);
  uint64_t v2 = v1;
  if (v1)
  {
    id v3 = objc_msgSend(v1, sel_posterArchiveData);

    uint64_t v2 = (void *)sub_1CFC89728();
  }
  return v2;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> CNMutableContact.saveToContactStore()()
{
  uint64_t v1 = v0;
  v7[1] = *(id *)MEMORY[0x1E4F143B8];
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F1B980]), sel_init);
  id v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F1BAA8]), sel_init);
  id v4 = (void *)sub_1CFC89798();
  objc_msgSend(v3, sel_setTransactionAuthor_, v4);

  objc_msgSend(v3, sel_addContact_toContainerWithIdentifier_, v1, 0);
  v7[0] = 0;
  if (objc_msgSend(v2, sel_executeSaveRequest_error_, v3, v7))
  {
    id v5 = v7[0];
  }
  else
  {
    id v6 = v7[0];
    sub_1CFC89708();

    swift_willThrow();
  }
}

uint64_t sub_1CFC864D8(uint64_t a1, int *a2)
{
  id v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  id v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_1CFC865B4;
  return v6(a1);
}

uint64_t sub_1CFC865B4()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1CFC866AC()
{
  swift_release();
  return MEMORY[0x1F4186498](v0, 32, 7);
}

uint64_t sub_1CFC866E4(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  id v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_1CFC8364C;
  id v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1EA61F908 + dword_1EA61F908);
  return v6(a1, v4);
}

void *sub_1CFC8679C(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = a4[3];
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = a4[2];
    if (v7 <= v8) {
      uint64_t v9 = a4[2];
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA61F940);
      id v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      char v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      id v10 = (void *)MEMORY[0x1E4FBC860];
      char v13 = (void *)(MEMORY[0x1E4FBC860] + 32);
      if (result)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4]) {
          memmove(v13, a4 + 4, 16 * v8);
        }
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_1CFC88A78(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_1CFC868AC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1CFC86980(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1CFC8908C((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x1E4FBB9B0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_1CFC8908C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_1CFC86980(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_1CFC898D8();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_1CFC86B3C(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_1CFC89948();
  if (!v8)
  {
    sub_1CFC89958();
    __break(1u);
LABEL_17:
    uint64_t result = sub_1CFC89978();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_1CFC86B3C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_1CFC86BD4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1CFC86DB4(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1CFC86DB4(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1CFC86BD4(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_1CFC86D4C(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_1CFC89928();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_1CFC89958();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_1CFC897D8();
      if (!v2) {
        return MEMORY[0x1E4FBC860];
      }
    }
    sub_1CFC89978();
    __break(1u);
LABEL_14:
    uint64_t result = sub_1CFC89958();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E4FBC860];
  }
  return result;
}

void *sub_1CFC86D4C(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x1E4FBC860];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA61F958);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1CFC86DB4(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA61F958);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = _swift_stdlib_malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  uint64_t v12 = v10 + 32;
  char v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_1CFC89978();
  __break(1u);
  return result;
}

uint64_t sub_1CFC86F04(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 16);
  unint64_t v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  isUniquelyReferenced_nonNull_native = (void *)swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    unint64_t v8 = *(void *)(a1 + 16);
    if (v8) {
      goto LABEL_5;
    }
LABEL_18:
    if (!v2) {
      goto LABEL_19;
    }
    goto LABEL_21;
  }
  if (v4 <= v5) {
    int64_t v15 = v4 + v2;
  }
  else {
    int64_t v15 = v4;
  }
  unint64_t v3 = sub_1CFC8679C(isUniquelyReferenced_nonNull_native, v15, 1, v3);
  unint64_t v8 = *(void *)(a1 + 16);
  if (!v8) {
    goto LABEL_18;
  }
LABEL_5:
  uint64_t v9 = v3[2];
  if ((v3[3] >> 1) - v9 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  unint64_t v10 = (unint64_t)&v3[2 * v9 + 4];
  if (a1 + 32 < v10 + 16 * v8 && v10 < a1 + 32 + 16 * v8) {
    goto LABEL_24;
  }
  swift_arrayInitWithCopy();
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v12 = v3[2];
  BOOL v13 = __OFADD__(v12, v8);
  uint64_t v14 = v12 + v8;
  if (!v13)
  {
    v3[2] = v14;
LABEL_19:
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  uint64_t result = sub_1CFC89978();
  __break(1u);
  return result;
}

uint64_t sub_1CFC8705C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1CFC8707C(a1, a2, a3, *v3);
  void *v3 = (char *)result;
  return result;
}

uint64_t sub_1CFC8707C(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA61F940);
    unint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    unint64_t v10 = (char *)MEMORY[0x1E4FBC860];
  }
  BOOL v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_1CFC89978();
  __break(1u);
  return result;
}

uint64_t sub_1CFC871E8(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *v3;
  sub_1CFC899A8();
  swift_bridgeObjectRetain();
  sub_1CFC897B8();
  uint64_t v8 = sub_1CFC899B8();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_1CFC89988() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v14 = (uint64_t *)(*(void *)(*v3 + 48) + 16 * v10);
      uint64_t v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    uint64_t v17 = ~v9;
    while (1)
    {
      unint64_t v10 = (v10 + 1) & v17;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        break;
      }
      id v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_1CFC89988() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  uint64_t *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_1CFC87660(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  uint64_t *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_1CFC87398()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA61F968);
  uint64_t v3 = sub_1CFC89918();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16)) {
    goto LABEL_37;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  unint64_t v31 = v0;
  uint64_t v32 = v2 + 56;
  if (v5 < 64) {
    uint64_t v6 = ~(-1 << v5);
  }
  else {
    uint64_t v6 = -1;
  }
  unint64_t v7 = v6 & *(void *)(v2 + 56);
  int64_t v8 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v9 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v11 = 0;
  while (1)
  {
    if (v7)
    {
      unint64_t v14 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      unint64_t v15 = v14 | (v11 << 6);
      goto LABEL_22;
    }
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      return result;
    }
    if (v16 >= v8) {
      break;
    }
    uint64_t v17 = (void *)(v2 + 56);
    unint64_t v18 = *(void *)(v32 + 8 * v16);
    ++v11;
    if (!v18)
    {
      int64_t v11 = v16 + 1;
      if (v16 + 1 >= v8) {
        goto LABEL_31;
      }
      unint64_t v18 = *(void *)(v32 + 8 * v11);
      if (!v18)
      {
        int64_t v19 = v16 + 2;
        if (v19 >= v8)
        {
LABEL_31:
          swift_release();
          uint64_t v1 = v31;
          goto LABEL_33;
        }
        unint64_t v18 = *(void *)(v32 + 8 * v19);
        if (!v18)
        {
          while (1)
          {
            int64_t v11 = v19 + 1;
            if (__OFADD__(v19, 1)) {
              goto LABEL_39;
            }
            if (v11 >= v8) {
              goto LABEL_31;
            }
            unint64_t v18 = *(void *)(v32 + 8 * v11);
            ++v19;
            if (v18) {
              goto LABEL_21;
            }
          }
        }
        int64_t v11 = v19;
      }
    }
LABEL_21:
    unint64_t v7 = (v18 - 1) & v18;
    unint64_t v15 = __clz(__rbit64(v18)) + (v11 << 6);
LABEL_22:
    id v20 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v21 = *v20;
    uint64_t v22 = v20[1];
    sub_1CFC899A8();
    sub_1CFC897B8();
    uint64_t result = sub_1CFC899B8();
    uint64_t v23 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v24 = result & ~v23;
    unint64_t v25 = v24 >> 6;
    if (((-1 << v24) & ~*(void *)(v9 + 8 * (v24 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v24) & ~*(void *)(v9 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v26 = 0;
      unint64_t v27 = (unint64_t)(63 - v23) >> 6;
      do
      {
        if (++v25 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v28 = v25 == v27;
        if (v25 == v27) {
          unint64_t v25 = 0;
        }
        v26 |= v28;
        uint64_t v29 = *(void *)(v9 + 8 * v25);
      }
      while (v29 == -1);
      unint64_t v12 = __clz(__rbit64(~v29)) + (v25 << 6);
    }
    *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    BOOL v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    *BOOL v13 = v21;
    v13[1] = v22;
    ++*(void *)(v4 + 16);
  }
  swift_release();
  uint64_t v1 = v31;
  uint64_t v17 = (void *)(v2 + 56);
LABEL_33:
  uint64_t v30 = 1 << *(unsigned char *)(v2 + 32);
  if (v30 > 63) {
    bzero(v17, ((unint64_t)(v30 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v17 = -1 << v30;
  }
  *(void *)(v2 + 16) = 0;
LABEL_37:
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_1CFC87660(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_1CFC87398();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (uint64_t)sub_1CFC877FC();
      goto LABEL_22;
    }
    sub_1CFC8799C();
  }
  uint64_t v11 = *v4;
  sub_1CFC899A8();
  sub_1CFC897B8();
  uint64_t result = sub_1CFC899B8();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = sub_1CFC89988(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = sub_1CFC89998();
      __break(1u);
    }
    else
    {
      uint64_t v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(void *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3) & 1) == 0) {
          break;
        }
        unint64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = sub_1CFC89988();
          if ((result & 1) == 0) {
            continue;
          }
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  uint64_t v20 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  uint64_t v21 = (uint64_t *)(*(void *)(v20 + 48) + 16 * a3);
  uint64_t *v21 = v8;
  v21[1] = a2;
  uint64_t v22 = *(void *)(v20 + 16);
  BOOL v23 = __OFADD__(v22, 1);
  uint64_t v24 = v22 + 1;
  if (v23) {
    __break(1u);
  }
  else {
    *(void *)(v20 + 16) = v24;
  }
  return result;
}

void *sub_1CFC877FC()
{
  uint64_t v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA61F968);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1CFC89908();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 56);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    int64_t v19 = (void *)(*(void *)(v4 + 48) + v16);
    *int64_t v19 = *v17;
    v19[1] = v18;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 2;
  if (v22 >= v13) {
    goto LABEL_26;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_1CFC8799C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA61F968);
  uint64_t v3 = sub_1CFC89918();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_32:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v6 = v2 + 56;
  if (v5 < 64) {
    uint64_t v7 = ~(-1 << v5);
  }
  else {
    uint64_t v7 = -1;
  }
  unint64_t v8 = v7 & *(void *)(v2 + 56);
  int64_t v29 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v9 = v3 + 56;
  uint64_t result = swift_retain_n();
  int64_t v11 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v11 << 6);
      goto LABEL_21;
    }
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_33:
      __break(1u);
      goto LABEL_34;
    }
    if (v16 >= v29) {
      goto LABEL_30;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      int64_t v11 = v16 + 1;
      if (v16 + 1 >= v29) {
        goto LABEL_30;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v11);
      if (!v17)
      {
        int64_t v18 = v16 + 2;
        if (v18 >= v29)
        {
LABEL_30:
          uint64_t result = swift_release_n();
          uint64_t v1 = v0;
          goto LABEL_32;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v18);
        int64_t v11 = v18;
        if (!v17) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_21:
    int64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    sub_1CFC899A8();
    swift_bridgeObjectRetain();
    sub_1CFC897B8();
    uint64_t result = sub_1CFC899B8();
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_33;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    int64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    *int64_t v13 = v20;
    v13[1] = v21;
    ++*(void *)(v4 + 16);
  }
  while (1)
  {
    int64_t v11 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_30;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v11);
    ++v18;
    if (v17) {
      goto LABEL_20;
    }
  }
LABEL_34:
  __break(1u);
  return result;
}

id _s21DeviceDiscoveryUICore17MeContactProviderV8contactsSaySo9CNContactCGyF_0()
{
  v20[4] = *(id *)MEMORY[0x1E4F143B8];
  id v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F1B980]), sel_init);
  sub_1CFC89748();
  sub_1CFC89738();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA61F9D0);
  uint64_t v1 = (void *)sub_1CFC89808();
  swift_bridgeObjectRelease();
  v20[0] = 0;
  id v2 = objc_msgSend(v0, sel__crossPlatformUnifiedMeContactWithKeysToFetch_error_, v1, v20);

  if (v2)
  {
    id v3 = v20[0];
    objc_msgSend(v2, sel_mutableCopy);
    sub_1CFC898F8();
    swift_unknownObjectRelease();
    sub_1CFC890EC(0, &qword_1EA61F918);
    swift_dynamicCast();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA61F920);
    uint64_t v4 = (void *)sub_1CFC89808();
    objc_msgSend(v19, sel_setAddressingGrammars_, v4);

    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA61F948);
    uint64_t v5 = swift_allocObject();
    *(_OWORD *)(v5 + 16) = xmmword_1CFC8B1D0;
    *(void *)(v5 + 32) = v19;
    v20[0] = (id)v5;
    sub_1CFC89828();
    id v6 = v20[0];
  }
  else
  {
    id v7 = v20[0];
    unint64_t v8 = (void *)sub_1CFC89708();

    swift_willThrow();
    if (qword_1EA61FBB0 != -1) {
      swift_once();
    }
    uint64_t v9 = sub_1CFC89778();
    __swift_project_value_buffer(v9, (uint64_t)qword_1EA61FBB8);
    id v10 = v8;
    id v11 = v8;
    unint64_t v12 = sub_1CFC89758();
    os_log_type_t v13 = sub_1CFC89898();
    if (os_log_type_enabled(v12, v13))
    {
      unint64_t v14 = (uint8_t *)swift_slowAlloc();
      unint64_t v15 = (void *)swift_slowAlloc();
      *(_DWORD *)unint64_t v14 = 138412290;
      id v16 = v8;
      unint64_t v17 = (void *)_swift_stdlib_bridgeErrorToNSError();
      v20[0] = v17;
      sub_1CFC898C8();
      void *v15 = v17;

      _os_log_impl(&dword_1CFC71000, v12, v13, "Could not fetch me card: %@", v14, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EA61F928);
      swift_arrayDestroy();
      MEMORY[0x1D25DB340](v15, -1, -1);
      MEMORY[0x1D25DB340](v14, -1, -1);
    }
    else
    {
    }
    return (id)MEMORY[0x1E4FBC860];
  }
  return v6;
}

uint64_t sub_1CFC87FA4()
{
  v20[1] = *(id *)MEMORY[0x1E4F143B8];
  uint64_t v0 = sub_1CFC89788();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x1F4188790]();
  id v3 = (char *)v20 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1CFC890EC(0, &qword_1EA61F960);
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E4FBCB48], v0);
  uint64_t v4 = (void *)sub_1CFC898B8();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  id v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F23A80]), sel_initWithQueue_, v4);

  v20[0] = 0;
  id v6 = objc_msgSend(v5, sel_getUserDefaultVoiceSubscriptionContext_, v20);
  id v7 = v20[0];
  if (!v6)
  {
    id v15 = v20[0];
    id v16 = (void *)sub_1CFC89708();

    swift_willThrow();
LABEL_6:

    return 0;
  }
  unint64_t v8 = v6;
  v20[0] = 0;
  id v9 = v7;
  id v10 = objc_msgSend(v5, sel_getPhoneNumber_error_, v8, v20);
  if (!v10)
  {
    id v17 = v20[0];
    id v16 = (void *)sub_1CFC89708();

    swift_willThrow();
    goto LABEL_6;
  }
  id v11 = v10;
  id v12 = v20[0];
  id v13 = objc_msgSend(v11, sel_displayPhoneNumber);

  uint64_t v14 = sub_1CFC897A8();
  return v14;
}

id sub_1CFC88214()
{
  id v0 = objc_msgSend(self, sel_defaultStore);
  if (!v0) {
    return 0;
  }
  uint64_t v1 = v0;
  id v2 = objc_msgSend(v0, sel_aa_primaryAppleAccount);
  if (!v2)
  {

    return 0;
  }
  id v3 = v2;
  id result = objc_msgSend(v2, sel_username);
  if (!result)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  id v5 = result;
  uint64_t v6 = sub_1CFC897A8();
  unint64_t v8 = v7;

  swift_bridgeObjectRelease();
  uint64_t v9 = HIBYTE(v8) & 0xF;
  if ((v8 & 0x2000000000000000) == 0) {
    uint64_t v9 = v6 & 0xFFFFFFFFFFFFLL;
  }
  if (!v9)
  {

    return 0;
  }
  uint64_t v10 = sub_1CFC87FA4();
  if (v11)
  {
    uint64_t v12 = v10;
    uint64_t v13 = v11;
    id v14 = objc_msgSend(v3, sel_userFullName);
    if (v14)
    {
      id v15 = v14;
      sub_1CFC897A8();
      uint64_t v17 = v16;
    }
    else
    {
      uint64_t v17 = 0;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EA61F940);
    uint64_t v23 = swift_allocObject();
    *(_OWORD *)(v23 + 16) = xmmword_1CFC8B1E0;
    *(void *)(v23 + 32) = v12;
    *(void *)(v23 + 40) = v13;
    id result = objc_msgSend(v3, sel_username);
    if (result)
    {
      unint64_t v24 = result;
      uint64_t v25 = sub_1CFC897A8();
      uint64_t v27 = v26;

      *(void *)(v23 + 48) = v25;
      *(void *)(v23 + 56) = v27;
      if (v17)
      {
        uint64_t v28 = (void *)sub_1CFC89798();
        swift_bridgeObjectRelease();
      }
      else
      {
        uint64_t v28 = 0;
      }
      int64_t v29 = (void *)sub_1CFC89808();
      swift_bridgeObjectRelease();
      id v18 = objc_msgSend(self, sel_contactWithDisplayName_handleStrings_, v28, v29);

      return v18;
    }
    goto LABEL_29;
  }
  id v19 = objc_msgSend(v3, sel_userFullName);
  if (v19)
  {
    uint64_t v20 = v19;
    sub_1CFC897A8();
    uint64_t v22 = v21;
  }
  else
  {
    uint64_t v22 = 0;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA61F940);
  uint64_t v30 = swift_allocObject();
  *(_OWORD *)(v30 + 16) = xmmword_1CFC8B1C0;
  id result = objc_msgSend(v3, sel_username);
  if (result)
  {
    unint64_t v31 = result;
    uint64_t v32 = sub_1CFC897A8();
    uint64_t v34 = v33;

    *(void *)(v30 + 32) = v32;
    *(void *)(v30 + 40) = v34;
    if (v22)
    {
      uint64_t v35 = (void *)sub_1CFC89798();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v35 = 0;
    }
    unint64_t v36 = (void *)sub_1CFC89808();
    swift_bridgeObjectRelease();
    id v18 = objc_msgSend(self, sel_contactWithDisplayName_handleStrings_, v35, v36);

    return v18;
  }
LABEL_30:
  __break(1u);
  return result;
}

void sub_1CFC88534(void *a1)
{
  id v2 = objc_msgSend(self, sel_defaultStore);
  if (v2)
  {
    id v3 = v2;
    id v4 = objc_msgSend(v2, sel_aa_primaryAppleAccount);
    if (v4)
    {
      id v5 = v4;
      id v6 = objc_msgSend(v4, sel_username);
      if (v6)
      {
        unint64_t v7 = v6;
        uint64_t v8 = sub_1CFC897A8();
        unint64_t v10 = v9;
        swift_bridgeObjectRelease();
        uint64_t v11 = HIBYTE(v10) & 0xF;
        if ((v10 & 0x2000000000000000) == 0) {
          uint64_t v11 = v8 & 0xFFFFFFFFFFFFLL;
        }
        if (v11)
        {
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA61F948);
          uint64_t v12 = swift_allocObject();
          *(_OWORD *)(v12 + 16) = xmmword_1CFC8B1D0;
          id v13 = objc_allocWithZone(MEMORY[0x1E4F1BA20]);
          id v14 = (void *)sub_1CFC89798();
          id v15 = objc_msgSend(v13, sel_initWithLabel_value_, v14, v7);

          *(void *)(v12 + 32) = v15;
          sub_1CFC89828();
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EA61F920);
          uint64_t v16 = (void *)sub_1CFC89808();
          swift_bridgeObjectRelease();
          objc_msgSend(a1, sel_setEmailAddresses_, v16);

          sub_1CFC87FA4();
          if (!v17) {
            return;
          }
          goto LABEL_14;
        }

        id v3 = v5;
      }
      else
      {
        unint64_t v7 = v5;
      }

      id v3 = v7;
    }
  }
  sub_1CFC87FA4();
  if (!v18)
  {
    if (qword_1EA61FBB0 != -1) {
      swift_once();
    }
    uint64_t v26 = sub_1CFC89778();
    __swift_project_value_buffer(v26, (uint64_t)qword_1EA61FBB8);
    oslog = sub_1CFC89758();
    os_log_type_t v27 = sub_1CFC89898();
    if (os_log_type_enabled(oslog, v27))
    {
      uint64_t v28 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v28 = 0;
      _os_log_impl(&dword_1CFC71000, oslog, v27, "Unable to find NameDrop handles from iCloud or SIM", v28, 2u);
      MEMORY[0x1D25DB340](v28, -1, -1);
    }
    goto LABEL_19;
  }
LABEL_14:
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA61F948);
  uint64_t v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_1CFC8B1D0;
  id v20 = objc_allocWithZone(MEMORY[0x1E4F1BA70]);
  uint64_t v21 = (void *)sub_1CFC89798();
  swift_bridgeObjectRelease();
  id v22 = objc_msgSend(v20, sel_initWithStringValue_, v21);

  id v23 = objc_allocWithZone(MEMORY[0x1E4F1BA20]);
  unint64_t v24 = (void *)sub_1CFC89798();
  id v25 = objc_msgSend(v23, sel_initWithLabel_value_, v24, v22);

  *(void *)(v19 + 32) = v25;
  sub_1CFC89828();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EA61F920);
  oslog = sub_1CFC89808();
  swift_bridgeObjectRelease();
  objc_msgSend(a1, sel_setPhoneNumbers_, oslog);
LABEL_19:
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_1CFC8890C(uint64_t result)
{
  unint64_t v1 = *(void *)(result + 16);
  if (!v1) {
    return MEMORY[0x1E4FBC860];
  }
  unint64_t v2 = 0;
  uint64_t v3 = result + 40;
  uint64_t v4 = -(uint64_t)v1;
  uint64_t v5 = MEMORY[0x1E4FBC860];
  uint64_t v15 = result + 40;
  unint64_t v16 = *(void *)(result + 16);
  do
  {
    if (v2 <= v1) {
      unint64_t v6 = v1;
    }
    else {
      unint64_t v6 = v2;
    }
    uint64_t v7 = -(uint64_t)v6;
    for (uint64_t i = (uint64_t *)(v3 + 16 * v2++); ; i += 2)
    {
      if (v7 + v2 == 1)
      {
        __break(1u);
        return result;
      }
      uint64_t v10 = *(i - 1);
      uint64_t v9 = *i;
      swift_bridgeObjectRetain_n();
      char v11 = sub_1CFC871E8(&v17, v10, v9);
      swift_bridgeObjectRelease();
      if (v11) {
        break;
      }
      id result = swift_bridgeObjectRelease();
      ++v2;
      if (v4 + v2 == 1) {
        return v5;
      }
    }
    id result = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v18 = v5;
    if ((result & 1) == 0)
    {
      id result = sub_1CFC8705C(0, *(void *)(v5 + 16) + 1, 1);
      uint64_t v5 = v18;
    }
    unint64_t v13 = *(void *)(v5 + 16);
    unint64_t v12 = *(void *)(v5 + 24);
    if (v13 >= v12 >> 1)
    {
      id result = sub_1CFC8705C(v12 > 1, v13 + 1, 1);
      uint64_t v5 = v18;
    }
    *(void *)(v5 + 16) = v13 + 1;
    uint64_t v14 = v5 + 16 * v13;
    *(void *)(v14 + 32) = v10;
    *(void *)(v14 + 40) = v9;
    uint64_t v3 = v15;
    unint64_t v1 = v16;
  }
  while (v4 + v2);
  return v5;
}

uint64_t sub_1CFC88A78(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 16 * a1 + 32;
    unint64_t v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_1CFC89978();
  __break(1u);
  return result;
}

uint64_t sub_1CFC88B6C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2) {
    return 0;
  }
  uint64_t v4 = 0;
  for (uint64_t i = a1 + 40; ; i += 16)
  {
    id v6 = objc_allocWithZone(MEMORY[0x1E4F1BA70]);
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_1CFC89798();
    id v8 = objc_msgSend(v6, sel_initWithStringValue_, v7);

    LOBYTE(v7) = objc_msgSend(v8, sel_isLikePhoneNumber_, a2);
    swift_bridgeObjectRelease();

    if (v7) {
      break;
    }
    if (v2 == ++v4) {
      return 0;
    }
  }
  return v4;
}

uint64_t sub_1CFC88C5C(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (v2)
  {
    uint64_t v4 = 0;
    for (uint64_t i = (uint64_t *)(a1 + 40); ; i += 2)
    {
      uint64_t v7 = *(i - 1);
      uint64_t v6 = *i;
      swift_bridgeObjectRetain();
      id v8 = objc_msgSend(a2, sel_username);
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = sub_1CFC897A8();
        uint64_t v12 = v11;

        if (v10 == v7 && v12 == v6)
        {
          swift_bridgeObjectRelease_n();
          return v4;
        }
        char v14 = sub_1CFC89988();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v14) {
          return v4;
        }
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      if (v2 == ++v4) {
        return 0;
      }
    }
  }
  return 0;
}

unint64_t sub_1CFC88D78()
{
  unint64_t result = qword_1EA61F938;
  if (!qword_1EA61F938)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1EA61F938);
  }
  return result;
}

uint64_t sub_1CFC88DCC(uint64_t a1, unint64_t a2)
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

uint64_t type metadata accessor for NameDropIdentity()
{
  return self;
}

ValueMetadata *type metadata accessor for MeContactProvider()
{
  return &type metadata for MeContactProvider;
}

uint64_t *initializeBufferWithCopyOfBuffer for vCardContactProvider(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  unint64_t v4 = a2[1];
  sub_1CFC88E98(*a2, v4);
  *a1 = v3;
  a1[1] = v4;
  return a1;
}

uint64_t sub_1CFC88E98(uint64_t a1, unint64_t a2)
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

uint64_t destroy for vCardContactProvider(uint64_t a1)
{
  return sub_1CFC88DCC(*(void *)a1, *(void *)(a1 + 8));
}

uint64_t *assignWithCopy for vCardContactProvider(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  unint64_t v4 = a2[1];
  sub_1CFC88E98(*a2, v4);
  uint64_t v5 = *a1;
  unint64_t v6 = a1[1];
  *a1 = v3;
  a1[1] = v4;
  sub_1CFC88DCC(v5, v6);
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t *assignWithTake for vCardContactProvider(uint64_t *a1, _OWORD *a2)
{
  uint64_t v3 = *a1;
  unint64_t v4 = a1[1];
  *(_OWORD *)a1 = *a2;
  sub_1CFC88DCC(v3, v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for vCardContactProvider(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xD && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 13);
  }
  unsigned int v3 = (((*(void *)(a1 + 8) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(void *)(a1 + 8) >> 60) & 3))) ^ 0xF;
  if (v3 >= 0xC) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for vCardContactProvider(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(void *)__n128 result = a2 - 13;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2)
    {
      *(void *)__n128 result = 0;
      *(void *)(result + 8) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for vCardContactProvider()
{
  return &type metadata for vCardContactProvider;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1CFC8908C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1CFC890EC(uint64_t a1, unint64_t *a2)
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

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

void DDUIEndpointPairingBrowsingTransportForOptions_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1CFC71000, a2, OS_LOG_TYPE_ERROR, "DDUIEndpointPairingBrowsingTransportForOptions -- invalid options given, returning nil! {options: %lu}", (uint8_t *)&v2, 0xCu);
}

void DDUIEndpointPairingListeningTransportForOptions_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1CFC71000, a2, OS_LOG_TYPE_ERROR, "DDUIEndpointPairingListeningTransportForOptions -- invalid options given, returning nil! {options: %lu}", (uint8_t *)&v2, 0xCu);
}

void DDUIDeviceTypeForModelString_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1CFC71000, a2, OS_LOG_TYPE_FAULT, "Unable to determine a device type for model %@", (uint8_t *)&v2, 0xCu);
}

uint64_t sub_1CFC89708()
{
  return MEMORY[0x1F40E4550]();
}

uint64_t sub_1CFC89718()
{
  return MEMORY[0x1F40E4D48]();
}

uint64_t sub_1CFC89728()
{
  return MEMORY[0x1F40E4DA8]();
}

uint64_t sub_1CFC89738()
{
  return MEMORY[0x1F4112D10]();
}

uint64_t sub_1CFC89748()
{
  return MEMORY[0x1F4112D18]();
}

uint64_t sub_1CFC89758()
{
  return MEMORY[0x1F4188670]();
}

uint64_t sub_1CFC89768()
{
  return MEMORY[0x1F4188680]();
}

uint64_t sub_1CFC89778()
{
  return MEMORY[0x1F41886A0]();
}

uint64_t sub_1CFC89788()
{
  return MEMORY[0x1F4186CE0]();
}

uint64_t sub_1CFC89798()
{
  return MEMORY[0x1F40E6190]();
}

uint64_t sub_1CFC897A8()
{
  return MEMORY[0x1F40E61D8]();
}

uint64_t sub_1CFC897B8()
{
  return MEMORY[0x1F41839B0]();
}

uint64_t sub_1CFC897C8()
{
  return MEMORY[0x1F4183A38]();
}

uint64_t sub_1CFC897D8()
{
  return MEMORY[0x1F4183A80]();
}

uint64_t sub_1CFC897E8()
{
  return MEMORY[0x1F4183B90]();
}

uint64_t sub_1CFC897F8()
{
  return MEMORY[0x1F4183E80]();
}

uint64_t sub_1CFC89808()
{
  return MEMORY[0x1F40E6338]();
}

uint64_t sub_1CFC89818()
{
  return MEMORY[0x1F40E6370]();
}

uint64_t sub_1CFC89828()
{
  return MEMORY[0x1F4183E98]();
}

uint64_t sub_1CFC89838()
{
  return MEMORY[0x1F4183EC8]();
}

uint64_t sub_1CFC89848()
{
  return MEMORY[0x1F4183F38]();
}

uint64_t sub_1CFC89858()
{
  return MEMORY[0x1F4187BF0]();
}

uint64_t sub_1CFC89868()
{
  return MEMORY[0x1F4187CF8]();
}

uint64_t sub_1CFC89878()
{
  return MEMORY[0x1F4187D00]();
}

uint64_t sub_1CFC89888()
{
  return MEMORY[0x1F41886C0]();
}

uint64_t sub_1CFC89898()
{
  return MEMORY[0x1F41886E0]();
}

uint64_t sub_1CFC898A8()
{
  return MEMORY[0x1F4188700]();
}

uint64_t sub_1CFC898B8()
{
  return MEMORY[0x1F4187110]();
}

uint64_t sub_1CFC898C8()
{
  return MEMORY[0x1F41847C0]();
}

uint64_t sub_1CFC898D8()
{
  return MEMORY[0x1F4184820]();
}

uint64_t sub_1CFC898E8()
{
  return MEMORY[0x1F40E6D88]();
}

uint64_t sub_1CFC898F8()
{
  return MEMORY[0x1F4184978]();
}

uint64_t sub_1CFC89908()
{
  return MEMORY[0x1F4184C90]();
}

uint64_t sub_1CFC89918()
{
  return MEMORY[0x1F4184C98]();
}

uint64_t sub_1CFC89928()
{
  return MEMORY[0x1F4184CF0]();
}

uint64_t sub_1CFC89938()
{
  return MEMORY[0x1F4184D80]();
}

uint64_t sub_1CFC89948()
{
  return MEMORY[0x1F4184E68]();
}

uint64_t sub_1CFC89958()
{
  return MEMORY[0x1F4185298]();
}

uint64_t sub_1CFC89968()
{
  return MEMORY[0x1F4185350]();
}

uint64_t sub_1CFC89978()
{
  return MEMORY[0x1F4185398]();
}

uint64_t sub_1CFC89988()
{
  return MEMORY[0x1F4185A40]();
}

uint64_t sub_1CFC89998()
{
  return MEMORY[0x1F4185DD8]();
}

uint64_t sub_1CFC899A8()
{
  return MEMORY[0x1F4185EB0]();
}

uint64_t sub_1CFC899B8()
{
  return MEMORY[0x1F4185EF8]();
}

CFStringRef CFBundleCopyLocalizedString(CFBundleRef bundle, CFStringRef key, CFStringRef value, CFStringRef tableName)
{
  return (CFStringRef)MEMORY[0x1F40D74A8](bundle, key, value, tableName);
}

uint64_t CFDictionaryGetInt64()
{
  return MEMORY[0x1F4115F10]();
}

void CFRelease(CFTypeRef cf)
{
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x1F40D8A28](allocator, flags, error, dictionary, timeout);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return MEMORY[0x1F40D8A68](userNotification, responseFlags, timeout);
}

uint64_t CNIsChineseJapaneseKoreanString()
{
  return MEMORY[0x1F4112C78]();
}

uint64_t CNSNaPWallpaperEnabled()
{
  return MEMORY[0x1F40D6F60]();
}

uint64_t GestaltGetDeviceClass()
{
  return MEMORY[0x1F41163A8]();
}

uint64_t SFDeviceClassCodeGet()
{
  return MEMORY[0x1F4150278]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
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

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1F4186370]();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
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

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBD0](label, attr, target);
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1F40CCB80](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
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

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
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

uint64_t self
{
  return MEMORY[0x1F41817D0]();
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

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1F40CD648]();
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1F41863E8]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1F4186410]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1F4186418]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1F4186430]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1F4186440]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1F4186448]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1F4186450]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1F4186458]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x1F41881F0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1F41864B8]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1F4186528]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1F4186530]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1F4186608]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1F4186610]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1F4186668]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1F4186680]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1F41866A8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1F4186700]();
}

uint64_t swift_once()
{
  return MEMORY[0x1F4186728]();
}

uint64_t swift_release()
{
  return MEMORY[0x1F4186758]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1F4186760]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1F4186770]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1F4186778]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1F4186790]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1F4186798]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1F41867A0]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1F4188250]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1F4188258]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1F4188260]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1F41867E0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1F41867F0]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1F41868E0]();
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1F40CEE40](original);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEE80](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1F40CEEF0](xdict, key);
}

uint64_t xpc_dictionary_send_reply()
{
  return MEMORY[0x1F40CEF20]();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}