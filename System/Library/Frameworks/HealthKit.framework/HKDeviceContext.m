@interface HKDeviceContext
+ (BOOL)supportsSecureCoding;
- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)currentOSVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)representsLocalDevice;
- (HKDeviceContext)initWithCoder:(id)a3;
- (HKDeviceContext)initWithType:(int64_t)a3 localDevice:(BOOL)a4 productTypeName:(id)a5 currentOSName:(id)a6 currentOSVersion:(id *)a7 modificationDate:(id)a8;
- (NSDate)modificationDate;
- (NSString)currentOSName;
- (NSString)productTypeName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKDeviceContext

- (HKDeviceContext)initWithType:(int64_t)a3 localDevice:(BOOL)a4 productTypeName:(id)a5 currentOSName:(id)a6 currentOSVersion:(id *)a7 modificationDate:(id)a8
{
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  v22.receiver = self;
  v22.super_class = (Class)HKDeviceContext;
  v18 = [(HKDeviceContext *)&v22 init];
  v19 = v18;
  if (v18)
  {
    v18->_type = a3;
    v18->_representsLocalDevice = a4;
    objc_storeStrong((id *)&v18->_modificationDate, a8);
    objc_storeStrong((id *)&v19->_productTypeName, a5);
    objc_storeStrong((id *)&v19->_currentOSName, a6);
    long long v20 = *(_OWORD *)&a7->var0;
    v19->_currentOSVersion.patchVersion = a7->var2;
    *(_OWORD *)&v19->_currentOSVersion.majorVersion = v20;
  }

  return v19;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = HKStringForDeviceType(self->_type);
  BOOL representsLocalDevice = self->_representsLocalDevice;
  currentOSName = self->_currentOSName;
  productTypeName = self->_productTypeName;
  $A44FF20282FB96BA82CF1B0FF6945C38 currentOSVersion = self->_currentOSVersion;
  v10 = HKNSOperatingSystemVersionString(&currentOSVersion);
  v11 = [v3 stringWithFormat:@"<%@:%p type=%@, representsLocalDevice=%d, productType=%@, currentOS=%@, currentOSVersion=%@, modificationDate=%@>", v5, self, v6, representsLocalDevice, productTypeName, currentOSName, v10, self->_modificationDate];

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[HKDeviceContext allocWithZone:a3];
  BOOL representsLocalDevice = self->_representsLocalDevice;
  currentOSName = self->_currentOSName;
  productTypeName = self->_productTypeName;
  int64_t type = self->_type;
  modificationDate = self->_modificationDate;
  $A44FF20282FB96BA82CF1B0FF6945C38 currentOSVersion = self->_currentOSVersion;
  return [(HKDeviceContext *)v4 initWithType:type localDevice:representsLocalDevice productTypeName:productTypeName currentOSName:currentOSName currentOSVersion:&currentOSVersion modificationDate:modificationDate];
}

