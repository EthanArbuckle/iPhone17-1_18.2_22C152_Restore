@interface MFMessageURLProtocolRegistry
@end

@implementation MFMessageURLProtocolRegistry

void __47___MFMessageURLProtocolRegistry_sharedRegistry__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedRegistry_instance;
  sharedRegistry_instance = (uint64_t)v1;
}

@end