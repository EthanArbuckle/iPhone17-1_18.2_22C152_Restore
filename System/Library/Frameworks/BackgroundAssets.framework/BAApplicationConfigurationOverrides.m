@interface BAApplicationConfigurationOverrides
+ (BOOL)_saveOverrides:(void *)a3 forAppBundleIdentifier:;
+ (BOOL)clearAllOverrides;
+ (BOOL)clearOverridesForAppBundleIdentifier:(id)a3;
+ (BOOL)setOverrides:(id)a3 forAppBundleIdentifier:(id)a4;
+ (id)_getInternalAppOverridesDict;
+ (id)_getOverridesForAppBundleIdentifier:(uint64_t)a1;
+ (id)overridesForAppBundleIdentifier:(id)a3;
- (NSArray)domainAllowlist;
- (NSNumber)downloadAllowance;
- (NSNumber)essentialDownloadAllowance;
- (NSNumber)essentialMaxInstallSize;
- (NSNumber)maxInstallSize;
- (NSString)manifestURL;
- (void)setDomainAllowlist:(id)a3;
- (void)setDownloadAllowance:(id)a3;
- (void)setEssentialDownloadAllowance:(id)a3;
- (void)setEssentialMaxInstallSize:(id)a3;
- (void)setManifestURL:(id)a3;
- (void)setMaxInstallSize:(id)a3;
@end

@implementation BAApplicationConfigurationOverrides

- (void)setEssentialMaxInstallSize:(id)a3
{
  v4 = (NSNumber *)a3;
  v5 = v4;
  if (v4 && [(NSNumber *)v4 integerValue] < 0)
  {
    BOOL v7 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT);
    if (v7) {
      -[BAApplicationConfigurationOverrides setEssentialMaxInstallSize:](v7, v8, v9, v10, v11, v12, v13, v14);
    }
    qword_26815EF58 = (uint64_t)"BUG IN CLIENT OF BackgroundAssets: Assertion failed: ([essentialMaxInstallSize integerVal"
                               "ue] >= 0), essentialMaxInstallSize must be >= 0.";
    __break(1u);
  }
  else
  {
    essentialMaxInstallSize = self->_essentialMaxInstallSize;
    self->_essentialMaxInstallSize = v5;
  }
}

- (void)setMaxInstallSize:(id)a3
{
  v4 = (NSNumber *)a3;
  v5 = v4;
  if (v4 && [(NSNumber *)v4 integerValue] < 0)
  {
    BOOL v7 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT);
    if (v7) {
      -[BAApplicationConfigurationOverrides setMaxInstallSize:](v7, v8, v9, v10, v11, v12, v13, v14);
    }
    qword_26815EF58 = (uint64_t)"BUG IN CLIENT OF BackgroundAssets: Assertion failed: ([maxInstallSize integerValue] >= 0)"
                               ", maxInstallSize must be >= 0.";
    __break(1u);
  }
  else
  {
    maxInstallSize = self->_maxInstallSize;
    self->_maxInstallSize = v5;
  }
}

- (void)setEssentialDownloadAllowance:(id)a3
{
  v4 = (NSNumber *)a3;
  v5 = v4;
  if (v4 && [(NSNumber *)v4 integerValue] < 0)
  {
    BOOL v7 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT);
    if (v7) {
      -[BAApplicationConfigurationOverrides setEssentialDownloadAllowance:](v7, v8, v9, v10, v11, v12, v13, v14);
    }
    qword_26815EF58 = (uint64_t)"BUG IN CLIENT OF BackgroundAssets: Assertion failed: ([essentialDownloadAllowance integer"
                               "Value] >= 0), essentialDownloadAllowance must be >= 0.";
    __break(1u);
  }
  else
  {
    essentialDownloadAllowance = self->_essentialDownloadAllowance;
    self->_essentialDownloadAllowance = v5;
  }
}

