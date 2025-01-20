@interface HKMedicationsDeviceInfo
+ (BOOL)supportsSecureCoding;
+ (uint64_t)scheduleCompatibilityVersionForDevice:(uint64_t)a1;
- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)operatingSystemVersion;
- (BOOL)isCompatibleWithSchedule:(id)a3;
- (BOOL)isCompatibleWithScheduleCompatibilityVersion:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLocalDevice;
- (HKMedicationsDeviceInfo)initWithCoder:(id)a3;
- (HKMedicationsDeviceInfo)initWithHardwareIdentifier:(id)a3 name:(id)a4 model:(id)a5 operatingSystemVersion:(id *)a6 scheduleCompatibilityVersion:(int64_t)a7 localDevice:(BOOL)a8;
- (HKMedicationsDeviceInfo)initWithLocalPairedDevice:(id)a3;
- (HKMedicationsDeviceInfo)initWithPairedDevice:(id)a3;
- (NSString)model;
- (NSString)name;
- (NSUUID)hardwareIdentifier;
- (id)_initLocalDeviceWithName:(id)a3 model:(id)a4 operatingSystemVersion:(id *)a5 scheduleCompatibilityVersion:(int64_t)a6;
- (id)description;
- (id)filterOutCompatibleSchedules:(id)a3;
- (int64_t)scheduleCompatibilityVersion;
- (unint64_t)hash;
- (void)_setHardwareIdentifier:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKMedicationsDeviceInfo

- (HKMedicationsDeviceInfo)initWithHardwareIdentifier:(id)a3 name:(id)a4 model:(id)a5 operatingSystemVersion:(id *)a6 scheduleCompatibilityVersion:(int64_t)a7 localDevice:(BOOL)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  v22.receiver = self;
  v22.super_class = (Class)HKMedicationsDeviceInfo;
  v18 = [(HKMedicationsDeviceInfo *)&v22 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_hardwareIdentifier, a3);
    objc_storeStrong((id *)&v19->_name, a4);
    objc_storeStrong((id *)&v19->_model, a5);
    long long v20 = *(_OWORD *)&a6->var0;
    v19->_operatingSystemVersion.patchVersion = a6->var2;
    *(_OWORD *)&v19->_operatingSystemVersion.majorVersion = v20;
    v19->_scheduleCompatibilityVersion = a7;
    v19->_localDevice = a8;
  }

  return v19;
}

- (id)_initLocalDeviceWithName:(id)a3 model:(id)a4 operatingSystemVersion:(id *)a5 scheduleCompatibilityVersion:(int64_t)a6
{
  $9FE6E10C8CE45DBC9A88DFDEA39A390D v7 = *a5;
  return [(HKMedicationsDeviceInfo *)self initWithHardwareIdentifier:0 name:a3 model:a4 operatingSystemVersion:&v7 scheduleCompatibilityVersion:a6 localDevice:1];
}

- (HKMedicationsDeviceInfo)initWithPairedDevice:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F79D50];
  id v5 = a3;
  v6 = [v5 valueForProperty:v4];
  $9FE6E10C8CE45DBC9A88DFDEA39A390D v7 = [v5 valueForProperty:*MEMORY[0x1E4F79E18]];
  v8 = [v5 valueForProperty:*MEMORY[0x1E4F79E60]];
  HKNSOperatingSystemVersionFromString();
  uint64_t v9 = +[HKMedicationsDeviceInfo scheduleCompatibilityVersionForDevice:]((uint64_t)HKMedicationsDeviceInfo, v5);

  v10 = [(HKMedicationsDeviceInfo *)self initWithHardwareIdentifier:0 name:v6 model:v7 operatingSystemVersion:v12 scheduleCompatibilityVersion:v9 localDevice:0];
  return v10;
}

+ (uint64_t)scheduleCompatibilityVersionForDevice:(uint64_t)a1
{
  id v2 = a2;
  self;
  long long v10 = 0uLL;
  uint64_t v11 = 0;
  v3 = [v2 valueForProperty:*MEMORY[0x1E4F79E60]];
  HKNSOperatingSystemVersionFromString();

  uint64_t v4 = [v2 valueForProperty:*MEMORY[0x1E4F79DF8]];

  if (v4)
  {
    uint64_t v5 = [v4 integerValue];
  }
  else
  {
    long long v8 = v10;
    uint64_t v9 = v11;
    uint64_t v5 = HKMedicationScheduleCompatibilityVersionForOSVersion((uint64_t *)&v8, 1);
  }
  uint64_t v6 = v5;

  return v6;
}

- (HKMedicationsDeviceInfo)initWithLocalPairedDevice:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F79D50];
  id v5 = a3;
  uint64_t v6 = [v5 valueForProperty:v4];
  $9FE6E10C8CE45DBC9A88DFDEA39A390D v7 = [v5 valueForProperty:*MEMORY[0x1E4F79E18]];
  long long v8 = [v5 valueForProperty:*MEMORY[0x1E4F79E60]];
  HKNSOperatingSystemVersionFromString();
  uint64_t v9 = +[HKMedicationsDeviceInfo scheduleCompatibilityVersionForDevice:]((uint64_t)HKMedicationsDeviceInfo, v5);

  long long v10 = [(HKMedicationsDeviceInfo *)self initWithHardwareIdentifier:0 name:v6 model:v7 operatingSystemVersion:v12 scheduleCompatibilityVersion:v9 localDevice:1];
  return v10;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  name = self->_name;
  model = self->_model;
  $9FE6E10C8CE45DBC9A88DFDEA39A390D v7 = HKNSOperatingSystemVersionString();
  long long v8 = [NSNumber numberWithInteger:self->_scheduleCompatibilityVersion];
  uint64_t v9 = HKStringFromBool();
  long long v10 = [(NSUUID *)self->_hardwareIdentifier UUIDString];
  uint64_t v11 = [v3 stringWithFormat:@"<%@ name:%@, model:%@, operating system:%@, compatibility version: %@, localDevice: %@, hardware identifier: %@", v4, name, model, v7, v8, v9, v10];

  return v11;
}

