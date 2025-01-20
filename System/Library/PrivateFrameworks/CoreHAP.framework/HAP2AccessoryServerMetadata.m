@interface HAP2AccessoryServerMetadata
+ (id)new;
- (BOOL)hasPairings;
- (HAP2AccessoryServerMetadata)init;
- (HAP2AccessoryServerMetadata)initWithDeviceID:(id)a3 hasPairings:(BOOL)a4 protocolVersion:(id)a5 name:(id)a6 model:(id)a7 category:(unint64_t)a8 stateNumber:(unsigned __int16)a9 configNumber:(unsigned __int16)a10 setupHash:(id)a11;
- (HAPDeviceID)deviceID;
- (HMFVersion)protocolVersion;
- (NSData)setupHash;
- (NSString)model;
- (NSString)name;
- (unint64_t)category;
- (unsigned)configNumber;
- (unsigned)stateNumber;
@end

@implementation HAP2AccessoryServerMetadata

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupHash, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_protocolVersion, 0);

  objc_storeStrong((id *)&self->_deviceID, 0);
}

- (NSData)setupHash
{
  return self->_setupHash;
}

- (unsigned)configNumber
{
  return self->_configNumber;
}

- (unsigned)stateNumber
{
  return self->_stateNumber;
}

- (unint64_t)category
{
  return self->_category;
}

- (NSString)model
{
  return self->_model;
}

- (NSString)name
{
  return self->_name;
}

- (HMFVersion)protocolVersion
{
  return self->_protocolVersion;
}

- (BOOL)hasPairings
{
  return self->_hasPairings;
}

- (HAPDeviceID)deviceID
{
  return self->_deviceID;
}

- (HAP2AccessoryServerMetadata)initWithDeviceID:(id)a3 hasPairings:(BOOL)a4 protocolVersion:(id)a5 name:(id)a6 model:(id)a7 category:(unint64_t)a8 stateNumber:(unsigned __int16)a9 configNumber:(unsigned __int16)a10 setupHash:(id)a11
{
  id v16 = a3;
  id v17 = a5;
  id v18 = a6;
  id v25 = a7;
  id v19 = a11;
  v26.receiver = self;
  v26.super_class = (Class)HAP2AccessoryServerMetadata;
  v20 = [(HAP2AccessoryServerMetadata *)&v26 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_deviceID, a3);
    v21->_hasPairings = a4;
    objc_storeStrong((id *)&v21->_protocolVersion, a5);
    objc_storeStrong((id *)&v21->_name, a6);
    objc_storeStrong((id *)&v21->_model, a7);
    v21->_category = a8;
    v21->_stateNumber = a9;
    v21->_configNumber = a10;
    objc_storeStrong((id *)&v21->_setupHash, a11);
  }

  return v21;
}

- (HAP2AccessoryServerMetadata)init
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