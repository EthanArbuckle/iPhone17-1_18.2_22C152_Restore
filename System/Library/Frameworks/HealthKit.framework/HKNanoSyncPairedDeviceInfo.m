@interface HKNanoSyncPairedDeviceInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isActive;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRestoreComplete;
- (HKNanoSyncPairedDeviceInfo)initWithCoder:(id)a3;
- (HKNanoSyncPairedDeviceInfo)initWithSourceBundleIdentifier:(id)a3 systemBuildVersion:(id)a4 productType:(id)a5 active:(BOOL)a6 restoreComplete:(BOOL)a7 protocolVersion:(int)a8;
- (NSString)productType;
- (NSString)sourceBundleIdentifier;
- (NSString)systemBuildVersion;
- (id)description;
- (int)protocolVersion;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKNanoSyncPairedDeviceInfo

- (HKNanoSyncPairedDeviceInfo)initWithSourceBundleIdentifier:(id)a3 systemBuildVersion:(id)a4 productType:(id)a5 active:(BOOL)a6 restoreComplete:(BOOL)a7 protocolVersion:(int)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  v25.receiver = self;
  v25.super_class = (Class)HKNanoSyncPairedDeviceInfo;
  v17 = [(HKNanoSyncPairedDeviceInfo *)&v25 init];
  if (v17)
  {
    uint64_t v18 = [v14 copy];
    sourceBundleIdentifier = v17->_sourceBundleIdentifier;
    v17->_sourceBundleIdentifier = (NSString *)v18;

    uint64_t v20 = [v15 copy];
    systemBuildVersion = v17->_systemBuildVersion;
    v17->_systemBuildVersion = (NSString *)v20;

    uint64_t v22 = [v16 copy];
    productType = v17->_productType;
    v17->_productType = (NSString *)v22;

    if (v10) {
      v17->_state |= 1uLL;
    }
    if (v9) {
      v17->_state |= 2uLL;
    }
    v17->_protocolVersion = a8;
  }

  return v17;
}

- (BOOL)isActive
{
  return self->_state & 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = v4;
    sourceBundleIdentifier = self->_sourceBundleIdentifier;
    v7 = (NSString *)v5[1];
    BOOL v12 = (sourceBundleIdentifier == v7 || v7
                                        && -[NSString isEqualToString:](sourceBundleIdentifier, "isEqualToString:"))
       && ((systemBuildVersion = self->_systemBuildVersion, BOOL v9 = (NSString *)v5[2], systemBuildVersion == v9)
        || v9 && -[NSString isEqualToString:](systemBuildVersion, "isEqualToString:"))
       && ((productType = self->_productType, v11 = (NSString *)v5[3], productType == v11)
        || v11 && -[NSString isEqualToString:](productType, "isEqualToString:"))
       && self->_state == v5[4]
       && self->_protocolVersion == *((_DWORD *)v5 + 10);
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_systemBuildVersion, 0);

  objc_storeStrong((id *)&self->_sourceBundleIdentifier, 0);
}

- (BOOL)isRestoreComplete
{
  return (LOBYTE(self->_state) >> 1) & 1;
}

- (NSString)sourceBundleIdentifier
{
  return self->_sourceBundleIdentifier;
}

- (NSString)systemBuildVersion
{
  return self->_systemBuildVersion;
}

- (NSString)productType
{
  return self->_productType;
}

- (int)protocolVersion
{
  return self->_protocolVersion;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_sourceBundleIdentifier hash];
  NSUInteger v4 = v3 ^ (2 * [(NSString *)self->_systemBuildVersion hash]);
  return v4 ^ (4 * [(NSString *)self->_productType hash]) ^ (8 * self->_state) ^ (16 * self->_protocolVersion);
}

- (id)description
{
  NSUInteger v3 = NSString;
  uint64_t v4 = objc_opt_class();
  long long v9 = *(_OWORD *)&self->_sourceBundleIdentifier;
  productType = self->_productType;
  BOOL v6 = [(HKNanoSyncPairedDeviceInfo *)self isRestoreComplete];
  v7 = "NO";
  if (v6) {
    v7 = "YES";
  }
  return (id)[v3 stringWithFormat:@"<%@:%p source=\"%@\" build=\"%@\" product=%@ restored=%s protocol=%d>", v4, self, v9, productType, v7, self->_protocolVersion, 0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKNanoSyncPairedDeviceInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKNanoSyncPairedDeviceInfo;
  v5 = [(HKNanoSyncPairedDeviceInfo *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"source"];
    sourceBundleIdentifier = v5->_sourceBundleIdentifier;
    v5->_sourceBundleIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"build"];
    systemBuildVersion = v5->_systemBuildVersion;
    v5->_systemBuildVersion = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"productType"];
    productType = v5->_productType;
    v5->_productType = (NSString *)v10;

    v5->_state = [v4 decodeIntegerForKey:@"state"];
    v5->_protocolVersion = [v4 decodeIntForKey:@"protocol"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  sourceBundleIdentifier = self->_sourceBundleIdentifier;
  id v5 = a3;
  [v5 encodeObject:sourceBundleIdentifier forKey:@"source"];
  [v5 encodeObject:self->_systemBuildVersion forKey:@"build"];
  [v5 encodeObject:self->_productType forKey:@"productType"];
  [v5 encodeInteger:self->_state forKey:@"state"];
  [v5 encodeInt:self->_protocolVersion forKey:@"protocol"];
}

@end