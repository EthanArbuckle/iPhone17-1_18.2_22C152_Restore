@interface HKCloudSyncAccountInfo
+ (BOOL)supportsSecureCoding;
- (HKCloudSyncAccountInfo)initWithCoder:(id)a3;
- (HKCloudSyncAccountInfo)initWithFullName:(id)a3 emailAddress:(id)a4 accountSettings:(unint64_t)a5;
- (NSPersonNameComponents)fullName;
- (NSString)emailAddress;
- (unint64_t)accountSettings;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKCloudSyncAccountInfo

- (HKCloudSyncAccountInfo)initWithFullName:(id)a3 emailAddress:(id)a4 accountSettings:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HKCloudSyncAccountInfo;
  v10 = [(HKCloudSyncAccountInfo *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    fullName = v10->_fullName;
    v10->_fullName = (NSPersonNameComponents *)v11;

    uint64_t v13 = [v9 copy];
    emailAddress = v10->_emailAddress;
    v10->_emailAddress = (NSString *)v13;

    v10->_accountSettings = a5;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  fullName = self->_fullName;
  id v5 = a3;
  [v5 encodeObject:fullName forKey:@"FullName"];
  [v5 encodeObject:self->_emailAddress forKey:@"EmailAddress"];
  [v5 encodeInteger:self->_accountSettings forKey:@"AccountSettings"];
}

- (HKCloudSyncAccountInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FullName"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"EmailAddress"];
  uint64_t v7 = [v4 decodeIntegerForKey:@"AccountSettings"];

  id v8 = [(HKCloudSyncAccountInfo *)self initWithFullName:v5 emailAddress:v6 accountSettings:v7];
  return v8;
}

- (NSPersonNameComponents)fullName
{
  return self->_fullName;
}

- (NSString)emailAddress
{
  return self->_emailAddress;
}

- (unint64_t)accountSettings
{
  return self->_accountSettings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_emailAddress, 0);

  objc_storeStrong((id *)&self->_fullName, 0);
}

@end