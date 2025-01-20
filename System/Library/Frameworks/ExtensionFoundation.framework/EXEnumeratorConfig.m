@interface EXEnumeratorConfig
- (EXEnumeratorConfig)init;
- (NSDictionary)compatibilityExtensionPointAllowList;
- (NSDictionary)legacyExtensionPointAllowList;
- (NSURL)extensionPointsConfigURL;
- (NSURL)rootURL;
- (NSURL)xpcExtensionPointsCache;
- (NSURL)xpcExtensionsCache;
@end

@implementation EXEnumeratorConfig

- (EXEnumeratorConfig)init
{
  v21.receiver = self;
  v21.super_class = (Class)EXEnumeratorConfig;
  v2 = [(EXEnumeratorConfig *)&v21 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v4 = [v3 URLForResource:@"config" withExtension:@"plist"];
    extensionPointsConfigURL = v2->_extensionPointsConfigURL;
    v2->_extensionPointsConfigURL = (NSURL *)v4;

    v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v2->_extensionPointsConfigURL];
    uint64_t v7 = objc_msgSend(v6, "_EX_dictionaryForKey:", @"LegacyExtensionPointAllowList");
    legacyExtensionPointAllowList = v2->_legacyExtensionPointAllowList;
    v2->_legacyExtensionPointAllowList = (NSDictionary *)v7;

    v9 = (void *)MEMORY[0x1E4F1C9E8];
    v10 = [v3 URLForResource:@"compatibility" withExtension:@"plist"];
    v11 = [v9 dictionaryWithContentsOfURL:v10];

    uint64_t v12 = objc_msgSend(v11, "_EX_dictionaryForKey:", @"LegacyExtensionPointAllowList");
    compatibilityExtensionPointAllowList = v2->_compatibilityExtensionPointAllowList;
    v2->_compatibilityExtensionPointAllowList = (NSDictionary *)v12;

    uint64_t v14 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/" isDirectory:1];
    rootURL = v2->_rootURL;
    v2->_rootURL = (NSURL *)v14;

    uint64_t v16 = [(NSURL *)v2->_rootURL URLByAppendingPathComponent:@"System/Library/xpc/launchd.plist" isDirectory:0];
    xpcExtensionsCache = v2->_xpcExtensionsCache;
    v2->_xpcExtensionsCache = (NSURL *)v16;

    uint64_t v18 = [(NSURL *)v2->_rootURL URLByAppendingPathComponent:@"System/Library/xpc/extensions.plist" isDirectory:0];
    xpcExtensionPointsCache = v2->_xpcExtensionPointsCache;
    v2->_xpcExtensionPointsCache = (NSURL *)v18;
  }
  return v2;
}

- (NSURL)extensionPointsConfigURL
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (NSDictionary)legacyExtensionPointAllowList
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (NSDictionary)compatibilityExtensionPointAllowList
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (NSURL)rootURL
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- (NSURL)xpcExtensionsCache
{
  return (NSURL *)objc_getProperty(self, a2, 40, 1);
}

- (NSURL)xpcExtensionPointsCache
{
  return (NSURL *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcExtensionPointsCache, 0);
  objc_storeStrong((id *)&self->_xpcExtensionsCache, 0);
  objc_storeStrong((id *)&self->_rootURL, 0);
  objc_storeStrong((id *)&self->_compatibilityExtensionPointAllowList, 0);
  objc_storeStrong((id *)&self->_legacyExtensionPointAllowList, 0);

  objc_storeStrong((id *)&self->_extensionPointsConfigURL, 0);
}

@end