@interface HKCloudSyncDatabaseDescription
+ (BOOL)supportsSecureCoding;
- (HKCloudSyncDatabaseDescription)initWithCoder:(id)a3;
- (HKCloudSyncDatabaseDescription)initWithScope:(id)a3 zoneDescriptions:(id)a4;
- (NSArray)zoneDescriptions;
- (NSString)scope;
- (id)debugDescription;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKCloudSyncDatabaseDescription

- (HKCloudSyncDatabaseDescription)initWithScope:(id)a3 zoneDescriptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKCloudSyncDatabaseDescription;
  v8 = [(HKCloudSyncDatabaseDescription *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    scope = v8->_scope;
    v8->_scope = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    zoneDescriptions = v8->_zoneDescriptions;
    v8->_zoneDescriptions = (NSArray *)v11;
  }
  return v8;
}

- (id)debugDescription
{
  return (id)[NSString stringWithFormat:@"Scope: %@ \nZone Descriptions: %@", self->_scope, self->_zoneDescriptions];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  scope = self->_scope;
  id v5 = a3;
  [v5 encodeObject:scope forKey:@"Scope"];
  [v5 encodeObject:self->_zoneDescriptions forKey:@"ZoneDescriptions"];
}

- (HKCloudSyncDatabaseDescription)initWithCoder:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Scope"];
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
  v8 = [v6 setWithArray:v7];
  uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"ZoneDescriptions"];

  v10 = [(HKCloudSyncDatabaseDescription *)self initWithScope:v5 zoneDescriptions:v9];
  return v10;
}

- (NSString)scope
{
  return self->_scope;
}

- (NSArray)zoneDescriptions
{
  return self->_zoneDescriptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneDescriptions, 0);

  objc_storeStrong((id *)&self->_scope, 0);
}

@end