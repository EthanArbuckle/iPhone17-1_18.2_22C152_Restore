@interface _ANEStrings
+ (BOOL)trimmedModelPath:(id)a3 trimmedPath:(id *)a4;
+ (id)adapterWeightsAccessEntitlement;
+ (id)adapterWeightsAccessEntitlementBypassBootArg;
+ (id)aggressivePowerSavingEntitlement;
+ (id)aneuserdCacheDeleteServiceName;
+ (id)buildSpecificModelDataVaultDirectory;
+ (id)buildSpecificUserModelDataVaultDirectory;
+ (id)cacheDeleteServiceName;
+ (id)cloneDirectory;
+ (id)compilerServiceAccessEntitlement;
+ (id)coreAnalyticsANEUsageDefaultReportedClient;
+ (id)coreAnalyticsANEUsageKeyGroup;
+ (id)dataVaultStorageClass;
+ (id)defaultANECIRFileName;
+ (id)defaultANECIROptionsFileName;
+ (id)defaultCompilerOptionsFilename;
+ (id)defaultMILFileName;
+ (id)defaultWeightFileName;
+ (id)errorDomainCompiler;
+ (id)errorDomainEspresso;
+ (id)errorDomainGeneric;
+ (id)errorDomainVirtIO;
+ (id)inMemoryModelCacheName;
+ (id)internalLibraryPath;
+ (id)launchIOKitEvent;
+ (id)launchUserIOKitEvent;
+ (id)machServiceName;
+ (id)machServiceNamePrivate;
+ (id)modelAssetsCacheName;
+ (id)modelBinaryName;
+ (id)modelCacheRetainName;
+ (id)modelDataVaultDirectory;
+ (id)modelPurgeInAllPartitionsEntitlement;
+ (id)modelSourceStoreName;
+ (id)noSandboxExtension;
+ (id)ppsCategoryForANE;
+ (id)ppsSubsystemForANE;
+ (id)pps_applicationDir;
+ (id)pps_catalogDir;
+ (id)pps_defaultSystemPathDir;
+ (id)pps_defaultUserPathPrefix;
+ (id)pps_frameworkDir;
+ (id)pps_internalDir;
+ (id)pps_privateFrameworkDir;
+ (id)pps_tmpDir;
+ (id)pps_varDir;
+ (id)processModelShareAccessEntitlement;
+ (id)restrictedAccessEntitlement;
+ (id)secondaryANECompilerServiceAccessEntitlement;
+ (id)storageMaintainerAccessEntitlement;
+ (id)systemLibraryPath;
+ (id)systemModelsCacheDirectory;
+ (id)tempDirectory;
+ (id)testing_ThreeSixtyModelName;
+ (id)testing_cacheDirectory;
+ (id)testing_cacheDirectoryWithSuffix:(id)a3;
+ (id)testing_cacheDirectoryWithSuffix:(id)a3 buildVersion:(id)a4;
+ (id)testing_cloneDirectory:(id)a3;
+ (id)testing_dataVaultStorageClass;
+ (id)testing_encryptedModelNames;
+ (id)testing_external_modelPath;
+ (id)testing_external_precompiledModelPath;
+ (id)testing_inputDirectory;
+ (id)testing_modelDirectory;
+ (id)testing_modelDirectory:(id)a3;
+ (id)testing_modelNames;
+ (id)testing_tempDirectory:(id)a3;
+ (id)testing_userCacheDirectory;
+ (id)testing_userCacheDirectoryWithSuffix:(id)a3;
+ (id)testing_userCacheDirectoryWithSuffix:(id)a3 buildVersion:(id)a4;
+ (id)testing_userCloneDirectory:(id)a3;
+ (id)testing_userTempDirectory:(id)a3;
+ (id)testing_zeroModelName;
+ (id)userCloneDirectory;
+ (id)userMachServiceName;
+ (id)userModelDataVaultDirectory;
+ (id)userTempDirectory;
+ (id)vm_forceValidationOnGuestBootArg;
+ (id)vm_tmpBaseDirectory;
@end

@implementation _ANEStrings

+ (id)aggressivePowerSavingEntitlement
{
  return @"com.apple.aned.private.aggressivePowerSaving.allow";
}

+ (id)coreAnalyticsANEUsageKeyGroup
{
  return @"com.apple.ANEUsage";
}

