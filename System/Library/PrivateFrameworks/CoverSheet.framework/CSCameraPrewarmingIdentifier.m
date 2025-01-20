@interface CSCameraPrewarmingIdentifier
- (CSCameraPrewarmingIdentifier)initWithCameraPrewarmType:(int64_t)a3 applicationBundleIdentifier:(id)a4;
- (NSString)applicationBundleIdentifier;
- (int64_t)prewarmType;
@end

@implementation CSCameraPrewarmingIdentifier

- (CSCameraPrewarmingIdentifier)initWithCameraPrewarmType:(int64_t)a3 applicationBundleIdentifier:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CSCameraPrewarmingIdentifier;
  v7 = [(CSCameraPrewarmingIdentifier *)&v12 init];
  v8 = v7;
  if (v7)
  {
    v7->_prewarmType = a3;
    uint64_t v9 = [v6 copy];
    applicationBundleIdentifier = v8->_applicationBundleIdentifier;
    v8->_applicationBundleIdentifier = (NSString *)v9;
  }
  return v8;
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (int64_t)prewarmType
{
  return self->_prewarmType;
}

- (void).cxx_destruct
{
}

@end