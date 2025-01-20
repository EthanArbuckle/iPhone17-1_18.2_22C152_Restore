@interface HMDDatabaseZoneManagerConfiguration
- (BOOL)isEqual:(id)a3;
- (BOOL)isZoneOwner;
- (BOOL)shouldCreateZone;
- (HMBCloudZoneConfiguration)cloudZoneConfiguration;
- (HMDDatabaseZoneManagerConfiguration)init;
- (HMDHomeKitVersion)minimumHomeKitVersion;
- (NSSet)externalRecordTypesForSubscriptions;
- (NSSet)requiredSupportedFeatures;
- (id)attributeDescriptions;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setCloudZoneConfiguration:(id)a3;
- (void)setExternalRecordTypesForSubscriptions:(id)a3;
- (void)setMinimumHomeKitVersion:(id)a3;
- (void)setRequiredSupportedFeatures:(id)a3;
- (void)setShouldCreateZone:(BOOL)a3;
- (void)setZoneOwner:(BOOL)a3;
@end

@implementation HMDDatabaseZoneManagerConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudZoneConfiguration, 0);
  objc_storeStrong((id *)&self->_requiredSupportedFeatures, 0);
  objc_storeStrong((id *)&self->_minimumHomeKitVersion, 0);
  objc_storeStrong((id *)&self->_externalRecordTypesForSubscriptions, 0);
}

- (void)setCloudZoneConfiguration:(id)a3
{
}

- (HMBCloudZoneConfiguration)cloudZoneConfiguration
{
  return (HMBCloudZoneConfiguration *)objc_getProperty(self, a2, 40, 1);
}

- (void)setRequiredSupportedFeatures:(id)a3
{
}

