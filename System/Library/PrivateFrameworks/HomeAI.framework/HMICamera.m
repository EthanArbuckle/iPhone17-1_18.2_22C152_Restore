@interface HMICamera
+ (BOOL)supportsSecureCoding;
- (BOOL)hasBattery;
- (BOOL)isEqual:(id)a3;
- (HMICamera)initWithCoder:(id)a3;
- (HMICamera)initWithIdentifier:(id)a3 name:(id)a4 manufacturer:(id)a5 model:(id)a6;
- (HMICamera)initWithIdentifier:(id)a3 name:(id)a4 manufacturer:(id)a5 model:(id)a6 firmwareVersion:(id)a7;
- (HMICamera)initWithIdentifier:(id)a3 name:(id)a4 manufacturer:(id)a5 model:(id)a6 firmwareVersion:(id)a7 hasBattery:(BOOL)a8;
- (NSString)firmwareVersion;
- (NSString)manufacturer;
- (NSString)model;
- (NSString)name;
- (NSUUID)identifier;
- (id)attributeDescriptions;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMICamera

- (HMICamera)initWithIdentifier:(id)a3 name:(id)a4 manufacturer:(id)a5 model:(id)a6
{
  return [(HMICamera *)self initWithIdentifier:a3 name:a4 manufacturer:a5 model:a6 firmwareVersion:0 hasBattery:0];
}

- (HMICamera)initWithIdentifier:(id)a3 name:(id)a4 manufacturer:(id)a5 model:(id)a6 firmwareVersion:(id)a7
{
  return [(HMICamera *)self initWithIdentifier:a3 name:a4 manufacturer:a5 model:a6 firmwareVersion:a7 hasBattery:0];
}

- (HMICamera)initWithIdentifier:(id)a3 name:(id)a4 manufacturer:(id)a5 model:(id)a6 firmwareVersion:(id)a7 hasBattery:(BOOL)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  if (!v14)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  if (!v15)
  {
LABEL_7:
    v32 = (void *)_HMFPreconditionFailure();
    return (HMICamera *)+[HMICamera logCategory];
  }
  v19 = v18;
  v34.receiver = self;
  v34.super_class = (Class)HMICamera;
  v20 = [(HMICamera *)&v34 init];
  if (v20)
  {
    uint64_t v21 = [v14 copy];
    identifier = v20->_identifier;
    v20->_identifier = (NSUUID *)v21;

    uint64_t v23 = [v15 copy];
    name = v20->_name;
    v20->_name = (NSString *)v23;

    uint64_t v25 = [v16 copy];
    manufacturer = v20->_manufacturer;
    v20->_manufacturer = (NSString *)v25;

    uint64_t v27 = [v17 copy];
    model = v20->_model;
    v20->_model = (NSString *)v27;

    uint64_t v29 = [v19 copy];
    firmwareVersion = v20->_firmwareVersion;
    v20->_firmwareVersion = (NSString *)v29;

    v20->_hasBattery = a8;
  }

  return v20;
}

