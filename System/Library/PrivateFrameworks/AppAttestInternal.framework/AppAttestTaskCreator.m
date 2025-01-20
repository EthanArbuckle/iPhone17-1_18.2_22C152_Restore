@interface AppAttestTaskCreator
+ (id)create;
@end

@implementation AppAttestTaskCreator

+ (id)create
{
  v2 = [[DCBGSTask alloc] initWithTaskIdentifier:@"com.apple.devicecheck.notify.attest" observerIdentifier:@"AAACleanupInterval"];
  [(DCBGSTask *)v2 setTaskHandler:&__block_literal_global];
  return v2;
}

void __30__AppAttestTaskCreator_create__block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v2 = a2;
    removeAllKeychainItemsForMissingApps();
    [v2 setTaskCompleted];
  }
}

@end