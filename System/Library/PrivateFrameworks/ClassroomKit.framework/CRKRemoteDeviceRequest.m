@interface CRKRemoteDeviceRequest
+ (BOOL)supportsSecureCoding;
+ (Class)allowlistedClassForResultObject;
- (CATTaskRequest)remoteRequest;
- (CRKRemoteDeviceRequest)initWithCoder:(id)a3;
- (NSString)deviceIdentifier;
- (void)encodeWithCoder:(id)a3;
- (void)setDeviceIdentifier:(id)a3;
- (void)setRemoteRequest:(id)a3;
@end

@implementation CRKRemoteDeviceRequest

+ (Class)allowlistedClassForResultObject
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKRemoteDeviceRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CRKRemoteDeviceRequest;
  v5 = [(CATTaskRequest *)&v13 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"remoteRequest"];
    remoteRequest = v5->_remoteRequest;
    v5->_remoteRequest = (CATTaskRequest *)v7;

    v9 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"deviceIdentifier"];
    deviceIdentifier = v5->_deviceIdentifier;
    v5->_deviceIdentifier = (NSString *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CRKRemoteDeviceRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v7 encodeWithCoder:v4];
  v5 = [(CRKRemoteDeviceRequest *)self remoteRequest];
  [v4 encodeObject:v5 forKey:@"remoteRequest"];

  v6 = [(CRKRemoteDeviceRequest *)self deviceIdentifier];
  [v4 encodeObject:v6 forKey:@"deviceIdentifier"];
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
}

- (CATTaskRequest)remoteRequest
{
  return self->_remoteRequest;
}

- (void)setRemoteRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteRequest, 0);

  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
}

@end