@interface DESEventManager
+ (BOOL)allowEventForBundleID:(id)a3;
@end

@implementation DESEventManager

+ (BOOL)allowEventForBundleID:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (allowEventForBundleID__onceToken != -1)
  {
    dispatch_once(&allowEventForBundleID__onceToken, &__block_literal_global_4);
    if (v4) {
      goto LABEL_3;
    }
LABEL_5:
    LOBYTE(v5) = 0;
    goto LABEL_6;
  }
  if (!v3) {
    goto LABEL_5;
  }
LABEL_3:
  int v5 = [(id)allowEventForBundleID__disalllowedBundles containsObject:v4] ^ 1;
LABEL_6:

  return v5;
}

void __41__DESEventManager_allowEventForBundleID___block_invoke()
{
  v4[11] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[0] = @"com.apple.dodml.TestPlugin";
  v4[1] = @"com.apple.dp.PrivateFederatedLearning.DPMLRuntimePluginNonDnU";
  v4[2] = @"com.apple.dp.PrivateFederatedLearning.DPMLRuntimePlugin";
  v4[3] = @"com.apple.dp.PrivateFederatedLearning.DPMLRuntimePluginClassB";
  v4[4] = @"com.apple.aiml.mlpt.PriML.FedStats.Plugin";
  v4[5] = @"com.apple.aiml.mlpt.PriML.FedStats.PluginClassB";
  v4[6] = @"com.apple.aiml.mlpt.PriML.FedStats.PluginNonDnU";
  v4[7] = @"com.apple.MLRuntime.ExtensionXCTestHigh";
  v4[8] = @"com.apple.MLRuntime.ExtensionXCTestOnDemand";
  v4[9] = @"com.apple.MLRuntime.ExtensionXCTestRestricted";
  v4[10] = @"com.apple.MLRuntime.XCTest";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:11];
  uint64_t v2 = [v0 setWithArray:v1];
  id v3 = (void *)allowEventForBundleID__disalllowedBundles;
  allowEventForBundleID__disalllowedBundles = v2;
}

@end