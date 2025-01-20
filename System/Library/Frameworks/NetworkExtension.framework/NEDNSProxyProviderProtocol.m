@interface NEDNSProxyProviderProtocol
+ (BOOL)supportsSecureCoding;
- (BOOL)checkValidityAndCollectErrors:(id)a3;
- (NEDNSProxyProviderProtocol)init;
- (NEDNSProxyProviderProtocol)initWithCoder:(id)a3;
- (NEDNSProxyProviderProtocol)initWithPluginType:(id)a3;
- (NSDictionary)providerConfiguration;
- (NSString)designatedRequirement;
- (NSString)pluginType;
- (NSString)providerBundleIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setDesignatedRequirement:(id)a3;
- (void)setPluginType:(id)a3;
- (void)setProviderBundleIdentifier:(NSString *)providerBundleIdentifier;
- (void)setProviderConfiguration:(NSDictionary *)providerConfiguration;
@end

@implementation NEDNSProxyProviderProtocol

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_designatedRequirement, 0);
  objc_storeStrong((id *)&self->_pluginType, 0);
  objc_storeStrong((id *)&self->_providerBundleIdentifier, 0);

  objc_storeStrong((id *)&self->_providerConfiguration, 0);
}

- (void)setDesignatedRequirement:(id)a3
{
}

- (NSString)designatedRequirement
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (void)setPluginType:(id)a3
{
}

- (NSString)pluginType
{
  return (NSString *)objc_getProperty(self, a2, 192, 1);
}

- (void)setProviderBundleIdentifier:(NSString *)providerBundleIdentifier
{
}

- (NSString)providerBundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 184, 1);
}

- (void)setProviderConfiguration:(NSDictionary *)providerConfiguration
{
}

- (NSDictionary)providerConfiguration
{
  return (NSDictionary *)objc_getProperty(self, a2, 176, 1);
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = objc_alloc(MEMORY[0x1E4F28E78]);
  v15.receiver = self;
  v15.super_class = (Class)NEDNSProxyProviderProtocol;
  v8 = [(NEVPNProtocol *)&v15 descriptionWithIndent:v5 options:a4];
  v9 = (void *)[v7 initWithString:v8];

  v10 = [(NEDNSProxyProviderProtocol *)self pluginType];
  [v9 appendPrettyObject:v10 withName:@"pluginType" andIndent:v5 options:a4 & 0xFFFFFFFFFFFFFFF7];

  v11 = [(NEDNSProxyProviderProtocol *)self providerConfiguration];
  a4 |= 8uLL;
  [v9 appendPrettyObject:v11 withName:@"providerConfiguration" andIndent:v5 options:a4];

  v12 = [(NEDNSProxyProviderProtocol *)self providerBundleIdentifier];
  [v9 appendPrettyObject:v12 withName:@"providerBundleIdentifier" andIndent:v5 options:a4];

  v13 = [(NEDNSProxyProviderProtocol *)self designatedRequirement];
  [v9 appendPrettyObject:v13 withName:@"designatedRequirement" andIndent:v5 options:a4];

  return v9;
}

- (BOOL)checkValidityAndCollectErrors:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NEDNSProxyProviderProtocol *)self pluginType];

  if (!v5) {
    +[NEConfiguration addError:toList:]((uint64_t)NEConfiguration, @"Missing plugin type", v4);
  }

  return v5 != 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v10.receiver = self;
  v10.super_class = (Class)NEDNSProxyProviderProtocol;
  id v4 = [(NEVPNProtocol *)&v10 copyWithZone:a3];
  uint64_t v5 = [(NEDNSProxyProviderProtocol *)self pluginType];
  [v4 setPluginType:v5];

  v6 = [(NEDNSProxyProviderProtocol *)self providerConfiguration];
  [v4 setProviderConfiguration:v6];

  id v7 = [(NEDNSProxyProviderProtocol *)self providerBundleIdentifier];
  [v4 setProviderBundleIdentifier:v7];

  v8 = [(NEDNSProxyProviderProtocol *)self designatedRequirement];
  [v4 setDesignatedRequirement:v8];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NEDNSProxyProviderProtocol;
  id v4 = a3;
  [(NEVPNProtocol *)&v9 encodeWithCoder:v4];
  uint64_t v5 = [(NEDNSProxyProviderProtocol *)self pluginType];
  [v4 encodeObject:v5 forKey:@"PluginType"];

  v6 = [(NEDNSProxyProviderProtocol *)self providerConfiguration];
  [v4 encodeObject:v6 forKey:@"ProviderConfiguration"];

  id v7 = [(NEDNSProxyProviderProtocol *)self providerBundleIdentifier];
  [v4 encodeObject:v7 forKey:@"ProviderBundleIdentifier"];

  v8 = [(NEDNSProxyProviderProtocol *)self designatedRequirement];
  [v4 encodeObject:v8 forKey:@"ProviderDesignatedRequirement"];
}

- (NEDNSProxyProviderProtocol)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)NEDNSProxyProviderProtocol;
  uint64_t v5 = [(NEVPNProtocol *)&v20 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PluginType"];
    [(NEDNSProxyProviderProtocol *)v5 setPluginType:v6];

    id v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"ProviderConfiguration"];
    providerConfiguration = v5->_providerConfiguration;
    v5->_providerConfiguration = (NSDictionary *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ProviderBundleIdentifier"];
    providerBundleIdentifier = v5->_providerBundleIdentifier;
    v5->_providerBundleIdentifier = (NSString *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ProviderDesignatedRequirement"];
    designatedRequirement = v5->_designatedRequirement;
    v5->_designatedRequirement = (NSString *)v17;
  }
  return v5;
}

- (NEDNSProxyProviderProtocol)initWithPluginType:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NEDNSProxyProviderProtocol;
  uint64_t v5 = [(NEVPNProtocol *)&v8 initWithType:6];
  v6 = v5;
  if (v5) {
    [(NEDNSProxyProviderProtocol *)v5 setPluginType:v4];
  }

  return v6;
}

- (NEDNSProxyProviderProtocol)init
{
  v3.receiver = self;
  v3.super_class = (Class)NEDNSProxyProviderProtocol;
  return [(NEVPNProtocol *)&v3 initWithType:6];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end