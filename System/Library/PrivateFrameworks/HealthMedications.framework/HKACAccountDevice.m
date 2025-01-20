@interface HKACAccountDevice
+ (BOOL)supportsSecureCoding;
- (BOOL)isCompatibleWithSchedule:(id)a3;
- (BOOL)isEqual:(id)a3;
- (HKACAccountDevice)initWithCoder:(id)a3;
- (HKACAccountDevice)initWithDevice:(id)a3;
- (HKACAccountDevice)initWithPairedDevice:(id)a3;
- (NSString)deviceName;
- (NSString)model;
- (NSString)swVersion;
- (id)description;
- (id)deviceType;
- (id)medicationScheduleCompatibilityVersion;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setModel:(id)a3;
- (void)setSwVersion:(id)a3;
@end

@implementation HKACAccountDevice

- (HKACAccountDevice)initWithDevice:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HKACAccountDevice;
  v5 = [(HKACAccountDevice *)&v15 init];
  if (v5)
  {
    v6 = [v4 model];
    v7 = (void *)[v6 copy];
    [(HKACAccountDevice *)v5 setModel:v7];

    v8 = [v4 name];
    v9 = (void *)[v8 copy];
    [(HKACAccountDevice *)v5 setDeviceName:v9];

    v10 = [v4 swVersion];
    v11 = [v10 componentsSeparatedByString:@";"];
    uint64_t v12 = [v11 lastObject];
    swVersion = v5->_swVersion;
    v5->_swVersion = (NSString *)v12;
  }
  return v5;
}

- (HKACAccountDevice)initWithPairedDevice:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HKACAccountDevice;
  v5 = [(HKACAccountDevice *)&v10 init];
  if (v5)
  {
    v6 = [v4 valueForProperty:*MEMORY[0x1E4F79E18]];
    [(HKACAccountDevice *)v5 setModel:v6];

    v7 = [v4 valueForProperty:*MEMORY[0x1E4F79D50]];
    [(HKACAccountDevice *)v5 setDeviceName:v7];

    v8 = [v4 valueForProperty:*MEMORY[0x1E4F79E60]];
    [(HKACAccountDevice *)v5 setSwVersion:v8];
  }
  return v5;
}

- (id)deviceType
{
  v3 = [(HKACAccountDevice *)self model];
  char v4 = [v3 hasPrefix:@"iPhone"];

  if (v4) {
    return &unk_1F1718FF8;
  }
  v6 = [(HKACAccountDevice *)self model];
  char v7 = [v6 hasPrefix:@"iPad"];

  if (v7) {
    return &unk_1F1719010;
  }
  v8 = [(HKACAccountDevice *)self model];
  char v9 = [v8 hasPrefix:@"Watch"];

  if (v9) {
    return &unk_1F1719028;
  }
  objc_super v10 = [(HKACAccountDevice *)self model];
  int v11 = [v10 hasPrefix:@"RealityDevice"];

  if (v11) {
    return &unk_1F1719040;
  }
  else {
    return 0;
  }
}

- (id)description
{
  v3 = NSString;
  char v4 = [(HKACAccountDevice *)self deviceName];
  v5 = [(HKACAccountDevice *)self swVersion];
  v6 = [(HKACAccountDevice *)self model];
  char v7 = [v3 stringWithFormat:@"Name: %@, OS: %@, Model: %@", v4, v5, v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  char v4 = (HKACAccountDevice *)a3;
  if (self == v4)
  {
    BOOL v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(HKACAccountDevice *)v5 model];
      uint64_t v7 = [(HKACAccountDevice *)self model];
      if (v6 == (void *)v7)
      {
      }
      else
      {
        v8 = (void *)v7;
        uint64_t v9 = [(HKACAccountDevice *)self model];
        if (!v9) {
          goto LABEL_19;
        }
        objc_super v10 = (void *)v9;
        int v11 = [(HKACAccountDevice *)v5 model];
        uint64_t v12 = [(HKACAccountDevice *)self model];
        int v13 = [v11 isEqualToString:v12];

        if (!v13) {
          goto LABEL_20;
        }
      }
      v6 = [(HKACAccountDevice *)v5 deviceName];
      uint64_t v15 = [(HKACAccountDevice *)self deviceName];
      if (v6 == (void *)v15)
      {
      }
      else
      {
        v8 = (void *)v15;
        uint64_t v16 = [(HKACAccountDevice *)self deviceName];
        if (!v16) {
          goto LABEL_19;
        }
        v17 = (void *)v16;
        v18 = [(HKACAccountDevice *)v5 deviceName];
        v19 = [(HKACAccountDevice *)self deviceName];
        int v20 = [v18 isEqualToString:v19];

        if (!v20) {
          goto LABEL_20;
        }
      }
      v6 = [(HKACAccountDevice *)v5 swVersion];
      uint64_t v21 = [(HKACAccountDevice *)self swVersion];
      if (v6 == (void *)v21)
      {

LABEL_24:
        BOOL v14 = 1;
        goto LABEL_21;
      }
      v8 = (void *)v21;
      uint64_t v22 = [(HKACAccountDevice *)self swVersion];
      if (v22)
      {
        v23 = (void *)v22;
        v24 = [(HKACAccountDevice *)v5 swVersion];
        v25 = [(HKACAccountDevice *)self swVersion];
        char v26 = [v24 isEqualToString:v25];

        if (v26) {
          goto LABEL_24;
        }
LABEL_20:
        BOOL v14 = 0;
LABEL_21:

        goto LABEL_22;
      }
LABEL_19:

      goto LABEL_20;
    }
    BOOL v14 = 0;
  }
LABEL_22:

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_model hash];
  NSUInteger v4 = [(NSString *)self->_deviceName hash] ^ v3;
  return v4 ^ [(NSString *)self->_swVersion hash];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  model = self->_model;
  id v5 = a3;
  [v5 encodeObject:model forKey:@"Model"];
  [v5 encodeObject:self->_deviceName forKey:@"DeviceName"];
  [v5 encodeObject:self->_swVersion forKey:@"SWVersion"];
}

- (HKACAccountDevice)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HKACAccountDevice;
  id v5 = [(HKACAccountDevice *)&v10 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Model"];
    [(HKACAccountDevice *)v5 setModel:v6];

    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DeviceName"];
    [(HKACAccountDevice *)v5 setDeviceName:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SWVersion"];
    [(HKACAccountDevice *)v5 setSwVersion:v8];
  }
  return v5;
}

- (NSString)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
}

- (NSString)swVersion
{
  return self->_swVersion;
}

- (void)setSwVersion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swVersion, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);

  objc_storeStrong((id *)&self->_model, 0);
}

- (id)medicationScheduleCompatibilityVersion
{
  long long v11 = 0uLL;
  uint64_t v12 = 0;
  NSUInteger v3 = [(HKACAccountDevice *)self swVersion];
  HKNSOperatingSystemVersionFromString();

  id v4 = [(HKACAccountDevice *)self deviceType];
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 integerValue];
    long long v9 = v11;
    uint64_t v10 = v12;
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithInteger:", HKMedicationScheduleCompatibilityVersionForOSVersion((uint64_t *)&v9, v6));
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (BOOL)isCompatibleWithSchedule:(id)a3
{
  id v4 = a3;
  id v5 = [(HKACAccountDevice *)self medicationScheduleCompatibilityVersion];
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 integerValue];
    BOOL v8 = v7 >= [v4 compatibilityRange];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

@end