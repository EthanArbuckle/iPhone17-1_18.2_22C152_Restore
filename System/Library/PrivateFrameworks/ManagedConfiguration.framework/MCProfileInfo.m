@interface MCProfileInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isInstalledByDeclarativeManagement;
- (MCProfileInfo)initWithCoder:(id)a3;
- (MCProfileInfo)initWithProfile:(id)a3;
- (NSDate)expiryDate;
- (NSString)UUID;
- (NSString)friendlyName;
- (NSString)identifier;
- (NSString)organization;
- (NSString)profileDescription;
- (void)encodeWithCoder:(id)a3;
- (void)setExpiryDate:(id)a3;
- (void)setFriendlyName:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsInstalledByDeclarativeManagement:(BOOL)a3;
- (void)setOrganization:(id)a3;
- (void)setProfileDescription:(id)a3;
- (void)setUUID:(id)a3;
@end

@implementation MCProfileInfo

- (MCProfileInfo)initWithProfile:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)MCProfileInfo;
  v5 = [(MCProfileInfo *)&v21 init];
  if (v5)
  {
    uint64_t v6 = [v4 friendlyName];
    friendlyName = v5->_friendlyName;
    v5->_friendlyName = (NSString *)v6;

    uint64_t v8 = [v4 profileDescription];
    profileDescription = v5->_profileDescription;
    v5->_profileDescription = (NSString *)v8;

    uint64_t v10 = [v4 identifier];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v10;

    uint64_t v12 = [v4 UUID];
    UUID = v5->_UUID;
    v5->_UUID = (NSString *)v12;

    uint64_t v14 = [v4 organization];
    organization = v5->_organization;
    v5->_organization = (NSString *)v14;

    uint64_t v16 = [v4 expiryDate];
    expiryDate = v5->_expiryDate;
    v5->_expiryDate = (NSDate *)v16;

    v18 = [v4 installOptions];
    v19 = [v18 objectForKeyedSubscript:@"isInstalledByDeclarativeManagement"];
    v5->_isInstalledByDeclarativeManagement = [v19 BOOLValue];
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  friendlyName = self->_friendlyName;
  id v5 = a3;
  [v5 encodeObject:friendlyName forKey:@"friendlyName"];
  [v5 encodeObject:self->_profileDescription forKey:@"profileDescription"];
  [v5 encodeObject:self->_identifier forKey:@"identifier"];
  [v5 encodeObject:self->_UUID forKey:@"UUID"];
  [v5 encodeObject:self->_organization forKey:@"organization"];
  [v5 encodeObject:self->_expiryDate forKey:@"expiryDate"];
  id v6 = [MEMORY[0x1E4F28ED0] numberWithBool:self->_isInstalledByDeclarativeManagement];
  [v5 encodeObject:v6 forKey:@"isInstalledByDeclarativeManagement"];
}

- (MCProfileInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MCProfileInfo;
  id v5 = [(MCProfileInfo *)&v20 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"friendlyName"];
    friendlyName = v5->_friendlyName;
    v5->_friendlyName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"profileDescription"];
    profileDescription = v5->_profileDescription;
    v5->_profileDescription = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"UUID"];
    UUID = v5->_UUID;
    v5->_UUID = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"organization"];
    organization = v5->_organization;
    v5->_organization = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"expiryDate"];
    expiryDate = v5->_expiryDate;
    v5->_expiryDate = (NSDate *)v16;

    v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"isInstalledByDeclarativeManagement"];
    v5->_isInstalledByDeclarativeManagement = [v18 BOOLValue];
  }
  return v5;
}

- (NSString)friendlyName
{
  return self->_friendlyName;
}

- (void)setFriendlyName:(id)a3
{
}

- (NSString)profileDescription
{
  return self->_profileDescription;
}

- (void)setProfileDescription:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)UUID
{
  return self->_UUID;
}

- (void)setUUID:(id)a3
{
}

- (NSString)organization
{
  return self->_organization;
}

- (void)setOrganization:(id)a3
{
}

- (NSDate)expiryDate
{
  return self->_expiryDate;
}

- (void)setExpiryDate:(id)a3
{
}

- (BOOL)isInstalledByDeclarativeManagement
{
  return self->_isInstalledByDeclarativeManagement;
}

- (void)setIsInstalledByDeclarativeManagement:(BOOL)a3
{
  self->_isInstalledByDeclarativeManagement = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expiryDate, 0);
  objc_storeStrong((id *)&self->_organization, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_profileDescription, 0);
  objc_storeStrong((id *)&self->_friendlyName, 0);
}

@end