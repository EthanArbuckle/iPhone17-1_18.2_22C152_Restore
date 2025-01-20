@interface HDDeviceContext
+ (BOOL)supportsSecureCoding;
+ (id)localProductTypeEnumWithError:(id *)a3;
- ($9FE6E10C8CE45DBC9A88DFDEA39A390D)currentOSVersion;
- (BOOL)isEqual:(id)a3;
- (HDDeviceContext)initWithCoder:(id)a3;
- (HDDeviceContext)initWithType:(int64_t)a3 productTypeName:(id)a4 currentOSName:(id)a5 currentOSVersion:(id *)a6 modificationDate:(id)a7 syncIdentity:(id)a8;
- (HDSyncIdentity)syncIdentity;
- (NSDate)modificationDate;
- (NSString)currentOSName;
- (NSString)productTypeName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)initForLocalDeviceWithType:(int64_t)a3 syncIdentity:(id)a4;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDDeviceContext

+ (id)localProductTypeEnumWithError:(id *)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v4 = [MEMORY[0x1E4F2B860] currentDeviceProductType];
  if ([v4 hasPrefix:*MEMORY[0x1E4F2A578]])
  {
    uint64_t v5 = 0;
LABEL_9:

    v6 = [NSNumber numberWithInteger:v5];
    goto LABEL_10;
  }
  if ([v4 hasPrefix:*MEMORY[0x1E4F2A570]])
  {
    uint64_t v5 = 1;
    goto LABEL_9;
  }
  if ([v4 hasPrefix:*MEMORY[0x1E4F2A588]])
  {
    uint64_t v5 = 2;
    goto LABEL_9;
  }
  if ([v4 hasPrefix:*MEMORY[0x1E4F2A580]])
  {
    uint64_t v5 = 3;
    goto LABEL_9;
  }
  _HKInitializeLogging();
  v8 = *MEMORY[0x1E4F29F28];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_ERROR))
  {
    int v9 = 138412290;
    v10 = v4;
    _os_log_error_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_ERROR, "Device of type %@ is not supported", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a3, 3, @"Device of type is not supported");
  v6 = 0;
LABEL_10:

  return v6;
}

- (id)initForLocalDeviceWithType:(int64_t)a3 syncIdentity:(id)a4
{
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)HDDeviceContext;
  v8 = [(HDDeviceContext *)&v19 init];
  int v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    uint64_t v10 = [MEMORY[0x1E4F1C9C8] now];
    modificationDate = v9->_modificationDate;
    v9->_modificationDate = (NSDate *)v10;

    uint64_t v12 = [MEMORY[0x1E4F2B860] currentDeviceProductType];
    productTypeName = v9->_productTypeName;
    v9->_productTypeName = (NSString *)v12;

    uint64_t v14 = [MEMORY[0x1E4F2B860] currentOSName];
    currentOSName = v9->_currentOSName;
    v9->_currentOSName = (NSString *)v14;

    [MEMORY[0x1E4F2B860] currentOSVersionStruct];
    *(_OWORD *)&v9->_currentOSVersion.majorVersion = v17;
    v9->_currentOSVersion.patchVersion = v18;
    objc_storeStrong((id *)&v9->_syncIdentity, a4);
  }

  return v9;
}

- (HDDeviceContext)initWithType:(int64_t)a3 productTypeName:(id)a4 currentOSName:(id)a5 currentOSVersion:(id *)a6 modificationDate:(id)a7 syncIdentity:(id)a8
{
  id v22 = a4;
  id v15 = a5;
  id v16 = a7;
  id v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)HDDeviceContext;
  int64_t v18 = [(HDDeviceContext *)&v23 init];
  objc_super v19 = v18;
  if (v18)
  {
    v18->_type = a3;
    objc_storeStrong((id *)&v18->_modificationDate, a7);
    objc_storeStrong((id *)&v19->_productTypeName, a4);
    objc_storeStrong((id *)&v19->_currentOSName, a5);
    long long v20 = *(_OWORD *)&a6->var0;
    v19->_currentOSVersion.patchVersion = a6->var2;
    *(_OWORD *)&v19->_currentOSVersion.majorVersion = v20;
    objc_storeStrong((id *)&v19->_syncIdentity, a8);
  }

  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[HDDeviceContext allocWithZone:a3];
  currentOSName = self->_currentOSName;
  productTypeName = self->_productTypeName;
  int64_t type = self->_type;
  modificationDate = self->_modificationDate;
  syncIdentity = self->_syncIdentity;
  $A44FF20282FB96BA82CF1B0FF6945C38 currentOSVersion = self->_currentOSVersion;
  return [(HDDeviceContext *)v4 initWithType:type productTypeName:productTypeName currentOSName:currentOSName currentOSVersion:&currentOSVersion modificationDate:modificationDate syncIdentity:syncIdentity];
}

