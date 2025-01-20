@interface DYPluginLoader
+ (BOOL)loadPluginWithBundle:(id)a3;
+ (id)getLoadedPluginNames;
+ (id)loadGPUToolsPlugins;
+ (id)loadGPUToolsPluginsInMainBundleOnly:(BOOL)a3;
+ (id)loadLatestPlatformSupportPlugInWithProvider:(id)a3 baseExtension:(id)a4;
+ (id)loadPluginsInDirectory:(id)a3 pathExtension:(id)a4;
+ (id)loadPluginsInDirectory:(id)a3 pathExtension:(id)a4 matchingRegex:(id)a5;
+ (id)loadPluginsWithProvider:(id)a3 pathExtension:(id)a4;
+ (id)loadPluginsWithProvider:(id)a3 pathExtension:(id)a4 matchingRegex:(id)a5;
+ (id)sharedPluginLoader;
- (BOOL)_loadBundle:(id)a3;
- (DYPluginLoader)init;
- (id)_loadPluginsInDirectory:(id)a3 pathExtension:(id)a4 matchingRegex:(id)a5;
- (id)_loadPluginsWithProvider:(id)a3 pathExtension:(id)a4;
- (id)_loadPluginsWithProvider:(id)a3 pathExtension:(id)a4 matchingRegex:(id)a5;
- (id)loadLatestPlatformSupportPlugInWithProvider:(id)a3 baseExtension:(id)a4 preferredPluginExtension:(id)a5;
- (void)dealloc;
@end

@implementation DYPluginLoader

+ (id)sharedPluginLoader
{
  if (sharedPluginLoader_registry_once != -1) {
    dispatch_once(&sharedPluginLoader_registry_once, &__block_literal_global_3);
  }
  return (id)sharedPluginLoader_loader;
}

uint64_t __36__DYPluginLoader_sharedPluginLoader__block_invoke()
{
  uint64_t result = objc_opt_new();
  sharedPluginLoader_loader = result;
  return result;
}

+ (id)loadGPUToolsPlugins
{
  return (id)[a1 loadGPUToolsPluginsInMainBundleOnly:0];
}

+ (id)loadGPUToolsPluginsInMainBundleOnly:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  if (!v5) {
    +[DYPluginLoader loadGPUToolsPluginsInMainBundleOnly:]();
  }
  v6 = [[DYStandardPluginDirectoryProvider alloc] initWithBundle:v5 includeDeveloperDirectory:!v3 includeBundleDirectory:0];
  v7 = (void *)[a1 loadPluginsWithProvider:v6 pathExtension:@"gtplugin"];

  return v7;
}

+ (BOOL)loadPluginWithBundle:(id)a3
{
  v4 = (void *)[a1 sharedPluginLoader];
  return [v4 _loadBundle:a3];
}

+ (id)loadPluginsWithProvider:(id)a3 pathExtension:(id)a4
{
  v6 = (void *)[a1 sharedPluginLoader];
  return (id)[v6 _loadPluginsWithProvider:a3 pathExtension:a4 matchingRegex:0];
}

+ (id)loadLatestPlatformSupportPlugInWithProvider:(id)a3 baseExtension:(id)a4
{
  if (getenv("GT_DEVELOPER_DIR")) {
    v7 = @"_osx";
  }
  else {
    v7 = @"_ios";
  }
  uint64_t v8 = [a4 stringByAppendingString:v7];
  v9 = (void *)[a1 sharedPluginLoader];
  return (id)[v9 loadLatestPlatformSupportPlugInWithProvider:a3 baseExtension:a4 preferredPluginExtension:v8];
}

