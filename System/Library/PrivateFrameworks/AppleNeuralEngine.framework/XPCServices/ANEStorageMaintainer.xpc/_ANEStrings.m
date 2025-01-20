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
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100021E68;
  block[3] = &unk_10003CD30;
  block[4] = a1;
  if (qword_100042DE0 != -1) {
    dispatch_once(&qword_100042DE0, block);
  }
  v2 = (void *)qword_100042DE8;
  return v2;
}

+ (id)buildSpecificUserModelDataVaultDirectory
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100021F88;
  block[3] = &unk_10003CD30;
  block[4] = a1;
  if (qword_100042DF0 != -1) {
    dispatch_once(&qword_100042DF0, block);
  }
  v2 = (void *)qword_100042DF8;
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
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000220C0;
  block[3] = &unk_10003CD30;
  block[4] = a1;
  if (qword_100042E00 != -1) {
    dispatch_once(&qword_100042E00, block);
  }
  v2 = (void *)qword_100042E08;
  return v2;
}

+ (id)cloneDirectory
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000221C0;
  block[3] = &unk_10003CD30;
  block[4] = a1;
  if (qword_100042E10 != -1) {
    dispatch_once(&qword_100042E10, block);
  }
  v2 = (void *)qword_100042E18;
  return v2;
}

+ (id)userTempDirectory
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000222C0;
  block[3] = &unk_10003CD30;
  block[4] = a1;
  if (qword_100042E20 != -1) {
    dispatch_once(&qword_100042E20, block);
  }
  v2 = (void *)qword_100042E28;
  return v2;
}

+ (id)userCloneDirectory
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000223C0;
  block[3] = &unk_10003CD30;
  block[4] = a1;
  if (qword_100042E30 != -1) {
    dispatch_once(&qword_100042E30, block);
  }
  v2 = (void *)qword_100042E38;
  return v2;
}

+ (id)systemModelsCacheDirectory
{
  return @"com.apple.SHARED_SYSTEM_MODELS";
}

+ (id)systemLibraryPath
{
  return @"/System/Library";
}

+ (id)internalLibraryPath
{
  return @"/AppleInternal/Library";
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

+ (id)restrictedAccessEntitlement
{
  return @"com.apple.aned.private.allow";
}

+ (id)aggressivePowerSavingEntitlement
{
  return @"com.apple.aned.private.aggressivePowerSaving.allow";
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

+ (id)noSandboxExtension
{
  return &stru_10003CED0;
}

+ (id)launchIOKitEvent
{
  return @"com.apple.aned.launch";
}

+ (id)launchUserIOKitEvent
{
  return @"com.apple.aneuserd.launch";
}

+ (id)coreAnalyticsANEUsageKeyGroup
{
  return @"com.apple.ANEUsage";
}

+ (id)coreAnalyticsANEUsageDefaultReportedClient
{
  return @"ThirdPartyAppUsingANE";
}

+ (id)ppsSubsystemForANE
{
  return @"ANE";
}

+ (id)ppsCategoryForANE
{
  return &off_10003FBF8;
}

+ (id)pps_defaultUserPathPrefix
{
  return @"/Users";
}

+ (id)pps_frameworkDir
{
  return @"/Frameworks";
}

+ (id)pps_privateFrameworkDir
{
  return @"/PrivateFrameworks";
}

+ (id)pps_varDir
{
  return @"/var";
}

+ (id)pps_tmpDir
{
  return @"/tmp";
}

+ (id)pps_internalDir
{
  return @"/AppleInternal";
}

+ (id)pps_applicationDir
{
  return @"/Applications";
}

+ (id)pps_catalogDir
{
  return @"/var/MobileAsset/AssetV2";
}

+ (id)pps_defaultSystemPathDir
{
  v3 = objc_msgSend(a1, "testing_inputDirectory");
  v4 = objc_msgSend(a1, "testing_modelDirectory");
  v16 = [v3 stringByAppendingPathComponent:v4];

  v17[0] = v16;
  v5 = [a1 systemLibraryPath];
  v17[1] = v5;
  v6 = [a1 internalLibraryPath];
  v17[2] = v6;
  v7 = objc_msgSend(a1, "pps_frameworkDir");
  v17[3] = v7;
  v8 = objc_msgSend(a1, "pps_privateFrameworkDir");
  v17[4] = v8;
  v9 = objc_msgSend(a1, "pps_varDir");
  v17[5] = v9;
  v10 = objc_msgSend(a1, "pps_tmpDir");
  v17[6] = v10;
  v11 = objc_msgSend(a1, "pps_internalDir");
  v17[7] = v11;
  v12 = objc_msgSend(a1, "pps_applicationDir");
  v17[8] = v12;
  v13 = objc_msgSend(a1, "pps_catalogDir");
  v17[9] = v13;
  v14 = +[NSArray arrayWithObjects:v17 count:10];

  return v14;
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
  id v4 = a3;
  v5 = objc_msgSend(a1, "testing_cacheDirectory");
  v6 = +[NSString stringWithFormat:@"%@%@/", v5, v4];

  return v6;
}

+ (id)testing_cacheDirectoryWithSuffix:(id)a3 buildVersion:(id)a4
{
  id v6 = a4;
  v7 = objc_msgSend(a1, "testing_cacheDirectoryWithSuffix:", a3);
  v8 = [v7 stringByAppendingPathComponent:v6];

  return v8;
}

+ (id)testing_tempDirectory:(id)a3
{
  return [@"/var/tmp/com.apple.aned/UnitTesting" stringByAppendingPathComponent:a3];
}

+ (id)testing_cloneDirectory:(id)a3
{
  return [@"/var/tmp/com.apple.aned/UnitTestingClones" stringByAppendingPathComponent:a3];
}

+ (id)testing_userCacheDirectory
{
  return @"/var/tmp/com.apple.aneuserd/Cache/";
}

+ (id)testing_userCacheDirectoryWithSuffix:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "testing_userCacheDirectory");
  id v6 = +[NSString stringWithFormat:@"%@%@/", v5, v4];

  return v6;
}

