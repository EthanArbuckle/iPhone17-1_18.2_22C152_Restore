@interface EXFrameworkScanner
+ (id)frameworkPaths;
+ (id)rootURL;
- (BOOL)isAppleInternalURL:(id)a3;
- (BOOL)isCatalystSupportURL:(id)a3;
- (EXFrameworkScanner)initWithSourceURL:(id)a3;
- (NSArray)appleInternalExtensionPaths;
- (NSArray)extensionPaths;
- (NSDictionary)combinedAppleInternalExtensionSDK;
- (NSDictionary)combinedExtensionSDK;
- (NSMutableArray)_appleInternalExtensions;
- (NSMutableArray)_extensions;
- (NSMutableDictionary)_combinedAppleInternalExtensionSDK;
- (NSMutableDictionary)_combinedExtensionSDK;
- (NSURL)sourceURL;
- (void)enumerateAppexptAtURL:(id)a3 block:(id)a4;
- (void)enumerateBundlesWithPathExtension:(id)a3 atURL:(id)a4 block:(id)a5;
- (void)enumerateFrameworksBundlesWithFrameworkURL:(id)a3 block:(id)a4;
- (void)main;
- (void)processExtensionSDK:(id)a3 declaringURL:(id)a4;
- (void)processExtensionSDKFromBundle:(__CFBundle *)a3;
- (void)processExtensionSDKFromFile:(id)a3;
- (void)processExtensionsFromBundle:(__CFBundle *)a3;
- (void)processExtensionsInDirectory:(id)a3;
- (void)set_appleInternalExtensions:(id)a3;
- (void)set_combinedAppleInternalExtensionSDK:(id)a3;
- (void)set_combinedExtensionSDK:(id)a3;
- (void)set_extensions:(id)a3;
@end

@implementation EXFrameworkScanner

+ (id)frameworkPaths
{
  if (frameworkPaths_onceToken != -1) {
    dispatch_once(&frameworkPaths_onceToken, &__block_literal_global_8);
  }
  v2 = (void *)frameworkPaths_frameworkPaths;

  return v2;
}

void __36__EXFrameworkScanner_frameworkPaths__block_invoke()
{
  v0 = +[_EXDefaults sharedInstance];
  int v1 = [v0 allowsAppleInternalComponents];

  v2 = &unk_1EE2E1190;
  v3 = (void *)frameworkPaths_frameworkPaths;
  if (v1) {
    v2 = &unk_1EE2E1178;
  }
  frameworkPaths_frameworkPaths = (uint64_t)v2;
}

+ (id)rootURL
{
  if (rootURL_onceToken != -1) {
    dispatch_once(&rootURL_onceToken, &__block_literal_global_12);
  }
  v2 = (void *)rootURL_rootURL;

  return v2;
}

uint64_t __29__EXFrameworkScanner_rootURL__block_invoke()
{
  rootURL_rootURL = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/"];

  return MEMORY[0x1F41817F8]();
}

- (EXFrameworkScanner)initWithSourceURL:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)EXFrameworkScanner;
  v6 = [(EXFrameworkScanner *)&v17 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sourceURL, a3);
    uint64_t v8 = objc_opt_new();
    combinedExtensionSDK = v7->__combinedExtensionSDK;
    v7->__combinedExtensionSDK = (NSMutableDictionary *)v8;

    uint64_t v10 = objc_opt_new();
    combinedAppleInternalExtensionSDK = v7->__combinedAppleInternalExtensionSDK;
    v7->__combinedAppleInternalExtensionSDK = (NSMutableDictionary *)v10;

    uint64_t v12 = objc_opt_new();
    extensions = v7->__extensions;
    v7->__extensions = (NSMutableArray *)v12;

    uint64_t v14 = objc_opt_new();
    appleInternalExtensions = v7->__appleInternalExtensions;
    v7->__appleInternalExtensions = (NSMutableArray *)v14;
  }
  return v7;
}

- (NSDictionary)combinedExtensionSDK
{
  v2 = (void *)[(NSMutableDictionary *)self->__combinedExtensionSDK copy];

  return (NSDictionary *)v2;
}