- (id)loadLatestPlatformSupportPlugInWithProvider:(id)a3 baseExtension:(id)a4 preferredPluginExtension:(id)a5
{
  uint64_t v9 = [MEMORY[0x263EFF9C0] set];
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3052000000;
  v25 = __Block_byref_object_copy__0;
  v26 = __Block_byref_object_dispose__0;
  uint64_t v27 = 0;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3052000000;
  v19 = __Block_byref_object_copy__0;
  v20 = __Block_byref_object_dispose__0;
  uint64_t v21 = 0;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __101__DYPluginLoader_loadLatestPlatformSupportPlugInWithProvider_baseExtension_preferredPluginExtension___block_invoke;
  v15[3] = &unk_265333D48;
  v15[4] = v9;
  v15[5] = a4;
  v15[8] = &v16;
  v15[9] = &v22;
  v15[6] = @"GPUToolsPlatformSupport-";
  v15[7] = a5;
  [a3 enumerateDirectories:v15];
  v10 = (void *)v17[5];
  if (v10
    && (v11 = (void *)[v10 lastPathComponent]) != 0
    && ([(NSMutableSet *)self->_loadedPluginNames containsObject:v11] & 1) == 0
    && (uint64_t v12 = [MEMORY[0x263F086E0] bundleWithURL:v17[5]]) != 0
    && [(DYPluginLoader *)self _loadBundle:v12])
  {
    id v13 = (id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v11, "stringByDeletingPathExtension"), "substringFromIndex:", objc_msgSend(@"GPUToolsPlatformSupport-", "length")), "copy");
  }
  else
  {
    id v13 = 0;
  }
  [(id)v17[5] fileSystemRepresentation];
  [(id)v23[5] UTF8String];
  DYLog();

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);
  return v13;
}

void __101__DYPluginLoader_loadLatestPlatformSupportPlugInWithProvider_baseExtension_preferredPluginExtension___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v4 = objc_opt_new();
  uint64_t v5 = *MEMORY[0x263EFF6A8];
  v15 = v4;
  v6 = objc_msgSend(v4, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", a2, objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", *MEMORY[0x263EFF750], *MEMORY[0x263EFF6A8], 0), 0, 0);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    uint64_t v16 = *MEMORY[0x263EFFB70];
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v18 + 1) + 8 * v10);
        id v17 = 0;
        [v11 getResourceValue:&v17 forKey:v5 error:0];
        uint64_t v12 = (void *)[v11 lastPathComponent];
        if (([*(id *)(a1 + 32) containsObject:v12] & 1) == 0
          && objc_msgSend((id)objc_msgSend(v12, "pathExtension"), "hasPrefix:", *(void *)(a1 + 40))
          && [v12 hasPrefix:*(void *)(a1 + 48)]
          && [v17 BOOLValue])
        {
          id v13 = (void *)[(__CFDictionary *)CFBundleCopyInfoDictionaryForURL((CFURLRef)v11) objectForKeyedSubscript:v16];
          if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
          {
            long long v28 = 0u;
            long long v29 = 0u;
            _LSGetVersionFromString();
            long long v26 = 0u;
            long long v27 = 0u;
            _LSGetVersionFromString();
            long long v24 = v28;
            long long v25 = v29;
            long long v22 = v26;
            long long v23 = v27;
            uint64_t v14 = _LSVersionNumberCompare();
            if (v14 == 1
              || !v14
              && objc_msgSend((id)objc_msgSend(v12, "pathExtension"), "isEqualToString:", *(void *)(a1 + 56)))
            {

              *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = v11;
              goto LABEL_16;
            }
          }
          else
          {
            *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = v11;
LABEL_16:
            *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) = [v13 copy];
          }
          [*(id *)(a1 + 32) addObject:v12];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v30 count:16];
    }
    while (v8);
  }
}

+ (id)loadPluginsWithProvider:(id)a3 pathExtension:(id)a4 matchingRegex:(id)a5
{
  uint64_t v8 = (void *)[a1 sharedPluginLoader];
  return (id)[v8 _loadPluginsWithProvider:a3 pathExtension:a4 matchingRegex:a5];
}

+ (id)loadPluginsInDirectory:(id)a3 pathExtension:(id)a4 matchingRegex:(id)a5
{
  uint64_t v8 = (void *)[a1 sharedPluginLoader];
  return (id)[v8 _loadPluginsInDirectory:a3 pathExtension:a4 matchingRegex:a5];
}

+ (id)loadPluginsInDirectory:(id)a3 pathExtension:(id)a4
{
  v6 = (void *)[a1 sharedPluginLoader];
  return (id)[v6 _loadPluginsInDirectory:a3 pathExtension:a4 matchingRegex:0];
}

+ (id)getLoadedPluginNames
{
  return *(id *)([a1 sharedPluginLoader] + 8);
}

