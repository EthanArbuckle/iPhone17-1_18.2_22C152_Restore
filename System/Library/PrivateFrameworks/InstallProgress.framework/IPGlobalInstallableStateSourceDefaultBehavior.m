@interface IPGlobalInstallableStateSourceDefaultBehavior
+ (id)sharedInstance;
@end

@implementation IPGlobalInstallableStateSourceDefaultBehavior

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)sharedInstance_shared;

  return v2;
}

void __63__IPGlobalInstallableStateSourceDefaultBehavior_sharedInstance__block_invoke()
{
  v0 = [IPXPCEventStateUpdateStream alloc];
  v1 = defaultBehaviorQueue();
  v8 = [(IPXPCEventStateUpdateStream *)v0 initWithStreamName:@"com.apple.InstallProgress.events" queue:v1];

  v2 = [(IPXPCEventStateUpdateStream *)v8 source];
  v3 = [IPGlobalInstallableStateSourceDefaultBehavior alloc];
  if (defaultConnectionProvider_onceToken != -1) {
    dispatch_once(&defaultConnectionProvider_onceToken, &__block_literal_global_141);
  }
  v4 = (void *)MEMORY[0x2533C8180](defaultConnectionProvider_provider);
  v5 = defaultBehaviorQueue();
  uint64_t v6 = [(IPGlobalInstallableStateSourceXPCBehavior *)v3 initWithXPCConnectionProvider:v4 stateStreamSource:v2 queue:v5];
  v7 = (void *)sharedInstance_shared;
  sharedInstance_shared = v6;
}

@end