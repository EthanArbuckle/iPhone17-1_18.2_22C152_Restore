@interface CBU
@end

@implementation CBU

void __CBU_SyncDisplayStateControlSupported_block_invoke(uint64_t a1)
{
  v10 = v23;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v17 = a1;
  uint64_t v16 = a1;
  int v11 = 1;
  if (!CBU_IsWatch())
  {
    v1 = v10;
    v10[26] = xmmword_1BA612420;
    *((_DWORD *)v1 + 108) = -1820426635;
    v1[24] = xmmword_1BA612434;
    *((_DWORD *)v1 + 100) = -937652876;
    v1[22] = xmmword_1BA612448;
    *((_DWORD *)v1 + 92) = 1874287171;
    v1[20] = xmmword_1BA61245C;
    *((_DWORD *)v1 + 84) = -781324731;
    v1[18] = xmmword_1BA612470;
    *((_DWORD *)v1 + 76) = -609570151;
    v1[16] = xmmword_1BA612484;
    *((_DWORD *)v1 + 68) = -874769875;
    v1[14] = xmmword_1BA612498;
    *((_DWORD *)v1 + 60) = 1214880059;
    v1[12] = xmmword_1BA6124AC;
    *((_DWORD *)v1 + 52) = 426359977;
    v1[10] = xmmword_1BA6124C0;
    *((_DWORD *)v1 + 44) = 1223847566;
    v1[8] = xmmword_1BA6124D4;
    *((_DWORD *)v1 + 36) = 185580364;
    v1[6] = xmmword_1BA6124E8;
    *((_DWORD *)v1 + 28) = -773054213;
    v1[4] = xmmword_1BA6124FC;
    *((_DWORD *)v1 + 20) = -1204420428;
    v1[2] = xmmword_1BA612510;
    *((_DWORD *)v1 + 12) = 958549802;
    v23[0] = xmmword_1BA612524;
    *((_DWORD *)v1 + 4) = -12497897;
    long long v21 = xmmword_1BA612538;
    int v22 = 1377540371;
    long long v19 = xmmword_1BA61254C;
    int v20 = -518121279;
    v9 = v2;
    v2[0] = &v35;
    v2[1] = &v34;
    v2[2] = &v33;
    v2[3] = &v32;
    v2[4] = &v31;
    v2[5] = &v30;
    v2[6] = &v29;
    v2[7] = &v28;
    v2[8] = &v27;
    v2[9] = &v26;
    v2[10] = &v25;
    v2[11] = &v24;
    v2[12] = v23;
    v2[13] = &v21;
    v2[14] = &v19;
    v2[15] = 0;
    v2[16] = 0;
    int v11 = MGIsDeviceOneOfType();
  }
  CBU_SyncDisplayStateControlSupported_SDSCEnabled = v11 & 1;
  Boolean keyExistsAndHasValidFormat = 0;
  Boolean AppBooleanValue = 0;
  Boolean AppBooleanValue = CFPreferencesGetAppBooleanValue(@"SynchronousDisplayStateControl", (CFStringRef)*MEMORY[0x1E4F1D3D8], &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    CBU_SyncDisplayStateControlSupported_SDSCEnabled = AppBooleanValue != 0;
    osos_log_t log = 0;
    if (_COREBRIGHTNESS_LOG_DEFAULT || init_default_corebrightness_log())
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        inited = init_default_corebrightness_log();
      }
      os_log_t v7 = inited;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        v6 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        v6 = init_default_corebrightness_log();
      }
      os_log_t v7 = v6;
    }
    osos_log_t log = v7;
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      os_log_t log = oslog;
      *(_DWORD *)v4 = type;
      buf = v18;
      __os_log_helper_16_0_1_4_0((uint64_t)v18, AppBooleanValue);
      _os_log_impl(&dword_1BA438000, log, v4[0], "Synchronous display state control default override -> %i ", buf, 8u);
    }
  }
}

uint64_t __CBU_ForceUpdateFrequencyAndFrameSkip_block_invoke()
{
  uint64_t result = MGIsDeviceOneOfType();
  CBU_ForceUpdateFrequencyAndFrameSkip_force = result & 1;
  return result;
}

uint64_t __CBU_ForceFrameAfterBrightnessUpdate_block_invoke()
{
  CBU_ForceFrameAfterBrightnessUpdate_force = (CBU_ForceFrameAfterBrightnessUpdate_force & 1 | MGIsDeviceOneOfType() & 1) != 0;
  CBU_ForceFrameAfterBrightnessUpdate_force = (CBU_ForceFrameAfterBrightnessUpdate_force & 1 | MGIsDeviceOneOfType() & 1) != 0;
  CBU_ForceFrameAfterBrightnessUpdate_force = (CBU_ForceFrameAfterBrightnessUpdate_force & 1 | MGIsDeviceOneOfType() & 1) != 0;
  CBU_ForceFrameAfterBrightnessUpdate_force = (CBU_ForceFrameAfterBrightnessUpdate_force & 1 | MGIsDeviceOneOfType() & 1) != 0;
  CBU_ForceFrameAfterBrightnessUpdate_force = (CBU_ForceFrameAfterBrightnessUpdate_force & 1 | MGIsDeviceOneOfType() & 1) != 0;
  CBU_ForceFrameAfterBrightnessUpdate_force = (CBU_ForceFrameAfterBrightnessUpdate_force & 1 | MGIsDeviceOneOfType() & 1) != 0;
  CBU_ForceFrameAfterBrightnessUpdate_force = (CBU_ForceFrameAfterBrightnessUpdate_force & 1 | MGIsDeviceOneOfType() & 1) != 0;
  uint64_t result = MGIsDeviceOneOfType();
  CBU_ForceFrameAfterBrightnessUpdate_force = (CBU_ForceFrameAfterBrightnessUpdate_force & 1 | result & 1) != 0;
  return result;
}

