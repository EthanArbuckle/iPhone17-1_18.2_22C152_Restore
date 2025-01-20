@interface ANEDeviceInfo
@end

@implementation ANEDeviceInfo

void __28___ANEDeviceInfo_aneSubType__block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 <= 159)
  {
    if (a2 <= 63)
    {
      switch(a2)
      {
        case 1:
        case 4:
          v3 = (void *)+[_ANEDeviceInfo aneSubType]::aneSubtypeStr;
          v4 = @"h11";
          goto LABEL_35;
        case 2:
          v3 = (void *)+[_ANEDeviceInfo aneSubType]::aneSubtypeStr;
          v4 = @"m9";
          goto LABEL_35;
        case 3:
        case 5:
        case 6:
        case 7:
          goto LABEL_38;
        case 8:
          v3 = (void *)+[_ANEDeviceInfo aneSubType]::aneSubtypeStr;
          v4 = @"h12";
          goto LABEL_35;
        default:
          if (a2 == 32) {
            goto LABEL_32;
          }
          goto LABEL_38;
      }
    }
    if (a2 > 111)
    {
      if (a2 != 112 && a2 != 128)
      {
        if (a2 != 144) {
          goto LABEL_38;
        }
        goto LABEL_30;
      }
      goto LABEL_20;
    }
    if (a2 != 64 && a2 != 96) {
      goto LABEL_38;
    }
LABEL_32:
    v3 = (void *)+[_ANEDeviceInfo aneSubType]::aneSubtypeStr;
    v4 = @"h13";
LABEL_35:
    +[_ANEDeviceInfo aneSubType]::aneSubtypeStr = (uint64_t)v4;

    return;
  }
  if (a2 <= 223)
  {
    if (a2 > 191)
    {
      if (a2 != 192)
      {
        if (a2 != 208) {
          goto LABEL_38;
        }
LABEL_29:
        v3 = (void *)+[_ANEDeviceInfo aneSubType]::aneSubtypeStr;
        v4 = @"h16";
        goto LABEL_35;
      }
    }
    else
    {
      if (a2 == 160)
      {
LABEL_20:
        v3 = (void *)+[_ANEDeviceInfo aneSubType]::aneSubtypeStr;
        v4 = @"h14";
        goto LABEL_35;
      }
      if (a2 != 176) {
        goto LABEL_38;
      }
    }
LABEL_30:
    v3 = (void *)+[_ANEDeviceInfo aneSubType]::aneSubtypeStr;
    v4 = @"h15";
    goto LABEL_35;
  }
  if (a2 <= 255)
  {
    if (a2 != 224)
    {
      if (a2 == 240)
      {
        v3 = (void *)+[_ANEDeviceInfo aneSubType]::aneSubtypeStr;
        v4 = @"m11";
        goto LABEL_35;
      }
      goto LABEL_38;
    }
    goto LABEL_30;
  }
  if (a2 == 256 || a2 == 272) {
    goto LABEL_29;
  }
  if (a2 == 512)
  {
    v3 = (void *)+[_ANEDeviceInfo aneSubType]::aneSubtypeStr;
    v4 = @"h17";
    goto LABEL_35;
  }
LABEL_38:
  v5 = (void *)+[_ANEDeviceInfo aneSubType]::aneSubtypeStr;
  +[_ANEDeviceInfo aneSubType]::aneSubtypeStr = @"h15";

  v6 = +[_ANELog framework];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(*(SEL *)(a1 + 32));
    objc_claimAutoreleasedReturnValue();
    __28___ANEDeviceInfo_aneSubType__block_invoke_cold_1();
  }
}

uint64_t __24___ANEDeviceInfo_hasANE__block_invoke_2()
{
  uint64_t result = MGGetBoolAnswer();
  +[_ANEDeviceInfo hasANE]::hasANE = result;
  return result;
}