- (BOOL)isEqual:(id)a3
{
  v7 = (HKDeviceContext *)a3;
  if (self == v7)
  {
    char v16 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = v7;
      int64_t v9 = [(HKDeviceContext *)self type];
      if (v9 != [(HKDeviceContext *)v8 type]
        || (BOOL representsLocalDevice = self->_representsLocalDevice,
            representsLocalDevice != [(HKDeviceContext *)v8 representsLocalDevice]))
      {
        char v16 = 0;
LABEL_26:

        goto LABEL_27;
      }
      productTypeName = self->_productTypeName;
      v12 = [(HKDeviceContext *)v8 productTypeName];
      if (productTypeName != v12)
      {
        uint64_t v13 = [(HKDeviceContext *)v8 productTypeName];
        if (!v13)
        {
          char v16 = 0;
          goto LABEL_25;
        }
        v3 = (void *)v13;
        v14 = self->_productTypeName;
        id v15 = [(HKDeviceContext *)v8 productTypeName];
        if (![(NSString *)v14 isEqualToString:v15])
        {
          char v16 = 0;
LABEL_24:

          goto LABEL_25;
        }
        v25 = v15;
      }
      currentOSName = self->_currentOSName;
      v18 = [(HKDeviceContext *)v8 currentOSName];
      if (currentOSName != v18)
      {
        uint64_t v19 = [(HKDeviceContext *)v8 currentOSName];
        if (!v19)
        {

          char v16 = 0;
          goto LABEL_29;
        }
        v4 = (void *)v19;
        long long v20 = self->_currentOSName;
        uint64_t v21 = [(HKDeviceContext *)v8 currentOSName];
        objc_super v22 = v20;
        v5 = (void *)v21;
        if (![(NSString *)v22 isEqualToString:v21])
        {
          char v16 = 0;
          goto LABEL_23;
        }
      }
      p_$A44FF20282FB96BA82CF1B0FF6945C38 currentOSVersion = &self->_currentOSVersion;
      if (v8) {
        [(HKDeviceContext *)v8 currentOSVersion];
      }
      else {
        memset(v28, 0, sizeof(v28));
      }
      long long v26 = *(_OWORD *)&p_currentOSVersion->majorVersion;
      int64_t patchVersion = p_currentOSVersion->patchVersion;
      char v16 = HKNSOperatingSystemVersionsEqual((uint64_t)&v26, (uint64_t)v28);
      if (currentOSName != v18)
      {
LABEL_23:
        id v15 = v25;

        if (productTypeName != v12) {
          goto LABEL_24;
        }
LABEL_25:

        goto LABEL_26;
      }

LABEL_29:
      id v15 = v25;
      if (productTypeName == v12) {
        goto LABEL_25;
      }
      goto LABEL_24;
    }
    char v16 = 0;
  }
LABEL_27:

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type = self->_type;
  id v5 = a3;
  [v5 encodeInteger:type forKey:@"Type"];
  [v5 encodeBool:self->_representsLocalDevice forKey:@"LocalDevice"];
  [v5 encodeObject:self->_productTypeName forKey:@"ProductTypeName"];
  [v5 encodeObject:self->_currentOSName forKey:@"CurrentOSName"];
  $A44FF20282FB96BA82CF1B0FF6945C38 currentOSVersion = self->_currentOSVersion;
  v6 = HKNSOperatingSystemVersionString(&currentOSVersion);
  [v5 encodeObject:v6 forKey:@"CurrentOSVersion"];

  [v5 encodeObject:self->_modificationDate forKey:@"ModificationDate"];
}

- (HKDeviceContext)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"Type"];
  uint64_t v6 = [v4 decodeBoolForKey:@"LocalDevice"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ProductTypeName"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CurrentOSName"];
  long long v15 = 0uLL;
  uint64_t v16 = 0;
  int64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CurrentOSVersion"];
  HKNSOperatingSystemVersionFromString(v9, (uint64_t *)&v15);

  v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ModificationDate"];

  v11 = 0;
  if (v7 && v8 && v10)
  {
    long long v13 = v15;
    uint64_t v14 = v16;
    self = [(HKDeviceContext *)self initWithType:v5 localDevice:v6 productTypeName:v7 currentOSName:v8 currentOSVersion:&v13 modificationDate:v10];
    v11 = self;
  }

  return v11;
}

- (int64_t)type
{
  return self->_type;
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (BOOL)representsLocalDevice
{
  return self->_representsLocalDevice;
}

- (NSString)currentOSName
{
  return self->_currentOSName;
}

- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)currentOSVersion
{
  *($A44FF20282FB96BA82CF1B0FF6945C38 *)retstr = ($A44FF20282FB96BA82CF1B0FF6945C38)self[2];
  return self;
}

- (NSString)productTypeName
{
  return self->_productTypeName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productTypeName, 0);
  objc_storeStrong((id *)&self->_currentOSName, 0);

  objc_storeStrong((id *)&self->_modificationDate, 0);
}

@end