uint64_t __CBU_PassContrastEnhancerStrengthThroughSyncDBV_block_invoke()
{
  char v4 = 0;
  if (CBU_PassContrastEnhancerStrengthThroughSyncDBV_pass)
  {
    uint64_t result = MGIsDeviceOneOfType();
    char v4 = result ^ 1;
  }
  CBU_PassContrastEnhancerStrengthThroughSyncDBV_pass = v4 & 1;
  char v3 = 0;
  if (v4)
  {
    uint64_t result = MGIsDeviceOneOfType();
    char v3 = result ^ 1;
  }
  CBU_PassContrastEnhancerStrengthThroughSyncDBV_pass = v3 & 1;
  char v2 = 0;
  if (v3)
  {
    uint64_t result = MGIsDeviceOneOfType();
    char v2 = result ^ 1;
  }
  CBU_PassContrastEnhancerStrengthThroughSyncDBV_pass = v2 & 1;
  char v1 = 0;
  if (v2)
  {
    uint64_t result = MGIsDeviceOneOfType();
    char v1 = result ^ 1;
  }
  CBU_PassContrastEnhancerStrengthThroughSyncDBV_pass = v1 & 1;
  return result;
}

uint64_t __CBU_IsSecureIndicatorSupported_block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2[11] = a1;
  v2[10] = a1;
  long long v17 = xmmword_1BA6127B8;
  int v18 = 802516499;
  long long v15 = xmmword_1BA6127CC;
  int v16 = -1919324456;
  long long v13 = xmmword_1BA6127E0;
  int v14 = 1127969586;
  long long v11 = xmmword_1BA6127F4;
  int v12 = 1292009573;
  long long v9 = xmmword_1BA612808;
  int v10 = 1223847566;
  long long v7 = xmmword_1BA61281C;
  int v8 = 185580364;
  long long v5 = xmmword_1BA612830;
  int v6 = 1214880059;
  long long v3 = xmmword_1BA612844;
  int v4 = 426359977;
  v2[9] = v2;
  v2[0] = &v15;
  v2[1] = &v13;
  v2[2] = &v11;
  v2[3] = &v9;
  v2[4] = &v7;
  v2[5] = &v5;
  v2[6] = &v3;
  v2[7] = 0;
  v2[8] = 0;
  uint64_t result = MGIsDeviceOneOfType();
  CBU_IsSecureIndicatorSupported_supported = result & 1;
  return result;
}

uint64_t __CBU_RampLumaBoostFactorInAOD_block_invoke()
{
  uint64_t result = MGIsDeviceOneOfType();
  CBU_RampLumaBoostFactorInAOD_uint64_t result = result & 1;
  return result;
}

void __CBU_IsR2RSupported_block_invoke()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (get_int_from_bootarg("als_R2R_supported", &CBU_IsR2RSupported_bootArgsR2ROverride))
  {
    CBU_IsR2RSupported_uint64_t result = CBU_IsR2RSupported_bootArgsR2ROverride != 0;
    if (_COREBRIGHTNESS_LOG_DEFAULT || init_default_corebrightness_log())
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t inited = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t inited = init_default_corebrightness_log();
      }
      char v2 = inited;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT) {
        uint64_t v1 = _COREBRIGHTNESS_LOG_DEFAULT;
      }
      else {
        uint64_t v1 = init_default_corebrightness_log();
      }
      char v2 = v1;
    }
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      if (CBU_IsR2RSupported_result) {
        v0 = "enabled";
      }
      else {
        v0 = "disabled";
      }
      __os_log_helper_16_2_3_8_32_8_32_4_0((uint64_t)v4, (uint64_t)v0, (uint64_t)"als_R2R_supported", CBU_IsR2RSupported_bootArgsR2ROverride);
      _os_log_impl(&dword_1BA438000, v2, OS_LOG_TYPE_DEFAULT, "R2R support is %s by %s = %d", v4, 0x1Cu);
    }
  }
}

uint64_t __CBU_ShouldNotHandleExistingInternalDisplayAttachment_block_invoke()
{
  uint64_t result = MGIsDeviceOneOfType();
  CBU_ShouldNotHandleExistingInternalDisplayAttachment_uint64_t result = result & 1;
  return result;
}

uint64_t __CBU_ImplicitUserInteractedWithUI_block_invoke()
{
  uint64_t result = MGIsDeviceOneOfType();
  CBU_ImplicitUserInteractedWithUI_uint64_t result = result & 1;
  return result;
}

@end