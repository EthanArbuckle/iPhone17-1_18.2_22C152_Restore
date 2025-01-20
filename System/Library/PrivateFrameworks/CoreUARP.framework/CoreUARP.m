void OUTLINED_FUNCTION_3(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  uint64_t v4;
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_9(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_9_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_5_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_14()
{
  return v0;
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_3(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_0_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_0_5(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_0_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2_2(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_2_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_7_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_1_3(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_1_4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x12u);
}

void OUTLINED_FUNCTION_3_0(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_3_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_11(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0xEu);
}

void OUTLINED_FUNCTION_10(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_10_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void sub_21E07F66C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21E07F6E0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21E07FCBC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21E0835A8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

const char *UARPAccessoryPropertyToString(unint64_t a1)
{
  if (a1 > 0x29) {
    return "unrecognized";
  }
  else {
    return off_264491788[a1];
  }
}

const char *UARPFirmwareStagingCompletionStatusToString(unint64_t a1)
{
  if (a1 > 0x25) {
    return "unrecognized";
  }
  else {
    return off_2644918D8[a1];
  }
}

const char *UARPFirmwareApplicationStatusToString(unint64_t a1)
{
  if (a1 > 5) {
    return "unrecognized";
  }
  else {
    return off_264491A08[a1];
  }
}

const char *UARPAssetLocationTypeToString(unint64_t a1)
{
  if (a1 > 0x11) {
    return "unrecognized";
  }
  else {
    return off_264491A38[a1];
  }
}

id UARPAssetLocationTypeToURL(uint64_t a1)
{
  switch(a1)
  {
    case 11:
      uint64_t v1 = NSURL;
      v2 = kUARPAssetLocationTypeMobileAssetServerBasejumperStr;
      goto LABEL_8;
    case 12:
      v3 = currentTrainName();

      if (v3)
      {
        uint64_t v4 = NSURL;
        uint64_t v5 = currentTrainName();
        v6 = [@"https://basejumper.apple.com/livability/" stringByAppendingString:v5];
        v3 = [v4 URLWithString:v6];
      }
      break;
    case 13:
      uint64_t v1 = NSURL;
      v2 = kUARPAssetLocationTypeMobileAssetServerMesuMacOSStr;
      goto LABEL_8;
    case 14:
      uint64_t v1 = NSURL;
      v2 = kUARPAssetLocationTypeMobileAssetServerMesuStagingStr;
LABEL_8:
      v3 = [v1 URLWithString:*v2];
      break;
    default:
      v3 = 0;
      break;
  }
  return v3;
}

const char *UARPAssetDownloadStatusToString(unint64_t a1)
{
  if (a1 > 2) {
    return "unrecognized";
  }
  else {
    return off_264491AC8[a1];
  }
}

const char *UARPAssetValidationStatusToString(unint64_t a1)
{
  if (a1 > 2) {
    return "unrecognized";
  }
  else {
    return off_264491AE0[a1];
  }
}

const char *UARPFirmwareUpdateAvailabilityStatusToString(unint64_t a1)
{
  if (a1 > 8) {
    return "unrecognized";
  }
  else {
    return off_264491AF8[a1];
  }
}

const char *UARPAccessoryTransportToString(unint64_t a1)
{
  if (a1 > 0xA) {
    return "unrecognized";
  }
  else {
    return off_264491B40[a1];
  }
}

unint64_t UARPAccessoryTransportStringToType(void *a1)
{
  id v1 = a1;
  unint64_t v2 = 0;
  while (1)
  {
    v3 = "unrecognized";
    if (v2 <= 0xA) {
      v3 = off_264491B40[v2];
    }
    uint64_t v4 = [NSString stringWithUTF8String:v3];
    char v5 = [v1 isEqualToString:v4];

    if (v5) {
      break;
    }
    if (++v2 == 11)
    {
      unint64_t v2 = 0;
      break;
    }
  }

  return v2;
}

const char *UARPAccessoryCapabilityToString(uint64_t a1)
{
  id v1 = "CHIP";
  unint64_t v2 = "unrecognized";
  if (a1 == 1) {
    unint64_t v2 = "power source";
  }
  if (a1 != 16) {
    id v1 = v2;
  }
  if (a1) {
    return v1;
  }
  else {
    return "none";
  }
}

const char *UARPAccessoryHardwareFusingToString(unint64_t a1)
{
  if (a1 > 2) {
    return "unrecognized";
  }
  else {
    return off_264491B98[a1];
  }
}

const char *UARPAccessoryVendorIDSourceToString(uint64_t a1)
{
  id v1 = "unrecognized";
  if (a1 == 2) {
    id v1 = "USB-IF";
  }
  if (a1 == 1) {
    return "Bluetooth-SIG";
  }
  else {
    return v1;
  }
}

const char *UARPControllerCapabilityToString(uint64_t a1)
{
  id v1 = "unrecognized";
  if (a1 == 1) {
    id v1 = "CHIP";
  }
  if (a1) {
    return v1;
  }
  else {
    return "UARP";
  }
}

const char *UARPAssetCheckOptionsToString(int a1)
{
  if (a1 == 1) {
    return "download asset";
  }
  else {
    return "unrecognized";
  }
}

const char *UARPUSBPDDeviceClassToString(unint64_t a1)
{
  if (a1 > 2) {
    return "unrecognized";
  }
  else {
    return off_264491BB0[a1];
  }
}

const char *UARPAccessoryUSBPDLocationTypeToString(unint64_t a1)
{
  if (a1 > 2) {
    return "unrecognized";
  }
  else {
    return off_264491BC8[a1];
  }
}

const char *UARPHashAlgorithmToString(unint64_t a1)
{
  if (a1 > 3) {
    return "unrecognized";
  }
  else {
    return off_264491BE0[a1];
  }
}

void sub_21E08B8B8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id UARPPersonalizationTSSRequestWithSigningServer(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  char v5 = String();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    UARPPersonalizationTSSRequestWithSigningServer_cold_3();
  }

  v6 = String(v3, v4, 0);
  v7 = String();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
  if (v6)
  {
    if (v8) {
      UARPPersonalizationTSSRequestWithSigningServer_cold_2();
    }

    id v9 = v6;
  }
  else
  {
    if (v8) {
      UARPPersonalizationTSSRequestWithSigningServer_cold_1();
    }

    uint64_t v10 = (void *)MGCopyAnswer();
    int v11 = [v10 BOOLValue];
    v12 = 0;
    if (v11)
    {
      v12 = UARPPersonalizationTSSRequestWithSigningServerSSO(v3, v4);
    }
    id v9 = v12;
  }
  return v9;
}

id String()
{
  if (TSSRequestLogToken_onceToken != -1) {
    dispatch_once(&TSSRequestLogToken_onceToken, &__block_literal_global_0);
  }
  uint64_t v0 = (void *)TSSRequestLogToken_logToken;
  return v0;
}

id String(void *a1, void *a2, int a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = a2;
  v7 = String();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v23 = v6;
    _os_log_impl(&dword_21E079000, v7, OS_LOG_TYPE_INFO, "UARP: TSS request to signing server %{public}@", buf, 0xCu);
  }

  AMAuthInstallLogSetHandler();
  uint64_t v8 = AMAuthInstallCreate();
  if (v8)
  {
    id v9 = (const void *)v8;
    if (AMAuthInstallSetSigningServerURL())
    {
      uint64_t v10 = String();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        TSSRequestWithSigningServer_cold_5();
      }
LABEL_7:

      CFRelease(v9);
      goto LABEL_11;
    }
    if (a3)
    {
      v13 = String();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21E079000, v13, OS_LOG_TYPE_INFO, "UARP: TSS request is using SSO", buf, 2u);
      }

      if (AMAuthInstallSsoInitialize())
      {
        uint64_t v10 = String();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          TSSRequestWithSigningServer_cold_4();
        }
        goto LABEL_7;
      }
      if (AMAuthInstallSsoEnable())
      {
        uint64_t v10 = String();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          TSSRequestWithSigningServer_cold_3();
        }
        goto LABEL_7;
      }
    }
    v14 = String();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      if (a3) {
        v15 = @" <AppleConnect>";
      }
      else {
        v15 = @" ";
      }
      *(_DWORD *)buf = 138543618;
      id v23 = v6;
      __int16 v24 = 2114;
      v25 = v15;
      _os_log_impl(&dword_21E079000, v14, OS_LOG_TYPE_INFO, "UARP: TSS Request %{public}@%{public}@ is ", buf, 0x16u);
    }

    v16 = String();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v23 = v6;
      _os_log_impl(&dword_21E079000, v16, OS_LOG_TYPE_INFO, "UARP: %{public}@", buf, 0xCu);
    }

    int PersonalizedResponse = AMAuthInstallApCreatePersonalizedResponse();
    v18 = String();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      if (a3) {
        v19 = @" <AppleConnect>";
      }
      else {
        v19 = @" ";
      }
      *(_DWORD *)buf = 138543618;
      id v23 = v6;
      __int16 v24 = 2114;
      v25 = v19;
      _os_log_impl(&dword_21E079000, v18, OS_LOG_TYPE_INFO, "UARP: TSS Response %{public}@%{public}@ is ", buf, 0x16u);
    }

    v20 = String();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      id v23 = 0;
      _os_log_impl(&dword_21E079000, v20, OS_LOG_TYPE_INFO, "UARP: %{public}@", buf, 0xCu);
    }

    if (PersonalizedResponse)
    {
      v21 = String();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        TSSRequestWithSigningServer_cold_2(PersonalizedResponse, v21);
      }
    }
    CFRelease(v9);
  }
  else
  {
    int v11 = String();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      TSSRequestWithSigningServer_cold_1();
    }
  }
LABEL_11:

  return 0;
}

id UARPPersonalizationTSSRequestWithSigningServerSSO(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = String();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    UARPPersonalizationTSSRequestWithSigningServerSSO_cold_2();
  }

  id v6 = String(v3, v4, 1);
  if (!v6)
  {
    v7 = String();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      UARPPersonalizationTSSRequestWithSigningServerSSO_cold_1();
    }
  }
  return v6;
}

uint64_t __TSSRequestLogToken_block_invoke()
{
  TSSRequestLogToken_logToken = (uint64_t)os_log_create("com.apple.accessoryupdater.uarp", "personalization");
  return MEMORY[0x270F9A758]();
}

void String(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = String();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 136446210;
    uint64_t v5 = a2;
    _os_log_impl(&dword_21E079000, v3, OS_LOG_TYPE_INFO, "UARP: Personalization Message >> %{public}s", (uint8_t *)&v4, 0xCu);
  }
}

void sub_21E08C4E8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id UARPStringDynamicAssetsFilepath()
{
  if (UARPStringDynamicAssetsFilepath_onceToken != -1) {
    dispatch_once(&UARPStringDynamicAssetsFilepath_onceToken, &__block_literal_global_1);
  }
  uint64_t v0 = (void *)UARPStringDynamicAssetsFilepath_path;
  return v0;
}

void __UARPStringDynamicAssetsFilepath_block_invoke()
{
  uint64_t v0 = NSString;
  InternalStorageDirectoryPath();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 stringWithFormat:@"%@/%@", v3, @"dynamicassets"];
  unint64_t v2 = (void *)UARPStringDynamicAssetsFilepath_path;
  UARPStringDynamicAssetsFilepath_path = v1;
}

id UARPStringSupplementalAssetsFilepath()
{
  if (UARPStringSupplementalAssetsFilepath_onceToken != -1) {
    dispatch_once(&UARPStringSupplementalAssetsFilepath_onceToken, &__block_literal_global_741);
  }
  uint64_t v0 = (void *)UARPStringSupplementalAssetsFilepath_path;
  return v0;
}

void __UARPStringSupplementalAssetsFilepath_block_invoke()
{
  uint64_t v0 = NSString;
  InternalStorageDirectoryPath();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 stringWithFormat:@"%@/%@", v3, @"supplementalassets"];
  unint64_t v2 = (void *)UARPStringSupplementalAssetsFilepath_path;
  UARPStringSupplementalAssetsFilepath_path = v1;
}

id UARPStringTempFilesFilepath()
{
  if (UARPStringTempFilesFilepath_onceToken != -1) {
    dispatch_once(&UARPStringTempFilesFilepath_onceToken, &__block_literal_global_743);
  }
  uint64_t v0 = (void *)UARPStringTempFilesFilepath_path;
  return v0;
}

void __UARPStringTempFilesFilepath_block_invoke()
{
  uint64_t v0 = NSString;
  InternalStorageDirectoryPath();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 stringWithFormat:@"%@/%@", v3, @"tmpfiles"];
  unint64_t v2 = (void *)UARPStringTempFilesFilepath_path;
  UARPStringTempFilesFilepath_path = v1;
}

id UARPStringPcapFilesFilepath()
{
  if (UARPStringPcapFilesFilepath_onceToken != -1) {
    dispatch_once(&UARPStringPcapFilesFilepath_onceToken, &__block_literal_global_745);
  }
  uint64_t v0 = (void *)UARPStringPcapFilesFilepath_path;
  return v0;
}

void __UARPStringPcapFilesFilepath_block_invoke()
{
  uint64_t v0 = (void *)MEMORY[0x263EFF8C0];
  uint64_t v1 = InternalStorageDirectoryPath();
  objc_msgSend(v0, "arrayWithObjects:", v1, @"pcapfiles", 0);
  id v4 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v2 = [NSString pathWithComponents:v4];
  id v3 = (void *)UARPStringPcapFilesFilepath_path;
  UARPStringPcapFilesFilepath_path = v2;
}

id UARPPayloadHashAlgorithmStringToValue(void *a1)
{
  id v1 = a1;
  if ([v1 caseInsensitiveCompare:@"SHA-256"])
  {
    if ([v1 caseInsensitiveCompare:@"SHA-384"])
    {
      uint64_t v2 = [v1 caseInsensitiveCompare:@"SHA-512"];
      id v3 = NSNumber;
      if (v2) {
        uint64_t v4 = 0;
      }
      else {
        uint64_t v4 = 3;
      }
    }
    else
    {
      id v3 = NSNumber;
      uint64_t v4 = 2;
    }
  }
  else
  {
    id v3 = NSNumber;
    uint64_t v4 = 1;
  }
  uint64_t v5 = [v3 numberWithUnsignedShort:v4];

  return v5;
}

id UARPStringTmapDirectoryPath()
{
  if (UARPStringTmapDirectoryPath_onceToken != -1) {
    dispatch_once(&UARPStringTmapDirectoryPath_onceToken, &__block_literal_global_878);
  }
  uint64_t v0 = (void *)UARPStringTmapDirectoryPath_path;
  return v0;
}

void __UARPStringTmapDirectoryPath_block_invoke()
{
  uint64_t v0 = NSString;
  InternalStorageDirectoryPath();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 stringWithFormat:@"%@/%@", v3, @"tmap"];
  uint64_t v2 = (void *)UARPStringTmapDirectoryPath_path;
  UARPStringTmapDirectoryPath_path = v1;
}

id UARPStringTmapDatabaseFilePath()
{
  if (UARPStringTmapDatabaseFilePath_onceToken != -1) {
    dispatch_once(&UARPStringTmapDatabaseFilePath_onceToken, &__block_literal_global_880);
  }
  uint64_t v0 = (void *)UARPStringTmapDatabaseFilePath_path;
  return v0;
}

void __UARPStringTmapDatabaseFilePath_block_invoke()
{
  uint64_t v0 = NSString;
  UARPStringTmapDirectoryPath();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 stringWithFormat:@"%@/%@", v3, @"tmapdatabase"];
  uint64_t v2 = (void *)UARPStringTmapDatabaseFilePath_path;
  UARPStringTmapDatabaseFilePath_path = v1;
}

id UARPStringTapToRadarFilePath()
{
  if (UARPStringTapToRadarFilePath_onceToken != -1) {
    dispatch_once(&UARPStringTapToRadarFilePath_onceToken, &__block_literal_global_885);
  }
  uint64_t v0 = (void *)UARPStringTapToRadarFilePath_path;
  return v0;
}

void __UARPStringTapToRadarFilePath_block_invoke()
{
  uint64_t v0 = NSString;
  InternalStorageDirectoryPath();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 stringWithFormat:@"%@/%@", v3, @"taptoradar"];
  uint64_t v2 = (void *)UARPStringTapToRadarFilePath_path;
  UARPStringTapToRadarFilePath_path = v1;
}

id UARPStringLogsDirectoryFilePath()
{
  if (UARPStringLogsDirectoryFilePath_onceToken != -1) {
    dispatch_once(&UARPStringLogsDirectoryFilePath_onceToken, &__block_literal_global_890);
  }
  uint64_t v0 = (void *)UARPStringLogsDirectoryFilePath_path;
  return v0;
}

void __UARPStringLogsDirectoryFilePath_block_invoke()
{
  uint64_t v0 = NSString;
  UARPStringTapToRadarFilePath();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 stringWithFormat:@"%@/%@", v3, @"logs"];
  uint64_t v2 = (void *)UARPStringLogsDirectoryFilePath_path;
  UARPStringLogsDirectoryFilePath_path = v1;
}

id UARPStringCrashAnalyticsDirectoryFilePath()
{
  if (UARPStringCrashAnalyticsDirectoryFilePath_onceToken != -1) {
    dispatch_once(&UARPStringCrashAnalyticsDirectoryFilePath_onceToken, &__block_literal_global_895);
  }
  uint64_t v0 = (void *)UARPStringCrashAnalyticsDirectoryFilePath_path;
  return v0;
}

void __UARPStringCrashAnalyticsDirectoryFilePath_block_invoke()
{
  uint64_t v0 = NSString;
  UARPStringTapToRadarFilePath();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 stringWithFormat:@"%@/%@", v3, @"crsh"];
  uint64_t v2 = (void *)UARPStringCrashAnalyticsDirectoryFilePath_path;
  UARPStringCrashAnalyticsDirectoryFilePath_path = v1;
}

id UARPStringCmapDirectoryPath()
{
  if (UARPStringCmapDirectoryPath_onceToken != -1) {
    dispatch_once(&UARPStringCmapDirectoryPath_onceToken, &__block_literal_global_966);
  }
  uint64_t v0 = (void *)UARPStringCmapDirectoryPath_path;
  return v0;
}

void __UARPStringCmapDirectoryPath_block_invoke()
{
  uint64_t v0 = NSString;
  InternalStorageDirectoryPath();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 stringWithFormat:@"%@/%@", v3, @"cmap"];
  uint64_t v2 = (void *)UARPStringCmapDirectoryPath_path;
  UARPStringCmapDirectoryPath_path = v1;
}

id UARPStringCmapDatabaseFilePath()
{
  if (UARPStringCmapDatabaseFilePath_onceToken != -1) {
    dispatch_once(&UARPStringCmapDatabaseFilePath_onceToken, &__block_literal_global_968);
  }
  uint64_t v0 = (void *)UARPStringCmapDatabaseFilePath_path;
  return v0;
}

void __UARPStringCmapDatabaseFilePath_block_invoke()
{
  uint64_t v0 = NSString;
  UARPStringCmapDirectoryPath();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 stringWithFormat:@"%@/%@", v3, @"cmapdatabase"];
  uint64_t v2 = (void *)UARPStringCmapDatabaseFilePath_path;
  UARPStringCmapDatabaseFilePath_path = v1;
}

id UARPStringSysdiagnoseDirectoryFilePath()
{
  if (UARPStringSysdiagnoseDirectoryFilePath_onceToken != -1) {
    dispatch_once(&UARPStringSysdiagnoseDirectoryFilePath_onceToken, &__block_literal_global_976);
  }
  uint64_t v0 = (void *)UARPStringSysdiagnoseDirectoryFilePath_path;
  return v0;
}

void __UARPStringSysdiagnoseDirectoryFilePath_block_invoke()
{
  uint64_t v0 = NSString;
  InternalStorageDirectoryPath();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 stringWithFormat:@"%@/%@", v3, @"sysdiagnose"];
  uint64_t v2 = (void *)UARPStringSysdiagnoseDirectoryFilePath_path;
  UARPStringSysdiagnoseDirectoryFilePath_path = v1;
}

id UARPStringPifMetricsFilePath()
{
  if (UARPStringPifMetricsFilePath_onceToken != -1) {
    dispatch_once(&UARPStringPifMetricsFilePath_onceToken, &__block_literal_global_981);
  }
  uint64_t v0 = (void *)UARPStringPifMetricsFilePath_path;
  return v0;
}

void __UARPStringPifMetricsFilePath_block_invoke()
{
  uint64_t v0 = NSString;
  UARPStringSysdiagnoseDirectoryFilePath();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 stringWithFormat:@"%@/%@", v3, @"com.apple.Bluetooth.AccessoryCase.pif_daily"];
  uint64_t v2 = (void *)UARPStringPifMetricsFilePath_path;
  UARPStringPifMetricsFilePath_path = v1;
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

void sub_21E09510C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
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

void sub_21E098508(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21E0991BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCSVoiceTriggerRTModelClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getCSVoiceTriggerRTModelClass_softClass;
  uint64_t v7 = getCSVoiceTriggerRTModelClass_softClass;
  if (!getCSVoiceTriggerRTModelClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getCSVoiceTriggerRTModelClass_block_invoke;
    v3[3] = &unk_2644926F0;
    v3[4] = &v4;
    __getCSVoiceTriggerRTModelClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21E09A828(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCSVoiceTriggerRTModelClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!CoreSpeechLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __CoreSpeechLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_264492710;
    uint64_t v6 = 0;
    CoreSpeechLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!CoreSpeechLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("CSVoiceTriggerRTModel");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getCSVoiceTriggerRTModelClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getCSVoiceTriggerRTModelClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __CoreSpeechLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CoreSpeechLibraryCore_frameworkLibrary = result;
  return result;
}

id UARPArrayOfExpiredFiles(void *a1, void *a2, double a3)
{
  v40[2] = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = a2;
  v33 = objc_opt_new();
  v32 = v5;
  uint64_t v7 = [MEMORY[0x263F089D8] stringWithString:v5];
  uint64_t v8 = v7;
  v31 = v6;
  if (v6)
  {
    uint64_t v9 = [v7 stringByAppendingPathComponent:v6];

    uint64_t v8 = (void *)v9;
  }
  uint64_t v10 = [MEMORY[0x263F08850] defaultManager];
  int v11 = [v10 enumeratorAtPath:v8];

  v12 = [MEMORY[0x263EFF910] now];
  v35 = v11;
  uint64_t v13 = [v11 nextObject];
  if (v13)
  {
    v14 = (void *)v13;
    uint64_t v34 = *MEMORY[0x263F08048];
    v15 = &_os_log_internal;
    do
    {
      v16 = NSString;
      v40[0] = v8;
      v40[1] = v14;
      v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v40 count:2];
      v18 = [v16 pathWithComponents:v17];

      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        UARPArrayOfExpiredFiles_cold_1(v38, (uint64_t)v18, &v39);
      }
      id v19 = v12;
      v20 = (void *)MEMORY[0x263F08850];
      id v21 = v18;
      v22 = [v20 defaultManager];
      id v23 = [v22 attributesOfItemAtPath:v21 error:0];

      if (v23)
      {
        __int16 v24 = [v23 objectForKeyedSubscript:v34];
        [v24 dateByAddingTimeInterval:a3];
        uint64_t v26 = v25 = v15;
        uint64_t v27 = [v19 compare:v26];

        v15 = v25;
        if (v27 == 1)
        {
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v37 = v21;
            _os_log_impl(&dword_21E079000, v25, OS_LOG_TYPE_DEFAULT, "Expired temp file %@ ", buf, 0xCu);
          }
          [v33 addObject:v21];
        }
      }
      else
      {
      }
      uint64_t v28 = [v35 nextObject];

      v14 = (void *)v28;
    }
    while (v28);
  }
  v29 = [MEMORY[0x263EFF8C0] arrayWithArray:v33];

  return v29;
}

void sub_21E09B758(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21E09B7CC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21E09B840(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21E09C700(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_21E09C790(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_21E0A0A84(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21E0A0C20(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21E0A0D60(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21E0A0DE4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21E0A0E68(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21E0A0EEC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21E0A0F70(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21E0A0FF4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21E0A1078(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21E0A10FC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21E0A1180(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21E0A1204(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21E0A1288(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21E0A13B4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21E0A15D8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21E0A1644(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21E0A16C0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21E0A1884(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21E0A1904(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21E0A1FA4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id generateSHA256HashForDataAtLocationAsData(void *a1, uint64_t a2)
{
  return generateHashForDataAtLocationAsData(a1, 10, a2);
}

id generateHashForDataAtLocationAsData(void *a1, int a2, uint64_t a3)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v5 = a1;
  uint64_t v6 = [MEMORY[0x263F08840] fileHandleForReadingFromURL:v5 error:a3];
  uint64_t v7 = (void *)v6;
  uint64_t v8 = 0;
  if (a2 && v6)
  {
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v9 = CCDigestInit();
    do
    {
      uint64_t v10 = (void *)MEMORY[0x223C1FC50](v9);
      objc_msgSend(v7, "uarpReadDataUpToLength:error:", 0x4000, a3, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30,
        v31,
        v32,
        v33,
        v34,
        v35,
        v36,
        v37,
        v38,
        v39,
        v40,
        v41,
        v42,
        v43,
        v44,
        (void)v45);
      id v11 = objc_claimAutoreleasedReturnValue();
      [v11 bytes];
      [v11 length];
      CCDigestUpdate();
      unint64_t v12 = [v11 length];
    }
    while (v12 >> 14);
    uint64_t OutputSize = CCDigestGetOutputSize();
    v14 = (char *)&v16 - ((MEMORY[0x270FA5388]() + 15) & 0xFFFFFFFFFFFFFFF0);
    CCDigestFinal();
    if ([v7 uarpCloseAndReturnError:a3]) {
      uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:v14 length:OutputSize];
    }
    else {
      uint64_t v8 = 0;
    }
  }

  return v8;
}

id generateSHA256HashForDataAtLocation(void *a1, uint64_t a2)
{
  return generateHashForDataAtLocation(a1, 10, a2);
}

id generateHashForDataAtLocation(void *a1, int a2, uint64_t a3)
{
  id v3 = generateHashForDataAtLocationAsData(a1, a2, a3);
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
    uint64_t v6 = [v5 bytes];
    id v7 = objc_alloc_init(MEMORY[0x263F089D8]);
    if ([v5 length])
    {
      unint64_t v8 = 0;
      do
        objc_msgSend(v7, "appendFormat:", @"%02x", *(unsigned __int8 *)(v6 + v8++));
      while (v8 < [v5 length]);
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

id generateBase64HashForDataAtLocation(void *a1, int a2, uint64_t a3)
{
  id v3 = generateHashForDataAtLocationAsData(a1, a2, a3);
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = [v3 base64EncodedStringWithOptions:0];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

void sub_21E0A81B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
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

void sub_21E0A92D8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21E0A9A0C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_21E0AA8D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
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

void sub_21E0AABAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v6 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_21E0AADF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v6 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_21E0AB1F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E0AB4B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va1, a8);
  va_start(va, a8);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v8 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_21E0AB6E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E0AB920(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v6 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_21E0ABAEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E0ABC90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E0ABE34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E0ABFD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E0AC17C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E0AC3B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v6 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_21E0AD1D0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21E0AEC84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

void *__getRTBuddyCrashlogDecodeSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v5[0] = 0;
  if (!RTBuddyCrashlogDecoderLibraryCore_frameworkLibrary)
  {
    v5[1] = MEMORY[0x263EF8330];
    v5[2] = 3221225472;
    v5[3] = __RTBuddyCrashlogDecoderLibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_264492980;
    uint64_t v7 = 0;
    RTBuddyCrashlogDecoderLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v3 = (void *)v5[0];
    uint64_t v2 = (void *)RTBuddyCrashlogDecoderLibraryCore_frameworkLibrary;
    if (RTBuddyCrashlogDecoderLibraryCore_frameworkLibrary)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  uint64_t v2 = (void *)RTBuddyCrashlogDecoderLibraryCore_frameworkLibrary;
LABEL_5:
  uint64_t result = dlsym(v2, "RTBuddyCrashlogDecode");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getRTBuddyCrashlogDecodeSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __RTBuddyCrashlogDecoderLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  RTBuddyCrashlogDecoderLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_21E0AFAC8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

const char *UARPAnalyticsAssetChannelTypeToString(unint64_t a1)
{
  if (a1 > 6) {
    return "unrecognized";
  }
  else {
    return off_2644929C0[a1];
  }
}

const char *UARPAnalyticsAssetDownloadStatusToString(unint64_t a1)
{
  if (a1 > 4) {
    return "unrecognized";
  }
  else {
    return off_2644929F8[a1];
  }
}

const char *UARPAnalyticsStagingStatusToString(unint64_t a1)
{
  if (a1 > 0xC) {
    return "unrecognized";
  }
  else {
    return off_264492A20[a1];
  }
}

const char *UARPAnalyticsApplyStatusToString(unint64_t a1)
{
  if (a1 > 7) {
    return "unrecognized";
  }
  else {
    return off_264492A88[a1];
  }
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

void sub_21E0B7C20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E0BD6FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21E0BDAA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21E0BE2C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21E0BE940(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21E0BEEB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21E0BF410(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E0BF860(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E0C0374(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void UARPPowerLogAccessoryReachable(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  _getEventDictionaryForState(0, a1);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v7 setObject:v6 forKeyedSubscript:@"activeFWVers"];

  [v7 setObject:v5 forKeyedSubscript:@"fwVersion"];
  PLLogRegisteredEvent();
}

id _getEventDictionaryForState(uint64_t a1, void *a2)
{
  v11[2] = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)MEMORY[0x263EFF9A0];
  v10[0] = @"state";
  uint64_t v4 = NSNumber;
  id v5 = a2;
  id v6 = [v4 numberWithInt:a1];
  v10[1] = @"model";
  v11[0] = v6;
  v11[1] = v5;
  id v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
  uint64_t v8 = [v3 dictionaryWithDictionary:v7];

  return v8;
}

void UARPPowerLogAccessoryUnreachable(void *a1)
{
  _getEventDictionaryForState(1, a1);
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  PLLogRegisteredEvent();
}

void UARPPowerLogAssetOffered(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  _getEventDictionaryForState(2, a1);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v7 setObject:v6 forKeyedSubscript:@"activeFWVers"];

  [v7 setObject:v5 forKeyedSubscript:@"fwVersion"];
  PLLogRegisteredEvent();
}

void UARPPowerLogStagingStatus(void *a1, void *a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v9 = a3;
  id v10 = a2;
  _getEventDictionaryForState(3, a1);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  [v13 setObject:v10 forKeyedSubscript:@"activeFWVers"];

  [v13 setObject:v9 forKeyedSubscript:@"fwVersion"];
  id v11 = [NSNumber numberWithUnsignedInt:a4];
  [v13 setObject:v11 forKeyedSubscript:@"requestOffset"];

  uint64_t v12 = [NSNumber numberWithUnsignedInt:a5];
  [v13 setObject:v12 forKeyedSubscript:@"bytesTransferred"];

  PLLogRegisteredEvent();
}

void UARPPowerLogStagingComplete(void *a1, void *a2, void *a3, uint64_t a4)
{
  id v7 = a3;
  id v8 = a2;
  _getEventDictionaryForState(4, a1);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v10 setObject:v8 forKeyedSubscript:@"activeFWVers"];

  [v10 setObject:v7 forKeyedSubscript:@"fwVersion"];
  id v9 = [NSNumber numberWithInt:a4];
  [v10 setObject:v9 forKeyedSubscript:@"error"];

  PLLogRegisteredEvent();
}

void sub_21E0C27C4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21E0C285C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21E0C28E8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21E0C296C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21E0C2A80(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21E0C2B7C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21E0C2CD0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21E0C2D5C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21E0C2DF4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21E0C31D0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21E0C3254(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21E0C32D8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21E0C6FA8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21E0C80D0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t UARPPlatformEndpointRequestAppleInfoProperty(void *a1, void *a2, unsigned int a3)
{
  id v5 = a2;
  id v6 = a1;
  int v11 = uarpHtonl(a3);
  uint64_t v7 = [v6 uarpEndpoint];

  uint64_t v8 = [v5 uarpEndpoint];
  id v9 = uarpOuiAppleGenericFeatures();
  if (uarpPlatformEndpointSendVendorSpecific(v7, v8, v9, 0x20u, &v11, 4u)) {
    return 3;
  }
  else {
    return 0;
  }
}

uint64_t UARPPlatformControllerInit(void *a1)
{
  id v1 = a1;
  bzero((void *)[v1 uarpEndpoint], 0x260uLL);
  uint64_t v8 = 4;
  uint64_t v10 = 0;
  uint64_t v9 = 0;
  uint64_t v6 = 0x800000008000;
  int v7 = 0x8000;
  v5[30] = 0u;
  uint64_t v2 = objc_msgSend(v1, "uarpVendorExtension", 0, 0, 0, 0, fCoreUARPLayer3SendMessage, fCoreUARPLayer3DataTransferPause, fCoreUARPLayer3DataTransferPauseAck, fCoreUARPLayer3DataTransferResume, fCoreUARPLayer3DataTransferResumeAck, fCoreUARPLayer3SuperBinaryOffered, fCoreUARPLayer3DynamicAssetOffered, fCoreUARPLayer3ApplyStagedAssets, fCoreUARPLayer3ApplyStagedAssetsResponse, fCoreUARPLayer3ManufacturerName, fCoreUARPLayer3ManufacturerNameResponse, fCoreUARPLayer3ModelName, fCoreUARPLayer3ModelNameResponse,
         fCoreUARPLayer3SerialNumber,
         fCoreUARPLayer3SerialNumberResponse,
         fCoreUARPLayer3HardwareVersion,
         fCoreUARPLayer3HardwareVersionResponse,
         fCoreUARPLayer3ActiveFirmwareVersion2,
         fCoreUARPLayer3ActiveFirmwareVersionResponse,
         fCoreUARPLayer3StagedFirmwareVersion2,
         fCoreUARPLayer3StagedFirmwareVersionResponse,
         fCoreUARPLayer3LastError,
         fCoreUARPLayer3LastErrorResponse,
         fCoreUARPLayer3StatisticsResponse,
         fCoreUARPLayer3AssetSolicitation,
         fCoreUARPLayer3RescindAllAssets,
         fCoreUARPLayer3RescindAllAssetsAck,
         fCoreUARPLayer3WatchdogSet,
         fCoreUARPLayer3WatchdogCancel,
         fCoreUARPLayer3ProtocolVersion,
         0,
         fCoreUARPLayer3FriendlyNameResponse,
         0,
         0,
         uarpPlatformDarwinHashInfo,
         uarpPlatformDarwinHashInit,
         uarpPlatformDarwinHashUpdate,
         uarpPlatformDarwinHashFinal,
         uarpPlatformDarwinHashLog,
         0,
         fCoreUARPLayer3AUDLogError,
         fCoreUARPLayer3AUDLogInfo,
         fCoreUARPLayer3AUDLogDebug,
         fCoreUARPLayer3AUDLogFault,
         0,
         fUarpLayer3DownstreamReachable,
         fUarpLayer3DownstreamUnreachable,
         0,
         fUarpLayer3DownstreamRecvMessage,
         0,
         fCoreUARPLayer3VendorSpecificRecvMsg,
         fCoreUARPLayer3VendorSpecificCheckExpectedResponse,
         fCoreUARPLayer3VendorSpecificCheckValidToSend,
         fCoreUARPLayer3VendorSpecificExceededRetries,
         0,
         0,
         0);
  *(_OWORD *)uint64_t v2 = 0u;
  *(_OWORD *)(v2 + 16) = 0u;
  *(_OWORD *)(v2 + 32) = 0u;
  *(_OWORD *)(v2 + 48) = 0u;
  *(_OWORD *)(v2 + 64) = 0u;
  *(_OWORD *)(v2 + 80) = 0u;
  *(_OWORD *)(v2 + 96) = 0u;
  *(_OWORD *)(v2 + 112) = 0u;
  *(_OWORD *)(v2 + 128) = 0u;
  *(_OWORD *)(v2 + 144) = 0u;
  *(_OWORD *)(v2 + 160) = 0u;
  *(_OWORD *)(v2 + 176) = 0u;
  *(_OWORD *)(v2 + 192) = 0u;
  *(_OWORD *)(v2 + 208) = 0u;
  *(_OWORD *)(v2 + 224) = 0u;
  *(_OWORD *)(v2 + 240) = 0u;
  *(_OWORD *)(v2 + 256) = 0u;
  *(_OWORD *)(v2 + 272) = 0u;
  *(_OWORD *)(v2 + 288) = 0u;
  *(_OWORD *)(v2 + 304) = 0u;
  *(_OWORD *)(v2 + 320) = 0u;
  *(_OWORD *)(v2 + 336) = 0u;
  *(_OWORD *)(v2 + 352) = 0u;
  *(_OWORD *)(v2 + 368) = 0u;
  *(_OWORD *)(v2 + 384) = 0u;
  *(_OWORD *)(v2 + 400) = 0u;
  *(_OWORD *)(v2 + 416) = 0u;
  *(_OWORD *)(v2 + 432) = 0u;
  *(_OWORD *)(v2 + 448) = 0u;
  *(void *)(v2 + 464) = 0;
  *(void *)([v1 uarpVendorExtension] + 16) = fCoreUARPLayer3AppleModelNumberResponse;
  *(void *)([v1 uarpVendorExtension] + 32) = fCoreUARPLayer3HardwareFusingTypeResponse;
  *(void *)([v1 uarpVendorExtension] + 48) = fCoreUARPLayer3ManifestPrefixResponse;
  *(void *)([v1 uarpVendorExtension] + 64) = fCoreUARPLayer3BoardIDResponse;
  *(void *)([v1 uarpVendorExtension] + 80) = fCoreUARPLayer3ChipIDResponse;
  *(void *)([v1 uarpVendorExtension] + 96) = fCoreUARPLayer3ChipRevisionResponse;
  *(void *)([v1 uarpVendorExtension] + 112) = fCoreUARPLayer3ECIDResponse;
  *(void *)([v1 uarpVendorExtension] + 144) = fCoreUARPLayer3SecurityDomainResponse;
  *(void *)([v1 uarpVendorExtension] + 160) = fCoreUARPLayer3SecurityModeResponse;
  *(void *)([v1 uarpVendorExtension] + 176) = fCoreUARPLayer3ProductionModeResponse;
  *(void *)([v1 uarpVendorExtension] + 192) = fCoreUARPLayer3ChipEpochResponse;
  *(void *)([v1 uarpVendorExtension] + 208) = fCoreUARPLayer3EnableMixMatchResponse;
  *(void *)([v1 uarpVendorExtension] + 224) = fCoreUARPLayer3SocLiveNonceResponse;
  *(void *)([v1 uarpVendorExtension] + 240) = fCoreUARPLayer3PrefixNeedsLogicalUnitNumberResponse;
  *(void *)([v1 uarpVendorExtension] + 256) = fCoreUARPLayer3SuffixNeedsLogicalUnitNumberResponse;
  *(void *)([v1 uarpVendorExtension] + 304) = fCoreUARPLayer3RequiresPersonalizationResponse;
  uint64_t v3 = uarpPlatformEndpointInit2((char *)[v1 uarpEndpoint], (uint64_t)v1, 2u, (long long *)&v6, v5, objc_msgSend(v1, "uarpVendorExtension"));

  return v3;
}

uint64_t fCoreUARPLayer3SendMessage(void *a1, void *a2, uint64_t a3, unsigned int a4)
{
  uint64_t result = 30;
  if (a1)
  {
    if (a2)
    {
      uint64_t v8 = (objc_class *)MEMORY[0x263EFF8F8];
      id v9 = a2;
      id v10 = a1;
      int v11 = (void *)[[v8 alloc] initWithBytes:a3 length:a4];
      [v10 sendMessageToAccessory:v9 uarpMsg:v11];
      uint64_t v12 = [v10 uarpEndpoint];

      uint64_t v13 = [v9 uarpEndpoint];
      uarpPlatformEndpointSendMessageComplete(v12, v13, a3);

      return 0;
    }
  }
  return result;
}

uint64_t fCoreUARPLayer3DataTransferPause(void *a1, uint64_t a2)
{
  return 0;
}

uint64_t fCoreUARPLayer3DataTransferPauseAck(void *a1, uint64_t a2)
{
  uint64_t result = 30;
  if (a1)
  {
    if (a2)
    {
      [a1 transferPauseAck:a2];
      return 0;
    }
  }
  return result;
}

uint64_t fCoreUARPLayer3DataTransferResume(void *a1, uint64_t a2)
{
  return 0;
}

uint64_t fCoreUARPLayer3DataTransferResumeAck(void *a1, uint64_t a2)
{
  uint64_t result = 30;
  if (a1)
  {
    if (a2)
    {
      [a1 transferResumeAck:a2];
      return 0;
    }
  }
  return result;
}

void fCoreUARPLayer3DynamicAssetOffered(void *a1, void *a2, uint64_t a3)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = a2;
  int v7 = (UARPUploaderAsset *)*(id *)(a3 + 704);
  uint64_t v8 = [[UARPAssetTag alloc] initWithChar1:*(char *)(a3 + 48) char2:*(char *)(a3 + 49) char3:*(char *)(a3 + 50) char4:*(char *)(a3 + 51)];
  if (v7)
  {
    [(UARPUploaderAsset *)v7 setUarpPlatformAsset:a3];
    goto LABEL_10;
  }
  id v9 = getOSLogToken();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    LODWORD(v33[0]) = 138412290;
    *(void *)((char *)v33 + 4) = v8;
    _os_log_impl(&dword_21E079000, v9, OS_LOG_TYPE_INFO, "Unsolicited dynamic asset %@", (uint8_t *)v33, 0xCu);
  }

  id v10 = uarpDynamicAssetURL(v8);
  if (!v10)
  {
    int v11 = getOSLogToken();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      fCoreUARPLayer3DynamicAssetOffered_cold_3();
    }
  }
  uint64_t v12 = [[UARPAssetID alloc] initWithLocationType:10 assetTag:v8 url:v10];
  uint64_t v13 = [[UARPAsset alloc] initWithID:v12];
  memset(v33, 0, sizeof(v33));
  UARPPlatformControllerAssetSetupCallbacksInbound((uint64_t)v33);
  int v7 = [[UARPUploaderAsset alloc] initWithUARPAsset:v13 remoteEndpoint:v6 callbacks:v33 internalSolicit:1];
  [v6 addRxDynamicAsset:v7];

  [(UARPUploaderAsset *)v7 setUarpPlatformAsset:a3];
  if (v10)
  {
LABEL_10:
    uint64_t v14 = getOSLogToken();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      LODWORD(v33[0]) = 138412290;
      *(void *)((char *)v33 + 4) = v8;
      _os_log_impl(&dword_21E079000, v14, OS_LOG_TYPE_INFO, "Accept dynamic asset %@", (uint8_t *)v33, 0xCu);
    }

    uint64_t v15 = uarpPlatformEndpointAssetAccept([v5 uarpEndpoint], objc_msgSend(v6, "uarpEndpoint"), (uint64_t)-[UARPUploaderAsset uarpAsset](v7, "uarpAsset"), (uint64_t)v7, (_OWORD *)-[UARPUploaderAsset uarpCallbacks](v7, "uarpCallbacks"));
    if (v15)
    {
      uint64_t v16 = v15;
      long long v17 = getOSLogToken();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        fCoreUARPLayer3DynamicAssetOffered_cold_2(v16, v17, v18, v19, v20, v21, v22, v23);
      }
LABEL_15:

      goto LABEL_16;
    }
    goto LABEL_16;
  }
  long long v24 = getOSLogToken();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    LODWORD(v33[0]) = 138412290;
    *(void *)((char *)v33 + 4) = v8;
    _os_log_impl(&dword_21E079000, v24, OS_LOG_TYPE_INFO, "Deny dynamic asset %@", (uint8_t *)v33, 0xCu);
  }

  uint64_t v25 = uarpPlatformEndpointAssetDeny([v5 uarpEndpoint], objc_msgSend(v6, "uarpEndpoint"), (uint64_t)-[UARPUploaderAsset uarpAsset](v7, "uarpAsset"), 2560, (uint64_t)v7, (_OWORD *)-[UARPUploaderAsset uarpCallbacks](v7, "uarpCallbacks"));
  if (v25)
  {
    uint64_t v26 = v25;
    long long v17 = getOSLogToken();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      fCoreUARPLayer3DynamicAssetOffered_cold_1(v26, v17, v27, v28, v29, v30, v31, v32);
    }
    goto LABEL_15;
  }
LABEL_16:
}

uint64_t fCoreUARPLayer3ApplyStagedAssets()
{
  return 52;
}

uint64_t fCoreUARPLayer3ApplyStagedAssetsResponse(void *a1, uint64_t a2, int a3)
{
  uint64_t v3 = 30;
  if (a1 && a2)
  {
    unsigned __int16 v4 = a3 - 1;
    if ((a3 - 1) >= 6) {
      unsigned __int16 v4 = 1;
    }
    [a1 applyStagedAssetStatus:a2 status:v4];
    return 0;
  }
  return v3;
}

uint64_t fCoreUARPLayer3ManufacturerName()
{
  return 52;
}

void fCoreUARPLayer3ManufacturerNameResponse(void *a1, void *a2, uint64_t a3, unsigned int a4)
{
  if (a1 && a2)
  {
    int v7 = (objc_class *)NSString;
    id v8 = a2;
    id v9 = a1;
    id v10 = (id)[[v7 alloc] initWithBytes:a3 length:a4 encoding:4];
    [v8 setManufacturerName:v10];
    [v9 updateManufacturerName:v10 remoteEndpoint:v8];
  }
}

uint64_t fCoreUARPLayer3ModelName()
{
  return 52;
}

void fCoreUARPLayer3ModelNameResponse(void *a1, void *a2, uint64_t a3, unsigned int a4)
{
  if (a1 && a2)
  {
    int v7 = (objc_class *)NSString;
    id v8 = a2;
    id v9 = a1;
    id v10 = (id)[[v7 alloc] initWithBytes:a3 length:a4 encoding:4];
    [v8 setModelName:v10];
    [v9 updateModelName:v10 remoteEndpoint:v8];
  }
}

uint64_t fCoreUARPLayer3SerialNumber()
{
  return 52;
}

void fCoreUARPLayer3SerialNumberResponse(void *a1, void *a2, uint64_t a3, unsigned int a4)
{
  if (a1 && a2)
  {
    int v7 = (objc_class *)NSString;
    id v8 = a2;
    id v9 = a1;
    id v10 = (id)[[v7 alloc] initWithBytes:a3 length:a4 encoding:4];
    [v8 setSerialNumber:v10];
    [v9 updateSerialNumber:v10 remoteEndpoint:v8];
  }
}

uint64_t fCoreUARPLayer3HardwareVersion()
{
  return 52;
}

void fCoreUARPLayer3HardwareVersionResponse(void *a1, void *a2, uint64_t a3, unsigned int a4)
{
  if (a1 && a2)
  {
    int v7 = (objc_class *)NSString;
    id v8 = a2;
    id v9 = a1;
    id v10 = (id)[[v7 alloc] initWithBytes:a3 length:a4 encoding:4];
    [v8 setHardwareVersion:v10];
    [v9 updateHardwareVersion:v10 remoteEndpoint:v8];
  }
}

void fCoreUARPLayer3FriendlyNameResponse(void *a1, void *a2, uint64_t a3, unsigned int a4)
{
  id v10 = a1;
  id v7 = a2;
  if (v10 && v7)
  {
    if (a3 && a4) {
      id v8 = (__CFString *)[[NSString alloc] initWithBytes:a3 length:a4 encoding:4];
    }
    else {
      id v8 = @"Unknown";
    }
    id v9 = v8;
    [v7 setFriendlyName:v8];
    [v10 updateFriendlyName:v9 remoteEndpoint:v7];
  }
}

uint64_t fCoreUARPLayer3ActiveFirmwareVersion2()
{
  return 52;
}

void fCoreUARPLayer3ActiveFirmwareVersionResponse(void *a1, void *a2, unsigned int *a3)
{
  if (a1 && a2)
  {
    id v5 = (void *)MEMORY[0x263F089D8];
    uint64_t v6 = *a3;
    uint64_t v7 = a3[1];
    uint64_t v8 = a3[2];
    id v9 = a2;
    id v10 = a1;
    objc_msgSend(v5, "stringWithFormat:", @"%u.%u.%u", v6, v7, v8);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    if (a3[3]) {
      objc_msgSend(v12, "appendFormat:", @".%u", a3[3]);
    }
    int v11 = [[UARPAssetVersion alloc] initWithVersionString:v12];
    [v9 setFirmwareVersion:v11];

    [v10 updateActiveFirmwareVersion:v12 remoteEndpoint:v9];
  }
}

uint64_t fCoreUARPLayer3StagedFirmwareVersion2()
{
  return 52;
}

void fCoreUARPLayer3StagedFirmwareVersionResponse(void *a1, void *a2, unsigned int *a3)
{
  if (a1 && a2)
  {
    id v5 = (void *)MEMORY[0x263F089D8];
    uint64_t v6 = *a3;
    uint64_t v7 = a3[1];
    uint64_t v8 = a3[2];
    id v9 = a2;
    id v10 = a1;
    objc_msgSend(v5, "stringWithFormat:", @"%u.%u.%u", v6, v7, v8);
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    if (a3[3]) {
      objc_msgSend(v12, "appendFormat:", @".%u", a3[3]);
    }
    int v11 = [[UARPAssetVersion alloc] initWithVersionString:v12];
    [v9 setStagedFirmwareVersion:v11];

    [v10 updateStagedFirmwareVersion:v12 remoteEndpoint:v9];
  }
}

uint64_t fCoreUARPLayer3LastError()
{
  return 52;
}

void *fCoreUARPLayer3LastErrorResponse(void *a1, const char *a2, uint64_t a3)
{
  if (a1)
  {
    if (a2) {
      return (void *)[a1 updateLastError:*(unsigned int *)(a3 + 4) remoteEndpoint:a2];
    }
  }
  return a1;
}

void fCoreUARPLayer3StatisticsResponse(void *a1, void *a2, uint64_t a3)
{
  if (a1 && a2)
  {
    id v5 = a2;
    id v6 = a1;
    uint64_t v7 = [[UARPStats alloc] initWithStatistics:a3];
    [v6 updateStatistics:v7 remoteEndpoint:v5];
  }
}

uint64_t fCoreUARPLayer3AssetSolicitation()
{
  return 52;
}

uint64_t fCoreUARPLayer3RescindAllAssetsAck(void *a1, const char *a2)
{
  return [a1 rescindStagedAssetsAck:a2 asset:0];
}

uint64_t fCoreUARPLayer3WatchdogSet(uint64_t a1, void *a2, unsigned int a3)
{
  uint64_t result = 30;
  if (a1)
  {
    if (a2)
    {
      [a2 setLayer2WatchdogTimer:a1 timeoutMS:a3];
      return 0;
    }
  }
  return result;
}

uint64_t fCoreUARPLayer3WatchdogCancel(uint64_t a1, void *a2)
{
  uint64_t result = 30;
  if (a1)
  {
    if (a2)
    {
      [a2 cancelLayer2WatchdogTimer];
      return 0;
    }
  }
  return result;
}

void *fCoreUARPLayer3ProtocolVersion(void *a1, const char *a2, uint64_t a3)
{
  if (a1)
  {
    if (a2) {
      return (void *)[a1 protocolVersionSelected:a2 protocolVersion:a3];
    }
  }
  return a1;
}

void fCoreUARPLayer3AUDLogError(void *a1, uint64_t a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (a1)
  {
    id v11 = a1;
    vsnprintf(fCoreUARPLayer3AUDLogError_logBuffer, 0x200uLL, a3, &a9);
    id v12 = [v11 logTokenForCategory:a2];

    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      fCoreUARPLayer3AUDLogError_cold_1(v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }
}

void fCoreUARPLayer3AUDLogInfo(void *a1, uint64_t a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (a1)
  {
    id v11 = a1;
    vsnprintf(fCoreUARPLayer3AUDLogInfo_logBuffer, 0x200uLL, a3, &a9);
    id v12 = [v11 logTokenForCategory:a2];

    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v14 = fCoreUARPLayer3AUDLogInfo_logBuffer;
      _os_log_impl(&dword_21E079000, v12, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
    }
  }
}

void fCoreUARPLayer3AUDLogDebug(void *a1, uint64_t a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (a1)
  {
    id v11 = a1;
    vsnprintf(fCoreUARPLayer3AUDLogDebug_logBuffer, 0x200uLL, a3, &a9);
    id v12 = [v11 logTokenForCategory:a2];

    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      fCoreUARPLayer3AUDLogDebug_cold_1(v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }
}

void fCoreUARPLayer3AUDLogFault(void *a1, uint64_t a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (a1)
  {
    id v11 = a1;
    vsnprintf(fCoreUARPLayer3AUDLogFault_logBuffer, 0x200uLL, a3, &a9);
    id v12 = [v11 logTokenForCategory:a2];

    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      fCoreUARPLayer3AUDLogFault_cold_1(v12);
    }
  }
}

uint64_t fUarpLayer3DownstreamReachable(void *a1, void *a2, uint64_t a3)
{
  uint64_t result = 30;
  if (a1)
  {
    if (a2)
    {
      id v6 = a2;
      id v7 = a1;
      id v8 = [[UARPUploaderEndpoint alloc] initDownstreamWithDirectEndpoint:v6 layer2Context:a3 uploader:v7];
      [v6 addDownstreamEndpoint:v8];
      id v9 = [v6 accessory];

      [v7 accessoryReachable:v9 remoteEndpoint:v8 error:0];
      return 0;
    }
  }
  return result;
}

uint64_t fUarpLayer3DownstreamUnreachable(void *a1, void *a2, void *a3)
{
  uint64_t result = 30;
  if (a1 && a2)
  {
    if (a3)
    {
      id v6 = a3;
      id v7 = a2;
      id v8 = a1;
      id v9 = [v7 accessory];
      [v8 accessoryUnreachable:v9 remoteEndpoint:v6 error:0];

      [v7 removeDownstreamEndpoint:v6];
      return 0;
    }
  }
  return result;
}

uint64_t fUarpLayer3DownstreamRecvMessage(void *a1, uint64_t a2, void *a3, uint64_t a4, unsigned int a5)
{
  uint64_t result = 30;
  if (a1 && a2)
  {
    if (a3)
    {
      id v8 = (void *)MEMORY[0x263EFF8F8];
      uint64_t v9 = a5;
      id v10 = a3;
      id v11 = a1;
      id v12 = [v8 dataWithBytes:a4 length:v9];
      [v11 recvDataFromEndpoint:v10 data:v12 error:0];

      return 0;
    }
  }
  return result;
}

uint64_t fCoreUARPLayer3VendorSpecificRecvMsg(void *a1, void *a2, unsigned __int8 *a3, int a4, unsigned int *a5, unsigned int a6)
{
  if (!a1 || !a2) {
    return 30;
  }
  id v11 = a2;
  uint64_t v12 = [a1 uarpEndpoint];
  uint64_t v13 = [v11 uarpEndpoint];

  return uarpApplePlatformEndpointRecvMessage(v12, v13, a3, a4, a5, a6);
}

BOOL fCoreUARPLayer3VendorSpecificCheckExpectedResponse(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6)
{
  if (!a1 || !a2) {
    return 0;
  }
  id v11 = a2;
  uint64_t v12 = [a1 uarpEndpoint];
  uint64_t v13 = [v11 uarpEndpoint];

  return uarpApplePlatformMessageCheckExpectedResponse(v12, v13, a3, a4, a5, a6);
}

uint64_t fCoreUARPLayer3VendorSpecificCheckValidToSend(void *a1, void *a2, uint64_t a3, unsigned int a4)
{
  if (!a1 || !a2) {
    return 0;
  }
  id v7 = a2;
  uint64_t v8 = [a1 uarpEndpoint];
  uint64_t v9 = [v7 uarpEndpoint];

  return uarpApplePlatformMessageCheckValidToSend(v8, v9, a3, a4);
}

uint64_t fCoreUARPLayer3VendorSpecificExceededRetries(uint64_t result, void *a2, uint64_t a3, unsigned int a4)
{
  if (result && a2)
  {
    id v6 = (void *)result;
    id v7 = a2;
    uint64_t v8 = [v6 uarpEndpoint];
    uint64_t v9 = [v7 uarpEndpoint];

    return uarpApplePlatformMessageExceededRetries(v8, v9, a3, a4);
  }
  return result;
}

void fCoreUARPLayer3AppleModelNumberResponse(void *a1, void *a2, uint64_t a3, unsigned int a4)
{
  id v11 = a1;
  id v7 = a2;
  if (v11 && v7)
  {
    if (a3 && a4)
    {
      uint64_t v8 = (void *)[[NSString alloc] initWithBytes:a3 length:a4 encoding:4];
    }
    else
    {
      if (*(_DWORD *)([v7 uarpOptions] + 24)) {
        goto LABEL_9;
      }
      uint64_t v9 = [v7 accessory];
      id v10 = [v9 getID];
      uint64_t v8 = [v10 modelIdentifier];
    }
    [v7 setAppleModelNumber:v8];
    [v11 updateAppleModelNumber:v8 remoteEndpoint:v7];
  }
LABEL_9:
}

void fCoreUARPLayer3HardwareFusingTypeResponse(void *a1, void *a2, uint64_t a3, unsigned int a4)
{
  id v10 = a1;
  id v7 = a2;
  if (v10 && v7)
  {
    if (a3 && a4)
    {
      uint64_t v8 = [[NSString alloc] initWithBytes:a3 length:a4 encoding:4];
    }
    else
    {
      if (*(_DWORD *)([v7 uarpOptions] + 24)) {
        goto LABEL_9;
      }
      uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s", UARPAccessoryHardwareFusingToString(2uLL));
    }
    uint64_t v9 = (void *)v8;
    [v7 setHwFusingType:v8];
    [v10 updateHardwareFusingType:v9 remoteEndpoint:v7];
  }
LABEL_9:
}

void fCoreUARPLayer3ManifestPrefixResponse(void *a1, void *a2, uint64_t a3, unsigned int a4)
{
  if (a1 && a2)
  {
    id v7 = (objc_class *)NSString;
    id v8 = a2;
    id v9 = a1;
    id v10 = (id)[[v7 alloc] initWithBytes:a3 length:a4 encoding:4];
    [v9 updateManifestPrefix:v10 remoteEndpoint:v8];
  }
}

void *fCoreUARPLayer3BoardIDResponse(void *a1, const char *a2, unsigned int *a3, int a4)
{
  if (a1 && a2)
  {
    if (a4 == 8)
    {
      uint64_t v4 = *(void *)a3;
    }
    else if (a4 == 4)
    {
      uint64_t v4 = *a3;
    }
    else
    {
      uint64_t v4 = 0;
    }
    return (void *)[a1 updateBoardID:v4 remoteEndpoint:a2];
  }
  return a1;
}

void *fCoreUARPLayer3ChipIDResponse(void *a1, const char *a2, unsigned int *a3, int a4)
{
  if (a1 && a2)
  {
    if (a4 == 4) {
      uint64_t v4 = *a3;
    }
    else {
      uint64_t v4 = 0;
    }
    return (void *)[a1 updateChipID:v4 remoteEndpoint:a2];
  }
  return a1;
}

void *fCoreUARPLayer3ChipRevisionResponse(void *a1, const char *a2, unsigned int *a3, int a4)
{
  if (a1 && a2)
  {
    if (a4 == 4) {
      uint64_t v4 = *a3;
    }
    else {
      uint64_t v4 = 0;
    }
    return (void *)[a1 updateChipRevision:v4 remoteEndpoint:a2];
  }
  return a1;
}

void *fCoreUARPLayer3ECIDResponse(void *a1, const char *a2, uint64_t *a3, int a4)
{
  if (a1 && a2)
  {
    if (a4 == 8) {
      uint64_t v4 = *a3;
    }
    else {
      uint64_t v4 = 0;
    }
    return (void *)[a1 updateECID:v4 remoteEndpoint:a2];
  }
  return a1;
}

void *fCoreUARPLayer3SecurityDomainResponse(void *a1, const char *a2, unsigned int *a3, int a4)
{
  if (a1 && a2)
  {
    if (a4 == 4) {
      uint64_t v4 = *a3;
    }
    else {
      uint64_t v4 = 0;
    }
    return (void *)[a1 updateSecurityDomain:v4 remoteEndpoint:a2];
  }
  return a1;
}

void *fCoreUARPLayer3SecurityModeResponse(void *a1, const char *a2, unsigned int *a3, int a4)
{
  if (a1 && a2)
  {
    if (a4 == 4) {
      uint64_t v4 = *a3;
    }
    else {
      uint64_t v4 = 0;
    }
    return (void *)[a1 updateSecurityMode:v4 remoteEndpoint:a2];
  }
  return a1;
}

void *fCoreUARPLayer3ProductionModeResponse(void *a1, const char *a2, unsigned int *a3, int a4)
{
  if (a1 && a2)
  {
    if (a4 == 4) {
      uint64_t v4 = *a3;
    }
    else {
      uint64_t v4 = 0;
    }
    return (void *)[a1 updateProductionMode:v4 remoteEndpoint:a2];
  }
  return a1;
}

void *fCoreUARPLayer3ChipEpochResponse(void *a1, const char *a2, unsigned int *a3, int a4)
{
  if (a1 && a2)
  {
    if (a4 == 4) {
      uint64_t v4 = *a3;
    }
    else {
      uint64_t v4 = 0;
    }
    return (void *)[a1 updateChipEpoch:v4 remoteEndpoint:a2];
  }
  return a1;
}

void *fCoreUARPLayer3EnableMixMatchResponse(void *a1, const char *a2, unsigned char *a3, int a4)
{
  if (a1 && a2)
  {
    BOOL v4 = a4 == 1 && *a3 != 0;
    return (void *)[a1 updateEnableMixMatch:v4 remoteEndpoint:a2];
  }
  return a1;
}

void *fCoreUARPLayer3SocLiveNonceResponse(void *a1, const char *a2, unsigned char *a3, int a4)
{
  if (a1 && a2)
  {
    BOOL v4 = a4 == 1 && *a3 != 0;
    return (void *)[a1 updateSocLiveNonce:v4 remoteEndpoint:a2];
  }
  return a1;
}

void *fCoreUARPLayer3PrefixNeedsLogicalUnitNumberResponse(void *a1, const char *a2, unsigned char *a3, int a4)
{
  if (a1 && a2)
  {
    BOOL v4 = a4 == 1 && *a3 != 0;
    return (void *)[a1 updatePrefixNeedsLogicalUnitNumber:v4 remoteEndpoint:a2];
  }
  return a1;
}

void *fCoreUARPLayer3SuffixNeedsLogicalUnitNumberResponse(void *a1, const char *a2, unsigned char *a3, int a4)
{
  if (a1 && a2)
  {
    BOOL v4 = a4 == 1 && *a3 != 0;
    return (void *)[a1 updateSuffixNeedsLogicalUnitNumber:v4 remoteEndpoint:a2];
  }
  return a1;
}

uint64_t UARPPlatformControllerAddAccessory(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = uarpPlatformRemoteEndpointAdd([a1 uarpEndpoint], objc_msgSend(v3, "uarpEndpoint"), (long long *)objc_msgSend(v3, "uarpOptions"), (uint64_t)v3);

  return v4;
}

uint64_t UARPPlatformControllerRemoveAccessory(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [a1 uarpEndpoint];
  uint64_t v5 = [v3 uarpEndpoint];

  return uarpPlatformRemoteEndpointRemove(v4, v5);
}

uint64_t UARPPlatformControllerRecvMessage(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = a1;
  id v8 = getOSLogToken();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    UARPPlatformControllerRecvMessage_cold_1();
  }

  uint64_t v9 = [v7 uarpEndpoint];
  uint64_t v10 = [v5 uarpEndpoint];
  id v11 = v6;
  uint64_t v12 = uarpPlatformEndpointRecvMessage(v9, v10, (unsigned __int16 *)[v11 mutableBytes], objc_msgSend(v11, "length"));

  return v12;
}

id getOSLogToken()
{
  uint64_t v0 = (void *)getOSLogToken__log;
  if (!getOSLogToken__log)
  {
    os_log_t v1 = os_log_create("com.apple.accessoryupdater.uarp", "uploader");
    uint64_t v2 = (void *)getOSLogToken__log;
    getOSLogToken__log = (uint64_t)v1;

    uint64_t v0 = (void *)getOSLogToken__log;
  }
  return v0;
}

uint64_t UARPPlatformControllerLayer3WatchDogExpired(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [a1 uarpEndpoint];
  uint64_t v5 = [v3 uarpEndpoint];

  return uarpPlatformEndpointWatchDogExpired(v4, v5);
}

uint64_t UARPPlatformControllerQueryProperty(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = v6;
  uint64_t v8 = 3;
  switch(a3)
  {
    case 0:
      uint64_t v9 = 1;
      goto LABEL_12;
    case 1:
      uint64_t v9 = 2;
      goto LABEL_12;
    case 2:
      uint64_t v9 = 3;
      goto LABEL_12;
    case 3:
      uint64_t v9 = 4;
      goto LABEL_12;
    case 4:
      uint64_t v9 = 5;
      goto LABEL_12;
    case 5:
      uint64_t v9 = 6;
      goto LABEL_12;
    case 6:
      uint64_t v9 = 7;
      goto LABEL_12;
    case 11:
      uint64_t v10 = 1;
      goto LABEL_40;
    case 12:
      uint64_t v10 = 2;
      goto LABEL_40;
    case 13:
      uint64_t v9 = 9;
LABEL_12:
      [v6 queueInfoProperty:v9];
      goto LABEL_41;
    case 14:
      uint64_t v10 = 3;
      goto LABEL_40;
    case 15:
      uint64_t v10 = 4;
      goto LABEL_40;
    case 16:
      uint64_t v10 = 5;
      goto LABEL_40;
    case 17:
      uint64_t v10 = 6;
      goto LABEL_40;
    case 18:
      uint64_t v10 = 7;
      goto LABEL_40;
    case 19:
      uint64_t v10 = 8;
      goto LABEL_40;
    case 20:
      uint64_t v10 = 9;
      goto LABEL_40;
    case 21:
      uint64_t v10 = 10;
      goto LABEL_40;
    case 22:
      uint64_t v10 = 11;
      goto LABEL_40;
    case 23:
      uint64_t v10 = 12;
      goto LABEL_40;
    case 24:
      uint64_t v10 = 13;
      goto LABEL_40;
    case 25:
      uint64_t v10 = 14;
      goto LABEL_40;
    case 26:
      uint64_t v10 = 15;
      goto LABEL_40;
    case 27:
      uint64_t v10 = 16;
      goto LABEL_40;
    case 28:
      uint64_t v10 = 17;
      goto LABEL_40;
    case 29:
      uint64_t v10 = 18;
      goto LABEL_40;
    case 30:
      uint64_t v10 = 19;
      goto LABEL_40;
    case 31:
      uint64_t v10 = 20;
      goto LABEL_40;
    case 32:
      uint64_t v10 = 21;
      goto LABEL_40;
    case 33:
      uint64_t v10 = 22;
      goto LABEL_40;
    case 34:
      uint64_t v10 = 23;
      goto LABEL_40;
    case 36:
      uint64_t v10 = 24;
      goto LABEL_40;
    case 37:
      uint64_t v10 = 25;
      goto LABEL_40;
    case 38:
      uint64_t v10 = 26;
      goto LABEL_40;
    case 39:
      uint64_t v10 = 27;
      goto LABEL_40;
    case 40:
      uint64_t v10 = 28;
      goto LABEL_40;
    case 41:
      uint64_t v10 = 29;
LABEL_40:
      [v6 queueAppleProperty:v10];
LABEL_41:
      uint64_t v8 = 0;
      break;
    default:
      break;
  }

  return v8;
}

uint64_t UARPPlatformControllerOfferFirmwareAsset(void *a1, void *a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  objc_msgSend(v6, "txFirmwareAssets", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, fCoreUARPLayer3AssetGetBytesAtOffset, 0, 0, fCoreUARPLayer3AssetRescindedAck, fCoreUARPLayer3AssetCorrupt, fCoreUARPLayer3AssetOrphan,
    fCoreUARPLayer3AssetRelease,
    fCoreUARPLayer3AssetProcessingNotification,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
  uint64_t v8 = 0);
  uint64_t v9 = [v8 count];

  if (v9)
  {
    p_super = getOSLogToken();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v25 = "UARPPlatformControllerOfferFirmwareAsset";
      __int16 v26 = 2112;
      uint64_t v27 = v7;
      __int16 v28 = 2112;
      uint64_t v29 = (uint64_t)v6;
      _os_log_impl(&dword_21E079000, p_super, OS_LOG_TYPE_INFO, "%s: Firmware already in flight. Do not offet asset %@ to endpoint %@", buf, 0x20u);
    }
    uint64_t v11 = 16;
  }
  else
  {
    uint64_t v13 = [[UARPUploaderAsset alloc] initWithUARPAsset:v7 remoteEndpoint:v6 callbacks:&v23 internalSolicit:0];
    p_super = &v13->super;
    if (v13)
    {
      [(UARPUploaderAsset *)v13 processHostTLVs];
      int v14 = [p_super invalidHwRevision];
      uint64_t v15 = getOSLogToken();
      uint64_t v16 = v15;
      if (v14)
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          UARPPlatformControllerOfferFirmwareAsset_cold_2();
        }

        uint64_t v11 = 57;
      }
      else
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          uint64_t v18 = [p_super minimumHostBatteryLevel];
          *(_DWORD *)buf = 136315650;
          uint64_t v25 = "UARPPlatformControllerOfferFirmwareAsset";
          __int16 v26 = 2112;
          uint64_t v27 = p_super;
          __int16 v28 = 2048;
          uint64_t v29 = v18;
          _os_log_impl(&dword_21E079000, v16, OS_LOG_TYPE_INFO, "%s: Minimum Host Battery Level for asset <%@> is %lu", buf, 0x20u);
        }

        uint64_t v19 = getOSLogToken();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          uint64_t v20 = [p_super triggerHostBatteryLevel];
          *(_DWORD *)buf = 136315650;
          uint64_t v25 = "UARPPlatformControllerOfferFirmwareAsset";
          __int16 v26 = 2112;
          uint64_t v27 = p_super;
          __int16 v28 = 2048;
          uint64_t v29 = v20;
          _os_log_impl(&dword_21E079000, v19, OS_LOG_TYPE_INFO, "%s: Trigger Host Battery Level for asset <%@> is %lu", buf, 0x20u);
        }

        uarpPlatformEndpointPrepareSuperBinary([v5 uarpEndpoint], objc_msgSend(v6, "uarpEndpoint"), (uint64_t)p_super, -[NSObject uarpCallbacks](p_super, "uarpCallbacks"));
        uint64_t v11 = v21;
        if (v21)
        {
          uint64_t v22 = getOSLogToken();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            UARPPlatformControllerOfferFirmwareAsset_cold_3(v11);
          }
        }
        else
        {
          [v6 addTxFirmwareAsset:p_super];
          UARPPlatformControllerReofferFirmwareAsset(v5, v6);
        }
      }
    }
    else
    {
      uint64_t v17 = getOSLogToken();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        UARPPlatformControllerOfferFirmwareAsset_cold_1();
      }

      uint64_t v11 = 11;
    }
  }

  return v11;
}

void UARPPlatformControllerReofferFirmwareAsset(void *a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  id v5 = [v4 idealTxFirmwareAsset];
  id v6 = getOSLogToken();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      int v14 = 136315650;
      uint64_t v15 = "UARPPlatformControllerReofferFirmwareAsset";
      __int16 v16 = 2112;
      id v17 = v5;
      __int16 v18 = 2112;
      id v19 = v4;
      _os_log_impl(&dword_21E079000, v6, OS_LOG_TYPE_INFO, "%s: [Re-]Offer firmware %@ to %@", (uint8_t *)&v14, 0x20u);
    }

    unsigned int v8 = uarpPlatformEndpointOfferAsset([v3 uarpEndpoint], objc_msgSend(v4, "uarpEndpoint"), (uint64_t)v5);
    uint64_t v9 = getOSLogToken();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      UARPPlatformControllerReofferFirmwareAsset_cold_1(v8);
    }

    switch(v8)
    {
      case ';':
        id v6 = [v5 asset];
        uint64_t v10 = v3;
        id v11 = v4;
        uint64_t v12 = v6;
        uint64_t v13 = 14;
        goto LABEL_15;
      case '<':
        id v6 = [v5 asset];
        uint64_t v10 = v3;
        id v11 = v4;
        uint64_t v12 = v6;
        uint64_t v13 = 12;
        goto LABEL_15;
      case '=':
        id v6 = [v5 asset];
        uint64_t v10 = v3;
        id v11 = v4;
        uint64_t v12 = v6;
        uint64_t v13 = 13;
        goto LABEL_15;
      case '>':
        id v6 = [v5 asset];
        uint64_t v10 = v3;
        id v11 = v4;
        uint64_t v12 = v6;
        uint64_t v13 = 11;
LABEL_15:
        [v10 assetStagingComplete:v11 asset:v12 status:v13];
        goto LABEL_16;
      default:
        if (!v8) {
          objc_msgSend(v5, "setUarpPlatformAsset:", uarpPlatformAssetFindByAssetContext(objc_msgSend(v3, "uarpEndpoint"), (uint64_t)v5));
        }
        goto LABEL_17;
    }
  }
  if (v7)
  {
    int v14 = 136315394;
    uint64_t v15 = "UARPPlatformControllerReofferFirmwareAsset";
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl(&dword_21E079000, v6, OS_LOG_TYPE_INFO, "%s: Do not Offer firmware to %@", (uint8_t *)&v14, 0x16u);
  }
LABEL_16:

LABEL_17:
}

uint64_t UARPPlatformControllerNoFirmwareAssetAvailable(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t updated = uarpPlatformNoFirmwareUpdateAvailable([a1 uarpEndpoint], objc_msgSend(v3, "uarpEndpoint"));

  return updated;
}

uint64_t UARPPlatformControllerRescindAsset(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = a1;
  BOOL v7 = [v5 findMatch:a3];
  uint64_t v8 = [v6 uarpEndpoint];

  uint64_t v9 = [v5 uarpEndpoint];
  uint64_t v10 = uarpPlatformEndpointRescindAsset(v8, v9, (uint64_t)v7);

  return v10;
}

uint64_t UARPPlatformControllerResindAllAssets(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [a1 uarpEndpoint];
  uint64_t v5 = [v3 uarpEndpoint];

  return uarpPlatformEndpointRescindAllAssets(v4, v5);
}

uint64_t UARPPlatformControllerApplyStagedAssets(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [a1 uarpEndpoint];
  uint64_t v5 = [v3 uarpEndpoint];

  return uarpPlatformEndpointApplyStagedAssets(v4, v5);
}

uint64_t UARPPlatformControllerPauseAssetTransfers(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [a1 uarpEndpoint];
  uint64_t v5 = [v3 uarpEndpoint];

  return uarpPlatformEndpointPauseAssetTransfers(v4, v5);
}

uint64_t UARPPlatformControllerResumeAssetTransfers(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [a1 uarpEndpoint];
  uint64_t v5 = [v3 uarpEndpoint];

  return uarpPlatformEndpointResumeAssetTransfers(v4, v5);
}

UARPUploaderAsset *UARPPlatformControllerPrepareSolicitedDynamicAsset(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  memset(v11, 0, sizeof(v11));
  UARPPlatformControllerAssetSetupCallbacksInbound((uint64_t)v11);
  id v7 = a3;
  id v8 = a2;
  uint64_t v9 = [[UARPUploaderAsset alloc] initWithUARPAsset:v7 remoteEndpoint:v8 callbacks:v11 internalSolicit:a4];

  [v8 addRxDynamicAsset:v9];
  return v9;
}

double UARPPlatformControllerAssetSetupCallbacksInbound(uint64_t a1)
{
  double result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(void *)a1 = fCoreUARPLayer3AssetReady;
  *(void *)(a1 + 8) = fCoreUARPLayer3AssetMetaDataTLV;
  *(void *)(a1 + 16) = fCoreUARPLayer3AssetMetaDataComplete;
  *(void *)(a1 + 24) = fCoreUARPLayer3AssetMetaDataProcessingError;
  *(void *)(a1 + 32) = fCoreUARPLayer3PayloadReady;
  *(void *)(a1 + 40) = fCoreUARPLayer3PayloadMetaDataTLV;
  *(void *)(a1 + 48) = fCoreUARPLayer3PayloadMetaDataComplete;
  *(void *)(a1 + 56) = fCoreUARPLayer3PayloadMetaDataProcessingError;
  *(void *)(a1 + 64) = fCoreUARPLayer3PayloadData;
  *(void *)(a1 + 72) = fCoreUARPLayer3PayloadDataComplete;
  *(void *)(a1 + 88) = fCoreUARPLayer3AssetGetBytesAtOffset;
  *(void *)(a1 + 96) = fCoreUARPLayer3AssetSetBytesAtOffset;
  *(void *)(a1 + 104) = fCoreUARPLayer3AssetRescinded;
  *(void *)(a1 + 112) = fCoreUARPLayer3AssetRescindedAck;
  *(void *)(a1 + 120) = fCoreUARPLayer3AssetCorrupt;
  *(void *)(a1 + 128) = fCoreUARPLayer3AssetOrphan;
  *(void *)(a1 + 136) = fCoreUARPLayer3AssetRelease;
  *(void *)(a1 + 152) = fCoreUARPLayer3AssetProcessingNotificationAck;
  *(void *)(a1 + 160) = fCoreUARPLayer3AssetPreProcessingNotification;
  *(void *)(a1 + 176) = fCoreUARPLayer3AssetAllHeadersAndMetaDataComplete;
  return result;
}

uint64_t UARPPlatformControllerSolicitDynamicAsset(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  id v8 = [v7 asset];
  uint64_t v9 = [v8 id];
  uint64_t v10 = [v9 tag];
  LOBYTE(v20) = [v10 char1];

  id v11 = [v8 id];
  uint64_t v12 = [v11 tag];
  BYTE1(v20) = [v12 char2];

  uint64_t v13 = [v8 id];
  int v14 = [v13 tag];
  BYTE2(v20) = [v14 char3];

  uint64_t v15 = [v8 id];
  __int16 v16 = [v15 tag];
  HIBYTE(v20) = [v16 char4];

  uarpPlatformEndpointPrepareSolicitedDynamicAsset([v5 uarpEndpoint], objc_msgSend(v6, "uarpEndpoint"), (uint64_t)v7, &v20, objc_msgSend(v7, "uarpCallbacks"));
  uint64_t v18 = v17;
  if (!v17) {
    uint64_t v18 = uarpPlatformEndpointSolicitDynamicAsset([v5 uarpEndpoint], objc_msgSend(v6, "uarpEndpoint"), &v20, (uint64_t)v7);
  }

  return v18;
}

uint64_t UARPPlatformControllerOfferDynamicAsset(void *a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  id v9 = a1;
  id v10 = a2;
  long long v26 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v21 = 0u;
  uint64_t v19 = 0;
  memset(v18, 0, sizeof(v18));
  int v20 = fCoreUARPLayer3AssetGetBytesAtOffset;
  uint64_t v22 = fCoreUARPLayer3AssetRescindedAck;
  long long v23 = fCoreUARPLayer3AssetCorrupt;
  long long v24 = fCoreUARPLayer3AssetOrphan;
  uint64_t v25 = fCoreUARPLayer3AssetRelease;
  *(void *)&long long v26 = fCoreUARPLayer3AssetProcessingNotification;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = [[UARPUploaderAsset alloc] initWithUARPAsset:v12 remoteEndpoint:v10 callbacks:v18 internalSolicit:a5];

  LOBYTE(v17) = [v11 char1];
  BYTE1(v17) = [v11 char2];
  BYTE2(v17) = [v11 char3];
  LOBYTE(v12) = [v11 char4];

  HIBYTE(v17) = (_BYTE)v12;
  uarpPlatformEndpointPrepareDynamicAsset([v9 uarpEndpoint], objc_msgSend(v10, "uarpEndpoint"), (uint64_t)v13, &v17, (uint64_t)-[UARPUploaderAsset uarpCallbacks](v13, "uarpCallbacks"));
  uint64_t v15 = v14;
  if (!v14)
  {
    [v10 addTxDynamicAsset:v13];
    uint64_t v15 = uarpPlatformEndpointOfferAsset([v9 uarpEndpoint], objc_msgSend(v10, "uarpEndpoint"), (uint64_t)v13);
  }

  return v15;
}

uint64_t UarpLayer4DiscoverDownstreamEndpoints(void *a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = a1;
  id v5 = getOSLogToken();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [v3 accessory];
    int v12 = 138412290;
    uint64_t v13 = v6;
    _os_log_impl(&dword_21E079000, v5, OS_LOG_TYPE_INFO, "LAYER3.DOWNSTREAM.DISCOVERY %@", (uint8_t *)&v12, 0xCu);
  }
  uint64_t v7 = [v4 uarpEndpoint];

  uint64_t v8 = uarpPlatformDownstreamEndpointDiscovery(v7, [v3 uarpEndpoint]);
  if (v8)
  {
    id v9 = getOSLogToken();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = uarpStatusCodeToString(v8);
      int v12 = 136315138;
      uint64_t v13 = v10;
      _os_log_impl(&dword_21E079000, v9, OS_LOG_TYPE_INFO, "uarpPlatformDownstreamEndpointDiscovery() failed, status = %s", (uint8_t *)&v12, 0xCu);
    }
  }
  return v8;
}

void UARPPlatformControllerResolicitDynamicAssets(void *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = objc_msgSend(v4, "rxDynamicAssets", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (([v10 internalSolicit] & 1) == 0
          && UARPPlatformControllerSolicitDynamicAsset(v3, v4, v10))
        {
          id v11 = getOSLogToken();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
            UARPPlatformControllerResolicitDynamicAssets_cold_1();
          }

          goto LABEL_14;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_14:
}

uint64_t fCoreUARPLayer3AssetGetBytesAtOffset(void *a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, _WORD *a7)
{
  int v18 = 0;
  id v13 = a2;
  id v14 = a1;
  long long v15 = [a3 asset];
  uint64_t v16 = [v14 requestBytesInRangeForAccessory:v13 asset:v15 bytes:a4 length:a5 offset:a6 bytesCopied:&v18 offsetUsed:0];

  *a7 = v18;
  return v16;
}

void fCoreUARPLayer3AssetRescindedAck(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a1;
  id v7 = [a3 asset];
  [v6 rescindStagedAssetsAck:v5 asset:v7];
}

uint64_t fCoreUARPLayer3AssetRelease(void *a1, const char *a2, uint64_t a3)
{
  return [a1 assetRelease:a2 asset:a3];
}

uint64_t fCoreUARPLayer3AssetProcessingNotification(void *a1, void *a2, void *a3, __int16 a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  if (([v9 internalSolicit] & 1) == 0)
  {
    uint64_t v10 = UARPUploaderStagingStatusConvert(a4);
    id v11 = [v9 asset];
    [v7 assetStagingComplete:v8 asset:v11 status:v10];
  }
  return 0;
}

uint64_t UARPUploaderStagingStatusConvert(__int16 a1)
{
  unsigned int v1 = 0;
  __int16 v2 = a1 & 0xFF00;
  switch((char)a1)
  {
    case 1:
      return v1;
    case 2:
      unsigned int v3 = ((unsigned __int16)(v2 - 256) >> 8);
      unsigned int v4 = v3 + 9;
      BOOL v5 = v3 >= 0xE;
      unsigned int v1 = 8;
      goto LABEL_5;
    case 3:
      unsigned int v6 = ((unsigned __int16)(v2 - 256) >> 8);
      unsigned int v4 = v6 + 23;
      BOOL v5 = v6 >= 0xF;
      unsigned int v1 = 5;
LABEL_5:
      if (!v5) {
        unsigned int v1 = v4;
      }
      break;
    case 4:
      unsigned int v1 = 6;
      break;
    case 5:
      unsigned int v1 = 7;
      break;
    default:
      unsigned int v1 = 2;
      break;
  }
  return v1;
}

void fCoreUARPLayer3AssetReady(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  BOOL v5 = v4;
  if (v3 && v4)
  {
    unsigned __int16 v69 = 0;
    if (uarpPlatformEndpointAssetQueryNumberOfPayloads([v3 uarpEndpoint], objc_msgSend(v4, "uarpAsset"), &v69))
    {
      unsigned int v6 = getOSLogToken();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        fCoreUARPLayer3AssetReady_cold_9(v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
    else
    {
      [v5 setNumPayloads:v69];
      id v14 = getOSLogToken();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        fCoreUARPLayer3AssetReady_cold_8(v5);
      }

      unsigned int v68 = 0;
      if (uarpPlatformEndpointAssetQueryFormatVersion([v3 uarpEndpoint], (_DWORD *)objc_msgSend(v5, "uarpAsset"), &v68))
      {
        unsigned int v6 = getOSLogToken();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
          fCoreUARPLayer3AssetReady_cold_7(v6, v15, v16, v17, v18, v19, v20, v21);
        }
      }
      else
      {
        [v5 setFormatVersion:v68];
        uint64_t v22 = getOSLogToken();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
          fCoreUARPLayer3AssetReady_cold_6(v5);
        }

        __n128 v67 = 0uLL;
        uarpPlatformEndpointAssetQueryAssetVersion([v3 uarpEndpoint], objc_msgSend(v5, "uarpAsset"), &v67);
        if (v23)
        {
          unsigned int v6 = getOSLogToken();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
            fCoreUARPLayer3AssetReady_cold_3(v6, v24, v25, v26, v27, v28, v29, v30);
          }
        }
        else
        {
          uint64_t v31 = [UARPAssetVersion alloc];
          uint64_t v32 = [(UARPAssetVersion *)v31 initWithMajorVersion:v67.n128_u32[0] minorVersion:v67.n128_u32[1] releaseVersion:v67.n128_u32[2] buildVersion:v67.n128_u32[3]];
          [v5 setAssetVersion:v32];

          long long v33 = getOSLogToken();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
            fCoreUARPLayer3AssetReady_cold_4(v5);
          }

          unsigned int v66 = 0;
          if (uarpPlatformEndpointAssetQueryAssetLength([v3 uarpEndpoint], objc_msgSend(v5, "uarpAsset"), &v66))
          {
            unsigned int v6 = getOSLogToken();
            if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
              fCoreUARPLayer3AssetReady_cold_3(v6, v34, v35, v36, v37, v38, v39, v40);
            }
          }
          else
          {
            [v5 setAssetLength:v66];
            long long v41 = [UARPSuperBinaryAsset alloc];
            uint64_t v42 = [v5 formatVersion];
            long long v43 = [v5 assetVersion];
            long long v44 = [(UARPSuperBinaryAsset *)v41 initWithFormatVersion:v42 assetVersion:v43];
            [v5 setUarpSuperBinary:v44];

            int v65 = 0;
            if (uarpPlatformEndpointAssetQueryTag([v3 uarpEndpoint], objc_msgSend(v5, "uarpAsset"), &v65))
            {
              unsigned int v6 = getOSLogToken();
              if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
                fCoreUARPLayer3AssetReady_cold_2(v6, v45, v46, v47, v48, v49, v50, v51);
              }
            }
            else
            {
              v52 = [UARPAssetTag alloc];
              unsigned int v6 = [(UARPAssetTag *)v52 initWithChar1:(char)v65 char2:SBYTE1(v65) char3:SBYTE2(v65) char4:SHIBYTE(v65)];
              v53 = +[UARPHeySiriModelCompact tag];
              int v54 = [v6 isEqual:v53];
              uint64_t v55 = [v3 uarpEndpoint];
              uint64_t v56 = [v5 uarpAsset];
              if (v54)
              {
                if (uarpPlatformEndpointPayloadRequestAllHeadersAndMetaData(v55, v56))
                {
                  v57 = getOSLogToken();
                  if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
                    fCoreUARPLayer3AssetReady_cold_1(v57, v58, v59, v60, v61, v62, v63, v64);
                  }
                }
              }
              else if (uarpPlatformEndpointAssetRequestMetaData(v55, v56) == 40)
              {
                fCoreUARPLayer3AssetMetaDataComplete(v3, v5);
              }
            }
          }
        }
      }
    }
  }
}

void fCoreUARPLayer3AssetMetaDataTLV(uint64_t a1, void *a2, unsigned int a3, unsigned int a4, uint64_t a5)
{
  if (a1 && a2 && a4 && a5)
  {
    id v8 = a2;
    uint64_t v9 = [[UARPSuperBinaryAssetTLV alloc] initWithType:a3 tlvLength:a4 tlvValue:a5];
    uint64_t v10 = [v8 uarpSuperBinary];

    [v10 addMetaDataTLV:v9];
    uint64_t v11 = getOSLogToken();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      fCoreUARPLayer3AssetMetaDataTLV_cold_1();
    }
  }
}

void fCoreUARPLayer3AssetMetaDataComplete(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  BOOL v5 = v4;
  if (v3 && v4)
  {
    if ([v4 numPayloads])
    {
      [v5 setSelectedPayload:0];
      unsigned int v6 = getOSLogToken();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        fCoreUARPLayer3AssetMetaDataComplete_cold_2(v5);
      }

      if (uarpPlatformEndpointAssetSetPayloadIndex((void *)[v3 uarpEndpoint], objc_msgSend(v5, "uarpAsset"), (unsigned __int16)objc_msgSend(v5, "selectedPayload")))
      {
        uint64_t v7 = getOSLogToken();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          fCoreUARPLayer3AssetMetaDataComplete_cold_1(v5);
        }
      }
    }
    else
    {
      UARPlatformEndpointAssetFullyReceived(v3, v5);
    }
  }
}

void fCoreUARPLayer3PayloadReady(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  BOOL v5 = v4;
  if (v3 && v4)
  {
    long long v29 = 0uLL;
    if (uarpPlatformEndpointAssetPayloadVersion([v3 uarpEndpoint], objc_msgSend(v4, "uarpAsset"), &v29))
    {
      unsigned int v6 = getOSLogToken();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        fCoreUARPLayer3PayloadReady_cold_4(v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
    else
    {
      id v14 = [UARPAssetVersion alloc];
      unsigned int v6 = [(UARPAssetVersion *)v14 initWithMajorVersion:v29 minorVersion:DWORD1(v29) releaseVersion:DWORD2(v29) buildVersion:HIDWORD(v29)];
      uint64_t v15 = getOSLogToken();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        fCoreUARPLayer3PayloadReady_cold_3();
      }

      int v28 = 0;
      if (uarpPlatformEndpointAssetPayloadTag([v3 uarpEndpoint], objc_msgSend(v5, "uarpAsset"), &v28))
      {
        uint64_t v16 = getOSLogToken();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          fCoreUARPLayer3PayloadReady_cold_2(v16, v17, v18, v19, v20, v21, v22, v23);
        }
      }
      else
      {
        uint64_t v24 = [UARPAssetTag alloc];
        uint64_t v16 = [(UARPAssetTag *)v24 initWithChar1:(char)v28 char2:SBYTE1(v28) char3:SBYTE2(v28) char4:SHIBYTE(v28)];
        uint64_t v25 = getOSLogToken();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
          fCoreUARPLayer3PayloadReady_cold_1();
        }

        uint64_t v26 = [[UARPSuperBinaryAssetPayload alloc] initWithPayloadTag:v16 assetVersion:v6 writable:1];
        uint64_t v27 = [v5 uarpSuperBinary];
        [v27 addPayload:v26];

        if (uarpPlatformEndpointPayloadRequestMetaData([v3 uarpEndpoint], objc_msgSend(v5, "uarpAsset")) == 40)fCoreUARPLayer3PayloadMetaDataComplete(v3, v5); {
      }
        }
    }
  }
}

void fCoreUARPLayer3PayloadMetaDataTLV(uint64_t a1, void *a2, unsigned int a3, unsigned int a4, uint64_t a5)
{
  if (a1 && a2 && a4 && a5)
  {
    id v8 = a2;
    uint64_t v9 = [v8 uarpSuperBinary];
    uint64_t v10 = [v9 payloads];
    uint64_t v11 = [v8 selectedPayload];

    uint64_t v12 = [v10 objectAtIndex:v11];

    uint64_t v13 = [[UARPSuperBinaryAssetTLV alloc] initWithType:a3 tlvLength:a4 tlvValue:a5];
    [v12 addMetaDataTLV:v13];
    id v14 = getOSLogToken();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      fCoreUARPLayer3PayloadMetaDataTLV_cold_1();
    }
  }
}

void fCoreUARPLayer3PayloadMetaDataComplete(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  BOOL v5 = v4;
  if (v3
    && v4
    && uarpPlatformEndpointPayloadRequestData([v3 uarpEndpoint], objc_msgSend(v4, "uarpAsset")))
  {
    unsigned int v6 = getOSLogToken();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      fCoreUARPLayer3PayloadMetaDataComplete_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
}

void fCoreUARPLayer3PayloadData(void *a1, void *a2, uint64_t a3, unsigned int a4, unsigned int a5)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v9 = a1;
  id v10 = a2;
  uint64_t v11 = v10;
  if (v9 && v10 && a3 && a4)
  {
    uint64_t v12 = getOSLogToken();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v23 = a4;
      __int16 v24 = 2048;
      uint64_t v25 = a5;
      _os_log_debug_impl(&dword_21E079000, v12, OS_LOG_TYPE_DEBUG, "Payload Data Length = <%lu>, Offset = <%lu>", buf, 0x16u);
    }

    uint64_t v13 = [MEMORY[0x263EFF8F8] dataWithBytes:a3 length:a4];
    id v14 = [v11 uarpSuperBinary];
    uint64_t v15 = [v14 payloads];
    uint64_t v16 = objc_msgSend((id)v15, "objectAtIndex:", objc_msgSend(v11, "selectedPayload"));

    id v21 = 0;
    LOBYTE(v15) = [v16 writePayloadData:v13 offset:a5 error:&v21];
    id v17 = v21;
    if (v15)
    {
      uint64_t v18 = (void *)uarpPlatformRemoteDelegateForAssetDelegate([v11 uarpAsset]);
      if (!v18)
      {
LABEL_13:

        goto LABEL_14;
      }
      id v19 = v18;
      uint64_t v20 = [v11 asset];
      objc_msgSend(v9, "assetSolicitationProgress:asset:offset:assetLength:", v19, v20, a5, objc_msgSend(v11, "assetLength"));
    }
    else
    {
      uint64_t v20 = getOSLogToken();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        fCoreUARPLayer3PayloadData_cold_1();
      }
    }

    goto LABEL_13;
  }
LABEL_14:
}

void fCoreUARPLayer3PayloadDataComplete(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  BOOL v5 = v4;
  if (v3 && v4)
  {
    objc_msgSend(v4, "setSelectedPayload:", objc_msgSend(v4, "selectedPayload") + 1);
    unint64_t v6 = [v5 selectedPayload];
    if (v6 >= [v5 numPayloads])
    {
      UARPlatformEndpointAssetFullyReceived(v3, v5);
    }
    else
    {
      uint64_t v7 = getOSLogToken();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        fCoreUARPLayer3AssetMetaDataComplete_cold_2(v5);
      }

      if (uarpPlatformEndpointAssetSetPayloadIndex((void *)[v3 uarpEndpoint], objc_msgSend(v5, "uarpAsset"), (unsigned __int16)objc_msgSend(v5, "selectedPayload")))
      {
        uint64_t v8 = getOSLogToken();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          fCoreUARPLayer3AssetMetaDataComplete_cold_1(v5);
        }
      }
    }
  }
}

uint64_t fCoreUARPLayer3AssetSetBytesAtOffset()
{
  return 26;
}

uint64_t fCoreUARPLayer3AssetRescinded(void *a1, const char *a2, uint64_t a3)
{
  return [a1 rescindedRxDynamicAsset:a2 asset:a3];
}

void fCoreUARPLayer3AssetAllHeadersAndMetaDataComplete(void *a1, uint64_t a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a1;
  id v5 = a3;
  unint64_t v6 = v5;
  if (v4 && v5)
  {
    uint64_t SuperBinaryMetaData = uarpAssetQuerySuperBinaryMetaData([v4 uarpEndpoint], objc_msgSend(v5, "uarpAsset"));
    if (SuperBinaryMetaData)
    {
      uint64_t v8 = (unsigned int *)SuperBinaryMetaData;
      do
      {
        id v9 = [[UARPSuperBinaryAssetTLV alloc] initWithType:*v8 tlvLength:v8[1] tlvValue:*((void *)v8 + 1)];
        id v10 = [v6 uarpSuperBinary];
        [v10 addMetaDataTLV:v9];

        uint64_t v8 = (unsigned int *)*((void *)v8 + 2);
      }
      while (v8);
    }
    if ([v6 numPayloads])
    {
      unint64_t v12 = 0;
      *(void *)&long long v11 = 67109120;
      long long v30 = v11;
      do
      {
        long long v31 = 0u;
        long long v32 = 0u;
        int PayloadInfo = uarpAssetQueryPayloadInfo(objc_msgSend(v4, "uarpEndpoint", v30), objc_msgSend(v6, "uarpAsset"), v12, (uint64_t)&v31);
        if (PayloadInfo)
        {
          int v14 = PayloadInfo;
          uint64_t v15 = getOSLogToken();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v30;
            LODWORD(v34) = v14;
            _os_log_error_impl(&dword_21E079000, v15, OS_LOG_TYPE_ERROR, "Failed to query payload info; %u", buf, 8u);
          }
        }
        uint64_t v16 = [UARPAssetVersion alloc];
        id v17 = [(UARPAssetVersion *)v16 initWithMajorVersion:DWORD1(v31) minorVersion:DWORD2(v31) releaseVersion:HIDWORD(v31) buildVersion:v32];
        uint64_t v18 = getOSLogToken();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v34 = (UARPAssetTag *)v17;
          _os_log_debug_impl(&dword_21E079000, v18, OS_LOG_TYPE_DEBUG, "Payload Ready; asset version is %@", buf, 0xCu);
        }

        id v19 = [UARPAssetTag alloc];
        uint64_t v20 = [(UARPAssetTag *)v19 initWithChar1:(char)v31 char2:SBYTE1(v31) char3:SBYTE2(v31) char4:SBYTE3(v31)];
        id v21 = getOSLogToken();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v34 = v20;
          _os_log_debug_impl(&dword_21E079000, v21, OS_LOG_TYPE_DEBUG, "Payload Ready; payload 4cc/tag is %@",
            buf,
            0xCu);
        }

        uint64_t v22 = [[UARPSuperBinaryAssetPayload alloc] initWithPayloadTag:v20 assetVersion:v17 writable:1];
        uint64_t v23 = [v6 uarpSuperBinary];
        [v23 addPayload:v22];

        uint64_t PayloadMetaData = uarpAssetQueryPayloadMetaData([v4 uarpEndpoint], objc_msgSend(v6, "uarpAsset"), v12);
        if (PayloadMetaData)
        {
          uint64_t v25 = (unsigned int *)PayloadMetaData;
          do
          {
            uint64_t v26 = [[UARPSuperBinaryAssetTLV alloc] initWithType:*v25 tlvLength:v25[1] tlvValue:*((void *)v25 + 1)];
            [(UARPSuperBinaryAssetPayload *)v22 addMetaDataTLV:v26];
            uint64_t v25 = (unsigned int *)*((void *)v25 + 2);
          }
          while (v25);
        }

        ++v12;
      }
      while (v12 < [v6 numPayloads]);
    }
    if ([v6 numPayloads])
    {
      int v27 = uarpPlatformEndpointAssetSetPayloadIndex((void *)[v4 uarpEndpoint], objc_msgSend(v6, "uarpAsset"), 0);
      if (v27)
      {
        int v28 = v27;
        long long v29 = getOSLogToken();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
          fCoreUARPLayer3AssetAllHeadersAndMetaDataComplete_cold_1(v28, v29);
        }
      }
    }
    else
    {
      UARPlatformEndpointAssetFullyReceived(v4, v6);
    }
  }
}

void UARPlatformEndpointAssetFullyReceived(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  id v5 = getOSLogToken();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_21E079000, v5, OS_LOG_TYPE_INFO, "Asset fully staged", v9, 2u);
  }

  uint64_t v6 = [v4 uarpEndpoint];
  uint64_t v7 = [v3 uarpAsset];

  if (uarpPlatformEndpointAssetFullyStaged(v6, v7))
  {
    uint64_t v8 = getOSLogToken();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      UARPlatformEndpointAssetFullyReceived_cold_1();
    }
  }
}

uint64_t UARPAssetSolicitionComplete(void *a1, void *a2, void *a3, __int16 a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v10 = getOSLogToken();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21E079000, v10, OS_LOG_TYPE_INFO, "Asset Solicitation Complete", buf, 2u);
  }

  long long v11 = [v9 asset];

  if (v11)
  {
    unint64_t v12 = [v9 asset];
    uint64_t v13 = [v12 id];

    if (v13)
    {
      int v14 = [v9 asset];
      uint64_t v15 = [v14 id];
      uint64_t v16 = [v15 localURL];

      if (v16)
      {
        uint64_t v17 = UARPUploaderStagingStatusConvert(a4);
        uint64_t v18 = [v9 asset];
        id v19 = [v18 id];
        uint64_t v20 = [v19 localURL];
        id v21 = [(id)v20 copy];

        uint64_t v22 = [v9 uarpSuperBinary];
        id v46 = 0;
        LOBYTE(v20) = [v22 writeToURL:v21 error:&v46];
        id v23 = v46;

        if (v20)
        {
          if ([v9 internalSolicit])
          {
            if (!v17)
            {
              __int16 v24 = [v9 asset];
              uint64_t v25 = [v24 id];
              uint64_t v26 = [v25 tag];

              int v27 = (char *)uarpAssetTagStructPersonalization();
              int v28 = [[UARPAssetTag alloc] initWithChar1:*v27 char2:v27[1] char3:v27[2] char4:v27[3]];
              if ([v26 isEqual:v28])
              {
                if ([v8 im4mAssetReceived:v9]) {
                  uint64_t v29 = 0;
                }
                else {
                  uint64_t v29 = 54;
                }
              }
              else
              {
                long long v33 = (char *)uarpAssetTagStructVoiceAssist();
                uint64_t v34 = [[UARPAssetTag alloc] initWithChar1:*v33 char2:v33[1] char3:v33[2] char4:v33[3]];
                if ([v26 isEqual:v34])
                {
                  UARPlatformEndpointHandleVoiceAssist(v7, v8, v21);
                  uint64_t v29 = 0;
                }
                else
                {
                  uint64_t v35 = (char *)uarpAssetTagStructHeySiriModel();
                  uint64_t v36 = [[UARPAssetTag alloc] initWithChar1:*v35 char2:v35[1] char3:v35[2] char4:v35[3]];
                  if ([v26 isEqual:v36])
                  {
                    UARPlatformEndpointHandleHeySiri(v7, v8, v21);
                    uint64_t v29 = 0;
                  }
                  else
                  {
                    uint64_t v45 = +[UARPDynamicAssetAnalyticsEvent tag];
                    if (objc_msgSend(v26, "isEqual:"))
                    {
                      uint64_t v29 = UARPlatformEndpointHandleAnalytics(v21);
                    }
                    else
                    {
                      long long v44 = v36;
                      uint64_t v37 = +[UARPDynamicAssetMappedAnalyticsEvent tag];
                      if ([v26 isEqual:v37])
                      {
                        uint64_t v29 = UARPlatformEndpointHandleMappedAnalytics(v7, v21, v37);
                      }
                      else
                      {
                        long long v43 = v37;
                        uint64_t v42 = +[UARPDynamicAssetVersions tag];
                        if (objc_msgSend(v26, "isEqual:"))
                        {
                          uint64_t v29 = UARPlatformEndpointHandleVersions(v7, v8, v21);
                        }
                        else
                        {
                          uint64_t v38 = (char *)uarpAssetTagStructLogs();
                          long long v41 = [[UARPAssetTag alloc] initWithChar1:*v38 char2:v38[1] char3:v38[2] char4:v38[3]];
                          if ([v26 isEqual:v41])
                          {
                            uint64_t v29 = UARPlatformEndpointHandleLogs(v7, v8, v21);
                          }
                          else
                          {
                            uint64_t v39 = +[UARPDynamicAssetCrashLogEvent tag];
                            uint64_t v40 = v39;
                            if ([v26 isEqual:v39]) {
                              uint64_t v29 = UARPlatformEndpointHandleCrashAnalytics(v7, v21, v39);
                            }
                            else {
                              uint64_t v29 = 0;
                            }
                          }
                        }

                        uint64_t v37 = v43;
                      }

                      uint64_t v36 = v44;
                    }
                  }
                }
              }
              goto LABEL_27;
            }
LABEL_24:
            uint64_t v29 = 0;
LABEL_28:

            goto LABEL_29;
          }
        }
        else
        {
          long long v31 = getOSLogToken();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
            UARPAssetSolicitionComplete_cold_4();
          }

          if ([v9 internalSolicit]) {
            goto LABEL_24;
          }
          uint64_t v17 = 2;
        }
        uint64_t v26 = [v9 asset];
        [v7 assetSolicitationComplete:v8 asset:v26 status:v17];
        uint64_t v29 = 0;
LABEL_27:

        goto LABEL_28;
      }
      long long v30 = getOSLogToken();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        UARPAssetSolicitionComplete_cold_3();
      }
    }
    else
    {
      long long v30 = getOSLogToken();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        UARPAssetSolicitionComplete_cold_2();
      }
    }

    id v21 = [v9 asset];
    [v7 assetSolicitationComplete:v8 asset:v21 status:2];
  }
  else
  {
    id v21 = getOSLogToken();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      UARPAssetSolicitionComplete_cold_1();
    }
  }
  uint64_t v29 = 54;
LABEL_29:

  return v29;
}

void UARPlatformEndpointHandleVoiceAssist(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = a1;
  id v8 = [UARPHeySiriModelVoiceAssist alloc];
  id v9 = [v6 accessory];
  uint64_t v10 = [v6 uarpVersion];

  long long v11 = [v7 controller];
  unint64_t v12 = [(UARPHeySiriModelBase *)v8 initWithAccessory:v9 uarpProtocolVersion:v10 controller:v11 url:v5];

  [v7 processDynamicAssetVoiceAssist:v12];
}

void UARPlatformEndpointHandleHeySiri(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = a1;
  id v8 = [UARPHeySiriModelCompact alloc];
  id v9 = [v6 accessory];
  uint64_t v10 = [v6 uarpVersion];

  long long v11 = [v7 controller];
  unint64_t v12 = [(UARPHeySiriModelBase *)v8 initWithAccessory:v9 uarpProtocolVersion:v10 controller:v11 url:v5];

  [v7 processDynamicAssetHeySiriCompact:v12];
}

uint64_t UARPlatformEndpointHandleAnalytics(void *a1)
{
  id v1 = a1;
  __int16 v2 = [[UARPDynamicAssetAnalyticsEvent alloc] initWithURL:v1];

  if ([(UARPDynamicAssetAnalyticsEvent *)v2 decomposeUARP])
  {
    [(UARPDynamicAssetAnalyticsEvent *)v2 send];
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = 54;
  }

  return v3;
}

uint64_t UARPlatformEndpointHandleMappedAnalytics(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  id v8 = [[UARPDynamicAssetMappedAnalyticsEvent alloc] initWithURL:v6];
  if (![(UARPDynamicAssetMappedAnalyticsEvent *)v8 decomposeUARP])
  {
    id v9 = getOSLogToken();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      UARPlatformEndpointHandleMappedAnalytics_cold_2();
    }
    goto LABEL_13;
  }
  if (![(UARPDynamicAssetMappedAnalyticsEvent *)v8 findMatchingTMAP])
  {
    [v5 addUnprocessedDynamicAsset:v6 withAssetTag:v7];
    uint64_t v10 = getOSLogToken();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl(&dword_21E079000, v10, OS_LOG_TYPE_INFO, "Failed to find matching TMAP. Saving for Later Processing.", v13, 2u);
    }

    goto LABEL_10;
  }
  if (![(UARPDynamicAssetMappedAnalyticsEvent *)v8 expandMTICPayloads])
  {
    id v9 = getOSLogToken();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      UARPlatformEndpointHandleMappedAnalytics_cold_1();
    }
LABEL_13:

    uint64_t v11 = 54;
    goto LABEL_14;
  }
  [(UARPDynamicAssetMappedAnalyticsEvent *)v8 send];
LABEL_10:
  uint64_t v11 = 0;
LABEL_14:

  return v11;
}

uint64_t UARPlatformEndpointHandleVersions(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  id v8 = [[UARPDynamicAssetVersions alloc] initWithURL:v7];

  if ([(UARPDynamicAssetVersions *)v8 decomposeUARP])
  {
    id v9 = [v6 accessory];
    uint64_t v10 = [(UARPDynamicAssetVersions *)v8 partnerSerialNumbers];
    [v9 setPartnerSerialNumbers:v10];

    uint64_t v11 = [v6 accessory];
    unint64_t v12 = [(UARPDynamicAssetVersions *)v8 partnerSerialNumbers];
    [v5 processDynamicAssetVersions:v11 partnerSerialNumbers:v12];

    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v13 = 54;
  }

  return v13;
}

uint64_t UARPlatformEndpointHandleLogs(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = a1;
  id v8 = [[UARPDynamicAssetLogsEvent alloc] initWithURL:v5];

  id v9 = [v7 ttrDirectory];

  LODWORD(v7) = [(UARPDynamicAssetLogsEvent *)v8 expandToDirectory:v9 forRemoteEndpoint:v6];
  if (v7) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = 54;
  }

  return v10;
}

uint64_t UARPlatformEndpointHandleCrashAnalytics(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  id v8 = [[UARPDynamicAssetCrashLogEvent alloc] initWithURL:v6];
  if (![(UARPDynamicAssetCrashLogEvent *)v8 decomposeUARP])
  {
    id v9 = getOSLogToken();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      UARPlatformEndpointHandleCrashAnalytics_cold_2();
    }
    goto LABEL_13;
  }
  if (![(UARPDynamicAssetCrashLogEvent *)v8 findMatchingCMAP])
  {
    [v5 addUnprocessedDynamicAsset:v6 withAssetTag:v7];
    uint64_t v10 = getOSLogToken();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl(&dword_21E079000, v10, OS_LOG_TYPE_INFO, "Failed to find matching CMAP. Saving for Later Processing.", v13, 2u);
    }

    goto LABEL_10;
  }
  if (![(UARPDynamicAssetCrashLogEvent *)v8 processCrashInstance])
  {
    id v9 = getOSLogToken();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      UARPlatformEndpointHandleCrashAnalytics_cold_1();
    }
LABEL_13:

    uint64_t v11 = 54;
    goto LABEL_14;
  }
  [(UARPDynamicAssetCrashLogEvent *)v8 sendSpeedTracer];
LABEL_10:
  uint64_t v11 = 0;
LABEL_14:

  return v11;
}

void *uarpZalloc(size_t a1)
{
  return malloc_type_calloc(a1, 1uLL, 0x100004077774924uLL);
}

unint64_t uarpHtonll(unint64_t a1)
{
  return bswap64(a1);
}

uint64_t uarpHtonl(unsigned int a1)
{
  return bswap32(a1);
}

uint64_t uarpHtons(unsigned int a1)
{
  return __rev16(a1);
}

uint64_t uarpPlatformDarwinDecompressBuffer(int a1, void *__src, size_t src_size, void *__dst, size_t __n)
{
  compression_algorithm v5 = 1538;
  switch(a1)
  {
    case 0:
      if (src_size != __n) {
        return 51;
      }
      memcpy(__dst, __src, __n);
      return 0;
    case 1:
      goto LABEL_6;
    case 2:
      compression_algorithm v5 = COMPRESSION_LZBITMAP;
      goto LABEL_6;
    case 3:
      compression_algorithm v5 = COMPRESSION_LZ4;
LABEL_6:
      if (compression_decode_buffer((uint8_t *)__dst, __n, (const uint8_t *)__src, src_size, 0, v5) == __n)uint64_t result = 0; {
      else
      }
        uint64_t result = 51;
      break;
    default:
      uint64_t result = 50;
      break;
  }
  return result;
}

uint64_t uarpPlatformDarwinCompressBuffer()
{
  return 50;
}

uint64_t uarpPlatformDarwinHashInfo(uint64_t result, _DWORD *a2, int *a3)
{
  int v3 = result - 1;
  if ((result - 1) > 2)
  {
    int v4 = 0;
    int v5 = 0;
  }
  else
  {
    int v4 = dword_21E105090[v3];
    int v5 = 16 * v3 + 32;
  }
  *a2 = v4;
  *a3 = v5;
  return result;
}

uint64_t uarpPlatformDarwinHashInit(uint64_t result, CC_SHA512_CTX *c)
{
  switch(result)
  {
    case 3:
      return CC_SHA512_Init(c);
    case 2:
      return CC_SHA384_Init(c);
    case 1:
      return CC_SHA256_Init((CC_SHA256_CTX *)c);
  }
  return result;
}

uint64_t uarpPlatformDarwinHashUpdate(uint64_t result, CC_SHA512_CTX *c, void *data, CC_LONG len)
{
  switch(result)
  {
    case 3:
      return CC_SHA512_Update(c, data, len);
    case 2:
      return CC_SHA384_Update(c, data, len);
    case 1:
      return CC_SHA256_Update((CC_SHA256_CTX *)c, data, len);
  }
  return result;
}

uint64_t uarpPlatformDarwinHashFinal(uint64_t result, CC_SHA512_CTX *a2, unsigned __int8 *md, int a4)
{
  if (result == 2)
  {
    if (a4 == 48) {
      return CC_SHA384_Final(md, a2);
    }
  }
  else if (result == 1)
  {
    if (a4 == 32) {
      return CC_SHA256_Final(md, (CC_SHA256_CTX *)a2);
    }
  }
  else if (result == 3 && a4 == 64)
  {
    return CC_SHA512_Final(md, a2);
  }
  return result;
}

void uarpLogError(unsigned int a1, char *__format, ...)
{
  va_start(va, __format);
  vsnprintf(uarpLogError_logBuffer, 0x200uLL, __format, va);
  int v3 = uarpLogToken(a1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    uarpLogError_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
  }
}

uint64_t uarpLogToken(unsigned int a1)
{
  for (uint64_t i = 0; i != 9; ++i)
  {
    int v3 = uarpLoggingCategoryToString(i);
    uarpLogToken_tokens[i] = os_log_create("com.apple.uarp.embedded", v3);
  }
  if (a1 <= 8) {
    return uarpLogToken_tokens[a1];
  }
  else {
    return &_os_log_internal;
  }
}

void uarpLogDebug(unsigned int a1, char *__format, ...)
{
  va_start(va, __format);
  vsnprintf(uarpLogDebug_logBuffer, 0x200uLL, __format, va);
  int v3 = uarpLogToken(a1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    uarpLogDebug_cold_1(v3);
  }
}

void uarpLogInfo(unsigned int a1, char *__format, ...)
{
  va_start(va, __format);
  uint64_t v6 = *MEMORY[0x263EF8340];
  vsnprintf(uarpLogInfo_logBuffer, 0x200uLL, __format, va);
  int v3 = uarpLogToken(a1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v5 = uarpLogInfo_logBuffer;
    _os_log_impl(&dword_21E079000, v3, OS_LOG_TYPE_INFO, "%s\n", buf, 0xCu);
  }
}

void uarpLogFault(unsigned int a1, char *__format, ...)
{
  va_start(va, __format);
  vsnprintf(uarpLogFault_logBuffer, 0x200uLL, __format, va);
  int v3 = uarpLogToken(a1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    uarpLogFault_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
  }
}

void uarpPlatformDarwinLogError(uint64_t a1, unsigned int a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  vsnprintf(uarpPlatformDarwinLogError_logBuffer, 0x200uLL, a3, &a9);
  uint64_t v10 = uarpLogToken(a2);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    uarpPlatformDarwinLogError_cold_1(v10, v11, v12, v13, v14, v15, v16, v17);
  }
}

void uarpPlatformDarwinLogInfo(uint64_t a1, unsigned int a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  vsnprintf(uarpPlatformDarwinLogInfo_logBuffer, 0x200uLL, a3, &a9);
  uint64_t v10 = uarpLogToken(a2);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v12 = uarpPlatformDarwinLogInfo_logBuffer;
    _os_log_impl(&dword_21E079000, v10, OS_LOG_TYPE_INFO, "%s\n", buf, 0xCu);
  }
}

void uarpPlatformDarwinLogDebug(uint64_t a1, unsigned int a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  vsnprintf(uarpPlatformDarwinLogDebug_logBuffer, 0x200uLL, a3, &a9);
  uint64_t v10 = uarpLogToken(a2);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    uarpPlatformDarwinLogDebug_cold_1(v10);
  }
}

void uarpPlatformDarwinLogFault(uint64_t a1, unsigned int a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  vsnprintf(uarpPlatformDarwinLogFault_logBuffer, 0x200uLL, a3, &a9);
  uint64_t v10 = uarpLogToken(a2);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
    uarpPlatformDarwinLogFault_cold_1(v10);
  }
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

uint64_t nullableObjectsEqual(void *a1, uint64_t a2)
{
  if (a1) {
    return [a1 isEqual:a2];
  }
  else {
    return a2 == 0;
  }
}

uint64_t uarpUtilsConcatenateURLs(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x263F08840] fileHandleForWritingToURL:a1 error:a3];
    uint64_t v7 = v6;
    if (v6)
    {
      if ([v6 uarpSeekToEndReturningOffset:0 error:a3])
      {
        uint64_t v8 = [MEMORY[0x263F08840] fileHandleForReadingFromURL:v5 error:a3];
        if (v8)
        {
          uint64_t v9 = 0;
          while (1)
          {
            uint64_t v10 = v9;
            uint64_t v9 = [v8 uarpReadDataUpToLength:4096 error:a3];

            if (!v9 || ![v7 uarpWriteData:v9 error:a3]) {
              break;
            }
            if ([v9 length] != 4096)
            {
              uint64_t v11 = 1;
              goto LABEL_14;
            }
          }
          uint64_t v11 = 0;
LABEL_14:
          [v8 uarpCloseAndReturnError:a3];
          [v7 uarpCloseAndReturnError:a3];
        }
        else
        {
          [v7 uarpCloseAndReturnError:a3];
          uint64_t v11 = 0;
        }

        goto LABEL_17;
      }
      [v7 uarpCloseAndReturnError:a3];
    }
    uint64_t v11 = 0;
LABEL_17:

    goto LABEL_18;
  }
  uint64_t v11 = 1;
LABEL_18:

  return v11;
}

uint64_t uarpVersionCompareStrings(uint64_t a1, void *a2)
{
  v8[0] = 0;
  v8[1] = 0;
  id v3 = a2;
  +[UARPSuperBinaryAsset versionFromString:version:](UARPSuperBinaryAsset, "versionFromString:version:", a1, v8, 0, 0);
  +[UARPSuperBinaryAsset versionFromString:v3 version:&v7];

  int v4 = uarpVersionCompare(v8, &v7);
  if (v4) {
    uint64_t v5 = -1;
  }
  else {
    uint64_t v5 = 0;
  }
  if (v4 == 1) {
    return 1;
  }
  else {
    return v5;
  }
}

id currentTrainName()
{
  if (currentTrainName_onceToken != -1) {
    dispatch_once(&currentTrainName_onceToken, &__block_literal_global_3);
  }
  if (currentTrainName_trainName)
  {
    uint64_t v0 = objc_msgSend(NSString, "stringWithFormat:", @"%s", currentTrainName_trainName);
  }
  else
  {
    uint64_t v0 = 0;
  }
  return v0;
}

void __currentTrainName_block_invoke()
{
  uint64_t v0 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "$SIDEBUILD_PARENT_TRAIN");
  if ([v0 isEqualToString:&stru_26CEE54E0])
  {
  }
  else
  {
    id v1 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "$SIDEBUILD_PARENT_TRAIN");
    char v2 = [v1 isEqualToString:@"$SIDEBUILD_PARENT_TRAIN"];

    if ((v2 & 1) == 0)
    {
      currentTrainName_trainName = (uint64_t)"$SIDEBUILD_PARENT_TRAIN";
      return;
    }
  }
  objc_msgSend(NSString, "stringWithFormat:", @"%s", "CrystalC");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  if ([v5 isEqualToString:&stru_26CEE54E0])
  {
  }
  else
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "CrystalC");
    char v4 = [v3 isEqualToString:@"$RC_RELEASE"];

    if ((v4 & 1) == 0) {
      currentTrainName_trainName = (uint64_t)"CrystalC";
    }
  }
}

uint64_t appendFirstUarpFilenameToFilepath(void *a1, uint64_t a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a1;
  char v4 = [MEMORY[0x263F08850] defaultManager];
  id v5 = [v4 contentsOfDirectoryAtPath:v3 error:a2];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v11 hasSuffix:@".uarp"])
        {
          [v3 appendFormat:@"/%@", v11];
          uint64_t v12 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  uint64_t v12 = 0;
LABEL_11:

  return v12;
}

id uarpDynamicAssetURL(void *a1)
{
  return uarpDynamicAssetURLWithSuffix(a1, 1);
}

id uarpDynamicAssetURLWithSuffix(void *a1, int a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a1;
  char v4 = UARPStringDynamicAssetsFilepath();
  id v5 = [MEMORY[0x263F08850] defaultManager];
  if ([v5 fileExistsAtPath:v4])
  {
    id v6 = objc_alloc_init(MEMORY[0x263F08C38]);
    uint64_t v7 = (void *)MEMORY[0x263F089D8];
    uint64_t v8 = [v6 UUIDString];
    uint64_t v9 = [v7 stringWithFormat:@"%@/%@-%c%c%c%c", v4, v8, (int)objc_msgSend(v3, "char1"), (int)objc_msgSend(v3, "char2"), (int)objc_msgSend(v3, "char3"), (int)objc_msgSend(v3, "char4")];

    if (a2) {
      [v9 appendString:@".uarp"];
    }
    if ([v5 createFileAtPath:v9 contents:0 attributes:0])
    {
      uint64_t v10 = (void *)[objc_alloc(NSURL) initWithString:v9];
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        uarpDynamicAssetURLWithSuffix_cold_1();
      }
      uint64_t v10 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v13 = v4;
      _os_log_impl(&dword_21E079000, &_os_log_internal, OS_LOG_TYPE_INFO, "Directory for dynamic assets does not exist at %@", buf, 0xCu);
    }
    uint64_t v10 = 0;
  }

  return v10;
}

id uarpDynamicAssetComponentURL(void *a1)
{
  return uarpDynamicAssetURLWithSuffix(a1, 0);
}

BOOL isDynamicAssetLogs(void *a1)
{
  int v1 = [a1 tag];
  return v1 == uarpAssetTagLogs();
}

BOOL isDynamicAssetAnalytics(void *a1)
{
  int v1 = [a1 tag];
  return v1 == uarpAssetTagAnalytics();
}

BOOL isDynamicAssetMappedAnalytics(void *a1)
{
  int v1 = [a1 tag];
  return v1 == uarpAssetTagMappedAnalytics();
}

BOOL isDynamicAssetHeySiri(void *a1)
{
  int v1 = [a1 tag];
  return v1 == uarpAssetTagHeySiriModel();
}

BOOL isDynamicAssetSysConfig(void *a1)
{
  int v1 = [a1 tag];
  return v1 == uarpAssetTagSysconfig();
}

BOOL isDynamicAssetVoiceAssist(void *a1)
{
  int v1 = [a1 tag];
  return v1 == uarpAssetTagVoiceAssist();
}

BOOL isDynamicAssetPersonalization(void *a1)
{
  int v1 = [a1 tag];
  return v1 == uarpAssetTagPersonalization();
}

id UARPUtilsBuildURLForTemporaryFile()
{
  uint64_t v0 = NSURL;
  int v1 = UARPStringTempFilesFilepath();
  char v2 = [v0 fileURLWithPath:v1 isDirectory:1];

  if (([v2 checkResourceIsReachableAndReturnError:0] & 1) != 0
    || ([MEMORY[0x263F08850] defaultManager],
        id v3 = objc_claimAutoreleasedReturnValue(),
        char v4 = [v3 createDirectoryAtURL:v2 withIntermediateDirectories:1 attributes:0 error:0],
        v3,
        (v4 & 1) != 0))
  {
    id v5 = objc_alloc_init(MEMORY[0x263F08C38]);
    id v6 = NSString;
    uint64_t v7 = UARPStringTempFilesFilepath();
    uint64_t v8 = [v5 UUIDString];
    uint64_t v9 = [v6 stringWithFormat:@"%@/%@", v7, v8];

    uint64_t v10 = [MEMORY[0x263F08850] defaultManager];
    LOBYTE(v8) = [v10 createFileAtPath:v9 contents:0 attributes:0];

    if (v8)
    {
      uint64_t v11 = [NSURL URLWithString:v9];
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        UARPUtilsBuildURLForTemporaryFile_cold_1();
      }
      uint64_t v11 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      UARPUtilsBuildURLForTemporaryFile_cold_2();
    }
    uint64_t v11 = 0;
  }

  return v11;
}

uint64_t createPowerAssertion(void *a1, IOPMAssertionID *a2)
{
  id v3 = a1;
  if (a2)
  {
    IOReturn v4 = IOPMAssertionCreateWithName(@"PreventUserIdleSystemSleep", 0xFFu, v3, a2);
    if (v4)
    {
      int v5 = v4;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        createPowerAssertion_cold_2((uint64_t)v3, v5);
      }
      uint64_t v6 = 0;
      *a2 = 0;
    }
    else
    {
      uint64_t v6 = 1;
    }
  }
  else
  {
    BOOL v7 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR);
    if (v7) {
      createPowerAssertion_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
    uint64_t v6 = 0;
  }

  return v6;
}

BOOL releasePowerAssertion(IOPMAssertionID a1)
{
  IOReturn v1 = IOPMAssertionRelease(a1);
  if (v1 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    releasePowerAssertion_cold_1();
  }
  return v1 == 0;
}

uint64_t UARPUtilsCreateTemporaryFolder(void *a1)
{
  v12[1] = *MEMORY[0x263EF8340];
  id v1 = a1;
  char v2 = [MEMORY[0x263F08850] defaultManager];
  if ([v2 fileExistsAtPath:v1])
  {
    uint64_t v3 = 1;
  }
  else
  {
    id v10 = 0;
    char v4 = [v2 createDirectoryAtPath:v1 withIntermediateDirectories:1 attributes:0 error:&v10];
    id v5 = v10;
    if (v4)
    {
      uint64_t v11 = *MEMORY[0x263F08078];
      v12[0] = &unk_26CEFE5A8;
      uint64_t v6 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];
      id v9 = v5;
      uint64_t v3 = [v2 setAttributes:v6 ofItemAtPath:v1 error:&v9];
      id v7 = v9;

      if ((v3 & 1) == 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        UARPUtilsCreateTemporaryFolder_cold_1();
      }
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        UARPUtilsCreateTemporaryFolder_cold_2();
      }
      uint64_t v3 = 0;
      id v7 = v5;
    }
  }
  return v3;
}

id uarpFirmwareForAccessory(void *a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = (void *)MEMORY[0x263F089D8];
  id v9 = InternalStorageDirectoryPath();
  id v10 = [v8 stringWithFormat:@"%@/%@", v9, v5];

  uint64_t v11 = [NSString stringWithUTF8String:UARPAccessoryHardwareFusingToString(2uLL)];
  if ([v6 caseInsensitiveCompare:v11]) {
    [v10 appendFormat:@"-%@", v6];
  }
  [v10 appendFormat:@"/%@", v7];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    long long v31 = "uarpFirmwareForAccessory";
    __int16 v32 = 2112;
    long long v33 = v10;
    _os_log_impl(&dword_21E079000, &_os_log_internal, OS_LOG_TYPE_INFO, "%s: Checking for firmware in directory %@", buf, 0x16u);
  }
  uint64_t v12 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v13 = [NSURL URLWithString:v10];
  uint64_t v14 = [v12 enumeratorAtURL:v13 includingPropertiesForKeys:0 options:1 errorHandler:0];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v15 = v14;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    id v24 = v7;
    id v18 = v5;
    id v19 = 0;
    uint64_t v20 = *(void *)v26;
LABEL_7:
    uint64_t v21 = 0;
    uint64_t v22 = v19;
    while (1)
    {
      if (*(void *)v26 != v20) {
        objc_enumerationMutation(v15);
      }
      id v19 = *(id *)(*((void *)&v25 + 1) + 8 * v21);

      if ([v19 checkResourceIsReachableAndReturnError:0]) {
        break;
      }
      ++v21;
      uint64_t v22 = v19;
      if (v17 == v21)
      {
        uint64_t v17 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
        if (v17) {
          goto LABEL_7;
        }

        id v19 = 0;
        break;
      }
    }
    id v5 = v18;
    id v7 = v24;
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

id dataFromHexString(void *a1)
{
  id v1 = a1;
  char v2 = objc_opt_new();
  id v3 = v1;
  uint64_t v4 = [v3 UTF8String];
  if ([v3 length])
  {
    id v15 = 0;
  }
  else
  {
    if ([v3 length])
    {
      uint64_t v5 = 0;
      unsigned int v6 = 2;
      do
      {
        int v7 = *(unsigned __int8 *)(v4 + v5);
        if ((v7 - 48) >= 0xA) {
          char v8 = 0;
        }
        else {
          char v8 = *(unsigned char *)(v4 + v5);
        }
        if (((v7 & 0xDF) - 65) >= 6u) {
          char v9 = v8;
        }
        else {
          char v9 = v7 + 9;
        }
        int v10 = *(unsigned __int8 *)(v4 + v6 - 1);
        char v11 = v10 - 48;
        if ((v10 - 48) >= 0xA) {
          char v11 = 0;
        }
        if ((v10 - 65) < 6) {
          char v11 = v10 - 55;
        }
        unsigned int v12 = v10 - 97;
        char v13 = v10 - 87;
        if (v12 >= 6) {
          char v13 = v11;
        }
        char v17 = v13 | (16 * v9);
        [v2 appendBytes:&v17 length:1];
        uint64_t v5 = v6;
        BOOL v14 = [v3 length] > (unint64_t)v6;
        v6 += 2;
      }
      while (v14);
    }
    id v15 = [MEMORY[0x263EFF8F8] dataWithData:v2];
  }

  return v15;
}

uint64_t postStagingStatusForModelIdentifier(uint64_t a1, uint64_t a2)
{
  [NSString stringWithFormat:@"%s%@", "com.apple.uarp.stagingstatus.", a1];
  int out_token = 0;
  id v3 = objc_claimAutoreleasedReturnValue();
  if (notify_register_check((const char *)[v3 UTF8String], &out_token))
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      postStagingStatusForModelIdentifier_cold_1();
    }
    uint64_t v4 = 0xFFFFFFFFLL;
  }
  else
  {
    notify_set_state(out_token, a2);
    notify_post((const char *)[v3 UTF8String]);
    uint64_t v4 = out_token;
  }

  return v4;
}

void UARPCleanupAgedFiles(void *a1, double a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  char v2 = UARPArrayOfExpiredFiles(a1, 0, a2);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v16 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    unsigned int v6 = &_os_log_internal;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * v7);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
          UARPCleanupAgedFiles_cold_1(buf, v8, &v15);
        }
        char v9 = [MEMORY[0x263F08850] defaultManager];
        [v9 removeItemAtPath:v8 error:0];

        ++v7;
      }
      while (v4 != v7);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v16 count:16];
    }
    while (v4);
  }
}

void UARPCopyFile(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [NSURL fileURLWithPath:a1];
  uint64_t v8 = [v7 URLByAppendingPathComponent:v6];
  char v9 = [MEMORY[0x263F08850] defaultManager];
  long long v10 = [v8 path];
  char v11 = [v9 fileExistsAtPath:v10];

  if (v11)
  {
    long long v12 = [NSURL fileURLWithPath:v5];
    long long v13 = [v12 URLByAppendingPathComponent:v6];
    BOOL v14 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v15 = [v13 path];
    char v16 = [v14 fileExistsAtPath:v15];

    if ((v16 & 1) == 0)
    {
      uint64_t v17 = [MEMORY[0x263F08850] defaultManager];
      id v22 = 0;
      char v18 = [v17 copyItemAtURL:v8 toURL:v13 error:&v22];
      id v19 = v22;

      if (v18)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
        {
          uint64_t v20 = [v8 path];
          uint64_t v21 = [v13 path];
          *(_DWORD *)buf = 138412546;
          id v24 = v20;
          __int16 v25 = 2112;
          long long v26 = v21;
          _os_log_impl(&dword_21E079000, &_os_log_internal, OS_LOG_TYPE_INFO, "Successfully copied %@ to %@", buf, 0x16u);
        }
      }
      else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        UARPCopyFile_cold_1(v8, v13, (uint64_t)v19);
      }
    }
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    UARPCopyFile_cold_2(v8);
  }
}

BOOL UARPCreateFile(void *a1)
{
  id v1 = a1;
  char v2 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v3 = [v1 path];
  char v4 = [v2 fileExistsAtPath:v3];

  BOOL v8 = 1;
  if ((v4 & 1) == 0)
  {
    id v5 = [MEMORY[0x263F08850] defaultManager];
    id v6 = [v1 path];
    int v7 = [v5 createFileAtPath:v6 contents:0 attributes:0];

    if (!v7) {
      BOOL v8 = 0;
    }
  }

  return v8;
}

uint64_t UARPWriteFile(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (UARPCreateFile(v4))
  {
    id v18 = 0;
    id v5 = [MEMORY[0x263F08840] fileHandleForWritingToURL:v4 error:&v18];
    id v6 = v18;
    if (!v5)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        UARPWriteFile_cold_1(v4);
      }
      uint64_t v12 = 0;
      goto LABEL_22;
    }
    id v16 = 0;
    uint64_t v17 = 0;
    char v7 = [v5 uarpSeekToEndReturningOffset:&v17 error:&v16];
    id v8 = v16;

    if (v7)
    {
      id v15 = 0;
      char v9 = [v5 uarpWriteData:v3 error:&v15];
      id v10 = v15;

      if ((v9 & 1) == 0)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          UARPWriteFile_cold_3(v4);
        }
        uint64_t v12 = 1;
        id v8 = v10;
        goto LABEL_21;
      }
      id v14 = 0;
      char v11 = [v5 uarpCloseAndReturnError:&v14];
      id v8 = v14;

      if (v11)
      {
        uint64_t v12 = 1;
LABEL_21:
        id v6 = v8;
LABEL_22:

        goto LABEL_23;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        UARPWriteFile_cold_2(v4);
      }
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      UARPWriteFile_cold_4(v4);
    }
    uint64_t v12 = 0;
    goto LABEL_21;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    UARPWriteFile_cold_5(v4);
  }
  uint64_t v12 = 0;
LABEL_23:

  return v12;
}

id UARPTimestamp()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  [v0 setDateFormat:@"yyyy-MM-dd-hh-mm-ss"];
  id v1 = [MEMORY[0x263EFF910] date];
  char v2 = [v0 stringFromDate:v1];

  return v2;
}

id UARPUniqueFilename(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a1;
  id v10 = a2;
  id v11 = a4;
  uint64_t v12 = (objc_class *)MEMORY[0x263EFF980];
  id v13 = a5;
  id v14 = a3;
  id v15 = objc_alloc_init(v12);
  id v16 = v15;
  if (v9) {
    [v15 addObject:v9];
  }
  if (v10) {
    [v16 addObject:v10];
  }
  if (v11) {
    [v16 addObject:v11];
  }
  uint64_t v17 = UARPTimestamp();
  [v16 addObject:v17];

  id v18 = (void *)[v16 copy];
  id v19 = UARPUniqueFilePathWithIdentifierComponents(v14, v18, v13);

  return v19;
}

id UARPUniqueFilePathWithIdentifierComponents(void *a1, void *a2, void *a3)
{
  id v5 = a1;
  id v6 = a3;
  id v7 = a2;
  id v8 = objc_opt_new();
  id v9 = v8;
  if (v5) {
    [v8 addObject:v5];
  }
  id v10 = objc_opt_new();
  id v11 = [v7 componentsJoinedByString:@"-"];

  [v10 appendString:v11];
  if (v6) {
    [v10 appendFormat:@"%@", v6];
  }
  [v9 addObject:v10];
  uint64_t v12 = [NSString pathWithComponents:v9];

  return v12;
}

id InternalStorageDirectoryPath()
{
  if (InternalStorageDirectoryPath_onceToken != -1) {
    dispatch_once(&InternalStorageDirectoryPath_onceToken, &__block_literal_global_4);
  }
  id v0 = (void *)InternalStorageDirectoryPath_path;
  return v0;
}

void __InternalStorageDirectoryPath_block_invoke()
{
  id v0 = (void *)InternalStorageDirectoryPath_path;
  InternalStorageDirectoryPath_path = @"/var/db/accessoryupdater/uarp/";
}

void sub_21E0E495C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

id getCSCoreSpeechServicesClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  id v0 = (void *)getCSCoreSpeechServicesClass_softClass;
  uint64_t v7 = getCSCoreSpeechServicesClass_softClass;
  if (!getCSCoreSpeechServicesClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getCSCoreSpeechServicesClass_block_invoke;
    v3[3] = &unk_2644926F0;
    v3[4] = &v4;
    __getCSCoreSpeechServicesClass_block_invoke((uint64_t)v3);
    id v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21E0E4F04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E0E5300(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void __getCSVoiceTriggerRTModelClass_block_invoke_0(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("CSVoiceTriggerRTModel");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCSVoiceTriggerRTModelClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getCSVoiceTriggerRTModelClass_block_invoke_cold_1();
    CoreSpeechLibrary();
  }
}

void CoreSpeechLibrary()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1[0] = 0;
  if (!CoreSpeechLibraryCore_frameworkLibrary_0)
  {
    v1[1] = MEMORY[0x263EF8330];
    v1[2] = 3221225472;
    v1[3] = __CoreSpeechLibraryCore_block_invoke_0;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_264492F78;
    uint64_t v3 = 0;
    CoreSpeechLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  id v0 = (void *)v1[0];
  if (!CoreSpeechLibraryCore_frameworkLibrary_0)
  {
    id v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __CoreSpeechLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  CoreSpeechLibraryCore_frameworkLibrary_0 = result;
  return result;
}

Class __getCSCoreSpeechServicesClass_block_invoke(uint64_t a1)
{
  CoreSpeechLibrary();
  Class result = objc_getClass("CSCoreSpeechServices");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCSCoreSpeechServicesClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = __getCSCoreSpeechServicesClass_block_invoke_cold_1();
    return (Class)__getCSCoreSpeechServicesAccessoryInfoClass_block_invoke(v3);
  }
  return result;
}

UARPHeySiriModelVoiceAssist *__getCSCoreSpeechServicesAccessoryInfoClass_block_invoke(uint64_t a1)
{
  CoreSpeechLibrary();
  Class result = (UARPHeySiriModelVoiceAssist *)objc_getClass("CSCoreSpeechServicesAccessoryInfo");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCSCoreSpeechServicesAccessoryInfoClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (UARPHeySiriModelVoiceAssist *)__getCSCoreSpeechServicesAccessoryInfoClass_block_invoke_cold_1();
    return [(UARPHeySiriModelVoiceAssist *)v3 init];
  }
  return result;
}

char *uarpAssetTagMappedAnalytics4cc()
{
  Class result = uarpAssetTagMappedAnalytics4cc_assetTag;
  uarpAssetTagMappedAnalytics4cc_assetTag[4] = 0;
  return result;
}

uint64_t uarpAssetTagMappedAnalytics()
{
  uarpAssetTagMappedAnalytics4cc_assetTag[4] = 0;
  return uarpPayloadTagPack((unsigned int *)uarpAssetTagMappedAnalytics4cc_assetTag);
}

int *uarpAssetTagStructMappedAnalytics()
{
  uarpAssetTagMappedAnalytics4cc_assetTag[4] = 0;
  Class result = &uarpAssetTagStructMappedAnalytics_myTag;
  uarpAssetTagStructMappedAnalytics_myTag = *(_DWORD *)uarpAssetTagMappedAnalytics4cc_assetTag;
  return result;
}

__int16 *uarpOuiMappedAnalytics()
{
  Class result = &uarpOuiMappedAnalytics_myOui;
  uarpOuiMappedAnalytics_myOuuint64_t i = 5408;
  byte_267D27C86 = -126;
  return result;
}

uint64_t uarpBuildMappedAnalyticsAsset(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  id v11 = (char *)uarpPlatformAssetFindByAssetContextAndList(a1, a2, 1);
  if (!v11) {
    return 11;
  }
  uint64_t v12 = (uint64_t)v11;
  uarpAssetTagMappedAnalytics4cc_assetTag[4] = 0;
  uarpAssetTagStructMappedAnalytics_myTag = *(_DWORD *)uarpAssetTagMappedAnalytics4cc_assetTag;
  uint64_t result = UARPSuperBinaryPrepareDynamicAsset(a1, v11, a5, a6, *(int *)uarpAssetTagMappedAnalytics4cc_assetTag);
  if (!result)
  {
    if (a4)
    {
      uint64_t v14 = a4;
      for (uint64_t i = a3 + 20; ; i += 48)
      {
        int v16 = *(_DWORD *)(i - 4);
        uarpAssetTagMappedAnalytics4cc_assetTag[4] = 0;
        uarpAssetTagStructMappedAnalytics_myTag = *(_DWORD *)uarpAssetTagMappedAnalytics4cc_assetTag;
        a4 = a4 & 0xFFFFFFFF00000000 | *(unsigned int *)uarpAssetTagMappedAnalytics4cc_assetTag;
        uint64_t result = UARPSuperBinaryAddPayload2(a1, v12, v16, a4, *(void *)(i - 20), *(void *)(i - 12), *(const void **)(i + 20), *(_DWORD *)(i + 12), 0);
        if (result) {
          break;
        }
        int v17 = 0;
        int v17 = uarpHtonl(*(_DWORD *)(i + 8));
        uint64_t result = UARPSuperBinaryAppendPayloadMetaData(a1, v12, *(_DWORD *)(i - 4), 538280449, 4u, &v17);
        if (result) {
          break;
        }
        uint64_t result = UARPSuperBinaryAppendPayloadMetaData(a1, v12, *(_DWORD *)(i - 4), 538280448, 5u, (const void *)i);
        if (result) {
          break;
        }
        if (!--v14) {
          return UARPSuperBinaryFinalizeDynamicAsset(a1, v12);
        }
      }
    }
    else
    {
      return UARPSuperBinaryFinalizeDynamicAsset(a1, v12);
    }
  }
  return result;
}

uint64_t uarpPlatformEndpointStreamingRecvInit(uint64_t a1, uint64_t a2)
{
  uint64_t result = 30;
  if (a1 && a2)
  {
    uint64_t v7 = 0;
    UARPLayer2RequestBuffer(a1, &v7, 0x18u);
    if (v7)
    {
      unsigned int v5 = *(_DWORD *)(a2 + 4) + 36;
      UARPLayer2RequestBuffer(a1, v7, v5);
      uint64_t v6 = v7;
      if (*(void *)v7)
      {
        uint64_t result = 0;
        *((_DWORD *)v7 + 2) = v5;
        *(void *)(a2 + 88) = v6;
        return result;
      }
      UARPLayer2ReturnBuffer(a1, v7);
    }
    return 11;
  }
  return result;
}

void uarpPlatformEndpointStreamingRecvDeinit(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    if (a2)
    {
      uint64_t v3 = *(void ***)(a2 + 88);
      if (v3)
      {
        if (*v3)
        {
          UARPLayer2ReturnBuffer(a1, *v3);
          uint64_t v3 = *(void ***)(a2 + 88);
          UARPHeySiriModelVoiceAssist *v3 = 0;
        }
        UARPLayer2ReturnBuffer(a1, v3);
        *(void *)(a2 + 88) = 0;
      }
    }
  }
}

uint64_t uarpPlatformEndpointStreamingRecvBytes(uint64_t a1, uint64_t a2, char *a3, int a4)
{
  uint64_t result = 30;
  if (a1)
  {
    if (a2)
    {
      uint64_t v7 = a3;
      if (a3)
      {
        LODWORD(v8) = a4;
        if (a4)
        {
          id v9 = *(_DWORD **)(a2 + 88);
          if (v9) {
            goto LABEL_6;
          }
          uint64_t result = uarpPlatformEndpointStreamingRecvInit(a1, a2);
          if (result) {
            return result;
          }
          id v9 = *(_DWORD **)(a2 + 88);
          if (v9)
          {
LABEL_6:
            if (v9[2] >= v8)
            {
              uint64_t v8 = v8;
              unsigned int v10 = v9[4];
              do
              {
                char v11 = *v7++;
                *(unsigned char *)(*(void *)v9 + v10) = v11;
                unsigned int v10 = v9[4] + 1;
                v9[4] = v10;
                if (v10 == 6)
                {
                  unsigned int v12 = uarpHtons(*(unsigned __int16 *)(*(void *)v9 + 2)) + 6;
                  v9[3] = v12;
                  unsigned int v10 = v9[4];
                }
                else
                {
                  unsigned int v12 = v9[3];
                }
                if (v10 == v12)
                {
                  uint64_t result = uarpPlatformEndpointRecvMessage(a1, a2, *(unsigned __int16 **)v9, v12);
                  if (result) {
                    return result;
                  }
                  bzero(*(void **)v9, v9[2]);
                  unsigned int v10 = 0;
                  v9[3] = 0;
                  v9[4] = 0;
                }
                --v8;
              }
              while (v8);
              return 0;
            }
            else
            {
              return 30;
            }
          }
          else
          {
            return 27;
          }
        }
      }
    }
  }
  return result;
}

char *uarpAssetTagAnalytics4cc()
{
  uint64_t result = uarpAssetTagAnalytics4cc_assetTag;
  uarpAssetTagAnalytics4cc_assetTag[4] = 0;
  return result;
}

uint64_t uarpAssetTagAnalytics()
{
  uarpAssetTagAnalytics4cc_assetTag[4] = 0;
  return uarpPayloadTagPack((unsigned int *)uarpAssetTagAnalytics4cc_assetTag);
}

int *uarpAssetTagStructAnalytics()
{
  uarpAssetTagAnalytics4cc_assetTag[4] = 0;
  uint64_t result = &uarpAssetTagStructAnalytics_myTag;
  uarpAssetTagStructAnalytics_myTag = *(_DWORD *)uarpAssetTagAnalytics4cc_assetTag;
  return result;
}

__int16 *uarpOuiAnalytics()
{
  uint64_t result = &uarpOuiAnalytics_myOui;
  uarpOuiAnalytics_myOuuint64_t i = 27480;
  byte_267D27C8E = 20;
  return result;
}

uint64_t uarpAnalyticsAssetInitialize(uint64_t a1, uint64_t a2)
{
  long long v3 = 0uLL;
  return UARPSuperBinarySetupHeader(a1, a2, 2u, &v3, 1);
}

char *uarpAssetTagCrashAnalytics4cc()
{
  uint64_t result = uarpAssetTagCrashAnalytics4cc_assetTag;
  uarpAssetTagCrashAnalytics4cc_assetTag[4] = 0;
  return result;
}

uint64_t uarpAssetTagCrashAnalytics()
{
  uarpAssetTagCrashAnalytics4cc_assetTag[4] = 0;
  return uarpPayloadTagPack((unsigned int *)uarpAssetTagCrashAnalytics4cc_assetTag);
}

int *uarpAssetTagStructCrashAnalytics()
{
  uarpAssetTagCrashAnalytics4cc_assetTag[4] = 0;
  uint64_t result = &uarpAssetTagStructCrashAnalytics_myTag;
  uarpAssetTagStructCrashAnalytics_myTag = *(_DWORD *)uarpAssetTagCrashAnalytics4cc_assetTag;
  return result;
}

__int16 *uarpOuiCrashAnalytics()
{
  uint64_t result = &uarpOuiCrashAnalytics_myOui;
  uarpOuiCrashAnalytics_myOuuint64_t i = 27480;
  byte_267D27C96 = 20;
  return result;
}

uint64_t uarpBuildCrashAnalyticsAsset(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, const void *a6, unint64_t a7, int a8)
{
  LODWORD(v8) = a8;
  char v19 = a5;
  uint64_t v14 = (char *)uarpPlatformAssetFindByAssetContextAndList(a1, a2, 1);
  if (!v14) {
    return 11;
  }
  uint64_t v15 = (uint64_t)v14;
  uarpAssetTagCrashAnalytics4cc_assetTag[4] = 0;
  uarpAssetTagStructCrashAnalytics_myTag = *(_DWORD *)uarpAssetTagCrashAnalytics4cc_assetTag;
  uint64_t result = UARPSuperBinaryPrepareDynamicAsset(a1, v14, a3, a4, *(int *)uarpAssetTagCrashAnalytics4cc_assetTag);
  if (!result)
  {
    uint64_t result = UARPSuperBinaryAddSuperBinaryMetaData(a1, v15, -252806655, 5u, a6);
    if (!result)
    {
      uint64_t result = UARPSuperBinaryAddSuperBinaryMetaData(a1, v15, -252806653, 1u, &v19);
      if (!result)
      {
        if (v8)
        {
          uint64_t v8 = v8;
          for (unint64_t i = a7 + 24; ; i += 56)
          {
            int v18 = *(_DWORD *)(i - 8);
            uarpAssetTagCrashAnalytics4cc_assetTag[4] = 0;
            uarpAssetTagStructCrashAnalytics_myTag = *(_DWORD *)uarpAssetTagCrashAnalytics4cc_assetTag;
            a7 = a7 & 0xFFFFFFFF00000000 | *(unsigned int *)uarpAssetTagCrashAnalytics4cc_assetTag;
            uint64_t result = UARPSuperBinaryAddPayload2(a1, v15, v18, a7, *(void *)(i - 24), *(void *)(i - 16), *(const void **)i, *(_DWORD *)(i + 8), *(unsigned char *)(i + 12));
            if (result) {
              break;
            }
            uint64_t result = UARPSuperBinaryAppendPayloadMetaData(a1, v15, *(_DWORD *)(i - 8), -252806656, *(_DWORD *)(i + 24), *(const void **)(i + 16));
            if (result) {
              break;
            }
            if (!--v8) {
              return UARPSuperBinaryFinalizeDynamicAsset(a1, v15);
            }
          }
        }
        else
        {
          return UARPSuperBinaryFinalizeDynamicAsset(a1, v15);
        }
      }
    }
  }
  return result;
}

char *uarpAssetTagLogs4cc()
{
  uint64_t result = uarpAssetTagLogs4cc_assetTag;
  uarpAssetTagLogs4cc_assetTag[4] = 0;
  return result;
}

uint64_t uarpAssetTagLogs()
{
  uarpAssetTagLogs4cc_assetTag[4] = 0;
  return uarpPayloadTagPack((unsigned int *)uarpAssetTagLogs4cc_assetTag);
}

int *uarpAssetTagStructLogs()
{
  uarpAssetTagLogs4cc_assetTag[4] = 0;
  uint64_t result = &uarpAssetTagStructLogs_myTag;
  uarpAssetTagStructLogs_myTag = *(_DWORD *)uarpAssetTagLogs4cc_assetTag;
  return result;
}

__int16 *uarpOuiLogs()
{
  uint64_t result = &uarpOuiLogs_myOui;
  uarpOuiLogs_myOuunint64_t i = 16400;
  byte_267D27C9E = -13;
  return result;
}

char *uarpAssetTagPersonalization4cc()
{
  uint64_t result = uarpAssetTagPersonalization4cc_assetTag;
  uarpAssetTagPersonalization4cc_assetTag[4] = 0;
  return result;
}

uint64_t uarpAssetTagPersonalization()
{
  uarpAssetTagPersonalization4cc_assetTag[4] = 0;
  return uarpPayloadTagPack((unsigned int *)uarpAssetTagPersonalization4cc_assetTag);
}

int *uarpAssetTagStructPersonalization()
{
  uarpAssetTagPersonalization4cc_assetTag[4] = 0;
  uint64_t result = &uarpAssetTagStructPersonalization_myTag;
  uarpAssetTagStructPersonalization_myTag = *(_DWORD *)uarpAssetTagPersonalization4cc_assetTag;
  return result;
}

char *uarpAssetTagPersonalizedFirmware4cc()
{
  uint64_t result = uarpAssetTagPersonalizedFirmware4cc_assetTag;
  uarpAssetTagPersonalizedFirmware4cc_assetTag[4] = 0;
  return result;
}

uint64_t uarpAssetTagPersonalizedFirmware()
{
  uarpAssetTagPersonalizedFirmware4cc_assetTag[4] = 0;
  return uarpPayloadTagPack((unsigned int *)uarpAssetTagPersonalizedFirmware4cc_assetTag);
}

int *uarpAssetTagStructPersonalizedFirmware()
{
  uarpAssetTagPersonalizedFirmware4cc_assetTag[4] = 0;
  uint64_t result = &uarpAssetTagStructPersonalizedFirmware_myTag;
  uarpAssetTagStructPersonalizedFirmware_myTag = *(_DWORD *)uarpAssetTagPersonalizedFirmware4cc_assetTag;
  return result;
}

__int16 *uarpOuiPersonalization()
{
  uint64_t result = &uarpOuiPersonalization_myOui;
  uarpOuiPersonalization_myOuunint64_t i = -19832;
  byte_267D27CAA = -111;
  return result;
}

uint64_t uarpPersonalizationRequestAssetInitialize(uint64_t a1, uint64_t a2, int a3)
{
  long long v4 = 0uLL;
  return UARPSuperBinarySetupHeader(a1, a2, 2u, &v4, a3);
}

uint64_t uarpPersonalizationRequestPreparePayload(uint64_t a1, uint64_t a2, int a3)
{
  long long v4 = 0uLL;
  uarpAssetTagPersonalization4cc_assetTag[4] = 0;
  uarpAssetTagStructPersonalization_myTag = *(_DWORD *)uarpAssetTagPersonalization4cc_assetTag;
  return UARPSuperBinaryPreparePayload(a1, a2, a3, (unsigned int *)&uarpAssetTagStructPersonalization_myTag, &v4);
}

uint64_t uarpPersonalizationRequestAddPayloadTag(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B29101, 4u, a4);
}

uint64_t uarpPersonalizationRequestAddRemoteAssetID(uint64_t a1, uint64_t a2, unsigned int a3)
{
  __int16 v6 = uarpHtons(a3);
  return UARPSuperBinaryAddMetaData(a1, a2, 0x88B29102, 2u, (uint64_t)&v6);
}

uint64_t uarpPersonalizationRequestAddManifestPrefix(uint64_t a1, uint64_t a2, int a3, uint64_t a4, unsigned int a5)
{
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B29103, a5, a4);
}

uint64_t uarpPersonalizationRequestAddBoardID(uint64_t a1, uint64_t a2, int a3, unsigned int a4)
{
  int v8 = uarpHtonl(a4);
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B29104, 4u, (uint64_t)&v8);
}

uint64_t uarpPersonalizationRequestAddBoardID64(uint64_t a1, uint64_t a2, int a3, unint64_t a4)
{
  unint64_t v8 = uarpHtonll(a4);
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B2911B, 8u, (uint64_t)&v8);
}

uint64_t uarpPersonalizationRequestAddChipID(uint64_t a1, uint64_t a2, int a3, unsigned int a4)
{
  int v8 = uarpHtonl(a4);
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B29105, 4u, (uint64_t)&v8);
}

uint64_t uarpPersonalizationRequestAddECID(uint64_t a1, uint64_t a2, int a3, unint64_t a4)
{
  unint64_t v8 = uarpHtonll(a4);
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B29106, 8u, (uint64_t)&v8);
}

uint64_t uarpPersonalizationRequestAddNonce(uint64_t a1, uint64_t a2, int a3, uint64_t a4, unsigned int a5)
{
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B29107, a5, a4);
}

uint64_t uarpPersonalizationRequestAddNonceHash(uint64_t a1, uint64_t a2, int a3, uint64_t a4, unsigned int a5)
{
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B29108, a5, a4);
}

uint64_t uarpPersonalizationRequestAddDigest(uint64_t a1, uint64_t a2, int a3, uint64_t a4, unsigned int a5)
{
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B29113, a5, a4);
}

uint64_t uarpPersonalizationRequestAddSecurityDomain(uint64_t a1, uint64_t a2, int a3, unsigned int a4)
{
  int v8 = uarpHtonl(a4);
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B29109, 4u, (uint64_t)&v8);
}

uint64_t uarpPersonalizationRequestAddSecurityMode(uint64_t a1, uint64_t a2, int a3, unsigned int a4)
{
  int v8 = uarpHtonl(a4);
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B2910A, 4u, (uint64_t)&v8);
}

uint64_t uarpPersonalizationRequestAddProductionMode(uint64_t a1, uint64_t a2, int a3, unsigned int a4)
{
  int v8 = uarpHtonl(a4);
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B2910B, 4u, (uint64_t)&v8);
}

uint64_t uarpPersonalizationRequestAddChipEpoch(uint64_t a1, uint64_t a2, int a3, unsigned int a4)
{
  int v8 = uarpHtonl(a4);
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B2910C, 4u, (uint64_t)&v8);
}

uint64_t uarpPersonalizationRequestAddChipRevision(uint64_t a1, uint64_t a2, int a3, unsigned int a4)
{
  int v8 = uarpHtonl(a4);
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B2910F, 4u, (uint64_t)&v8);
}

uint64_t uarpPersonalizationRequestAddEnableMixMatch(uint64_t a1, uint64_t a2, int a3, char a4)
{
  char v5 = a4;
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B2910D, 1u, (uint64_t)&v5);
}

uint64_t uarpPersonalizationRequestAddSoCLiveNonce(uint64_t a1, uint64_t a2, int a3, char a4)
{
  char v5 = a4;
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B29118, 1u, (uint64_t)&v5);
}

uint64_t uarpPersonalizationRequestAddTicketPrefixLUN(uint64_t a1, uint64_t a2, int a3, char a4)
{
  char v5 = a4;
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B29126, 1u, (uint64_t)&v5);
}

uint64_t uarpPersonalizationRequestAddPrefixNeedsLUN(uint64_t a1, uint64_t a2, int a3, char a4)
{
  char v5 = a4;
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B29121, 1u, (uint64_t)&v5);
}

uint64_t uarpPersonalizationRequestAddSuffixLUN(uint64_t a1, uint64_t a2, int a3, char a4)
{
  char v5 = a4;
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B29122, 1u, (uint64_t)&v5);
}

uint64_t uarpPersonalizationRequestMoreRequestsToFollow(uint64_t a1, uint64_t a2, int a3, char a4)
{
  char v5 = a4;
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B29127, 1u, (uint64_t)&v5);
}

uint64_t uarpPersonalizationRequestAddRemoteAssetPayloadIndex(uint64_t a1, uint64_t a2, int a3, unsigned int a4)
{
  int v8 = uarpHtonl(a4);
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B2910E, 4u, (uint64_t)&v8);
}

uint64_t uarpPersonalizationRequestAddLogicalUnitNumber(uint64_t a1, uint64_t a2, int a3, unsigned int a4)
{
  int v8 = uarpHtonl(a4);
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B29125, 4u, (uint64_t)&v8);
}

uint64_t uarpPersonalizationRequestAddMeasurementWithOverrides(uint64_t a1, uint64_t a2, int a3, uint64_t a4, unsigned int a5, unsigned int a6, unsigned int a7)
{
  unsigned int v10 = uarpHtons(a6);
  unsigned int v11 = uarpHtons(a7);
  if (a5)
  {
    unsigned int v12 = v11;
    id v13 = (unsigned int *)a4;
    unsigned int v14 = a5;
    while (1)
    {
      unsigned int v15 = v14 - 8;
      if (v14 < 8) {
        return 30;
      }
      int v16 = uarpHtonl(*v13);
      unsigned int v17 = uarpHtonl(v13[1]);
      if (v15 < v17) {
        return 30;
      }
      unsigned int v18 = v17;
      char v19 = v13 + 2;
      unsigned int v20 = v10;
      if (v16 == -2001563371) {
        goto LABEL_8;
      }
      if (v16 == -2001563370) {
        break;
      }
LABEL_9:
      id v13 = (unsigned int *)((char *)v19 + v18);
      unsigned int v14 = v15 - v18;
      if (v15 == v18) {
        goto LABEL_10;
      }
    }
    unsigned int v20 = v12;
LABEL_8:
    _WORD *v19 = uarpHtons(v20);
    goto LABEL_9;
  }
LABEL_10:
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B29110, a5, a4);
}

uint64_t uarpPersonalizationRequestAddMeasurement(uint64_t a1, uint64_t a2, int a3, uint64_t a4, unsigned int a5)
{
  return UARPSuperBinaryAddPayloadMetaData(a1, a2, a3, 0x88B29110, a5, a4);
}

uint64_t uarpPlatformAssetProcessingCompleteInternal(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, int a5, int a6)
{
  uint64_t result = 30;
  if (a1 && a3)
  {
    if (uarpPlatformAssetIsKnown(a1, a2, a3))
    {
      *(unsigned char *)(a3 + 392) = 0;
      *(unsigned char *)(a3 + 72) = 1;
      *(void *)(a3 + 696) = 0;
      if (!a2 || (uint64_t result = uarpAssetProcessingComplete(a1, a2, a3, a5 | a4), !result))
      {
        uint64_t result = 0;
        if (a4 == 4 && !a6)
        {
          UARPLayer2AssetCorrupt(a1, a3);
          return 0;
        }
      }
    }
    else
    {
      return 23;
    }
  }
  return result;
}

uint64_t uarpPlatformAssetRequestData(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a2) {
    return 30;
  }
  uint64_t v3 = *(void *)(a2 + 696);
  if (!v3) {
    return 30;
  }
  if (*(unsigned char *)(a3 + 80) == 1) {
    return 16;
  }
  if (*(unsigned char *)(a2 + 73) == 1 || !*(unsigned char *)(v3 + 56)) {
    return 31;
  }
  int v6 = *(_DWORD *)(a3 + 8);
  int v7 = *(_DWORD *)(a3 + 84);
  unsigned int v8 = v7 + v6 + *(_DWORD *)a3;
  unsigned int v9 = *(_DWORD *)(a3 + 4) - (v7 + v6);
  if (v9 >= *(_DWORD *)(a3 + 24) - v7) {
    unsigned int v9 = *(_DWORD *)(a3 + 24) - v7;
  }
  *(_DWORD *)(a3 + 92) = v8;
  *(_DWORD *)(a3 + 96) = v9;
  if (v9 >= *(_DWORD *)(*(void *)(a2 + 696) + 4)) {
    unsigned int v10 = *(_DWORD *)(*(void *)(a2 + 696) + 4);
  }
  else {
    unsigned int v10 = v9;
  }
  *(_DWORD *)(a3 + 96) = v10;
  uint64_t result = uarpSendAssetRequestData(a1, *(void *)(a2 + 696), *(unsigned __int16 *)(a2 + 44), v8, v10);
  if (!result) {
    *(unsigned char *)(a3 + 80) = 1;
  }
  return result;
}

uint64_t uarpPlatformAssetResponseData(uint64_t a1, uint64_t a2, uint64_t a3, void *__src, int a5, int a6, size_t __n)
{
  if (!*(unsigned char *)(a2 + 392)) {
    return 29;
  }
  uint64_t v7 = a3;
  if (a3)
  {
    uarpPlatformAssetProcessingCompleteInternal(a1, *(void *)(a2 + 696), a2, 4u, 0, 0);
    return v7;
  }
  if (*(_DWORD *)(a2 + 404) != a5) {
    return 29;
  }
  if (*(_DWORD *)(a2 + 408) != a6) {
    return 29;
  }
  uint64_t v10 = *(unsigned int *)(a2 + 396);
  if ((v10 + __n) > *(_DWORD *)(a2 + 336)) {
    return 29;
  }
  *(unsigned char *)(a2 + 392) = 0;
  *(_DWORD *)(a2 + 412) = __n;
  memcpy((void *)(*(void *)(a2 + 328) + v10), __src, __n);
  int v12 = *(_DWORD *)(a2 + 396) + *(_DWORD *)(a2 + 412);
  *(_DWORD *)(a2 + 396) = v12;
  int v13 = *(_DWORD *)(a2 + 320) + v12;
  int v14 = *(_DWORD *)(a2 + 316);
  if (v12 == *(_DWORD *)(a2 + 336) || v13 == v14)
  {
    uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a2 + 376))(a1, a2, a2 + 312);
    if (v7) {
      return v7;
    }
    int v15 = *(_DWORD *)(a2 + 396);
    uint64_t v16 = *(unsigned int *)(a2 + 400);
    int v17 = v15 - v16;
    if (v15 != v16)
    {
      memcpy(*(void **)(a2 + 328), (const void *)(*(void *)(a2 + 328) + v16), (v15 - v16));
      int v15 = *(_DWORD *)(a2 + 400);
    }
    *(_DWORD *)(a2 + 396) = v17;
    *(_DWORD *)(a2 + 320) += v15;
    *(_DWORD *)(a2 + 400) = 0;
  }
  if (v13 == v14)
  {
    unsigned int v18 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a2 + 384);
    return v18(a1, a2, a2 + 312);
  }
  else
  {
    return uarpPlatformAssetRequestData(a1, a2, a2 + 312);
  }
}

uint64_t uarpPlatformAssetUpdateMetaData(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))
{
  unsigned int v4 = *(_DWORD *)(a3 + 84);
  if (v4 < 8) {
    return 0;
  }
  unsigned int v9 = *(unsigned int **)(a3 + 16);
  while (1)
  {
    uint64_t v10 = uarpHtonl(*v9);
    uint64_t v11 = uarpHtonl(v9[1]);
    if (v11 > *(_DWORD *)(a3 + 24) - 8) {
      break;
    }
    unsigned int v12 = v11;
    unsigned int v13 = v4 - 8;
    unsigned int v4 = v4 - 8 - v11;
    if (v13 >= v11)
    {
      int v14 = v9 + 2;
      int v15 = *(_DWORD *)(a3 + 88) + 8;
      *(_DWORD *)(a3 + 88) = v15;
      if (a4)
      {
        a4(a1, a2, v10, v11, v14);
        int v15 = *(_DWORD *)(a3 + 88);
      }
      unsigned int v9 = (unsigned int *)((char *)v14 + v12);
      *(_DWORD *)(a3 + 88) = v15 + v12;
      if (v4 > 7) {
        continue;
      }
    }
    return 0;
  }
  return 53;
}

uint64_t uarpPlatformAssetSuperBinaryPullHeader(uint64_t a1, uint64_t a2)
{
  uint64_t result = 30;
  if (a1 && a2)
  {
    if (*(unsigned char *)(a2 + 392) == 1)
    {
      return 16;
    }
    else
    {
      uarpZero((void *)(a2 + 312), 0x88uLL);
      *(void *)(a2 + 312) = 0x2C00000000;
      *(void *)(a2 + 328) = *(void *)(a2 + 640);
      *(_DWORD *)(a2 + 336) = *(_DWORD *)(a2 + 648);
      *(void *)(a2 + 376) = uarpPlatformAssetSuperBinaryRequestWindowFilled;
      *(void *)(a2 + 384) = uarpPlatformAssetSuperBinaryRequestCompleted;
      return uarpPlatformAssetRequestData(a1, a2, a2 + 312);
    }
  }
  return result;
}

uint64_t uarpPlatformAssetSuperBinaryRequestWindowFilled(uint64_t a1, uint64_t a2, uint64_t a3)
{
  UARPLayer2AssetStore(a1, a2);
  int v6 = *(unsigned int **)(a3 + 16);
  *(_DWORD *)a2 = uarpHtonl(*v6);
  *(_DWORD *)(a2 + 4) = uarpHtonl(v6[1]);
  *(_DWORD *)(a2 + 8) = uarpHtonl(v6[2]);
  uarpVersionEndianSwap(v6 + 3, (_DWORD *)(a2 + 12));
  *(_DWORD *)(a2 + 28) = uarpHtonl(v6[7]);
  *(_DWORD *)(a2 + 32) = uarpHtonl(v6[8]);
  *(_DWORD *)(a2 + 36) = uarpHtonl(v6[9]);
  int v7 = uarpHtonl(v6[10]);
  *(_DWORD *)(a2 + 40) = v7;
  *(_DWORD *)(a3 + 88) = *(_DWORD *)(a3 + 84);
  unsigned int v8 = *(_DWORD *)(a2 + 68);
  if (*(_DWORD *)(a2 + 36) + v7 > v8
    || *(_DWORD *)(a2 + 32) + *(_DWORD *)(a2 + 28) > v8
    || *(_DWORD *)(a2 + 4) != 44
    || (uint64_t result = 0, *(_DWORD *)a2 >= 4u))
  {
    uarpPlatformAssetProcessingCompleteInternal(a1, *(void *)(a2 + 696), a2, 4u, 0, 0);
    return 47;
  }
  return result;
}

uint64_t uarpPlatformAssetSuperBinaryRequestCompleted(uint64_t a1, uint64_t a2)
{
  return 0;
}

uint64_t uarpPlatformAssetSuperBinaryPullMetaData(uint64_t a1, uint64_t a2)
{
  uint64_t result = 30;
  if (a1 && a2)
  {
    if (*(_DWORD *)(a2 + 32))
    {
      *(_DWORD *)(a2 + 688) = 0;
      if (*(unsigned char *)(a2 + 392) == 1)
      {
        return 16;
      }
      else
      {
        uarpZero((void *)(a2 + 312), 0x88uLL);
        *(void *)(a2 + 312) = *(void *)(a2 + 28);
        *(void *)(a2 + 328) = *(void *)(a2 + 640);
        *(_DWORD *)(a2 + 336) = *(_DWORD *)(a2 + 648);
        *(void *)(a2 + 376) = uarpPlatformAssetSuperBinaryMetaDataRequestWindowFilled;
        *(void *)(a2 + 384) = uarpPlatformAssetSuperBinaryMetaDataRequestCompleted;
        return uarpPlatformAssetRequestData(a1, a2, a2 + 312);
      }
    }
    else
    {
      return 40;
    }
  }
  return result;
}

uint64_t uarpPlatformAssetSuperBinaryMetaDataRequestWindowFilled(uint64_t a1, uint64_t a2, uint64_t a3)
{
  UARPLayer2AssetStore(a1, a2);
  uint64_t updated = uarpPlatformAssetUpdateMetaData(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))UARPLayer2AssetMetaDataTLV);
  if (updated) {
    UARPLayer2AssetMetaDataProcessingError(a1, a2);
  }
  else {
    *(_DWORD *)(a2 + 688) += *(_DWORD *)(a3 + 88);
  }
  return updated;
}

uint64_t uarpPlatformAssetSuperBinaryMetaDataRequestCompleted(uint64_t a1, uint64_t a2)
{
  return 0;
}

uint64_t uarpPlatformAssetSuperBinaryPullProposedPayloadHeader(uint64_t a1, uint64_t a2)
{
  uint64_t result = 30;
  if (a1 && a2 && *(_DWORD *)(a2 + 456) <= *(_DWORD *)(a2 + 448))
  {
    if (*(unsigned char *)(a2 + 392) == 1)
    {
      return 16;
    }
    else
    {
      uarpZero((void *)(a2 + 312), 0x88uLL);
      *(_DWORD *)(a2 + 312) = 40 * *(_DWORD *)(a2 + 456) + 44;
      *(_DWORD *)(a2 + 316) = 40;
      *(void *)(a2 + 328) = *(void *)(a2 + 640);
      *(_DWORD *)(a2 + 336) = *(_DWORD *)(a2 + 648);
      *(void *)(a2 + 376) = uarpPlatformAssetPayloadHeaderRequestWindowFilled;
      *(void *)(a2 + 384) = uarpPlatformAssetPayloadHeaderRequestCompleted;
      return uarpPlatformAssetRequestData(a1, a2, a2 + 312);
    }
  }
  return result;
}

uint64_t uarpPlatformAssetPayloadHeaderRequestWindowFilled(uint64_t a1, uint64_t a2, uint64_t a3)
{
  UARPLayer2AssetStore(a1, a2);
  uint64_t v6 = uarpPlatformAssetPayloadHeaderProcess(*(unsigned int **)(a3 + 16), a2 + 464, *(_DWORD *)(a2 + 68));
  if (v6) {
    uarpPlatformAssetProcessingCompleteInternal(a1, *(void *)(a2 + 696), a2, 4u, 0, 0);
  }
  else {
    *(_DWORD *)(a3 + 88) = *(_DWORD *)(a3 + 84);
  }
  return v6;
}

uint64_t uarpPlatformAssetPayloadHeaderRequestCompleted(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a2 + 452) = *(_DWORD *)(a2 + 456);
  UARPLayer2PayloadReady(a1, a2);
  return 0;
}

uint64_t uarpPlatformAssetPayloadHeaderProcess(unsigned int *a1, uint64_t a2, unsigned int a3)
{
  *(_DWORD *)a2 = uarpHtonl(*a1);
  *(_DWORD *)(a2 + 4) = a1[1];
  uarpVersionEndianSwap(a1 + 2, (_DWORD *)(a2 + 8));
  *(_DWORD *)(a2 + 24) = uarpHtonl(a1[6]);
  *(_DWORD *)(a2 + 28) = uarpHtonl(a1[7]);
  *(_DWORD *)(a2 + 32) = uarpHtonl(a1[8]);
  int v6 = uarpHtonl(a1[9]);
  *(_DWORD *)(a2 + 36) = v6;
  *(unsigned char *)(a2 + 52) = 0;
  *(_DWORD *)(a2 + 56) = 0;
  *(_DWORD *)(a2 + 76) = 0;
  *(_DWORD *)(a2 + 128) = v6;
  uint64_t v7 = 48;
  if (*(_DWORD *)(a2 + 28) + *(_DWORD *)(a2 + 24) <= a3)
  {
    if (*(_DWORD *)(a2 + 32) + v6 <= a3) {
      return 0;
    }
    else {
      return 48;
    }
  }
  return v7;
}

uint64_t uarpPlatformAssetPayloadPullMetaData(uint64_t a1, uint64_t a2)
{
  uint64_t result = 30;
  if (a1 && a2)
  {
    if (*(_DWORD *)(a2 + 452) == -1)
    {
      return 44;
    }
    else if (*(_DWORD *)(a2 + 492))
    {
      *(_DWORD *)(a2 + 512) = 0;
      if (*(unsigned char *)(a2 + 392) == 1)
      {
        return 16;
      }
      else
      {
        uarpZero((void *)(a2 + 312), 0x88uLL);
        *(void *)(a2 + 312) = *(void *)(a2 + 488);
        *(void *)(a2 + 328) = *(void *)(a2 + 640);
        *(_DWORD *)(a2 + 336) = *(_DWORD *)(a2 + 648);
        *(void *)(a2 + 376) = uarpPlatformAssetPayloadMetaDataRequestWindowFilled;
        *(void *)(a2 + 384) = uarpPlatformAssetPayloadMetaDataRequestCompleted;
        return uarpPlatformAssetRequestData(a1, a2, a2 + 312);
      }
    }
    else
    {
      return 40;
    }
  }
  return result;
}

uint64_t uarpPlatformAssetPayloadMetaDataRequestWindowFilled(uint64_t a1, uint64_t a2, uint64_t a3)
{
  UARPLayer2AssetStore(a1, a2);
  uint64_t updated = uarpPlatformAssetUpdateMetaData(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))UARPLayer2PayloadMetaDataTLV);
  if (updated) {
    UARPLayer2PayloadMetaDataProcessingError(a1, a2);
  }
  else {
    *(_DWORD *)(a2 + 512) += *(_DWORD *)(a3 + 88);
  }
  return updated;
}

uint64_t uarpPlatformAssetPayloadMetaDataRequestCompleted(uint64_t a1, uint64_t a2)
{
  return 0;
}

uint64_t uarpPlatformAssetPayloadPullData(uint64_t a1, uint64_t a2)
{
  uint64_t result = 30;
  if (a1 && a2)
  {
    if (*(_DWORD *)(a2 + 452) == -1) {
      return 44;
    }
    unsigned int v5 = *(_DWORD *)(a2 + 508);
    if (v5 > *(_DWORD *)(a2 + 500) || *(_DWORD *)(a2 + 496) + v5 > *(_DWORD *)(a2 + 8)) {
      return 43;
    }
    if (*(unsigned char *)(a2 + 392) == 1) {
      return 16;
    }
    uarpZero((void *)(a2 + 312), 0x88uLL);
    int v6 = *(_DWORD *)(a2 + 508);
    *(_DWORD *)(a2 + 312) = v6 + *(_DWORD *)(a2 + 496);
    *(_DWORD *)(a2 + 316) = *(_DWORD *)(a2 + 500) - v6;
    *(void *)(a2 + 328) = *(void *)(a2 + 640);
    int v7 = *(_DWORD *)(a2 + 648);
    *(_DWORD *)(a2 + 336) = v7;
    *(_DWORD *)(a2 + 368) = v7;
    *(void *)(a2 + 376) = uarpPlatformAssetPayloadDataRequestWindowFilled;
    *(void *)(a2 + 384) = uarpPlatformAssetPayloadDataRequestCompleted;
    if (*(unsigned char *)(a2 + 516) == 1)
    {
      *(unsigned char *)(a2 + 356) = 1;
      *(_DWORD *)(a2 + 336) = 10;
      *(void *)(a2 + 344) = *(void *)(a2 + 656);
      *(_DWORD *)(a2 + 352) = *(_DWORD *)(a2 + 664);
      *(void *)(a2 + 376) = uarpPlatformAssetPayloadDataRequestCompressionHeader;
    }
    uint64_t v8 = *(unsigned int *)(a2 + 520);
    *(_DWORD *)(a2 + 416) = v8;
    UARPLayer2HashInfo(a1, v8, (_DWORD *)(a2 + 420), (_DWORD *)(a2 + 432));
    unsigned int v9 = *(_DWORD *)(a2 + 420);
    if (v9)
    {
      uint64_t result = UARPLayer2RequestBuffer(a1, (void *)(a2 + 424), v9);
      if (result) {
        return result;
      }
      if (!*(void *)(a2 + 424)) {
        return 11;
      }
    }
    unsigned int v10 = *(_DWORD *)(a2 + 432);
    if (v10)
    {
      uint64_t result = UARPLayer2RequestBuffer(a1, (void *)(a2 + 440), v10);
      if (result) {
        return result;
      }
      if (!*(void *)(a2 + 440)) {
        return 11;
      }
    }
    UARPLayer2HashInit(a1, *(unsigned int *)(a2 + 416), *(void *)(a2 + 424));
    return uarpPlatformAssetRequestData(a1, a2, a2 + 312);
  }
  return result;
}

uint64_t uarpPlatformAssetPayloadDataRequestWindowFilled(uint64_t a1, uint64_t a2, uint64_t a3)
{
  UARPLayer2HashUpdate(a1, *(unsigned int *)(a3 + 104), *(void *)(a3 + 112), *(void *)(a3 + 16), *(unsigned int *)(a3 + 84));
  UARPLayer2PayloadData(a1, a2);
  int v6 = *(_DWORD *)(a3 + 84);
  *(_DWORD *)(a3 + 88) = v6;
  *(_DWORD *)(a2 + 508) += v6;
  return 0;
}

uint64_t uarpPlatformAssetPayloadDataRequestCompleted(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(unsigned int *)(a2 + 520);
  if (!v5) {
    goto LABEL_7;
  }
  UARPLayer2HashFinal(a1, v5, *(void *)(a3 + 112), *(void *)(a3 + 128), *(unsigned int *)(a3 + 120));
  BOOL v7 = uarpPlatformCompareHash(a1, *(void **)(a3 + 128), *(unsigned int *)(a3 + 120), *(void **)(a2 + 528), *(_DWORD *)(a2 + 536));
  uint64_t v8 = *(void **)(a3 + 112);
  if (v8)
  {
    UARPLayer2ReturnBuffer(a1, v8);
    *(void *)(a3 + 112) = 0;
    *(_DWORD *)(a3 + 108) = 0;
  }
  unsigned int v9 = *(void **)(a3 + 128);
  if (v9)
  {
    UARPLayer2ReturnBuffer(a1, v9);
    *(void *)(a3 + 128) = 0;
    *(_DWORD *)(a3 + 120) = 0;
  }
  *(_DWORD *)(a3 + 104) = 0;
  if (!v7) {
    UARPLayer2AssetCorrupt(a1, a2);
  }
  else {
LABEL_7:
  }
    UARPLayer2PayloadDataComplete2(a1, (void *)a2);
  return 0;
}

uint64_t uarpPlatformAssetPayloadDataRequestCompressionHeader(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uarpCompressionHeaderEndianSwap(*(unsigned __int16 **)(a3 + 16), a3 + 45);
  int v5 = *(_DWORD *)(a3 + 84);
  *(_DWORD *)(a3 + 88) = v5;
  *(_DWORD *)(a2 + 508) += v5;
  *(unsigned char *)(a3 + 44) = 0;
  unsigned int v6 = *(unsigned __int16 *)(a3 + 51);
  *(_DWORD *)(a3 + 24) = v6;
  if (*(_DWORD *)(a3 + 56) < v6 || *(_DWORD *)(a3 + 40) < *(unsigned __int16 *)(a3 + 53)) {
    return 51;
  }
  uint64_t result = 0;
  *(void *)(a3 + 64) = uarpPlatformAssetPayloadDataRequestCompressedBlock;
  return result;
}

uint64_t uarpPlatformAssetPullAllPayloadHeaders(uint64_t a1, uint64_t a2)
{
  uint64_t result = 30;
  if (a1 && a2)
  {
    if (*(unsigned char *)(a2 + 392) == 1)
    {
      return 16;
    }
    else
    {
      uint64_t v7 = 0;
      if (*(int *)(a2 + 448) < 1)
      {
LABEL_9:
        uarpZero((void *)(a2 + 312), 0x88uLL);
        *(void *)(a2 + 312) = *(void *)(a2 + 36);
        *(void *)(a2 + 328) = *(void *)(a2 + 640);
        *(_DWORD *)(a2 + 336) = *(_DWORD *)(a2 + 648);
        *(void *)(a2 + 376) = uarpPlatformAssetAllPayloadHeadersRequestWindowFilled;
        *(void *)(a2 + 384) = uarpPlatformAssetAllPayloadHeadersRequestCompleted;
        return uarpPlatformAssetRequestData(a1, a2, a2 + 312);
      }
      else
      {
        int v5 = 0;
        while (1)
        {
          uint64_t result = UARPLayer2RequestBuffer(a1, &v7, 0xB8u);
          if (result) {
            break;
          }
          uint64_t v6 = v7;
          *(void *)(v7 + 176) = *(void *)(a2 + 632);
          *(void *)(a2 + 632) = v6;
          if (++v5 >= *(_DWORD *)(a2 + 448)) {
            goto LABEL_9;
          }
        }
      }
    }
  }
  return result;
}

uint64_t uarpPlatformAssetAllPayloadHeadersRequestWindowFilled(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(int *)(a2 + 448) < 1) {
    return 0;
  }
  uint64_t v6 = 0;
  uint64_t v7 = *(unsigned int **)(a3 + 16);
  uint64_t v8 = *(void *)(a2 + 632);
  while (1)
  {
    if (!v8) {
      return 11;
    }
    uint64_t v9 = uarpPlatformAssetPayloadHeaderProcess(v7, v8, *(_DWORD *)(a2 + 68));
    if (v9) {
      break;
    }
    *(_DWORD *)(v8 + 124) = v6;
    uint64_t v8 = *(void *)(v8 + 176);
    *(_DWORD *)(a3 + 88) += 40;
    ++v6;
    v7 += 10;
    if (v6 >= *(int *)(a2 + 448)) {
      return 0;
    }
  }
  uint64_t v10 = v9;
  uarpPlatformAssetProcessingCompleteInternal(a1, *(void *)(a2 + 696), a2, 4u, 0, 0);
  return v10;
}

_DWORD *uarpProcessTLV(uint64_t a1, unsigned int *a2)
{
  int v4 = uarpHtonl(*a2);
  unsigned int v5 = uarpHtonl(a2[1]);
  uint64_t v9 = 0;
  int v6 = UARPLayer2RequestBuffer(a1, &v9, v5 + 24);
  uint64_t v7 = 0;
  if (!v6)
  {
    uint64_t v7 = v9;
    _DWORD *v9 = v4;
    v7[1] = v5;
    memcpy(v7 + 6, a2 + 2, v5);
    *((void *)v7 + 1) = v7 + 6;
  }
  return v7;
}

uint64_t uarpPlatformAssetPullAllMetaData(uint64_t a1, uint64_t a2)
{
  uint64_t result = 30;
  if (!a1 || !a2) {
    return result;
  }
  if (*(unsigned char *)(a2 + 392) == 1) {
    return 16;
  }
  uarpZero((void *)(a2 + 312), 0x88uLL);
  int v6 = *(_DWORD *)(a2 + 28);
  unsigned int v5 = *(_DWORD *)(a2 + 32);
  *(_DWORD *)(a2 + 312) = v6;
  *(_DWORD *)(a2 + 316) = v5;
  for (uint64_t i = *(void *)(a2 + 632); i; uint64_t i = *(void *)(i + 176))
  {
    int v8 = *(_DWORD *)(i + 24);
    if (v8)
    {
      if (v8 != v5 + v6) {
        return 43;
      }
      v5 += *(_DWORD *)(i + 28);
      *(_DWORD *)(a2 + 316) = v5;
    }
  }
  *(_DWORD *)(a2 + 680) = v5;
  *(void *)(a2 + 672) = 0;
  if (!v5)
  {
    *(void *)(a2 + 328) = 0;
    *(_DWORD *)(a2 + 336) = 0;
    *(void *)(a2 + 376) = uarpPlatformAssetAllMetaDataWindowFilled;
    *(void *)(a2 + 384) = uarpPlatformAssetAllMetaDataRequestCompleted;
LABEL_17:
    UARPLayer2AssetAllHeadersAndMetaDataComplete(a1, *(void *)(a2 + 696), a2);
    return 0;
  }
  uint64_t result = UARPLayer2RequestBuffer(a1, (void *)(a2 + 672), v5);
  if (result) {
    return result;
  }
  int v9 = *(_DWORD *)(a2 + 680);
  int v10 = *(_DWORD *)(a2 + 316);
  *(void *)(a2 + 328) = *(void *)(a2 + 672);
  *(_DWORD *)(a2 + 336) = v9;
  *(void *)(a2 + 376) = uarpPlatformAssetAllMetaDataWindowFilled;
  *(void *)(a2 + 384) = uarpPlatformAssetAllMetaDataRequestCompleted;
  if (!v10) {
    goto LABEL_17;
  }
  return uarpPlatformAssetRequestData(a1, a2, a2 + 312);
}

uint64_t uarpPlatformAssetAllMetaDataWindowFilled(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(_DWORD *)(a2 + 32);
  int v4 = *(_DWORD *)(a3 + 88);
  if (*(_DWORD *)(a3 + 84) - v4 < v3) {
    return 18;
  }
  if (v3)
  {
    int v9 = *(unsigned int **)(a3 + 16);
    while (1)
    {
      int v10 = uarpProcessTLV(a1, v9);
      if (!v10) {
        return 10;
      }
      uint64_t v11 = (v10[1] + 8);
      int v9 = (unsigned int *)((char *)v9 + v11);
      *((void *)v10 + 2) = *(void *)(a2 + 720);
      *(void *)(a2 + 720) = v10;
      v3 -= v11;
      if (!v3)
      {
        int v12 = *(_DWORD *)(a2 + 32);
        int v4 = *(_DWORD *)(a3 + 88);
        goto LABEL_9;
      }
    }
  }
  else
  {
    int v12 = 0;
LABEL_9:
    unsigned int v13 = v4 + v12;
    *(_DWORD *)(a3 + 88) = v13;
    uint64_t v14 = *(void *)(a2 + 632);
    if (v14)
    {
      while (1)
      {
        unsigned int v15 = *(_DWORD *)(v14 + 28);
        if (*(_DWORD *)(a3 + 84) - v13 < v15) {
          return 18;
        }
        if (v15)
        {
          uint64_t v16 = (unsigned int *)(*(void *)(a3 + 16) + v13);
          while (1)
          {
            int v17 = uarpProcessTLV(a1, v16);
            if (!v17) {
              return 10;
            }
            uint64_t v18 = (v17[1] + 8);
            uint64_t v16 = (unsigned int *)((char *)v16 + v18);
            *((void *)v17 + 2) = *(void *)(v14 + 168);
            *(void *)(v14 + 168) = v17;
            v15 -= v18;
            if (!v15)
            {
              int v19 = *(_DWORD *)(v14 + 28);
              unsigned int v13 = *(_DWORD *)(a3 + 88);
              goto LABEL_17;
            }
          }
        }
        int v19 = 0;
LABEL_17:
        uint64_t result = 0;
        v13 += v19;
        *(_DWORD *)(a3 + 88) = v13;
        uint64_t v14 = *(void *)(v14 + 176);
        if (!v14) {
          return result;
        }
      }
    }
    return 0;
  }
}

uint64_t uarpPlatformAssetAllMetaDataRequestCompleted(uint64_t a1, uint64_t a2)
{
  return 0;
}

uint64_t uarpPlatformAssetPayloadDataRequestCompressedBlock(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = UARPLayer2DecompressBuffer(a1, *(unsigned __int16 *)(a3 + 45), *(void *)(a3 + 16), *(unsigned __int16 *)(a3 + 51), *(void *)(a3 + 32), *(unsigned __int16 *)(a3 + 53));
  if (v6)
  {
    uint64_t v7 = *(void (**)(void, uint64_t, const char *))(a1 + 400);
    if (v7) {
      v7(*(void *)(a1 + 544), 2, "Error decompressing buffer for payload");
    }
    else {
      uarpLogError(2u, "Error decompressing buffer for payload");
    }
    uarpPlatformAssetProcessingCompleteInternal(a1, *(void *)(a2 + 696), a2, 4u, 0, 0);
  }
  else
  {
    UARPLayer2HashUpdate(a1, *(unsigned int *)(a3 + 104), *(void *)(a3 + 112), *(void *)(a3 + 32), *(unsigned __int16 *)(a3 + 53));
    UARPLayer2PayloadData(a1, a2);
    int v8 = *(_DWORD *)(a3 + 24);
    *(_DWORD *)(a3 + 88) = v8;
    *(_DWORD *)(a2 + 508) += v8;
    *(unsigned char *)(a3 + 44) = 1;
    *(_DWORD *)(a3 + 24) = 10;
    *(void *)(a3 + 64) = uarpPlatformAssetPayloadDataRequestCompressionHeader;
  }
  return v6;
}

uint64_t UARPLayer2RequestBuffer(uint64_t a1, void *a2, unsigned int a3)
{
  int v4 = *(uint64_t (**)(uint64_t))(a1 + 48);
  if (v4)
  {
    uint64_t v5 = *(void *)(a1 + 544);
    return v4(v5);
  }
  else
  {
    uint64_t v7 = uarpZalloc(a3);
    *a2 = v7;
    if (v7) {
      return 0;
    }
    else {
      return 11;
    }
  }
}

void UARPLayer2ReturnBuffer(uint64_t a1, void *a2)
{
  long long v2 = *(void (**)(void, void *))(a1 + 56);
  if (v2) {
    v2(*(void *)(a1 + 544), a2);
  }
  else {
    uarpFree(a2);
  }
}

uint64_t UARPLayer2RequestTransmitMsgBuffer(uint64_t a1, uint64_t a2, void *a3, unsigned int *a4)
{
  size_t v5 = *a4;
  uint64_t v6 = *(uint64_t (**)(uint64_t, void *, size_t))(a1 + 48);
  if (v6)
  {
    uint64_t v7 = *(void *)(a1 + 544);
    return v6(v7, a3, v5);
  }
  else
  {
    int v9 = uarpZalloc(v5);
    *a3 = v9;
    if (v9) {
      return 0;
    }
    else {
      return 11;
    }
  }
}

void UARPLayer2ReturnTransmitMsgBuffer(uint64_t a1, int a2, void *a3)
{
  unsigned int v3 = *(void (**)(void, void *))(a1 + 56);
  if (v3) {
    v3(*(void *)(a1 + 544), a3);
  }
  else {
    uarpFree(a3);
  }
}

uint64_t UARPLayer2SendMessage(uint64_t a1, uint64_t a2, const void *a3, uint64_t a4)
{
  int v4 = *(uint64_t (**)(uint64_t, uint64_t, const void *, uint64_t, uint64_t))(a1 + 80);
  if (!v4) {
    return 14;
  }
  if (*(_WORD *)(a2 + 136))
  {
    uarpPlatformDownstreamEndpointSendMessageInternal(a1, *(void *)(a2 + 176), a2, a3, a4);
    uarpPlatformEndpointSendMessageComplete(a1, a2, (uint64_t)a3);
    return 0;
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 544);
    uint64_t v10 = *(void *)(a2 + 40);
    return v4(v9, v10, a3, a4, a4);
  }
}

uint64_t UARPLayer2DataTransferPause(uint64_t a1, uint64_t a2)
{
  long long v2 = *(uint64_t (**)(void, void))(a1 + 88);
  if (v2) {
    return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
  }
  else {
    return 14;
  }
}

uint64_t UARPLayer2DataTransferPauseAck(uint64_t a1, uint64_t a2)
{
  long long v2 = *(uint64_t (**)(void, void))(a1 + 96);
  if (v2) {
    return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
  }
  else {
    return 14;
  }
}

uint64_t UARPLayer2DataTransferResume(uint64_t a1, uint64_t a2)
{
  long long v2 = *(uint64_t (**)(void, void))(a1 + 104);
  if (v2) {
    return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
  }
  else {
    return 14;
  }
}

uint64_t UARPLayer2DataTransferResumeAck(uint64_t a1, uint64_t a2)
{
  long long v2 = *(uint64_t (**)(void, void))(a1 + 112);
  if (v2) {
    return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
  }
  else {
    return 14;
  }
}

uint64_t UARPLayer2SuperBinaryOffered(uint64_t result, uint64_t a2)
{
  long long v2 = *(uint64_t (**)(void, void))(result + 120);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2DynamicAssetOffered(uint64_t result, uint64_t a2)
{
  long long v2 = *(uint64_t (**)(void, void))(result + 128);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2ApplyStagedAssets(uint64_t a1, uint64_t a2)
{
  long long v2 = *(uint64_t (**)(void, void))(a1 + 136);
  if (v2) {
    return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
  }
  else {
    return 14;
  }
}

uint64_t UARPLayer2ApplyStagedAssetsResponse(uint64_t a1, uint64_t a2)
{
  long long v2 = *(uint64_t (**)(void, void))(a1 + 144);
  if (v2) {
    return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
  }
  else {
    return 14;
  }
}

uint64_t UARPLayer2ManufacturerName(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  unsigned int v3 = *(uint64_t (**)(uint64_t))(a1 + 152);
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 544);
    return v3(v4);
  }
  else
  {
    *a3 = uarpCopyDefaultInfoString(a2, *a3);
    return 0;
  }
}

uint64_t UARPLayer2ManufacturerNameResponse(uint64_t result, uint64_t a2)
{
  long long v2 = *(uint64_t (**)(void, void))(result + 160);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2ModelName(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  unsigned int v3 = *(uint64_t (**)(uint64_t))(a1 + 168);
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 544);
    return v3(v4);
  }
  else
  {
    *a3 = uarpCopyDefaultInfoString(a2, *a3);
    return 0;
  }
}

uint64_t UARPLayer2ModelNameResponse(uint64_t result, uint64_t a2)
{
  long long v2 = *(uint64_t (**)(void, void))(result + 176);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2SerialNumber(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  unsigned int v3 = *(uint64_t (**)(uint64_t))(a1 + 184);
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 544);
    return v3(v4);
  }
  else
  {
    *a3 = uarpCopyDefaultInfoString(a2, *a3);
    return 0;
  }
}

uint64_t UARPLayer2SerialNumberResponse(uint64_t result, uint64_t a2)
{
  long long v2 = *(uint64_t (**)(void, void))(result + 192);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2HardwareVersion(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  unsigned int v3 = *(uint64_t (**)(uint64_t))(a1 + 200);
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 544);
    return v3(v4);
  }
  else
  {
    *a3 = uarpCopyDefaultInfoString(a2, *a3);
    return 0;
  }
}

uint64_t UARPLayer2HardwareVersionResponse(uint64_t result, uint64_t a2)
{
  long long v2 = *(uint64_t (**)(void, void))(result + 208);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2ActiveFirmwareVersion2(void *a1, unsigned int *a2, void *a3)
{
  size_t v5 = (uint64_t (*)(uint64_t))a1[27];
  if (v5)
  {
    uint64_t v6 = a1[68];
    return v5(v6);
  }
  else
  {
    int v8 = (uint64_t (*)(uint64_t, unsigned int *, void *))a1[64];
    if (v8)
    {
      if (a2)
      {
        a2 = (unsigned int *)uarpPayloadTagPack(a2);
        int v8 = (uint64_t (*)(uint64_t, unsigned int *, void *))a1[64];
      }
      uint64_t v9 = a1[68];
      return v8(v9, a2, a3);
    }
    else
    {
      *a3 = -1;
      a3[1] = -1;
      return 0;
    }
  }
}

uint64_t UARPLayer2ActiveFirmwareVersionResponse(uint64_t result, uint64_t a2)
{
  long long v2 = *(uint64_t (**)(void, void))(result + 224);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2StagedFirmwareVersion2(void *a1, unsigned int *a2, void *a3)
{
  size_t v5 = (uint64_t (*)(uint64_t))a1[29];
  if (v5)
  {
    uint64_t v6 = a1[68];
    return v5(v6);
  }
  else
  {
    int v8 = (uint64_t (*)(uint64_t, unsigned int *, void *))a1[65];
    if (v8)
    {
      if (a2)
      {
        a2 = (unsigned int *)uarpPayloadTagPack(a2);
        int v8 = (uint64_t (*)(uint64_t, unsigned int *, void *))a1[65];
      }
      uint64_t v9 = a1[68];
      return v8(v9, a2, a3);
    }
    else
    {
      *a3 = -1;
      a3[1] = -1;
      return 0;
    }
  }
}

uint64_t UARPLayer2StagedFirmwareVersionResponse(uint64_t result, uint64_t a2)
{
  long long v2 = *(uint64_t (**)(void, void))(result + 240);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2LastError(uint64_t a1, void *a2)
{
  long long v2 = *(uint64_t (**)(void))(a1 + 248);
  if (v2) {
    return v2(*(void *)(a1 + 544));
  }
  *a2 = -1;
  return 0;
}

uint64_t UARPLayer2LastErrorResponse(uint64_t result, uint64_t a2)
{
  long long v2 = *(uint64_t (**)(void, void))(result + 256);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2StatisticsResponse(uint64_t result, uint64_t a2)
{
  long long v2 = *(uint64_t (**)(void, void))(result + 264);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2AssetSolicitation(uint64_t a1, uint64_t a2)
{
  long long v2 = *(uint64_t (**)(void, void))(a1 + 272);
  if (v2) {
    return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
  }
  else {
    return 14;
  }
}

uint64_t UARPLayer2RescindAllAssets(uint64_t result, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(uint64_t (**)(void, uint64_t, uint64_t))(result + 280);
  if (v3)
  {
    if (a2) {
      a2 = *(void *)(a2 + 40);
    }
    if (a3) {
      a3 = *(void *)(a3 + 704);
    }
    return v3(*(void *)(result + 544), a2, a3);
  }
  return result;
}

uint64_t UARPLayer2RescindAllAssetsAck(uint64_t result, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(uint64_t (**)(void, void, uint64_t))(result + 288);
  if (v3)
  {
    if (a3) {
      a3 = *(void *)(a3 + 704);
    }
    return v3(*(void *)(result + 544), *(void *)(a2 + 40), a3);
  }
  return result;
}

uint64_t UARPLayer2WatchdogSet(uint64_t a1, uint64_t a2)
{
  long long v2 = *(uint64_t (**)(void, void))(a1 + 296);
  if (!v2) {
    return 14;
  }
  *(unsigned char *)(a2 + 50) = 1;
  return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
}

uint64_t UARPLayer2WatchdogCancel(uint64_t a1, uint64_t a2)
{
  long long v2 = *(uint64_t (**)(void, void))(a1 + 304);
  if (!v2) {
    return 14;
  }
  *(unsigned char *)(a2 + 50) = 0;
  return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
}

uint64_t UARPLayer2ProtocolVersion(uint64_t result, uint64_t a2)
{
  long long v2 = *(uint64_t (**)(void, void))(result + 312);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2FriendlyName(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  unsigned int v3 = *(uint64_t (**)(uint64_t))(a1 + 320);
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 544);
    return v3(v4);
  }
  else
  {
    *a3 = uarpCopyDefaultInfoString(a2, *a3);
    return 0;
  }
}

uint64_t UARPLayer2FriendlyNameResponse(uint64_t result, uint64_t a2)
{
  long long v2 = *(uint64_t (**)(void, void))(result + 328);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2DecompressBuffer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 336);
  if (v6) {
    return v6(a2, a3, a4, a5, a6);
  }
  else {
    return 14;
  }
}

uint64_t UARPLayer2CompressBuffer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 344);
  if (v6) {
    return v6(a2, a3, a4, a5, a6);
  }
  else {
    return 14;
  }
}

uint64_t UARPLayer2HashInfo(uint64_t result, uint64_t a2, _DWORD *a3, _DWORD *a4)
{
  uint64_t v4 = *(uint64_t (**)(uint64_t, _DWORD *, _DWORD *))(result + 352);
  if (v4) {
    return v4(a2, a3, a4);
  }
  *a3 = 0;
  *a4 = 0;
  return result;
}

uint64_t UARPLayer2HashInit(uint64_t result, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(uint64_t (**)(uint64_t, uint64_t))(result + 360);
  if (v3) {
    return v3(a2, a3);
  }
  return result;
}

uint64_t UARPLayer2HashUpdate(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  size_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(result + 368);
  if (v5) {
    return v5(a2, a3, a4, a5);
  }
  return result;
}

uint64_t UARPLayer2HashFinal(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  size_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(result + 376);
  if (v5) {
    return v5(a2, a3, a4, a5);
  }
  return result;
}

uint64_t UARPLayer2HashLog(uint64_t result, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(uint64_t (**)(uint64_t, uint64_t))(result + 384);
  if (v3) {
    return v3(a2, a3);
  }
  return result;
}

uint64_t UARPLayer2LogPacket(uint64_t result, uint64_t a2)
{
  long long v2 = *(uint64_t (**)(void, void))(result + 392);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t fUarpLayer3DownstreamEndpointDiscovery(uint64_t a1, uint64_t a2)
{
  long long v2 = *(uint64_t (**)(void, void))(a1 + 432);
  if (v2) {
    return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
  }
  else {
    return 14;
  }
}

uint64_t fUarpLayer3DownstreamEndpointReachable(uint64_t a1, uint64_t a2)
{
  long long v2 = *(uint64_t (**)(void, void))(a1 + 440);
  if (v2) {
    return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
  }
  else {
    return 14;
  }
}

uint64_t fUarpLayer3DownstreamEndpointUnreachable(uint64_t a1, uint64_t a2)
{
  long long v2 = *(uint64_t (**)(void, void))(a1 + 448);
  if (v2) {
    return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
  }
  else {
    return 14;
  }
}

uint64_t fUarpLayer3DownstreamEndpointReleased(uint64_t result, uint64_t a2)
{
  long long v2 = *(uint64_t (**)(void, void))(result + 456);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t fUarpLayer3DownstreamEndpointRecvMessage(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(uint64_t (**)(void, void, void))(a1 + 464);
  if (v3) {
    return v3(*(void *)(a1 + 544), *(void *)(a2 + 40), *(void *)(a3 + 40));
  }
  else {
    return 14;
  }
}

uint64_t fUarpLayer3NoFirmwareUpdateAvailable(uint64_t result, uint64_t a2)
{
  long long v2 = *(uint64_t (**)(void, void))(result + 472);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2VendorSpecificRecvMessage(void *a1, uint64_t a2)
{
  long long v2 = (uint64_t (*)(void, void))a1[60];
  if (v2) {
    return v2(a1[68], *(void *)(a2 + 40));
  }
  uint64_t v4 = (uint64_t (*)(void))a1[74];
  if (v4) {
    return v4();
  }
  else {
    return 14;
  }
}

uint64_t UARPLayer2VendorSpecificCheckExpectedResponse(uint64_t a1, uint64_t a2)
{
  long long v2 = *(uint64_t (**)(void, void))(a1 + 488);
  if (v2) {
    return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
  }
  else {
    return 1;
  }
}

uint64_t UARPLayer2VendorSpecificCheckValidToSend(uint64_t a1, uint64_t a2)
{
  long long v2 = *(uint64_t (**)(void, void))(a1 + 496);
  if (v2) {
    return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
  }
  else {
    return 1;
  }
}

uint64_t UARPLayer2VendorSpecificExceededRetries(uint64_t result, uint64_t a2)
{
  long long v2 = *(uint64_t (**)(void, void))(result + 504);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2AssetReady(uint64_t result, uint64_t a2)
{
  long long v2 = *(uint64_t (**)(void, void))(a2 + 80);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 704));
  }
  return result;
}

uint64_t UARPLayer2AssetMetaDataTLV(uint64_t result, uint64_t a2)
{
  long long v2 = *(uint64_t (**)(void, void))(a2 + 88);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 704));
  }
  return result;
}

uint64_t UARPLayer2AssetMetaDataComplete(uint64_t result, uint64_t a2)
{
  long long v2 = *(uint64_t (**)(void, void))(a2 + 96);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 704));
  }
  return result;
}

uint64_t UARPLayer2AssetMetaDataProcessingError(uint64_t result, uint64_t a2)
{
  long long v2 = *(uint64_t (**)(void, void))(a2 + 104);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 704));
  }
  return result;
}

uint64_t UARPLayer2PayloadReady(uint64_t result, uint64_t a2)
{
  long long v2 = *(uint64_t (**)(void, void))(a2 + 112);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 704));
  }
  return result;
}

void *UARPLayer2PayloadMetaDataTLV(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int *a5)
{
  uint64_t result = uarpProcessPayloadTLVInternal(a1, a2, a2 + 464, a3, a4, a5);
  uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))(a2 + 120);
  if (v11)
  {
    uint64_t v12 = a1[68];
    uint64_t v13 = *(void *)(a2 + 704);
    return (void *)v11(v12, v13, a3, a4, a5);
  }
  return result;
}

uint64_t UARPLayer2PayloadMetaDataComplete(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(unsigned int *)(a2 + 540);
  if (!result) {
    goto LABEL_5;
  }
  size_t v5 = *(void (**)(void))(a1 + 376);
  if (v5) {
    v5();
  }
  uint64_t result = uarpPlatformCompareHash(a1, *(void **)(a2 + 560), *(unsigned int *)(a2 + 568), *(void **)(a2 + 576), *(_DWORD *)(a2 + 584));
  if (!result)
  {
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(a2 + 200);
    if (!v6) {
      return result;
    }
  }
  else
  {
LABEL_5:
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(a2 + 128);
    if (!v6) {
      return result;
    }
  }
  uint64_t v7 = *(void *)(a1 + 544);
  uint64_t v8 = *(void *)(a2 + 704);
  return v6(v7, v8);
}

uint64_t UARPLayer2AssetCorrupt(uint64_t result, uint64_t a2)
{
  long long v2 = *(uint64_t (**)(void, void))(a2 + 200);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 704));
  }
  return result;
}

uint64_t UARPLayer2PayloadMetaDataProcessingError(uint64_t result, uint64_t a2)
{
  long long v2 = *(uint64_t (**)(void, void))(a2 + 136);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 704));
  }
  return result;
}

uint64_t UARPLayer2PayloadData(uint64_t result, uint64_t a2)
{
  long long v2 = *(uint64_t (**)(void, void))(a2 + 144);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 704));
  }
  return result;
}

uint64_t UARPLayer2PayloadDataComplete(uint64_t result, uint64_t a2)
{
  long long v2 = *(uint64_t (**)(void, void))(a2 + 152);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 704));
  }
  return result;
}

uint64_t UARPLayer2PayloadDataComplete2(uint64_t result, void *a2)
{
  long long v2 = (uint64_t (*)(void, void))a2[20];
  if (v2) {
    return v2(*(void *)(result + 544), a2[88]);
  }
  unsigned int v3 = (uint64_t (*)(void, void))a2[19];
  if (v3) {
    return v3(*(void *)(result + 544), a2[88]);
  }
  return result;
}

uint64_t UARPLayer2AssetGetBytesAtOffset2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (a2) {
    a2 = *(void *)(a2 + 40);
  }
  uint64_t v7 = (uint64_t (*)(void, uint64_t, void))a3[21];
  if (v7) {
    return v7(*(void *)(a1 + 544), a2, a3[88]);
  }
  uint64_t v9 = (uint64_t (*)(void, void, uint64_t, uint64_t, uint64_t, uint64_t))a3[34];
  if (v9) {
    return v9(*(void *)(a1 + 544), a3[88], a4, a5, a6, a7);
  }
  else {
    return 14;
  }
}

uint64_t UARPLayer2AssetSetBytesAtOffset2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a2) {
    a2 = *(void *)(a2 + 40);
  }
  uint64_t v6 = (uint64_t (*)(void, uint64_t, void))a3[22];
  if (v6) {
    return v6(*(void *)(a1 + 544), a2, a3[88]);
  }
  uint64_t v8 = (uint64_t (*)(void, void, uint64_t, uint64_t, uint64_t))a3[35];
  if (v8) {
    return v8(*(void *)(a1 + 544), a3[88], a4, a5, a6);
  }
  else {
    return 14;
  }
}

uint64_t UARPLayer2AssetRescinded(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a2) {
    a2 = *(void *)(a2 + 40);
  }
  unsigned int v3 = *(uint64_t (**)(void, uint64_t, void))(a3 + 184);
  if (v3) {
    return v3(*(void *)(result + 544), a2, *(void *)(a3 + 704));
  }
  return result;
}

uint64_t UARPLayer2AssetRescindedAck(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a2) {
    a2 = *(void *)(a2 + 40);
  }
  unsigned int v3 = *(uint64_t (**)(void, uint64_t, void))(a3 + 192);
  if (v3) {
    return v3(*(void *)(result + 544), a2, *(void *)(a3 + 704));
  }
  return result;
}

uint64_t UARPLayer2AssetOrphaned(uint64_t result, uint64_t a2)
{
  long long v2 = *(uint64_t (**)(void, void))(a2 + 208);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 704));
  }
  return result;
}

uint64_t UARPLayer2AssetReleased2(uint64_t result, uint64_t a2, void *a3)
{
  if (a2) {
    a2 = *(void *)(a2 + 40);
  }
  unsigned int v3 = (uint64_t (*)(void, uint64_t, void))a3[27];
  if (v3) {
    return v3(*(void *)(result + 544), a2, a3[88]);
  }
  uint64_t v4 = (uint64_t (*)(void, void))a3[36];
  if (v4) {
    return v4(*(void *)(result + 544), a3[88]);
  }
  return result;
}

uint64_t UARPLayer2AssetProcessingNotification2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v4 = (uint64_t (*)(void, void, void))a3[28];
  if (v4) {
    return v4(*(void *)(a1 + 544), *(void *)(a2 + 40), a3[88]);
  }
  uint64_t v6 = (uint64_t (*)(void, void, uint64_t))a3[37];
  if (v6) {
    return v6(*(void *)(a1 + 544), a3[88], a4);
  }
  else {
    return 14;
  }
}

uint64_t UARPLayer2AssetProcessingNotificationAck(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(uint64_t (**)(void, void, void))(a3 + 232);
  if (v3) {
    return v3(*(void *)(a1 + 544), *(void *)(a2 + 40), *(void *)(a3 + 704));
  }
  else {
    return 14;
  }
}

uint64_t UARPLayer2AssetPreProcessingNotification(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(uint64_t (**)(void, void, void))(a3 + 240);
  if (v3) {
    return v3(*(void *)(a1 + 544), *(void *)(a2 + 40), *(void *)(a3 + 704));
  }
  else {
    return 14;
  }
}

uint64_t UARPLayer2AssetPreProcessingNotificationAck(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(uint64_t (**)(void, void, void))(a3 + 248);
  if (v3) {
    return v3(*(void *)(a1 + 544), *(void *)(a2 + 40), *(void *)(a3 + 704));
  }
  else {
    return 14;
  }
}

uint64_t UARPLayer2AssetAllHeadersAndMetaDataComplete(uint64_t result, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(uint64_t (**)(void, void, void))(a3 + 256);
  if (v3) {
    return v3(*(void *)(result + 544), *(void *)(a2 + 40), *(void *)(a3 + 704));
  }
  return result;
}

uint64_t UARPLayer2AssetStore(uint64_t result, uint64_t a2)
{
  long long v2 = *(uint64_t (**)(void, void))(a2 + 264);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 704));
  }
  return result;
}

char *uarpAssetTagVoiceAssist4cc()
{
  uint64_t result = uarpAssetTagVoiceAssist4cc_assetTag;
  uarpAssetTagVoiceAssist4cc_assetTag[4] = 0;
  return result;
}

uint64_t uarpAssetTagVoiceAssist()
{
  uarpAssetTagVoiceAssist4cc_assetTag[4] = 0;
  return uarpPayloadTagPack((unsigned int *)uarpAssetTagVoiceAssist4cc_assetTag);
}

int *uarpAssetTagStructVoiceAssist()
{
  uarpAssetTagVoiceAssist4cc_assetTag[4] = 0;
  uint64_t result = &uarpAssetTagStructVoiceAssist_myTag;
  uarpAssetTagStructVoiceAssist_myTag = *(_DWORD *)uarpAssetTagVoiceAssist4cc_assetTag;
  return result;
}

__int16 *uarpOuiVoiceAssist()
{
  uint64_t result = &uarpOuiVoiceAssist_myOui;
  uarpOuiVoiceAssist_myOuuint64_t i = -30716;
  byte_267D27CB2 = -30;
  return result;
}

uint64_t uarpPlatformEndpointQueryActiveFirmwareVersion(void *a1, uint64_t a2, void *a3)
{
  unsigned int v4 = 0;
  if (a2) {
    unsigned int v4 = *(_DWORD *)(a2 + 48);
  }
  return UARPLayer2ActiveFirmwareVersion2(a1, &v4, a3);
}

uint64_t uarpPlatformEndpointQueryStagedFirmwareVersion(void *a1, uint64_t a2, void *a3)
{
  unsigned int v4 = 0;
  if (a2) {
    unsigned int v4 = *(_DWORD *)(a2 + 48);
  }
  return UARPLayer2StagedFirmwareVersion2(a1, &v4, a3);
}

uint64_t uarpPlatformAssetFindByAssetID(uint64_t a1, uint64_t a2, int a3, int a4)
{
  for (uint64_t result = *(void *)(a1 + 568); result; uint64_t result = *(void *)(result + 712))
  {
    if (*(_DWORD *)(result + 304) == a3 && *(void *)(result + 696) == a2 && *(unsigned __int16 *)(result + 44) == a4) {
      break;
    }
  }
  return result;
}

uint64_t uarpPlatformAssetFindByTag(uint64_t a1, uint64_t a2, int a3, unsigned __int8 *a4)
{
  for (uint64_t i = *(void *)(a1 + 568); i; uint64_t i = *(void *)(i + 712))
  {
    if (*(_DWORD *)(i + 304) == a3 && *(void *)(i + 696) == a2 && uarp4ccCompare((unsigned __int8 *)(i + 48), a4)) {
      break;
    }
  }
  return i;
}

void uarpPlatformCleanupAssetsForRemoteEndpoint(uint64_t a1, uint64_t a2, int a3)
{
  if (*(unsigned char *)(a1 + 580) != 1)
  {
    uint64_t v4 = *(void *)(a1 + 568);
    for (*(void *)(a1 + 568) = 0; v4; *(void *)(a1 + 568) = v7)
    {
      while (1)
      {
        uint64_t v7 = v4;
        uint64_t v4 = *(void *)(v4 + 712);
        *(void *)(v7 + 712) = 0;
        uint64_t v8 = *(void *)(v7 + 696);
        BOOL v9 = v8 == a2 || a2 == 0;
        if (!v9 && v8 != 0) {
          break;
        }
        if (a3 == 1)
        {
          if (*(_WORD *)(v7 + 46))
          {
            *(void *)(v7 + 696) = 0;
            UARPLayer2AssetOrphaned(a1, v7);
          }
          else
          {
            *(unsigned char *)(v7 + 72) = 1;
          }
        }
        if (*(unsigned char *)(v7 + 72) != 1) {
          break;
        }
        UARPLayer2AssetReleased2(a1, a2, (void *)v7);
        *(void *)(v7 + 704) = 0;
        uarpPlatformAssetCleanup(a1, v7);
        if (!v4) {
          return;
        }
      }
      *(void *)(v7 + 712) = *(void *)(a1 + 568);
    }
  }
}

uint64_t uarpPlatformAssetOrphan(uint64_t result, uint64_t a2)
{
  *(void *)(a2 + 696) = 0;
  return UARPLayer2AssetOrphaned(result, a2);
}

uint64_t uarpPlatformAssetRelease(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = UARPLayer2AssetReleased2(a1, a2, a3);
  a3[88] = 0;
  return result;
}

void uarpPlatformAssetCleanup(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a2 + 640);
  if (v4 && !*(unsigned char *)(a2 + 652)) {
    UARPLayer2ReturnBuffer(a1, v4);
  }
  *(void *)(a2 + 640) = 0;
  *(_DWORD *)(a2 + 648) = 0;
  size_t v5 = *(void **)(a2 + 656);
  if (v5 && !*(unsigned char *)(a2 + 668)) {
    UARPLayer2ReturnBuffer(a1, v5);
  }
  *(void *)(a2 + 656) = 0;
  *(_DWORD *)(a2 + 664) = 0;
  uint64_t v6 = *(void **)(a2 + 672);
  if (v6)
  {
    UARPLayer2ReturnBuffer(a1, v6);
    *(void *)(a2 + 672) = 0;
  }
  *(_DWORD *)(a2 + 680) = 0;
  uint64_t v7 = *(void **)(a2 + 720);
  if (v7)
  {
    do
    {
      uint64_t v8 = (void *)v7[2];
      v7[2] = 0;
      UARPLayer2ReturnBuffer(a1, v7);
      uint64_t v7 = v8;
    }
    while (v8);
  }
  *(void *)(a2 + 720) = 0;
  BOOL v9 = *(void **)(a2 + 632);
  if (v9)
  {
    do
    {
      uint64_t v10 = (void *)v9[21];
      uint64_t v11 = (void *)v9[22];
      if (v10)
      {
        do
        {
          uint64_t v12 = (void *)v10[2];
          void v10[2] = 0;
          UARPLayer2ReturnBuffer(a1, v10);
          uint64_t v10 = v12;
        }
        while (v12);
      }
      v9[21] = 0;
      uarpPlatformPayloadCleanup(a1, (uint64_t)v9);
      UARPLayer2ReturnBuffer(a1, v9);
      BOOL v9 = v11;
    }
    while (v11);
  }
  uarpPlatformPayloadCleanup(a1, a2 + 464);
  UARPLayer2ReturnBuffer(a1, (void *)a2);
}

uint64_t uarpPlatformAssetIsKnown(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 568);
  if (!v3) {
    return 0;
  }
  while (v3 != a3)
  {
    uint64_t v3 = *(void *)(v3 + 712);
    if (!v3) {
      return 0;
    }
  }
  return 1;
}

void uarpPlatformPrepareAsset(uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4, uint64_t a5, int a6)
{
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        uint64_t v16 = 0;
        if (!UARPLayer2RequestBuffer(a1, &v16, 0x2D8u))
        {
          uint64_t v12 = v16;
          if (v16)
          {
            *(void *)(v16 + 704) = a3;
            *(void *)(v12 + 696) = a2;
            uarpPlatformEndpointAssetSetCallbacks(a1, v12, a5);
            if (!v13)
            {
              uint64_t v14 = v16;
              if (a6 == 1)
              {
                *(_DWORD *)(v16 + 304) = 1;
                int v15 = *(_DWORD *)(a1 + 576);
                if (v15 == 65534) {
                  int v15 = 1;
                }
                *(_DWORD *)(a1 + 576) = v15 + 1;
              }
              else
              {
                LOWORD(v15) = 0;
                *(_DWORD *)(v16 + 304) = 0;
              }
              *(_WORD *)(v14 + 44) = v15;
              *(void *)(v14 + 712) = *(void *)(a1 + 568);
              *(void *)(a1 + 568) = v14;
              if (a4)
              {
                *(_WORD *)(v14 + 46) = 2;
                *(_DWORD *)(v14 + 48) = *a4;
              }
              else
              {
                *(_WORD *)(v14 + 46) = 1;
              }
            }
          }
        }
      }
    }
  }
}

void uarpPlatformPayloadCleanup(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a2 + 80);
  if (v4)
  {
    UARPLayer2ReturnBuffer(a1, v4);
    *(void *)(a2 + 80) = 0;
    *(_DWORD *)(a2 + 88) = 0;
  }
  size_t v5 = *(void **)(a2 + 96);
  if (v5)
  {
    UARPLayer2ReturnBuffer(a1, v5);
    *(void *)(a2 + 96) = 0;
    *(_DWORD *)(a2 + 104) = 0;
  }
  uint64_t v6 = *(void **)(a2 + 112);
  if (v6)
  {
    UARPLayer2ReturnBuffer(a1, v6);
    *(void *)(a2 + 112) = 0;
    *(_DWORD *)(a2 + 120) = 0;
  }
  uint64_t v7 = *(void **)(a2 + 64);
  if (v7)
  {
    UARPLayer2ReturnBuffer(a1, v7);
    *(void *)(a2 + 64) = 0;
    *(_DWORD *)(a2 + 72) = 0;
  }
  uint64_t v8 = *(void **)(a2 + 152);
  if (v8)
  {
    UARPLayer2ReturnBuffer(a1, v8);
    *(void *)(a2 + 152) = 0;
    *(_DWORD *)(a2 + 160) = 0;
  }
  BOOL v9 = *(void **)(a2 + 136);
  if (v9)
  {
    UARPLayer2ReturnBuffer(a1, v9);
    *(void *)(a2 + 136) = 0;
    *(_DWORD *)(a2 + 144) = 0;
  }
}

uint64_t uarpPlatformEndpointAssetStore(uint64_t result, uint64_t a2, unsigned int a3)
{
  if (a3 <= 4) {
    return UARPLayer2AssetStore(result, a2);
  }
  return result;
}

uint64_t uarpPlatformAssetRescind(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result)
  {
    uint64_t v5 = result;
    if (a3)
    {
      uarpTransmitQueueAssetRescinded(result, a2, a3);
      *(unsigned char *)(a3 + 392) = 0;
      *(unsigned char *)(a3 + 72) = 1;
      return UARPLayer2AssetRescinded(v5, a2, a3);
    }
    else
    {
      return UARPLayer2RescindAllAssets(result, a2, 0);
    }
  }
  return result;
}

uint64_t uarpPlatformReOfferFirmware(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 568);
  if (v2)
  {
    uint64_t v4 = result;
    do
    {
      if (*(_DWORD *)(v2 + 304) == 1 && *(void *)(v2 + 696) == a2 && (*(_WORD *)(v2 + 46) & 2) == 0) {
        uint64_t result = uarpPlatformEndpointOfferAsset(v4, a2, *(void *)(v2 + 704));
      }
      uint64_t v2 = *(void *)(v2 + 712);
    }
    while (v2);
  }
  return result;
}

uint64_t uarpCallbackUpdateInformationTLV(void *a1, uint64_t a2, _DWORD *a3)
{
  int v5 = *a3;
  unsigned int v6 = a3[1];
  unsigned int v9 = v6;
  if (v5 != 7)
  {
    uint64_t result = uarpPlatformQueryAccessoryInfo(a1, v5, a3 + 2, v6, &v9);
    if (result) {
      return result;
    }
    unsigned int v7 = v9;
    goto LABEL_6;
  }
  if (v6 >= 0x10)
  {
    a3[2] = uarpHtonl(*(_DWORD *)(a2 + 62));
    a3[3] = uarpHtonl(*(_DWORD *)(a2 + 66));
    a3[4] = uarpHtonl(*(_DWORD *)(a2 + 70));
    a3[5] = uarpHtonl(*(_DWORD *)(a2 + 74));
    unsigned int v7 = 16;
LABEL_6:
    uint64_t result = 0;
    a3[1] = v7;
    return result;
  }
  return 39;
}

uint64_t uarpPlatformQueryAccessoryInfo(void *a1, int a2, unsigned int *a3, unsigned int a4, unsigned int *a5)
{
  *a5 = a4;
  switch(a2)
  {
    case 1:
      return UARPLayer2ManufacturerName((uint64_t)a1, a3, a5);
    case 2:
      return UARPLayer2ModelName((uint64_t)a1, a3, a5);
    case 3:
      return UARPLayer2SerialNumber((uint64_t)a1, a3, a5);
    case 4:
      return UARPLayer2HardwareVersion((uint64_t)a1, a3, a5);
    case 9:
      return UARPLayer2FriendlyName((uint64_t)a1, a3, a5);
    default:
      if ((a2 - 5) > 1)
      {
        if (a2 != 8)
        {
          *a5 = 0;
          return 28;
        }
        *a5 = 8;
        if (a4 >= 8)
        {
          uint64_t Error = UARPLayer2LastError((uint64_t)a1, a3);
          *a3 = uarpHtonl(*a3);
          a3[1] = uarpHtonl(a3[1]);
          return Error;
        }
      }
      else
      {
        *a5 = 16;
        if (a4 >= 0x10)
        {
          if (a2 == 5)
          {
            unsigned int v9 = 0;
            uint64_t active = UARPLayer2ActiveFirmwareVersion2(a1, &v9, a3);
          }
          else
          {
            unsigned int v10 = 0;
            uint64_t active = UARPLayer2StagedFirmwareVersion2(a1, &v10, a3);
          }
          uint64_t Error = active;
          *a3 = uarpHtonl(*a3);
          a3[1] = uarpHtonl(a3[1]);
          a3[2] = uarpHtonl(a3[2]);
          a3[3] = uarpHtonl(a3[3]);
          return Error;
        }
      }
      return 39;
  }
}

uint64_t uarpPlatformResponseAccessoryInfo(uint64_t result, uint64_t a2, uint64_t a3, int a4, unsigned int a5, unsigned int *a6)
{
  uint64_t v8 = result;
  switch(a4)
  {
    case 1:
      uint64_t result = UARPLayer2ManufacturerNameResponse(result, a2);
      break;
    case 2:
      uint64_t result = UARPLayer2ModelNameResponse(result, a2);
      break;
    case 3:
      uint64_t result = UARPLayer2SerialNumberResponse(result, a2);
      break;
    case 4:
      uint64_t result = UARPLayer2HardwareVersionResponse(result, a2);
      break;
    case 5:
      if (a5 >= 0x10)
      {
        uarpVersionEndianSwap(a6, a6);
        uint64_t result = UARPLayer2ActiveFirmwareVersionResponse(v8, a2);
        *(_OWORD *)(a2 + 138) = *(_OWORD *)a6;
      }
      break;
    case 6:
      if (a5 >= 0x10)
      {
        uarpVersionEndianSwap(a6, a6);
        uint64_t result = UARPLayer2StagedFirmwareVersionResponse(v8, a2);
        *(_OWORD *)(a2 + 154) = *(_OWORD *)a6;
      }
      break;
    case 7:
      if (a5 >= 0x10)
      {
        *a6 = uarpHtonl(*a6);
        a6[1] = uarpHtonl(a6[1]);
        a6[2] = uarpHtonl(a6[2]);
        a6[3] = uarpHtonl(a6[3]);
        uint64_t result = UARPLayer2StatisticsResponse(v8, a2);
      }
      break;
    case 8:
      if (a5 >= 8)
      {
        *a6 = uarpHtonl(*a6);
        a6[1] = uarpHtonl(a6[1]);
        uint64_t result = UARPLayer2LastErrorResponse(v8, a2);
      }
      break;
    case 9:
      uint64_t result = UARPLayer2FriendlyNameResponse(result, a2);
      break;
    default:
      return result;
  }
  return result;
}

uint64_t uarpPlatformAssetDataRequest(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5, void *__dst, unsigned __int16 *a7)
{
  uint64_t v8 = *(void *)(a1 + 568);
  if (!v8) {
    return 17;
  }
  while (*(_DWORD *)(v8 + 304) != 1 || *(void *)(v8 + 696) != a2 || *(unsigned __int16 *)(v8 + 44) != a3)
  {
    uint64_t v8 = *(void *)(v8 + 712);
    if (!v8) {
      return 17;
    }
  }
  unsigned int v10 = *(_DWORD *)(v8 + 68);
  if (v10 < a4 + (int)a5) {
    unsigned __int16 v11 = v10 - a5;
  }
  else {
    unsigned __int16 v11 = a4;
  }
  if (v10 >= a5) {
    unsigned __int16 v12 = v11;
  }
  else {
    unsigned __int16 v12 = 0;
  }
  return uarpPlatformEndpointAssetGetBytesAtOffset(a1, a2, v8, __dst, v12, a5, a7);
}

uint64_t uarpPlatformDataTransferResume(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 568);
  if (v4)
  {
    while (1)
    {
      if (!*(_DWORD *)(v4 + 304) && *(void *)(v4 + 696) == a2)
      {
        uint64_t result = uarpPlatformAssetRequestData(a1, v4, v4 + 312);
        if (result) {
          break;
        }
      }
      uint64_t v4 = *(void *)(v4 + 712);
      if (!v4) {
        goto LABEL_6;
      }
    }
  }
  else
  {
LABEL_6:
    return UARPLayer2DataTransferResume(a1, a2);
  }
  return result;
}

uint64_t uarpPlatformAssetRescinded(uint64_t result, uint64_t a2, int a3)
{
  uint64_t v4 = *(void *)(result + 568);
  if (a3 == 0xFFFF)
  {
    if (!v4) {
      return uarpPlatformAssetRescind(result, a2, v4);
    }
    uint64_t v5 = *(void *)(result + 568);
    do
    {
      if (!*(_DWORD *)(v5 + 304) && *(void *)(v5 + 696) == a2) {
        *(unsigned char *)(v5 + 72) = 1;
      }
      uint64_t v5 = *(void *)(v5 + 712);
    }
    while (v5);
  }
  if (v4)
  {
    while (*(_DWORD *)(v4 + 304) || *(void *)(v4 + 696) != a2 || *(unsigned __int16 *)(v4 + 44) != a3)
    {
      uint64_t v4 = *(void *)(v4 + 712);
      if (!v4) {
        goto LABEL_13;
      }
    }
  }
  else
  {
LABEL_13:
    if (a3 != 0xFFFF) {
      return result;
    }
    uint64_t v4 = 0;
  }
  return uarpPlatformAssetRescind(result, a2, v4);
}

uint64_t uarpAssetProcessingComplete(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  if (a2)
  {
    uint64_t v8 = uarpAllocPrepareTransmitBuffer2(a1, a2, 9u, 0xAu, 1);
    if (v8)
    {
      uint64_t v9 = (uint64_t)v8;
      uint64_t v10 = v8[2];
      *(_WORD *)(v10 + 6) = uarpHtons(*(unsigned __int16 *)(a3 + 44));
      *(_WORD *)(v10 + 8) = uarpHtons(a4);
      return uarpTransmitBuffer2(a1, a2, v9);
    }
    else
    {
      return 11;
    }
  }
  else if (a4 == 3)
  {
    return 0;
  }
  else
  {
    return 13;
  }
}

uint64_t uarpOfferAssetToRemoteEP(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v6 = uarpAllocPrepareTransmitBuffer2(a1, a2, 5u, 0x24u, 1);
  if (!v6) {
    return 11;
  }
  uint64_t v7 = (uint64_t)v6;
  uint64_t v8 = v6[2];
  *(_DWORD *)(v8 + 6) = uarpPayloadTagPack((unsigned int *)(a3 + 48));
  *(_WORD *)(v8 + 10) = uarpHtons(*(unsigned __int16 *)(a3 + 46));
  *(_WORD *)(v8 + 12) = uarpHtons(*(unsigned __int16 *)(a3 + 44));
  uarpVersionEndianSwap((unsigned int *)(a3 + 52), (_DWORD *)(v8 + 14));
  *(_DWORD *)(v8 + 30) = uarpHtonl(*(_DWORD *)(a3 + 68));
  *(_WORD *)(v8 + 34) = uarpHtons(*(unsigned __int16 *)(a3 + 448));
  return uarpTransmitBuffer2(a1, a2, v7);
}

uint64_t uarpAssetRescind(uint64_t a1, uint64_t a2, unsigned int a3)
{
  unsigned int v6 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0xCu, 8u, 1);
  if (!v6) {
    return 11;
  }
  uint64_t v7 = (uint64_t)v6;
  uint64_t v8 = v6[2];
  *(_WORD *)(v8 + 6) = uarpHtons(a3);
  return uarpTransmitBuffer2(a1, a2, v7);
}

uint64_t uarpSolicitDynamicAsset(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  unsigned int v6 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x11u, 0xAu, 1);
  if (!v6) {
    return 11;
  }
  *(_DWORD *)(v6[2] + 6) = *a3;
  return uarpTransmitBuffer2(a1, a2, (uint64_t)v6);
}

uint64_t uarpPlatformFindPreparedAsset(uint64_t a1, uint64_t a2, uint64_t a3, char a4, unsigned __int8 *a5)
{
  if ((a4 & 2) == 0) {
    return 0;
  }
  for (uint64_t result = *(void *)(a1 + 568); result; uint64_t result = *(void *)(result + 712))
  {
    if (!*(_DWORD *)(result + 304)
      && *(void *)(result + 696) == a2
      && !*(_WORD *)(result + 44)
      && *(unsigned __int8 *)(result + 48) == *a5
      && *(unsigned __int8 *)(result + 49) == a5[1]
      && *(unsigned __int8 *)(result + 50) == a5[2]
      && *(unsigned __int8 *)(result + 51) == a5[3])
    {
      break;
    }
  }
  return result;
}

uint64_t uarpPlatformCreateRxAsset(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = 0;
  int v4 = UARPLayer2RequestBuffer(a1, &v6, 0x2D8u);
  uint64_t result = 0;
  if (!v4)
  {
    uint64_t result = v6;
    if (v6)
    {
      *(void *)(v6 + 696) = a2;
      *(_DWORD *)(result + 304) = 0;
      *(void *)(result + 712) = *(void *)(a1 + 568);
      *(void *)(a1 + 568) = result;
    }
  }
  return result;
}

BOOL uarpPlatformCompareHash(uint64_t a1, void *__s1, size_t __n, void *__s2, int a5)
{
  if (!*(void *)(a1 + 376)) {
    return 1;
  }
  if (__n == a5) {
    return memcmp(__s1, __s2, __n) == 0;
  }
  return 0;
}

uint64_t uarpAssetQueueSolicitation(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  if (!*(void *)(a2 + 80)) {
    return 1;
  }
  if (!*(_WORD *)(a2 + 28)) {
    return 2;
  }
  uint64_t v5 = 0;
  unint64_t v6 = 0;
  while (uarpAssetTagIsValid((unsigned char *)(*(void *)(a2 + 80) + v5)))
  {
    ++v6;
    v5 += 4;
    if (v6 >= *(unsigned __int16 *)(a2 + 28)) {
      return 2;
    }
  }
  *(_DWORD *)(*(void *)(a2 + 80) + 4 * v6) = *a3;
  return v6 == 0;
}

uint64_t uarpPlatformEndpointSendMessageCompleteInternal(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result)
  {
    if (a2)
    {
      if (a3)
      {
        uint64_t v3 = *(unsigned __int16 *)(a2 + 112);
        if (*(_WORD *)(a2 + 112))
        {
          for (uint64_t i = *(uint64_t **)(a2 + 120); ; ++i)
          {
            uint64_t v5 = *i;
            if (*i)
            {
              if (*(void *)v5 == a3) {
                break;
              }
            }
            if (!--v3) {
              return result;
            }
          }
          *(unsigned char *)(v5 + 32) = 0;
          if (!*(_WORD *)(a2 + 18) || !*(unsigned char *)(v5 + 31)) {
            return uarpTransmitQueuePendingEntryComplete(result, a2, v5);
          }
        }
      }
    }
  }
  return result;
}

uint64_t UARPPlatformDownstreamEndpointByID(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t result = 0;
  if (a1 && a2 && a3)
  {
    uint64_t v5 = *(unsigned int *)(a1 + 556);
    if (v5)
    {
      for (uint64_t i = *(uint64_t **)(a1 + 560); ; ++i)
      {
        uint64_t result = *i;
        if (*i)
        {
          if (*(void *)(result + 176) == a2 && *(unsigned __int16 *)(result + 136) == a3) {
            break;
          }
        }
        if (!--v5) {
          return 0;
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t UARPPlatformDownstreamEndpointByDelegate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = 0;
  if (a1 && a2 && a3)
  {
    uint64_t v5 = *(unsigned int *)(a1 + 556);
    if (v5)
    {
      for (uint64_t i = *(uint64_t **)(a1 + 560); ; ++i)
      {
        uint64_t result = *i;
        if (*(void *)(*i + 176) == a2 && *(void *)(result + 40) == a3) {
          break;
        }
        if (!--v5) {
          return 0;
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t uarpPlatformDownstreamEndpointSendMessageInternal(uint64_t a1, uint64_t a2, uint64_t a3, const void *a4, unsigned int a5)
{
  return uarpTransmitBufferUpstream(a1, a2, *(unsigned __int16 *)(a3 + 136), a4, a5);
}

uint64_t uarpPlatformRemoteEndpointAddEntry(uint64_t a1, uint64_t a2)
{
  int v4 = *(_DWORD *)(a1 + 556);
  if (v4)
  {
    uint64_t v5 = *(void **)(a1 + 560);
    uint64_t v6 = *(unsigned int *)(a1 + 556);
    while (*v5)
    {
      ++v5;
      if (!--v6) {
        goto LABEL_5;
      }
    }
    uint64_t result = 0;
    *uint64_t v5 = a2;
  }
  else
  {
LABEL_5:
    int v7 = v4 + 1;
    uint64_t v11 = 0;
    uint64_t result = UARPLayer2RequestBuffer(a1, &v11, 8 * (v4 + 1));
    if (!result)
    {
      uint64_t v9 = *(unsigned int *)(a1 + 556);
      if (v9)
      {
        uint64_t v10 = 0;
        do
        {
          *(void *)(v11 + v10) = *(void *)(*(void *)(a1 + 560) + v10);
          v10 += 8;
        }
        while (8 * v9 != v10);
      }
      else
      {
        uint64_t v9 = 0;
      }
      *(void *)(v11 + 8 * v9) = a2;
      UARPLayer2ReturnBuffer(a1, *(void **)(a1 + 560));
      uint64_t result = 0;
      *(_DWORD *)(a1 + 556) = v7;
      *(void *)(a1 + 560) = v11;
    }
  }
  return result;
}

uint64_t uarpPlatformRemoteEndpointAlloc(uint64_t a1)
{
  uint64_t v4 = 0;
  int v2 = UARPLayer2RequestBuffer(a1, &v4, 0xB8u);
  uint64_t result = 0;
  if (!v2)
  {
    if (uarpPlatformRemoteEndpointAddEntry(a1, v4)) {
      return 0;
    }
    else {
      return v4;
    }
  }
  return result;
}

uint64_t uarpPlatformAssetApproveOfferVersion(uint64_t a1, uint64_t a2)
{
  if (*(_WORD *)(a2 + 46) != 1 || !*(unsigned char *)(a1 + 32)) {
    return 0;
  }
  uint64_t v3 = (_DWORD *)(a2 + 52);
  int v4 = uarpVersionCompare((_DWORD *)(a1 + 138), (_DWORD *)(a2 + 52));
  if (v4 == 2) {
    return 59;
  }
  if (!v4) {
    return 60;
  }
  int v6 = uarpVersionCompare((_DWORD *)(a1 + 154), v3);
  if (v6) {
    unsigned int v7 = 0;
  }
  else {
    unsigned int v7 = 62;
  }
  if (v6 == 2) {
    return 61;
  }
  else {
    return v7;
  }
}

uint64_t uarpPlatformEndpointSendSyncMsg(uint64_t a1, uint64_t a2)
{
  uint64_t result = 30;
  if (a1 && a2)
  {
    uint64_t v5 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0, 6u, *(_DWORD *)(a1 + 552) != 0);
    if (v5)
    {
      return uarpTransmitBuffer2(a1, a2, (uint64_t)v5);
    }
    else
    {
      return 11;
    }
  }
  return result;
}

uint64_t uarpSendVersionDiscoveryRequest(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t result = 30;
  if (a1 && a2)
  {
    unsigned int v7 = uarpAllocPrepareTransmitBuffer2(a1, a2, 1u, 8u, 1);
    if (v7)
    {
      uint64_t v8 = (uint64_t)v7;
      uint64_t v9 = v7[2];
      if (a3 >= 4) {
        unsigned int v10 = 4;
      }
      else {
        unsigned int v10 = a3;
      }
      *(_WORD *)(a2 + 48) = v10;
      *(_WORD *)(v9 + 6) = uarpHtons(v10);
      return uarpTransmitBuffer2(a1, a2, v8);
    }
    else
    {
      return 11;
    }
  }
  return result;
}

uint64_t uarpSendVersionDiscoveryResponse(uint64_t a1, uint64_t a2, __int16 a3)
{
  uint64_t result = 30;
  if (a1 && a2)
  {
    *(_WORD *)(a2 + 48) = a3;
    int v6 = uarpAllocPrepareTransmitBuffer2(a1, a2, 2u, 0xAu, 0);
    if (v6)
    {
      uint64_t v7 = (uint64_t)v6;
      uint64_t v8 = v6[2];
      *(_WORD *)(v8 + 6) = uarpHtons(0);
      *(_WORD *)(v8 + 8) = uarpHtons(*(unsigned __int16 *)(a2 + 48));
      return uarpTransmitBuffer2(a1, a2, v7);
    }
    else
    {
      return 11;
    }
  }
  return result;
}

uint64_t uarpSendInformationRequest(uint64_t a1, uint64_t a2, unsigned int a3)
{
  int v6 = uarpAllocPrepareTransmitBuffer2(a1, a2, 3u, 0xAu, 1);
  if (!v6) {
    return 11;
  }
  uint64_t v7 = (uint64_t)v6;
  uint64_t v8 = v6[2];
  *(_DWORD *)(v8 + 6) = uarpHtonl(a3);
  return uarpTransmitBuffer2(a1, a2, v7);
}

uint64_t uarpSendDataTransferNotificationPause(uint64_t a1, uint64_t a2)
{
  return uarpSendDataTransferNotification(a1, a2, 1u);
}

uint64_t uarpSendDataTransferNotification(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t result = 30;
  if (a1 && a2)
  {
    uint64_t v7 = uarpAllocPrepareTransmitBuffer2(a1, a2, 8u, 8u, 1);
    if (v7)
    {
      uint64_t v8 = (uint64_t)v7;
      uint64_t v9 = v7[2];
      *(_WORD *)(v9 + 6) = uarpHtons(a3);
      return uarpTransmitBuffer2(a1, a2, v8);
    }
    else
    {
      return 11;
    }
  }
  return result;
}

uint64_t uarpSendDataTransferNotificationResume(uint64_t a1, uint64_t a2)
{
  return uarpSendDataTransferNotification(a1, a2, 2u);
}

uint64_t uarpSendDynamicAssetPreProcessingStatus(uint64_t a1, uint64_t a2, _DWORD *a3, unsigned int a4, int a5)
{
  unsigned int v10 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x13u, 0xCu, 1);
  if (!v10) {
    return 11;
  }
  uint64_t v11 = (uint64_t)v10;
  uint64_t v12 = v10[2];
  *(_DWORD *)(v12 + 6) = *a3;
  *(_WORD *)(v12 + 10) = uarpHtons(a5 | a4);
  return uarpTransmitBuffer2(a1, a2, v11);
}

uint64_t uarpSendAssetRequestData(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4, unsigned int a5)
{
  unsigned int v10 = uarpAllocPrepareTransmitBuffer2(a1, a2, 6u, 0xEu, 1);
  if (!v10) {
    return 11;
  }
  uint64_t v11 = (uint64_t)v10;
  uint64_t v12 = v10[2];
  *(_WORD *)(v12 + 6) = uarpHtons(a3);
  *(_DWORD *)(v12 + 8) = uarpHtonl(a4);
  if (a5 >= 0xFFFF) {
    unsigned int v13 = 0xFFFF;
  }
  else {
    unsigned int v13 = a5;
  }
  *(_WORD *)(v12 + 12) = uarpHtons(v13);
  return uarpTransmitBuffer2(a1, a2, v11);
}

uint64_t uarpSendVendorSpecific(uint64_t a1, uint64_t a2, __int16 *a3, unsigned int a4, const void *a5, unsigned int a6)
{
  if (!a2) {
    return 13;
  }
  uint64_t v12 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0xFFFFu, (unsigned __int16)(a6 + 11), a4 == 32);
  if (!v12) {
    return 11;
  }
  uint64_t v13 = (uint64_t)v12;
  uint64_t v14 = v12[2];
  __int16 v15 = *a3;
  *(unsigned char *)(v14 + 8) = *((unsigned char *)a3 + 2);
  *(_WORD *)(v14 + 6) = v15;
  *(_WORD *)(v14 + 9) = uarpHtons(a4);
  if (a5 && a6) {
    memcpy((void *)(v14 + 11), a5, a6);
  }
  return uarpTransmitBuffer2(a1, a2, v13);
}

uint64_t uarpSendDownstreamEndpointDiscovery(uint64_t a1, uint64_t a2)
{
  int v4 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x15u, 6u, 1);
  if (!v4) {
    return 11;
  }
  return uarpTransmitBuffer2(a1, a2, (uint64_t)v4);
}

uint64_t uarpSendDownstreamEndpointReachable(uint64_t a1, uint64_t a2, unsigned int a3)
{
  int v6 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x17u, 8u, 1);
  if (!v6) {
    return 11;
  }
  uint64_t v7 = (uint64_t)v6;
  uint64_t v8 = v6[2];
  *(_WORD *)(v8 + 6) = uarpHtons(a3);
  return uarpTransmitBuffer2(a1, a2, v7);
}

uint64_t uarpSendDownstreamEndpointUnreachable(uint64_t a1, uint64_t a2, unsigned int a3)
{
  int v6 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x19u, 8u, 1);
  if (!v6) {
    return 11;
  }
  uint64_t v7 = (uint64_t)v6;
  uint64_t v8 = v6[2];
  *(_WORD *)(v8 + 6) = uarpHtons(a3);
  return uarpTransmitBuffer2(a1, a2, v7);
}

uint64_t uarpTransmitBufferUpstream(uint64_t a1, uint64_t a2, unsigned int a3, const void *a4, unsigned int a5)
{
  unsigned int v10 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x1Bu, (unsigned __int16)(a5 + 8), 1);
  if (!v10) {
    return 11;
  }
  uint64_t v11 = v10;
  uint64_t v12 = v10[2];
  *(_WORD *)(v12 + 6) = uarpHtons(a3);
  memcpy((void *)(v12 + 8), a4, a5);
  return uarpTransmitBuffer2(a1, a2, v11);
}

uint64_t uarpPlatformEndpointRecvMessage(uint64_t a1, uint64_t a2, unsigned __int16 *a3, unsigned int a4)
{
  uint64_t v4 = 30;
  if (!a1 || !a2 || !a3) {
    return v4;
  }
  UARPLayer2LogPacket(a1, a2);
  if (a4 < 6) {
    return 9;
  }
  *a3 = uarpHtons(*a3);
  a3[1] = uarpHtons(a3[1]);
  unsigned __int16 v9 = uarpHtons(a3[2]);
  a3[2] = v9;
  *(_WORD *)(a2 + 60) = v9;
  if (a3[1] + 6 != a4) {
    return 9;
  }
  uint64_t v4 = 1;
  *(unsigned char *)(a1 + 580) = 1;
  switch(*a3)
  {
    case 0u:
      if (!*(_DWORD *)(a1 + 552))
      {
        uarpPlatformEndpointSendSyncMsg(a1, a2);
        goto LABEL_183;
      }
      unsigned int v12 = *(unsigned __int16 *)(a2 + 112);
      if (!*(_WORD *)(a2 + 112)) {
        goto LABEL_165;
      }
      uint64_t v13 = 0;
      while (1)
      {
        uint64_t v14 = *(void *)(*(void *)(a2 + 120) + 8 * v13);
        if (v14)
        {
          if (!uarpHtons(**(unsigned __int16 **)(v14 + 16)))
          {
            UARPLayer2WatchdogCancel(a1, a2);
            uarpTransmitQueuePendingEntryComplete(a1, a2, v14);
LABEL_165:
            *(void *)(a2 + 146) = 0;
            *(void *)(a2 + 138) = 0;
            *(void *)(a2 + 162) = 0;
            *(void *)(a2 + 154) = 0;
            int v123 = *(_DWORD *)(a1 + 552);
            if (v123 == 1
              || v123 == 2
              && !uarpPlatformEndpointIsMessageTypePending(a1, a2, 1)
              && *(void *)(a1 + 296))
            {
              uarpSendVersionDiscoveryRequest(a1, a2, *(unsigned __int16 *)(a2 + 12));
            }
            if (*(unsigned char *)(a2 + 14) == 1) {
              uarpPlatformReOfferFirmware(a1, a2);
            }
            goto LABEL_183;
          }
          unsigned int v12 = *(unsigned __int16 *)(a2 + 112);
        }
        if (++v13 >= (unint64_t)v12) {
          goto LABEL_165;
        }
      }
    case 1u:
      if (a4 < 8) {
        goto LABEL_94;
      }
      unsigned int v15 = uarpHtons(a3[3]);
      unsigned int v16 = *(unsigned __int16 *)(a1 + 12);
      if (v15 < v16) {
        unsigned int v16 = v15;
      }
      if (v16 <= 1) {
        __int16 v17 = 1;
      }
      else {
        __int16 v17 = v16;
      }
      *(_WORD *)(a2 + 48) = v17;
      UARPLayer2ProtocolVersion(a1, a2);
      uarpSendVersionDiscoveryResponse(a1, a2, *(_WORD *)(a2 + 48));
      goto LABEL_183;
    case 2u:
      if (a4 < 0xA) {
        goto LABEL_94;
      }
      int v18 = uarpHtons(a3[3]);
      a3[3] = v18;
      if (v18)
      {
        uint64_t v4 = 2;
        goto LABEL_184;
      }
      unsigned int v118 = uarpHtons(a3[4]);
      if (v118 <= 1) {
        unsigned int v119 = 1;
      }
      else {
        unsigned int v119 = v118;
      }
      if (v119 >= 4) {
        LOWORD(v119) = 4;
      }
      *(_WORD *)(a2 + 48) = v119;
      unsigned int v120 = *(unsigned __int16 *)(a2 + 112);
      if (!*(_WORD *)(a2 + 112)) {
        goto LABEL_182;
      }
      uint64_t v121 = 0;
      break;
    case 3u:
      if (a4 < 0xA) {
        goto LABEL_94;
      }
      int v19 = uarpAllocPrepareTransmitBuffer2(a1, a2, 4u, 0x10u, 0);
      if (!v19) {
        goto LABEL_147;
      }
      unsigned int v20 = v19;
      uint64_t v21 = v19[2];
      *(_DWORD *)(v21 + 8) = uarpHtonl(*(_DWORD *)(a3 + 3));
      *(_DWORD *)(v21 + 12) = *((_DWORD *)v20 + 6) - 16;
      int updated = uarpCallbackUpdateInformationTLV((void *)a1, a2, (_DWORD *)(v21 + 8));
      unsigned __int16 v23 = updated;
      if (updated)
      {
        __int16 v24 = 16;
      }
      else
      {
        __int16 v124 = *(_WORD *)(v21 + 12);
        *(_WORD *)(v21 + 2) = uarpHtons((unsigned __int16)(v124 + 10));
        *(_DWORD *)(v21 + 8) = uarpHtonl(*(_DWORD *)(v21 + 8));
        *(_DWORD *)(v21 + 12) = uarpHtonl(*(_DWORD *)(v21 + 12));
        __int16 v24 = v124 + 16;
      }
      *(_WORD *)(v21 + 6) = uarpHtons(v23);
      *((_WORD *)v20 + 14) = v24;
      goto LABEL_175;
    case 4u:
      if (a4 < 8) {
        goto LABEL_94;
      }
      uint64_t v25 = uarpHtons(a3[3]);
      int v26 = uarpHtonl(*((_DWORD *)a3 + 2));
      unsigned int v27 = uarpHtonl(*((_DWORD *)a3 + 3));
      uarpPlatformResponseAccessoryInfo(a1, a2, v25, v26, v27, (unsigned int *)a3 + 4);
      goto LABEL_183;
    case 5u:
      if (a4 < 0x24) {
        goto LABEL_94;
      }
      unsigned int v130 = 0;
      uarpTagStructUnpack32(*(unsigned int *)(a3 + 3), &v130);
      unsigned int v28 = uarpHtons(a3[5]);
      uint64_t v29 = uarpHtons(a3[6]);
      *(_OWORD *)v129 = 0uLL;
      uarpVersionEndianSwap((unsigned int *)(a3 + 7), v129);
      unsigned int v30 = uarpHtonl(*(_DWORD *)(a3 + 15));
      unsigned int v31 = uarpHtons(a3[17]);
      __int16 v32 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0xDu, 0x24u, 0);
      if (!v32) {
        goto LABEL_147;
      }
      uint64_t v33 = (uint64_t)v32;
      uint64_t v34 = v32[2];
      *(_DWORD *)(v34 + 6) = uarpPayloadTagPack(&v130);
      *(_WORD *)(v34 + 10) = uarpHtons(v28);
      *(_WORD *)(v34 + 12) = uarpHtons(v29);
      uarpVersionEndianSwap(v129, (_DWORD *)(v34 + 14));
      *(_DWORD *)(v34 + 30) = uarpHtonl(v30);
      *(_WORD *)(v34 + 34) = uarpHtons(v31);
      uint64_t v4 = uarpTransmitBuffer2(a1, a2, v33);
      if (v4) {
        goto LABEL_184;
      }
      uint64_t v35 = uarpPlatformAssetFindByAssetID(a1, a2, 0, v29);
      if (v35 && !*(_DWORD *)(v35 + 8)) {
        goto LABEL_183;
      }
      uint64_t PreparedAsset = uarpPlatformFindPreparedAsset(a1, a2, v29, v28, (unsigned __int8 *)&v130);
      if (!PreparedAsset)
      {
        uint64_t PreparedAsset = uarpPlatformCreateRxAsset(a1, a2);
        if (!PreparedAsset) {
          goto LABEL_147;
        }
      }
      *(void *)(PreparedAsset + 452) = -1;
      *(_DWORD *)(PreparedAsset + 448) = uarpHtons(a3[17]);
      *(_WORD *)(PreparedAsset + 44) = v29;
      *(_WORD *)(PreparedAsset + 46) = v28;
      *(_DWORD *)(PreparedAsset + 48) = v130;
      *(_OWORD *)(PreparedAsset + 52) = *(_OWORD *)v129;
      *(_DWORD *)(PreparedAsset + 68) = uarpHtonl(*(_DWORD *)(a3 + 15));
      __int16 v37 = *(_WORD *)(PreparedAsset + 46);
      if (v37)
      {
        UARPLayer2SuperBinaryOffered(a1, a2);
      }
      else
      {
        if ((v37 & 2) == 0)
        {
          uint64_t v4 = 22;
          goto LABEL_184;
        }
        UARPLayer2DynamicAssetOffered(a1, a2);
      }
      goto LABEL_183;
    case 6u:
      if (a4 < 0xE) {
        goto LABEL_94;
      }
      unsigned int v38 = uarpHtons(a3[6]);
      if (*(_DWORD *)a2 >= v38) {
        unsigned __int16 v39 = v38;
      }
      else {
        unsigned __int16 v39 = *(_DWORD *)a2;
      }
      LOWORD(v129[0]) = v39;
      uint64_t v40 = uarpHtonl(*((_DWORD *)a3 + 2));
      int v41 = uarpHtons(a3[3]);
      uint64_t v42 = uarpAllocPrepareTransmitBuffer2(a1, a2, 7u, (unsigned __int16)(v39 + 18), 0);
      if (!v42) {
        goto LABEL_147;
      }
      unsigned int v20 = v42;
      uint64_t v43 = v42[2];
      unsigned __int16 v44 = uarpPlatformAssetDataRequest(a1, a2, v41, v39, v40, (void *)(v43 + 18), (unsigned __int16 *)v129);
      *(_WORD *)(v43 + 6) = uarpHtons(v44);
      *(_WORD *)(v43 + 8) = a3[3];
      *(_DWORD *)(v43 + 10) = *((_DWORD *)a3 + 2);
      *(_WORD *)(v43 + 14) = a3[6];
      *(_WORD *)(v43 + 16) = uarpHtons(LOWORD(v129[0]));
      __int16 v45 = LOWORD(v129[0]) + 18;
      *(_WORD *)(v43 + 2) = uarpHtons((unsigned __int16)(LOWORD(v129[0]) + 12));
      *((_WORD *)v20 + 14) = v45;
LABEL_175:
      uint64_t v70 = a1;
      uint64_t v71 = a2;
      uint64_t v72 = (uint64_t)v20;
LABEL_176:
      uint64_t v11 = uarpTransmitBuffer2(v70, v71, v72);
      goto LABEL_177;
    case 7u:
      if (a4 < 0x12) {
        goto LABEL_94;
      }
      int v46 = uarpHtons(a3[4]);
      uint64_t v47 = uarpPlatformAssetFindByAssetID(a1, a2, 0, v46);
      if (!v47) {
        goto LABEL_149;
      }
      uint64_t v48 = v47;
      uint64_t v49 = uarpHtons(a3[3]);
      int v50 = uarpHtonl(*(_DWORD *)(a3 + 5));
      int v51 = uarpHtons(a3[7]);
      size_t v52 = uarpHtons(a3[8]);
      unsigned int v53 = uarpPlatformAssetResponseData(a1, v48, v49, a3 + 9, v50, v51, v52);
      if (v53 == 29) {
        uint64_t v4 = 0;
      }
      else {
        uint64_t v4 = v53;
      }
      goto LABEL_184;
    case 8u:
      if (a4 < 8) {
        goto LABEL_94;
      }
      char v54 = uarpHtons(a3[3]);
      uint64_t v55 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0xEu, 8u, 0);
      if (!v55) {
        goto LABEL_147;
      }
      *(_WORD *)(v55[2] + 6) = a3[3];
      uint64_t v4 = uarpTransmitBuffer2(a1, a2, (uint64_t)v55);
      if (v4) {
        goto LABEL_184;
      }
      if ((v54 & 1) != 0 && *(unsigned char *)(a2 + 56) == 1)
      {
        *(unsigned char *)(a2 + 56) = 0;
        uint64_t v11 = UARPLayer2DataTransferPause(a1, a2);
        goto LABEL_177;
      }
      if ((v54 & 2) == 0 || *(unsigned char *)(a2 + 56))
      {
        uint64_t v4 = 33;
        goto LABEL_184;
      }
      *(unsigned char *)(a2 + 56) = 1;
      uint64_t v11 = uarpPlatformDataTransferResume(a1, a2);
      goto LABEL_177;
    case 9u:
      if (a4 < 0xA) {
        goto LABEL_94;
      }
      unsigned int v56 = uarpHtons(a3[3]);
      uint64_t v57 = uarpHtons(a3[4]);
      uint64_t v58 = uarpPlatformAssetFindByAssetID(a1, a2, 1, v56);
      if (!v58) {
        goto LABEL_183;
      }
      uint64_t v59 = (void *)v58;
      v129[0] = *(_DWORD *)(v58 + 48);
      __int16 v60 = *(_WORD *)(v58 + 46);
      uint64_t v61 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0xFu, 0xAu, 0);
      if (!v61) {
        goto LABEL_147;
      }
      uint64_t v62 = (uint64_t)v61;
      uint64_t v63 = v61[2];
      *(_WORD *)(v63 + 6) = uarpHtons(v56);
      *(_WORD *)(v63 + 8) = uarpHtons(v57);
      uint64_t v4 = uarpTransmitBuffer2(a1, a2, v62);
      if (v4) {
        goto LABEL_184;
      }
      uint64_t v4 = UARPLayer2AssetProcessingNotification2(a1, a2, v59, v57);
      if (v4) {
        goto LABEL_184;
      }
      if ((v60 & 2) != 0)
      {
        uint64_t v64 = *(unsigned __int8 **)(a2 + 80);
        if (v64)
        {
          if (uarp4ccCompare((unsigned __int8 *)v129, v64))
          {
            if (*(_WORD *)(a2 + 28) == 1)
            {
              unint64_t v65 = 0;
            }
            else
            {
              unint64_t v127 = 0;
              do
              {
                *(_DWORD *)(*(void *)(a2 + 80) + 4 * v127) = *(_DWORD *)(*(void *)(a2 + 80) + 4 * v127 + 4);
                unint64_t v65 = *(unsigned __int16 *)(a2 + 28) - 1;
                ++v127;
              }
              while (v127 < v65);
            }
            v128 = *(unsigned char **)(a2 + 80);
            *(_DWORD *)&v128[4 * v65] = 0;
            if (uarpAssetTagIsValid(v128)) {
              goto LABEL_189;
            }
          }
        }
      }
      goto LABEL_183;
    case 0xAu:
      LOWORD(v129[0]) = 0;
      unsigned __int16 v66 = UARPLayer2ApplyStagedAssets(a1, a2);
      uint64_t v4 = 11;
      __n128 v67 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0xBu, 0xAu, 0);
      if (!v67) {
        goto LABEL_184;
      }
      unsigned int v68 = v67;
      uint64_t v69 = v67[2];
      *(_WORD *)(v69 + 6) = uarpHtons(v66);
      *(_WORD *)(v69 + 8) = uarpHtons(LOWORD(v129[0]));
      uint64_t v70 = a1;
      uint64_t v71 = a2;
      uint64_t v72 = (uint64_t)v68;
      goto LABEL_176;
    case 0xBu:
      if (a4 < 0xA) {
        goto LABEL_131;
      }
      uarpHtons(a3[3]);
      uarpHtons(a3[4]);
      uint64_t v11 = UARPLayer2ApplyStagedAssetsResponse(a1, a2);
      goto LABEL_177;
    case 0xCu:
      if (a4 < 8) {
        goto LABEL_94;
      }
      int v73 = uarpHtons(a3[3]);
      v74 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x10u, 8u, 0);
      if (!v74) {
        goto LABEL_147;
      }
      *(_WORD *)(v74[2] + 6) = a3[3];
      uint64_t v4 = uarpTransmitBuffer2(a1, a2, (uint64_t)v74);
      if (!v4) {
        uarpPlatformAssetRescinded(a1, a2, v73);
      }
      goto LABEL_184;
    case 0xDu:
      BOOL v10 = a4 >= 0x24;
      goto LABEL_109;
    case 0xEu:
      if (a4 < 8) {
        goto LABEL_131;
      }
      char v75 = uarpHtons(a3[3]);
      if (v75)
      {
        uint64_t v11 = UARPLayer2DataTransferPauseAck(a1, a2);
      }
      else
      {
        if ((v75 & 2) == 0)
        {
          uint64_t v4 = 26;
          goto LABEL_184;
        }
        uint64_t v11 = UARPLayer2DataTransferResumeAck(a1, a2);
      }
      goto LABEL_177;
    case 0xFu:
      if (a4 < 0xA) {
        goto LABEL_131;
      }
      int v76 = uarpHtons(a3[3]);
      uarpHtons(a3[4]);
      uint64_t v77 = uarpPlatformAssetFindByAssetID(a1, a2, 0, v76);
      if (!v77) {
        goto LABEL_183;
      }
      uint64_t v78 = v77;
      uint64_t v4 = UARPLayer2AssetProcessingNotificationAck(a1, a2, v77);
      *(unsigned char *)(v78 + 72) = 1;
      goto LABEL_184;
    case 0x10u:
      if (a4 < 8) {
        goto LABEL_131;
      }
      int v79 = uarpHtons(a3[3]);
      if (v79 == 0xFFFF)
      {
        UARPLayer2RescindAllAssetsAck(a1, a2, 0);
        goto LABEL_183;
      }
      uint64_t v80 = uarpPlatformAssetFindByAssetID(a1, a2, 0, v79);
      if (v80)
      {
        UARPLayer2AssetRescindedAck(a1, a2, v80);
        goto LABEL_183;
      }
LABEL_149:
      uint64_t v4 = 17;
      goto LABEL_184;
    case 0x11u:
      if (a4 < 0xA)
      {
LABEL_94:
        uint64_t v4 = 9;
        goto LABEL_184;
      }
      v108 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x12u, 0xEu, 0);
      if (!v108)
      {
LABEL_147:
        uint64_t v4 = 11;
        goto LABEL_184;
      }
      uint64_t v109 = (uint64_t)v108;
      uint64_t v110 = v108[2];
      *(_DWORD *)(v110 + 6) = uarpHtonl(0);
      *(_DWORD *)(v110 + 10) = *(_DWORD *)(a3 + 3);
      uint64_t v4 = uarpTransmitBuffer2(a1, a2, v109);
      if (v4) {
        goto LABEL_184;
      }
      v129[0] = *(_DWORD *)(a3 + 3);
      int v111 = uarpAssetQueueSolicitation(a1, a2, v129);
      if (v111 == 1)
      {
LABEL_189:
        UARPLayer2AssetSolicitation(a1, a2);
      }
      else if (v111 == 2)
      {
        uarpSendDynamicAssetPreProcessingStatus(a1, a2, v129, 2u, 3328);
      }
      goto LABEL_183;
    case 0x12u:
      BOOL v10 = a4 >= 0xE;
      goto LABEL_109;
    case 0x13u:
      if (a4 < 0xC) {
        goto LABEL_131;
      }
      unsigned int v81 = uarpHtons(a3[5]);
      unsigned int v82 = *(_DWORD *)(a3 + 3);
      v129[0] = v82;
      v83 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x14u, 0xCu, 0);
      if (!v83) {
        goto LABEL_147;
      }
      uint64_t v84 = (uint64_t)v83;
      uint64_t v85 = v83[2];
      *(_DWORD *)(v85 + 6) = v82;
      *(_WORD *)(v85 + 10) = uarpHtons(v81);
      uint64_t v4 = uarpTransmitBuffer2(a1, a2, v84);
      if (v4) {
        goto LABEL_184;
      }
      uint64_t v86 = uarpPlatformAssetFindByTag(a1, a2, 0, (unsigned __int8 *)v129);
      if (v86)
      {
        *(unsigned char *)(v86 + 72) = 1;
        uint64_t v11 = UARPLayer2AssetPreProcessingNotification(a1, a2, v86);
        goto LABEL_177;
      }
      uint64_t v4 = 3;
      goto LABEL_184;
    case 0x14u:
      if (a4 < 0xC) {
        goto LABEL_131;
      }
      uarpHtons(a3[5]);
      v129[0] = *(_DWORD *)(a3 + 3);
      uint64_t v87 = uarpPlatformAssetFindByTag(a1, a2, 1, (unsigned __int8 *)v129);
      if (v87)
      {
        *(unsigned char *)(v87 + 72) = 1;
        uint64_t v4 = UARPLayer2AssetPreProcessingNotificationAck(a1, a2, v87);
        if (v4 != 3) {
          goto LABEL_184;
        }
      }
      goto LABEL_183;
    case 0x15u:
      v88 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x16u, 8u, 0);
      if (!v88) {
        goto LABEL_147;
      }
      uint64_t v89 = (uint64_t)v88;
      uint64_t v90 = v88[2];
      *(_WORD *)(v90 + 6) = uarpHtons(0);
      uint64_t v4 = uarpTransmitBuffer2(a1, a2, v89);
      if (v4) {
        goto LABEL_184;
      }
      uint64_t v11 = fUarpLayer3DownstreamEndpointDiscovery(a1, a2);
      goto LABEL_177;
    case 0x16u:
      BOOL v10 = a4 >= 8;
      goto LABEL_109;
    case 0x17u:
      if (a4 < 8) {
        goto LABEL_131;
      }
      v92 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x18u, 0xAu, 0);
      if (!v92) {
        goto LABEL_147;
      }
      uint64_t v93 = (uint64_t)v92;
      uint64_t v94 = v92[2];
      *(_WORD *)(v94 + 6) = uarpHtons(0);
      *(_WORD *)(v94 + 8) = a3[3];
      uint64_t v4 = uarpTransmitBuffer2(a1, a2, v93);
      if (v4) {
        goto LABEL_184;
      }
      uint64_t v95 = uarpPlatformRemoteEndpointAlloc(a1);
      if (!v95) {
        goto LABEL_147;
      }
      v96 = (void *)v95;
      *(_WORD *)(v95 + 136) = uarpHtons(a3[3]);
      v96[22] = a2;
      uint64_t v4 = fUarpLayer3DownstreamEndpointReachable(a1, a2);
      if (v4) {
        UARPLayer2ReturnBuffer(a1, v96);
      }
      goto LABEL_184;
    case 0x18u:
    case 0x1Cu:
      BOOL v10 = a4 >= 0xA;
LABEL_109:
      int v91 = !v10;
      uint64_t v4 = (8 * v91);
      goto LABEL_184;
    case 0x19u:
      if (a4 < 8) {
        goto LABEL_131;
      }
      v97 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x1Au, 0xAu, 0);
      if (!v97) {
        goto LABEL_147;
      }
      uint64_t v98 = (uint64_t)v97;
      int v99 = uarpHtons(a3[3]);
      uint64_t v100 = UARPPlatformDownstreamEndpointByID(a1, a2, v99);
      uint64_t v101 = *(void *)(v98 + 16);
      if (v100) {
        unsigned int v102 = 0;
      }
      else {
        unsigned int v102 = 58;
      }
      *(_WORD *)(v101 + 6) = uarpHtons(v102);
      *(_WORD *)(v101 + 8) = a3[3];
      uint64_t v103 = uarpTransmitBuffer2(a1, a2, v98);
      uint64_t v4 = v103;
      if (!v100 || v103) {
        goto LABEL_184;
      }
      uint64_t v11 = fUarpLayer3DownstreamEndpointUnreachable(a1, a2);
      goto LABEL_177;
    case 0x1Au:
      if (a4 < 0xA) {
        goto LABEL_131;
      }
      int v104 = uarpHtons(a3[4]);
      if (!UARPPlatformDownstreamEndpointByID(a1, a2, v104)) {
        goto LABEL_194;
      }
      fUarpLayer3DownstreamEndpointReleased(a1, a2);
      goto LABEL_183;
    case 0x1Bu:
      if (a4 < 0xE) {
        goto LABEL_131;
      }
      v112 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x1Cu, 0xAu, 0);
      if (!v112) {
        goto LABEL_147;
      }
      uint64_t v113 = (uint64_t)v112;
      int v114 = uarpHtons(a3[3]);
      uint64_t v115 = UARPPlatformDownstreamEndpointByID(a1, a2, v114);
      uint64_t v116 = *(void *)(v113 + 16);
      if (v115) {
        unsigned int v117 = 0;
      }
      else {
        unsigned int v117 = 58;
      }
      *(_WORD *)(v116 + 6) = uarpHtons(v117);
      *(_WORD *)(v116 + 8) = a3[3];
      uint64_t v4 = uarpTransmitBuffer2(a1, a2, v113);
      if (v4) {
        goto LABEL_184;
      }
      if (v115)
      {
        uint64_t v11 = fUarpLayer3DownstreamEndpointRecvMessage(a1, a2, v115);
        goto LABEL_177;
      }
      v126 = *(void (**)(void, uint64_t, const char *, ...))(a1 + 400);
      if (v126) {
        v126(*(void *)(a1 + 544), 8, "UARP.LAYER2 <%s> Cannot find downstream endpoint", "uarpMsgRecvDownstreamEndpointMessage");
      }
      else {
        uarpLogError(8u, "UARP.LAYER2 <%s> Cannot find downstream endpoint", "uarpMsgRecvDownstreamEndpointMessage");
      }
LABEL_194:
      uint64_t v4 = 58;
      goto LABEL_184;
    case 0x1Du:
      v105 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x1Eu, 8u, 0);
      if (!v105) {
        goto LABEL_147;
      }
      uint64_t v106 = (uint64_t)v105;
      uint64_t v107 = v105[2];
      *(_WORD *)(v107 + 6) = uarpHtons(0);
      uint64_t v4 = uarpTransmitBuffer2(a1, a2, v106);
      if (!v4) {
        fUarpLayer3NoFirmwareUpdateAvailable(a1, a2);
      }
      goto LABEL_184;
    case 0x1Eu:
      goto LABEL_183;
    default:
      if (*a3 != 0xFFFF) {
        goto LABEL_184;
      }
      if (a4 < 0xB)
      {
LABEL_131:
        uint64_t v4 = 8;
      }
      else
      {
        uarpHtons(*(unsigned __int16 *)((char *)a3 + 9));
        uint64_t v11 = UARPLayer2VendorSpecificRecvMessage((void *)a1, a2);
LABEL_177:
        uint64_t v4 = v11;
      }
      goto LABEL_184;
  }
  while (1)
  {
    uint64_t v122 = *(void *)(*(void *)(a2 + 120) + 8 * v121);
    if (v122) {
      break;
    }
LABEL_161:
    if (++v121 >= (unint64_t)v120) {
      goto LABEL_182;
    }
  }
  if (uarpHtons(**(unsigned __int16 **)(v122 + 16)) != 1)
  {
    unsigned int v120 = *(unsigned __int16 *)(a2 + 112);
    goto LABEL_161;
  }
  UARPLayer2WatchdogCancel(a1, a2);
  uarpTransmitQueuePendingEntryComplete(a1, a2, v122);
LABEL_182:
  UARPLayer2ProtocolVersion(a1, a2);
LABEL_183:
  uint64_t v4 = 0;
LABEL_184:
  *a3 = uarpHtons(*a3);
  a3[1] = uarpHtons(a3[1]);
  a3[2] = uarpHtons(a3[2]);
  uarpTransmitQueueProcessRecv(a1, a2, a3, a4);
  *(unsigned char *)(a1 + 580) = 0;
  uarpTransmitQueueService(a1, a2);
  uarpPlatformGarbageCollection(a1, a2);
  return v4;
}

int *uarpAssetTagStructVersions()
{
  uint64_t result = &uarpAssetTagStructVersions_myTag;
  uarpAssetTagStructVersions_myTag = 1397900630;
  return result;
}

uint64_t uarpAssetTagVersions()
{
  uarpAssetTagStructVersions_myTag = 1397900630;
  return uarpPayloadTagPack((unsigned int *)&uarpAssetTagStructVersions_myTag);
}

unsigned char *uarpAssetTagVersions4cc()
{
  uarpAssetTagStructVersions_myTag = 1397900630;
  uarpPayloadTagStructPack(&uarpAssetTagStructVersions_myTag, uarpAssetTagVersions4cc_payload4cc);
  return uarpAssetTagVersions4cc_payload4cc;
}

__int16 *uarpOuiVersions()
{
  uint64_t result = &uarpOuiVersions_myOui;
  uarpOuiVersions_myOuuint64_t i = -6588;
  byte_267D27CBE = 110;
  return result;
}

uint64_t uarpVersionsAssetInitialize(uint64_t a1, uint64_t a2)
{
  long long v3 = 0uLL;
  return UARPSuperBinarySetupHeader(a1, a2, 2u, &v3, 0);
}

uint64_t uarpVersionsAssetAddPayloadInfo(uint64_t a1, uint64_t a2, int *a3, unsigned int *a4, unsigned int *a5)
{
  long long v10 = 0u;
  long long v11 = 0u;
  int v9 = *a3;
  uarpVersionEndianSwap(a4, &v10);
  uarpVersionEndianSwap(a5, &v11);
  return UARPSuperBinaryAddMetaData(a1, a2, 0x44E66E00u, 0x24u, (uint64_t)&v9);
}

uint64_t uarpVersionsAssetAddPartnerSerialInfo(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  return UARPSuperBinaryAddMetaData(a1, a2, 0x44E66E01u, a4, a3);
}

__int16 *uarpOuiAppleGenericFeatures()
{
  uint64_t result = &uarpOuiAppleGenericFeatures_myOui;
  uarpOuiAppleGenericFeatures_myOuuint64_t i = 2492;
  byte_267D27CC1 = 99;
  return result;
}

uint64_t uarpApplePlatformEndpointRecvMessage(uint64_t a1, uint64_t a2, unsigned __int8 *a3, int a4, unsigned int *a5, unsigned int a6)
{
  uint64_t result = 30;
  if (!a1 || !a2 || !a3 || !a5) {
    return result;
  }
  uarpOuiAppleGenericFeatures_myOuuint64_t i = 2492;
  byte_267D27CC1 = 99;
  if (!uarpOuiCompare(a3, (unsigned __int8 *)&uarpOuiAppleGenericFeatures_myOui)) {
    return 9;
  }
  if (a4 != 33)
  {
    if (a4 == 32 && a6 >= 4)
    {
      int v12 = *(_DWORD *)a2;
      uint64_t v13 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0xFFFFu, (unsigned __int16)*(_DWORD *)a2, 0);
      if (!v13) {
        return 11;
      }
      uint64_t v14 = (uint64_t)v13;
      uint64_t v15 = v13[2];
      uarpOuiAppleGenericFeatures_myOuuint64_t i = 2492;
      byte_267D27CC1 = 99;
      *(_WORD *)(v15 + 6) = 2492;
      *(unsigned char *)(v15 + 8) = 99;
      *(_WORD *)(v15 + 9) = uarpHtons(0x21u);
      unsigned int v16 = *(void **)(a1 + 40);
      unsigned int v46 = 0;
      unsigned int v17 = uarpHtonl(*a5);
      int v18 = (unint64_t *)(v15 + 23);
      uint64_t v19 = (v12 - 23);
      switch(v17)
      {
        case 1u:
          unsigned int v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[1];
          if (!v20) {
            goto LABEL_91;
          }
          uint64_t v21 = *(void *)(a1 + 544);
          uint64_t v22 = 1;
          goto LABEL_90;
        case 2u:
          unsigned int v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[3];
          if (!v20) {
            goto LABEL_91;
          }
          uint64_t v21 = *(void *)(a1 + 544);
          uint64_t v22 = 2;
          goto LABEL_90;
        case 3u:
          unsigned int v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[5];
          if (!v20) {
            goto LABEL_91;
          }
          uint64_t v21 = *(void *)(a1 + 544);
          uint64_t v22 = 3;
          goto LABEL_90;
        case 4u:
          uint64_t v29 = (uint64_t (*)(void, uint64_t, uint64_t, uint64_t, unsigned int *))v16[7];
          if (!v29) {
            goto LABEL_91;
          }
          unsigned int v30 = v29(*(void *)(a1 + 544), 4, v15 + 23, v19, &v46);
          if (*(unsigned __int16 *)(a2 + 48) < 4u) {
            break;
          }
          unsigned int v31 = v46;
          if (v46 != 8) {
            goto LABEL_74;
          }
LABEL_41:
          unint64_t *v18 = uarpHtonll(*v18);
          break;
        case 5u:
          __int16 v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[9];
          if (!v32) {
            goto LABEL_91;
          }
          uint64_t v33 = *(void *)(a1 + 544);
          uint64_t v34 = 5;
          goto LABEL_72;
        case 6u:
          __int16 v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[11];
          if (!v32) {
            goto LABEL_91;
          }
          uint64_t v33 = *(void *)(a1 + 544);
          uint64_t v34 = 6;
          goto LABEL_72;
        case 7u:
          uint64_t v35 = (uint64_t (*)(void, uint64_t, uint64_t, uint64_t, unsigned int *))v16[13];
          if (!v35) {
            goto LABEL_91;
          }
          unsigned int v30 = v35(*(void *)(a1 + 544), 7, v15 + 23, v19, &v46);
          if (*(unsigned __int16 *)(a2 + 48) >= 4u && v46 == 8) {
            goto LABEL_41;
          }
          break;
        case 8u:
          __int16 v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[17];
          if (!v32) {
            goto LABEL_91;
          }
          uint64_t v33 = *(void *)(a1 + 544);
          uint64_t v34 = 8;
          goto LABEL_72;
        case 9u:
          __int16 v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[19];
          if (!v32) {
            goto LABEL_91;
          }
          uint64_t v33 = *(void *)(a1 + 544);
          uint64_t v34 = 9;
          goto LABEL_72;
        case 0xAu:
          __int16 v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[21];
          if (!v32) {
            goto LABEL_91;
          }
          uint64_t v33 = *(void *)(a1 + 544);
          uint64_t v34 = 10;
          goto LABEL_72;
        case 0xBu:
          __int16 v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[23];
          if (!v32) {
            goto LABEL_91;
          }
          uint64_t v33 = *(void *)(a1 + 544);
          uint64_t v34 = 11;
          goto LABEL_72;
        case 0xCu:
          unsigned int v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[25];
          if (!v20) {
            goto LABEL_91;
          }
          uint64_t v21 = *(void *)(a1 + 544);
          uint64_t v22 = 12;
          goto LABEL_90;
        case 0xDu:
          unsigned int v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[27];
          if (!v20) {
            goto LABEL_91;
          }
          uint64_t v21 = *(void *)(a1 + 544);
          uint64_t v22 = 13;
          goto LABEL_90;
        case 0xEu:
          unsigned int v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[29];
          if (!v20) {
            goto LABEL_91;
          }
          uint64_t v21 = *(void *)(a1 + 544);
          uint64_t v22 = 14;
          goto LABEL_90;
        case 0xFu:
          unsigned int v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[31];
          if (!v20) {
            goto LABEL_91;
          }
          uint64_t v21 = *(void *)(a1 + 544);
          uint64_t v22 = 15;
          goto LABEL_90;
        case 0x10u:
          __int16 v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[33];
          if (!v32) {
            goto LABEL_91;
          }
          uint64_t v33 = *(void *)(a1 + 544);
          uint64_t v34 = 16;
          goto LABEL_72;
        case 0x11u:
          unsigned int v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[35];
          if (!v20) {
            goto LABEL_91;
          }
          uint64_t v21 = *(void *)(a1 + 544);
          uint64_t v22 = 17;
          goto LABEL_90;
        case 0x12u:
          unsigned int v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[37];
          if (!v20) {
            goto LABEL_91;
          }
          uint64_t v21 = *(void *)(a1 + 544);
          uint64_t v22 = 18;
          goto LABEL_90;
        case 0x13u:
          __int16 v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[39];
          if (!v32) {
            goto LABEL_91;
          }
          uint64_t v33 = *(void *)(a1 + 544);
          uint64_t v34 = 19;
          goto LABEL_72;
        case 0x14u:
          __int16 v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[41];
          if (!v32) {
            goto LABEL_91;
          }
          uint64_t v33 = *(void *)(a1 + 544);
          uint64_t v34 = 20;
          goto LABEL_72;
        case 0x15u:
          __int16 v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[43];
          if (!v32) {
            goto LABEL_91;
          }
          uint64_t v33 = *(void *)(a1 + 544);
          uint64_t v34 = 21;
          goto LABEL_72;
        case 0x16u:
          __int16 v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[45];
          if (!v32) {
            goto LABEL_91;
          }
          uint64_t v33 = *(void *)(a1 + 544);
          uint64_t v34 = 22;
LABEL_72:
          unsigned int v30 = v32(v33, v34, v15 + 23, v19, &v46);
          if (*(unsigned __int16 *)(a2 + 48) < 4u) {
            break;
          }
          unsigned int v31 = v46;
LABEL_74:
          if (v31 == 4) {
            *(_DWORD *)int v18 = uarpHtonl(*(_DWORD *)v18);
          }
          break;
        case 0x17u:
          unsigned int v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[47];
          if (!v20) {
            goto LABEL_91;
          }
          uint64_t v21 = *(void *)(a1 + 544);
          uint64_t v22 = 23;
          goto LABEL_90;
        case 0x18u:
          unsigned int v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[49];
          if (!v20) {
            goto LABEL_91;
          }
          uint64_t v21 = *(void *)(a1 + 544);
          uint64_t v22 = 24;
          goto LABEL_90;
        case 0x19u:
          unsigned int v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[51];
          if (!v20) {
            goto LABEL_91;
          }
          uint64_t v21 = *(void *)(a1 + 544);
          uint64_t v22 = 25;
          goto LABEL_90;
        case 0x1Au:
          unsigned int v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[53];
          if (!v20) {
            goto LABEL_91;
          }
          uint64_t v21 = *(void *)(a1 + 544);
          uint64_t v22 = 26;
          goto LABEL_90;
        case 0x1Bu:
          unsigned int v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[55];
          if (!v20) {
            goto LABEL_91;
          }
          uint64_t v21 = *(void *)(a1 + 544);
          uint64_t v22 = 27;
          goto LABEL_90;
        case 0x1Cu:
          unsigned int v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[57];
          if (!v20) {
            goto LABEL_91;
          }
          uint64_t v21 = *(void *)(a1 + 544);
          uint64_t v22 = 28;
          goto LABEL_90;
        case 0x1Du:
          unsigned int v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[15];
          if (!v20) {
            goto LABEL_91;
          }
          uint64_t v21 = *(void *)(a1 + 544);
          uint64_t v22 = 29;
LABEL_90:
          unsigned int v30 = v20(v21, v22, v15 + 23, v19, &v46);
          break;
        default:
LABEL_91:
          unsigned int v30 = 26;
          break;
      }
      *(_DWORD *)(v15 + 11) = uarpHtonl(v30);
      *(_DWORD *)(v15 + 15) = uarpHtonl(v17);
      *(_DWORD *)(v15 + 19) = uarpHtonl(v46);
      __int16 v36 = v46 + 23;
      *(_WORD *)(v15 + 2) = uarpHtons((unsigned __int16)(v46 + 17));
      *(_WORD *)(v14 + 28) = v36;
      return uarpTransmitBuffer2(a1, a2, v14);
    }
    return 9;
  }
  if (a6 < 4) {
    return 9;
  }
  if (a6 < 0xC) {
    return 8;
  }
  int v23 = uarpHtonl(a5[1]);
  uint64_t v24 = uarpHtonl(a5[2]);
  if ((int)v24 + 12 > a6) {
    return 8;
  }
  uint64_t v25 = v24;
  if (v24) {
    int v26 = (unint64_t *)(a5 + 3);
  }
  else {
    int v26 = 0;
  }
  unsigned int v27 = *(void **)(a1 + 40);
  switch(v23)
  {
    case 1:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[2];
      if (v28) {
        goto LABEL_118;
      }
      return 1;
    case 2:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[4];
      if (!v28) {
        return 1;
      }
      goto LABEL_118;
    case 3:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[6];
      if (!v28) {
        return 1;
      }
      goto LABEL_118;
    case 4:
      uint64_t v38 = v27[8];
      __int16 v37 = (void (**)(void, void, unint64_t *, uint64_t))(v27 + 8);
      if (!v38) {
        return 1;
      }
      if (v24 == 8) {
        goto LABEL_107;
      }
      if (v24 != 4) {
        goto LABEL_117;
      }
      break;
    case 5:
      unsigned __int16 v39 = (void (*)(void, void, unint64_t *, uint64_t))v27[10];
      __int16 v37 = (void (**)(void, void, unint64_t *, uint64_t))(v27 + 10);
      unsigned int v28 = v39;
      if (!v39) {
        return 1;
      }
      goto LABEL_115;
    case 6:
      uint64_t v40 = (void (*)(void, void, unint64_t *, uint64_t))v27[12];
      __int16 v37 = (void (**)(void, void, unint64_t *, uint64_t))(v27 + 12);
      unsigned int v28 = v40;
      if (!v40) {
        return 1;
      }
      goto LABEL_115;
    case 7:
      int v41 = (void (*)(void, void, unint64_t *, uint64_t))v27[14];
      __int16 v37 = (void (**)(void, void, unint64_t *, uint64_t))(v27 + 14);
      unsigned int v28 = v41;
      if (!v41) {
        return 1;
      }
      if (v24 != 8) {
        goto LABEL_118;
      }
LABEL_107:
      *int v26 = uarpHtonll(*v26);
      goto LABEL_117;
    case 8:
      uint64_t v42 = (void (*)(void, void, unint64_t *, uint64_t))v27[18];
      __int16 v37 = (void (**)(void, void, unint64_t *, uint64_t))(v27 + 18);
      unsigned int v28 = v42;
      if (!v42) {
        return 1;
      }
      goto LABEL_115;
    case 9:
      uint64_t v43 = (void (*)(void, void, unint64_t *, uint64_t))v27[20];
      __int16 v37 = (void (**)(void, void, unint64_t *, uint64_t))(v27 + 20);
      unsigned int v28 = v43;
      if (!v43) {
        return 1;
      }
      goto LABEL_115;
    case 10:
      unsigned __int16 v44 = (void (*)(void, void, unint64_t *, uint64_t))v27[22];
      __int16 v37 = (void (**)(void, void, unint64_t *, uint64_t))(v27 + 22);
      unsigned int v28 = v44;
      if (!v44) {
        return 1;
      }
      goto LABEL_115;
    case 11:
      __int16 v45 = (void (*)(void, void, unint64_t *, uint64_t))v27[24];
      __int16 v37 = (void (**)(void, void, unint64_t *, uint64_t))(v27 + 24);
      unsigned int v28 = v45;
      if (!v45) {
        return 1;
      }
LABEL_115:
      if (v24 == 4) {
        break;
      }
      goto LABEL_118;
    case 12:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[26];
      if (!v28) {
        return 1;
      }
      goto LABEL_118;
    case 13:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[28];
      if (!v28) {
        return 1;
      }
      goto LABEL_118;
    case 14:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[30];
      if (!v28) {
        return 1;
      }
      goto LABEL_118;
    case 15:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[32];
      if (!v28) {
        return 1;
      }
      goto LABEL_118;
    case 16:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[34];
      if (!v28) {
        return 1;
      }
      if (v24 != 4) {
        goto LABEL_118;
      }
      __int16 v37 = (void (**)(void, void, unint64_t *, uint64_t))(v27 + 34);
      break;
    case 17:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[36];
      if (!v28) {
        return 1;
      }
      goto LABEL_118;
    case 18:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[38];
      if (!v28) {
        return 1;
      }
      goto LABEL_118;
    case 19:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[40];
      if (!v28) {
        return 1;
      }
      if (v24 != 4) {
        goto LABEL_118;
      }
      __int16 v37 = (void (**)(void, void, unint64_t *, uint64_t))(v27 + 40);
      break;
    case 20:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[42];
      if (!v28) {
        return 1;
      }
      if (v24 != 4) {
        goto LABEL_118;
      }
      __int16 v37 = (void (**)(void, void, unint64_t *, uint64_t))(v27 + 42);
      break;
    case 21:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[44];
      if (!v28) {
        return 1;
      }
      if (v24 != 4) {
        goto LABEL_118;
      }
      __int16 v37 = (void (**)(void, void, unint64_t *, uint64_t))(v27 + 44);
      break;
    case 22:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[46];
      if (!v28) {
        return 1;
      }
      if (v24 != 4) {
        goto LABEL_118;
      }
      __int16 v37 = (void (**)(void, void, unint64_t *, uint64_t))(v27 + 46);
      break;
    case 23:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[48];
      if (!v28) {
        return 1;
      }
      goto LABEL_118;
    case 24:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[50];
      if (!v28) {
        return 1;
      }
      goto LABEL_118;
    case 25:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[52];
      if (!v28) {
        return 1;
      }
      goto LABEL_118;
    case 26:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[54];
      if (!v28) {
        return 1;
      }
      goto LABEL_118;
    case 27:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[56];
      if (!v28) {
        return 1;
      }
      goto LABEL_118;
    case 28:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[58];
      if (!v28) {
        return 1;
      }
      goto LABEL_118;
    case 29:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[16];
      if (!v28) {
        return 1;
      }
      goto LABEL_118;
    default:
      return 1;
  }
  *(_DWORD *)int v26 = uarpHtonl(*(_DWORD *)v26);
LABEL_117:
  unsigned int v28 = *v37;
LABEL_118:
  v28(*(void *)(a1 + 544), *(void *)(a2 + 40), v26, v25);
  return 0;
}

BOOL uarpApplePlatformMessageCheckExpectedResponse(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6)
{
  if (a6 < 0xB) {
    return 0;
  }
  if (*(unsigned __int16 *)(a5 + 6) != *(unsigned __int16 *)(a3 + 6)
    || *(unsigned __int8 *)(a5 + 8) != *(unsigned __int8 *)(a3 + 8))
  {
    return 0;
  }
  uarpOuiAppleGenericFeatures_myOuuint64_t i = 2492;
  byte_267D27CC1 = 99;
  BOOL v10 = *(_WORD *)(a5 + 6) == 2492 && *(unsigned char *)(a5 + 8) == 99;
  if (!v10 || uarpHtons(*(unsigned __int16 *)(a5 + 9)) != 33) {
    return 0;
  }
  int v12 = uarpHtons(*(unsigned __int16 *)(a3 + 9));
  BOOL result = 0;
  if (a6 >= 0x17 && v12 == 32) {
    return *(_DWORD *)(a5 + 15) == *(_DWORD *)(a3 + 11);
  }
  return result;
}

uint64_t uarpApplePlatformMessageCheckValidToSend(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  uint64_t v4 = *(void *)(a1 + 40);
  if (!v4) {
    return 1;
  }
  uarpOuiAppleGenericFeatures_myOuuint64_t i = 2492;
  byte_267D27CC1 = 99;
  if (*(_WORD *)(a3 + 6) != 2492 || *(unsigned char *)(a3 + 8) != 99) {
    return 1;
  }
  int v11 = uarpHtons(*(unsigned __int16 *)(a3 + 9));
  uint64_t result = 1;
  if (a4 >= 0xF && v11 == 32)
  {
    if (uarpHtonl(*(_DWORD *)(a3 + 11)) == 2
      && (*(unsigned __int16 *)(a2 + 48) < 2u || *(_DWORD *)(a2 + 24)))
    {
      int v12 = *(void (**)(void, void, void, void))(v4 + 32);
      if (v12) {
LABEL_14:
      }
        v12(*(void *)(a1 + 544), *(void *)(a2 + 40), 0, 0);
    }
    else
    {
      if (uarpHtonl(*(_DWORD *)(a3 + 11)) != 1
        || *(unsigned __int16 *)(a2 + 48) >= 2u && !*(_DWORD *)(a2 + 24))
      {
        return 1;
      }
      int v12 = *(void (**)(void, void, void, void))(v4 + 16);
      if (v12) {
        goto LABEL_14;
      }
    }
    return 0;
  }
  return result;
}

uint64_t uarpApplePlatformMessageExceededRetries(uint64_t result, uint64_t a2, uint64_t a3, unsigned int a4)
{
  uint64_t v4 = *(void **)(result + 40);
  if (v4)
  {
    uarpOuiAppleGenericFeatures_myOuuint64_t i = 2492;
    byte_267D27CC1 = 99;
    if (*(_WORD *)(a3 + 6) == 2492 && *(unsigned char *)(a3 + 8) == 99)
    {
      uint64_t v9 = result;
      uint64_t result = uarpHtons(*(unsigned __int16 *)(a3 + 9));
      if (a4 >= 0xF && result == 32)
      {
        uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
        if (result == 1)
        {
          BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, void))v4[2];
          if (!v10) {
            return result;
          }
        }
        else
        {
          uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
          if (result == 2)
          {
            BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, void))v4[4];
            if (!v10) {
              return result;
            }
          }
          else
          {
            uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
            if (result == 3)
            {
              BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, void))v4[6];
              if (!v10) {
                return result;
              }
            }
            else
            {
              uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
              if (result == 4)
              {
                BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, void))v4[8];
                if (!v10) {
                  return result;
                }
              }
              else
              {
                uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                if (result == 5)
                {
                  BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, void))v4[10];
                  if (!v10) {
                    return result;
                  }
                }
                else
                {
                  uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                  if (result == 6)
                  {
                    BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, void))v4[12];
                    if (!v10) {
                      return result;
                    }
                  }
                  else
                  {
                    uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                    if (result == 7)
                    {
                      BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, void))v4[14];
                      if (!v10) {
                        return result;
                      }
                    }
                    else
                    {
                      uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                      if (result == 29)
                      {
                        BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, void))v4[16];
                        if (!v10) {
                          return result;
                        }
                      }
                      else
                      {
                        uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                        if (result == 8)
                        {
                          BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, void))v4[18];
                          if (!v10) {
                            return result;
                          }
                        }
                        else
                        {
                          uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                          if (result == 9)
                          {
                            BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, void))v4[20];
                            if (!v10) {
                              return result;
                            }
                          }
                          else
                          {
                            uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                            if (result == 10)
                            {
                              BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, void))v4[22];
                              if (!v10) {
                                return result;
                              }
                            }
                            else
                            {
                              uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                              if (result == 11)
                              {
                                BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, void))v4[24];
                                if (!v10) {
                                  return result;
                                }
                              }
                              else
                              {
                                uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                                if (result == 12)
                                {
                                  BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, void))v4[26];
                                  if (!v10) {
                                    return result;
                                  }
                                }
                                else
                                {
                                  uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                                  if (result == 13)
                                  {
                                    BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, void))v4[28];
                                    if (!v10) {
                                      return result;
                                    }
                                  }
                                  else
                                  {
                                    uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                                    if (result == 14)
                                    {
                                      BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, void))v4[30];
                                      if (!v10) {
                                        return result;
                                      }
                                    }
                                    else
                                    {
                                      uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                                      if (result == 15)
                                      {
                                        BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, void))v4[32];
                                        if (!v10) {
                                          return result;
                                        }
                                      }
                                      else
                                      {
                                        uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                                        if (result == 16)
                                        {
                                          BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, void))v4[34];
                                          if (!v10) {
                                            return result;
                                          }
                                        }
                                        else
                                        {
                                          uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                                          if (result == 17)
                                          {
                                            BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, void))v4[36];
                                            if (!v10) {
                                              return result;
                                            }
                                          }
                                          else
                                          {
                                            uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                                            if (result == 18)
                                            {
                                              BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, void))v4[38];
                                              if (!v10) {
                                                return result;
                                              }
                                            }
                                            else
                                            {
                                              uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                                              if (result == 19)
                                              {
                                                BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, void))v4[40];
                                                if (!v10) {
                                                  return result;
                                                }
                                              }
                                              else
                                              {
                                                uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                                                if (result == 20)
                                                {
                                                  BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, void))v4[42];
                                                  if (!v10) {
                                                    return result;
                                                  }
                                                }
                                                else
                                                {
                                                  uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                                                  if (result == 21)
                                                  {
                                                    BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, void))v4[44];
                                                    if (!v10) {
                                                      return result;
                                                    }
                                                  }
                                                  else
                                                  {
                                                    uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                                                    if (result == 22)
                                                    {
                                                      BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, void))v4[46];
                                                      if (!v10) {
                                                        return result;
                                                      }
                                                    }
                                                    else
                                                    {
                                                      uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                                                      if (result == 23)
                                                      {
                                                        BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, void))v4[48];
                                                        if (!v10) {
                                                          return result;
                                                        }
                                                      }
                                                      else
                                                      {
                                                        uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                                                        if (result != 24) {
                                                          return result;
                                                        }
                                                        BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, void))v4[50];
                                                        if (!v10) {
                                                          return result;
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
        uint64_t v11 = *(void *)(v9 + 544);
        uint64_t v12 = *(void *)(a2 + 40);
        return v10(v11, v12, 0, 0);
      }
    }
  }
  return result;
}

uint64_t uarpCompressionHeaderEndianSwap(unsigned __int16 *a1, uint64_t a2)
{
  *(_WORD *)a2 = uarpHtons(*a1);
  *(_DWORD *)(a2 + 2) = uarpHtonl(*(_DWORD *)(a1 + 1));
  *(_WORD *)(a2 + 6) = uarpHtons(a1[3]);
  uint64_t result = uarpHtons(a1[4]);
  *(_WORD *)(a2 + 8) = result;
  return result;
}

char *uarpAssetTagChdr4cc()
{
  uint64_t result = uarpAssetTagChdr4cc_assetTag;
  uarpAssetTagChdr4cc_assetTag[4] = 0;
  return result;
}

uint64_t uarpAssetTagChdr()
{
  uarpAssetTagChdr4cc_assetTag[4] = 0;
  return uarpPayloadTagPack((unsigned int *)uarpAssetTagChdr4cc_assetTag);
}

int *uarpAssetTagStructChdr()
{
  uarpAssetTagChdr4cc_assetTag[4] = 0;
  uint64_t result = &uarpAssetTagStructChdr_myTag;
  uarpAssetTagStructChdr_myTag = *(_DWORD *)uarpAssetTagChdr4cc_assetTag;
  return result;
}

char *uarpAssetTagHeySiriModel4cc()
{
  uint64_t result = uarpAssetTagHeySiriModel4cc_assetTag;
  uarpAssetTagHeySiriModel4cc_assetTag[4] = 0;
  return result;
}

uint64_t uarpAssetTagHeySiriModel()
{
  uarpAssetTagHeySiriModel4cc_assetTag[4] = 0;
  return uarpPayloadTagPack((unsigned int *)uarpAssetTagHeySiriModel4cc_assetTag);
}

int *uarpAssetTagStructHeySiriModel()
{
  uarpAssetTagHeySiriModel4cc_assetTag[4] = 0;
  uint64_t result = &uarpAssetTagStructHeySiriModel_myTag;
  uarpAssetTagStructHeySiriModel_myTag = *(_DWORD *)uarpAssetTagHeySiriModel4cc_assetTag;
  return result;
}

__int16 *uarpOuiHeySiriModel()
{
  uint64_t result = &uarpOuiHeySiriModel_myOui;
  uarpOuiHeySiriModel_myOuuint64_t i = -29856;
  byte_267D27CCE = 14;
  return result;
}

uint64_t uarpPayloadTagPack(unsigned int *a1)
{
  return *a1;
}

uint64_t uarpPayloadTagUnpack(uint64_t result, char *a2)
{
  unsigned int v2 = result >> 8;
  unsigned int v3 = WORD1(result);
  if (result) {
    char v4 = result;
  }
  else {
    char v4 = 48;
  }
  if (!result)
  {
    LOBYTE(v2) = 48;
    LOBYTE(v3) = 48;
  }
  *a2 = v4;
  a2[1] = v2;
  if (result) {
    char v5 = BYTE3(result);
  }
  else {
    char v5 = 48;
  }
  a2[2] = v3;
  a2[3] = v5;
  return result;
}

unsigned char *uarpPayloadTagStructPack(unsigned char *result, unsigned char *a2)
{
  *a2 = *result;
  a2[1] = result[1];
  a2[2] = result[2];
  a2[3] = result[3];
  return result;
}

uint64_t uarpTagStructUnpack32(uint64_t result, _DWORD *a2)
{
  *a2 = result;
  return result;
}

BOOL uarp4ccCompare(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2 && a1[1] == a2[1] && a1[2] == a2[2] && a1[3] == a2[3];
}

BOOL uarpOuiCompare(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2 && a1[1] == a2[1] && a1[2] == a2[2];
}

uint64_t uarpVersionCompare(_DWORD *a1, _DWORD *a2)
{
  if (*a1 > *a2) {
    return 2;
  }
  if (*a1 < *a2) {
    return 1;
  }
  unsigned int v2 = a1[1];
  unsigned int v3 = a2[1];
  if (v2 > v3) {
    return 2;
  }
  if (v2 < v3) {
    return 1;
  }
  unsigned int v4 = a1[2];
  unsigned int v5 = a2[2];
  if (v4 > v5) {
    return 2;
  }
  if (v4 < v5) {
    return 1;
  }
  unsigned int v7 = a1[3];
  unsigned int v8 = a2[3];
  BOOL v9 = v7 >= v8;
  BOOL v10 = v7 == v8;
  BOOL v11 = v7 < v8;
  if (!v10 && v9) {
    return 2;
  }
  else {
    return v11;
  }
}

uint64_t uarpAssetCompare(uint64_t a1, uint64_t a2)
{
  if (*(unsigned __int16 *)(a1 + 46) == *(unsigned __int16 *)(a2 + 46)
    && *(unsigned __int8 *)(a1 + 48) == *(unsigned __int8 *)(a2 + 48)
    && *(unsigned __int8 *)(a1 + 49) == *(unsigned __int8 *)(a2 + 49)
    && *(unsigned __int8 *)(a1 + 50) == *(unsigned __int8 *)(a2 + 50)
    && *(unsigned __int8 *)(a1 + 51) == *(unsigned __int8 *)(a2 + 51)
    && *(_DWORD *)(a1 + 68) == *(_DWORD *)(a2 + 68)
    && *(_DWORD *)(a1 + 448) == *(_DWORD *)(a2 + 448))
  {
    return uarpVersionCompare((_DWORD *)(a1 + 52), (_DWORD *)(a2 + 52));
  }
  else
  {
    return 3;
  }
}

uint64_t uarpVersionEndianSwap(unsigned int *a1, _DWORD *a2)
{
  *a2 = uarpHtonl(*a1);
  a2[1] = uarpHtonl(a1[1]);
  a2[2] = uarpHtonl(a1[2]);
  uint64_t result = uarpHtonl(a1[3]);
  a2[3] = result;
  return result;
}

const char *uarpStatusCodeToString(unsigned int a1)
{
  if (a1 > 0x3E) {
    return "<unknown>";
  }
  else {
    return off_264492F90[a1];
  }
}

BOOL uarpAssetTagIsValid(unsigned char *a1)
{
  return *a1 || a1[1] || a1[2] || a1[3];
}

int *uarpAssetTagStructSuperBinary()
{
  uint64_t result = &uarpAssetTagStructSuperBinary_myTag;
  uarpAssetTagStructSuperBinary_myTag = 0;
  return result;
}

const char *uarpApplyFlagsToString(int a1)
{
  if ((a1 - 1) > 5) {
    return "<unknown>";
  }
  else {
    return off_264493188[a1 - 1];
  }
}

const char *uarpProcessingFlagsReasonToString(int a1)
{
  HIDWORD(v2) = a1;
  LODWORD(v2) = a1 - 256;
  unsigned int v1 = v2 >> 8;
  if (v1 > 0xE) {
    return "<unknown>";
  }
  else {
    return off_2644931B8[v1];
  }
}

const char *uarpProcessingStatusToString(int a1)
{
  if ((a1 - 1) > 4) {
    return "<unknown>";
  }
  else {
    return off_264493230[(__int16)(a1 - 1)];
  }
}

long long *uarpStageStatusToString(unsigned __int16 a1)
{
  unsigned int v1 = "Upload Denied";
  switch((char)a1)
  {
    case 1:
      strcpy((char *)uarpStageStatusToString_stageStatusString, "Upload Complete");
      return uarpStageStatusToString_stageStatusString;
    case 2:
      goto LABEL_7;
    case 3:
      unsigned int v1 = "Upload Abandoned";
      goto LABEL_7;
    case 4:
      unsigned int v1 = "Asset Corrupt";
      goto LABEL_7;
    case 5:
      unsigned int v1 = "Asset Not Found";
      goto LABEL_7;
    default:
      unsigned int v1 = "<unknown>";
LABEL_7:
      unint64_t v2 = uarpProcessingFlagsReasonToString(a1 & 0xFF00);
      snprintf((char *)uarpStageStatusToString_stageStatusString, 0x100uLL, "%s (%s)", v1, v2);
      return uarpStageStatusToString_stageStatusString;
  }
}

const char *uarpEndpointRoleToString(unsigned int a1)
{
  if (a1 > 2) {
    return "<unknown>";
  }
  else {
    return off_2644932A0[a1];
  }
}

const char *uarpLoggingCategoryToString(unsigned int a1)
{
  if (a1 > 8) {
    return "<unknown>";
  }
  else {
    return off_264493258[a1];
  }
}

void *uarpProcessPayloadTLVInternal(void *result, uint64_t a2, uint64_t a3, signed int a4, uint64_t a5, unsigned int *a6)
{
  uint64_t v10 = (uint64_t)result;
  if (a4 != -858619624)
  {
    if (a4 == -858619625)
    {
      if (a5 == 2)
      {
        uint64_t v12 = uarpHtons(*(unsigned __int16 *)a6);
        *(_DWORD *)(a3 + 76) = v12;
        UARPLayer2HashInfo(v10, v12, (_DWORD *)(a3 + 88), (_DWORD *)(a3 + 104));
        unsigned int v13 = *(_DWORD *)(a3 + 88);
        if (!v13 || !UARPLayer2RequestBuffer(v10, (void *)(a3 + 80), v13) && *(void *)(a3 + 80))
        {
          unsigned int v14 = *(_DWORD *)(a3 + 104);
          if (!v14 || !UARPLayer2RequestBuffer(v10, (void *)(a3 + 96), v14) && *(void *)(a3 + 96))
          {
            uint64_t v19 = *(unsigned int *)(a3 + 76);
            uint64_t v20 = *(void *)(a3 + 80);
            return (void *)UARPLayer2HashInit(v10, v19, v20);
          }
        }
        *(_DWORD *)(a3 + 76) = 0;
      }
LABEL_11:
      return (void *)UARPLayer2AssetCorrupt(v10, a2);
    }
    if (*(_DWORD *)(a3 + 76))
    {
      int v22 = uarpHtonl(a4);
      UARPLayer2HashUpdate(v10, *(unsigned int *)(a3 + 76), *(void *)(a3 + 80), (uint64_t)&v22, 4);
      int v21 = uarpHtonl(a5);
      UARPLayer2HashUpdate(v10, *(unsigned int *)(a3 + 76), *(void *)(a3 + 80), (uint64_t)&v21, 4);
      uint64_t result = (void *)UARPLayer2HashUpdate(v10, *(unsigned int *)(a3 + 76), *(void *)(a3 + 80), (uint64_t)a6, a5);
    }
    if (a4 > -858619631)
    {
      if (a4 == -858619630)
      {
        if (a5 == 2)
        {
          uint64_t result = (void *)uarpHtons(*(unsigned __int16 *)a6);
          *(_DWORD *)(a3 + 56) = result;
          return result;
        }
      }
      else
      {
        if (a4 != -858619623) {
          return result;
        }
        if (a5 == 4)
        {
          uint64_t result = (void *)uarpHtonl(*a6);
          *(_DWORD *)(a3 + 128) = result;
          return result;
        }
      }
    }
    else if (a4 == -858619641)
    {
      *(_DWORD *)(a3 + 72) = a5;
      int v18 = (void **)(a3 + 64);
      if (!UARPLayer2RequestBuffer(v10, (void *)(a3 + 64), a5) && *v18) {
        return memcpy(*v18, a6, *(unsigned int *)(a3 + 72));
      }
    }
    else
    {
      if (a4 != -858619636) {
        return result;
      }
      if (a5 == 4)
      {
        uint64_t result = (void *)uarpHtonl(*a6);
        if (result)
        {
          *(unsigned char *)(a3 + 52) = 1;
          if (!*(void *)(a2 + 656))
          {
            uint64_t result = (void *)UARPLayer2RequestBuffer(v10, (void *)(a2 + 656), *(_DWORD *)(a2 + 648));
            if (*(void *)(a2 + 656))
            {
              *(_DWORD *)(a2 + 664) = *(_DWORD *)(a2 + 648);
              *(unsigned char *)(a2 + 668) = 0;
            }
          }
          return result;
        }
      }
    }
    return (void *)UARPLayer2AssetCorrupt(v10, a2);
  }
  *(_DWORD *)(a3 + 120) = a5;
  uint64_t v15 = (void **)(a3 + 112);
  if (UARPLayer2RequestBuffer((uint64_t)result, (void *)(a3 + 112), a5)) {
    goto LABEL_11;
  }
  unsigned int v16 = *v15;
  if (!*v15) {
    goto LABEL_11;
  }
  size_t v17 = *(unsigned int *)(a3 + 120);
  return memcpy(v16, a6, v17);
}

uint64_t uarpAssetSuperBinaryVersionForProtocolVersion(unsigned int a1)
{
  if (a1 < 3) {
    return 2;
  }
  else {
    return 3;
  }
}

uint64_t uarpDownstreamEndpointGetID(uint64_t a1, _WORD *a2)
{
  uint64_t result = 30;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0;
      *a2 = *(_WORD *)(a1 + 136);
    }
  }
  return result;
}

void uarpPrintDataResponseDetails(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, int a5, int a6, int a7)
{
  uint64_t v12 = *(void (**)(uint64_t, uint64_t, const char *, ...))(a1 + 408);
  if (v12)
  {
    uint64_t v13 = *(void *)(a1 + 544);
    uint64_t v14 = *(int *)(a1 + 552);
    if (v14 > 2) {
      uint64_t v15 = "<unknown>";
    }
    else {
      uint64_t v15 = off_2644932A0[v14];
    }
    int v18 = uarpStatusCodeToString(a4);
    v12(v13, 1, "<ROLE=%s> UARP.LAYER2.DATA.RESP status=<%s>, offset=0x%08x, requestedlength=%u, respondedlength=%u", v15, v18, a5, a6, a7);
  }
  else
  {
    uint64_t v16 = *(int *)(a1 + 552);
    if (v16 > 2) {
      size_t v17 = "<unknown>";
    }
    else {
      size_t v17 = off_2644932A0[v16];
    }
    uint64_t v19 = uarpStatusCodeToString(a4);
    uarpLogInfo(1u, "<ROLE=%s> UARP.LAYER2.DATA.RESP status=<%s>, offset=0x%08x, requestedlength=%u, respondedlength=%u", v17, v19, a5, a6, a7);
  }
  uint64_t v20 = *(void (**)(void, uint64_t, const char *, ...))(a1 + 408);
  if (v20)
  {
    uint64_t v21 = *(int *)(a1 + 552);
    if (v21 > 2) {
      int v22 = "<unknown>";
    }
    else {
      int v22 = off_2644932A0[v21];
    }
    if (*(unsigned char *)(a3 + 80) == 1) {
      uint64_t v25 = "YES";
    }
    else {
      uint64_t v25 = "NO";
    }
    v20(*(void *)(a1 + 544), 1, "<ROLE=%s> UARP.LAYER2.DATA.RESP Outstanding Data Request <%s>, offset=0x%08x, requestedlength=%u", v22, v25, *(_DWORD *)(a3 + 92), *(_DWORD *)(a3 + 96));
  }
  else
  {
    uint64_t v23 = *(int *)(a1 + 552);
    if (v23 > 2) {
      uint64_t v24 = "<unknown>";
    }
    else {
      uint64_t v24 = off_2644932A0[v23];
    }
    if (*(unsigned char *)(a3 + 80) == 1) {
      int v26 = "YES";
    }
    else {
      int v26 = "NO";
    }
    uarpLogInfo(1u, "<ROLE=%s> UARP.LAYER2.DATA.RESP Outstanding Data Request <%s>, offset=0x%08x, requestedlength=%u", v24, v26, *(_DWORD *)(a3 + 92), *(_DWORD *)(a3 + 96));
  }
}

uint64_t uarpCopyDefaultInfoString(_DWORD *a1, uint64_t a2)
{
  if (a2 < 7) {
    return 0;
  }
  *(_DWORD *)((char *)a1 + 3) = 1314344782;
  *a1 = 1313558101;
  return a2;
}

void *uarpAllocateTransmitBuffer2(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v12 = 0;
  int v6 = UARPLayer2RequestBuffer(a1, &v12, 0x28u);
  uint64_t result = 0;
  if (!v6)
  {
    unsigned int v8 = *(_DWORD *)a2 + *(unsigned __int16 *)(a2 + 30) + 26;
    if (v8 <= a3) {
      unsigned int v8 = a3;
    }
    unsigned int v11 = v8;
    if (UARPLayer2RequestTransmitMsgBuffer(a1, a2, v12, &v11))
    {
      UARPLayer2ReturnBuffer(a1, v12);
      return 0;
    }
    else
    {
      unsigned int v9 = v11;
      uint64_t result = v12;
      *((_DWORD *)v12 + 2) = v11;
      uint64_t v10 = *(unsigned __int16 *)(a2 + 30);
      result[2] = *result + v10;
      *((_DWORD *)result + 6) = v9 - v10;
      *((_WORD *)result + 14) = 0;
    }
  }
  return result;
}

void *uarpAllocPrepareTransmitBuffer2(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4, char a5)
{
  uint64_t v10 = uarpAvailableTransmitBuffer(a1, a2, a4);
  if (v10) {
    goto LABEL_2;
  }
  __int16 v14 = *(_WORD *)(a2 + 96);
  uint64_t v23 = 0;
  unsigned int v15 = 16 * (v14 & 0x7FFF);
  if (UARPLayer2RequestBuffer(a1, &v23, v15)) {
    return 0;
  }
  unsigned __int16 v16 = 2 * v14;
  uint64_t v17 = *(unsigned __int16 *)(a2 + 96);
  if (v17 < v16)
  {
    do
    {
      TransmitBuffer2 = uarpAllocateTransmitBuffer2(a1, a2, 0);
      *(void *)(v23 + 8 * v17++) = TransmitBuffer2;
    }
    while (v16 != v17);
  }
  *(_WORD *)(a2 + 96) = v16;
  UARPLayer2ReturnBuffer(a1, *(void **)(a2 + 104));
  *(void *)(a2 + 104) = v23;
  uint64_t v22 = 0;
  if (UARPLayer2RequestBuffer(a1, &v22, v15)) {
    return 0;
  }
  if (*(_WORD *)(a2 + 112))
  {
    uint64_t v20 = 0;
    uint64_t v21 = 8 * *(unsigned __int16 *)(a2 + 112);
    do
    {
      *(void *)(v22 + v20) = *(void *)(*(void *)(a2 + 120) + v20);
      v20 += 8;
    }
    while (v21 != v20);
  }
  *(_WORD *)(a2 + 112) = v16;
  UARPLayer2ReturnBuffer(a1, *(void **)(a2 + 120));
  *(void *)(a2 + 120) = v22;
  uint64_t v10 = uarpAvailableTransmitBuffer(a1, a2, a4);
  if (v10)
  {
LABEL_2:
    size_t v11 = *((unsigned int *)v10 + 6);
    if (v11 >= a4)
    {
      *((_WORD *)v10 + 14) = a4;
      *((unsigned char *)v10 + 31) = a5;
      bzero((void *)v10[2], v11);
      *(_WORD *)void v10[2] = uarpHtons(a3);
      __int16 v12 = uarpHtons((unsigned __int16)(a4 - 6));
      uint64_t v13 = v10[2];
      *(_WORD *)(v13 + 2) = v12;
      *(_WORD *)(v13 + 4) = 0;
      return v10;
    }
    return 0;
  }
  return v10;
}

uint64_t uarpTransmitBuffer2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(unsigned __int16 *)(a2 + 112);
  if (v3 >= 2)
  {
    uint64_t v4 = 0;
    do
    {
      uint64_t v5 = *(void *)(a2 + 120);
      if (!*(void *)(v5 + v4))
      {
        *(void *)(v5 + v4) = *(void *)(v5 + v4 + 8);
        *(void *)(*(void *)(a2 + 120) + v4 + 8) = 0;
      }
      v4 += 8;
    }
    while (8 * (v3 - 1) != v4);
  }
  if (!v3) {
    return 11;
  }
  for (uint64_t i = *(void **)(a2 + 120); *i; ++i)
  {
    if (!--v3) {
      return 11;
    }
  }
  *uint64_t i = a3;
  uarpTransmitQueueService(a1, a2);
  return 0;
}

uint64_t uarpTransmitQueueService(uint64_t a1, uint64_t a2)
{
  int v2 = *(unsigned __int16 *)(a2 + 112);
  if (!*(_WORD *)(a2 + 112)) {
    return 0;
  }
  uint64_t v4 = a1;
  while (1)
  {
    uint64_t v5 = 0;
    while (1)
    {
      while (1)
      {
        uint64_t v6 = *(void *)(*(void *)(a2 + 120) + 8 * v5);
        if (v6) {
          break;
        }
        if (++v5 == v2) {
          return 0;
        }
      }
      if (*(unsigned char *)(v6 + 32) != 1) {
        break;
      }
      ++v5;
      if (*(void *)(v4 + 296)) {
        BOOL v7 = 1;
      }
      else {
        BOOL v7 = v5 == v2;
      }
      if (v7) {
        return 0;
      }
    }
    if (*(unsigned char *)(v6 + 33) == 1) {
      goto LABEL_21;
    }
    int v8 = uarpHtons(**(unsigned __int16 **)(v6 + 16));
    if (v8 != 0xFFFF) {
      break;
    }
    a1 = UARPLayer2VendorSpecificCheckValidToSend(v4, a2);
    if (a1) {
      goto LABEL_23;
    }
LABEL_21:
    a1 = uarpTransmitQueuePendingEntryComplete(a1, a2, v6);
    uint64_t v9 = 0;
    int v2 = *(unsigned __int16 *)(a2 + 112);
    if (!*(_WORD *)(a2 + 112)) {
      return v9;
    }
  }
  if (v8 == 3
    && uarpHtonl(*(_DWORD *)(*(void *)(v6 + 16) + 6)) == 9
    && *(unsigned __int16 *)(a2 + 48) <= 2u)
  {
    a1 = UARPLayer2FriendlyNameResponse(v4, a2);
    goto LABEL_21;
  }
LABEL_23:
  if (*(unsigned char *)(a2 + 50) == 1) {
    return 0;
  }
  unsigned int v10 = *(unsigned __int8 *)(v6 + 30);
  if (*(unsigned __int16 *)(a2 + 18) >= v10)
  {
    *(unsigned char *)(v6 + 30) = v10 + 1;
    *(unsigned char *)(v6 + 32) = 1;
    if (*(unsigned char *)(v6 + 31) == 1) {
      UARPLayer2WatchdogSet(v4, a2);
    }
    *(_WORD *)(*(void *)(v6 + 16) + 4) = uarpHtons(*(unsigned __int16 *)(a2 + 58));
    ++*(_WORD *)(a2 + 58);
    uint64_t v9 = UARPLayer2SendMessage(v4, a2, *(const void **)v6, *(unsigned __int16 *)(a2 + 30) + *(unsigned __int16 *)(v6 + 28));
    UARPLayer2LogPacket(v4, a2);
    if (v9)
    {
      *(unsigned char *)(v6 + 32) = 0;
      uarpPlatformEndpointSendMessageCompleteInternal(v4, a2, *(void *)(v6 + 16));
    }
  }
  else
  {
    uint64_t active = uarpHtons(**(unsigned __int16 **)(v6 + 16));
    switch(active)
    {
      case 0xFFFF:
        uint64_t active = UARPLayer2VendorSpecificExceededRetries(v4, a2);
        break;
      case 3:
        uint64_t active = uarpHtonl(*(_DWORD *)(*(void *)(v6 + 16) + 6));
        switch((int)active)
        {
          case 1:
            uint64_t active = UARPLayer2ManufacturerNameResponse(v4, a2);
            break;
          case 2:
            uint64_t active = UARPLayer2ModelNameResponse(v4, a2);
            break;
          case 3:
            uint64_t active = UARPLayer2SerialNumberResponse(v4, a2);
            break;
          case 4:
            uint64_t active = UARPLayer2HardwareVersionResponse(v4, a2);
            break;
          case 5:
            uint64_t active = UARPLayer2ActiveFirmwareVersionResponse(v4, a2);
            break;
          case 6:
            uint64_t active = UARPLayer2StagedFirmwareVersionResponse(v4, a2);
            break;
          case 7:
            uint64_t active = UARPLayer2StatisticsResponse(v4, a2);
            break;
          case 8:
            uint64_t active = UARPLayer2LastErrorResponse(v4, a2);
            break;
          case 9:
            uint64_t active = UARPLayer2FriendlyNameResponse(v4, a2);
            break;
          default:
            goto LABEL_34;
        }
        break;
      case 1:
        *(_WORD *)(a2 + 48) = 0;
        uint64_t active = UARPLayer2ProtocolVersion(v4, a2);
        break;
    }
LABEL_34:
    uarpTransmitQueuePendingEntryComplete(active, a2, v6);
    uarpTransmitQueueService(v4, a2);
    return 0;
  }
  return v9;
}

uint64_t uarpTransmitQueuePendingEntryComplete(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(unsigned __int16 *)(a2 + 112);
  if (*(_WORD *)(a2 + 112))
  {
    uint64_t v4 = *(void **)(a2 + 120);
    uint64_t v5 = *(unsigned __int16 *)(a2 + 112);
    while (!*v4 || *v4 != a3)
    {
      ++v4;
      if (!--v5) {
        goto LABEL_15;
      }
    }
    *uint64_t v4 = 0;
    *(_WORD *)(a3 + 32) = 0;
    *(_DWORD *)(a3 + 28) = 0;
    uint64_t v7 = *(unsigned __int16 *)(a2 + 96);
    if (*(_WORD *)(a2 + 96))
    {
      int v8 = *(void **)(a2 + 104);
      while (*v8)
      {
        ++v8;
        if (!--v7) {
          goto LABEL_15;
        }
      }
      *int v8 = a3;
    }
LABEL_15:
    if (v3 >= 2)
    {
      uint64_t v9 = 0;
      uint64_t v10 = 8 * (v3 - 1);
      do
      {
        uint64_t v11 = *(void *)(a2 + 120);
        if (!*(void *)(v11 + v9))
        {
          *(void *)(v11 + v9) = *(void *)(v11 + v9 + 8);
          *(void *)(*(void *)(a2 + 120) + v9 + 8) = 0;
        }
        v9 += 8;
      }
      while (v10 != v9);
    }
  }
  return 0;
}

uint64_t uarpTransmitQueueProcessRecv(uint64_t a1, uint64_t a2, unsigned __int16 *a3, unsigned __int16 a4)
{
  if (*(_WORD *)(a2 + 112))
  {
    uint64_t v8 = 0;
    uint64_t v9 = (unsigned __int8 *)(a3 + 3);
    uint64_t v10 = (unsigned __int8 *)(a3 + 5);
    int v25 = a4 & 0xFFF8;
    int v11 = a4 & 0xFFF0;
    while (1)
    {
      uint64_t v12 = *(void *)(*(void *)(a2 + 120) + 8 * v8);
      if (!v12) {
        goto LABEL_38;
      }
      int v13 = uarpHtons(*a3);
      int v14 = uarpHtons(**(unsigned __int16 **)(v12 + 16));
      if (v13 == 4 && v14 == 3)
      {
        if (!v11) {
          goto LABEL_38;
        }
        int v19 = *((_DWORD *)a3 + 2);
        int v20 = *(_DWORD *)(*(void *)(v12 + 16) + 6);
        goto LABEL_37;
      }
      if (v13 == 7 && v14 == 6)
      {
        if (a4 < 0x12u) {
          goto LABEL_38;
        }
        uint64_t v18 = *(void *)(v12 + 16);
        if (a3[4] != *(unsigned __int16 *)(v18 + 6) || *(_DWORD *)v10 != *(_DWORD *)(v18 + 8)) {
          goto LABEL_38;
        }
        int v19 = a3[7];
        goto LABEL_26;
      }
      if (v13 == 11 && v14 == 10)
      {
LABEL_63:
        uint64_t v23 = UARPLayer2WatchdogCancel(a1, a2);
        uarpTransmitQueuePendingEntryComplete(v23, a2, v12);
        return 0;
      }
      if (v13 == 13 && v14 == 5)
      {
        if (a4 < 0x24u) {
          goto LABEL_38;
        }
        uint64_t v18 = *(void *)(v12 + 16);
        int v19 = a3[6];
LABEL_26:
        int v20 = *(unsigned __int16 *)(v18 + 12);
        goto LABEL_37;
      }
      if (v13 == 14 && v14 == 8) {
        goto LABEL_63;
      }
      if (v13 == 15 && v14 == 9)
      {
        if (a4 < 0xAu) {
          goto LABEL_38;
        }
        goto LABEL_36;
      }
      if (v13 == 16 && v14 == 12)
      {
        if (!v25) {
          goto LABEL_38;
        }
LABEL_36:
        int v19 = *(unsigned __int16 *)v9;
        int v20 = *(unsigned __int16 *)(*(void *)(v12 + 16) + 6);
LABEL_37:
        if (v19 == v20) {
          goto LABEL_63;
        }
        goto LABEL_38;
      }
      if (v13 == 18 && v14 == 17) {
        break;
      }
      if (v13 == 20 && v14 == 19)
      {
        if (a4 < 0xCu) {
          goto LABEL_38;
        }
        uint64_t v21 = (unsigned __int8 *)(*(void *)(v12 + 16) + 6);
        uint64_t v22 = v9;
LABEL_48:
        if (uarp4ccCompare(v22, v21)) {
          goto LABEL_63;
        }
        goto LABEL_38;
      }
      if (v13 == 22 && v14 == 21
        || v13 == 24 && v14 == 23
        || v13 == 26 && v14 == 25
        || v13 == 28 && v14 == 27
        || v13 == 30 && v14 == 29
        || v13 == 0xFFFF && v14 == 0xFFFF && UARPLayer2VendorSpecificCheckExpectedResponse(a1, a2) == 1)
      {
        goto LABEL_63;
      }
LABEL_38:
      if (++v8 >= (unint64_t)*(unsigned __int16 *)(a2 + 112)) {
        return 0;
      }
    }
    if (a4 < 0xEu) {
      goto LABEL_38;
    }
    uint64_t v21 = (unsigned __int8 *)(*(void *)(v12 + 16) + 6);
    uint64_t v22 = v10;
    goto LABEL_48;
  }
  return 0;
}

void uarpTransmitQueuesCleanup(uint64_t a1, uint64_t a2)
{
  UARPLayer2WatchdogCancel(a1, a2);
  uint64_t v4 = *(void **)(a2 + 104);
  if (v4)
  {
    unsigned int v5 = *(unsigned __int16 *)(a2 + 96);
    if (*(_WORD *)(a2 + 96))
    {
      unint64_t v6 = 0;
      do
      {
        uint64_t v7 = *(void ***)(*(void *)(a2 + 104) + 8 * v6);
        if (v7)
        {
          UARPLayer2ReturnTransmitMsgBuffer(a1, a2, *v7);
          UARPLayer2ReturnBuffer(a1, v7);
          *(void *)(*(void *)(a2 + 104) + 8 * v6) = 0;
          unsigned int v5 = *(unsigned __int16 *)(a2 + 96);
        }
        ++v6;
      }
      while (v6 < v5);
      uint64_t v4 = *(void **)(a2 + 104);
    }
    UARPLayer2ReturnBuffer(a1, v4);
    *(void *)(a2 + 104) = 0;
    *(_WORD *)(a2 + 96) = 0;
  }
  uint64_t v8 = *(void **)(a2 + 120);
  if (v8)
  {
    unsigned int v9 = *(unsigned __int16 *)(a2 + 112);
    if (*(_WORD *)(a2 + 112))
    {
      unint64_t v10 = 0;
      do
      {
        int v11 = *(void ***)(*(void *)(a2 + 120) + 8 * v10);
        if (v11)
        {
          UARPLayer2ReturnTransmitMsgBuffer(a1, a2, *v11);
          UARPLayer2ReturnBuffer(a1, v11);
          *(void *)(*(void *)(a2 + 120) + 8 * v10) = 0;
          unsigned int v9 = *(unsigned __int16 *)(a2 + 112);
        }
        ++v10;
      }
      while (v10 < v9);
      uint64_t v8 = *(void **)(a2 + 120);
    }
    UARPLayer2ReturnBuffer(a1, v8);
    *(void *)(a2 + 120) = 0;
    *(_WORD *)(a2 + 112) = 0;
  }
}

uint64_t uarpPlatformEndpointIsMessageTypePending(uint64_t a1, uint64_t a2, int a3)
{
  if (!*(_WORD *)(a2 + 112)) {
    return 0;
  }
  uint64_t v5 = 0;
  while (1)
  {
    uint64_t v6 = *(void *)(*(void *)(a2 + 120) + 8 * v5);
    if (v6)
    {
      if (uarpHtons(**(unsigned __int16 **)(v6 + 16)) == a3
        && *(unsigned char *)(*(void *)(*(void *)(a2 + 120) + 8 * v5) + 33) != 1)
      {
        break;
      }
    }
    if (++v5 >= (unint64_t)*(unsigned __int16 *)(a2 + 112)) {
      return 0;
    }
  }
  return 1;
}

void uarpTransmitQueueAssetRescinded(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 && *(_WORD *)(a2 + 112))
  {
    unint64_t v5 = 0;
    do
    {
      uint64_t v6 = *(void *)(*(void *)(a2 + 120) + 8 * v5);
      if (v6)
      {
        if (uarpHtons(**(unsigned __int16 **)(v6 + 16)) == 6)
        {
          int v7 = uarpHtons(*(unsigned __int16 *)(*(void *)(v6 + 16) + 6));
          if (!a3 || v7 == *(unsigned __int16 *)(a3 + 44)) {
            *(unsigned char *)(v6 + 33) = 1;
          }
        }
      }
      ++v5;
    }
    while (v5 < *(unsigned __int16 *)(a2 + 112));
  }
}

void *uarpAvailableTransmitBuffer(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v3 = *(unsigned __int16 *)(a2 + 96);
  if (!*(_WORD *)(a2 + 96)) {
    return 0;
  }
  for (uint64_t i = *(_DWORD ***)(a2 + 104); ; ++i)
  {
    uint64_t v8 = *i;
    if (*i) {
      break;
    }
    if (!--v3) {
      return 0;
    }
  }
  *uint64_t i = 0;
  if (v8[6] >= a3) {
    return v8;
  }
  UARPLayer2ReturnTransmitMsgBuffer(a1, a2, v8);
  return uarpAllocateTransmitBuffer2(a1, a2, a3);
}

char *uarpAssetTagSysconfig4cc()
{
  uint64_t result = uarpAssetTagSysconfig4cc_assetTag;
  uarpAssetTagSysconfig4cc_assetTag[4] = 0;
  return result;
}

uint64_t uarpAssetTagSysconfig()
{
  uarpAssetTagSysconfig4cc_assetTag[4] = 0;
  return uarpPayloadTagPack((unsigned int *)uarpAssetTagSysconfig4cc_assetTag);
}

int *uarpAssetTagStructSysconfig()
{
  uarpAssetTagSysconfig4cc_assetTag[4] = 0;
  uint64_t result = &uarpAssetTagStructSysconfig_myTag;
  uarpAssetTagStructSysconfig_myTag = *(_DWORD *)uarpAssetTagSysconfig4cc_assetTag;
  return result;
}

__int16 *uarpOuiSysconfig()
{
  uint64_t result = &uarpOuiSysconfig_myOui;
  uarpOuiSysconfig_myOuuint64_t i = -22144;
  byte_267D27DDA = -105;
  return result;
}

uint64_t UARPSuperBinarySetupHeader(uint64_t a1, uint64_t a2, unsigned int a3, _OWORD *a4, int a5)
{
  unsigned int v9 = (void *)uarpPlatformAssetFindByAssetContextAndList(a1, a2, 1);
  uint64_t result = 30;
  if (a3 >= 2)
  {
    if (v9)
    {
      memset(v14, 0, 44);
      uarpZero(v14, 0x2CuLL);
      *(void *)&v14[0] = 0x2C00000002;
      *(_OWORD *)((char *)v14 + 12) = *a4;
      DWORD1(v14[2]) = 44;
      DWORD2(v14[2]) = 40 * a5;
      HIDWORD(v14[1]) = 40 * a5 + 44;
      DWORD2(v14[0]) = HIDWORD(v14[1]);
      uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0, v9, (uint64_t)v14, 44, 0);
      if (!result)
      {
        if (a5)
        {
          uint64_t v11 = 44;
          while (1)
          {
            uint64_t v13 = 0;
            memset(v12, 0, sizeof(v12));
            uarpZero(v12, 0x28uLL);
            LODWORD(v12[0]) = 40;
            uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0, v9, (uint64_t)v12, 40, v11);
            if (result) {
              break;
            }
            uint64_t v11 = (v11 + 40);
            if (!--a5) {
              return 0;
            }
          }
        }
        else
        {
          return 0;
        }
      }
    }
  }
  return result;
}

uint64_t UARPSuperBinaryAddMetaData(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4, uint64_t a5)
{
  uint64_t v9 = uarpPlatformAssetFindByAssetContextAndList(a1, a2, 1);
  if (!v9) {
    return 30;
  }
  unint64_t v10 = (void *)v9;
  unsigned int __dst = 0;
  LOWORD(v18[0]) = 0;
  LODWORD(result) = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0, v9, &__dst, 4, 0, (unsigned __int16 *)v18);
  int v12 = result;
  if (LOWORD(v18[0]) == 4) {
    unsigned int v13 = 0;
  }
  else {
    unsigned int v13 = 11;
  }
  if (result) {
    uint64_t result = result;
  }
  else {
    uint64_t result = v13;
  }
  if (v12 || LOWORD(v18[0]) != 4) {
    return result;
  }
  if (__dst < 2) {
    return 30;
  }
  memset(v18, 0, 44);
  unsigned __int16 v17 = 0;
  uint64_t result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0, (uint64_t)v10, v18, 44, 0, &v17);
  if (!result)
  {
    if (v17 == 44)
    {
      uint64_t v14 = (LODWORD(v18[2]) + HIDWORD(v18[1]));
      v16[0] = uarpHtonl(a3);
      v16[1] = uarpHtonl(a4);
      uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0, v10, (uint64_t)v16, 8, v14);
      if (!result)
      {
        LODWORD(v18[2]) += 8;
        DWORD2(v18[0]) += 8;
        uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0, v10, a5, (unsigned __int16)a4, (HIDWORD(v18[1]) + LODWORD(v18[2])));
        if (!result)
        {
          LODWORD(v18[2]) += (unsigned __int16)a4;
          DWORD2(v18[0]) += (unsigned __int16)a4;
          return uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0, v10, (uint64_t)v18, 44, 0);
        }
      }
    }
    else
    {
      return 11;
    }
  }
  return result;
}

uint64_t UARPSuperBinaryPreparePayload(uint64_t a1, uint64_t a2, int a3, unsigned int *a4, _OWORD *a5)
{
  uint64_t v9 = uarpPlatformAssetFindByAssetContextAndList(a1, a2, 1);
  if (!v9) {
    return 30;
  }
  unint64_t v10 = (void *)v9;
  unsigned int __dst = 0;
  LOWORD(v16[0]) = 0;
  LODWORD(result) = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0, v9, &__dst, 4, 0, (unsigned __int16 *)v16);
  int v12 = result;
  if (LOWORD(v16[0]) == 4) {
    unsigned int v13 = 0;
  }
  else {
    unsigned int v13 = 11;
  }
  if (result) {
    uint64_t result = result;
  }
  else {
    uint64_t result = v13;
  }
  if (v12 || LOWORD(v16[0]) != 4) {
    return result;
  }
  if (__dst < 2) {
    return 30;
  }
  unsigned __int16 v19 = 0;
  uint64_t v18 = 0;
  memset(v17, 0, sizeof(v17));
  memset(v16, 0, 44);
  uint64_t result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0, (uint64_t)v10, v16, 44, 0, &v19);
  if (!result)
  {
    if (v19 != 44) {
      return 11;
    }
    uint64_t v14 = (DWORD1(v16[2]) + 40 * a3);
    uint64_t result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0, (uint64_t)v10, v17, 40, v14, &v19);
    if (!result)
    {
      if (v19 == 40)
      {
        DWORD1(v17[0]) = uarpPayloadTagPack(a4);
        *(_OWORD *)((char *)v17 + 8) = *a5;
        return uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0, v10, (uint64_t)v17, 40, v14);
      }
      return 11;
    }
  }
  return result;
}

uint64_t UARPSuperBinaryAddPayloadMetaData(uint64_t a1, uint64_t a2, int a3, unsigned int a4, unsigned int a5, uint64_t a6)
{
  uint64_t v11 = uarpPlatformAssetFindByAssetContextAndList(a1, a2, 1);
  if (!v11) {
    return 30;
  }
  int v12 = (void *)v11;
  unsigned int __dst = 0;
  LOWORD(v21[0]) = 0;
  LODWORD(result) = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0, v11, &__dst, 4, 0, (unsigned __int16 *)v21);
  int v14 = result;
  if (LOWORD(v21[0]) == 4) {
    unsigned int v15 = 0;
  }
  else {
    unsigned int v15 = 11;
  }
  if (result) {
    uint64_t result = result;
  }
  else {
    uint64_t result = v15;
  }
  if (v14 || LOWORD(v21[0]) != 4) {
    return result;
  }
  if (__dst < 2) {
    return 30;
  }
  unsigned __int16 v25 = 0;
  uint64_t v24 = 0;
  long long v22 = 0u;
  long long v23 = 0u;
  memset(v21, 0, 44);
  uint64_t result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0, (uint64_t)v12, v21, 44, 0, &v25);
  if (result) {
    return result;
  }
  if (v25 != 44) {
    return 11;
  }
  uint64_t v16 = (DWORD1(v21[2]) + 40 * a3);
  uint64_t result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0, (uint64_t)v12, &v22, 40, v16, &v25);
  if (result) {
    return result;
  }
  if (v25 != 40) {
    return 11;
  }
  int v17 = DWORD2(v23);
  if (!DWORD2(v23))
  {
    int v17 = DWORD2(v21[0]);
    DWORD2(v23) = DWORD2(v21[0]);
  }
  uint64_t v18 = (HIDWORD(v23) + v17);
  v20[0] = uarpHtonl(a4);
  v20[1] = uarpHtonl(a5);
  uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0, v12, (uint64_t)v20, 8, v18);
  if (!result)
  {
    HIDWORD(v23) += 8;
    DWORD2(v21[0]) += 8;
    uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0, v12, a6, (unsigned __int16)a5, (DWORD2(v23) + HIDWORD(v23)));
    if (!result)
    {
      HIDWORD(v23) += (unsigned __int16)a5;
      DWORD2(v21[0]) += (unsigned __int16)a5;
      uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0, v12, (uint64_t)&v22, 40, v16);
      if (!result) {
        return uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0, v12, (uint64_t)v21, 44, 0);
      }
    }
  }
  return result;
}

uint64_t UARPSuperBinaryAddPayloadDataLarge(uint64_t a1, uint64_t a2, int a3, uint64_t a4, unsigned int a5)
{
  unsigned int v10 = 0;
  while (a5)
  {
    if (a5 >= 0xFFFF) {
      unsigned int v11 = 0xFFFF;
    }
    else {
      unsigned int v11 = a5;
    }
    uint64_t result = UARPSuperBinaryAddPayloadData(a1, a2, a3, a4 + v10, v11);
    v10 += v11;
    a5 -= v11;
    if (result) {
      return result;
    }
  }
  return 0;
}

uint64_t UARPSuperBinaryAddPayloadData(uint64_t a1, uint64_t a2, int a3, uint64_t a4, unsigned int a5)
{
  if (HIWORD(a5)) {
    return 39;
  }
  uint64_t v9 = uarpPlatformAssetFindByAssetContextAndList(a1, a2, 1);
  if (!v9) {
    return 30;
  }
  unsigned int v10 = (void *)v9;
  unsigned int __dst = 0;
  LOWORD(v17[0]) = 0;
  LODWORD(result) = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0, v9, &__dst, 4, 0, (unsigned __int16 *)v17);
  int v12 = result;
  if (LOWORD(v17[0]) == 4) {
    unsigned int v13 = 0;
  }
  else {
    unsigned int v13 = 11;
  }
  if (result) {
    uint64_t result = result;
  }
  else {
    uint64_t result = v13;
  }
  if (v12 || LOWORD(v17[0]) != 4) {
    return result;
  }
  if (__dst < 2) {
    return 30;
  }
  unsigned __int16 v20 = 0;
  uint64_t v19 = 0;
  memset(v18, 0, sizeof(v18));
  memset(v17, 0, 44);
  uint64_t result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0, (uint64_t)v10, v17, 44, 0, &v20);
  if (result) {
    return result;
  }
  if (v20 != 44) {
    return 11;
  }
  uint64_t v14 = (DWORD1(v17[2]) + 40 * a3);
  uint64_t result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0, (uint64_t)v10, v18, 40, v14, &v20);
  if (result) {
    return result;
  }
  if (v20 != 40) {
    return 11;
  }
  int v15 = v19;
  if (!v19)
  {
    int v15 = DWORD2(v17[0]);
    LODWORD(v19) = DWORD2(v17[0]);
  }
  uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0, v10, a4, (unsigned __int16)a5, (HIDWORD(v19) + v15));
  if (!result)
  {
    HIDWORD(v19) += a5;
    DWORD2(v17[0]) += a5;
    uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0, v10, (uint64_t)v18, 40, v14);
    if (!result) {
      return uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0, v10, (uint64_t)v17, 44, 0);
    }
  }
  return result;
}

uint64_t UARPSuperBinaryFinalizeHeader(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = uarpPlatformAssetFindByAssetContextAndList(a1, a2, 1);
  if (!v3) {
    return 30;
  }
  uint64_t v4 = v3;
  unsigned __int16 v12 = 0;
  unsigned int __dst = 0;
  uint64_t result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0, v3, &__dst, 4, 0, &v12);
  if (result) {
    return result;
  }
  if (v12 != 4) {
    return 11;
  }
  if (__dst < 2) {
    return 30;
  }
  unsigned __int16 v16 = 0;
  uint64_t v15 = 0;
  memset(v14, 0, sizeof(v14));
  memset(v13, 0, 44);
  uint64_t result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0, v4, v13, 44, 0, &v16);
  if (result) {
    return result;
  }
  if (v16 != 44) {
    return 11;
  }
  long long v6 = v13[0];
  long long v7 = v13[1];
  *(_OWORD *)(v4 + 28) = *(_OWORD *)((char *)&v13[1] + 12);
  *(_OWORD *)uint64_t v4 = v6;
  *(_OWORD *)(v4 + 16) = v7;
  uarpSuperBinaryHeaderEndianSwap((unsigned int *)v13, v13);
  uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0, (void *)v4, (uint64_t)v13, 44, 0);
  if (!result)
  {
    unsigned int v8 = *(_DWORD *)(v4 + 40);
    if (v8 >= 0x28)
    {
      unsigned int v9 = v8 / 0x28;
      uint64_t v10 = *(unsigned int *)(v4 + 36);
      do
      {
        uint64_t result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0, v4, v14, 40, v10, &v16);
        if (result) {
          break;
        }
        if (v16 != 40) {
          return 11;
        }
        uarpPayloadHeaderEndianSwap((unsigned int *)v14, v14);
        uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0, (void *)v4, (uint64_t)v14, 40, v10);
        if (result) {
          break;
        }
        uint64_t v10 = (v10 + 40);
        --v9;
      }
      while (v9);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t uarpSuperBinaryHeaderEndianSwap(unsigned int *a1, _DWORD *a2)
{
  *a2 = uarpHtonl(*a1);
  a2[1] = uarpHtonl(a1[1]);
  a2[2] = uarpHtonl(a1[2]);
  a2[3] = uarpHtonl(a1[3]);
  a2[4] = uarpHtonl(a1[4]);
  a2[5] = uarpHtonl(a1[5]);
  a2[6] = uarpHtonl(a1[6]);
  a2[7] = uarpHtonl(a1[7]);
  a2[8] = uarpHtonl(a1[8]);
  a2[9] = uarpHtonl(a1[9]);
  uint64_t result = uarpHtonl(a1[10]);
  a2[10] = result;
  return result;
}

uint64_t uarpPayloadHeaderEndianSwap(unsigned int *a1, _DWORD *a2)
{
  *a2 = uarpHtonl(*a1);
  a2[2] = uarpHtonl(a1[2]);
  a2[3] = uarpHtonl(a1[3]);
  a2[4] = uarpHtonl(a1[4]);
  a2[5] = uarpHtonl(a1[5]);
  a2[6] = uarpHtonl(a1[6]);
  a2[7] = uarpHtonl(a1[7]);
  a2[8] = uarpHtonl(a1[8]);
  uint64_t result = uarpHtonl(a1[9]);
  a2[9] = result;
  return result;
}

uint64_t uarpPayloadHeader2EndianSwap(unsigned int *a1, _DWORD *a2)
{
  *a2 = uarpHtonl(*a1);
  uarpVersionEndianSwap(a1 + 2, a2 + 2);
  a2[6] = uarpHtonl(a1[6]);
  a2[7] = uarpHtonl(a1[7]);
  a2[8] = uarpHtonl(a1[8]);
  uint64_t result = uarpHtonl(a1[9]);
  a2[9] = result;
  return result;
}

uint64_t UARPSuperBinaryQueryAssetLength(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  memset(__dst, 0, 44);
  unsigned __int16 v5 = 0;
  uint64_t result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0, a2, __dst, 44, 0, &v5);
  if (!result)
  {
    if (v5 == 44)
    {
      uarpSuperBinaryHeaderEndianSwap((unsigned int *)__dst, __dst);
      uint64_t result = 0;
      *a3 = DWORD2(__dst[0]);
    }
    else
    {
      return 11;
    }
  }
  return result;
}

uint64_t UARPSuperBinaryPrepareDynamicAsset(int a1, char *a2, uint64_t a3, uint64_t a4, int a5)
{
  *(void *)(a2 + 12) = a3;
  *(void *)(a2 + 20) = a4;
  *((_DWORD *)a2 + 2) = 44;
  *(void *)a2 = 0x2C00000002;
  *(_OWORD *)(a2 + 28) = xmmword_21E105110;
  *((_DWORD *)a2 + 12) = a5;
  *((_DWORD *)a2 + 112) = 0;
  *((void *)a2 + 79) = 0;
  *((void *)a2 + 90) = 0;
  *((_OWORD *)a2 + 42) = 0u;
  return 0;
}

uint64_t UARPSuperBinaryAddSuperBinaryMetaData(uint64_t a1, uint64_t a2, int a3, unsigned int a4, const void *a5)
{
  uint64_t v13 = 0;
  size_t v9 = a4;
  UARPLayer2RequestBuffer(a1, &v13, a4 + 24);
  uint64_t v10 = v13;
  unsigned int v11 = (void *)(v13 + 24);
  *(void *)(v13 + 8) = v13 + 24;
  *(_DWORD *)uint64_t v10 = a3;
  *(_DWORD *)(v10 + 4) = a4;
  memcpy(v11, a5, v9);
  *(void *)(v10 + 16) = *(void *)(a2 + 720);
  *(void *)(a2 + 720) = v10;
  *(_DWORD *)(a2 + 8) += a4 + 8;
  *(_DWORD *)(a2 + 32) += a4 + 8;
  *(_WORD *)(a2 + 46) |= 0x80u;
  return 0;
}

uint64_t UARPSuperBinaryAddPayload(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5, uint64_t a6, const void *a7, unsigned int a8)
{
  return 0;
}

uint64_t UARPSuperBinaryAddPayload2(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5, uint64_t a6, const void *a7, unsigned int a8, char a9)
{
  uint64_t v21 = 0;
  UARPLayer2RequestBuffer(a1, &v21, 0xB8u);
  unsigned __int16 v16 = v21;
  *((void *)v21 + 22) = *(void *)(a2 + 632);
  *(void *)(a2 + 632) = v16;
  uarpZero(v16, 0x28uLL);
  _DWORD *v16 = 40;
  v16[1] = a4;
  *((void *)v16 + 1) = a5;
  *((void *)v16 + 2) = a6;
  v16[9] = a8;
  v16[7] = 0;
  v16[31] = a3;
  if (!a9)
  {
    unsigned __int16 v20 = 0;
    UARPLayer2RequestBuffer(a1, &v20, a8);
    int v17 = v20;
    *((void *)v16 + 17) = v20;
    memcpy(v17, a7, a8);
  }
  *((unsigned char *)v16 + 148) = a9;
  v16[36] = a8;
  *((void *)v16 + 21) = 0;
  *(_DWORD *)(a2 + 8) += a8 + 40;
  *(_DWORD *)(a2 + 40) += 40;
  *(_DWORD *)(a2 + 28) += 40;
  ++*(_DWORD *)(a2 + 448);
  return 0;
}

uint64_t UARPSuperBinaryAppendPayloadMetaData(uint64_t a1, uint64_t a2, int a3, int a4, unsigned int a5, const void *a6)
{
  unsigned int v6 = *(_DWORD *)(a2 + 448);
  uint64_t v7 = *(void *)(a2 + 632);
  if (v6) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8) {
    return 11;
  }
  unsigned int v14 = 1;
  while (*(_DWORD *)(v7 + 124) != a3)
  {
    uint64_t v9 = 11;
    if (v14 < v6)
    {
      uint64_t v7 = *(void *)(v7 + 176);
      ++v14;
      if (v7) {
        continue;
      }
    }
    return v9;
  }
  uint64_t v18 = 0;
  UARPLayer2RequestBuffer(a1, &v18, a5 + 24);
  uint64_t v15 = v18;
  unsigned __int16 v16 = (void *)(v18 + 24);
  *(void *)(v18 + 8) = v18 + 24;
  *(_DWORD *)uint64_t v15 = a4;
  *(_DWORD *)(v15 + 4) = a5;
  memcpy(v16, a6, a5);
  uint64_t v9 = 0;
  *(void *)(v15 + 16) = *(void *)(v7 + 168);
  *(void *)(v7 + 168) = v15;
  *(_DWORD *)(v7 + 28) += a5 + 8;
  *(_DWORD *)(a2 + 8) += a5 + 8;
  *(_DWORD *)(a2 + 684) += a5 + 8;
  *(_WORD *)(a2 + 46) |= 8u;
  return v9;
}

uint64_t UARPSuperBinaryAppendPayloadMetaDataBlob(uint64_t a1, uint64_t a2, int a3, const void *a4, unsigned int a5)
{
  unsigned int v5 = *(_DWORD *)(a2 + 448);
  uint64_t v6 = *(void *)(a2 + 632);
  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7) {
    return 11;
  }
  unsigned int v12 = 1;
  uint64_t result = 11;
  while (*(_DWORD *)(v6 + 124) != a3)
  {
    if (v12 < v5)
    {
      uint64_t v6 = *(void *)(v6 + 176);
      ++v12;
      if (v6) {
        continue;
      }
    }
    return result;
  }
  if (*(void *)(v6 + 152)) {
    return 27;
  }
  UARPLayer2ReturnBuffer(a1, 0);
  *(void *)(v6 + 152) = 0;
  *(_DWORD *)(v6 + 160) = 0;
  UARPLayer2RequestBuffer(a1, 0, a5);
  memcpy(*(void **)(v6 + 152), a4, a5);
  uint64_t result = 0;
  *(_DWORD *)(v6 + 160) = a5;
  *(_DWORD *)(v6 + 28) += a5;
  *(_DWORD *)(a2 + 8) += a5;
  *(_DWORD *)(a2 + 684) += a5;
  *(_WORD *)(a2 + 46) |= 8u;
  return result;
}

uint64_t UARPSuperBinaryBuildMetaData(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t **a4, unsigned int a5, unsigned int *a6)
{
  unsigned int v8 = *a6;
  uint64_t v9 = *a4;
  if (a3)
  {
    uint64_t v11 = a3;
    while (1)
    {
      unsigned int v12 = uarpHtonl(*(_DWORD *)v11);
      uint64_t v13 = uarpHtonl(*(_DWORD *)(v11 + 4));
      v8 += *(_DWORD *)(v11 + 4) + 8;
      if (v8 > a5) {
        return 11;
      }
      unint64_t *v9 = v12 | (unint64_t)(v13 << 32);
      unsigned int v14 = (char *)(v9 + 1);
      memcpy(v14, *(const void **)(v11 + 8), *(unsigned int *)(v11 + 4));
      uint64_t v9 = (unint64_t *)&v14[*(unsigned int *)(v11 + 4)];
      uint64_t v11 = *(void *)(v11 + 16);
      if (!v11) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    uint64_t result = 0;
    *a6 = v8;
    *a4 = v9;
  }
  return result;
}

uint64_t UARPSuperBinaryFinalizeDynamicAsset(uint64_t a1, uint64_t a2)
{
  uarpSuperBinaryHeaderEndianSwap((unsigned int *)a2, (_DWORD *)a2);
  uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0, (void *)a2, a2, 44, 0);
  if (!result)
  {
    uarpSuperBinaryHeaderEndianSwap((unsigned int *)a2, (_DWORD *)a2);
    uint64_t v5 = *(unsigned int *)(a2 + 4);
    unsigned int v6 = *(_DWORD *)(a2 + 32);
    BOOL v7 = (uint64_t *)(a2 + 632);
    unsigned int v8 = *(_DWORD *)(a2 + 448);
    if (v8)
    {
      unsigned int v9 = 0;
      unsigned int v10 = *(_DWORD *)(a2 + 40) + v5 + v6;
      unsigned int v11 = v10 + *(_DWORD *)(a2 + 684);
      unsigned int v12 = (unsigned int **)(a2 + 632);
      while (1)
      {
        uint64_t v13 = *v12;
        v13[6] = v10;
        v13[8] = v11;
        uarpPayloadHeader2EndianSwap(v13, v13);
        uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0, (void *)a2, (uint64_t)v13, 40, v5);
        if (result) {
          break;
        }
        uarpPayloadHeader2EndianSwap(v13, v13);
        uint64_t v5 = *v13 + v5;
        v10 += v13[7];
        v11 += v13[9];
        unsigned int v12 = (unsigned int **)(v13 + 44);
        ++v9;
        unsigned int v8 = *(_DWORD *)(a2 + 448);
        if (v9 >= v8)
        {
          unsigned int v6 = *(_DWORD *)(a2 + 32);
          goto LABEL_8;
        }
      }
    }
    else
    {
LABEL_8:
      if (v6)
      {
        unsigned int __dst = 0;
        unsigned int v28 = 0;
        uint64_t result = UARPLayer2RequestBuffer(a1, &__dst, v6);
        if (result) {
          return result;
        }
        unsigned int v27 = (unint64_t *)__dst;
        uint64_t result = UARPSuperBinaryBuildMetaData(result, v14, *(void *)(a2 + 720), &v27, *(_DWORD *)(a2 + 32), &v28);
        if (result) {
          return result;
        }
        uint64_t v15 = __dst;
        *(void *)(a2 + 672) = __dst;
        unsigned int v16 = v28;
        *(_DWORD *)(a2 + 680) = v28;
        uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0, (void *)a2, (uint64_t)v15, (unsigned __int16)v16, v5);
        if (result) {
          return result;
        }
        uint64_t v5 = v16 + v5;
        unsigned int v8 = *(_DWORD *)(a2 + 448);
      }
      if (!v8) {
        return 0;
      }
      unsigned int v17 = 0;
      uint64_t v18 = a2 + 632;
      do
      {
        uint64_t v19 = *(void *)v18;
        unsigned int v20 = *(_DWORD *)(*(void *)v18 + 28);
        if (v20)
        {
          unsigned int __dst = 0;
          unsigned int v28 = 0;
          uint64_t result = UARPLayer2RequestBuffer(a1, &__dst, v20);
          if (result) {
            return result;
          }
          uint64_t v21 = __dst;
          unsigned int v27 = (unint64_t *)__dst;
          long long v22 = *(const void **)(v19 + 152);
          if (v22)
          {
            uint64_t v21 = memcpy(__dst, v22, *(unsigned int *)(v19 + 160));
            unsigned int v28 = *(_DWORD *)(v19 + 160);
          }
          uint64_t result = UARPSuperBinaryBuildMetaData((uint64_t)v21, (uint64_t)v22, *(void *)(v19 + 168), &v27, *(_DWORD *)(v19 + 28), &v28);
          if (result) {
            return result;
          }
          long long v23 = __dst;
          *(void *)(v19 + 152) = __dst;
          unsigned int v24 = v28;
          *(_DWORD *)(v19 + 160) = v28;
          uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0, (void *)a2, (uint64_t)v23, (unsigned __int16)v24, v5);
          if (result) {
            return result;
          }
          uint64_t v5 = v24 + v5;
          unsigned int v8 = *(_DWORD *)(a2 + 448);
        }
        uint64_t v18 = v19 + 176;
        ++v17;
      }
      while (v17 < v8);
      if (v8)
      {
        for (unsigned int i = 0; i < v8; ++i)
        {
          uint64_t v26 = *v7;
          if (!*(unsigned char *)(v26 + 148))
          {
            uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0, (void *)a2, *(void *)(v26 + 136), *(unsigned __int16 *)(v26 + 144), v5);
            if (result) {
              return result;
            }
            unsigned int v8 = *(_DWORD *)(a2 + 448);
          }
          uint64_t result = 0;
          uint64_t v5 = (*(_DWORD *)(v26 + 144) + v5);
          BOOL v7 = (uint64_t *)(v26 + 176);
        }
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t UARPSuperBinaryGetInternalSuperBinaryMetaData(int a1, uint64_t a2, void *__dst, unsigned int a4, unsigned int a5, unsigned __int16 *a6)
{
  int v7 = *(_DWORD *)(a2 + 32);
  if (v7
    && ((v8 = *(_DWORD *)(a2 + 28), v9 = v7 + v8, BOOL v10 = a5 >= v8, v11 = a5 - v8, v10) ? (v12 = v9 > a5) : (v12 = 0), v12))
  {
    unsigned __int16 v15 = v7 - v11;
    if (a4 >= v15) {
      unsigned __int16 v13 = v15;
    }
    else {
      unsigned __int16 v13 = a4;
    }
    memcpy(__dst, (const void *)(*(void *)(a2 + 672) + v11), v13);
    uint64_t result = 0;
  }
  else
  {
    unsigned __int16 v13 = 0;
    uint64_t result = 40;
  }
  *a6 = v13;
  return result;
}

uint64_t UARPSuperBinaryGetInternalPayloadMetaData(int a1, uint64_t a2, void *__dst, unsigned int a4, unsigned int a5, unsigned __int16 *a6)
{
  uint64_t v7 = *(void *)(a2 + 632);
  if (!v7)
  {
LABEL_9:
    unsigned __int16 v14 = 0;
    uint64_t result = 40;
    goto LABEL_14;
  }
  while (1)
  {
    int v8 = *(_DWORD *)(v7 + 28);
    if (v8) {
      break;
    }
LABEL_8:
    if (!v7) {
      goto LABEL_9;
    }
  }
  unsigned int v9 = *(_DWORD *)(v7 + 24);
  unsigned int v10 = v8 + v9;
  BOOL v11 = a5 >= v9;
  uint64_t v12 = a5 - v9;
  if (!v11 || v10 <= a5)
  {
    uint64_t v7 = *(void *)(v7 + 176);
    goto LABEL_8;
  }
  unsigned __int16 v16 = v8 - v12;
  if (a4 >= v16) {
    unsigned __int16 v14 = v16;
  }
  else {
    unsigned __int16 v14 = a4;
  }
  memcpy(__dst, (const void *)(*(void *)(v7 + 152) + v12), v14);
  uint64_t result = 0;
LABEL_14:
  *a6 = v14;
  return result;
}

uint64_t uarpPlatformEndpointInit2(char *a1, uint64_t a2, unsigned int a3, long long *a4, const void *a5, uint64_t a6)
{
  return uarpPlatformEndpointInit(a1, a2, a3, a4, a5, a6, 0);
}

uint64_t uarpPlatformEndpointInit(char *a1, uint64_t a2, unsigned int a3, long long *a4, const void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t result = 30;
  if (a3 <= 2 && a2 && a1 && a4 && a5)
  {
    uarpZero(a1, 0x260uLL);
    memcpy(a1 + 48, a5, 0x1F0uLL);
    *((void *)a1 + 68) = a2;
    *((void *)a1 + 5) = a6;
    *((_DWORD *)a1 + 144) = 1;
    *((void *)a1 + 74) = a7;
    long long v16 = *a4;
    long long v15 = a4[1];
    *((_DWORD *)a1 + 8) = *((_DWORD *)a4 + 8);
    *(_OWORD *)a1 = v16;
    *((_OWORD *)a1 + 1) = v15;
    if (!*((_WORD *)a1 + 6)) {
      *((_WORD *)a1 + 6) = 4;
    }
    uint64_t result = 0;
    *((_DWORD *)a1 + 138) = a3;
    a1[580] = 0;
    *((_DWORD *)a1 + 146) = 1;
    *((_WORD *)a1 + 300) = 1;
  }
  return result;
}

uint64_t uarpPlatformRemoteEndpointAdd(uint64_t a1, uint64_t a2, long long *a3, uint64_t a4)
{
  uint64_t result = 30;
  if (a1)
  {
    if (a2)
    {
      if (a4)
      {
        *(void *)(a2 + 40) = a4;
        long long v7 = *(_OWORD *)a1;
        long long v8 = *(_OWORD *)(a1 + 16);
        *(_DWORD *)(a2 + 32) = *(_DWORD *)(a1 + 32);
        *(_OWORD *)a2 = v7;
        *(_OWORD *)(a2 + 16) = v8;
        if (!a3
          || (long long v10 = *a3,
              long long v9 = a3[1],
              *(_DWORD *)(a2 + 32) = *((_DWORD *)a3 + 8),
              *(_OWORD *)a2 = v10,
              *(_OWORD *)(a2 + 16) = v9,
              (unsigned int v11 = *(_DWORD *)(a2 + 4)) != 0)
          && *(_DWORD *)a2
          && *(_DWORD *)(a2 + 8) >= v11)
        {
          if (!*(_WORD *)(a2 + 12)) {
            *(_WORD *)(a2 + 12) = *(_WORD *)(a1 + 12);
          }
          *(_WORD *)(a2 + 48) = 0;
          int v12 = *(_DWORD *)(a1 + 584);
          *(_DWORD *)(a1 + 584) = v12 + 1;
          *(_DWORD *)(a2 + 52) = v12;
          *(unsigned char *)(a2 + 56) = 1;
          *(_DWORD *)(a2 + 58) = 1;
          if (!*(_WORD *)(a2 + 28)
            || (uint64_t result = UARPLayer2RequestBuffer(a1, (void *)(a2 + 80), 4 * *(unsigned __int16 *)(a2 + 28)), !result))
          {
            uint64_t result = uarpPlatformRemoteEndpointAddEntry(a1, a2);
            if (!result)
            {
              int v13 = *(unsigned __int16 *)(a2 + 20);
              if (!*(_WORD *)(a2 + 20))
              {
                int v13 = 1;
                *(_WORD *)(a2 + 20) = 1;
              }
              *(_WORD *)(a2 + 96) = v13;
              uint64_t result = UARPLayer2RequestBuffer(a1, (void *)(a2 + 104), 8 * v13);
              if (!result)
              {
                if (*(_WORD *)(a2 + 96))
                {
                  unint64_t v14 = 0;
                  do
                    *(void *)(*(void *)(a2 + 104) + 8 * v14++) = uarpAllocateTransmitBuffer2(a1, a2, 0);
                  while (v14 < *(unsigned __int16 *)(a2 + 96));
                }
                int v15 = *(unsigned __int16 *)(a2 + 20);
                *(_WORD *)(a2 + 112) = v15;
                uint64_t result = UARPLayer2RequestBuffer(a1, (void *)(a2 + 120), 8 * v15);
                if (!result)
                {
                  if ((*(_DWORD *)(a1 + 552) - 1) > 1) {
                    return 0;
                  }
                  uint64_t result = uarpPlatformEndpointSendSyncMsg(a1, a2);
                  if (!result)
                  {
                    if (*(_DWORD *)(a1 + 552) != 2) {
                      return 0;
                    }
                    uint64_t result = uarpSendVersionDiscoveryRequest(a1, a2, *(unsigned __int16 *)(a2 + 12));
                    if (!result) {
                      return 0;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t uarpPlatformRemoteEndpointRemove(uint64_t a1, uint64_t a2)
{
  uint64_t result = 30;
  if (a1 && a2)
  {
    uarpTransmitQueuesCleanup(a1, a2);
    uarpPlatformCleanupAssetsForRemoteEndpoint(a1, a2, 1);
    uint64_t v5 = *(unsigned int *)(a1 + 556);
    if (v5)
    {
      uint64_t v6 = 0;
      uint64_t v7 = 8 * v5;
      do
      {
        uint64_t v8 = *(void *)(a1 + 560);
        if (*(void *)(v8 + v6) == a2) {
          *(void *)(v8 + v6) = 0;
        }
        v6 += 8;
      }
      while (v7 != v6);
    }
    uarpPlatformEndpointStreamingRecvDeinit(a1, a2);
    UARPLayer2ReturnBuffer(a1, *(void **)(a2 + 80));
    uint64_t result = 0;
    *(void *)(a2 + 80) = 0;
  }
  return result;
}

uint64_t uarpPlatformEndpointRequestInfoProperty(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (a1 && a2 && a3 - 10 >= 0xFFFFFFF7) {
    return uarpSendInformationRequest(a1, a2, a3);
  }
  else {
    return 30;
  }
}

uint64_t uarpPlatformEndpointAssetIsAcceptable(void *a1, uint64_t a2, unsigned char *a3, __int16 *a4)
{
  uint64_t ActiveFirmwareVersion = 30;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        if (a4)
        {
          *a3 = 1;
          *a4 = 0;
          v16[0] = 0;
          v16[1] = 0;
          uint64_t ActiveFirmwareVersion = uarpPlatformEndpointQueryActiveFirmwareVersion(a1, a2, v16);
          if (!ActiveFirmwareVersion)
          {
            int v9 = uarpVersionCompare(v16, (_DWORD *)(a2 + 52));
            if (v9 == 1)
            {
              v15[0] = 0;
              v15[1] = 0;
              uint64_t ActiveFirmwareVersion = uarpPlatformEndpointQueryStagedFirmwareVersion(a1, a2, v15);
              if (ActiveFirmwareVersion) {
                return ActiveFirmwareVersion;
              }
              int v10 = uarpVersionCompare(v15, (_DWORD *)(a2 + 52));
              if (v10 == 1) {
                return ActiveFirmwareVersion;
              }
              *a3 = 0;
              BOOL v11 = v10 == 0;
              __int16 v12 = 1280;
              __int16 v13 = 768;
            }
            else
            {
              uint64_t ActiveFirmwareVersion = 0;
              *a3 = 0;
              BOOL v11 = v9 == 0;
              __int16 v12 = 1536;
              __int16 v13 = 1024;
            }
            if (v11) {
              __int16 v12 = v13;
            }
            *a4 = v12;
          }
        }
      }
    }
  }
  return ActiveFirmwareVersion;
}

uint64_t uarpPlatformEndpointAssetAccept(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _OWORD *a5)
{
  return uarpPlatformEndpointAssetAcceptWithPayloadAndDecompressionWindows(a1, a2, a3, a4, a5, 0, 0, 0, 0);
}

uint64_t uarpPlatformEndpointAssetAcceptWithPayloadWindow(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _OWORD *a5, uint64_t a6, unsigned int a7)
{
  return uarpPlatformEndpointAssetAcceptWithPayloadAndDecompressionWindows(a1, a2, a3, a4, a5, a6, a7, 0, 0);
}

uint64_t uarpPlatformEndpointAssetAcceptWithPayloadAndDecompressionWindows(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _OWORD *a5, uint64_t a6, unsigned int a7, uint64_t a8, unsigned int a9)
{
  uint64_t result = 30;
  if (a1 && a2 && a3 && (!a6 || a7 && *(_DWORD *)(a2 + 8) <= a7) && (!a8 || a9 && *(_DWORD *)(a2 + 8) <= a9))
  {
    uint64_t v15 = *(void *)(a1 + 568);
    if (v15)
    {
      uint64_t v16 = *(void *)(a1 + 568);
      while (v16 != a3 || *(_DWORD *)(v16 + 304))
      {
        uint64_t v16 = *(void *)(v16 + 712);
        if (!v16) {
          goto LABEL_15;
        }
      }
    }
    else
    {
LABEL_15:
      *(void *)(a3 + 712) = v15;
      *(void *)(a1 + 568) = a3;
    }
    if (a4) {
      *(void *)(a3 + 704) = a4;
    }
    *(_WORD *)(a3 + 72) = 0;
    if (!a5) {
      return 30;
    }
    long long v17 = a5[1];
    *(_OWORD *)(a3 + 80) = *a5;
    *(_OWORD *)(a3 + 96) = v17;
    long long v18 = a5[2];
    long long v19 = a5[3];
    long long v20 = a5[5];
    *(_OWORD *)(a3 + 144) = a5[4];
    *(_OWORD *)(a3 + 160) = v20;
    *(_OWORD *)(a3 + 112) = v18;
    *(_OWORD *)(a3 + 128) = v19;
    long long v21 = a5[6];
    long long v22 = a5[7];
    long long v23 = a5[9];
    *(_OWORD *)(a3 + 208) = a5[8];
    *(_OWORD *)(a3 + 224) = v23;
    *(_OWORD *)(a3 + 176) = v21;
    *(_OWORD *)(a3 + 192) = v22;
    long long v24 = a5[10];
    long long v25 = a5[11];
    long long v26 = a5[13];
    *(_OWORD *)(a3 + 272) = a5[12];
    *(_OWORD *)(a3 + 288) = v26;
    *(_OWORD *)(a3 + 240) = v24;
    *(_OWORD *)(a3 + 256) = v25;
    if (a6)
    {
      if (!*(unsigned char *)(a3 + 652)) {
        UARPLayer2ReturnBuffer(a1, *(void **)(a3 + 640));
      }
      *(void *)(a3 + 640) = a6;
      *(_DWORD *)(a3 + 648) = a7;
      *(unsigned char *)(a3 + 652) = 1;
    }
    else if (!*(void *)(a3 + 640))
    {
      uint64_t v29 = (void *)(a3 + 640);
      *(unsigned char *)(a3 + 652) = 0;
      unsigned int v30 = *(_DWORD *)(a2 + 8);
      *(_DWORD *)(a3 + 648) = v30;
      uint64_t result = UARPLayer2RequestBuffer(a1, (void *)(a3 + 640), v30);
      if (result) {
        return result;
      }
      if (!*v29) {
        return 11;
      }
    }
    if (a8)
    {
      if (!*(unsigned char *)(a3 + 668)) {
        UARPLayer2ReturnBuffer(a1, *(void **)(a3 + 656));
      }
      *(void *)(a3 + 656) = a8;
      *(_DWORD *)(a3 + 664) = a9;
      char v27 = 1;
    }
    else
    {
      char v27 = 0;
    }
    *(unsigned char *)(a3 + 668) = v27;
    if (uarpVersionCompare((_DWORD *)(a3 + 52), (_DWORD *)(a3 + 12))
      || *(_DWORD *)(a3 + 68) != *(_DWORD *)(a3 + 8))
    {
      return uarpPlatformAssetSuperBinaryPullHeader(a1, a3);
    }
    else if (*(_DWORD *)(a3 + 688) == *(_DWORD *)(a3 + 32))
    {
      int v28 = *(_DWORD *)(a3 + 452);
      if (v28 == -1)
      {
        UARPLayer2AssetMetaDataComplete(a1, a3);
        return 0;
      }
      else if (v28 == *(_DWORD *)(a3 + 456))
      {
        if (*(_DWORD *)(a3 + 512) == *(_DWORD *)(a3 + 492))
        {
          if (*(_DWORD *)(a3 + 508) || (uint64_t result = uarpPlatformAssetPayloadPullData(a1, a3), !result))
          {
            return uarpPlatformAssetRequestData(a1, a3, a3 + 312);
          }
        }
        else
        {
          return uarpPlatformAssetPayloadPullMetaData(a1, a3);
        }
      }
      else
      {
        return uarpPlatformAssetSuperBinaryPullProposedPayloadHeader(a1, a3);
      }
    }
    else
    {
      return uarpPlatformAssetSuperBinaryPullMetaData(a1, a3);
    }
  }
  return result;
}

__n128 uarpPlatformEndpointAssetSetCallbacks(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 && a2)
  {
    if (a3)
    {
      long long v3 = *(_OWORD *)(a3 + 16);
      *(_OWORD *)(a2 + 80) = *(_OWORD *)a3;
      *(_OWORD *)(a2 + 96) = v3;
      long long v4 = *(_OWORD *)(a3 + 32);
      long long v5 = *(_OWORD *)(a3 + 48);
      long long v6 = *(_OWORD *)(a3 + 80);
      *(_OWORD *)(a2 + 144) = *(_OWORD *)(a3 + 64);
      *(_OWORD *)(a2 + 160) = v6;
      *(_OWORD *)(a2 + 112) = v4;
      *(_OWORD *)(a2 + 128) = v5;
      long long v7 = *(_OWORD *)(a3 + 96);
      long long v8 = *(_OWORD *)(a3 + 112);
      long long v9 = *(_OWORD *)(a3 + 144);
      *(_OWORD *)(a2 + 208) = *(_OWORD *)(a3 + 128);
      *(_OWORD *)(a2 + 224) = v9;
      *(_OWORD *)(a2 + 176) = v7;
      *(_OWORD *)(a2 + 192) = v8;
      __n128 result = *(__n128 *)(a3 + 160);
      long long v11 = *(_OWORD *)(a3 + 176);
      long long v12 = *(_OWORD *)(a3 + 208);
      *(_OWORD *)(a2 + 272) = *(_OWORD *)(a3 + 192);
      *(_OWORD *)(a2 + 288) = v12;
      *(__n128 *)(a2 + 240) = result;
      *(_OWORD *)(a2 + 256) = v11;
    }
  }
  return result;
}

uint64_t uarpPlatformEndpointAssetDeny(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, _OWORD *a6)
{
  uint64_t v6 = 30;
  if (a1 && a2 && a3)
  {
    if (a5) {
      *(void *)(a3 + 704) = a5;
    }
    if (a6)
    {
      long long v8 = a6[1];
      *(_OWORD *)(a3 + 80) = *a6;
      *(_OWORD *)(a3 + 96) = v8;
      long long v9 = a6[2];
      long long v10 = a6[3];
      long long v11 = a6[5];
      *(_OWORD *)(a3 + 144) = a6[4];
      *(_OWORD *)(a3 + 160) = v11;
      *(_OWORD *)(a3 + 112) = v9;
      *(_OWORD *)(a3 + 128) = v10;
      long long v12 = a6[6];
      long long v13 = a6[7];
      long long v14 = a6[9];
      *(_OWORD *)(a3 + 208) = a6[8];
      *(_OWORD *)(a3 + 224) = v14;
      *(_OWORD *)(a3 + 176) = v12;
      *(_OWORD *)(a3 + 192) = v13;
      long long v15 = a6[10];
      long long v16 = a6[11];
      long long v17 = a6[13];
      *(_OWORD *)(a3 + 272) = a6[12];
      *(_OWORD *)(a3 + 288) = v17;
      *(_OWORD *)(a3 + 240) = v15;
      *(_OWORD *)(a3 + 256) = v16;
      uint64_t v6 = uarpAssetProcessingComplete(a1, a2, a3, a4 | 2u);
      if (!v6) {
        *(unsigned char *)(a3 + 72) = 1;
      }
    }
    else
    {
      return 30;
    }
  }
  return v6;
}

uint64_t uarpPlatformEndpointAssetAbandon(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  return uarpPlatformAssetProcessingCompleteInternal(a1, a2, a3, 3u, a4, 1);
}

uint64_t uarpPlatformEndpointAssetCorrupt(uint64_t a1, uint64_t a2)
{
  return uarpPlatformAssetProcessingCompleteInternal(a1, *(void *)(a2 + 696), a2, 4u, 0, 1);
}

uint64_t uarpPlatformEndpointAssetRelease(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = uarpPlatformAssetFindByAssetContext(a1, *(void *)(a3 + 704));
  return uarpPlatformAssetProcessingCompleteInternal(a1, 0, v4, 1u, 0, 1);
}

uint64_t uarpPlatformEndpointAssetRelease2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = uarpPlatformAssetFindByAssetContext(a1, a3);
  return uarpPlatformAssetProcessingCompleteInternal(a1, 0, v4, 1u, 0, 1);
}

uint64_t uarpPlatformAssetFindByAssetContext(uint64_t a1, uint64_t a2)
{
  uint64_t result = 0;
  if (a1 && a2)
  {
    uint64_t v4 = *(void *)(a1 + 568);
    if (v4)
    {
      uint64_t result = v4;
      while (*(_DWORD *)(result + 304) != 1 || *(void *)(result + 704) != a2)
      {
        uint64_t result = *(void *)(result + 712);
        if (!result)
        {
          while (v4)
          {
            if (!*(_DWORD *)(v4 + 304) && *(void *)(v4 + 704) == a2) {
              return v4;
            }
            uint64_t v4 = *(void *)(v4 + 712);
          }
          return 0;
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t uarpPlatformEndpointAssetQueryNumberOfPayloads(uint64_t a1, uint64_t a2, _WORD *a3)
{
  uint64_t result = 30;
  if (a1 && a2)
  {
    if (a3)
    {
      uint64_t result = 0;
      *a3 = *(_DWORD *)(a2 + 448);
    }
  }
  return result;
}

uint64_t uarpPlatformEndpointAssetQueryFormatVersion(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  uint64_t result = 30;
  if (a1 && a2)
  {
    if (a3)
    {
      uint64_t result = 0;
      *a3 = *a2;
    }
  }
  return result;
}

__n128 uarpPlatformEndpointAssetQueryAssetVersion(uint64_t a1, uint64_t a2, __n128 *a3)
{
  if (a1 && a2)
  {
    if (a3)
    {
      __n128 result = *(__n128 *)(a2 + 12);
      *a3 = result;
    }
  }
  return result;
}

uint64_t uarpPlatformEndpointAssetQueryAssetLength(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t result = 30;
  if (a1 && a2)
  {
    if (a3)
    {
      uint64_t result = 0;
      *a3 = *(_DWORD *)(a2 + 68);
    }
  }
  return result;
}

uint64_t uarpPlatformEndpointAssetQueryTag(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t result = 30;
  if (a1 && a2)
  {
    if (a3)
    {
      uint64_t result = 0;
      *a3 = *(_DWORD *)(a2 + 48);
    }
  }
  return result;
}

uint64_t uarpPlatformEndpointAssetSetPayloadIndex(void *a1, uint64_t a2, int a3)
{
  return uarpPlatformEndpointAssetSetPayloadIndex2(a1, a2, a3);
}

uint64_t uarpPlatformEndpointAssetSetPayloadIndex2(void *a1, uint64_t a2, int a3)
{
  uint64_t result = 30;
  if (a1 && a2)
  {
    if (*(_DWORD *)(a2 + 448) <= a3)
    {
      return 44;
    }
    else
    {
      *(_DWORD *)(a2 + 456) = a3;
      uint64_t v6 = (_OWORD *)(a2 + 464);
      *(void *)(a2 + 508) = 0;
      if (*(unsigned char *)(a2 + 460) == 1)
      {
        long long v7 = *(long long **)(a2 + 632);
        if (v7)
        {
          while (1)
          {
            int v8 = *((_DWORD *)v7 + 31);
            if (v8 == *(_DWORD *)(a2 + 456))
            {
              *(_DWORD *)(a2 + 452) = v8;
              long long v9 = *v7;
              long long v10 = v7[2];
              *(_OWORD *)(a2 + 480) = v7[1];
              *(_OWORD *)(a2 + 496) = v10;
              _OWORD *v6 = v9;
              long long v11 = v7[3];
              long long v12 = v7[4];
              long long v13 = v7[6];
              *(_OWORD *)(a2 + 544) = v7[5];
              *(_OWORD *)(a2 + 560) = v13;
              *(_OWORD *)(a2 + 512) = v11;
              *(_OWORD *)(a2 + 528) = v12;
              long long v14 = v7[7];
              long long v15 = v7[8];
              long long v16 = v7[9];
              *(void *)(a2 + 624) = *((void *)v7 + 20);
              *(_OWORD *)(a2 + 592) = v15;
              *(_OWORD *)(a2 + 608) = v16;
              *(_OWORD *)(a2 + 576) = v14;
              for (uint64_t i = *((void *)v7 + 21); i; uint64_t i = *(void *)(i + 16))
                uarpProcessPayloadTLVInternal(a1, a2, a2 + 464, *(_DWORD *)i, *(unsigned int *)(i + 4), *(unsigned int **)(i + 8));
              uint64_t v18 = *((unsigned int *)v7 + 19);
              if (v18)
              {
                UARPLayer2HashFinal((uint64_t)a1, v18, *((void *)v7 + 10), *((void *)v7 + 12), *((unsigned int *)v7 + 26));
                if (memcmp(*((const void **)v7 + 12), *((const void **)v7 + 14), *((unsigned int *)v7 + 30))) {
                  return 54;
                }
              }
            }
            long long v7 = (long long *)*((void *)v7 + 22);
            if (!v7) {
              goto LABEL_12;
            }
          }
        }
        else
        {
LABEL_12:
          return uarpPlatformEndpointPayloadRequestData((uint64_t)a1, a2);
        }
      }
      else
      {
        return uarpPlatformAssetSuperBinaryPullProposedPayloadHeader((uint64_t)a1, a2);
      }
    }
  }
  return result;
}

uint64_t uarpPlatformEndpointPayloadRequestData(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 30;
  if (!a1 || !a2) {
    return v2;
  }
  unsigned int v3 = *(_DWORD *)(a2 + 500);
  if (v3) {
    v3 -= *(_DWORD *)(a2 + 508);
  }
  if (v3 >= *(_DWORD *)(a2 + 648)) {
    unsigned int v3 = *(_DWORD *)(a2 + 648);
  }
  if (!v3)
  {
    UARPLayer2PayloadDataComplete2(a1, (void *)a2);
    return 0;
  }
  return uarpPlatformAssetPayloadPullData(a1, a2);
}

uint64_t uarpPlatformEndpointAssetPayloadVersion(uint64_t a1, uint64_t a2, _OWORD *a3)
{
  uint64_t result = 30;
  if (a1 && a2 && a3)
  {
    if (*(_DWORD *)(a2 + 452) == -1)
    {
      return 32;
    }
    else
    {
      uint64_t result = 0;
      *a3 = *(_OWORD *)(a2 + 472);
    }
  }
  return result;
}

uint64_t uarpPlatformEndpointAssetPayloadTag(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t result = 30;
  if (a1 && a2 && a3)
  {
    if (*(_DWORD *)(a2 + 452) == -1)
    {
      return 32;
    }
    else
    {
      uint64_t result = 0;
      *a3 = *(_DWORD *)(a2 + 468);
    }
  }
  return result;
}

uint64_t uarpPlatformEndpointPayloadRequestAllHeadersAndMetaData(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(a2 + 460) = 1;
  if (*(int *)(a2 + 448) < 1)
  {
    if (*(_DWORD *)(a2 + 32))
    {
      return uarpPlatformAssetPullAllMetaData(a1, a2);
    }
    else
    {
      UARPLayer2AssetAllHeadersAndMetaDataComplete(a1, *(void *)(a2 + 696), a2);
      return 0;
    }
  }
  else
  {
    return uarpPlatformAssetPullAllPayloadHeaders(a1, a2);
  }
}

uint64_t uarpPlatformEndpointAssetSetPayloadOffset(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (!a2) {
    return 30;
  }
  if (*(_DWORD *)(a2 + 452) == -1) {
    return 44;
  }
  if (*(_DWORD *)(a2 + 500) <= a3) {
    return 43;
  }
  if (*(unsigned char *)(a2 + 392) == 1) {
    return 16;
  }
  uint64_t result = 0;
  *(_DWORD *)(a2 + 508) = a3;
  return result;
}

uint64_t uarpPlatformEndpointPayloadRequestDataPause(uint64_t a1, uint64_t a2)
{
  uint64_t result = 30;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0;
      *(unsigned char *)(a2 + 73) = 1;
    }
  }
  return result;
}

uint64_t uarpPlatformEndpointPayloadRequestDataResume(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 30;
  if (!a1) {
    return v2;
  }
  if (!a2) {
    return v2;
  }
  uint64_t v2 = *(unsigned __int8 *)(a2 + 73);
  if (!*(unsigned char *)(a2 + 73)) {
    return v2;
  }
  *(unsigned char *)(a2 + 73) = 0;
  uint64_t v2 = *(void *)(a2 + 696);
  if (!v2) {
    return v2;
  }
  if (*(unsigned char *)(a2 + 392) == 1) {
    return 0;
  }
  return uarpPlatformAssetRequestData(a1, a2, a2 + 312);
}

uint64_t uarpPlatformEndpointAssetFullyStaged(uint64_t a1, uint64_t a2)
{
  if (a1 && a2) {
    return uarpAssetProcessingComplete(a1, *(void *)(a2 + 696), a2, 1u);
  }
  else {
    return 30;
  }
}

double uarpPlatformEndpointSuperBinaryMerge(uint64_t a1, long long *a2, uint64_t a3)
{
  if (a1 && a2)
  {
    if (a3)
    {
      long long v3 = *a2;
      long long v4 = a2[1];
      *(_OWORD *)(a3 + 28) = *(long long *)((char *)a2 + 28);
      *(_OWORD *)a3 = v3;
      *(_OWORD *)(a3 + 16) = v4;
      *((unsigned char *)a2 + 72) = 1;
      *(unsigned char *)(a3 + 72) = 0;
      *(unsigned char *)(a3 + 73) = *((unsigned char *)a2 + 73);
      *((unsigned char *)a2 + 392) = 0;
      long long v6 = *(long long *)((char *)a2 + 360);
      long long v5 = *(long long *)((char *)a2 + 376);
      long long v7 = *(long long *)((char *)a2 + 344);
      *(_OWORD *)(a3 + 328) = *(long long *)((char *)a2 + 328);
      *(_OWORD *)(a3 + 344) = v7;
      *(_OWORD *)(a3 + 360) = v6;
      *(_OWORD *)(a3 + 376) = v5;
      *(_OWORD *)(a3 + 312) = *(long long *)((char *)a2 + 312);
      long long v8 = *(long long *)((char *)a2 + 392);
      long long v9 = *(long long *)((char *)a2 + 408);
      long long v10 = *(long long *)((char *)a2 + 424);
      *(void *)(a3 + 440) = *((void *)a2 + 55);
      *(_OWORD *)(a3 + 408) = v9;
      *(_OWORD *)(a3 + 424) = v10;
      *(_OWORD *)(a3 + 392) = v8;
      *(_DWORD *)(a3 + 452) = *((_DWORD *)a2 + 113);
      *(_DWORD *)(a3 + 456) = *((_DWORD *)a2 + 114);
      long long v11 = a2[29];
      long long v12 = a2[31];
      *(_OWORD *)(a3 + 480) = a2[30];
      *(_OWORD *)(a3 + 496) = v12;
      *(_OWORD *)(a3 + 464) = v11;
      long long v13 = a2[32];
      long long v14 = a2[33];
      long long v15 = a2[35];
      *(_OWORD *)(a3 + 544) = a2[34];
      *(_OWORD *)(a3 + 560) = v15;
      *(_OWORD *)(a3 + 512) = v13;
      *(_OWORD *)(a3 + 528) = v14;
      long long v16 = a2[36];
      long long v17 = a2[37];
      long long v18 = a2[38];
      *(void *)(a3 + 624) = *((void *)a2 + 78);
      *(_OWORD *)(a3 + 592) = v17;
      *(_OWORD *)(a3 + 608) = v18;
      *(_OWORD *)(a3 + 576) = v16;
      *((void *)a2 + 78) = 0;
      double result = 0.0;
      a2[37] = 0u;
      a2[38] = 0u;
      a2[35] = 0u;
      a2[36] = 0u;
      a2[33] = 0u;
      a2[34] = 0u;
      a2[31] = 0u;
      a2[32] = 0u;
      a2[29] = 0u;
      a2[30] = 0u;
      *(void *)(a3 + 640) = *((void *)a2 + 80);
      *((void *)a2 + 80) = 0;
      *(unsigned char *)(a3 + 652) = *((unsigned char *)a2 + 652);
      *(_DWORD *)(a3 + 648) = *((_DWORD *)a2 + 162);
      *((_DWORD *)a2 + 162) = 0;
      *(void *)(a3 + 656) = *((void *)a2 + 82);
      *((void *)a2 + 82) = 0;
      *(unsigned char *)(a3 + 668) = *((unsigned char *)a2 + 668);
      *(_DWORD *)(a3 + 664) = *((_DWORD *)a2 + 166);
      *((_DWORD *)a2 + 166) = 0;
      *(_DWORD *)(a3 + 688) = *((_DWORD *)a2 + 172);
    }
  }
  return result;
}

uint64_t uarpPlatformEndpointSendMessageComplete(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = uarpPlatformEndpointSendMessageCompleteInternal(a1, a2, a3);
  if (!*(unsigned char *)(a1 + 580))
  {
    return uarpTransmitQueueService(a1, a2);
  }
  return result;
}

void uarpPlatformEndpointCleanupAssets(uint64_t a1)
{
  if (a1) {
    uarpPlatformCleanupAssetsForRemoteEndpoint(a1, 0, 0);
  }
}

void uarpPlatformEndpointCleanupAssets2(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uarpPlatformCleanupAssetsForRemoteEndpoint(a1, a2, 0);
  }
}

void uarpPlatformEndpointPrepareDynamicAsset(uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4, uint64_t a5)
{
}

void uarpPlatformEndpointPrepareSolicitedDynamicAsset(uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4, uint64_t a5)
{
}

void uarpPlatformEndpointPrepareSuperBinary(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

uint64_t uarpPlatformEndpointOfferAsset(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = 30;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        uint64_t v6 = *(void *)(a1 + 568);
        if (v6)
        {
          while (*(_DWORD *)(v6 + 304) != 1 || *(void *)(v6 + 704) != a3)
          {
            uint64_t v6 = *(void *)(v6 + 712);
            if (!v6) {
              return 30;
            }
          }
          memset(__dst, 0, 44);
          unsigned __int16 v7 = 0;
          uint64_t result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, a2, v6, __dst, 44, 0, &v7);
          if (!result)
          {
            uarpSuperBinaryHeaderEndianSwap((unsigned int *)__dst, (_DWORD *)v6);
            *(_OWORD *)(v6 + 52) = *(_OWORD *)(v6 + 12);
            *(_DWORD *)(v6 + 68) = *(_DWORD *)(v6 + 8);
            *(_DWORD *)(v6 + 448) = *(unsigned __int16 *)(v6 + 40) / 0x28u;
            uint64_t result = uarpPlatformAssetApproveOfferVersion(a2, v6);
            if (!result) {
              return uarpOfferAssetToRemoteEP(a1, a2, v6);
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t uarpPlatformAssetFindByAssetContextAndList(uint64_t result, uint64_t a2, int a3)
{
  if (result)
  {
    for (uint64_t result = *(void *)(result + 568); result; uint64_t result = *(void *)(result + 712))
    {
      if (*(_DWORD *)(result + 304) == a3 && *(void *)(result + 704) == a2) {
        break;
      }
    }
  }
  return result;
}

uint64_t uarpPlatformEndpointAssetGetBytesAtOffset(uint64_t a1, uint64_t a2, uint64_t a3, void *__dst, uint64_t a5, uint64_t a6, unsigned __int16 *a7)
{
  uint64_t result = 30;
  if (a1 && a3 && __dst && a5)
  {
    __int16 v15 = *(_WORD *)(a3 + 46);
    if ((v15 & 0x80) != 0)
    {
      uint64_t result = UARPSuperBinaryGetInternalSuperBinaryMetaData(a1, a3, __dst, a5, a6, a7);
      if (result != 40) {
        return result;
      }
      __int16 v15 = *(_WORD *)(a3 + 46);
    }
    if ((v15 & 8) == 0
      || (uint64_t result = UARPSuperBinaryGetInternalPayloadMetaData(a1, a3, __dst, a5, a6, a7), result == 40))
    {
      return UARPLayer2AssetGetBytesAtOffset2(a1, a2, (void *)a3, (uint64_t)__dst, a5, a6, (uint64_t)a7);
    }
  }
  return result;
}

uint64_t uarpPlatformEndpointRemoveAssetPayloadWindow(uint64_t a1, uint64_t a2, void *a3, _DWORD *a4)
{
  uint64_t result = 30;
  if (a3)
  {
    if (a4)
    {
      uint64_t result = 0;
      *a3 = *(void *)(a2 + 640);
      *(void *)(a2 + 640) = 0;
      *a4 = *(_DWORD *)(a2 + 648);
      *(_DWORD *)(a2 + 648) = 0;
    }
  }
  return result;
}

uint64_t uarpPlatformEndpointProvideAssetPayloadWindow(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t result = 30;
  if (a3 && a4)
  {
    long long v9 = *(void **)(a2 + 640);
    if (v9)
    {
      if (!*(unsigned char *)(a2 + 652)) {
        UARPLayer2ReturnBuffer(a1, v9);
      }
    }
    uint64_t result = 0;
    *(void *)(a2 + 640) = a3;
    *(_DWORD *)(a2 + 648) = a4;
    *(unsigned char *)(a2 + 652) = 1;
  }
  return result;
}

uint64_t uarpPlatformEndpointDynamicAssetSolicitationDeny(uint64_t a1, uint64_t a2, _DWORD *a3, int a4)
{
  if (a1 && a2 && a3) {
    return uarpSendDynamicAssetPreProcessingStatus(a1, a2, a3, 2u, a4);
  }
  else {
    return 30;
  }
}

uint64_t uarpPlatformEndpointAssetSetBytesAtOffset(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a1 && a3 && a4 && a5) {
    return UARPLayer2AssetSetBytesAtOffset2(a1, a2, a3, a4, a5, a6);
  }
  else {
    return 30;
  }
}

uint64_t uarpPlatformEndpointWatchDogExpired(uint64_t a1, uint64_t a2)
{
  uint64_t result = 30;
  if (a1 && a2)
  {
    uint64_t result = 0;
    *(unsigned char *)(a2 + 50) = 0;
    if (!*(unsigned char *)(a1 + 580))
    {
      uarpTransmitQueueService(a1, a2);
      return 0;
    }
  }
  return result;
}

uint64_t uarpPlatformEndpointRescindAsset(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a1) {
    return 30;
  }
  if (!a2) {
    return 30;
  }
  if (!a3) {
    return 30;
  }
  uint64_t v3 = *(void *)(a1 + 568);
  if (!v3) {
    return 30;
  }
  while (*(_DWORD *)(v3 + 304) != 1 || *(void *)(v3 + 704) != a3)
  {
    uint64_t v3 = *(void *)(v3 + 712);
    if (!v3) {
      return 30;
    }
  }
  return uarpAssetRescind(a1, a2, *(unsigned __int16 *)(v3 + 44));
}

uint64_t uarpPlatformEndpointRescindAllAssets(uint64_t a1, uint64_t a2)
{
  if (a1 && a2) {
    return uarpAssetRescind(a1, a2, 0xFFFFu);
  }
  else {
    return 30;
  }
}

uint64_t uarpPlatformEndpointApplyStagedAssets(uint64_t a1, uint64_t a2)
{
  uint64_t result = 30;
  if (a1 && a2)
  {
    long long v5 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0xAu, 6u, 1);
    if (v5)
    {
      return uarpTransmitBuffer2(a1, a2, (uint64_t)v5);
    }
    else
    {
      return 11;
    }
  }
  return result;
}

uint64_t uarpPlatformEndpointPauseAssetTransfers(uint64_t a1, uint64_t a2)
{
  if (a1 && a2) {
    return uarpSendDataTransferNotificationPause(a1, a2);
  }
  else {
    return 30;
  }
}

uint64_t uarpPlatformEndpointResumeAssetTransfers(uint64_t a1, uint64_t a2)
{
  if (a1 && a2) {
    return uarpSendDataTransferNotificationResume(a1, a2);
  }
  else {
    return 30;
  }
}

uint64_t uarpPlatformEndpointSolicitDynamicAsset(uint64_t a1, uint64_t a2, _DWORD *a3, uint64_t a4)
{
  if (!a1) {
    return 30;
  }
  if (!a2) {
    return 30;
  }
  if (!a4) {
    return 30;
  }
  uint64_t v4 = *(void *)(a1 + 568);
  if (!v4) {
    return 30;
  }
  while (*(_DWORD *)(v4 + 304) || *(void *)(v4 + 704) != a4)
  {
    uint64_t v4 = *(void *)(v4 + 712);
    if (!v4) {
      return 30;
    }
  }
  return uarpSolicitDynamicAsset(a1, a2, a3);
}

uint64_t uarpPlatformEndpointSendVendorSpecific(uint64_t a1, uint64_t a2, __int16 *a3, unsigned int a4, const void *a5, unsigned int a6)
{
  if (a1 && a2 && a3 && a5) {
    return uarpSendVendorSpecific(a1, a2, a3, a4, a5, a6);
  }
  else {
    return 30;
  }
}

uint64_t uarpPlatformDownstreamEndpointAdd(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a1) {
    return 30;
  }
  unsigned __int16 v6 = *(_WORD *)(a1 + 600);
  do
  {
    if (!v6)
    {
      *(_WORD *)(a1 + 600) = 1;
      return 11;
    }
    uint64_t v7 = UARPPlatformDownstreamEndpointByID(a1, a2, v6);
    unsigned int v8 = *(unsigned __int16 *)(a1 + 600);
    unsigned __int16 v6 = v8 + 1;
    *(_WORD *)(a1 + 600) = v8 + 1;
  }
  while (!v7 || !v8);
  return uarpPlatformDownstreamEndpointAddWithID(a1, a2, a3, v8);
}

uint64_t uarpPlatformDownstreamEndpointAddWithID(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  if (!a1) {
    return 30;
  }
  uint64_t v8 = uarpPlatformRemoteEndpointAlloc(a1);
  if (!v8) {
    return 11;
  }
  *(void *)(v8 + 40) = a3;
  *(void *)(v8 + 176) = a2;
  *(_WORD *)(v8 + 136) = a4;
  return uarpSendDownstreamEndpointReachable(a1, a2, a4);
}

uint64_t uarpPlatformDownstreamEndpointRemove(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = UARPPlatformDownstreamEndpointByDelegate(a1, a2, a3);
  if (!v5) {
    return 58;
  }
  unsigned int v6 = *(unsigned __int16 *)(v5 + 136);
  return uarpSendDownstreamEndpointUnreachable(a1, a2, v6);
}

uint64_t uarpPlatformDownstreamEndpointSendMessage(uint64_t a1, uint64_t a2, uint64_t a3, const void *a4, unsigned int a5)
{
  uint64_t v9 = UARPPlatformDownstreamEndpointByDelegate(a1, a2, a3);
  if (!v9) {
    return 58;
  }
  return uarpPlatformDownstreamEndpointSendMessageInternal(a1, a2, v9, a4, a5);
}

uint64_t uarpPlatformNoFirmwareUpdateAvailable(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x1Du, 6u, 1);
  if (!v4) {
    return 11;
  }
  return uarpTransmitBuffer2(a1, a2, (uint64_t)v4);
}

uint64_t uarpRemoteEndpointID(uint64_t a1)
{
  if (a1) {
    return *(unsigned int *)(a1 + 52);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t uarpRemoteEndpointIDForAsset(uint64_t a1)
{
  if (a1 && (uint64_t v1 = *(void *)(a1 + 696)) != 0) {
    return *(unsigned int *)(v1 + 52);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t uarpPlatformRemoteDelegateForAssetDelegate(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = *(void *)(result + 696);
    if (v1) {
      return *(void *)(v1 + 40);
    }
    else {
      return 0;
    }
  }
  return result;
}

__n128 uarpPlatformAssetSelectedPayloadInfo(uint64_t a1, char *a2)
{
  if (a1 && a2 && *(_DWORD *)(a1 + 452) != -1 && *(unsigned char *)(a1 + 460) != 1)
  {
    uarpZero(a2, 0x20uLL);
    *(_DWORD *)a2 = *(_DWORD *)(a1 + 468);
    __n128 result = *(__n128 *)(a1 + 472);
    *(__n128 *)(a2 + 4) = result;
    int v5 = *(_DWORD *)(a1 + 500);
    *((_DWORD *)a2 + 5) = *(_DWORD *)(a1 + 492);
    *((_DWORD *)a2 + 6) = v5;
  }
  return result;
}

uint64_t uarpAssetQuerySuperBinaryMetaData(uint64_t a1, uint64_t a2)
{
  uint64_t result = 0;
  if (a1 && a2)
  {
    if (*(unsigned char *)(a2 + 460)) {
      return *(void *)(a2 + 720);
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t uarpAssetQueryPayloadMetaData(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t result = 0;
  if (a1 && a2)
  {
    if (*(unsigned char *)(a2 + 460) && (uint64_t v5 = *(void *)(a2 + 632)) != 0)
    {
      while (*(_DWORD *)(v5 + 124) != a3)
      {
        uint64_t v5 = *(void *)(v5 + 176);
        if (!v5) {
          return 0;
        }
      }
      return *(void *)(v5 + 168);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t uarpAssetQueryPayloadInfo(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = 30;
  if (a1 && a2)
  {
    if (a4)
    {
      if (*(unsigned char *)(a2 + 460))
      {
        uint64_t v6 = *(void *)(a2 + 632);
        if (!v6) {
          return 54;
        }
        while (*(_DWORD *)(v6 + 124) != a3)
        {
          uint64_t v6 = *(void *)(v6 + 176);
          if (!v6) {
            return 54;
          }
        }
        *(_DWORD *)a4 = *(_DWORD *)(v6 + 4);
        *(_OWORD *)(a4 + 4) = *(_OWORD *)(v6 + 8);
        int v9 = *(_DWORD *)(v6 + 36);
        *(_DWORD *)(a4 + 20) = *(_DWORD *)(v6 + 28);
        *(_DWORD *)(a4 + 24) = v9;
        uint64_t v8 = (_DWORD *)(v6 + 128);
        goto LABEL_14;
      }
      if (*(_DWORD *)(a2 + 452) == a3)
      {
        *(_DWORD *)a4 = *(_DWORD *)(a2 + 468);
        *(_OWORD *)(a4 + 4) = *(_OWORD *)(a2 + 472);
        int v7 = *(_DWORD *)(a2 + 500);
        *(_DWORD *)(a4 + 20) = *(_DWORD *)(a2 + 492);
        *(_DWORD *)(a4 + 24) = v7;
        uint64_t v8 = (_DWORD *)(a2 + 592);
LABEL_14:
        uint64_t result = 0;
        *(_DWORD *)(a4 + 28) = *v8;
        return result;
      }
      return 44;
    }
    else
    {
      return 26;
    }
  }
  return result;
}

uint64_t uarpPlatformAssetQueryAssetID(uint64_t a1, _WORD *a2)
{
  uint64_t result = 30;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0;
      *a2 = *(_WORD *)(a1 + 44);
    }
  }
  return result;
}

__n128 uarpPlatformAssetQueryAssetVersion(uint64_t a1, __n128 *a2)
{
  if (a1)
  {
    if (a2)
    {
      __n128 result = *(__n128 *)(a1 + 52);
      *a2 = result;
    }
  }
  return result;
}

uint64_t uarpPlatformSetMaxTxPayloadLength(uint64_t a1, _DWORD *a2, int a3)
{
  uint64_t result = 30;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0;
      *a2 = a3;
    }
  }
  return result;
}

uint64_t uarpPlatformSetMaxRxPayloadLength(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t result = 30;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0;
      *(_DWORD *)(a2 + 4) = a3;
    }
  }
  return result;
}

uint64_t uarpPlatformGetMaxRxPayloadLength(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t result = 30;
  if (a1 && a2)
  {
    if (a3)
    {
      uint64_t result = 0;
      *a3 = *(_DWORD *)(a2 + 4);
    }
  }
  return result;
}

void UARPPersonalizationTSSRequestWithSigningServer_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4(&dword_21E079000, v0, v1, "UARP: TSS Request failed customer path / auth listed", v2, v3, v4, v5, v6);
}

void UARPPersonalizationTSSRequestWithSigningServer_cold_2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4(&dword_21E079000, v0, v1, "UARP: TSS Request passed customer path / auth listed", v2, v3, v4, v5, v6);
}

void UARPPersonalizationTSSRequestWithSigningServer_cold_3()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_21E079000, v0, v1, "UARP: TSS Request to server %{public}@ with options %{public}@");
}

void TSSRequestWithSigningServer_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4(&dword_21E079000, v0, v1, "UARP: Failed to create authinstall reference", v2, v3, v4, v5, v6);
}

void TSSRequestWithSigningServer_cold_2(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_21E079000, a2, OS_LOG_TYPE_ERROR, "UARP: Failed personalization response, error = %u", (uint8_t *)v2, 8u);
}

void TSSRequestWithSigningServer_cold_3()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4(&dword_21E079000, v0, v1, "UARP: Failed to enable sso", v2, v3, v4, v5, v6);
}

void TSSRequestWithSigningServer_cold_4()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4(&dword_21E079000, v0, v1, "UARP: Failed to initialize sso", v2, v3, v4, v5, v6);
}

void TSSRequestWithSigningServer_cold_5()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4(&dword_21E079000, v0, v1, "UARP: Failed to set signing server", v2, v3, v4, v5, v6);
}

void UARPPersonalizationTSSRequestWithSigningServerSSO_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4(&dword_21E079000, v0, v1, "UARP: TSS Request failed sso modes", v2, v3, v4, v5, v6);
}

void UARPPersonalizationTSSRequestWithSigningServerSSO_cold_2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_21E079000, v0, v1, "UARP: TSS Request to server %{public}@ with SSO and options %{public}@");
}

uint64_t __getCSVoiceTriggerRTModelClass_block_invoke_cold_1()
{
  uint64_t v0 = (uint8_t *)abort_report_np();
  return UARPArrayOfExpiredFiles_cold_1(v0);
}

void UARPArrayOfExpiredFiles_cold_1(uint8_t *buf, uint64_t a2, void *a3)
{
  *(_DWORD *)buf = 138412290;
  *a3 = a2;
  _os_log_debug_impl(&dword_21E079000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "Checking age of temp file %@", buf, 0xCu);
}

void fCoreUARPLayer3DynamicAssetOffered_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void fCoreUARPLayer3DynamicAssetOffered_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void fCoreUARPLayer3DynamicAssetOffered_cold_3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_21E079000, v0, v1, "Could not create file for offered dynamic asset %@", v2, v3, v4, v5, v6);
}

void fCoreUARPLayer3AUDLogError_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void fCoreUARPLayer3AUDLogDebug_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void fCoreUARPLayer3AUDLogFault_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = &fCoreUARPLayer3AUDLogFault_logBuffer;
  _os_log_fault_impl(&dword_21E079000, log, OS_LOG_TYPE_FAULT, "%s", (uint8_t *)&v1, 0xCu);
}

void UARPPlatformControllerRecvMessage_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_7();
  _os_log_debug_impl(&dword_21E079000, v0, OS_LOG_TYPE_DEBUG, "Recv %@ for endpoint %@", v1, 0x16u);
}

void UARPPlatformControllerOfferFirmwareAsset_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_21E079000, v0, OS_LOG_TYPE_ERROR, "%s: could not create uploader asset for %@", (uint8_t *)v1, 0x16u);
}

void UARPPlatformControllerOfferFirmwareAsset_cold_2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_21E079000, v0, OS_LOG_TYPE_ERROR, "%s: could not offer firmware <invalid hardware revision> to endpoint %@", (uint8_t *)v1, 0x16u);
}

void UARPPlatformControllerOfferFirmwareAsset_cold_3(unsigned int a1)
{
  uarpStatusCodeToString(a1);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_10_0(&dword_21E079000, v1, v2, "%s: failed to prepare firmware <%s> to endpoint %@", v3, v4, v5, v6, 2u);
}

void UARPPlatformControllerReofferFirmwareAsset_cold_1(unsigned int a1)
{
  uarpStatusCodeToString(a1);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_10_0(&dword_21E079000, v1, v2, "%s: Offer firmware status <%s> to endpoint %@", v3, v4, v5, v6, 2u);
}

void UARPPlatformControllerResolicitDynamicAssets_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_7();
  _os_log_error_impl(&dword_21E079000, v0, OS_LOG_TYPE_ERROR, "Could not solicit Dynamic Asset from endpoint\n%@%@", v1, 0x16u);
}

void fCoreUARPLayer3AssetReady_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void fCoreUARPLayer3AssetReady_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void fCoreUARPLayer3AssetReady_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void fCoreUARPLayer3AssetReady_cold_4(void *a1)
{
  uint64_t v1 = [a1 assetVersion];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_4(&dword_21E079000, v2, v3, "Asset Ready; asset version is %@", v4, v5, v6, v7, v8);
}

void fCoreUARPLayer3AssetReady_cold_6(void *a1)
{
  [a1 formatVersion];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_4(&dword_21E079000, v1, v2, "Asset Ready; Format version is %lu", v3, v4, v5, v6, v7);
}

void fCoreUARPLayer3AssetReady_cold_7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void fCoreUARPLayer3AssetReady_cold_8(void *a1)
{
  [a1 numPayloads];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_4(&dword_21E079000, v1, v2, "Asset Ready; Number of Payloads is %lu", v3, v4, v5, v6, v7);
}

void fCoreUARPLayer3AssetReady_cold_9(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void fCoreUARPLayer3AssetMetaDataTLV_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(&dword_21E079000, v0, v1, "Asset MetaData T=<0x%08x> L=%d", v2, v3);
}

void fCoreUARPLayer3AssetMetaDataComplete_cold_1(void *a1)
{
  [a1 selectedPayload];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_21E079000, v1, v2, "Error setting payload index to %lu", v3, v4, v5, v6, v7);
}

void fCoreUARPLayer3AssetMetaDataComplete_cold_2(void *a1)
{
  [a1 selectedPayload];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_4(&dword_21E079000, v1, v2, "Setting payload index to %lu", v3, v4, v5, v6, v7);
}

void fCoreUARPLayer3PayloadReady_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_6(&dword_21E079000, v0, v1, "Payload Ready; payload 4cc/tag is %@", v2, v3, v4, v5, v6);
}

void fCoreUARPLayer3PayloadReady_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void fCoreUARPLayer3PayloadReady_cold_3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_6(&dword_21E079000, v0, v1, "Payload Ready; asset version is %@", v2, v3, v4, v5, v6);
}

void fCoreUARPLayer3PayloadReady_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void fCoreUARPLayer3PayloadMetaDataTLV_cold_1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_11(&dword_21E079000, v0, v1, "Payload MetaData T=<0x%08x> L=%d", v2, v3);
}

void fCoreUARPLayer3PayloadMetaDataComplete_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void fCoreUARPLayer3PayloadData_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_21E079000, v0, v1, "Payload write data error %@", v2, v3, v4, v5, v6);
}

void fCoreUARPLayer3AssetAllHeadersAndMetaDataComplete_cold_1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_21E079000, a2, OS_LOG_TYPE_ERROR, "Failed to set payload index; %u", (uint8_t *)v2, 8u);
}

void UARPlatformEndpointAssetFullyReceived_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4(&dword_21E079000, v0, v1, "Error report asset fully staged", v2, v3, v4, v5, v6);
}

void UARPAssetSolicitionComplete_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4(&dword_21E079000, v0, v1, "Asset Solicitation Complete, UARPAsset.asset is nil", v2, v3, v4, v5, v6);
}

void UARPAssetSolicitionComplete_cold_2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4(&dword_21E079000, v0, v1, "Asset Solicitation Complete, UARPAsset.asset.id is nil", v2, v3, v4, v5, v6);
}

void UARPAssetSolicitionComplete_cold_3()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4(&dword_21E079000, v0, v1, "Asset Solicitation Complete, UARPAsset.asset.id.localURL is nil", v2, v3, v4, v5, v6);
}

void UARPAssetSolicitionComplete_cold_4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_21E079000, v0, v1, "Payload transcribe to disk error %@", v2, v3, v4, v5, v6);
}

void UARPlatformEndpointHandleMappedAnalytics_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4(&dword_21E079000, v0, v1, "Failed to expand MTIC.", v2, v3, v4, v5, v6);
}

void UARPlatformEndpointHandleMappedAnalytics_cold_2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4(&dword_21E079000, v0, v1, "Failed to prepare and send MTIC to CoreAnalytics", v2, v3, v4, v5, v6);
}

void UARPlatformEndpointHandleCrashAnalytics_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4(&dword_21E079000, v0, v1, "Failed to expand CRSH Payloads.", v2, v3, v4, v5, v6);
}

void UARPlatformEndpointHandleCrashAnalytics_cold_2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_4(&dword_21E079000, v0, v1, "Failed to decompose CRSH.", v2, v3, v4, v5, v6);
}

void uarpLogError_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void uarpLogDebug_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = &uarpLogDebug_logBuffer;
  _os_log_debug_impl(&dword_21E079000, log, OS_LOG_TYPE_DEBUG, "%s\n", (uint8_t *)&v1, 0xCu);
}

void uarpLogFault_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void uarpPlatformDarwinLogError_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void uarpPlatformDarwinLogDebug_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = &uarpPlatformDarwinLogDebug_logBuffer;
  _os_log_debug_impl(&dword_21E079000, log, OS_LOG_TYPE_DEBUG, "%s\n", (uint8_t *)&v1, 0xCu);
}

void uarpPlatformDarwinLogFault_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = &uarpPlatformDarwinLogFault_logBuffer;
  _os_log_fault_impl(&dword_21E079000, log, OS_LOG_TYPE_FAULT, "%s\n", (uint8_t *)&v1, 0xCu);
}

void uarpDynamicAssetURLWithSuffix_cold_1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_1(&dword_21E079000, &_os_log_internal, v0, "Failed to create file for dynamic asset %@ at %@", v1, v2, v3, v4, v5);
}

void UARPUtilsBuildURLForTemporaryFile_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_21E079000, &_os_log_internal, v0, "Failed to create file at %@", v1, v2, v3, v4, v5);
}

void UARPUtilsBuildURLForTemporaryFile_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_21E079000, &_os_log_internal, v0, "Failed to create directory at %@", v1, v2, v3, v4, v5);
}

void createPowerAssertion_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void createPowerAssertion_cold_2(uint64_t a1, int a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v2 = 136315650;
  uint64_t v3 = "BOOL createPowerAssertion(NSString *__strong, IOPMAssertionID *)";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  __int16 v6 = 1024;
  int v7 = a2;
  _os_log_error_impl(&dword_21E079000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: Failed to create power assertion %@ with error %d", (uint8_t *)&v2, 0x1Cu);
}

void releasePowerAssertion_cold_1()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  v0[0] = 136315394;
  OUTLINED_FUNCTION_6();
  _os_log_error_impl(&dword_21E079000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%s: Failed to release power assertion with error %d", (uint8_t *)v0, 0x12u);
}

void UARPUtilsCreateTemporaryFolder_cold_1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_1(&dword_21E079000, &_os_log_internal, v0, "Failed to set permission for location %@: %@", v1, v2, v3, v4, v5);
}

void UARPUtilsCreateTemporaryFolder_cold_2()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_1(&dword_21E079000, &_os_log_internal, v0, "Unable to create directory at %@ with %@", v1, v2, v3, v4, v5);
}

void postStagingStatusForModelIdentifier_cold_1()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  v0[0] = 136315394;
  OUTLINED_FUNCTION_6();
  _os_log_error_impl(&dword_21E079000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed to register for %s (%u)", (uint8_t *)v0, 0x12u);
}

void UARPCleanupAgedFiles_cold_1(uint8_t *buf, uint64_t a2, void *a3)
{
  *(_DWORD *)buf = 138412290;
  *a3 = a2;
  _os_log_debug_impl(&dword_21E079000, &_os_log_internal, OS_LOG_TYPE_DEBUG, "Removing Expired File at %@", buf, 0xCu);
}

void UARPCopyFile_cold_1(void *a1, void *a2, uint64_t a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint8_t v5 = [a1 path];
  __int16 v6 = [a2 path];
  int v7 = 138412802;
  uint64_t v8 = v5;
  __int16 v9 = 2112;
  long long v10 = v6;
  __int16 v11 = 2112;
  uint64_t v12 = a3;
  _os_log_error_impl(&dword_21E079000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed to copy File %@ to New Location: %@ - %@", (uint8_t *)&v7, 0x20u);
}

void UARPCopyFile_cold_2(void *a1)
{
  uint64_t v1 = [a1 path];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_21E079000, &_os_log_internal, v2, "Cannot copy file, Source File does not exist: %@", v3, v4, v5, v6, v7);
}

void UARPWriteFile_cold_1(void *a1)
{
  uint64_t v1 = [a1 path];
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_1(&dword_21E079000, &_os_log_internal, v2, "Failed to create File Handle at: %@ - %@", v3, v4, v5, v6, v7);
}

void UARPWriteFile_cold_2(void *a1)
{
  uint64_t v1 = [a1 path];
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_1(&dword_21E079000, &_os_log_internal, v2, "Failed to close File Handle at %@ - %@", v3, v4, v5, v6, v7);
}

void UARPWriteFile_cold_3(void *a1)
{
  uint64_t v1 = [a1 path];
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_1(&dword_21E079000, &_os_log_internal, v2, "Failed to write to File Handle at %@ - %@", v3, v4, v5, v6, v7);
}

void UARPWriteFile_cold_4(void *a1)
{
  uint64_t v1 = [a1 path];
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_1(&dword_21E079000, &_os_log_internal, v2, "Failed to find End of File to File Handle at %@ - %@", v3, v4, v5, v6, v7);
}

void UARPWriteFile_cold_5(void *a1)
{
  uint64_t v1 = [a1 path];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_2(&dword_21E079000, &_os_log_internal, v2, "Unable to create File at: %@", v3, v4, v5, v6, v7);
}

uint64_t __getCSCoreSpeechServicesClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getCSCoreSpeechServicesAccessoryInfoClass_block_invoke_cold_1(v0);
}

uint64_t __getCSCoreSpeechServicesAccessoryInfoClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[UARPHeySiriModelVoiceAssist currentHeySiriModel:fallbackModel:error:](v0);
}

uint64_t AMAuthInstallApCreatePersonalizedResponse()
{
  return MEMORY[0x270F980B0]();
}

uint64_t AMAuthInstallCreate()
{
  return MEMORY[0x270F980F0]();
}

uint64_t AMAuthInstallLogSetHandler()
{
  return MEMORY[0x270F980F8]();
}

uint64_t AMAuthInstallSetSigningServerURL()
{
  return MEMORY[0x270F98118]();
}

uint64_t AMAuthInstallSsoEnable()
{
  return MEMORY[0x270F98120]();
}

uint64_t AMAuthInstallSsoInitialize()
{
  return MEMORY[0x270F98128]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

uint64_t CCDigestFinal()
{
  return MEMORY[0x270ED7988]();
}

uint64_t CCDigestGetOutputSize()
{
  return MEMORY[0x270ED7990]();
}

uint64_t CCDigestInit()
{
  return MEMORY[0x270ED7998]();
}

uint64_t CCDigestUpdate()
{
  return MEMORY[0x270ED79B0]();
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x270ED7B30](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x270ED7B38](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x270ED7B40](c, data, *(void *)&len);
}

int CC_SHA384_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return MEMORY[0x270ED7B50](md, c);
}

int CC_SHA384_Init(CC_SHA512_CTX *c)
{
  return MEMORY[0x270ED7B58](c);
}

int CC_SHA384_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x270ED7B60](c, data, *(void *)&len);
}

int CC_SHA512_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return MEMORY[0x270ED7B70](md, c);
}

int CC_SHA512_Init(CC_SHA512_CTX *c)
{
  return MEMORY[0x270ED7B78](c);
}

int CC_SHA512_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x270ED7B80](c, data, *(void *)&len);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

void CFRelease(CFTypeRef cf)
{
}

IOReturn IOPMAssertionCreateWithName(CFStringRef AssertionType, IOPMAssertionLevel AssertionLevel, CFStringRef AssertionName, IOPMAssertionID *AssertionID)
{
  return MEMORY[0x270EF4840](AssertionType, *(void *)&AssertionLevel, AssertionName, AssertionID);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return MEMORY[0x270EF4868](*(void *)&AssertionID);
}

CFTypeRef IOPSCopyPowerSourcesInfo(void)
{
  return (CFTypeRef)MEMORY[0x270EF4910]();
}

CFArrayRef IOPSCopyPowerSourcesList(CFTypeRef blob)
{
  return (CFArrayRef)MEMORY[0x270EF4918](blob);
}

CFDictionaryRef IOPSGetPowerSourceDescription(CFTypeRef blob, CFTypeRef ps)
{
  return (CFDictionaryRef)MEMORY[0x270EF4950](blob, ps);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

uint64_t PLLogRegisteredEvent()
{
  return MEMORY[0x270F55148]();
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

void bzero(void *a1, size_t a2)
{
}

size_t compression_decode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return MEMORY[0x270F98F48](dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, *(void *)&algorithm);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

void free(void *a1)
{
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x270ED9D98](a1, a2);
}

tm *__cdecl localtime(const time_t *a1)
{
  return (tm *)MEMORY[0x270EDA098](a1);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x270EDA760](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x270EDA768](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x270EDA798](*(void *)&token, state64);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
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

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void pcap_close(pcap_t *a1)
{
}

void pcap_dump(u_char *a1, const pcap_pkthdr *a2, const u_char *a3)
{
}

void pcap_dump_close(pcap_dumper_t *a1)
{
}

int pcap_dump_flush(pcap_dumper_t *a1)
{
  return MEMORY[0x270F9AB38](a1);
}

pcap_dumper_t *__cdecl pcap_dump_open(pcap_t *a1, const char *a2)
{
  return (pcap_dumper_t *)MEMORY[0x270F9AB40](a1, a2);
}

pcap_t *__cdecl pcap_open_dead(int a1, int a2)
{
  return (pcap_t *)MEMORY[0x270F9AB68](*(void *)&a1, *(void *)&a2);
}

objc_method_description protocol_getMethodDescription(Protocol *p, SEL aSel, BOOL isRequiredMethod, BOOL isInstanceMethod)
{
  uint64_t v4 = (const char *)MEMORY[0x270F9AAC8](p, aSel, isRequiredMethod, isInstanceMethod);
  result.types = v5;
  result.name = v4;
  return result;
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x270EDB2B8]();
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x270EDB2C0]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x270EDB2D8]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return (char *)MEMORY[0x270EDB650](__s1, __n);
}

time_t time(time_t *a1)
{
  return MEMORY[0x270EDB930](a1);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x270EDBB18](__str, __size, __format, a4);
}