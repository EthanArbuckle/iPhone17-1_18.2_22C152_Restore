@interface LSSettingsStoreConfiguration
+ (BOOL)supportsSecureCoding;
- (LSSettingsStoreConfiguration)initWithCoder:(id)a3;
- (LSSettingsStoreConfiguration)initWithEndpoint:(id)a3;
- (NSXPCListenerEndpoint)endpoint;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LSSettingsStoreConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (LSSettingsStoreConfiguration)initWithEndpoint:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LSSettingsStoreConfiguration;
  v6 = [(LSSettingsStoreConfiguration *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_endpoint, a3);
  }

  return v7;
}

- (LSSettingsStoreConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LSSettingsStoreConfiguration;
  id v5 = [(LSSettingsStoreConfiguration *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endpoint"];
    endpoint = v5->_endpoint;
    v5->_endpoint = (NSXPCListenerEndpoint *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (NSXPCListenerEndpoint)endpoint
{
  return (NSXPCListenerEndpoint *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end