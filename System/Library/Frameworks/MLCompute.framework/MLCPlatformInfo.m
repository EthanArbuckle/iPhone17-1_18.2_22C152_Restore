@interface MLCPlatformInfo
+ (BOOL)aneUsageUnsupported;
+ (BOOL)gpuUsageUnsupported;
+ (BOOL)gpuUsageUnsupportedIncludingLowPower:(BOOL)a3;
+ (BOOL)gpuUseMPSGraphConvolution;
+ (BOOL)isAneGraphPartitioningConfigSet;
+ (BOOL)isAnePlistKept;
+ (BOOL)isAneSaveGraphPartitioningConfigSet;
+ (BOOL)isAneSubTypeVersionGreaterThanOrEqualTo:(unint64_t)a3;
+ (BOOL)isInternalBuild;
+ (BOOL)isRNGSeeded;
+ (BOOL)multiGPUUsageUnsupported;
+ (id)aneGraphPartitioningConfigEnvVariable;
+ (id)aneKeepPlistEnvVariable;
+ (id)aneSaveGraphPartitioningConfig;
+ (id)aneSubType;
+ (id)bootArgs;
+ (id)buildVersion;
+ (id)getRandomSeed;
+ (id)mpsGraphConvolutionEnvVariable;
+ (id)osVersion;
+ (id)seedEnvVariable;
+ (int)aneSubTypeVersion;
+ (int)getMinGpuSocVersionForMicroBenchmark;
+ (int64_t)randomSeed;
+ (void)aneSubTypeVersion;
+ (void)setRandomSeedTo:(id)a3;
@end

@implementation MLCPlatformInfo

+ (BOOL)isInternalBuild
{
  if (isInternalBuild_onceToken != -1) {
    dispatch_once(&isInternalBuild_onceToken, &__block_literal_global_1);
  }
  return isInternalBuild_isInternalBuild;
}

uint64_t __34__MLCPlatformInfo_isInternalBuild__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  isInternalBuild_isInternalBuild = result;
  return result;
}

+ (BOOL)gpuUsageUnsupported
{
  return [a1 gpuUsageUnsupportedIncludingLowPower:1];
}

+ (BOOL)gpuUsageUnsupportedIncludingLowPower:(BOOL)a3
{
  v3 = +[MLCDeviceGPU filteredGPUListIncludingLowPoweredBuiltin:a3];
  BOOL v4 = [v3 count] == 0;

  return v4;
}

+ (BOOL)multiGPUUsageUnsupported
{
  if ([a1 gpuUsageUnsupported]) {
    return 1;
  }
  v3 = +[MLCDeviceGPU filteredGPUListIncludingLowPoweredBuiltin:0];
  BOOL v4 = +[MLCDeviceGPU multiGPUNotSupportedInFilteredGPUList:v3];

  return v4;
}

+ (BOOL)aneUsageUnsupported
{
  return !+[MLCDeviceANE hasANE];
}

