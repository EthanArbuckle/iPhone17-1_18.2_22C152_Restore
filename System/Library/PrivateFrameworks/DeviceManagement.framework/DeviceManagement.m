id DMFAppLog()
{
  void *v0;
  uint64_t vars8;

  if (DMFAppLog_onceToken != -1) {
    dispatch_once(&DMFAppLog_onceToken, &__block_literal_global_10);
  }
  v0 = (void *)DMFAppLog_log;
  return v0;
}

id DMFEmergencyModeLog()
{
  if (DMFEmergencyModeLog_onceToken != -1) {
    dispatch_once(&DMFEmergencyModeLog_onceToken, &__block_literal_global_4);
  }
  v0 = (void *)DMFEmergencyModeLog_log;
  return v0;
}

id DMFPolicyLog()
{
  if (DMFPolicyLog_onceToken != -1) {
    dispatch_once(&DMFPolicyLog_onceToken, &__block_literal_global_7);
  }
  v0 = (void *)DMFPolicyLog_log;
  return v0;
}

uint64_t __DMFPolicyLog_block_invoke()
{
  DMFPolicyLog_log = (uint64_t)os_log_create("com.apple.dmd", "Policy");
  return MEMORY[0x1F41817F8]();
}

uint64_t __DMFEmergencyModeLog_block_invoke()
{
  DMFEmergencyModeLog_log = (uint64_t)os_log_create("com.apple.dmd", "EmergencyMode");
  return MEMORY[0x1F41817F8]();
}

id DMFAllConfigurationOrganizationTypes()
{
  v4[4] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = @"screentime";
  v4[1] = @"personal";
  v4[2] = @"family";
  v4[3] = @"internal";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:4];
  v2 = [v0 setWithArray:v1];

  return v2;
}

void sub_1BE0F10C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id DMFConfigurationSourceClientXPCInterface()
{
  if (DMFConfigurationSourceClientXPCInterface_onceToken != -1) {
    dispatch_once(&DMFConfigurationSourceClientXPCInterface_onceToken, &__block_literal_global_3);
  }
  v0 = (void *)DMFConfigurationSourceClientXPCInterface_interface;
  return v0;
}

uint64_t __DMFConfigurationSourceClientXPCInterface_block_invoke()
{
  DMFConfigurationSourceClientXPCInterface_interface = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F18AFDC8];
  return MEMORY[0x1F41817F8]();
}

BOOL DMFInterfaceOrientationIsValid(unint64_t a1)
{
  return a1 < 5;
}

void sub_1BE0F7A2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_1BE0F8858(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
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

void sub_1BE0F8B2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BE0F8E14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BE0F9120(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id DMFConfigurationEngineLog()
{
  if (DMFConfigurationEngineLog_onceToken != -1) {
    dispatch_once(&DMFConfigurationEngineLog_onceToken, &__block_literal_global_16);
  }
  v0 = (void *)DMFConfigurationEngineLog_log;
  return v0;
}

uint64_t __DMFConfigurationEngineLog_block_invoke()
{
  DMFConfigurationEngineLog_log = (uint64_t)os_log_create("com.apple.dmd", "ConfigurationEngine");
  return MEMORY[0x1F41817F8]();
}

uint64_t __DMFAppLog_block_invoke()
{
  DMFAppLog_log = (uint64_t)os_log_create("com.apple.dmd", "Apps");
  return MEMORY[0x1F41817F8]();
}

id DMFPersonalHotspotLog()
{
  if (DMFPersonalHotspotLog_onceToken != -1) {
    dispatch_once(&DMFPersonalHotspotLog_onceToken, &__block_literal_global_13);
  }
  v0 = (void *)DMFPersonalHotspotLog_log;
  return v0;
}

uint64_t __DMFPersonalHotspotLog_block_invoke()
{
  DMFPersonalHotspotLog_log = (uint64_t)os_log_create("com.apple.dmd", "PersonalHotspot");
  return MEMORY[0x1F41817F8]();
}

id DMFServerLog()
{
  if (DMFServerLog_onceToken != -1) {
    dispatch_once(&DMFServerLog_onceToken, &__block_literal_global_16_0);
  }
  v0 = (void *)DMFServerLog_log;
  return v0;
}

uint64_t __DMFServerLog_block_invoke()
{
  DMFServerLog_log = (uint64_t)os_log_create("com.apple.dmd", "Server");
  return MEMORY[0x1F41817F8]();
}

id DMFOSUpdateLog()
{
  if (DMFOSUpdateLog_onceToken != -1) {
    dispatch_once(&DMFOSUpdateLog_onceToken, &__block_literal_global_19);
  }
  v0 = (void *)DMFOSUpdateLog_log;
  return v0;
}

uint64_t __DMFOSUpdateLog_block_invoke()
{
  DMFOSUpdateLog_log = (uint64_t)os_log_create("com.apple.dmd", "OSUpdate");
  return MEMORY[0x1F41817F8]();
}

id DMFAtomicFileWritingLog()
{
  if (DMFAtomicFileWritingLog_onceToken != -1) {
    dispatch_once(&DMFAtomicFileWritingLog_onceToken, &__block_literal_global_22_0);
  }
  v0 = (void *)DMFAtomicFileWritingLog_log;
  return v0;
}

uint64_t __DMFAtomicFileWritingLog_block_invoke()
{
  DMFAtomicFileWritingLog_log = (uint64_t)os_log_create("com.apple.dmd", "AtomicFileWriting");
  return MEMORY[0x1F41817F8]();
}

__CFString *DMFPolicyUnlocalizedDisplayName(unint64_t a1)
{
  if (a1 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Unknown(%ld)", a1);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v1 = off_1E6372D98[a1];
  }
  return v1;
}

void sub_1BE10BB2C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BE10BCC8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BE10BFE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 128), 8);
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

