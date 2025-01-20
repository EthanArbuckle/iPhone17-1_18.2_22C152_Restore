@interface HMDNetworkActivityWrapperFactory
+ (HMDNetworkActivityWrapperFactory)sharedInstance;
- (id)networkActivityWrapperWithLabel:(unint64_t)a3;
@end

@implementation HMDNetworkActivityWrapperFactory

- (id)networkActivityWrapperWithLabel:(unint64_t)a3
{
  v3 = [[HMDNetworkActivityWrapper alloc] initWithLabel:a3];
  return v3;
}

+ (HMDNetworkActivityWrapperFactory)sharedInstance
{
  if (_onceToken != -1) {
    dispatch_once(&_onceToken, &__block_literal_global_186238);
  }
  v2 = (void *)_sharedInstance_186239;
  return (HMDNetworkActivityWrapperFactory *)v2;
}

void __50__HMDNetworkActivityWrapperFactory_sharedInstance__block_invoke()
{
  if (!_sharedInstance_186239)
  {
    v0 = objc_alloc_init(HMDNetworkActivityWrapperFactory);
    uint64_t v1 = _sharedInstance_186239;
    _sharedInstance_186239 = (uint64_t)v0;
    MEMORY[0x1F41817F8](v0, v1);
  }
}

@end