+ (id)buildVersion
{
  if (buildVersion_onceToken != -1) {
    dispatch_once(&buildVersion_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)buildVersion_buildVersionStr;

  return v2;
}

uint64_t __31__MLCPlatformInfo_buildVersion__block_invoke()
{
  buildVersion_buildVersionStr = MGGetStringAnswer();

  return MEMORY[0x1F41817F8]();
}

+ (id)osVersion
{
  v2 = (__CFString *)MGCopyAnswer();
  v3 = (__CFString *)MGCopyAnswer();
  if (v2) {
    BOOL v4 = v2;
  }
  else {
    BOOL v4 = @"???";
  }
  v5 = v4;
  if (v3) {
    v6 = v3;
  }
  else {
    v6 = @"???";
  }
  v7 = v6;
  v8 = [NSString stringWithFormat:@"%@ %@ (%@)", @"iOS", v5, v7];
  if (v2) {
    CFRelease(v2);
  }
  if (v3) {
    CFRelease(v3);
  }

  return v8;
}

+ (id)bootArgs
{
  v2 = malloc_type_calloc(1uLL, 0x400uLL, 0x6E9FF526uLL);
  size_t v5 = 1023;
  if (sysctlbyname("kern.bootargs", v2, &v5, 0, 0))
  {
    v3 = &stru_1F38596E0;
  }
  else
  {
    v2[1023] = 0;
    objc_msgSend(NSString, "stringWithFormat:", @"%s", v2);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  free(v2);

  return v3;
}

+ (id)mpsGraphConvolutionEnvVariable
{
  if (mpsGraphConvolutionEnvVariable_onceToken != -1) {
    dispatch_once(&mpsGraphConvolutionEnvVariable_onceToken, &__block_literal_global_32);
  }
  v2 = (void *)mpsGraphConvolutionEnvVariable_envVariable;

  return v2;
}

void __49__MLCPlatformInfo_mpsGraphConvolutionEnvVariable__block_invoke()
{
  id v3 = [MEMORY[0x1E4F28F80] processInfo];
  v0 = [v3 environment];
  uint64_t v1 = [v0 objectForKeyedSubscript:@"MLC_GPU_USE_MPSGRAPHCONVOLUTION"];
  v2 = (void *)mpsGraphConvolutionEnvVariable_envVariable;
  mpsGraphConvolutionEnvVariable_envVariable = v1;
}

+ (BOOL)gpuUseMPSGraphConvolution
{
  if (gpuUseMPSGraphConvolution_onceToken != -1) {
    dispatch_once(&gpuUseMPSGraphConvolution_onceToken, &__block_literal_global_38);
  }
  return gpuUseMPSGraphConvolution_useMPSGraphConvolution;
}

void __44__MLCPlatformInfo_gpuUseMPSGraphConvolution__block_invoke()
{
  v0 = +[MLCPlatformInfo mpsGraphConvolutionEnvVariable];
  gpuUseMPSGraphConvolution_useMPSGraphConvolution = v0 != 0;
}

+ (id)seedEnvVariable
{
  if (seedEnvVariable_onceToken != -1) {
    dispatch_once(&seedEnvVariable_onceToken, &__block_literal_global_41);
  }
  v2 = (void *)seedEnvVariable_envVariable;

  return v2;
}

void __34__MLCPlatformInfo_seedEnvVariable__block_invoke()
{
  id v3 = [MEMORY[0x1E4F28F80] processInfo];
  v0 = [v3 environment];
  uint64_t v1 = [v0 objectForKeyedSubscript:@"MLC_USE_RNG_SEED"];
  v2 = (void *)seedEnvVariable_envVariable;
  seedEnvVariable_envVariable = v1;
}

+ (BOOL)isRNGSeeded
{
  if (isRNGSeeded_onceToken != -1) {
    dispatch_once(&isRNGSeeded_onceToken, &__block_literal_global_46);
  }
  return isSeeded;
}

void __30__MLCPlatformInfo_isRNGSeeded__block_invoke()
{
  if (isSeeded)
  {
    isSeeded = 1;
  }
  else
  {
    v0 = +[MLCPlatformInfo seedEnvVariable];
    isSeeded = v0 != 0;
  }
}

+ (int64_t)randomSeed
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__MLCPlatformInfo_randomSeed__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a2;
  if (randomSeed_onceToken != -1) {
    dispatch_once(&randomSeed_onceToken, block);
  }
  return randomSeed;
}

void __29__MLCPlatformInfo_randomSeed__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = +[MLCPlatformInfo seedEnvVariable];
  id v3 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v2, "longLongValue"));
  randomSeed = [v3 longValue];

  BOOL v4 = +[MLCLog framework];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    size_t v5 = NSStringFromSelector(*(SEL *)(a1 + 32));
    int v6 = 138412546;
    v7 = v5;
    __int16 v8 = 2048;
    uint64_t v9 = randomSeed;
    _os_log_impl(&dword_1DD0C9000, v4, OS_LOG_TYPE_INFO, "%@: Random seed requested. Found seed: %ld", (uint8_t *)&v6, 0x16u);
  }
}

