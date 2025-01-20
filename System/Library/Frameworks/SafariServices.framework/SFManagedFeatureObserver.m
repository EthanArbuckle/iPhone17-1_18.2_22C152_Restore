@interface SFManagedFeatureObserver
@end

@implementation SFManagedFeatureObserver

void __43___SFManagedFeatureObserver_sharedObserver__block_invoke()
{
  v0 = objc_alloc_init(_SFManagedFeatureObserver);
  v1 = (void *)sharedObserver_sharedObserver;
  sharedObserver_sharedObserver = (uint64_t)v0;
}

@end