- (NSSet)requiredSupportedFeatures
{
  return (NSSet *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMinimumHomeKitVersion:(id)a3
{
}

- (HMDHomeKitVersion)minimumHomeKitVersion
{
  return (HMDHomeKitVersion *)objc_getProperty(self, a2, 24, 1);
}

- (void)setExternalRecordTypesForSubscriptions:(id)a3
{
}

- (NSSet)externalRecordTypesForSubscriptions
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (void)setShouldCreateZone:(BOOL)a3
{
  self->_shouldCreateZone = a3;
}

- (BOOL)shouldCreateZone
{
  return self->_shouldCreateZone;
}

- (void)setZoneOwner:(BOOL)a3
{
  self->_zoneOwner = a3;
}

- (BOOL)isZoneOwner
{
  return self->_zoneOwner;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [(HMDDatabaseZoneManagerConfiguration *)+[HMDMutableDatabaseZoneManagerConfiguration allocWithZone:a3] init];
  [(HMDDatabaseZoneManagerConfiguration *)v4 setZoneOwner:[(HMDDatabaseZoneManagerConfiguration *)self isZoneOwner]];
  [(HMDDatabaseZoneManagerConfiguration *)v4 setShouldCreateZone:[(HMDDatabaseZoneManagerConfiguration *)self shouldCreateZone]];
  v5 = [(HMDDatabaseZoneManagerConfiguration *)self externalRecordTypesForSubscriptions];
  [(HMDDatabaseZoneManagerConfiguration *)v4 setExternalRecordTypesForSubscriptions:v5];

  v6 = [(HMDDatabaseZoneManagerConfiguration *)self minimumHomeKitVersion];
  [(HMDDatabaseZoneManagerConfiguration *)v4 setMinimumHomeKitVersion:v6];

  v7 = [(HMDDatabaseZoneManagerConfiguration *)self requiredSupportedFeatures];
  [(HMDDatabaseZoneManagerConfiguration *)v4 setRequiredSupportedFeatures:v7];

  v8 = [(HMDDatabaseZoneManagerConfiguration *)self cloudZoneConfiguration];
  [(HMDDatabaseZoneManagerConfiguration *)v4 setCloudZoneConfiguration:v8];

  return v4;
}

- (unint64_t)hash
{
  BOOL v3 = [(HMDDatabaseZoneManagerConfiguration *)self isZoneOwner];
  uint64_t v4 = v3 ^ [(HMDDatabaseZoneManagerConfiguration *)self shouldCreateZone];
  v5 = [(HMDDatabaseZoneManagerConfiguration *)self externalRecordTypesForSubscriptions];
  uint64_t v6 = [v5 hash];

  v7 = [(HMDDatabaseZoneManagerConfiguration *)self minimumHomeKitVersion];
  uint64_t v8 = v6 ^ [v7 hash];

  v9 = [(HMDDatabaseZoneManagerConfiguration *)self requiredSupportedFeatures];
  uint64_t v10 = v8 ^ [v9 hash] ^ v4;

  v11 = [(HMDDatabaseZoneManagerConfiguration *)self cloudZoneConfiguration];
  unint64_t v12 = v10 ^ [v11 hash];

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  if (v6
    && (int v7 = [(HMDDatabaseZoneManagerConfiguration *)self isZoneOwner],
        v7 == [v6 isZoneOwner])
    && (int v8 = [(HMDDatabaseZoneManagerConfiguration *)self shouldCreateZone],
        v8 == [v6 shouldCreateZone]))
  {
    v11 = [(HMDDatabaseZoneManagerConfiguration *)self externalRecordTypesForSubscriptions];
    unint64_t v12 = [v6 externalRecordTypesForSubscriptions];
    if ([v11 isEqualToSet:v12])
    {
      v13 = [(HMDDatabaseZoneManagerConfiguration *)self minimumHomeKitVersion];
      v14 = [v6 minimumHomeKitVersion];
      if ([v13 isEqualToVersion:v14])
      {
        v15 = [(HMDDatabaseZoneManagerConfiguration *)self requiredSupportedFeatures];
        v16 = [v6 requiredSupportedFeatures];
        if ([v15 isEqualToSet:v16])
        {
          v18 = [(HMDDatabaseZoneManagerConfiguration *)self cloudZoneConfiguration];
          v17 = [v6 cloudZoneConfiguration];
          char v9 = [v18 isEqual:v17];
        }
        else
        {
          char v9 = 0;
        }
      }
      else
      {
        char v9 = 0;
      }
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)attributeDescriptions
{
  v25[6] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v24 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDDatabaseZoneManagerConfiguration isZoneOwner](self, "isZoneOwner"));
  v23 = (void *)[v3 initWithName:@"Zone Owner" value:v24];
  v25[0] = v23;
  id v4 = objc_alloc(MEMORY[0x1E4F653F8]);
  v22 = objc_msgSend(NSNumber, "numberWithBool:", -[HMDDatabaseZoneManagerConfiguration shouldCreateZone](self, "shouldCreateZone"));
  v21 = (void *)[v4 initWithName:@"Should Create Zone" value:v22];
  v25[1] = v21;
  id v5 = objc_alloc(MEMORY[0x1E4F653F8]);
  v20 = [(HMDDatabaseZoneManagerConfiguration *)self externalRecordTypesForSubscriptions];
  id v6 = (void *)[v5 initWithName:@"External Record Types" value:v20];
  v25[2] = v6;
  id v7 = objc_alloc(MEMORY[0x1E4F653F8]);
  int v8 = [(HMDDatabaseZoneManagerConfiguration *)self minimumHomeKitVersion];
  char v9 = (void *)[v7 initWithName:@"Minumum HomeKit Version" value:v8];
  v25[3] = v9;
  id v10 = objc_alloc(MEMORY[0x1E4F653F8]);
  v11 = [(HMDDatabaseZoneManagerConfiguration *)self requiredSupportedFeatures];
  unint64_t v12 = [v11 allObjects];
  v13 = [v12 componentsJoinedByString:@","];
  v14 = (void *)[v10 initWithName:@"Required Supported Features" value:v13];
  v25[4] = v14;
  id v15 = objc_alloc(MEMORY[0x1E4F653F8]);
  v16 = [(HMDDatabaseZoneManagerConfiguration *)self cloudZoneConfiguration];
  v17 = (void *)[v15 initWithName:@"Cloud Zone Configuration" value:v16];
  v25[5] = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:6];

  return v18;
}

- (HMDDatabaseZoneManagerConfiguration)init
{
  v13.receiver = self;
  v13.super_class = (Class)HMDDatabaseZoneManagerConfiguration;
  v2 = [(HMDDatabaseZoneManagerConfiguration *)&v13 init];
  id v3 = v2;
  if (v2)
  {
    v2->_shouldCreateZone = 1;
    uint64_t v4 = [MEMORY[0x1E4F1CAD0] set];
    externalRecordTypesForSubscriptions = v3->_externalRecordTypesForSubscriptions;
    v3->_externalRecordTypesForSubscriptions = (NSSet *)v4;

    id v6 = [[HMDHomeKitVersion alloc] initWithVersionString:@"6.0"];
    minimumHomeKitVersion = v3->_minimumHomeKitVersion;
    v3->_minimumHomeKitVersion = v6;

    uint64_t v8 = [MEMORY[0x1E4F1CAD0] set];
    requiredSupportedFeatures = v3->_requiredSupportedFeatures;
    v3->_requiredSupportedFeatures = (NSSet *)v8;

    id v10 = (HMBCloudZoneConfiguration *)objc_alloc_init(MEMORY[0x1E4F69E50]);
    cloudZoneConfiguration = v3->_cloudZoneConfiguration;
    v3->_cloudZoneConfiguration = v10;
  }
  return v3;
}

@end