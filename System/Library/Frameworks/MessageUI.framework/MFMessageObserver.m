@interface MFMessageObserver
@end

@implementation MFMessageObserver

void __36___MFMessageObserver_sharedObserver__block_invoke()
{
  v0 = objc_alloc_init(_MFMessageObserver);
  v1 = (void *)sharedObserver_sharedObserver;
  sharedObserver_sharedObserver = (uint64_t)v0;
}

@end