+ (BOOL)trimmedModelPath:(id)a3 trimmedPath:(id *)a4
{
  id v6 = a3;
  v7 = v6;
  char v8 = v6 == 0;
  if (v6
    && ([v6 path],
        id v9 = (id)objc_claimAutoreleasedReturnValue(),
        *a4 = v9,
        objc_msgSend(a1, "pps_defaultUserPathPrefix"),
        v10 = objc_claimAutoreleasedReturnValue(),
        LOBYTE(v9) = [v9 hasPrefix:v10],
        v10,
        (v9 & 1) == 0))
  {
    id v11 = *a4;
    v12 = objc_msgSend(a1, "pps_applicationDir");
    LOBYTE(v11) = [v11 hasPrefix:v12];

    char v8 = v11 ^ 1;
    if (+[_ANEDeviceInfo isInternalBuild])
    {
      id v13 = *a4;
      v14 = objc_msgSend(a1, "pps_defaultSystemPathDir");
      v15 = [v14 objectAtIndexedSubscript:0];
      *a4 = [v13 stringByReplacingOccurrencesOfString:v15 withString:@"0_"];
    }
    v16 = objc_msgSend(a1, "pps_defaultSystemPathDir");
    uint64_t v17 = [v16 count];

    uint64_t v18 = v17 - 1;
    if (v17 != 1)
    {
      do
      {
        id v19 = *a4;
        v20 = objc_msgSend(a1, "pps_defaultSystemPathDir");
        v21 = [v20 objectAtIndexedSubscript:v18];
        v22 = objc_msgSend(NSString, "stringWithFormat:", @"%ld_", v18);
        *a4 = [v19 stringByReplacingOccurrencesOfString:v21 withString:v22];

        --v18;
      }
      while (v18);
    }
  }
  else
  {
    *a4 = &stru_1F35E5710;
  }

  return v8;
}

+ (id)pps_defaultSystemPathDir
{
  v17[10] = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(a1, "testing_inputDirectory");
  v4 = objc_msgSend(a1, "testing_modelDirectory");
  v16 = [v3 stringByAppendingPathComponent:v4];

  v17[0] = v16;
  v5 = [a1 systemLibraryPath];
  v17[1] = v5;
  id v6 = [a1 internalLibraryPath];
  v17[2] = v6;
  v7 = objc_msgSend(a1, "pps_frameworkDir");
  v17[3] = v7;
  char v8 = objc_msgSend(a1, "pps_privateFrameworkDir");
  v17[4] = v8;
  id v9 = objc_msgSend(a1, "pps_varDir");
  v17[5] = v9;
  v10 = objc_msgSend(a1, "pps_tmpDir");
  v17[6] = v10;
  id v11 = objc_msgSend(a1, "pps_internalDir");
  v17[7] = v11;
  v12 = objc_msgSend(a1, "pps_applicationDir");
  v17[8] = v12;
  id v13 = objc_msgSend(a1, "pps_catalogDir");
  v17[9] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:10];

  return v14;
}

+ (id)systemLibraryPath
{
  return @"/System/Library";
}

+ (id)internalLibraryPath
{
  return @"/AppleInternal/Library";
}

+ (id)pps_applicationDir
{
  return @"/Applications";
}

+ (id)pps_varDir
{
  return @"/var";
}

+ (id)pps_tmpDir
{
  return @"/tmp";
}

+ (id)pps_privateFrameworkDir
{
  return @"/PrivateFrameworks";
}

+ (id)pps_internalDir
{
  return @"/AppleInternal";
}

+ (id)pps_frameworkDir
{
  return @"/Frameworks";
}

+ (id)pps_catalogDir
{
  return @"/var/MobileAsset/AssetV2";
}

+ (id)testing_modelDirectory
{
  v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v9 = 0;
  v4 = objc_msgSend(a1, "testing_inputDirectory");
  v5 = [v4 stringByAppendingPathComponent:@"Contents/Resources"];

  if ([v3 fileExistsAtPath:v5 isDirectory:&v9]) {
    BOOL v6 = v9 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6)
  {
    v7 = @"TestModels";
  }
  else
  {
    v7 = [@"Contents/Resources" stringByAppendingPathComponent:@"TestModels"];
  }

  return v7;
}

+ (id)testing_inputDirectory
{
  return @"/AppleInternal/Tests/AppleNeuralEngine/AppleNeuralEngine_tests.xctest";
}

+ (id)noSandboxExtension
{
  return &stru_1F35E5710;
}

+ (id)pps_defaultUserPathPrefix
{
  return @"/Users";
}

+ (id)coreAnalyticsANEUsageDefaultReportedClient
{
  return @"ThirdPartyAppUsingANE";
}

+ (id)restrictedAccessEntitlement
{
  return @"com.apple.aned.private.allow";
}

+ (id)machServiceName
{
  return @"com.apple.appleneuralengine";
}

+ (id)userMachServiceName
{
  return @"com.apple.aneuserd";
}

+ (id)cacheDeleteServiceName
{
  return @"com.apple.aned.CacheDelete";
}

+ (id)aneuserdCacheDeleteServiceName
{
  return @"com.apple.aneuserd.CacheDelete";
}

