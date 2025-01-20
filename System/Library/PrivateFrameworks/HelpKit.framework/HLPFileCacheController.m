@interface HLPFileCacheController
+ (id)sharedInstance;
- (id)newDataCache;
@end

@implementation HLPFileCacheController

+ (id)sharedInstance
{
  if (sharedInstance_predicate_6 != -1) {
    dispatch_once(&sharedInstance_predicate_6, &__block_literal_global_10);
  }
  v2 = (void *)sharedInstance_gHLPFileCacheController;
  return v2;
}

uint64_t __40__HLPFileCacheController_sharedInstance__block_invoke()
{
  sharedInstance_gHLPFileCacheController = [(HLPDataCacheController *)[HLPFileCacheController alloc] initWithIdentifier:@"HLPStringCacheIdentifier" directoryName:@"com.apple.helpkit.String" maxCacheSize:3145728 URLSessionDataType:2];
  return MEMORY[0x270F9A758]();
}

- (id)newDataCache
{
  v2 = objc_alloc_init(HLPDataCache);
  [(HLPDataCache *)v2 setCacheType:0];
  [(HLPDataCache *)v2 setMaxAge:84600];
  return v2;
}

@end