- (BOOL)isEqual:(id)a3
{
  v6 = (HDDeviceContext *)a3;
  if (self == v6)
  {
    char v13 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = v6;
      int64_t type = self->_type;
      if (type != [(HDDeviceContext *)v7 type])
      {
        char v13 = 0;
LABEL_31:

        goto LABEL_32;
      }
      productTypeName = self->_productTypeName;
      uint64_t v10 = [(HDDeviceContext *)v7 productTypeName];
      if (productTypeName != v10)
      {
        uint64_t v11 = [(HDDeviceContext *)v7 productTypeName];
        if (!v11)
        {
          char v13 = 0;
          goto LABEL_30;
        }
        v3 = (void *)v11;
        uint64_t v12 = self->_productTypeName;
        v4 = [(HDDeviceContext *)v7 productTypeName];
        if (![(NSString *)v12 isEqualToString:v4])
        {

          char v13 = 0;
LABEL_29:

          goto LABEL_30;
        }
        v24 = v4;
      }
      currentOSName = self->_currentOSName;
      id v15 = [(HDDeviceContext *)v7 currentOSName];
      if (currentOSName != v15)
      {
        uint64_t v16 = [(HDDeviceContext *)v7 currentOSName];
        if (!v16) {
          goto LABEL_24;
        }
        v4 = (void *)v16;
        id v17 = self->_currentOSName;
        objc_super v23 = [(HDDeviceContext *)v7 currentOSName];
        if (!-[NSString isEqualToString:](v17, "isEqualToString:"))
        {
          char v13 = 0;
          int64_t v18 = v24;
LABEL_21:

          goto LABEL_27;
        }
      }
      if (v7) {
        [(HDDeviceContext *)v7 currentOSVersion];
      }
      if (HKNSOperatingSystemVersionsEqual())
      {
        syncIdentity = self->_syncIdentity;
        long long v20 = [(HDDeviceContext *)v7 syncIdentity];
        char v13 = [(HDSyncIdentity *)syncIdentity isEqual:v20];

        BOOL v21 = currentOSName == v15;
        int64_t v18 = v24;
        if (v21) {
          goto LABEL_27;
        }
        goto LABEL_21;
      }
      if (currentOSName == v15)
      {
        char v13 = 0;
        int64_t v18 = v24;
LABEL_27:

        if (productTypeName != v10)
        {
LABEL_28:

          goto LABEL_29;
        }
LABEL_30:

        goto LABEL_31;
      }

LABEL_24:
      char v13 = 0;
      int64_t v18 = v24;
      if (productTypeName == v10) {
        goto LABEL_30;
      }
      goto LABEL_28;
    }
    char v13 = 0;
  }
LABEL_32:

  return v13;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  int64_t type = self->_type;
  currentOSName = self->_currentOSName;
  productTypeName = self->_productTypeName;
  $A44FF20282FB96BA82CF1B0FF6945C38 currentOSVersion = self->_currentOSVersion;
  v8 = HKNSOperatingSystemVersionString();
  int v9 = [v3 stringWithFormat:@"<%@:%p type:%ld productType:%@ OSName:%@ OSVersion:%@ sync identity:%@ last modified:%@ ", v4, self, type, productTypeName, currentOSName, v8, self->_syncIdentity, self->_modificationDate, *(_OWORD *)&currentOSVersion.majorVersion, currentOSVersion.patchVersion];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDDeviceContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)HDDeviceContext;
  uint64_t v5 = [(HDDeviceContext *)&v18 init];
  if (v5)
  {
    v5->_int64_t type = [v4 decodeInt64ForKey:@"ProductType"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ProductTypeName"];
    productTypeName = v5->_productTypeName;
    v5->_productTypeName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CurrentOSName"];
    currentOSName = v5->_currentOSName;
    v5->_currentOSName = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CurrentOSVersion"];
    HKNSOperatingSystemVersionFromString();
    *(_OWORD *)&v5->_currentOSVersion.majorVersion = v16;
    v5->_currentOSVersion.patchVersion = v17;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ModificationDate"];
    modificationDate = v5->_modificationDate;
    v5->_modificationDate = (NSDate *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SyncIdentity"];
    syncIdentity = v5->_syncIdentity;
    v5->_syncIdentity = (HDSyncIdentity *)v13;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type = self->_type;
  id v5 = a3;
  [v5 encodeInt64:type forKey:@"ProductType"];
  [v5 encodeObject:self->_productTypeName forKey:@"ProductTypeName"];
  [v5 encodeObject:self->_currentOSName forKey:@"CurrentOSName"];
  $A44FF20282FB96BA82CF1B0FF6945C38 currentOSVersion = self->_currentOSVersion;
  uint64_t v6 = HKNSOperatingSystemVersionString();
  objc_msgSend(v5, "encodeObject:forKey:", v6, @"CurrentOSVersion", *(_OWORD *)&currentOSVersion.majorVersion, currentOSVersion.patchVersion);

  [v5 encodeObject:self->_modificationDate forKey:@"ModificationDate"];
  [v5 encodeObject:self->_syncIdentity forKey:@"SyncIdentity"];
}

- (int64_t)type
{
  return self->_type;
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (HDSyncIdentity)syncIdentity
{
  return self->_syncIdentity;
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
  objc_storeStrong((id *)&self->_syncIdentity, 0);

  objc_storeStrong((id *)&self->_modificationDate, 0);
}

@end