- (NSDictionary)combinedAppleInternalExtensionSDK
{
  v2 = (void *)[(NSMutableDictionary *)self->__combinedAppleInternalExtensionSDK copy];

  return (NSDictionary *)v2;
}

- (NSArray)extensionPaths
{
  v2 = (void *)[(NSMutableArray *)self->__extensions copy];

  return (NSArray *)v2;
}

- (NSArray)appleInternalExtensionPaths
{
  v2 = (void *)[(NSMutableArray *)self->__appleInternalExtensions copy];

  return (NSArray *)v2;
}

- (BOOL)isCatalystSupportURL:(id)a3
{
  id v4 = a3;
  id v5 = [(EXFrameworkScanner *)self sourceURL];
  v6 = [v5 URLByAppendingPathComponent:@"System/iOSSupport"];

  v7 = [v4 path];

  uint64_t v8 = [v7 lowercaseString];
  v9 = [v6 path];
  uint64_t v10 = [v9 lowercaseString];
  char v11 = [v8 hasPrefix:v10];

  return v11;
}

- (BOOL)isAppleInternalURL:(id)a3
{
  id v4 = a3;
  id v5 = [(EXFrameworkScanner *)self sourceURL];
  v6 = [v5 URLByAppendingPathComponent:@"AppleInternal"];

  v7 = [v4 path];
  uint64_t v8 = [v7 lowercaseString];
  v9 = [v6 path];
  uint64_t v10 = [v9 lowercaseString];
  char v11 = [v8 hasPrefix:v10];

  if (v11)
  {
    char v12 = 1;
  }
  else
  {
    v13 = [(EXFrameworkScanner *)self sourceURL];
    uint64_t v14 = [v13 URLByAppendingPathComponent:@"System/iOSSupport/AppleInternal"];

    v15 = [v4 path];
    v16 = [v15 lowercaseString];
    objc_super v17 = [v14 path];
    v18 = [v17 lowercaseString];
    char v12 = [v16 hasPrefix:v18];
  }
  return v12;
}

- (void)enumerateBundlesWithPathExtension:(id)a3 atURL:(id)a4 block:(id)a5
{
  v43[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v33 = (void (**)(id, void *, unsigned char *))a5;
  id v41 = 0;
  uint64_t v9 = *MEMORY[0x1E4F1C680];
  int v10 = [v8 getResourceValue:&v41 forKey:*MEMORY[0x1E4F1C680] error:0];
  id v11 = v41;
  if (v10) {
    BOOL v12 = v11 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  v31 = v11;
  if (!v12 && [v11 BOOLValue])
  {
    uint64_t v13 = [v8 URLByResolvingSymlinksInPath];

    id v8 = (id)v13;
  }
  uint64_t v34 = *MEMORY[0x1E4F1C628];
  v43[0] = *MEMORY[0x1E4F1C628];
  v43[1] = v9;
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:2];
  v15 = [MEMORY[0x1E4F28CB8] defaultManager];
  v32 = v8;
  v30 = (void *)v14;
  v16 = [v15 enumeratorAtURL:v8 includingPropertiesForKeys:v14 options:1 errorHandler:0];

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v17 = v16;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v38;
    while (2)
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v38 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        v23 = (void *)MEMORY[0x192FEB110]();
        v24 = [v22 lastPathComponent];
        v25 = [v24 pathExtension];

        if (v25 && ![v25 caseInsensitiveCompare:v7])
        {
          id v36 = 0;
          int v26 = [v22 getResourceValue:&v36 forKey:v34 error:0];
          id v27 = v36;
          v28 = v27;
          if (v26) {
            BOOL v29 = v27 == 0;
          }
          else {
            BOOL v29 = 1;
          }
          if (!v29)
          {
            if ([v27 BOOLValue])
            {
              char v35 = 0;
              v33[2](v33, v22, &v35);
              if (v35)
              {

                goto LABEL_25;
              }
            }
          }
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v37 objects:v42 count:16];
      if (v19) {
        continue;
      }
      break;
    }
  }
LABEL_25:
}

