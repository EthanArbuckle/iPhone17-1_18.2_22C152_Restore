@interface HKFeatureAttributes
+ (BOOL)supportsSecureCoding;
+ (id)featureAttributesDerivedFromOSBuildAndFeatureVersion:(id)a3;
+ (id)featureAttributesDerivedFromOSBuildAndFeatureVersion:(id)a3 deviceIdentifier:(id)a4;
+ (id)featureAttributesDerivedFromOSBuildAndFeatureVersion:(id)a3 watchDeviceIdentifier:(id)a4 phoneDeviceIdentifier:(id)a5;
- (BOOL)isEqual:(id)a3;
- (HKFeatureAttributes)initWithCoder:(id)a3;
- (HKFeatureAttributes)initWithFeatureVersion:(id)a3 updateVersion:(id)a4 UDIDeviceIdentifier:(id)a5 yearOfRelease:(id)a6;
- (NSString)UDIDeviceIdentifier;
- (NSString)featureVersion;
- (NSString)updateVersion;
- (NSString)yearOfRelease;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKFeatureAttributes

+ (id)featureAttributesDerivedFromOSBuildAndFeatureVersion:(id)a3
{
  id v3 = a3;
  v4 = +[_HKBehavior sharedBehavior];
  v5 = [v4 currentOSBuild];
  v6 = HKFeatureUpdateVersionFromMajorVersionAndBuildVersion((uint64_t)v3, (uint64_t)v5);

  v7 = [[HKFeatureAttributes alloc] initWithFeatureVersion:v3 updateVersion:v6 UDIDeviceIdentifier:0 yearOfRelease:0];

  return v7;
}

+ (id)featureAttributesDerivedFromOSBuildAndFeatureVersion:(id)a3 watchDeviceIdentifier:(id)a4 phoneDeviceIdentifier:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = +[_HKBehavior sharedBehavior];
  if ([v11 isAppleWatch]) {
    v12 = v9;
  }
  else {
    v12 = v8;
  }
  id v13 = v12;

  v14 = [a1 featureAttributesDerivedFromOSBuildAndFeatureVersion:v10 deviceIdentifier:v13];

  return v14;
}

+ (id)featureAttributesDerivedFromOSBuildAndFeatureVersion:(id)a3 deviceIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = +[_HKBehavior sharedBehavior];
  id v8 = [v7 currentOSBuild];
  id v9 = HKFeatureUpdateVersionFromMajorVersionAndBuildVersion((uint64_t)v6, (uint64_t)v8);

  id v10 = HKUDIDeviceIdentifierFromDeviceIdentifierAndBatchNumber(v5, (uint64_t)v9);

  v11 = [[HKFeatureAttributes alloc] initWithFeatureVersion:v6 updateVersion:v9 UDIDeviceIdentifier:v10 yearOfRelease:@"2024"];

  return v11;
}

- (HKFeatureAttributes)initWithFeatureVersion:(id)a3 updateVersion:(id)a4 UDIDeviceIdentifier:(id)a5 yearOfRelease:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)HKFeatureAttributes;
  v14 = [(HKFeatureAttributes *)&v24 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    featureVersion = v14->_featureVersion;
    v14->_featureVersion = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    updateVersion = v14->_updateVersion;
    v14->_updateVersion = (NSString *)v17;

    uint64_t v19 = [v12 copy];
    UDIDeviceIdentifier = v14->_UDIDeviceIdentifier;
    v14->_UDIDeviceIdentifier = (NSString *)v19;

    uint64_t v21 = [v13 copy];
    yearOfRelease = v14->_yearOfRelease;
    v14->_yearOfRelease = (NSString *)v21;
  }
  return v14;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p featureVersion:%@ updateVersion:%@ UDI:%@ year:%@>", objc_opt_class(), self, self->_featureVersion, self->_updateVersion, self->_UDIDeviceIdentifier, self->_yearOfRelease];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HKFeatureAttributes;
  if (![(HKFeatureAttributes *)&v16 isEqual:v4])
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      char v5 = 0;
      goto LABEL_19;
    }
    id v6 = v4;
    featureVersion = self->_featureVersion;
    id v8 = (NSString *)v6[1];
    if (featureVersion != v8 && (!v8 || !-[NSString isEqualToString:](featureVersion, "isEqualToString:"))) {
      goto LABEL_17;
    }
    updateVersion = self->_updateVersion;
    id v10 = (NSString *)v6[2];
    if (updateVersion != v10 && (!v10 || !-[NSString isEqualToString:](updateVersion, "isEqualToString:"))) {
      goto LABEL_17;
    }
    UDIDeviceIdentifier = self->_UDIDeviceIdentifier;
    id v12 = (NSString *)v6[3];
    if (UDIDeviceIdentifier != v12 && (!v12 || !-[NSString isEqualToString:](UDIDeviceIdentifier, "isEqualToString:"))) {
      goto LABEL_17;
    }
    yearOfRelease = self->_yearOfRelease;
    v14 = (NSString *)v6[4];
    if (yearOfRelease == v14)
    {
      char v5 = 1;
      goto LABEL_18;
    }
    if (v14) {
      char v5 = -[NSString isEqualToString:](yearOfRelease, "isEqualToString:");
    }
    else {
LABEL_17:
    }
      char v5 = 0;
LABEL_18:

    goto LABEL_19;
  }
  char v5 = 1;
LABEL_19:

  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_featureVersion hash];
  NSUInteger v4 = [(NSString *)self->_updateVersion hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_UDIDeviceIdentifier hash];
  return v4 ^ v5 ^ [(NSString *)self->_yearOfRelease hash];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKFeatureAttributes)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HKFeatureAttributes;
  NSUInteger v5 = [(HKFeatureAttributes *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"featureVersion"];
    featureVersion = v5->_featureVersion;
    v5->_featureVersion = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"updateVersion"];
    updateVersion = v5->_updateVersion;
    v5->_updateVersion = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UDIDeviceIdentifier"];
    UDIDeviceIdentifier = v5->_UDIDeviceIdentifier;
    v5->_UDIDeviceIdentifier = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"yearOfRelease"];
    yearOfRelease = v5->_yearOfRelease;
    v5->_yearOfRelease = (NSString *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  featureVersion = self->_featureVersion;
  id v5 = a3;
  [v5 encodeObject:featureVersion forKey:@"featureVersion"];
  [v5 encodeObject:self->_updateVersion forKey:@"updateVersion"];
  [v5 encodeObject:self->_UDIDeviceIdentifier forKey:@"UDIDeviceIdentifier"];
  [v5 encodeObject:self->_yearOfRelease forKey:@"yearOfRelease"];
}

- (NSString)featureVersion
{
  return self->_featureVersion;
}

- (NSString)updateVersion
{
  return self->_updateVersion;
}

- (NSString)UDIDeviceIdentifier
{
  return self->_UDIDeviceIdentifier;
}

- (NSString)yearOfRelease
{
  return self->_yearOfRelease;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_yearOfRelease, 0);
  objc_storeStrong((id *)&self->_UDIDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_updateVersion, 0);

  objc_storeStrong((id *)&self->_featureVersion, 0);
}

@end