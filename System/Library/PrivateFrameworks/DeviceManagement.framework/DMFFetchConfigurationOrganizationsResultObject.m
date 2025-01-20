@interface DMFFetchConfigurationOrganizationsResultObject
+ (BOOL)supportsSecureCoding;
- (DMFFetchConfigurationOrganizationsResultObject)initWithCoder:(id)a3;
- (NSDictionary)organizationsByIdentifier;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setOrganizationsByIdentifier:(id)a3;
@end

@implementation DMFFetchConfigurationOrganizationsResultObject

- (id)description
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v6[0] = @"organizationsByIdentifier";
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  v4 = DMFObjectDescriptionWithProperties(self, v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFFetchConfigurationOrganizationsResultObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DMFFetchConfigurationOrganizationsResultObject;
  v5 = [(CATTaskResultObject *)&v13 initWithCoder:v4];
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"organizationsByIdentifier"];
    organizationsByIdentifier = v5->_organizationsByIdentifier;
    v5->_organizationsByIdentifier = (NSDictionary *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DMFFetchConfigurationOrganizationsResultObject;
  id v4 = a3;
  [(CATTaskResultObject *)&v6 encodeWithCoder:v4];
  v5 = [(DMFFetchConfigurationOrganizationsResultObject *)self organizationsByIdentifier];
  [v4 encodeObject:v5 forKey:@"organizationsByIdentifier"];
}

- (NSDictionary)organizationsByIdentifier
{
  return self->_organizationsByIdentifier;
}

- (void)setOrganizationsByIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end