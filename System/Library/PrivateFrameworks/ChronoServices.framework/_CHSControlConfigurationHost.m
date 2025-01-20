@interface _CHSControlConfigurationHost
- (NSArray)controlConfigurations;
- (NSString)identifier;
- (_CHSControlConfigurationHost)initWithIdentifier:(id)a3 configurations:(id)a4;
- (id)controlConfigurationsForApplicationContainerBundleIdentifier:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
@end

@implementation _CHSControlConfigurationHost

- (_CHSControlConfigurationHost)initWithIdentifier:(id)a3 configurations:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_CHSControlConfigurationHost;
  v8 = [(_CHSControlConfigurationHost *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    configurations = v8->_configurations;
    v8->_configurations = (NSArray *)v11;
  }
  return v8;
}

- (NSString)identifier
{
  v2 = (void *)[(NSString *)self->_identifier copy];
  return (NSString *)v2;
}

- (NSArray)controlConfigurations
{
  v2 = (void *)[(NSArray *)self->_configurations copy];
  return (NSArray *)v2;
}

- (id)controlConfigurationsForApplicationContainerBundleIdentifier:(id)a3
{
  id v4 = a3;
  configurations = self->_configurations;
  id v6 = (void *)MEMORY[0x1E4F28F60];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __93___CHSControlConfigurationHost_controlConfigurationsForApplicationContainerBundleIdentifier___block_invoke;
  v11[3] = &unk_1E56C8EC8;
  id v7 = v4;
  id v12 = v7;
  v8 = [v6 predicateWithBlock:v11];
  uint64_t v9 = [(NSArray *)configurations filteredArrayUsingPredicate:v8];

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [_CHSControlConfigurationHost alloc];
  identifier = self->_identifier;
  configurations = self->_configurations;
  return [(_CHSControlConfigurationHost *)v4 initWithIdentifier:identifier configurations:configurations];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurations, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end