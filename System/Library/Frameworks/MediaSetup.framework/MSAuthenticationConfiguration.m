@interface MSAuthenticationConfiguration
+ (BOOL)supportsSecureCoding;
- (CMSAuthenticationConfiguration)configuration;
- (MSAuthenticationConfiguration)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MSAuthenticationConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MSAuthenticationConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MSAuthenticationConfiguration;
  v5 = [(MSAuthenticationConfiguration *)&v13 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MSAuthenticationConfigurationClientID"];
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MSAuthenticationConfigurationClientSecret"];
    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MSAuthenticationConfigurationAuthorizationURL"];
    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MSAuthenticationConfigurationScope"];
    if (v6 && v7 && v8)
    {
      uint64_t v10 = +[CMSAuthenticationConfiguration authConfigurationWithClientID:v6 clientSecret:v7 authorizationURL:v8 scope:v9];
      configuration = v5->_configuration;
      v5->_configuration = (CMSAuthenticationConfiguration *)v10;
    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  configuration = self->_configuration;
  id v5 = a3;
  v6 = [(CMSAuthenticationConfiguration *)configuration clientID];
  [v5 encodeObject:v6 forKey:@"CMSAuthenticationConfigurationClientID"];

  v7 = [(CMSAuthenticationConfiguration *)self->_configuration clientSecret];
  [v5 encodeObject:v7 forKey:@"CMSAuthenticationConfigurationClientSecret"];

  v8 = [(CMSAuthenticationConfiguration *)self->_configuration authorizationURL];
  [v5 encodeObject:v8 forKey:@"CMSAuthenticationConfigurationAuthorizationURL"];

  id v9 = [(CMSAuthenticationConfiguration *)self->_configuration scope];
  [v5 encodeObject:v9 forKey:@"CMSAuthenticationConfigurationScope"];
}

- (CMSAuthenticationConfiguration)configuration
{
  return (CMSAuthenticationConfiguration *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end