+ (id)testing_userCacheDirectoryWithSuffix:(id)a3 buildVersion:(id)a4
{
  id v6 = a4;
  v7 = objc_msgSend(a1, "testing_userCacheDirectoryWithSuffix:", a3);
  v8 = [v7 stringByAppendingPathComponent:v6];

  return v8;
}

+ (id)testing_userTempDirectory:(id)a3
{
  return [@"/var/tmp/com.apple.aneuserd/UnitTesting" stringByAppendingPathComponent:a3];
}

+ (id)testing_userCloneDirectory:(id)a3
{
  return [@"/var/tmp/com.apple.aneuserd/UnitTestingClones" stringByAppendingPathComponent:a3];
}

+ (id)testing_inputDirectory
{
  return @"/AppleInternal/Tests/AppleNeuralEngine/AppleNeuralEngine_tests.xctest";
}

+ (id)testing_modelDirectory
{
  v3 = +[NSFileManager defaultManager];
  char v9 = 0;
  id v4 = objc_msgSend(a1, "testing_inputDirectory");
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

+ (id)testing_modelDirectory:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(a1, "testing_modelDirectory");
  BOOL v6 = [v5 stringByAppendingPathComponent:v4];

  return v6;
}

+ (id)testing_zeroModelName
{
  if (qword_100042E48 != -1) {
    dispatch_once(&qword_100042E48, &stru_10003CD50);
  }
  v2 = (void *)qword_100042E40;
  return v2;
}

+ (id)testing_ThreeSixtyModelName
{
  if (qword_100042E58 != -1) {
    dispatch_once(&qword_100042E58, &stru_10003CD70);
  }
  v2 = (void *)qword_100042E50;
  return v2;
}

+ (id)testing_modelNames
{
  if (qword_100042E68 != -1) {
    dispatch_once(&qword_100042E68, &stru_10003CD90);
  }
  v2 = (void *)qword_100042E60;
  return v2;
}

+ (id)testing_encryptedModelNames
{
  if (qword_100042E78 != -1) {
    dispatch_once(&qword_100042E78, &stru_10003CDB0);
  }
  v2 = (void *)qword_100042E70;
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
  if (qword_100042E88 != -1) {
    dispatch_once(&qword_100042E88, &stru_10003CDD0);
  }
  v2 = (void *)qword_100042E80;
  return v2;
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
    v17 = (char *)[v16 count];

    v18 = v17 - 1;
    if (v17 != (char *)1)
    {
      do
      {
        id v19 = *a4;
        v20 = objc_msgSend(a1, "pps_defaultSystemPathDir");
        v21 = [v20 objectAtIndexedSubscript:v18];
        v22 = +[NSString stringWithFormat:@"%ld_", v18];
        *a4 = [v19 stringByReplacingOccurrencesOfString:v21 withString:v22];

        --v18;
      }
      while (v18);
    }
  }
  else
  {
    *a4 = &stru_10003CED0;
  }

  return v8;
}

@end