+ (id)machServiceNamePrivate
{
  return @"com.apple.appleneuralengine.private";
}

+ (id)modelDataVaultDirectory
{
  return @"/var/mobile/Library/Caches/com.apple.aned";
}

+ (id)userModelDataVaultDirectory
{
  return @"/var/mobile/Library/Caches/com.apple.aned";
}

+ (id)buildSpecificModelDataVaultDirectory
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51___ANEStrings_buildSpecificModelDataVaultDirectory__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (buildSpecificModelDataVaultDirectory_onceToken != -1) {
    dispatch_once(&buildSpecificModelDataVaultDirectory_onceToken, block);
  }
  v2 = (void *)buildSpecificModelDataVaultDirectory__ANEBuildSpecificModelDataVaultDirectory;
  return v2;
}

+ (id)buildSpecificUserModelDataVaultDirectory
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55___ANEStrings_buildSpecificUserModelDataVaultDirectory__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (buildSpecificUserModelDataVaultDirectory_onceToken != -1) {
    dispatch_once(&buildSpecificUserModelDataVaultDirectory_onceToken, block);
  }
  v2 = (void *)buildSpecificUserModelDataVaultDirectory__ANEBuildSpecificUserModelDataVaultDirectory;
  return v2;
}

+ (id)inMemoryModelCacheName
{
  return @"InMemoryModelCache";
}

+ (id)modelAssetsCacheName
{
  return @"ModelAssetsCache";
}

+ (id)tempDirectory
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28___ANEStrings_tempDirectory__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (tempDirectory_onceToken != -1) {
    dispatch_once(&tempDirectory_onceToken, block);
  }
  v2 = (void *)tempDirectory__ANETempDirectory;
  return v2;
}

+ (id)cloneDirectory
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29___ANEStrings_cloneDirectory__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (cloneDirectory_onceToken != -1) {
    dispatch_once(&cloneDirectory_onceToken, block);
  }
  v2 = (void *)cloneDirectory__ANECloneDirectory;
  return v2;
}

+ (id)userTempDirectory
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32___ANEStrings_userTempDirectory__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (userTempDirectory_onceToken != -1) {
    dispatch_once(&userTempDirectory_onceToken, block);
  }
  v2 = (void *)userTempDirectory__ANETempDirectory;
  return v2;
}

+ (id)userCloneDirectory
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33___ANEStrings_userCloneDirectory__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (userCloneDirectory_onceToken != -1) {
    dispatch_once(&userCloneDirectory_onceToken, block);
  }
  v2 = (void *)userCloneDirectory__ANECloneDirectory;
  return v2;
}

+ (id)systemModelsCacheDirectory
{
  return @"com.apple.SHARED_SYSTEM_MODELS";
}

+ (id)errorDomainGeneric
{
  return @"com.apple.appleneuralengine";
}

+ (id)errorDomainCompiler
{
  return @"com.apple.appleneuralengine.compiler";
}

+ (id)errorDomainEspresso
{
  return @"com.apple.appleneuralengine.espresso";
}

+ (id)errorDomainVirtIO
{
  return @"com.apple.applevirtioneuralengine";
}

+ (id)compilerServiceAccessEntitlement
{
  return @"com.apple.ANECompilerService.allow";
}

+ (id)modelPurgeInAllPartitionsEntitlement
{
  return @"com.apple.private.modelPurgeInAllPartitions.allow";
}

+ (id)storageMaintainerAccessEntitlement
{
  return @"com.apple.private.ANEStorageMaintainer.allow";
}

+ (id)processModelShareAccessEntitlement
{
  return @"com.apple.aned.private.processModelShare.allow";
}

+ (id)secondaryANECompilerServiceAccessEntitlement
{
  return @"com.apple.aned.private.secondaryANECompilerServiceAccess.allow";
}

+ (id)adapterWeightsAccessEntitlement
{
  return @"com.apple.aned.private.adapterWeight.allow";
}

+ (id)adapterWeightsAccessEntitlementBypassBootArg
{
  return @"ane_skipAdapterWeightAccessCheck";
}

+ (id)modelBinaryName
{
  return @"model.hwx";
}

+ (id)modelSourceStoreName
{
  return @"model.src";
}

+ (id)modelCacheRetainName
{
  return @"model.retain";
}

+ (id)defaultCompilerOptionsFilename
{
  return @"net_options.plist";
}

+ (id)dataVaultStorageClass
{
  return @"ane_model_cache";
}

+ (id)defaultANECIRFileName
{
  return @"net.plist";
}

+ (id)defaultANECIROptionsFileName
{
  return @"compiler_options.plist";
}

+ (id)defaultMILFileName
{
  return @"model.mil";
}

+ (id)defaultWeightFileName
{
  return @"weight.bin";
}

