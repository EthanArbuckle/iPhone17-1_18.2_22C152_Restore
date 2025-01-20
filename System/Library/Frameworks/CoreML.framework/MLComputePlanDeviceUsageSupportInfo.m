@interface MLComputePlanDeviceUsageSupportInfo
- (MLComputeDeviceProtocol)computeDevice;
- (MLComputePlanDeviceUsageSupportInfo)initWithComputeDevice:(id)a3 supportState:(int64_t)a4;
- (id)description;
- (int64_t)state;
@end

@implementation MLComputePlanDeviceUsageSupportInfo

- (void).cxx_destruct
{
}

- (MLComputeDeviceProtocol)computeDevice
{
  return self->_computeDevice;
}

- (int64_t)state
{
  return self->_state;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(MLComputePlanDeviceUsageSupportInfo *)self computeDevice];
  v7 = [v3 stringWithFormat:@"<%@: %p> Compute device: %@, Support state: %zd", v5, self, v6, -[MLComputePlanDeviceUsageSupportInfo state](self, "state")];

  return v7;
}

- (MLComputePlanDeviceUsageSupportInfo)initWithComputeDevice:(id)a3 supportState:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MLComputePlanDeviceUsageSupportInfo;
  v8 = [(MLComputePlanDeviceUsageSupportInfo *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_computeDevice, a3);
    v9->_state = a4;
  }

  return v9;
}

@end