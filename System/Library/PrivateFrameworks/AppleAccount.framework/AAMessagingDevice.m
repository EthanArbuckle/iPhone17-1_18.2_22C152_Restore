@interface AAMessagingDevice
- (AAMessagingDevice)initWithDevice:(id)a3;
- (NSString)modelIdentifier;
- (NSString)productBuildVersion;
@end

@implementation AAMessagingDevice

- (AAMessagingDevice)initWithDevice:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)AAMessagingDevice;
  v6 = [(AAMessagingDevice *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    v8 = [v5 productBuildVersion];
    uint64_t v9 = [v8 copy];
    productBuildVersion = v7->_productBuildVersion;
    v7->_productBuildVersion = (NSString *)v9;

    v11 = [v5 modelIdentifier];
    uint64_t v12 = [v11 copy];
    modelIdentifier = v7->_modelIdentifier;
    v7->_modelIdentifier = (NSString *)v12;
  }
  return v7;
}

- (NSString)productBuildVersion
{
  return self->_productBuildVersion;
}

- (NSString)modelIdentifier
{
  return self->_modelIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelIdentifier, 0);
  objc_storeStrong((id *)&self->_productBuildVersion, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end