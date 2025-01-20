@interface HAP2AccessoryServerDiscoveryAccessoryInfo
+ (id)new;
- (HAP2AccessoryServerDiscoveryAccessoryInfo)init;
- (HAP2AccessoryServerDiscoveryAccessoryInfo)initWithDeviceID:(id)a3 rawDiscoveryInfo:(id)a4;
- (HAPDeviceID)deviceID;
- (NSDictionary)rawDiscoveryInfo;
- (NSString)airPlayDeviceUUIDString;
@end

@implementation HAP2AccessoryServerDiscoveryAccessoryInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawDiscoveryInfo, 0);

  objc_storeStrong((id *)&self->_deviceID, 0);
}

- (NSDictionary)rawDiscoveryInfo
{
  return self->_rawDiscoveryInfo;
}

- (HAPDeviceID)deviceID
{
  return self->_deviceID;
}

- (NSString)airPlayDeviceUUIDString
{
  v2 = [(HAP2AccessoryServerDiscoveryAccessoryInfo *)self rawDiscoveryInfo];
  v3 = [v2 objectForKeyedSubscript:@"bonjourTXTRecord"];
  v4 = [v3 objectForKeyedSubscript:@"psi"];
  v5 = (void *)[v4 copy];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  v7 = v6;

  return v7;
}

- (HAP2AccessoryServerDiscoveryAccessoryInfo)initWithDeviceID:(id)a3 rawDiscoveryInfo:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HAP2AccessoryServerDiscoveryAccessoryInfo;
  v9 = [(HAP2AccessoryServerDiscoveryAccessoryInfo *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_deviceID, a3);
    objc_storeStrong((id *)&v10->_rawDiscoveryInfo, a4);
  }

  return v10;
}

- (HAP2AccessoryServerDiscoveryAccessoryInfo)init
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

+ (id)new
{
  v2 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v3 = *MEMORY[0x1E4F1C3B8];
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

@end