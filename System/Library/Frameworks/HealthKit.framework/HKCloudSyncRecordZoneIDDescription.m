@interface HKCloudSyncRecordZoneIDDescription
+ (BOOL)supportsSecureCoding;
- (HKCloudSyncRecordZoneIDDescription)initWithCoder:(id)a3;
- (HKCloudSyncRecordZoneIDDescription)initWithZoneName:(id)a3 ownerName:(id)a4;
- (NSString)ownerName;
- (NSString)zoneName;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKCloudSyncRecordZoneIDDescription

- (HKCloudSyncRecordZoneIDDescription)initWithZoneName:(id)a3 ownerName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKCloudSyncRecordZoneIDDescription;
  v8 = [(HKCloudSyncRecordZoneIDDescription *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    zoneName = v8->_zoneName;
    v8->_zoneName = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    ownerName = v8->_ownerName;
    v8->_ownerName = (NSString *)v11;
  }
  return v8;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"Zone name: %@, Owner Name: %@", self->_zoneName, self->_ownerName];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  zoneName = self->_zoneName;
  id v5 = a3;
  [v5 encodeObject:zoneName forKey:@"ZoneName"];
  [v5 encodeObject:self->_ownerName forKey:@"OwnerName"];
}

- (HKCloudSyncRecordZoneIDDescription)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ZoneName"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"OwnerName"];

  id v7 = [(HKCloudSyncRecordZoneIDDescription *)self initWithZoneName:v5 ownerName:v6];
  return v7;
}

- (NSString)zoneName
{
  return self->_zoneName;
}

- (NSString)ownerName
{
  return self->_ownerName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ownerName, 0);

  objc_storeStrong((id *)&self->_zoneName, 0);
}

@end