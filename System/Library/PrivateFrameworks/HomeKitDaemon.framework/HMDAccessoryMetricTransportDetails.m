@interface HMDAccessoryMetricTransportDetails
- (BOOL)isAccessoryBatteryPowered;
- (BOOL)isAccessoryBridged;
- (BOOL)isHH2Enabled;
- (BOOL)isThreadAccessory;
- (HMDAccessoryMetricTransportDetails)initWithAccessory:(id)a3;
- (NSString)accessoryProtocol;
- (id)attributeDescriptions;
- (void)setAccessoryProtocol:(id)a3;
- (void)setIsAccessoryBatteryPowered:(BOOL)a3;
- (void)setIsAccessoryBridged:(BOOL)a3;
- (void)setIsHH2Enabled:(BOOL)a3;
- (void)setIsThreadAccessory:(BOOL)a3;
@end

@implementation HMDAccessoryMetricTransportDetails

- (void).cxx_destruct
{
}

- (void)setIsHH2Enabled:(BOOL)a3
{
  self->_isHH2Enabled = a3;
}

- (BOOL)isHH2Enabled
{
  return self->_isHH2Enabled;
}

- (void)setIsThreadAccessory:(BOOL)a3
{
  self->_isThreadAccessory = a3;
}

- (BOOL)isThreadAccessory
{
  return self->_isThreadAccessory;
}

- (void)setIsAccessoryBridged:(BOOL)a3
{
  self->_isAccessoryBridged = a3;
}

- (BOOL)isAccessoryBridged
{
  return self->_isAccessoryBridged;
}

- (void)setIsAccessoryBatteryPowered:(BOOL)a3
{
  self->_isAccessoryBatteryPowered = a3;
}

- (BOOL)isAccessoryBatteryPowered
{
  return self->_isAccessoryBatteryPowered;
}

- (void)setAccessoryProtocol:(id)a3
{
}

- (NSString)accessoryProtocol
{
  return self->_accessoryProtocol;
}

- (id)attributeDescriptions
{
  v20[5] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v19 = [(HMDAccessoryMetricTransportDetails *)self accessoryProtocol];
  v4 = (void *)[v3 initWithName:@"accessoryProtocol" value:v19];
  v20[0] = v4;
  id v5 = objc_alloc(MEMORY[0x263F424F8]);
  [(HMDAccessoryMetricTransportDetails *)self isAccessoryBatteryPowered];
  v6 = HMFBooleanToString();
  v7 = (void *)[v5 initWithName:@"isAccessoryBatteryPowered" value:v6];
  v20[1] = v7;
  id v8 = objc_alloc(MEMORY[0x263F424F8]);
  [(HMDAccessoryMetricTransportDetails *)self isAccessoryBridged];
  v9 = HMFBooleanToString();
  v10 = (void *)[v8 initWithName:@"isAccessoryBridged" value:v9];
  v20[2] = v10;
  id v11 = objc_alloc(MEMORY[0x263F424F8]);
  [(HMDAccessoryMetricTransportDetails *)self isThreadAccessory];
  v12 = HMFBooleanToString();
  v13 = (void *)[v11 initWithName:@"isThreadAccessory" value:v12];
  v20[3] = v13;
  id v14 = objc_alloc(MEMORY[0x263F424F8]);
  [(HMDAccessoryMetricTransportDetails *)self isHH2Enabled];
  v15 = HMFBooleanToString();
  v16 = (void *)[v14 initWithName:@"isHH2Enabled" value:v15];
  v20[4] = v16;
  v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v20 count:5];

  return v17;
}

- (HMDAccessoryMetricTransportDetails)initWithAccessory:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HMDAccessoryMetricTransportDetails;
  id v5 = [(HMDAccessoryMetricTransportDetails *)&v12 init];
  if (v5)
  {
    id v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
    id v8 = v7;

    if ([v8 supportsHAP])
    {
      v9 = @"HAP";
    }
    else if ([v8 supportsCHIP])
    {
      v9 = @"Matter";
    }
    else
    {
      v9 = @"Unknown";
    }
    objc_storeStrong((id *)&v5->_accessoryProtocol, v9);
    v5->_isAccessoryBatteryPowered = [v8 hasBattery];
    v10 = [v8 bridge];
    v5->_isAccessoryBridged = v10 != 0;

    v5->_isThreadAccessory = [v8 supportsThread];
    v5->_isHH2Enabled = HAPIsHH2Enabled();
  }
  return v5;
}

@end