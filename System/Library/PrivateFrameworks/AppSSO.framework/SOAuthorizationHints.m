@interface SOAuthorizationHints
- (NSString)localizedExtensionBundleDisplayName;
- (SOAuthorizationHints)initWithAuthorizationHintsCore:(id)a3;
- (id)description;
@end

@implementation SOAuthorizationHints

- (SOAuthorizationHints)initWithAuthorizationHintsCore:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SOAuthorizationHints;
  v5 = [(SOAuthorizationHints *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 localizedExtensionBundleDisplayName];
    localizedExtensionBundleDisplayName = v5->_localizedExtensionBundleDisplayName;
    v5->_localizedExtensionBundleDisplayName = (NSString *)v6;
  }
  return v5;
}

- (id)description
{
  v7[1] = *MEMORY[0x263EF8340];
  localizedExtensionBundleDisplayName = @"(null)";
  if (self->_localizedExtensionBundleDisplayName) {
    localizedExtensionBundleDisplayName = (__CFString *)self->_localizedExtensionBundleDisplayName;
  }
  uint64_t v6 = @"localizedExtensionBundleDisplayName";
  v7[0] = localizedExtensionBundleDisplayName;
  v3 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
  id v4 = [v3 description];

  return v4;
}

- (NSString)localizedExtensionBundleDisplayName
{
  return self->_localizedExtensionBundleDisplayName;
}

- (void).cxx_destruct
{
}

@end