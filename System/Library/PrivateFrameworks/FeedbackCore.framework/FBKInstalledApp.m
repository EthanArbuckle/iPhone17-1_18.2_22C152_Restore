@interface FBKInstalledApp
+ (id)_searchIdentifierInAppURL:(id)a3;
+ (id)_searchVersionInAppURL:(id)a3 identifier:(id)a4;
+ (id)appWithAppProxy:(id)a3;
- (BOOL)isAppleApp;
- (BOOL)isEqualTo:(id)a3;
- (BOOL)isIWorkApp;
- (LSApplicationProxy)applicationProxy;
- (NSNumber)adamID;
- (NSString)identifier;
- (NSString)name;
- (NSString)version;
- (id)description;
- (void)setApplicationProxy:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setName:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation FBKInstalledApp

+ (id)appWithAppProxy:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(FBKInstalledApp);
  [(FBKInstalledApp *)v4 setApplicationProxy:v3];
  v5 = [v3 applicationIdentifier];
  [(FBKInstalledApp *)v4 setIdentifier:v5];

  v6 = [v3 localizedNameForContext:0];
  [(FBKInstalledApp *)v4 setName:v6];

  v7 = [v3 shortVersionString];

  [(FBKInstalledApp *)v4 setVersion:v7];
  v8 = Log_0();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    +[FBKInstalledApp appWithAppProxy:](v4, v8);
  }

  return v4;
}

- (NSNumber)adamID
{
  v2 = [(FBKInstalledApp *)self applicationProxy];
  id v3 = [v2 itemID];

  return (NSNumber *)v3;
}

- (BOOL)isAppleApp
{
  id v3 = [(FBKInstalledApp *)self identifier];
  if (v3)
  {
    v4 = [(FBKInstalledApp *)self identifier];
    char v5 = [v4 hasPrefix:@"com.apple."];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)isIWorkApp
{
  id v3 = [(FBKInstalledApp *)self identifier];
  if (v3)
  {
    v4 = [(FBKInstalledApp *)self identifier];
    char v5 = [v4 hasPrefix:@"com.apple.iWork"];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)isEqualTo:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [v5 identifier];
    v7 = [(FBKInstalledApp *)self identifier];
    if ([v6 isEqualToString:v7])
    {
      v8 = [v5 version];
      v9 = [(FBKInstalledApp *)self version];
      if ([v8 isEqualToString:v9])
      {
        v10 = [v5 name];
        v11 = [(FBKInstalledApp *)self name];
        char v12 = [v10 isEqualToString:v11];
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

+ (id)_searchVersionInAppURL:(id)a3 identifier:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x263F086E0] bundleWithURL:v5];
  v8 = v7;
  if (v7)
  {
    v9 = [v7 objectForInfoDictionaryKey:*MEMORY[0x263EFFAA0]];
    v10 = Log_0();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
    if (v9)
    {
      if (v11) {
        +[FBKInstalledApp _searchVersionInAppURL:identifier:].cold.6();
      }
LABEL_34:

      goto LABEL_35;
    }
    if (v11) {
      +[FBKInstalledApp _searchVersionInAppURL:identifier:].cold.5();
    }
  }
  else
  {
    v10 = Log_0();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      +[FBKInstalledApp _searchVersionInAppURL:identifier:].cold.4();
    }
  }

  v10 = [MEMORY[0x263F01868] applicationProxyForIdentifier:v6];
  uint64_t v12 = [v10 shortVersionString];
  v9 = (__CFString *)v12;
  if (v10 && v12)
  {
    v13 = Log_0();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v5;
      _os_log_impl(&dword_22A36D000, v13, OS_LOG_TYPE_INFO, "found version using app proxy for URL [%@]", buf, 0xCu);
    }

    goto LABEL_34;
  }

  if (v9) {
    goto LABEL_35;
  }
  v14 = [v5 URLByAppendingPathComponent:@"Contents"];
  v15 = [v14 URLByAppendingPathComponent:@"version.plist"];
  v16 = [v15 path];

  v17 = [MEMORY[0x263F08850] defaultManager];
  LODWORD(v15) = [v17 fileExistsAtPath:v16];

  if (!v15)
  {
    v24 = Log_0();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      +[FBKInstalledApp _searchVersionInAppURL:identifier:]();
    }

    goto LABEL_31;
  }
  v18 = [MEMORY[0x263F08850] defaultManager];
  v19 = [v18 contentsAtPath:v16];

  if (v19)
  {
    id v26 = 0;
    v20 = [MEMORY[0x263F08AC0] propertyListWithData:v19 options:0 format:0 error:&v26];
    v21 = v26;
    v9 = [v20 objectForKeyedSubscript:*MEMORY[0x263EFFAA0]];
    if (!v9)
    {
      v9 = [v20 objectForKeyedSubscript:*MEMORY[0x263EFFB70]];
    }
    v22 = Log_0();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      id v28 = v20;
      __int16 v29 = 2112;
      v30 = v21;
      __int16 v31 = 2112;
      v32 = v9;
      _os_log_debug_impl(&dword_22A36D000, v22, OS_LOG_TYPE_DEBUG, "plist %@ error %@ version %@", buf, 0x20u);
    }

    v23 = Log_0();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      +[FBKInstalledApp _searchVersionInAppURL:identifier:]();
    }
  }
  else
  {
    v21 = Log_0();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      +[FBKInstalledApp _searchVersionInAppURL:identifier:]((uint64_t)v5, v21);
    }
    v9 = 0;
  }

  if (!v9)
  {
LABEL_31:
    v10 = Log_0();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v5;
      _os_log_impl(&dword_22A36D000, v10, OS_LOG_TYPE_INFO, "Could not find version for app URL %@", buf, 0xCu);
    }
    v9 = @"0";
    goto LABEL_34;
  }
