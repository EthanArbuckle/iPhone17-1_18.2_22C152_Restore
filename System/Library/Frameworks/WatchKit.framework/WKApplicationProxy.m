@interface WKApplicationProxy
+ (id)applicationsForContainerProxy:(id)a3;
+ (id)gizmoAppBundleUrlWithPluginUrl:(id)a3;
+ (id)watchAppBundleUrlWithContainerUrl:(id)a3;
- (NSURL)bundleURL;
- (WKApplicationProxy)initWithBundleURL:(id)a3;
@end

@implementation WKApplicationProxy

- (WKApplicationProxy)initWithBundleURL:(id)a3
{
  v4 = (NSURL *)a3;
  v8.receiver = self;
  v8.super_class = (Class)WKApplicationProxy;
  v5 = [(WKApplicationProxy *)&v8 init];
  bundleURL = v5->_bundleURL;
  v5->_bundleURL = v4;

  return v5;
}

+ (id)applicationsForContainerProxy:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unsigned __int8 v34 = 0;
  v5 = [v4 bundleURL];
  v6 = [v5 path];
  v7 = [v6 stringByAppendingPathComponent:@"Watch"];

  objc_super v8 = [MEMORY[0x263F08850] defaultManager];
  LODWORD(v6) = [v8 fileExistsAtPath:v7 isDirectory:&v34];
  int v9 = v34;

  if (v6) {
    BOOL v10 = v9 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v23 = [v4 plugInKitPlugins];
    uint64_t v11 = [v23 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      id v29 = a1;
      uint64_t v13 = *(void *)v31;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v31 != v13) {
            objc_enumerationMutation(v23);
          }
          v15 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          v16 = [v15 protocol];
          int v17 = [v16 isEqualToString:@"com.apple.watchkit"];

          if (v17)
          {
            v26 = [v15 bundleURL];
            v24 = [v29 gizmoAppBundleUrlWithPluginUrl:v26];

            if (v24)
            {
              v27 = [[WKApplicationProxy alloc] initWithBundleURL:v24];
              v25 = [MEMORY[0x263EFF980] array];
              [v25 addObject:v27];
            }
            else
            {
              v25 = 0;
            }
            goto LABEL_21;
          }
        }
        uint64_t v12 = [v23 countByEnumeratingWithState:&v30 objects:v35 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
    goto LABEL_17;
  }
  v18 = NSURL;
  v19 = [v4 bundleURL];
  v20 = [v19 path];
  v21 = [v20 stringByAppendingPathComponent:@"Watch"];
  v22 = [v18 fileURLWithPath:v21];
  v23 = [a1 watchAppBundleUrlWithContainerUrl:v22];

  if (!v23)
  {
LABEL_17:
    v25 = 0;
    goto LABEL_22;
  }
  v24 = [[WKApplicationProxy alloc] initWithBundleURL:v23];
  v25 = [MEMORY[0x263EFF980] array];
  [v25 addObject:v24];
LABEL_21:

LABEL_22:

  return v25;
}

+ (id)watchAppBundleUrlWithContainerUrl:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x223C7C050]();
  v5 = [MEMORY[0x263F08A98] predicateWithFormat:@"self ENDSWITH '.app'"];
  v6 = [MEMORY[0x263F08850] defaultManager];
  v7 = [v3 path];
  objc_super v8 = [v6 contentsOfDirectoryAtPath:v7 error:0];

  int v9 = [v8 filteredArrayUsingPredicate:v5];
  if ([v9 count])
  {
    BOOL v10 = [v3 pathComponents];
    uint64_t v11 = (void *)[v10 mutableCopy];

    uint64_t v12 = [v9 firstObject];
    [v11 addObject:v12];

    uint64_t v13 = [v11 componentsJoinedByString:@"/"];
    v14 = [NSURL fileURLWithPath:v13 isDirectory:1];
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)gizmoAppBundleUrlWithPluginUrl:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x223C7C050]();
  v5 = [MEMORY[0x263F08A98] predicateWithFormat:@"self ENDSWITH '.app'"];
  v6 = [MEMORY[0x263F08850] defaultManager];
  v7 = [v3 path];
  objc_super v8 = [v6 contentsOfDirectoryAtPath:v7 error:0];

  int v9 = [v8 filteredArrayUsingPredicate:v5];
  if ([v9 count])
  {
    BOOL v10 = [v3 pathComponents];
    uint64_t v11 = (void *)[v10 mutableCopy];

    uint64_t v12 = [v9 firstObject];
    [v11 addObject:v12];

    uint64_t v13 = [v11 componentsJoinedByString:@"/"];
    v14 = [NSURL fileURLWithPath:v13 isDirectory:1];
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (NSURL)bundleURL
{
  return self->_bundleURL;
}

- (void).cxx_destruct
{
}

@end