void sub_1BE10C858(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1BE10D090(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 144), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

uint64_t OUTLINED_FUNCTION_5(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  return [v2 count];
}

void OUTLINED_FUNCTION_6(float a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(float *)a3 = a1;
  *(void *)(a3 + 4) = a4;
  *(_WORD *)(a3 + 12) = 2114;
  *(void *)(a3 + 14) = v4;
}

uint64_t OUTLINED_FUNCTION_8(uint64_t a1)
{
  v2 = *(void **)(a1 + 40);
  return [v2 count];
}

id DMFObjectDescription(void *a1, __CFString *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10 = a1;
  if (a2)
  {
    v11 = (objc_class *)NSString;
    v12 = a2;
    a2 = (__CFString *)[[v11 alloc] initWithFormat:v12 arguments:&a9];
  }
  uint64_t v13 = [(__CFString *)a2 length];
  v14 = NSString;
  uint64_t v15 = (objc_class *)objc_opt_class();
  uint64_t v16 = NSStringFromClass(v15);
  v17 = (void *)v16;
  v18 = @"; ";
  v19 = &stru_1F18939E8;
  if (!v13) {
    v18 = &stru_1F18939E8;
  }
  if (a2) {
    v19 = a2;
  }
  v20 = [v14 stringWithFormat:@"<%@: %p%@%@>", v16, v10, v18, v19];

  return v20;
}

id DMFObjectDescriptionWithProperties(void *a1, void *a2)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  id v4 = a2;
  v31 = v4;
  if (v4)
  {
    v33 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id obj = v31;
    uint64_t v11 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v44 != v12) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void *)(*((void *)&v43 + 1) + 8 * i);
          uint64_t v37 = 0;
          v38 = &v37;
          uint64_t v39 = 0x3032000000;
          v40 = __Block_byref_object_copy__2;
          v41 = __Block_byref_object_dispose__2;
          id v42 = 0;
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v15 = v3;
            uint64_t v16 = [v15 managedObjectContext];
            v34[0] = MEMORY[0x1E4F143A8];
            v34[1] = 3221225472;
            v34[2] = __DMFObjectDescriptionWithProperties_block_invoke;
            v34[3] = &unk_1E6372E78;
            v36 = &v37;
            v34[4] = v14;
            id v17 = v15;
            id v35 = v17;
            [v16 performBlockAndWait:v34];
          }
          else
          {
            v18 = NSString;
            id v17 = [v3 valueForKeyPath:v14];
            uint64_t v19 = [v18 stringWithFormat:@"%@='%@'", v14, v17];
            v20 = (void *)v38[5];
            v38[5] = v19;
          }
          if (v38[5]) {
            objc_msgSend(v33, "addObject:");
          }
          _Block_object_dispose(&v37, 8);
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v43 objects:v47 count:16];
      }
      while (v11);
    }

    v21 = [v33 componentsJoinedByString:@", "];
    v28 = DMFObjectDescription(v3, @"%@", v22, v23, v24, v25, v26, v27, (uint64_t)v21);
  }
  else
  {
    v28 = DMFObjectDescription(v3, 0, v5, v6, v7, v8, v9, v10, v30);
  }

  return v28;
}

