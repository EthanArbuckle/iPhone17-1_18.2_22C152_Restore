@interface HKCloudSyncRecordIDDescription
+ (BOOL)supportsSecureCoding;
- (HKCloudSyncRecordIDDescription)initWithCoder:(id)a3;
- (HKCloudSyncRecordIDDescription)initWithRecordName:(id)a3;
- (NSString)recordName;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKCloudSyncRecordIDDescription

- (HKCloudSyncRecordIDDescription)initWithRecordName:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKCloudSyncRecordIDDescription;
  v5 = [(HKCloudSyncRecordIDDescription *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    recordName = v5->_recordName;
    v5->_recordName = (NSString *)v6;
  }
  return v5;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"Record: %@", self->_recordName];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (HKCloudSyncRecordIDDescription)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RecordName"];

  uint64_t v6 = [(HKCloudSyncRecordIDDescription *)self initWithRecordName:v5];
  return v6;
}

- (NSString)recordName
{
  return self->_recordName;
}

- (void).cxx_destruct
{
}

@end