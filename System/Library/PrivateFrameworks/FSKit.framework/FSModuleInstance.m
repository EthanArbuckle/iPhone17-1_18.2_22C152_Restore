@interface FSModuleInstance
+ (id)instanceWithExtensionIdentity:(id)a3;
- (BOOL)isEqual:(id)a3;
- (FSModuleIdentity)identity;
- (FSModuleInstance)initWithExtensionIdentity:(id)a3;
- (FSModuleInstance)initWithExtensionRecord:(id)a3 enabled:(BOOL)a4;
- (LSApplicationExtensionRecord)record;
- (NSDictionary)attributes;
- (NSDictionary)entitlements;
- (NSDictionary)extensionDictionary;
- (NSDictionary)sdkDictionary;
- (NSString)bundleIdentifier;
- (NSString)bundleVersion;
- (NSString)extensionPointIdentifier;
- (NSString)localizedName;
- (NSURL)containingURL;
- (NSURL)executableURL;
- (NSURL)url;
- (NSUUID)UUID;
- (id)entitlementNamed:(id)a3 ofClass:(Class)a4;
- (unsigned)platform;
@end

@implementation FSModuleInstance

- (FSModuleInstance)initWithExtensionRecord:(id)a3 enabled:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)FSModuleInstance;
  v8 = [(FSModuleInstance *)&v15 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_record, a3);
    v10 = [FSModuleIdentity alloc];
    identity = v9->_identity;
    v9->_identity = v10;

    uint64_t v12 = [(FSModuleIdentity *)v9->_identity initWithApplicationExtensionRecord:v7 isEnabled:v4];
    v13 = v9->_identity;
    v9->_identity = (FSModuleIdentity *)v12;
  }
  return v9;
}

- (FSModuleInstance)initWithExtensionIdentity:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FSModuleInstance;
  v5 = [(FSModuleInstance *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 applicationExtensionRecord];
    record = v5->_record;
    v5->_record = (LSApplicationExtensionRecord *)v6;

    v8 = [FSModuleIdentity alloc];
    identity = v5->_identity;
    v5->_identity = v8;

    uint64_t v10 = [(FSModuleIdentity *)v5->_identity initWithApplicationExtensionRecord:v5->_record isEnabled:1];
    v11 = v5->_identity;
    v5->_identity = (FSModuleIdentity *)v10;
  }
  return v5;
}

+ (id)instanceWithExtensionIdentity:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithExtensionIdentity:v4];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (FSModuleInstance *)a3;
  if (self == v4)
  {
    char v6 = 1;
  }
  else
  {
    uint64_t v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      id v7 = [(FSModuleInstance *)self identity];
      v8 = [v7 attributes];
      v9 = [(FSModuleInstance *)v4 identity];
      uint64_t v10 = [v9 attributes];
      char v6 = [v8 isEqual:v10];
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (NSString)extensionPointIdentifier
{
  v2 = [(LSApplicationExtensionRecord *)self->_record extensionPointRecord];
  v3 = [v2 identifier];

  return (NSString *)v3;
}

- (NSString)bundleIdentifier
{
  return (NSString *)[(LSApplicationExtensionRecord *)self->_record bundleIdentifier];
}

- (NSString)bundleVersion
{
  return (NSString *)[(LSApplicationExtensionRecord *)self->_record bundleVersion];
}

- (unsigned)platform
{
  return [(LSApplicationExtensionRecord *)self->_record platform];
}

- (NSUUID)UUID
{
  return (NSUUID *)[(LSApplicationExtensionRecord *)self->_record uniqueIdentifier];
}

- (NSString)localizedName
{
  return (NSString *)[(LSApplicationExtensionRecord *)self->_record localizedName];
}

- (NSURL)url
{
  return (NSURL *)[(LSApplicationExtensionRecord *)self->_record URL];
}

- (NSURL)containingURL
{
  v2 = [(LSApplicationExtensionRecord *)self->_record containingBundleRecord];
  v3 = [v2 URL];

  return (NSURL *)v3;
}

- (NSDictionary)sdkDictionary
{
  v2 = [(LSApplicationExtensionRecord *)self->_record extensionPointRecord];
  v3 = [v2 SDKDictionary];

  if (objc_opt_respondsToSelector())
  {
    id v4 = [v3 _expensiveDictionaryRepresentation];
  }
  else
  {
    id v4 = (void *)MEMORY[0x263EFFA78];
  }

  return (NSDictionary *)v4;
}

- (NSDictionary)extensionDictionary
{
  v2 = [(LSApplicationExtensionRecord *)self->_record infoDictionary];
  v3 = [v2 objectForKey:@"NSExtension" ofClass:objc_opt_class()];

  return (NSDictionary *)v3;
}

- (NSDictionary)attributes
{
  return [(FSModuleIdentity *)self->_identity attributes];
}

- (NSDictionary)entitlements
{
  v2 = [(LSApplicationExtensionRecord *)self->_record entitlements];
  if (objc_opt_respondsToSelector())
  {
    v3 = [v2 _expensiveDictionaryRepresentation];
  }
  else
  {
    v3 = (void *)MEMORY[0x263EFFA78];
  }

  return (NSDictionary *)v3;
}

- (id)entitlementNamed:(id)a3 ofClass:(Class)a4
{
  id v6 = a3;
  id v7 = [(FSModuleInstance *)self record];
  v8 = [v7 entitlements];
  v9 = [v8 objectForKey:v6 ofClass:a4];

  return v9;
}

- (FSModuleIdentity)identity
{
  return self->_identity;
}

- (LSApplicationExtensionRecord)record
{
  return self->_record;
}

- (NSURL)executableURL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executableURL, 0);
  objc_storeStrong((id *)&self->_record, 0);
  objc_storeStrong((id *)&self->_identity, 0);
}

@end