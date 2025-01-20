@interface CKAddressBookMonogrammerProvider
@end

@implementation CKAddressBookMonogrammerProvider

void __51___CKAddressBookMonogrammerProvider_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sharedInstance_3;
  sharedInstance_sharedInstance_3 = (uint64_t)v1;
}

@end