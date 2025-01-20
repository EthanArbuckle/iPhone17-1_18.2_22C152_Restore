@interface CKEntityContactStoreProvider
@end

@implementation CKEntityContactStoreProvider

void __47___CKEntityContactStoreProvider_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sharedInstance_0;
  sharedInstance_sharedInstance_0 = (uint64_t)v1;
}

@end