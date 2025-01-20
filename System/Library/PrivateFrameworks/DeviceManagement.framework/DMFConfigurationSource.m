@interface DMFConfigurationSource
+ (BOOL)supportsSecureCoding;
- (DMFConfigurationSource)init;
- (DMFConfigurationSource)initWithCoder:(id)a3;
- (DMFReportingRequirements)reportingRequirements;
- (NSString)displayName;
- (NSString)identifier;
- (NSString)machServiceName;
- (NSString)organizationIdentifier;
- (id)debugDescription;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setMachServiceName:(id)a3;
- (void)setOrganizationIdentifier:(id)a3;
- (void)setReportingRequirements:(id)a3;
@end

@implementation DMFConfigurationSource

- (DMFConfigurationSource)init
{
  v3.receiver = self;
  v3.super_class = (Class)DMFConfigurationSource;
  return [(DMFConfigurationSource *)&v3 init];
}

- (id)description
{
  v6[3] = *MEMORY[0x1E4F143B8];
  v6[0] = @"identifier";
  v6[1] = @"displayName";
  v6[2] = @"machServiceName";
  objc_super v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:3];
  v4 = DMFObjectDescriptionWithProperties(self, v3);

  return v4;
}

- (id)debugDescription
{
  void v6[4] = *MEMORY[0x1E4F143B8];
  v6[0] = @"identifier";
  v6[1] = @"displayName";
  v6[2] = @"machServiceName";
  v6[3] = @"reportingRequirements";
  objc_super v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:4];
  v4 = DMFObjectDescriptionWithProperties(self, v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFConfigurationSource)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)DMFConfigurationSource;
  v5 = [(DMFConfigurationSource *)&v22 init];
  if (v5)
  {
    v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v7 = [v4 decodeObjectOfClasses:v6 forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    v9 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"displayName"];
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v10;

    v12 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"organizationIdentifier"];
    organizationIdentifier = v5->_organizationIdentifier;
    v5->_organizationIdentifier = (NSString *)v13;

    v15 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"machServiceName"];
    machServiceName = v5->_machServiceName;
    v5->_machServiceName = (NSString *)v16;

    v18 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"reportingRequirements"];
    reportingRequirements = v5->_reportingRequirements;
    v5->_reportingRequirements = (DMFReportingRequirements *)v19;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(DMFConfigurationSource *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  v6 = [(DMFConfigurationSource *)self displayName];
  [v4 encodeObject:v6 forKey:@"displayName"];

  uint64_t v7 = [(DMFConfigurationSource *)self organizationIdentifier];
  [v4 encodeObject:v7 forKey:@"organizationIdentifier"];

  v8 = [(DMFConfigurationSource *)self machServiceName];
  [v4 encodeObject:v8 forKey:@"machServiceName"];

  id v9 = [(DMFConfigurationSource *)self reportingRequirements];
  [v4 encodeObject:v9 forKey:@"reportingRequirements"];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)organizationIdentifier
{
  return self->_organizationIdentifier;
}

- (void)setOrganizationIdentifier:(id)a3
{
}

- (NSString)machServiceName
{
  return self->_machServiceName;
}

- (void)setMachServiceName:(id)a3
{
}

- (DMFReportingRequirements)reportingRequirements
{
  return self->_reportingRequirements;
}

- (void)setReportingRequirements:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportingRequirements, 0);
  objc_storeStrong((id *)&self->_machServiceName, 0);
  objc_storeStrong((id *)&self->_organizationIdentifier, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end