+ (void)setRandomSeedTo:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__MLCPlatformInfo_setRandomSeedTo___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (setRandomSeedTo__onceToken != -1) {
    dispatch_once(&setRandomSeedTo__onceToken, block);
  }
  id v6 = a1;
  objc_sync_enter(v6);
  if ([v6 isRNGSeeded])
  {
    v7 = +[MLCLog framework];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      __int16 v8 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      v11 = v8;
      __int16 v12 = 2048;
      uint64_t v13 = randomSeed;
      _os_log_impl(&dword_1DD0C9000, v7, OS_LOG_TYPE_INFO, "%@: Overwriting the random seed number which has already been set to : %ld", buf, 0x16u);
    }
  }
  isSeeded = 1;
  randomSeed = [v5 longValue];
  objc_sync_exit(v6);
}

uint64_t __35__MLCPlatformInfo_setRandomSeedTo___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) randomSeed];
}

+ (id)getRandomSeed
{
  id v2 = a1;
  objc_sync_enter(v2);
  if ([v2 isRNGSeeded])
  {
    id v3 = objc_msgSend(NSNumber, "numberWithLong:", objc_msgSend(v2, "randomSeed"));
  }
  else
  {
    id v3 = 0;
  }
  objc_sync_exit(v2);

  return v3;
}

+ (int)getMinGpuSocVersionForMicroBenchmark
{
  return 13;
}

+ (id)aneSubType
{
  if (aneSubType_onceToken != -1) {
    dispatch_once(&aneSubType_onceToken, &__block_literal_global_50);
  }
  id v2 = (void *)aneSubType_aneSubType;

  return v2;
}

uint64_t __29__MLCPlatformInfo_aneSubType__block_invoke()
{
  if (AppleNeuralEngineLibrary_onceToken_0 != -1) {
    dispatch_once(&AppleNeuralEngineLibrary_onceToken_0, &__block_literal_global_102);
  }
  if (AppleNeuralEngineLibrary_frameworkLibrary_0 && softLinkClass_ANEDeviceInfo())
  {
    uint64_t v0 = [softLinkClass_ANEDeviceInfo() aneSubType];
  }
  else
  {
    uint64_t v0 = [NSString string];
  }
  aneSubType_aneSubType = v0;

  return MEMORY[0x1F41817F8]();
}

+ (int)aneSubTypeVersion
{
  id v3 = [a1 aneSubType];
  BOOL v4 = [v3 capitalizedString];

  uint64_t v5 = [v4 rangeOfString:@"H"];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = +[MLCLog framework];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      +[MLCPlatformInfo aneSubTypeVersion];
    }

    int v7 = 0;
  }
  else
  {
    size_t v8 = strlen((const char *)[@"H" fileSystemRepresentation]) + v5;
    objc_msgSend(v4, "substringWithRange:", v8, objc_msgSend(v4, "length") - v8);
    id v9 = objc_claimAutoreleasedReturnValue();
    int v7 = atoi((const char *)[v9 fileSystemRepresentation]);
  }
  return v7;
}

+ (BOOL)isAneSubTypeVersionGreaterThanOrEqualTo:(unint64_t)a3
{
  return (int)[a1 aneSubTypeVersion] >= (int)a3;
}

+ (id)aneKeepPlistEnvVariable
{
  if (aneKeepPlistEnvVariable_onceToken != -1) {
    dispatch_once(&aneKeepPlistEnvVariable_onceToken, &__block_literal_global_55);
  }
  id v2 = (void *)aneKeepPlistEnvVariable_envVariable;

  return v2;
}

void __42__MLCPlatformInfo_aneKeepPlistEnvVariable__block_invoke()
{
  id v3 = [MEMORY[0x1E4F28F80] processInfo];
  uint64_t v0 = [v3 environment];
  uint64_t v1 = [v0 objectForKeyedSubscript:@"MLC_ANE_KEEP_PLIST"];
  id v2 = (void *)aneKeepPlistEnvVariable_envVariable;
  aneKeepPlistEnvVariable_envVariable = v1;
}