void sub_1BE117538(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
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

void __DMFObjectDescriptionWithProperties_block_invoke(uint64_t a1)
{
  v2 = NSString;
  uint64_t v3 = *(void *)(a1 + 32);
  id v7 = [*(id *)(a1 + 40) valueForKeyPath:v3];
  uint64_t v4 = [v2 stringWithFormat:@"%@='%@'", v3, v7];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

uint64_t DMFErrorWithCodeAndUserInfo(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1F410FB80](@"DeviceManagement.error", a1, _DMFErrorDescriptionsWithCodeAndUserInfo, a2);
}

id _DMFErrorDescriptionsWithCodeAndUserInfo(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (_DMFErrorDescriptionsWithCodeAndUserInfo_onceToken != -1) {
    dispatch_once(&_DMFErrorDescriptionsWithCodeAndUserInfo_onceToken, &__block_literal_global_19);
  }
  uint64_t v4 = 0;
  if (a1 <= 1900)
  {
    if (a1 > 899)
    {
      if (a1 <= 1399)
      {
        if (a1 > 1099)
        {
          if (a1 > 1201)
          {
            switch(a1)
            {
              case 1300:
                uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
                uint64_t v6 = @"A destination name or device identifier is required.";
                break;
              case 1301:
                uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
                uint64_t v6 = @"The requested destination could not be found";
                break;
              case 1302:
                uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
                uint64_t v6 = @"Could not get shared output context";
                break;
              case 1303:
                uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
                uint64_t v6 = @"Could not set output devices";
                break;
              default:
                if (a1 != 1202) {
                  goto LABEL_265;
                }
                uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
                uint64_t v6 = @"Cannot remove provisioning profile.";
                break;
            }
          }
          else
          {
            switch(a1)
            {
              case 1100:
                uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
                uint64_t v6 = @"Could not remove app.";
                break;
              case 1200:
                uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
                uint64_t v6 = @"A unique identifier is required.";
                break;
              case 1201:
                uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
                uint64_t v6 = @"The provisioning profile is not managed.";
                break;
              default:
                goto LABEL_265;
            }
          }
        }
        else
        {
          switch(a1)
          {
            case 1000:
              uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
              uint64_t v6 = @"The app installation was rejected.";
              break;
            case 1001:
              id v7 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
              uint64_t v8 = @"A redemption code is needed for app “%@”.";
LABEL_239:
              uint64_t v11 = objc_msgSend(v7, "cat_localizedStringsForKey:value:table:", v8, &stru_1F18939E8, @"DMFErrors");
              uint64_t v12 = @"bundleIdentifier";
LABEL_240:
              id v17 = [v3 objectForKeyedSubscript:v12];
              uint64_t v4 = CATFormattedStringForKey();
LABEL_241:

              goto LABEL_264;
            case 1002:
              uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
              uint64_t v6 = @"The app installation was canceled.";
              break;
            case 1003:
              uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
              uint64_t v6 = @"The app installation failed.";
              break;
            case 1004:
              uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
              uint64_t v6 = @"An iTunes Store ID or manifest URL is required.";
              break;
            case 1005:
              uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
              uint64_t v6 = @"Could not install app.";
              break;
            case 1006:
              uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
              uint64_t v6 = @"Could not redeem the code for the app.";
              break;
            default:
              if (a1 == 900)
              {
                uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
                uint64_t v6 = @"Cannot create escrow keybag.";
              }
              else
              {
                if (a1 != 901) {
                  goto LABEL_265;
                }
                uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
                uint64_t v6 = @"Cannot copy escrow keybag data.";
              }
              break;
          }
        }
      }
      else
      {
        if (a1 <= 1599)
        {
          switch(a1)
          {
            case 1400:
              uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
              uint64_t v6 = @"The App Store is not allowed.";
              goto LABEL_263;
            case 1401:
              uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
              uint64_t v6 = @"An invitation URL is required.";
              goto LABEL_263;
            case 1402:
              uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
              uint64_t v6 = @"The invitation URL is invalid.";
              goto LABEL_263;
            case 1403:
              uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
              uint64_t v6 = @"A program identifier is required.";
              goto LABEL_263;
            case 1404:
              uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
              uint64_t v6 = @"The program identifier is invalid.";
              goto LABEL_263;
            case 1405:
              uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
              uint64_t v6 = @"The device cannot proceed.";
              goto LABEL_263;
            case 1406:
              uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
              uint64_t v6 = @"Could not invite user to VPP.";
              goto LABEL_263;
            case 1407:
              uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
              uint64_t v6 = @"The user is already being prompted.";
              goto LABEL_263;
            default:
              switch(a1)
              {
                case 1500:
                  uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
                  uint64_t v6 = @"An iTunes Store identifier is required.";
                  goto LABEL_263;
                case 1501:
                  uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
                  uint64_t v6 = @"A persistent identifier is required.";
                  goto LABEL_263;
                case 1502:
                  uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
                  uint64_t v6 = @"A URL is required.";
                  goto LABEL_263;
                case 1503:
                  uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
                  uint64_t v6 = @"A file type is required.";
                  goto LABEL_263;
                case 1504:
                  uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
                  uint64_t v6 = @"The file type is invalid.";
                  goto LABEL_263;
                case 1505:
                  uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
                  uint64_t v6 = @"Cannot look up book purchase history.";
                  goto LABEL_263;
                default:
                  goto LABEL_265;
              }
          }
          goto LABEL_265;
        }
        if (a1 <= 1799)
        {
          switch(a1)
          {
            case 1600:
              uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
              uint64_t v6 = @"An iTunes Store identifier or persistent identifier is required.";
              break;
            case 1650:
              uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
              uint64_t v6 = @"Book migration must be complete.";
              break;
            case 1700:
              uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
              uint64_t v6 = @"Cannot get list of users.";
              break;
            default:
              goto LABEL_265;
          }
        }
        else
        {
          switch(a1)
          {
            case 1800:
              uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
              uint64_t v6 = @"A username is required.";
              break;
            case 1801:
              uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
              uint64_t v6 = @"The specified user is logged in.";
              break;
            case 1802:
              uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
              uint64_t v6 = @"The specified user does not exist.";
              break;
            case 1803:
              uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
              uint64_t v6 = @"The specified user has data to sync.";
              break;
            case 1804:
              uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
              uint64_t v6 = @"Could not delete user.";
              break;
            default:
              if (a1 != 1900) {
                goto LABEL_265;
              }
              uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
              uint64_t v6 = @"Cannot remove profile.";
              break;
          }
        }
      }
    }
    else
    {
      if (a1 <= 199)
      {
        switch(a1)
        {
          case 'e':
            id v7 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            uint64_t v8 = @"The provided app “%@” could not be opened.";
            goto LABEL_239;
          case 'f':
            uint64_t v9 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            uint64_t v10 = @"The provided URL “%@” could not be opened.";
LABEL_237:
            uint64_t v11 = objc_msgSend(v9, "cat_localizedStringsForKey:value:table:", v10, &stru_1F18939E8, @"DMFErrors");
            uint64_t v12 = @"urlString";
            goto LABEL_240;
          case 'g':
            uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            uint64_t v6 = @"The volume could not be set.";
            goto LABEL_263;
          case 'h':
            uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            uint64_t v6 = @"A password is required to AirPlay to the requested route.";
            goto LABEL_263;
          case 'i':
            uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            uint64_t v6 = @"The supplied password for the AirPlay route was incorrect.";
            goto LABEL_263;
          case 'j':
            uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            uint64_t v6 = @"Canceling Single App Mode timed out.";
            goto LABEL_263;
          case 'k':
            id v7 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            uint64_t v8 = @"Single App Mode could not be initiated for the provided bundle identifier “%@”.";
            goto LABEL_239;
          case 'l':
            uint64_t v11 = objc_msgSend((id)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle, "cat_localizedStringsForKey:value:table:", @"The shell command “%@” failed.", &stru_1F18939E8, @"DMFErrors");
            uint64_t v12 = @"itemPath";
            goto LABEL_240;
          case 'm':
            uint64_t v13 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            uint64_t v14 = @"The property value for “%@” is missing.";
            goto LABEL_157;
          case 'n':
            uint64_t v13 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            uint64_t v14 = @"Unknown property “%@”.";
            goto LABEL_157;
          case 'o':
            uint64_t v13 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            uint64_t v14 = @"Property “%@” was never retrieved.";
LABEL_157:
            uint64_t v11 = objc_msgSend(v13, "cat_localizedStringsForKey:value:table:", v14, &stru_1F18939E8, @"DMFErrors");
            uint64_t v12 = @"propertyKey";
            goto LABEL_240;
          case 'p':
            uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            uint64_t v6 = @"The AirPlay route is busy.";
            goto LABEL_263;
          case 'q':
            uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            uint64_t v6 = @"The device failed to request AirPlay mirroring.";
            goto LABEL_263;
          case 'r':
            uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            uint64_t v6 = @"The device failed to stop AirPlay mirroring.";
            goto LABEL_263;
          default:
            switch(a1)
            {
              case 0:
                uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
                uint64_t v6 = @"Unknown error.";
                goto LABEL_263;
              case 1:
                uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
                uint64_t v6 = @"A parameter was invalid.";
                goto LABEL_263;
              case 2:
                uint64_t v11 = objc_msgSend((id)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle, "cat_localizedStringsForKey:value:table:", @"Item “%@” is read-only.", &stru_1F18939E8, @"DMFErrors");
                uint64_t v12 = @"itemName";
                goto LABEL_240;
              case 3:
                id v7 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
                uint64_t v8 = @"The app “%@” is not installed.";
                goto LABEL_239;
              case 4:
                uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
                uint64_t v6 = @"The request is not permitted.";
                goto LABEL_263;
              case 5:
                uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
                uint64_t v6 = @"The client is unauthorized to perform the request.";
                goto LABEL_263;
              case 6:
                uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
                uint64_t v6 = @"A temporary file could not be created.";
                goto LABEL_263;
              case 7:
                uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
                uint64_t v6 = @"The operation is not supported on this OS variant.";
                goto LABEL_263;
              default:
                goto LABEL_265;
            }
            goto LABEL_265;
        }
      }
      if (a1 <= 399)
      {
        if (a1 <= 299)
        {
          switch(a1)
          {
            case 200:
              uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
              uint64_t v6 = @"Could not connect cellular.";
              goto LABEL_263;
            case 201:
              uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
              uint64_t v6 = @"Could not refresh cellular plans.";
              goto LABEL_263;
            case 202:
              uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
              uint64_t v6 = @"Cellular hardware not supported.";
              goto LABEL_263;
            case 203:
              uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
              uint64_t v6 = @"Could not fetch cellular info.";
              goto LABEL_263;
            case 204:
              uint64_t v11 = objc_msgSend((id)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle, "cat_localizedStringsForKey:value:table:", @"Could not send cellular request (CTError={%@, %@}).", &stru_1F18939E8, @"DMFErrors");
              id v17 = [v3 objectForKeyedSubscript:@"CTErrorDomain"];
              uint64_t v19 = [v3 objectForKeyedSubscript:@"CTErrorCode"];
              uint64_t v4 = CATFormattedStringForKey();

              goto LABEL_241;
            case 205:
              uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
              uint64_t v6 = @"Invalid response to cellular request.";
              goto LABEL_263;
            default:
              goto LABEL_265;
          }
          goto LABEL_265;
        }
        switch(a1)
        {
          case 300:
            uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            uint64_t v6 = @"The device cannot be locked.";
            break;
          case 301:
            uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            uint64_t v6 = @"A passcode must be set.";
            break;
          case 302:
            uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            uint64_t v6 = @"The device is in lost mode.";
            break;
          default:
            goto LABEL_265;
        }
      }
      else if (a1 > 699)
      {
        if (a1 > 799)
        {
          if (a1 == 800)
          {
            uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            uint64_t v6 = @"Authentication failed.";
          }
          else
          {
            if (a1 != 801) {
              goto LABEL_265;
            }
            uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            uint64_t v6 = @"The request timed out.";
          }
        }
        else if (a1 == 700)
        {
          uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
          uint64_t v6 = @"The escrow secret cannot be copied.";
        }
        else
        {
          if (a1 != 701) {
            goto LABEL_265;
          }
          uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
          uint64_t v6 = @"The device’s passcode cannot be cleared.";
        }
      }
      else
      {
        switch(a1)
        {
          case 600:
            uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            uint64_t v6 = @"The device’s location cannot be determined.";
            break;
          case 601:
            uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            uint64_t v6 = @"The device is not in lost mode.";
            break;
          case 602:
            uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            uint64_t v6 = @"The device’s location cannot be requested at this time.";
            break;
          case 603:
            uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            uint64_t v6 = @"The device’s location cannot be requested at this time because audit information cannot be saved.";
            break;
          default:
            if (a1 == 400)
            {
              uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
              uint64_t v6 = @"The device cannot be put in lost mode.";
            }
            else
            {
              if (a1 != 500) {
                goto LABEL_265;
              }
              uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
              uint64_t v6 = @"The device cannot be taken out of lost mode.";
            }
            break;
        }
      }
    }
  }
  else if (a1 > 2699)
  {
    if (a1 > 3999)
    {
      if (a1 > 4299)
      {
        if (a1 <= 4799)
        {
          if (a1 > 4699)
          {
            if (a1 == 4700)
            {
              uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
              uint64_t v6 = @"Could not update app metadata.";
            }
            else
            {
              if (a1 != 4701) {
                goto LABEL_265;
              }
              uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
              uint64_t v6 = @"App bundle identifier is missing.";
            }
          }
          else if (a1 == 4300)
          {
            uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            uint64_t v6 = @"Could not shut down device.";
          }
          else
          {
            if (a1 != 4400) {
              goto LABEL_265;
            }
            uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            uint64_t v6 = @"Could not restart device.";
          }
        }
        else if (a1 <= 4899)
        {
          if (a1 == 4800)
          {
            uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            uint64_t v6 = @"Could not find target.";
          }
          else
          {
            if (a1 != 4801) {
              goto LABEL_265;
            }
            uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            uint64_t v6 = @"User is not logged in.";
          }
        }
        else
        {
          switch(a1)
          {
            case 4900:
              uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
              uint64_t v6 = @"Unknown transaction.";
              break;
            case 5000:
              uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
              uint64_t v6 = @"Could not set app removability.";
              break;
            case 5200:
              uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
              uint64_t v6 = @"Could not set app Tap To Pay Screen Lock.";
              break;
            default:
              goto LABEL_265;
          }
        }
      }
      else
      {
        switch(a1)
        {
          case 4000:
            uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            uint64_t v6 = @"The configuration payload dictionary is invalid.";
            break;
          case 4001:
            id v15 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            uint64_t v16 = @"The payload identifier “%@” is not unique.";
            goto LABEL_226;
          case 4002:
            id v15 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            uint64_t v16 = @"The organization identifier “%@” is not valid.";
            goto LABEL_226;
          case 4003:
            uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            uint64_t v6 = @"No configuration source is available.";
            break;
          case 4004:
            id v15 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            uint64_t v16 = @"The configuration payload identifier “%@” is not valid.";
            goto LABEL_226;
          case 4005:
            id v15 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            uint64_t v16 = @"The configuration organization identifier “%@” is not unique.";
            goto LABEL_226;
          case 4006:
            id v15 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            uint64_t v16 = @"The limit for organizations of type “%@” has been reached.";
LABEL_226:
            uint64_t v11 = objc_msgSend(v15, "cat_localizedStringsForKey:value:table:", v16, &stru_1F18939E8, @"DMFErrors");
            uint64_t v12 = @"identifier";
            goto LABEL_240;
          case 4007:
            uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            uint64_t v6 = @"Could not load configuration database.";
            break;
          default:
            if (a1 == 4100)
            {
              uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
              uint64_t v6 = @"Could not fetch certificates.";
            }
            else
            {
              if (a1 != 4200) {
                goto LABEL_265;
              }
              uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
              uint64_t v6 = @"Could not fetch security information.";
            }
            break;
        }
      }
    }
    else if (a1 > 3599)
    {
      if (a1 <= 3700)
      {
        switch(a1)
        {
          case 3600:
            uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            uint64_t v6 = @"The activation lock bypass code has expired.";
            break;
          case 3601:
            uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            uint64_t v6 = @"The activation lock bypass code is unavailable.";
            break;
          case 3700:
            uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            uint64_t v6 = @"The app update was canceled.";
            break;
          default:
            goto LABEL_265;
        }
      }
      else
      {
        switch(a1)
        {
          case 3900:
            uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            uint64_t v6 = @"Could not fetch effective policy.";
            break;
          case 3901:
            uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            uint64_t v6 = @"Could not persist the effective policy.";
            break;
          case 3902:
            uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            uint64_t v6 = @"Could not fetch Emergency Mode.";
            break;
          case 3903:
            uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            uint64_t v6 = @"Could not persist Emergency Mode.";
            break;
          case 3904:
            uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            uint64_t v6 = @"Could not register policy changed notification.";
            break;
          default:
            if (a1 == 3701)
            {
              uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
              uint64_t v6 = @"The app update failed.";
            }
            else
            {
              if (a1 != 3950) {
                goto LABEL_265;
              }
              uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
              uint64_t v6 = @"Effective policy not available";
            }
            break;
        }
      }
    }
    else if (a1 > 3099)
    {
      if (a1 <= 3299)
      {
        if (a1 == 3100)
        {
          uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
          uint64_t v6 = @"Cannot validate applications.";
        }
        else
        {
          if (a1 != 3200) {
            goto LABEL_265;
          }
          uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
          uint64_t v6 = @"Could not play lost mode sound.";
        }
      }
      else
      {
        switch(a1)
        {
          case 3300:
            uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            uint64_t v6 = @"Unknown language.";
            break;
          case 3400:
            uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            uint64_t v6 = @"Unknown locale.";
            break;
          case 3500:
            uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
            uint64_t v6 = @"Could not fetch profiles.";
            break;
          default:
            goto LABEL_265;
        }
      }
    }
    else if (a1 <= 2899)
    {
      if (a1 == 2700)
      {
        uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
        uint64_t v6 = @"Could not apply redemption code.";
      }
      else
      {
        if (a1 != 2800) {
          goto LABEL_265;
        }
        uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
        uint64_t v6 = @"Cannot install provisioning profile.";
      }
    }
    else
    {
      switch(a1)
      {
        case 2900:
          uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
          uint64_t v6 = @"Cannot log out user.";
          break;
        case 2901:
          uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
          uint64_t v6 = @"No user logged in.";
          break;
        case 3000:
          uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
          uint64_t v6 = @"Cannot trigger diagnostics.";
          break;
        default:
          goto LABEL_265;
      }
    }
  }
  else if (a1 > 2299)
  {
    if (a1 <= 2500)
    {
      switch(a1)
      {
        case 2300:
          uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
          uint64_t v6 = @"The device name cannot be set.";
          break;
        case 2400:
          uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
          uint64_t v6 = @"Could not fetch provisioning profiles.";
          break;
        case 2500:
          uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
          uint64_t v6 = @"The wallpaper image is bad.";
          break;
        default:
          goto LABEL_265;
      }
    }
    else
    {
      switch(a1)
      {
        case 2600:
          id v7 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
          uint64_t v8 = @"The app “%@” is already installed.";
          goto LABEL_239;
        case 2601:
          uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
          uint64_t v6 = @"The app is not managed.";
          break;
        case 2602:
          uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
          uint64_t v6 = @"The app is a system app.";
          break;
        case 2603:
          id v7 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
          uint64_t v8 = @"The app “%@” is already queued to be installed.";
          goto LABEL_239;
        case 2604:
          uint64_t v9 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
          uint64_t v10 = @"Could not validate manifest.";
          goto LABEL_237;
        case 2605:
          id v7 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
          uint64_t v8 = @"No license was found for app “%@”.";
          goto LABEL_239;
        case 2606:
          uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
          uint64_t v6 = @"Could not validate app identifier.";
          break;
        case 2607:
          uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
          uint64_t v6 = @"The user rejected the request.";
          break;
        case 2608:
          uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
          uint64_t v6 = @"An iTunes Store login is required.";
          break;
        case 2609:
          uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
          uint64_t v6 = @"Too many apps are in the manifest.";
          break;
        case 2610:
          uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
          uint64_t v6 = @"The redemption code is invalid.";
          break;
        case 2611:
          uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
          uint64_t v6 = @"Not waiting for redemption code.";
          break;
        case 2612:
          uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
          uint64_t v6 = @"The replacement media type is invalid.";
          break;
        case 2613:
          uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
          uint64_t v6 = @"The media download failed.";
          break;
        case 2614:
          uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
          uint64_t v6 = @"The media identifier could not be validated.";
          break;
        case 2615:
          uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
          uint64_t v6 = @"Could not find volume purchase program assignment.";
          break;
        case 2616:
          uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
          uint64_t v6 = @"The install failed because the app is being modified.";
          break;
        default:
          if (a1 != 2501) {
            goto LABEL_265;
          }
          uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
          uint64_t v6 = @"Could not set the wallpaper.";
          break;
      }
    }
  }
  else
  {
    if (a1 > 2199)
    {
      switch(a1)
      {
        case 2200:
          uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
          uint64_t v6 = @"A download is in progress.";
          goto LABEL_263;
        case 2201:
          uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
          uint64_t v6 = @"A download is complete.";
          goto LABEL_263;
        case 2202:
          uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
          uint64_t v6 = @"A download failed.";
          goto LABEL_263;
        case 2203:
          uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
          uint64_t v6 = @"There is insufficient network for a download.";
          goto LABEL_263;
        case 2204:
          uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
          uint64_t v6 = @"There is insufficient space for a download.";
          goto LABEL_263;
        case 2205:
          uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
          uint64_t v6 = @"There is insufficient power for a download.";
          goto LABEL_263;
        case 2206:
          uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
          uint64_t v6 = @"The download requires a computer.";
          goto LABEL_263;
        case 2207:
          uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
          uint64_t v6 = @"An installation is in progress.";
          goto LABEL_263;
        case 2208:
          uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
          uint64_t v6 = @"An installation failed.";
          goto LABEL_263;
        case 2209:
          uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
          uint64_t v6 = @"There is insufficient space for an installation.";
          goto LABEL_263;
        case 2210:
          uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
          uint64_t v6 = @"There is insufficient power for an installation.";
          goto LABEL_263;
        case 2211:
          uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
          uint64_t v6 = @"The installation requires a download.";
          goto LABEL_263;
        case 2212:
          uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
          uint64_t v6 = @"The device passcode must be cleared.";
          goto LABEL_263;
        case 2213:
          uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
          uint64_t v6 = @"No update available.";
          goto LABEL_263;
        case 2214:
          uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
          uint64_t v6 = @"Scan failed.";
          goto LABEL_263;
        default:
          goto LABEL_265;
      }
      goto LABEL_265;
    }
    switch(a1)
    {
      case 2000:
        uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
        uint64_t v6 = @"The profile must be installed non-interactively.";
        break;
      case 2001:
        uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
        uint64_t v6 = @"The request cannot be performed while the device is in Setup Assistant.";
        break;
      case 2002:
        uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
        uint64_t v6 = @"Cannot install profile.";
        break;
      case 2003:
        uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
        uint64_t v6 = @"Invalid profile data.";
        break;
      case 2004:
        uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
        uint64_t v6 = @"Invalid file.";
        break;
      default:
        if (a1 == 1901)
        {
          id v15 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
          uint64_t v16 = @"The profile “%@” is not installed.";
          goto LABEL_226;
        }
        if (a1 != 2100) {
          goto LABEL_265;
        }
        uint64_t v5 = (void *)_DMFErrorDescriptionsWithCodeAndUserInfo_bundle;
        uint64_t v6 = @"The device cannot be erased.";
        break;
    }
  }
LABEL_263:
  uint64_t v11 = objc_msgSend(v5, "cat_localizedStringsForKey:value:table:", v6, &stru_1F18939E8, @"DMFErrors");
  uint64_t v4 = CATFormattedStringForKey();
LABEL_264:

LABEL_265:
  return v4;
}

uint64_t CATFormattedStringForKey()
{
  return MEMORY[0x1F410FB88]();
}

uint64_t MKBUserUnlockedSinceBoot()
{
  return MEMORY[0x1F412FA20]();
}

NSString *__cdecl NSHomeDirectoryForUser(NSString *userName)
{
  return (NSString *)MEMORY[0x1F40E7118](userName);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1F40E7258](aSelectorName);
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

void dispatch_assert_queue_V2(dispatch_queue_t queue)
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
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

void dispatch_source_merge_data(dispatch_source_t source, uintptr_t value)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

uid_t getuid(void)
{
  return MEMORY[0x1F40CC570]();
}

in_addr_t inet_addr(const char *a1)
{
  return MEMORY[0x1F40CC660](a1);
}

char *__cdecl inet_ntoa(in_addr a1)
{
  return (char *)MEMORY[0x1F40CC670](*(void *)&a1.s_addr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

BOOL notify_is_valid_token(int val)
{
  return MEMORY[0x1F40CD048](*(void *)&val);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
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

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
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

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x1F40CD570]();
}

uint64_t os_state_remove_handler()
{
  return MEMORY[0x1F40CD578]();
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1F40CD5A0]();
}