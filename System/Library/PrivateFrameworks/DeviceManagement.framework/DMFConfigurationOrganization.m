@interface DMFConfigurationOrganization
+ (BOOL)supportsSecureCoding;
- (BOOL)active;
- (DMFConfigurationOrganization)init;
- (DMFConfigurationOrganization)initWithCoder:(id)a3;
- (NSArray)registeredConfigurationSources;
- (NSString)displayName;
- (NSString)identifier;
- (NSString)type;
- (id)debugDescription;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setActive:(BOOL)a3;
- (void)setDisplayName:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setRegisteredConfigurationSources:(id)a3;
- (void)setType:(id)a3;
@end

@implementation DMFConfigurationOrganization

- (DMFConfigurationOrganization)init
{
  v3.receiver = self;
  v3.super_class = (Class)DMFConfigurationOrganization;
  return [(DMFConfigurationOrganization *)&v3 init];
}

- (id)description
{
  v6[4] = *MEMORY[0x1E4F143B8];
  v6[0] = @"identifier";
  v6[1] = @"displayName";
  v6[2] = @"type";
  v6[3] = @"active";
  objc_super v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:4];
  v4 = DMFObjectDescriptionWithProperties(self, v3);

  return v4;
}

- (id)debugDescription
{
  void v6[5] = *MEMORY[0x1E4F143B8];
  v6[0] = @"identifier";
  v6[1] = @"displayName";
  v6[2] = @"type";
  v6[3] = @"active";
  v6[4] = @"registeredConfigurationSources";
  objc_super v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:5];
  v4 = DMFObjectDescriptionWithProperties(self, v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFConfigurationOrganization)initWithCoder:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)DMFConfigurationOrganization;
  v5 = [(DMFConfigurationOrganization *)&v22 init];
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
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"type"];
    type = v5->_type;
    v5->_type = (NSString *)v13;

    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"active"];
    v5->_active = [v15 BOOLValue];

    v16 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v17 = objc_opt_class();
    v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"registeredConfigurationSources"];
    registeredConfigurationSources = v5->_registeredConfigurationSources;
    v5->_registeredConfigurationSources = (NSArray *)v19;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(DMFConfigurationOrganization *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];

  v6 = [(DMFConfigurationOrganization *)self displayName];
  [v4 encodeObject:v6 forKey:@"displayName"];

  uint64_t v7 = [(DMFConfigurationOrganization *)self type];
  [v4 encodeObject:v7 forKey:@"type"];

  v8 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[DMFConfigurationOrganization active](self, "active"));
  [v4 encodeObject:v8 forKey:@"active"];

  id v9 = [(DMFConfigurationOrganization *)self registeredConfigurationSources];
  [v4 encodeObject:v9 forKey:@"registeredConfigurationSources"];
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

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (BOOL)active
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (NSArray)registeredConfigurationSources
{
  return self->_registeredConfigurationSources;
}

- (void)setRegisteredConfigurationSources:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredConfigurationSources, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end