- (void)setDownloadAllowance:(id)a3
{
  v4 = (NSNumber *)a3;
  v5 = v4;
  if (v4 && [(NSNumber *)v4 integerValue] < 0)
  {
    BOOL v7 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT);
    if (v7) {
      -[BAApplicationConfigurationOverrides setDownloadAllowance:](v7, v8, v9, v10, v11, v12, v13, v14);
    }
    qword_26815EF58 = (uint64_t)"BUG IN CLIENT OF BackgroundAssets: Assertion failed: ([downloadAllowance integerValue] >="
                               " 0), downloadAllowance must be >= 0.";
    __break(1u);
  }
  else
  {
    downloadAllowance = self->_downloadAllowance;
    self->_downloadAllowance = v5;
  }
}

- (void)setManifestURL:(id)a3
{
  v4 = (NSString *)a3;
  v5 = v4;
  if (v4 && ![(NSString *)v4 length])
  {
    BOOL v7 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT);
    if (v7) {
      -[BAApplicationConfigurationOverrides setManifestURL:](v7, v8, v9, v10, v11, v12, v13, v14);
    }
    qword_26815EF58 = (uint64_t)"BUG IN CLIENT OF BackgroundAssets: Assertion failed: ([manifestURL length] > 0), manifest"
                               "URL cannot be empty.";
    __break(1u);
  }
  else
  {
    manifestURL = self->_manifestURL;
    self->_manifestURL = v5;
  }
}

- (void)setDomainAllowlist:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  v4 = (NSArray *)a3;
  v5 = v4;
  if (!v4)
  {
LABEL_12:
    domainAllowlist = self->_domainAllowlist;
    self->_domainAllowlist = v5;

    return;
  }
  if ([(NSArray *)v4 count])
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v6 = v5;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v29 != v9) {
            objc_enumerationMutation(v6);
          }
          if (!objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * i), "length", (void)v28))
          {
            BOOL v12 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT);
            if (v12) {
              -[BAApplicationConfigurationOverrides setDomainAllowlist:](v12, v13, v14, v15, v16, v17, v18, v19);
            }
            qword_26815EF58 = (uint64_t)"BUG IN CLIENT OF BackgroundAssets: Assertion failed: ([item length] > 0), domainA"
                                       "llowlist items cannot be empty.";
            __break(1u);
          }
        }
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v8);
    }

    goto LABEL_12;
  }
  BOOL v20 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT);
  if (v20) {
    -[BAApplicationConfigurationOverrides setDomainAllowlist:](v20, v21, v22, v23, v24, v25, v26, v27);
  }
  qword_26815EF58 = (uint64_t)"BUG IN CLIENT OF BackgroundAssets: Assertion failed: ([domainAllowlist count] > 0), domainA"
                             "llowlist cannot be empty.";
  __break(1u);
}

+ (id)overridesForAppBundleIdentifier:(id)a3
{
  return +[BAApplicationConfigurationOverrides _getOverridesForAppBundleIdentifier:]((uint64_t)a1, a3);
}

+ (id)_getOverridesForAppBundleIdentifier:(uint64_t)a1
{
  id v2 = a2;
  self;
  v3 = objc_opt_new();
  v4 = +[BAApplicationConfigurationOverrides _getInternalAppOverridesDict]();
  v5 = [v4 objectForKey:v2];

  if (v5)
  {
    v6 = [v5 objectForKey:@"BAEssentialMaxInstallSize"];
    [v3 setEssentialMaxInstallSize:v6];

    uint64_t v7 = [v5 objectForKey:@"BAMaxInstallSize"];
    [v3 setMaxInstallSize:v7];

    uint64_t v8 = [v5 objectForKey:@"BAEssentialDownloadAllowance"];
    [v3 setEssentialDownloadAllowance:v8];

    uint64_t v9 = [v5 objectForKey:@"BADownloadAllowance"];
    [v3 setDownloadAllowance:v9];

    uint64_t v10 = [v5 objectForKey:@"BAManifestURL"];
    [v3 setManifestURL:v10];

    uint64_t v11 = [v5 objectForKey:@"BADownloadDomainAllowList"];
    [v3 setDomainAllowlist:v11];
  }

  return v3;
}

+ (BOOL)setOverrides:(id)a3 forAppBundleIdentifier:(id)a4
{
  return +[BAApplicationConfigurationOverrides _saveOverrides:forAppBundleIdentifier:]((uint64_t)a1, a3, a4);
}