+ (BOOL)isAnePlistKept
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__MLCPlatformInfo_isAnePlistKept__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (isAnePlistKept_onceToken != -1) {
    dispatch_once(&isAnePlistKept_onceToken, block);
  }
  return isAnePlistKept_isEnvVariableSet;
}

void __33__MLCPlatformInfo_isAnePlistKept__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) aneKeepPlistEnvVariable];
  isAnePlistKept_isEnvVariableSet = v1 != 0;
}

+ (id)aneGraphPartitioningConfigEnvVariable
{
  if (aneGraphPartitioningConfigEnvVariable_onceToken != -1) {
    dispatch_once(&aneGraphPartitioningConfigEnvVariable_onceToken, &__block_literal_global_60);
  }
  id v2 = (void *)aneGraphPartitioningConfigEnvVariable_envVariable;

  return v2;
}

void __56__MLCPlatformInfo_aneGraphPartitioningConfigEnvVariable__block_invoke()
{
  id v3 = [MEMORY[0x1E4F28F80] processInfo];
  uint64_t v0 = [v3 environment];
  uint64_t v1 = [v0 objectForKeyedSubscript:@"MLC_ANE_GRAPH_PARTITIONING_CONFIG"];
  id v2 = (void *)aneGraphPartitioningConfigEnvVariable_envVariable;
  aneGraphPartitioningConfigEnvVariable_envVariable = v1;
}

+ (BOOL)isAneGraphPartitioningConfigSet
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__MLCPlatformInfo_isAneGraphPartitioningConfigSet__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (isAneGraphPartitioningConfigSet_onceToken != -1) {
    dispatch_once(&isAneGraphPartitioningConfigSet_onceToken, block);
  }
  return isAneGraphPartitioningConfigSet_isEnvVariableSet;
}

void __50__MLCPlatformInfo_isAneGraphPartitioningConfigSet__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) aneGraphPartitioningConfigEnvVariable];
  isAneGraphPartitioningConfigSet_isEnvVariableSet = v1 != 0;
}

+ (id)aneSaveGraphPartitioningConfig
{
  if (aneSaveGraphPartitioningConfig_onceToken != -1) {
    dispatch_once(&aneSaveGraphPartitioningConfig_onceToken, &__block_literal_global_65);
  }
  id v2 = (void *)aneSaveGraphPartitioningConfig_envVariable;

  return v2;
}

void __49__MLCPlatformInfo_aneSaveGraphPartitioningConfig__block_invoke()
{
  id v3 = [MEMORY[0x1E4F28F80] processInfo];
  uint64_t v0 = [v3 environment];
  uint64_t v1 = [v0 objectForKeyedSubscript:@"MLC_ANE_SAVE_GRAPH_PARTITIONING_CONFIG"];
  id v2 = (void *)aneSaveGraphPartitioningConfig_envVariable;
  aneSaveGraphPartitioningConfig_envVariable = v1;
}

+ (BOOL)isAneSaveGraphPartitioningConfigSet
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__MLCPlatformInfo_isAneSaveGraphPartitioningConfigSet__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (isAneSaveGraphPartitioningConfigSet_onceToken != -1) {
    dispatch_once(&isAneSaveGraphPartitioningConfigSet_onceToken, block);
  }
  return isAneSaveGraphPartitioningConfigSet_isEnvVariableSet;
}

void __54__MLCPlatformInfo_isAneSaveGraphPartitioningConfigSet__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) aneSaveGraphPartitioningConfig];
  isAneSaveGraphPartitioningConfigSet_isEnvVariableSet = v1 != 0;
}

+ (void)aneSubTypeVersion
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = NSStringFromSelector(a1);
  int v6 = 138412802;
  int v7 = v5;
  __int16 v8 = 2112;
  id v9 = @"H";
  __int16 v10 = 2112;
  uint64_t v11 = a2;
  _os_log_debug_impl(&dword_1DD0C9000, a3, OS_LOG_TYPE_DEBUG, "%@: substring %@ is not found in ANE subtype=%@", (uint8_t *)&v6, 0x20u);
}

@end