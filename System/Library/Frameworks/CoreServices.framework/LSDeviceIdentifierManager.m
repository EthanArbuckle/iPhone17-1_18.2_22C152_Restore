@interface LSDeviceIdentifierManager
@end

@implementation LSDeviceIdentifierManager

void __44___LSDeviceIdentifierManager_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)+[_LSDeviceIdentifierManager sharedInstance]::result;
  +[_LSDeviceIdentifierManager sharedInstance]::result = (uint64_t)v1;
}

@end