@interface HMDeviceSetupRequestMessage
+ (BOOL)supportsSecureCoding;
- (HMDeviceSetupRequestMessage)init;
- (HMDeviceSetupRequestMessage)initWithCoder:(id)a3;
- (HMDeviceSetupRequestMessage)initWithPayload:(id)a3;
- (NSData)payload;
- (int64_t)qualityOfService;
- (void)encodeWithCoder:(id)a3;
- (void)setQualityOfService:(int64_t)a3;
@end

@implementation HMDeviceSetupRequestMessage

- (void).cxx_destruct
{
}

- (void)setQualityOfService:(int64_t)a3
{
  self->_qualityOfService = a3;
}

- (int64_t)qualityOfService
{
  return self->_qualityOfService;
}

- (NSData)payload
{
  return self->_payload;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HMDeviceSetupRequestMessage;
  id v4 = a3;
  [(TRMessage *)&v6 encodeWithCoder:v4];
  v5 = [(HMDeviceSetupRequestMessage *)self payload];
  [v4 encodeObject:v5 forKey:@"HM.payload"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[HMDeviceSetupRequestMessage qualityOfService](self, "qualityOfService"), @"HM.qos");
}

- (HMDeviceSetupRequestMessage)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDeviceSetupRequestMessage;
  v5 = [(TRMessage *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HM.payload"];
    payload = v5->_payload;
    v5->_payload = (NSData *)v6;

    if ([v4 containsValueForKey:@"HM.qos"]) {
      v5->_qualityOfService = [v4 decodeIntegerForKey:@"HM.qos"];
    }
  }

  return v5;
}

- (HMDeviceSetupRequestMessage)initWithPayload:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDeviceSetupRequestMessage;
  v5 = [(HMDeviceSetupRequestMessage *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    payload = v5->_payload;
    v5->_payload = (NSData *)v6;

    v5->_qualityOfService = -1;
  }

  return v5;
}

- (HMDeviceSetupRequestMessage)init
{
  return [(HMDeviceSetupRequestMessage *)self initWithPayload:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end