- (void)enumerateAppexptAtURL:(id)a3 block:(id)a4
{
  v40[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v30 = (void (**)(id, void *, unsigned char *))a4;
  id v38 = 0;
  uint64_t v6 = *MEMORY[0x1E4F1C680];
  int v7 = [v5 getResourceValue:&v38 forKey:*MEMORY[0x1E4F1C680] error:0];
  id v8 = v38;
  if (v7) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  v28 = v8;
  if (!v9 && [v8 BOOLValue])
  {
    uint64_t v10 = [v5 URLByResolvingSymlinksInPath];

    id v5 = (id)v10;
  }
  uint64_t v31 = *MEMORY[0x1E4F1C670];
  v40[0] = *MEMORY[0x1E4F1C670];
  v40[1] = v6;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:2];
  BOOL v12 = [MEMORY[0x1E4F28CB8] defaultManager];
  BOOL v29 = v5;
  id v27 = (void *)v11;
  uint64_t v13 = [v12 enumeratorAtURL:v5 includingPropertiesForKeys:v11 options:1 errorHandler:0];

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v14 = v13;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v35;
    while (2)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v35 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        uint64_t v20 = (void *)MEMORY[0x192FEB110]();
        v21 = [v19 lastPathComponent];
        v22 = [v21 pathExtension];

        if (v22 && ![v22 caseInsensitiveCompare:@"appexpt"])
        {
          id v33 = 0;
          int v23 = [v19 getResourceValue:&v33 forKey:v31 error:0];
          id v24 = v33;
          v25 = v24;
          if (v23) {
            BOOL v26 = v24 == 0;
          }
          else {
            BOOL v26 = 1;
          }
          if (!v26)
          {
            if ([v24 BOOLValue])
            {
              char v32 = 0;
              v30[2](v30, v19, &v32);
              if (v32)
              {

                goto LABEL_25;
              }
            }
          }
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v34 objects:v39 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }
LABEL_25:
}

- (void)enumerateFrameworksBundlesWithFrameworkURL:(id)a3 block:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, uint64_t, unsigned char *))a4;
  uint64_t Unique = _CFBundleCreateUnique();
  char v19 = 0;
  if (Unique)
  {
    uint64_t v6 = (__CFBundle *)Unique;
    v4[2](v4, Unique, &v19);
    if (v19) {
      CFArrayRef v7 = (CFArrayRef)MEMORY[0x1E4F1CBF0];
    }
    else {
      CFArrayRef v7 = CFBundleCopyResourceURLsOfType(v6, @"framework", @"Frameworks");
    }
    CFRelease(v6);
  }
  else
  {
    CFArrayRef v7 = (CFArrayRef)MEMORY[0x1E4F1CBF0];
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  CFArrayRef v8 = v7;
  uint64_t v9 = [(__CFArray *)v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
LABEL_9:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v16 != v11) {
        objc_enumerationMutation(v8);
      }
      uint64_t v13 = _CFBundleCreateUnique();
      if (v13)
      {
        id v14 = (const void *)v13;
        v4[2](v4, v13, &v19);
        CFRelease(v14);
      }
      if (v19) {
        break;
      }
      if (v10 == ++v12)
      {
        uint64_t v10 = [(__CFArray *)v8 countByEnumeratingWithState:&v15 objects:v20 count:16];
        if (v10) {
          goto LABEL_9;
        }
        break;
      }
    }
  }
}

- (void)processExtensionSDKFromBundle:(__CFBundle *)a3
{
  id v5 = [(__CFDictionary *)CFBundleGetInfoDictionary(a3) objectForKey:@"NSExtensionSDK"];
  CFURLRef v6 = CFBundleCopyBundleURL(a3);
  if (v5)
  {
    CFArrayRef v7 = _EXRegistrationLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[EXFrameworkScanner processExtensionSDKFromBundle:]();
    }

    [(EXFrameworkScanner *)self processExtensionSDK:v5 declaringURL:v6];
  }
}

- (void)processExtensionSDKFromFile:(id)a3
{
  id v4 = a3;
  id v10 = 0;
  id v5 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v4 options:1 error:&v10];
  id v6 = v10;
  if (!v5)
  {
    CFArrayRef v7 = _EXRegistrationLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[EXFrameworkScanner processExtensionSDKFromFile:]();
    }
    goto LABEL_11;
  }
  id v9 = 0;
  CFArrayRef v7 = [MEMORY[0x1E4F28F98] propertyListWithData:v5 options:0 format:0 error:&v9];
  id v8 = v9;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (v8 || !v7)
    {
      id v6 = v8;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "_EX_parameterError");
      id v6 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_11:

    id v8 = v6;
    goto LABEL_12;
  }
  if (v7)
  {
    [(EXFrameworkScanner *)self processExtensionSDK:v7 declaringURL:v4];
    goto LABEL_14;
  }
