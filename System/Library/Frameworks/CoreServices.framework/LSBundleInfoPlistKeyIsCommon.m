@interface LSBundleInfoPlistKeyIsCommon
@end

@implementation LSBundleInfoPlistKeyIsCommon

void ___LSBundleInfoPlistKeyIsCommon_block_invoke()
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = *MEMORY[0x1E4F1CC50];
  v12[0] = *MEMORY[0x1E4F1CCB8];
  v12[1] = v1;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  uint64_t v3 = [v0 setWithArray:v2];
  v4 = (void *)_LSBundleInfoPlistKeyIsCommon::explicitlyIgnoredKeys;
  _LSBundleInfoPlistKeyIsCommon::explicitlyIgnoredKeys = v3;

  uint64_t v5 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1ECB43B40];
  v6 = (void *)_LSBundleInfoPlistKeyIsCommon::prefixes;
  _LSBundleInfoPlistKeyIsCommon::prefixes = v5;

  v7 = (void *)MEMORY[0x1E4F1CAD0];
  v11[0] = @"Capabilities";
  v11[1] = @"DeviceFamily";
  v11[2] = @"ProductType";
  v11[3] = @"disabled";
  v11[4] = @"MallocBehavior";
  v11[5] = @"AVInitialRouteSharingPolicy";
  v11[6] = @"LSEligibilityInstallPredicate";
  v11[7] = @"LSEligibilityUninstallPredicate";
  v11[8] = @"LSRequiredFeatureFlags";
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:9];
  uint64_t v9 = [v7 setWithArray:v8];
  v10 = (void *)_LSBundleInfoPlistKeyIsCommon::explicitlyIncludedKeys;
  _LSBundleInfoPlistKeyIsCommon::explicitlyIncludedKeys = v9;
}

@end