@interface HMDTargetConfiguration
- (BOOL)isEqual:(id)a3;
- (HMDTargetConfiguration)init;
- (HMDTargetConfiguration)initWithAccessory:(id)a3 buttonConfiguration:(id)a4;
- (HMDTargetConfiguration)initWithIdentifier:(id)a3 name:(id)a4 category:(int64_t)a5 buttonConfiguration:(id)a6;
- (NSArray)buttonConfiguration;
- (NSNumber)identifier;
- (NSString)name;
- (NSUUID)uuid;
- (id)description;
- (int64_t)category;
- (unint64_t)hash;
- (void)setButtonConfiguration:(id)a3;
- (void)setName:(id)a3;
@end

@implementation HMDTargetConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonConfiguration, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (void)setButtonConfiguration:(id)a3
{
}

- (NSArray)buttonConfiguration
{
  return self->_buttonConfiguration;
}

- (int64_t)category
{
  return self->_category;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (NSNumber)identifier
{
  return self->_identifier;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (unint64_t)hash
{
  v2 = [(HMDTargetConfiguration *)self identifier];
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMDTargetConfiguration *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (self == v4)
    {
      char v10 = 1;
    }
    else
    {
      v5 = v4;
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v6 = v5;
      }
      else {
        v6 = 0;
      }
      v7 = v6;

      v8 = [(HMDTargetConfiguration *)self identifier];
      v9 = [(HMDTargetConfiguration *)v7 identifier];

      char v10 = [v8 isEqual:v9];
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (HMDTargetConfiguration)initWithAccessory:(id)a3 buttonConfiguration:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 home];
  if (v8)
  {
    v9 = NSNumber;
    char v10 = [v6 uuid];
    v11 = [v8 uuid];
    v12 = objc_msgSend(v9, "numberWithUnsignedInt:", identifierForTargetWithUUID(v10, v11));

    v13 = [v6 name];
    v14 = [v6 category];
    uint64_t v15 = mapTargetCategory(v14);

    v16 = [(HMDTargetConfiguration *)self initWithIdentifier:v12 name:v13 category:v15 buttonConfiguration:v7];
    if (v16)
    {
      uint64_t v17 = [v6 uuid];
      uuid = v16->_uuid;
      v16->_uuid = (NSUUID *)v17;
    }
    v19 = v16;

    v20 = v19;
  }
  else
  {
    v21 = (void *)MEMORY[0x230FBD990]();
    v19 = self;
    v22 = HMFGetOSLogHandle();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = HMFGetLogIdentifier();
      v24 = [v6 name];
      v25 = [v6 uuid];
      v26 = [v25 UUIDString];
      int v28 = 138543874;
      v29 = v23;
      __int16 v30 = 2112;
      v31 = v24;
      __int16 v32 = 2112;
      v33 = v26;
      _os_log_impl(&dword_22F52A000, v22, OS_LOG_TYPE_INFO, "%{public}@Attempting to create a target with an accessory %@/%@ that is not configured with a home", (uint8_t *)&v28, 0x20u);
    }
    v20 = 0;
  }

  return v20;
}

- (id)description
{
  unint64_t v3 = NSString;
  v4 = [(HMDTargetConfiguration *)self name];
  v5 = [(HMDTargetConfiguration *)self identifier];
  int64_t v6 = [(HMDTargetConfiguration *)self category];
  id v7 = @"Unknown";
  if (v6 == 25) {
    id v7 = @"HomePod";
  }
  if (v6 == 24) {
    id v7 = @"AppleTV";
  }
  v8 = v7;
  v9 = [(HMDTargetConfiguration *)self buttonConfiguration];
  char v10 = buttonConfigurationAsString(v9);
  v11 = [v3 stringWithFormat:@"Name: %@, Identifier: %@, Category: %@, ButtonConfiguration: %@", v4, v5, v8, v10];

  return v11;
}

- (HMDTargetConfiguration)initWithIdentifier:(id)a3 name:(id)a4 category:(int64_t)a5 buttonConfiguration:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)HMDTargetConfiguration;
  v14 = [(HMDTargetConfiguration *)&v21 init];
  uint64_t v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_identifier, a3);
    uint64_t v16 = [v12 copy];
    name = v15->_name;
    v15->_name = (NSString *)v16;

    v15->_category = a5;
    uint64_t v18 = [v13 copy];
    buttonConfiguration = v15->_buttonConfiguration;
    v15->_buttonConfiguration = (NSArray *)v18;
  }
  return v15;
}

- (HMDTargetConfiguration)init
{
  v2 = (void *)MEMORY[0x263EFF940];
  uint64_t v3 = *MEMORY[0x263EFF498];
  v4 = NSString;
  v5 = NSStringFromSelector(a2);
  int64_t v6 = [v4 stringWithFormat:@"%@ is unavailable", v5];
  id v7 = [v2 exceptionWithName:v3 reason:v6 userInfo:0];

  objc_exception_throw(v7);
}

@end