uint64_t __30___ANEDeviceInfo_aneBoardType__block_invoke()
{
  uint64_t result = MGGetSInt64Answer();
  +[_ANEDeviceInfo aneBoardType]::boardType = result;
  return result;
}

uint64_t __34___ANEDeviceInfo_isVirtualMachine__block_invoke()
{
  int v2 = 0;
  size_t v1 = 4;
  uint64_t result = sysctlbyname("kern.hv_vmm_present", &v2, &v1, 0, 0);
  if (!result) {
    +[_ANEDeviceInfo isVirtualMachine]::isVirtualMachine = v2 != 0;
  }
  return result;
}

uint64_t __33___ANEDeviceInfo_isInternalBuild__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  +[_ANEDeviceInfo isInternalBuild]::isInternalBuild = result;
  return result;
}

void __24___ANEDeviceInfo_hasANE__block_invoke()
{
  +[_ANEDeviceInfo hasANE]::hasANE = 0;
}

void __37___ANEDeviceInfo_aneArchitectureType__block_invoke()
{
  v0 = NSString;
  id v5 = +[_ANEDeviceInfo aneSubType];
  size_t v1 = +[_ANEDeviceInfo aneSubTypeVariant];
  int v2 = +[_ANEDeviceInfo aneSubTypeProductVariant];
  uint64_t v3 = [v0 stringWithFormat:@"%@%@%@", v5, v1, v2];
  v4 = (void *)+[_ANEDeviceInfo aneArchitectureType]::aneArchitectureTypeStr;
  +[_ANEDeviceInfo aneArchitectureType]::aneArchitectureTypeStr = v3;
}

uint64_t __28___ANEDeviceInfo_aneSubType__block_invoke_53(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

void __35___ANEDeviceInfo_aneSubTypeVariant__block_invoke(uint64_t a1, uint64_t a2)
{
  *((void *)&v3 + 1) = a2;
  *(void *)&long long v3 = a2 - 64;
  unint64_t v2 = v3 >> 4;
  if (v2 > 0xD) {
    v4 = &stru_1F35E5710;
  }
  else {
    v4 = off_1E6C1C108[v2];
  }
  id v5 = (void *)+[_ANEDeviceInfo aneSubTypeVariant]::aneSubTypeVariantStr;
  +[_ANEDeviceInfo aneSubTypeVariant]::aneSubTypeVariantStr = (uint64_t)v4;
}

uint64_t __35___ANEDeviceInfo_aneSubTypeVariant__block_invoke_62(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

void __42___ANEDeviceInfo_aneSubTypeProductVariant__block_invoke()
{
  v0 = (void *)+[_ANEDeviceInfo aneSubTypeProductVariant]::aneSubTypeProductVariantStr;
  +[_ANEDeviceInfo aneSubTypeProductVariant]::aneSubTypeProductVariantStr = (uint64_t)&stru_1F35E5710;
}

uint64_t __42___ANEDeviceInfo_aneSubTypeProductVariant__block_invoke_65(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __30___ANEDeviceInfo_buildVersion__block_invoke()
{
  +[_ANEDeviceInfo buildVersion]::buildVersionStr = MGGetStringAnswer();
  return MEMORY[0x1F41817F8]();
}

uint64_t __29___ANEDeviceInfo_productName__block_invoke()
{
  +[_ANEDeviceInfo productName]::productNameStr = MGGetStringAnswer();
  return MEMORY[0x1F41817F8]();
}

void __28___ANEDeviceInfo_aneSubType__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_6(v1, v2, 5.7781e-34);
  *(_WORD *)(v3 + 12) = 2048;
  *(void *)(v3 + 14) = v4;
  *(_WORD *)(v3 + 22) = 2112;
  *(void *)(v3 + 24) = v5;
  _os_log_error_impl(&dword_1DB8AB000, v7, OS_LOG_TYPE_ERROR, "%@: Unknown kMGQAppleNeuralEngineSubtype=0x%llx using (%@)", v6, 0x20u);
}

@end