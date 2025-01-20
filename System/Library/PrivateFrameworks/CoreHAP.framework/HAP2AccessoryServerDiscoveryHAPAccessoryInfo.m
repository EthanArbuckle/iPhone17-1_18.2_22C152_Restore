@interface HAP2AccessoryServerDiscoveryHAPAccessoryInfo
- (HAP2AccessoryServerDiscoveryHAPAccessoryInfo)initWithDeviceID:(id)a3 rawDiscoveryInfo:(id)a4;
- (HAP2AccessoryServerDiscoveryHAPAccessoryInfo)initWithDeviceID:(id)a3 rawDiscoveryInfo:(id)a4 name:(id)a5 model:(id)a6 status:(unsigned __int8)a7 category:(unint64_t)a8 configurationNumber:(unint64_t)a9 stateNumber:(unint64_t)a10 protocolVersion:(id)a11 featureFlags:(unint64_t)a12 setupHash:(id)a13;
- (HMFVersion)protocolVersion;
- (NSData)setupHash;
- (NSString)model;
- (NSString)name;
- (unint64_t)category;
- (unint64_t)configurationNumber;
- (unint64_t)featureFlags;
- (unint64_t)stateNumber;
- (unsigned)status;
@end

@implementation HAP2AccessoryServerDiscoveryHAPAccessoryInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupHash, 0);
  objc_storeStrong((id *)&self->_protocolVersion, 0);
  objc_storeStrong((id *)&self->_model, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (NSData)setupHash
{
  return self->_setupHash;
}

- (unint64_t)featureFlags
{
  return self->_featureFlags;
}

- (HMFVersion)protocolVersion
{
  return self->_protocolVersion;
}

- (unint64_t)stateNumber
{
  return self->_stateNumber;
}

- (unint64_t)configurationNumber
{
  return self->_configurationNumber;
}

- (unint64_t)category
{
  return self->_category;
}

- (unsigned)status
{
  return self->_status;
}

- (NSString)model
{
  return self->_model;
}

- (NSString)name
{
  return self->_name;
}

- (HAP2AccessoryServerDiscoveryHAPAccessoryInfo)initWithDeviceID:(id)a3 rawDiscoveryInfo:(id)a4 name:(id)a5 model:(id)a6 status:(unsigned __int8)a7 category:(unint64_t)a8 configurationNumber:(unint64_t)a9 stateNumber:(unint64_t)a10 protocolVersion:(id)a11 featureFlags:(unint64_t)a12 setupHash:(id)a13
{
  id v18 = a5;
  id v19 = a6;
  id v26 = a11;
  id v20 = a13;
  v27.receiver = self;
  v27.super_class = (Class)HAP2AccessoryServerDiscoveryHAPAccessoryInfo;
  v21 = [(HAP2AccessoryServerDiscoveryAccessoryInfo *)&v27 initWithDeviceID:a3 rawDiscoveryInfo:a4];
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_name, a5);
    objc_storeStrong((id *)&v22->_model, a6);
    v22->_status = a7;
    v22->_category = a8;
    v22->_configurationNumber = a9;
    v22->_stateNumber = a10;
    objc_storeStrong((id *)&v22->_protocolVersion, a11);
    v22->_featureFlags = a12;
    objc_storeStrong((id *)&v22->_setupHash, a13);
  }

  return v22;
}

- (HAP2AccessoryServerDiscoveryHAPAccessoryInfo)initWithDeviceID:(id)a3 rawDiscoveryInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v9 = *MEMORY[0x1E4F1C3B8];
  v10 = NSString;
  v11 = NSStringFromSelector(a2);
  v12 = [v10 stringWithFormat:@"%@ is unavailable", v11];
  id v13 = [v8 exceptionWithName:v9 reason:v12 userInfo:0];

  objc_exception_throw(v13);
}

@end