- (DYPluginLoader)init
{
  v4.receiver = self;
  v4.super_class = (Class)DYPluginLoader;
  v2 = [(DYPluginLoader *)&v4 init];
  if (v2)
  {
    v2->_loadedPluginNames = (NSMutableSet *)objc_opt_new();
    v2->_loading = 0;
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)DYPluginLoader;
  [(DYPluginLoader *)&v3 dealloc];
}

- (BOOL)_loadBundle:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  if (!a3) {
    -[DYPluginLoader _loadBundle:]();
  }
  id v30 = 0;
  CFDictionaryRef v5 = CFBundleCopyInfoDictionaryForURL((CFURLRef)[a3 bundleURL]);
  if (!v5) {
    goto LABEL_33;
  }
  CFDictionaryRef v6 = v5;
  uint64_t v7 = [a3 URLForResource:@"PlugIn" withExtension:@"plist"];
  if (!v7) {
    goto LABEL_33;
  }
  uint64_t v8 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v7 options:0 error:&v30];
  if (v8)
  {
    uint64_t v9 = (void *)[MEMORY[0x263F08AC0] propertyListWithData:v8 options:0 format:0 error:&v30];
    if (!v9)
    {
      objc_msgSend((id)objc_msgSend(a3, "bundlePath"), "UTF8String");
      objc_msgSend((id)objc_msgSend(v30, "localizedDescription"), "UTF8String");
LABEL_33:
      DYLog();
      return 0;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }
  if (_loadBundle__onceToken != -1) {
    dispatch_once(&_loadBundle__onceToken, &__block_literal_global_36);
  }
  if (_loadBundle__onceToken_45 != -1) {
    dispatch_once(&_loadBundle__onceToken_45, &__block_literal_global_47);
  }
  if (([a3 loadAndReturnError:&v30] & 1) == 0)
  {
    long long v22 = (void *)[a3 executablePath];
    if (v22)
    {
      BOOL v23 = dlopen_preflight((const char *)[v22 fileSystemRepresentation]);
      objc_msgSend((id)objc_msgSend(a3, "bundlePath"), "UTF8String");
      objc_msgSend((id)objc_msgSend(v30, "localizedDescription"), "UTF8String");
      if (!v23) {
        dlerror();
      }
    }
    else
    {
      objc_msgSend((id)objc_msgSend(a3, "bundlePath"), "UTF8String");
    }
    goto LABEL_33;
  }
  uint64_t v10 = [(__CFDictionary *)v6 objectForKey:@"NSPrincipalClass"];
  if (v10)
  {
    v11 = (void *)v10;
    if (![a3 principalClass])
    {
      uint64_t v24 = objc_msgSend((id)objc_msgSend(a3, "bundlePath"), "UTF8String");
      uint64_t v25 = [v11 UTF8String];
      DYLog();
      objc_msgSend(a3, "unload", v24, v25);
      return 0;
    }
  }
  if (v9)
  {
    id v12 = +[DYExtensionRegistry sharedExtensionRegistry];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v13 = (void *)[v9 objectForKey:@"extensions"];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v27;
      while (2)
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v27 != v16) {
            objc_enumerationMutation(v13);
          }
          long long v18 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          id v19 = [[DYExtension alloc] _initWithDictionary:v18 bundle:a3];
          if (!v19)
          {
            objc_msgSend((id)objc_msgSend(v18, "description"), "UTF8String");
            goto LABEL_33;
          }
          long long v20 = v19;
          [v12 registerExtension:v19];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v26 objects:v31 count:16];
        if (v15) {
          continue;
        }
        break;
      }
    }
  }
  -[NSMutableSet addObject:](self->_loadedPluginNames, "addObject:", objc_msgSend((id)objc_msgSend(a3, "bundleURL"), "lastPathComponent"));
  return 1;
}

uint64_t __30__DYPluginLoader__loadBundle___block_invoke()
{
  v0 = getenv("LD_LIBRARY_PATH");
  uint64_t XcodeSelectDeveloperPath = GetXcodeSelectDeveloperPath();
  if (v0 && *v0) {
    v2 = (void *)[NSString stringWithFormat:@"%s:%@/../SharedFrameworks/", v0, XcodeSelectDeveloperPath];
  }
  else {
    v2 = (void *)[NSString stringWithFormat:@"%@/../SharedFrameworks/", XcodeSelectDeveloperPath, v5];
  }
  objc_super v3 = (const char *)[v2 UTF8String];
  return setenv("LD_LIBRARY_PATH", v3, 1);
}

