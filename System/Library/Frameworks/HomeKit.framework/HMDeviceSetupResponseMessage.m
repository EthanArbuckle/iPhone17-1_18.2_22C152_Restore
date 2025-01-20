@interface HMDeviceSetupResponseMessage
+ (BOOL)supportsSecureCoding;
- (HMDeviceSetupResponseMessage)init;
- (HMDeviceSetupResponseMessage)initWithCoder:(id)a3;
- (HMDeviceSetupResponseMessage)initWithPayload:(id)a3;
- (NSData)payload;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDeviceSetupResponseMessage

- (void).cxx_destruct
{
}

- (NSData)payload
{
  return self->_payload;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HMDeviceSetupResponseMessage;
  id v4 = a3;
  [(TRMessage *)&v6 encodeWithCoder:v4];
  v5 = [(HMDeviceSetupResponseMessage *)self payload];
  [v4 encodeObject:v5 forKey:@"HM.payload"];
}

- (HMDeviceSetupResponseMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDeviceSetupResponseMessage;
  v5 = [(TRMessage *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.payload"];
    payload = v5->_payload;
    v5->_payload = (NSData *)v6;
  }
  return v5;
}

- (HMDeviceSetupResponseMessage)initWithPayload:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDeviceSetupResponseMessage;
  v5 = [(HMDeviceSetupResponseMessage *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    payload = v5->_payload;
    v5->_payload = (NSData *)v6;
  }
  return v5;
}

- (HMDeviceSetupResponseMessage)init
{
  return [(HMDeviceSetupResponseMessage *)self initWithPayload:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end