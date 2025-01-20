@interface LCSCaptureApplicationTCCUpdate
- (LCSCaptureApplicationTCCUpdate)initWithBundleIdentifier:(id)a3 status:(unint64_t)a4;
- (NSString)bundleIdentifier;
- (unint64_t)tccStatus;
@end

@implementation LCSCaptureApplicationTCCUpdate

- (LCSCaptureApplicationTCCUpdate)initWithBundleIdentifier:(id)a3 status:(unint64_t)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)LCSCaptureApplicationTCCUpdate;
  v7 = [(LCSCaptureApplicationTCCUpdate *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    bundleIdentifier = v7->_bundleIdentifier;
    v7->_bundleIdentifier = (NSString *)v8;

    v7->_tccStatus = a4;
  }

  return v7;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (unint64_t)tccStatus
{
  return self->_tccStatus;
}

- (void).cxx_destruct
{
}

@end