LABEL_12:
  CFArrayRef v7 = _EXRegistrationLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[EXFrameworkScanner processExtensionSDKFromFile:]();
  }
LABEL_14:
}

- (void)processExtensionSDK:(id)a3 declaringURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int active_platform = dyld_get_active_platform();
  BOOL v9 = [(EXFrameworkScanner *)self isCatalystSupportURL:v7];
  BOOL v10 = [(EXFrameworkScanner *)self isAppleInternalURL:v7];
  uint64_t v11 = [(EXFrameworkScanner *)self _combinedExtensionSDK];
  if (v10)
  {
    uint64_t v12 = [(EXFrameworkScanner *)self _combinedAppleInternalExtensionSDK];

    uint64_t v11 = (void *)v12;
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __55__EXFrameworkScanner_processExtensionSDK_declaringURL___block_invoke;
  v16[3] = &unk_1E573D708;
  if (v9) {
    int v13 = 6;
  }
  else {
    int v13 = active_platform;
  }
  id v17 = v7;
  id v18 = v11;
  int v19 = v13;
  id v14 = v11;
  id v15 = v7;
  [v6 enumerateKeysAndObjectsUsingBlock:v16];
}

void __55__EXFrameworkScanner_processExtensionSDK_declaringURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5 && v6)
  {
    id v8 = _EXRegistrationLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __55__EXFrameworkScanner_processExtensionSDK_declaringURL___block_invoke_cold_1();
    }

    BOOL v9 = [*(id *)(a1 + 32) path];
    BOOL v10 = objc_msgSend(v7, "_EX_dictionaryBySettingObject:forKey:", v9, @"EXDeclaringPath");

    uint64_t v11 = [*(id *)(a1 + 40) objectForKeyedSubscript:v5];
    uint64_t v12 = v11;
    if (v11) {
      id v13 = v11;
    }
    else {
      id v13 = (id)objc_opt_new();
    }
    id v14 = v13;

    int v15 = *(_DWORD *)(a1 + 48);
    long long v16 = [v14 objectForKeyedSubscript:@"EXCatalystSDKVariant"];
    id v17 = v16;
    if (v15 == 6)
    {

      if (v17)
      {
        id v18 = _EXRegistrationLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v19 = *(void *)(a1 + 32);
          int v24 = 138543362;
          uint64_t v25 = v19;
        }
      }
      [v14 setObject:v10 forKeyedSubscript:@"EXCatalystSDKVariant"];
      [*(id *)(a1 + 40) setObject:v14 forKeyedSubscript:v5];
      goto LABEL_24;
    }
    unint64_t v20 = [v14 count];
    if (v17)
    {
      if (v20 <= 1)
      {
        uint64_t v21 = (void *)[v10 mutableCopy];

LABEL_22:
        [v21 setObject:v17 forKeyedSubscript:@"EXCatalystSDKVariant"];
LABEL_23:
        [*(id *)(a1 + 40) setObject:v21 forKeyedSubscript:v5];

        id v14 = v21;
LABEL_24:

        goto LABEL_25;
      }
    }
    else if (!v20)
    {
      uint64_t v21 = (void *)[v10 mutableCopy];

      goto LABEL_23;
    }
    v22 = _EXRegistrationLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = *(void *)(a1 + 32);
      int v24 = 138543362;
      uint64_t v25 = v23;
    }

    uint64_t v21 = (void *)[v10 mutableCopy];
    if (!v17) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  BOOL v10 = v6;
LABEL_25:
}

- (void)processExtensionsFromBundle:(__CFBundle *)a3
{
  CFURLRef v4 = CFBundleCopyBuiltInPlugInsURL(a3);
  id v5 = _EXRegistrationLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[EXFrameworkScanner processExtensionsFromBundle:](v4, v5);
  }

  [(EXFrameworkScanner *)self processExtensionsInDirectory:v4];
}