void *__30__DYPluginLoader__loadBundle___block_invoke_2()
{
  v0 = (const char *)[(id)objc_msgSend(NSString stringWithFormat:@"%@/../SharedFrameworks/LLDB.framework/LLDB", GetXcodeSelectDeveloperPath()), "UTF8String"];
  return dlopen(v0, 1);
}

- (id)_loadPluginsInDirectory:(id)a3 pathExtension:(id)a4 matchingRegex:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  long long v22 = (void *)[MEMORY[0x263EFF9C0] set];
  uint64_t v9 = objc_opt_new();
  uint64_t v10 = *MEMORY[0x263EFF6A8];
  long long v21 = v9;
  v11 = objc_msgSend(v9, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", a3, objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", *MEMORY[0x263EFF750], *MEMORY[0x263EFF6A8], 0), 0, 0);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v25;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v25 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v24 + 1) + 8 * v15);
        id v23 = 0;
        objc_msgSend(v16, "getResourceValue:forKey:error:", &v23, v10, 0, v20);
        if (objc_msgSend((id)objc_msgSend(v16, "pathExtension"), "isEqualToString:", a4)
          && [v23 BOOLValue]
          && (!a5
           || objc_msgSend(a5, "numberOfMatchesInString:options:range:", objc_msgSend(v16, "lastPathComponent"), 0, 0, objc_msgSend((id)objc_msgSend(v16, "lastPathComponent"), "length")))&& (-[NSMutableSet containsObject:](self->_loadedPluginNames, "containsObject:", objc_msgSend(v16, "lastPathComponent")) & 1) == 0)
        {
          uint64_t v17 = [MEMORY[0x263F086E0] bundleWithURL:v16];
          if (v17)
          {
            long long v18 = (void *)v17;
            if ([(DYPluginLoader *)self _loadBundle:v17]) {
              objc_msgSend(v22, "addObject:", objc_msgSend((id)objc_msgSend(v18, "bundleURL"), "lastPathComponent"));
            }
          }
          else
          {
            uint64_t v20 = objc_msgSend((id)objc_msgSend(v16, "path"), "UTF8String");
            DYLog();
          }
        }
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v13);
  }

  return v22;
}

- (id)_loadPluginsWithProvider:(id)a3 pathExtension:(id)a4
{
  return [(DYPluginLoader *)self _loadPluginsWithProvider:a3 pathExtension:a4 matchingRegex:0];
}

- (id)_loadPluginsWithProvider:(id)a3 pathExtension:(id)a4 matchingRegex:(id)a5
{
  if (!a3) {
    -[DYPluginLoader _loadPluginsWithProvider:pathExtension:matchingRegex:]();
  }
  if (!a4) {
    -[DYPluginLoader _loadPluginsWithProvider:pathExtension:matchingRegex:]();
  }
  uint64_t v9 = [MEMORY[0x263EFF9C0] set];
  uint64_t v10 = (void *)v9;
  if (!self->_loading)
  {
    self->_loading = 1;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __71__DYPluginLoader__loadPluginsWithProvider_pathExtension_matchingRegex___block_invoke;
    v12[3] = &unk_265333D70;
    v12[4] = v9;
    v12[5] = self;
    v12[6] = a4;
    v12[7] = a5;
    [a3 enumerateDirectories:v12];
    self->_loading = 0;
  }
  return v10;
}

uint64_t __71__DYPluginLoader__loadPluginsWithProvider_pathExtension_matchingRegex___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) _loadPluginsInDirectory:a2 pathExtension:*(void *)(a1 + 48) matchingRegex:*(void *)(a1 + 56)];
  return [v2 unionSet:v3];
}

+ (void)loadGPUToolsPluginsInMainBundleOnly:.cold.1()
{
}

- (void)_loadBundle:.cold.1()
{
}

- (void)_loadPluginsWithProvider:pathExtension:matchingRegex:.cold.1()
{
}

- (void)_loadPluginsWithProvider:pathExtension:matchingRegex:.cold.2()
{
}

@end