@interface ANEStrings
@end

@implementation ANEStrings

void __51___ANEStrings_buildSpecificModelDataVaultDirectory__block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) modelDataVaultDirectory];
  v1 = +[_ANEDeviceInfo buildVersion];
  uint64_t v2 = [v4 stringByAppendingPathComponent:v1];
  v3 = (void *)buildSpecificModelDataVaultDirectory__ANEBuildSpecificModelDataVaultDirectory;
  buildSpecificModelDataVaultDirectory__ANEBuildSpecificModelDataVaultDirectory = v2;
}

void __55___ANEStrings_buildSpecificUserModelDataVaultDirectory__block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) userModelDataVaultDirectory];
  v1 = +[_ANEDeviceInfo buildVersion];
  uint64_t v2 = [v4 stringByAppendingPathComponent:v1];
  v3 = (void *)buildSpecificUserModelDataVaultDirectory__ANEBuildSpecificUserModelDataVaultDirectory;
  buildSpecificUserModelDataVaultDirectory__ANEBuildSpecificUserModelDataVaultDirectory = v2;
}

void __28___ANEStrings_tempDirectory__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) modelDataVaultDirectory];
  uint64_t v1 = [v3 stringByAppendingPathComponent:@"tmp"];
  uint64_t v2 = (void *)tempDirectory__ANETempDirectory;
  tempDirectory__ANETempDirectory = v1;
}

void __29___ANEStrings_cloneDirectory__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) modelDataVaultDirectory];
  uint64_t v1 = [v3 stringByAppendingPathComponent:@"clones"];
  uint64_t v2 = (void *)cloneDirectory__ANECloneDirectory;
  cloneDirectory__ANECloneDirectory = v1;
}

void __32___ANEStrings_userTempDirectory__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) userModelDataVaultDirectory];
  uint64_t v1 = [v3 stringByAppendingPathComponent:@"tmp"];
  uint64_t v2 = (void *)userTempDirectory__ANETempDirectory;
  userTempDirectory__ANETempDirectory = v1;
}

void __33___ANEStrings_userCloneDirectory__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) userModelDataVaultDirectory];
  uint64_t v1 = [v3 stringByAppendingPathComponent:@"clones"];
  uint64_t v2 = (void *)userCloneDirectory__ANECloneDirectory;
  userCloneDirectory__ANECloneDirectory = v1;
}

void __36___ANEStrings_testing_zeroModelName__block_invoke()
{
  v0 = (void *)testing_zeroModelName__ANETestZeroModelName;
  testing_zeroModelName__ANETestZeroModelName = @"zeroModel";
}

void __42___ANEStrings_testing_ThreeSixtyModelName__block_invoke()
{
  v0 = (void *)testing_ThreeSixtyModelName__ANETestThreeSixtyModelName;
  testing_ThreeSixtyModelName__ANETestThreeSixtyModelName = @"threeSixtyModel";
}

void __33___ANEStrings_testing_modelNames__block_invoke()
{
  v0 = (void *)testing_modelNames__ANETestModelNames;
  testing_modelNames__ANETestModelNames = (uint64_t)&unk_1F35EC170;
}

void __42___ANEStrings_testing_encryptedModelNames__block_invoke()
{
  v0 = (void *)testing_encryptedModelNames__ANETestEncryptedModelNames;
  testing_encryptedModelNames__ANETestEncryptedModelNames = (uint64_t)&unk_1F35EC188;
}

void __52___ANEStrings_testing_external_precompiledModelPath__block_invoke()
{
  v0 = (void *)testing_external_precompiledModelPath__ANEExternalPrecompiledModelPath;
  testing_external_precompiledModelPath__ANEExternalPrecompiledModelPath = @"/System/Library/PrivateFrameworks/VideoProcessing.framework/cnn_frame_enhancer_96p.H16.espresso.hwx";
}

@end