- (void)processExtensionsInDirectory:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __51__EXFrameworkScanner_processExtensionsInDirectory___block_invoke;
  v3[3] = &unk_1E573D730;
  v3[4] = self;
  [(EXFrameworkScanner *)self enumerateBundlesWithPathExtension:@"appex" atURL:a3 block:v3];
}

void __51__EXFrameworkScanner_processExtensionsInDirectory___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 sourceURL];
  id v6 = [v5 path];

  id v7 = [v4 path];

  id v8 = objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:options:range:", v6, &stru_1EE2CDC90, 1, 0, objc_msgSend(v6, "length"));

  BOOL v9 = (void *)MEMORY[0x1E4F1CB10];
  BOOL v10 = [(id)objc_opt_class() rootURL];
  uint64_t v11 = [v9 fileURLWithPath:v8 relativeToURL:v10];

  if ([*(id *)(a1 + 32) isAppleInternalURL:v11]) {
    uint64_t v12 = 280;
  }
  else {
    uint64_t v12 = 272;
  }
  id v13 = *(void **)(*(void *)(a1 + 32) + v12);
  id v14 = [v11 path];
  [v13 addObject:v14];

  int v15 = _EXRegistrationLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    __51__EXFrameworkScanner_processExtensionsInDirectory___block_invoke_cold_1();
  }
}

- (void)main
{
  id v7 = [a2 path];
  *(_DWORD *)a1 = 138543362;
  *a3 = v7;
  _os_log_debug_impl(&dword_191F29000, a4, OS_LOG_TYPE_DEBUG, "Scanning frameworks at '%{public}@'", a1, 0xCu);
}

void __26__EXFrameworkScanner_main__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __26__EXFrameworkScanner_main__block_invoke_2;
  v6[3] = &unk_1E573D758;
  id v4 = *(void **)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v5 = v3;
  [v4 enumerateFrameworksBundlesWithFrameworkURL:v5 block:v6];
}

uint64_t __26__EXFrameworkScanner_main__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4 = _EXRegistrationLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __26__EXFrameworkScanner_main__block_invoke_2_cold_1(a1, v4);
  }

  [*(id *)(a1 + 40) processExtensionSDKFromBundle:a2];
  return [*(id *)(a1 + 40) processExtensionsFromBundle:a2];
}

- (NSURL)sourceURL
{
  return (NSURL *)objc_getProperty(self, a2, 248, 1);
}

- (NSMutableDictionary)_combinedExtensionSDK
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 256, 1);
}

- (void)set_combinedExtensionSDK:(id)a3
{
}

- (NSMutableDictionary)_combinedAppleInternalExtensionSDK
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 264, 1);
}

- (void)set_combinedAppleInternalExtensionSDK:(id)a3
{
}

- (NSMutableArray)_extensions
{
  return (NSMutableArray *)objc_getProperty(self, a2, 272, 1);
}

- (void)set_extensions:(id)a3
{
}

- (NSMutableArray)_appleInternalExtensions
{
  return (NSMutableArray *)objc_getProperty(self, a2, 280, 1);
}

- (void)set_appleInternalExtensions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__appleInternalExtensions, 0);
  objc_storeStrong((id *)&self->__extensions, 0);
  objc_storeStrong((id *)&self->__combinedAppleInternalExtensionSDK, 0);
  objc_storeStrong((id *)&self->__combinedExtensionSDK, 0);

  objc_storeStrong((id *)&self->_sourceURL, 0);
}

- (void)processExtensionSDKFromBundle:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_3(&dword_191F29000, v0, v1, "NSExtensionSDK found in '%{public}@'", v2);
}

- (void)processExtensionSDKFromFile:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
}

- (void)processExtensionSDKFromFile:.cold.2()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
}

void __55__EXFrameworkScanner_processExtensionSDK_declaringURL___block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
}

- (void)processExtensionsFromBundle:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 path];
  OUTLINED_FUNCTION_3();
}

void __51__EXFrameworkScanner_processExtensionsInDirectory___block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
}

void __26__EXFrameworkScanner_main__block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [*(id *)(a1 + 32) path];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_3(&dword_191F29000, a2, v4, "Processing: %{public}@", v5);
}

@end