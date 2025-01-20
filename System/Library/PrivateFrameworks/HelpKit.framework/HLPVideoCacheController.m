@interface HLPVideoCacheController
+ (id)sharedInstance;
- (id)newDataCache;
@end

@implementation HLPVideoCacheController

+ (id)sharedInstance
{
  if (sharedInstance_predicate_5 != -1) {
    dispatch_once(&sharedInstance_predicate_5, &__block_literal_global_9);
  }
  v2 = (void *)sharedInstance_gHLPVideoCacheController;
  return v2;
}

uint64_t __41__HLPVideoCacheController_sharedInstance__block_invoke()
{
  sharedInstance_gHLPVideoCacheController = [(HLPDataCacheController *)[HLPVideoCacheController alloc] initWithIdentifier:@"HLPVideoCacheIdentifier" directoryName:@"com.apple.helpkit.Videos" maxCacheSize:52428800 URLSessionDataType:5];
  return MEMORY[0x270F9A758]();
}

- (id)newDataCache
{
  v2 = objc_alloc_init(HLPDataCache);
  [(HLPDataCache *)v2 setCacheType:4];
  [(HLPDataCache *)v2 setMaxAge:345600];
  return v2;
}

@end