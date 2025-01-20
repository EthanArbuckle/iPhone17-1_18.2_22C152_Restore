@interface AVTArchiverBasedDomain
+ (BOOL)supportsSecureCoding;
- (AVTArchiverBasedDomain)initWithCoder:(id)a3;
- (AVTArchiverBasedDomain)initWithDomainIdentifier:(id)a3 primaryAvatarIdentifier:(id)a4;
- (NSString)domainIdentifier;
- (NSString)primaryAvatarIdentifier;
- (id)domainBySettingPrimaryAvatarIdentifier:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AVTArchiverBasedDomain

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AVTArchiverBasedDomain)initWithDomainIdentifier:(id)a3 primaryAvatarIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AVTArchiverBasedDomain;
  v8 = [(AVTArchiverBasedDomain *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    domainIdentifier = v8->_domainIdentifier;
    v8->_domainIdentifier = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    primaryAvatarIdentifier = v8->_primaryAvatarIdentifier;
    v8->_primaryAvatarIdentifier = (NSString *)v11;
  }
  return v8;
}

- (id)domainBySettingPrimaryAvatarIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  id v6 = [(AVTArchiverBasedDomain *)self domainIdentifier];
  id v7 = (void *)[v5 initWithDomainIdentifier:v6 primaryAvatarIdentifier:v4];

  return v7;
}

- (AVTArchiverBasedDomain)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"domainIdentifier"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"primaryAvatarIdentifier"];

  id v7 = [(AVTArchiverBasedDomain *)self initWithDomainIdentifier:v5 primaryAvatarIdentifier:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(AVTArchiverBasedDomain *)self domainIdentifier];
  [v4 encodeObject:v5 forKey:@"domainIdentifier"];

  id v6 = [(AVTArchiverBasedDomain *)self primaryAvatarIdentifier];
  [v4 encodeObject:v6 forKey:@"primaryAvatarIdentifier"];
}

- (NSString)domainIdentifier
{
  return self->_domainIdentifier;
}

- (NSString)primaryAvatarIdentifier
{
  return self->_primaryAvatarIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryAvatarIdentifier, 0);

  objc_storeStrong((id *)&self->_domainIdentifier, 0);
}

@end