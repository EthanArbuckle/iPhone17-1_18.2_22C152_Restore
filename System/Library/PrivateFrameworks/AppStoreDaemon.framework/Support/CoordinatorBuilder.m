@interface CoordinatorBuilder
- (CoordinatorBuilder)init;
@end

@implementation CoordinatorBuilder

- (CoordinatorBuilder)init
{
  v3.receiver = self;
  v3.super_class = (Class)CoordinatorBuilder;
  result = [(CoordinatorBuilder *)&v3 init];
  if (result) {
    result->_clientID = 1;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetBundleURL, 0);
  objc_storeStrong((id *)&self->_logKey, 0);
  objc_storeStrong((id *)&self->_gizmoPairingID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end