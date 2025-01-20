@interface CRKPlatformFeatureDataStore
+ (CRKFeatureDataStoreProtocol)sharedDataStore;
@end

@implementation CRKPlatformFeatureDataStore

+ (CRKFeatureDataStoreProtocol)sharedDataStore
{
  if (sharedDataStore_onceToken != -1) {
    dispatch_once(&sharedDataStore_onceToken, &__block_literal_global_44);
  }
  v2 = (void *)sharedDataStore_dataStore;

  return (CRKFeatureDataStoreProtocol *)v2;
}

void __46__CRKPlatformFeatureDataStore_sharedDataStore__block_invoke()
{
  id v2 = (id)objc_opt_new();
  uint64_t v0 = [v2 makeFeatureDataStore];
  v1 = (void *)sharedDataStore_dataStore;
  sharedDataStore_dataStore = v0;
}

@end