- (BOOL)isCompatibleWithSchedule:(id)a3
{
  uint64_t v4 = [a3 compatibilityRange];

  return [(HKMedicationsDeviceInfo *)self isCompatibleWithScheduleCompatibilityVersion:v4];
}

- (BOOL)isCompatibleWithScheduleCompatibilityVersion:(int64_t)a3
{
  return self->_scheduleCompatibilityVersion >= a3;
}

- (id)filterOutCompatibleSchedules:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__HKMedicationsDeviceInfo_filterOutCompatibleSchedules___block_invoke;
  v5[3] = &unk_1E62EBAF8;
  v5[4] = self;
  v3 = objc_msgSend(a3, "hk_filter:", v5);

  return v3;
}

uint64_t __56__HKMedicationsDeviceInfo_filterOutCompatibleSchedules___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) isCompatibleWithSchedule:a2] ^ 1;
}

- (void)_setHardwareIdentifier:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HKMedicationsDeviceInfo *)a3;
  if (self == v4)
  {
    BOOL v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      hardwareIdentifier = self->_hardwareIdentifier;
      $9FE6E10C8CE45DBC9A88DFDEA39A390D v7 = v5->_hardwareIdentifier;
      BOOL v12 = (hardwareIdentifier == v7 || v7 && -[NSUUID isEqual:](hardwareIdentifier, "isEqual:"))
         && ((name = self->_name, uint64_t v9 = v5->_name, name == v9)
          || v9 && -[NSString isEqual:](name, "isEqual:"))
         && ((model = self->_model, uint64_t v11 = v5->_model, model == v11)
          || v11 && -[NSString isEqual:](model, "isEqual:"))
         && HKNSOperatingSystemVersionsEqual()
         && self->_scheduleCompatibilityVersion == v5->_scheduleCompatibilityVersion
         && self->_localDevice == v5->_localDevice;
    }
    else
    {
      BOOL v12 = 0;
    }
  }

  return v12;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSUUID *)self->_hardwareIdentifier hash];
  NSUInteger v4 = [(NSString *)self->_name hash] ^ v3;
  return v4 ^ [(NSString *)self->_model hash] ^ self->_operatingSystemVersion.majorVersion ^ self->_operatingSystemVersion.minorVersion ^ self->_operatingSystemVersion.patchVersion ^ (self->_scheduleCompatibilityVersion << 16) ^ self->_localDevice;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  hardwareIdentifier = self->_hardwareIdentifier;
  id v5 = a3;
  [v5 encodeObject:hardwareIdentifier forKey:@"HardwareIdentifier"];
  [v5 encodeObject:self->_name forKey:@"Name"];
  [v5 encodeObject:self->_model forKey:@"Model"];
  $A44FF20282FB96BA82CF1B0FF6945C38 operatingSystemVersion = self->_operatingSystemVersion;
  uint64_t v6 = HKNSOperatingSystemVersionString();
  objc_msgSend(v5, "encodeObject:forKey:", v6, @"OperatingSystemVersion", *(_OWORD *)&operatingSystemVersion.majorVersion, operatingSystemVersion.patchVersion);

  [v5 encodeInteger:self->_scheduleCompatibilityVersion forKey:@"ScheduleCompatibilityVersion"];
  [v5 encodeBool:self->_localDevice forKey:@"LocalDevice"];
}

- (HKMedicationsDeviceInfo)initWithCoder:(id)a3
{
  id v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HKMedicationsDeviceInfo;
  uint64_t v6 = [(HKMedicationsDeviceInfo *)&v18 init];
  if (v6)
  {
    uint64_t v7 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"HardwareIdentifier"];
    hardwareIdentifier = v6->_hardwareIdentifier;
    v6->_hardwareIdentifier = (NSUUID *)v7;

    uint64_t v9 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"Name"];
    name = v6->_name;
    v6->_name = (NSString *)v9;

    uint64_t v11 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"Model"];
    model = v6->_model;
    v6->_model = (NSString *)v11;

    v13 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"OperatingSystemVersion"];
    if (!v13)
    {
      id v15 = [MEMORY[0x1E4F28B00] currentHandler];
      [v15 handleFailureInMethod:a2 object:v6 file:@"HKMedicationsDeviceInfo.m" lineNumber:183 description:@"Operating system version should not be nil"];
    }
    HKNSOperatingSystemVersionFromString();
    *(_OWORD *)&v6->_operatingSystemVersion.majorVersion = v16;
    v6->_operatingSystemVersion.patchVersion = v17;
    v6->_scheduleCompatibilityVersion = [v5 decodeIntegerForKey:@"ScheduleCompatibilityVersion"];
    v6->_localDevice = [v5 decodeBoolForKey:@"LocalDevice"];
  }
  return v6;
}

- (NSUUID)hardwareIdentifier
{
  return self->_hardwareIdentifier;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)model
{
  return self->_model;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)operatingSystemVersion
{
  *($A44FF20282FB96BA82CF1B0FF6945C38 *)retstr = ($A44FF20282FB96BA82CF1B0FF6945C38)self[2];
  return self;
}

- (int64_t)scheduleCompatibilityVersion
{
  return self->_scheduleCompatibilityVersion;
}

- (BOOL)isLocalDevice
{
  return self->_localDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_hardwareIdentifier, 0);
}

@end