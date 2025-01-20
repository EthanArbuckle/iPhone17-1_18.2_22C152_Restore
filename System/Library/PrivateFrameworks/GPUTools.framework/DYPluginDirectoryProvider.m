@interface DYPluginDirectoryProvider
- (DYPluginDirectoryProvider)init;
- (id)getPlatformDirectoriesWithBundleName:(id)a3;
- (void)enumerateDirectories:(id)a3;
@end

@implementation DYPluginDirectoryProvider

- (DYPluginDirectoryProvider)init
{
  uint64_t v4 = objc_opt_class();
  if (v4 == objc_opt_class())
  {
    [(DYPluginDirectoryProvider *)self doesNotRecognizeSelector:a2];

    return 0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)DYPluginDirectoryProvider;
    return [(DYPluginDirectoryProvider *)&v6 init];
  }
}

- (void)enumerateDirectories:(id)a3
{
}

- (id)getPlatformDirectoriesWithBundleName:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (!self->_developerDirectory) {
    return 0;
  }
  v5 = objc_opt_new();
  objc_super v6 = objc_opt_new();
  uint64_t v7 = [NSString stringWithFormat:@"Developer/Library/%@/PlugIns", a3];
  v8 = [(NSURL *)self->_developerDirectory URLByAppendingPathComponent:@"Platforms"];
  uint64_t v9 = *MEMORY[0x263EFF6A8];
  v10 = objc_msgSend(v5, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v8, objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", *MEMORY[0x263EFF750], *MEMORY[0x263EFF6A8], 0), 0, 0);

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v19;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v18 + 1) + 8 * v14);
        id v17 = 0;
        [v15 getResourceValue:&v17 forKey:v9 error:0];
        if (objc_msgSend((id)objc_msgSend(v15, "pathExtension"), "isEqualToString:", @"platform"))
        {
          if ([v17 BOOLValue]) {
            objc_msgSend(v6, "addObject:", objc_msgSend(v15, "URLByAppendingPathComponent:", v7));
          }
        }
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v12);
  }
  return v6;
}

@end