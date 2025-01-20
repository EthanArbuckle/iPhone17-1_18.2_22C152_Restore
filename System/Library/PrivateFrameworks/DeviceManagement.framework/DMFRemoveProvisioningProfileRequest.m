@interface DMFRemoveProvisioningProfileRequest
+ (BOOL)isPermittedOnSystemConnection;
+ (BOOL)isPermittedOnUserConnection;
+ (BOOL)supportsSecureCoding;
+ (id)permittedPlatforms;
- (DMFRemoveProvisioningProfileRequest)initWithCoder:(id)a3;
- (NSString)managingProfileIdentifier;
- (NSString)profileIdentifier;
- (void)encodeWithCoder:(id)a3;
- (void)setManagingProfileIdentifier:(id)a3;
- (void)setProfileIdentifier:(id)a3;
@end

@implementation DMFRemoveProvisioningProfileRequest

+ (id)permittedPlatforms
{
  return &unk_1F18ABB20;
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

- (DMFRemoveProvisioningProfileRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DMFRemoveProvisioningProfileRequest;
  v5 = [(CATTaskRequest *)&v13 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"profileIdentifier"];
    profileIdentifier = v5->_profileIdentifier;
    v5->_profileIdentifier = (NSString *)v7;

    v9 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"managingProfileIdentifier"];
    managingProfileIdentifier = v5->_managingProfileIdentifier;
    v5->_managingProfileIdentifier = (NSString *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)DMFRemoveProvisioningProfileRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v7 encodeWithCoder:v4];
  v5 = [(DMFRemoveProvisioningProfileRequest *)self profileIdentifier];
  [v4 encodeObject:v5 forKey:@"profileIdentifier"];

  v6 = [(DMFRemoveProvisioningProfileRequest *)self managingProfileIdentifier];
  [v4 encodeObject:v6 forKey:@"managingProfileIdentifier"];
}

- (NSString)profileIdentifier
{
  return self->_profileIdentifier;
}

- (void)setProfileIdentifier:(id)a3
{
}

- (NSString)managingProfileIdentifier
{
  return self->_managingProfileIdentifier;
}

- (void)setManagingProfileIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managingProfileIdentifier, 0);
  objc_storeStrong((id *)&self->_profileIdentifier, 0);
}

@end