LABEL_35:

  return v9;
}

+ (id)_searchIdentifierInAppURL:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263F01868] applicationProxyForIdentifier:0];
  uint64_t v5 = [v4 bundleIdentifier];
  id v6 = (void *)v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    v8 = Log_0();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      +[FBKInstalledApp _searchIdentifierInAppURL:].cold.4();
    }
  }
  v9 = [MEMORY[0x263F086E0] bundleWithURL:v3];
  v10 = v9;
  if (v9)
  {
    BOOL v11 = [v9 objectForInfoDictionaryKey:*MEMORY[0x263EFFB58]];

    uint64_t v12 = Log_0();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
    if (v11)
    {
      if (v13) {
        +[FBKInstalledApp _searchIdentifierInAppURL:]();
      }
LABEL_22:

      id v6 = v11;
      goto LABEL_23;
    }
    if (v13) {
      +[FBKInstalledApp _searchIdentifierInAppURL:]();
    }

LABEL_19:
    uint64_t v12 = Log_0();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412290;
      id v17 = v3;
      _os_log_impl(&dword_22A36D000, v12, OS_LOG_TYPE_INFO, "could not find identifier for app URL %@", (uint8_t *)&v16, 0xCu);
    }
    BOOL v11 = &stru_26DDF6A30;
    goto LABEL_22;
  }
  v14 = Log_0();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    +[FBKInstalledApp _searchVersionInAppURL:identifier:].cold.4();
  }

  if (!v6) {
    goto LABEL_19;
  }
LABEL_23:

  return v6;
}

- (id)description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  id v6 = [(FBKInstalledApp *)self identifier];
  BOOL v7 = [(FBKInstalledApp *)self version];
  v8 = [(FBKInstalledApp *)self name];
  v9 = [v3 stringWithFormat:@"%@: identifier [%@], version [%@], name [%@]", v5, v6, v7, v8];

  return v9;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

- (LSApplicationProxy)applicationProxy
{
  return self->_applicationProxy;
}

- (void)setApplicationProxy:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationProxy, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

+ (void)appWithAppProxy:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  id v3 = [a1 description];
  OUTLINED_FUNCTION_1_1();
  _os_log_debug_impl(&dword_22A36D000, a2, OS_LOG_TYPE_DEBUG, "created: %@", v4, 0xCu);
}

+ (void)_searchVersionInAppURL:(uint64_t)a1 identifier:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 138412546;
  uint64_t v3 = a1;
  __int16 v4 = 2112;
  uint64_t v5 = 0;
  _os_log_debug_impl(&dword_22A36D000, a2, OS_LOG_TYPE_DEBUG, "no version file for App URL %@ error: %@", (uint8_t *)&v2, 0x16u);
}

+ (void)_searchVersionInAppURL:identifier:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_22A36D000, v0, v1, "found version using version.plist for URL %@", v2, v3, v4, v5, v6);
}

+ (void)_searchVersionInAppURL:identifier:.cold.3()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_22A36D000, v0, v1, "no data in version file for App URL %@", v2, v3, v4, v5, v6);
}

+ (void)_searchVersionInAppURL:identifier:.cold.4()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_22A36D000, v0, v1, "Could get bundle from URL [%{public}@]", v2, v3, v4, v5, v6);
}

+ (void)_searchVersionInAppURL:identifier:.cold.5()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_22A36D000, v0, v1, "Could not find version from bundle in URL [%{public}@]", v2, v3, v4, v5, v6);
}

+ (void)_searchVersionInAppURL:identifier:.cold.6()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2(&dword_22A36D000, v0, v1, "found version using bundle for URL [%@] version [%@]");
}

+ (void)_searchIdentifierInAppURL:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_22A36D000, v0, v1, "Could not find identifier from bundle in URL [%{public}@]", v2, v3, v4, v5, v6);
}

+ (void)_searchIdentifierInAppURL:.cold.3()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2(&dword_22A36D000, v0, v1, "found identifier using bundle for URL [%@] version [%@]");
}

+ (void)_searchIdentifierInAppURL:.cold.4()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2(&dword_22A36D000, v0, v1, "found identifier using app proxy for URL [%@] in app [%@]");
}

@end