- (id)attributeDescriptions
{
  v23[6] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v22 = [(HMICamera *)self identifier];
  uint64_t v21 = (void *)[v3 initWithName:@"Identifier" value:v22];
  v23[0] = v21;
  id v4 = objc_alloc(MEMORY[0x263F424F8]);
  v20 = [(HMICamera *)self name];
  v5 = (void *)[v4 initWithName:@"Name" value:v20];
  v23[1] = v5;
  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  v7 = [(HMICamera *)self manufacturer];
  v8 = (void *)[v6 initWithName:@"Manufacturer" value:v7];
  v23[2] = v8;
  id v9 = objc_alloc(MEMORY[0x263F424F8]);
  v10 = [(HMICamera *)self model];
  v11 = (void *)[v9 initWithName:@"Model" value:v10];
  v23[3] = v11;
  id v12 = objc_alloc(MEMORY[0x263F424F8]);
  v13 = [(HMICamera *)self firmwareVersion];
  id v14 = (void *)[v12 initWithName:@"Firmware Version" value:v13];
  v23[4] = v14;
  id v15 = objc_alloc(MEMORY[0x263F424F8]);
  id v16 = objc_msgSend(NSNumber, "numberWithBool:", -[HMICamera hasBattery](self, "hasBattery"));
  id v17 = (void *)[v15 initWithName:@"Has Battery" value:v16];
  v23[5] = v17;
  id v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:6];

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMICamera *)a3;
  if (v4 == self)
  {
    char v24 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      id v6 = [(HMICamera *)self identifier];
      v7 = [(HMICamera *)v5 identifier];
      char v8 = HMFEqualObjects();

      id v9 = [(HMICamera *)self name];
      v10 = [(HMICamera *)v5 name];
      char v11 = HMFEqualObjects();

      char v12 = v8 & v11;
      v13 = [(HMICamera *)self manufacturer];
      id v14 = [(HMICamera *)v5 manufacturer];
      char v15 = HMFEqualObjects();

      id v16 = [(HMICamera *)self model];
      id v17 = [(HMICamera *)v5 model];
      char v18 = HMFEqualObjects();

      char v19 = v12 & v15 & v18;
      uint64_t v20 = [(HMICamera *)self firmwareVersion];
      uint64_t v21 = [(HMICamera *)v5 firmwareVersion];
      char v22 = HMFEqualObjects();

      BOOL v23 = [(HMICamera *)self hasBattery];
      LOBYTE(v20) = [(HMICamera *)v5 hasBattery];

      char v24 = v19 & v22 & (v23 ^ v20 ^ 1);
    }
    else
    {
      char v24 = 0;
    }
  }

  return v24;
}

- (unint64_t)hash
{
  v2 = [(HMICamera *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HMICamera)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = NSStringFromSelector(sel_identifier);
  v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  uint64_t v8 = objc_opt_class();
  id v9 = NSStringFromSelector(sel_name);
  v10 = [v4 decodeObjectOfClass:v8 forKey:v9];

  uint64_t v11 = objc_opt_class();
  char v12 = NSStringFromSelector(sel_manufacturer);
  v13 = [v4 decodeObjectOfClass:v11 forKey:v12];

  uint64_t v14 = objc_opt_class();
  char v15 = NSStringFromSelector(sel_model);
  id v16 = [v4 decodeObjectOfClass:v14 forKey:v15];

  uint64_t v17 = objc_opt_class();
  char v18 = NSStringFromSelector(sel_firmwareVersion);
  char v19 = [v4 decodeObjectOfClass:v17 forKey:v18];

  uint64_t v20 = NSStringFromSelector(sel_hasBattery);
  uint64_t v21 = [v4 decodeBoolForKey:v20];

  char v22 = [(HMICamera *)self initWithIdentifier:v7 name:v10 manufacturer:v13 model:v16 firmwareVersion:v19 hasBattery:v21];
  return v22;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(HMICamera *)self identifier];
  id v6 = NSStringFromSelector(sel_identifier);
  [v4 encodeObject:v5 forKey:v6];

  v7 = [(HMICamera *)self name];
  uint64_t v8 = NSStringFromSelector(sel_name);
  [v4 encodeObject:v7 forKey:v8];

  id v9 = [(HMICamera *)self manufacturer];
  v10 = NSStringFromSelector(sel_manufacturer);
  [v4 encodeObject:v9 forKey:v10];

  uint64_t v11 = [(HMICamera *)self model];
  char v12 = NSStringFromSelector(sel_model);
  [v4 encodeObject:v11 forKey:v12];

  v13 = [(HMICamera *)self firmwareVersion];
  uint64_t v14 = NSStringFromSelector(sel_firmwareVersion);
  [v4 encodeObject:v13 forKey:v14];

  BOOL v15 = [(HMICamera *)self hasBattery];
  NSStringFromSelector(sel_hasBattery);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeBool:v15 forKey:v16];
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)manufacturer
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)model
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)firmwareVersion
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (BOOL)hasBattery
{
  return self->_hasBattery;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_firmwareVersion, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end