+ (id)launchIOKitEvent
{
  return @"com.apple.aned.launch";
}

+ (id)launchUserIOKitEvent
{
  return @"com.apple.aneuserd.launch";
}

+ (id)ppsSubsystemForANE
{
  return @"ANE";
}

+ (id)ppsCategoryForANE
{
  return &unk_1F35EC158;
}

+ (id)vm_tmpBaseDirectory
{
  return @"/var/tmp/com.apple.ane/";
}

+ (id)vm_forceValidationOnGuestBootArg
{
  return @"ane_vm_forceValidationOnGuest";
}

+ (id)testing_cacheDirectory
{
  return @"/var/tmp/com.apple.aned/Cache/";
}

+ (id)testing_cacheDirectoryWithSuffix:(id)a3
{
  v4 = NSString;
  id v5 = a3;
  BOOL v6 = objc_msgSend(a1, "testing_cacheDirectory");
  v7 = [v4 stringWithFormat:@"%@%@/", v6, v5];

  return v7;
}

+ (id)testing_cacheDirectoryWithSuffix:(id)a3 buildVersion:(id)a4
{
  id v6 = a4;
  v7 = objc_msgSend(a1, "testing_cacheDirectoryWithSuffix:", a3);
  char v8 = [v7 stringByAppendingPathComponent:v6];

  return v8;
}

+ (id)testing_tempDirectory:(id)a3
{
  return (id)[@"/var/tmp/com.apple.aned/UnitTesting" stringByAppendingPathComponent:a3];
}

+ (id)testing_cloneDirectory:(id)a3
{
  return (id)[@"/var/tmp/com.apple.aned/UnitTestingClones" stringByAppendingPathComponent:a3];
}

+ (id)testing_userCacheDirectory
{
  return @"/var/tmp/com.apple.aneuserd/Cache/";
}

+ (id)testing_userCacheDirectoryWithSuffix:(id)a3
{
  v4 = NSString;
  id v5 = a3;
  id v6 = objc_msgSend(a1, "testing_userCacheDirectory");
  v7 = [v4 stringWithFormat:@"%@%@/", v6, v5];

  return v7;
}

+ (id)testing_userCacheDirectoryWithSuffix:(id)a3 buildVersion:(id)a4
{
  id v6 = a4;
  v7 = objc_msgSend(a1, "testing_userCacheDirectoryWithSuffix:", a3);
  char v8 = [v7 stringByAppendingPathComponent:v6];

  return v8;
}

+ (id)testing_userTempDirectory:(id)a3
{
  return (id)[@"/var/tmp/com.apple.aneuserd/UnitTesting" stringByAppendingPathComponent:a3];
}

+ (id)testing_userCloneDirectory:(id)a3
{
  return (id)[@"/var/tmp/com.apple.aneuserd/UnitTestingClones" stringByAppendingPathComponent:a3];
}

+ (id)testing_modelDirectory:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(a1, "testing_modelDirectory");
  id v6 = [v5 stringByAppendingPathComponent:v4];

  return v6;
}

+ (id)testing_zeroModelName
{
  if (testing_zeroModelName_onceToken != -1) {
    dispatch_once(&testing_zeroModelName_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)testing_zeroModelName__ANETestZeroModelName;
  return v2;
}

+ (id)testing_ThreeSixtyModelName
{
  if (testing_ThreeSixtyModelName_onceToken != -1) {
    dispatch_once(&testing_ThreeSixtyModelName_onceToken, &__block_literal_global_210);
  }
  v2 = (void *)testing_ThreeSixtyModelName__ANETestThreeSixtyModelName;
  return v2;
}

+ (id)testing_modelNames
{
  if (testing_modelNames_onceToken != -1) {
    dispatch_once(&testing_modelNames_onceToken, &__block_literal_global_215);
  }
  v2 = (void *)testing_modelNames__ANETestModelNames;
  return v2;
}

+ (id)testing_encryptedModelNames
{
  if (testing_encryptedModelNames_onceToken != -1) {
    dispatch_once(&testing_encryptedModelNames_onceToken, &__block_literal_global_226);
  }
  v2 = (void *)testing_encryptedModelNames__ANETestEncryptedModelNames;
  return v2;
}

+ (id)testing_dataVaultStorageClass
{
  return @"testing_ane_model_cache";
}

+ (id)testing_external_modelPath
{
  return @"/System/Library/Frameworks/Vision.framework/bodynet_v1.0.espresso.net";
}

+ (id)testing_external_precompiledModelPath
{
  if (testing_external_precompiledModelPath_onceToken != -1) {
    dispatch_once(&testing_external_precompiledModelPath_onceToken, &__block_literal_global_240);
  }
  v2 = (void *)testing_external_precompiledModelPath__ANEExternalPrecompiledModelPath;
  return v2;
}

@end