+ (BOOL)_saveOverrides:(void *)a3 forAppBundleIdentifier:
{
  id v4 = a2;
  id v5 = a3;
  self;
  v6 = +[BAApplicationConfigurationOverrides _getInternalAppOverridesDict]();
  uint64_t v7 = v6;
  if (v4)
  {
    uint64_t v8 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v9 = [v4 manifestURL];

    if (v9)
    {
      uint64_t v10 = [v4 manifestURL];
      [v8 setValue:v10 forKey:@"BAManifestURL"];
    }
    uint64_t v11 = [v4 domainAllowlist];

    if (v11)
    {
      BOOL v12 = [v4 domainAllowlist];
      [v8 setValue:v12 forKey:@"BADownloadDomainAllowList"];
    }
    uint64_t v13 = [v4 essentialMaxInstallSize];

    if (v13)
    {
      uint64_t v14 = [v4 essentialMaxInstallSize];
      [v8 setValue:v14 forKey:@"BAEssentialMaxInstallSize"];
    }
    uint64_t v15 = [v4 maxInstallSize];

    if (v15)
    {
      uint64_t v16 = [v4 maxInstallSize];
      [v8 setValue:v16 forKey:@"BAMaxInstallSize"];
    }
    uint64_t v17 = [v4 essentialDownloadAllowance];

    if (v17)
    {
      uint64_t v18 = [v4 essentialDownloadAllowance];
      [v8 setValue:v18 forKey:@"BAEssentialDownloadAllowance"];
    }
    uint64_t v19 = [v4 downloadAllowance];

    if (v19)
    {
      BOOL v20 = [v4 downloadAllowance];
      [v8 setValue:v20 forKey:@"BADownloadAllowance"];
    }
    [v7 setValue:v8 forKey:v5];
  }
  else
  {
    [v6 removeObjectForKey:v5];
  }
  CFPreferencesSetAppValue(@"InternalAppOverrides", v7, @"com.apple.backgroundassets");
  BOOL v21 = CFPreferencesAppSynchronize(@"com.apple.backgroundassets") != 0;

  return v21;
}

+ (BOOL)clearOverridesForAppBundleIdentifier:(id)a3
{
  return +[BAApplicationConfigurationOverrides _saveOverrides:forAppBundleIdentifier:]((uint64_t)a1, 0, a3);
}

+ (BOOL)clearAllOverrides
{
  id v2 = [NSDictionary dictionary];
  CFPreferencesSetAppValue(@"InternalAppOverrides", v2, @"com.apple.backgroundassets");
  BOOL v3 = CFPreferencesAppSynchronize(@"com.apple.backgroundassets") != 0;

  return v3;
}

+ (id)_getInternalAppOverridesDict
{
  self;
  v0 = (void *)CFPreferencesCopyAppValue(@"InternalAppOverrides", @"com.apple.backgroundassets");
  v1 = v0;
  if (v0)
  {
    uint64_t v2 = [v0 mutableCopy];
  }
  else
  {
    uint64_t v2 = [MEMORY[0x263EFF9A0] dictionary];
  }
  BOOL v3 = (void *)v2;

  return v3;
}

- (NSNumber)essentialMaxInstallSize
{
  return self->_essentialMaxInstallSize;
}

- (NSNumber)maxInstallSize
{
  return self->_maxInstallSize;
}

- (NSString)manifestURL
{
  return self->_manifestURL;
}

- (NSNumber)essentialDownloadAllowance
{
  return self->_essentialDownloadAllowance;
}

- (NSNumber)downloadAllowance
{
  return self->_downloadAllowance;
}

- (NSArray)domainAllowlist
{
  return self->_domainAllowlist;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainAllowlist, 0);
  objc_storeStrong((id *)&self->_downloadAllowance, 0);
  objc_storeStrong((id *)&self->_essentialDownloadAllowance, 0);
  objc_storeStrong((id *)&self->_manifestURL, 0);
  objc_storeStrong((id *)&self->_maxInstallSize, 0);

  objc_storeStrong((id *)&self->_essentialMaxInstallSize, 0);
}

- (void)setEssentialMaxInstallSize:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setMaxInstallSize:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setEssentialDownloadAllowance:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setDownloadAllowance:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setManifestURL:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setDomainAllowlist:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setDomainAllowlist:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end