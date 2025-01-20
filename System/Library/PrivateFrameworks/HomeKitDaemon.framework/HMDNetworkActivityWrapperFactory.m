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
  if (_onceToken_180493 != -1) {
    dispatch_once(&_onceToken_180493, &__block_literal_global_180494);
  }
  v2 = (void *)_sharedInstance_180495;
  return (HMDNetworkActivityWrapperFactory *)v2;
}

void __50__HMDNetworkActivityWrapperFactory_sharedInstance__block_invoke()
{
  if (!_sharedInstance_180495)
  {
    v0 = objc_alloc_init(HMDNetworkActivityWrapperFactory);
    v1 = (void *)_sharedInstance_180495;
    _sharedInstance_180495 = (uint64_t)v0;
  }
}

@end