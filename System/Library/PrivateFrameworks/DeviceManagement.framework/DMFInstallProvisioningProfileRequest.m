@interface DMFInstallProvisioningProfileRequest
+ (BOOL)isPermittedOnSystemConnection;
+ (BOOL)isPermittedOnUserConnection;
+ (BOOL)supportsSecureCoding;
+ (id)permittedPlatforms;
- (DMFInstallProvisioningProfileRequest)initWithCoder:(id)a3;
- (NSData)profileData;
- (NSString)managingProfileIdentifier;
- (void)encodeWithCoder:(id)a3;
- (void)setManagingProfileIdentifier:(id)a3;
- (void)setProfileData:(id)a3;
@end

@implementation DMFInstallProvisioningProfileRequest

+ (id)permittedPlatforms
{
  return &unk_1F18AB928;
}

+ (BOOL)isPermittedOnSystemConnection
{
  return 1;
}

+ (BOOL)isPermittedOnUserConnection
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFInstallProvisioningProfileRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DMFInstallProvisioningProfileRequest;
  v5 = [(CATTaskRequest *)&v13 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"managingProfileIdentifier"];
    managingProfileIdentifier = v5->_managingProfileIdentifier;
    v5->_managingProfileIdentifier = (NSString *)v7;

    v9 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"profileData"];
    profileData = v5->_profileData;
    v5->_profileData = (NSData *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)DMFInstallProvisioningProfileRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v7 encodeWithCoder:v4];
  v5 = [(DMFInstallProvisioningProfileRequest *)self managingProfileIdentifier];
  [v4 encodeObject:v5 forKey:@"managingProfileIdentifier"];

  v6 = [(DMFInstallProvisioningProfileRequest *)self profileData];
  [v4 encodeObject:v6 forKey:@"profileData"];
}

- (NSString)managingProfileIdentifier
{
  return self->_managingProfileIdentifier;
}

- (void)setManagingProfileIdentifier:(id)a3
{
}

- (NSData)profileData
{
  return self->_profileData;
}

- (void)setProfileData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileData, 0);
  objc_storeStrong((id *)&self->_managingProfileIdentifier, 0);
}

@end