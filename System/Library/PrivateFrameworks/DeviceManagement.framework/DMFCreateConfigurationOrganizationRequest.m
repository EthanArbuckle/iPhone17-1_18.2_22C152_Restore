@interface DMFCreateConfigurationOrganizationRequest
+ (BOOL)isPermittedOnSystemConnection;
+ (BOOL)isPermittedOnUserConnection;
+ (BOOL)supportsSecureCoding;
+ (id)permittedPlatforms;
- (DMFCreateConfigurationOrganizationRequest)initWithCoder:(id)a3;
- (NSString)organizationDisplayName;
- (NSString)organizationIdentifier;
- (NSString)organizationType;
- (void)encodeWithCoder:(id)a3;
- (void)setOrganizationDisplayName:(id)a3;
- (void)setOrganizationIdentifier:(id)a3;
- (void)setOrganizationType:(id)a3;
@end

@implementation DMFCreateConfigurationOrganizationRequest

+ (id)permittedPlatforms
{
  return &unk_1F18AB5E0;
}

+ (BOOL)isPermittedOnSystemConnection
{
  return 1;
}

+ (BOOL)isPermittedOnUserConnection
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFCreateConfigurationOrganizationRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)DMFCreateConfigurationOrganizationRequest;
  v5 = [(CATTaskRequest *)&v16 initWithCoder:v4];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"organizationType"];
    organizationType = v5->_organizationType;
    v5->_organizationType = (NSString *)v7;

    v9 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"organizationIdentifier"];
    organizationIdentifier = v5->_organizationIdentifier;
    v5->_organizationIdentifier = (NSString *)v10;

    v12 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"organizationDisplayName"];
    organizationDisplayName = v5->_organizationDisplayName;
    v5->_organizationDisplayName = (NSString *)v13;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)DMFCreateConfigurationOrganizationRequest;
  id v4 = a3;
  [(CATTaskRequest *)&v8 encodeWithCoder:v4];
  v5 = [(DMFCreateConfigurationOrganizationRequest *)self organizationType];
  [v4 encodeObject:v5 forKey:@"organizationType"];

  v6 = [(DMFCreateConfigurationOrganizationRequest *)self organizationIdentifier];
  [v4 encodeObject:v6 forKey:@"organizationIdentifier"];

  uint64_t v7 = [(DMFCreateConfigurationOrganizationRequest *)self organizationDisplayName];
  [v4 encodeObject:v7 forKey:@"organizationDisplayName"];
}

- (NSString)organizationIdentifier
{
  return self->_organizationIdentifier;
}

- (void)setOrganizationIdentifier:(id)a3
{
}

- (NSString)organizationDisplayName
{
  return self->_organizationDisplayName;
}

- (void)setOrganizationDisplayName:(id)a3
{
}

- (NSString)organizationType
{
  return self->_organizationType;
}

- (void)setOrganizationType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_organizationType, 0);
  objc_storeStrong((id *)&self->_organizationDisplayName, 0);
  objc_storeStrong((id *)&self->_organizationIdentifier, 0);
}

@end