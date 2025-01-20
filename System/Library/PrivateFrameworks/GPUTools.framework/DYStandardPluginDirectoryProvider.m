@interface DYStandardPluginDirectoryProvider
+ (id)_developerDirectory;
- (DYStandardPluginDirectoryProvider)init;
- (DYStandardPluginDirectoryProvider)initWithBundle:(id)a3 includeDeveloperDirectory:(BOOL)a4 includeBundleDirectory:(BOOL)a5;
- (void)dealloc;
- (void)enumerateDirectories:(id)a3;
@end

@implementation DYStandardPluginDirectoryProvider

+ (id)_developerDirectory
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__DYStandardPluginDirectoryProvider__developerDirectory__block_invoke;
  block[3] = &unk_265333698;
  block[4] = a1;
  if (_developerDirectory_once != -1) {
    dispatch_once(&_developerDirectory_once, block);
  }
  return (id)_developerDirectory_s_developerDirectory;
}

void __56__DYStandardPluginDirectoryProvider__developerDirectory__block_invoke(uint64_t a1)
{
  uint64_t v1 = [MEMORY[0x263F086E0] bundleForClass:*(void *)(a1 + 32)];
  if (!v1) {
    __56__DYStandardPluginDirectoryProvider__developerDirectory__block_invoke_cold_1();
  }
  v2 = (void *)v1;
  id v6 = (id)objc_opt_new();
  v3 = getenv("GT_DEVELOPER_DIR");
  if ((v3 || (v3 = getenv("XCODE_DEVELOPER_DIR_PATH")) != 0)
    && objc_msgSend(v6, "fileExistsAtPath:", objc_msgSend(NSString, "stringWithUTF8String:", v3)))
  {
    v4 = objc_msgSend(NSURL, "fileURLWithPath:", objc_msgSend((id)objc_msgSend(v6, "stringWithFileSystemRepresentation:length:", v3, strlen(v3)), "stringByStandardizingPath"));
  }
  else
  {
    v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v2, "bundleURL"), "URLByDeletingLastPathComponent"), "URLByDeletingLastPathComponent"), "URLByAppendingPathComponent:", @"Developer");
  }
  v5 = v4;
  if (objc_msgSend(v6, "fileExistsAtPath:", objc_msgSend(v4, "path"))) {
    _developerDirectory_s_developerDirectory = [v5 copy];
  }
}

- (DYStandardPluginDirectoryProvider)init
{
  return 0;
}

- (DYStandardPluginDirectoryProvider)initWithBundle:(id)a3 includeDeveloperDirectory:(BOOL)a4 includeBundleDirectory:(BOOL)a5
{
  v10.receiver = self;
  v10.super_class = (Class)DYStandardPluginDirectoryProvider;
  v8 = [(DYPluginDirectoryProvider *)&v10 init];
  if (v8)
  {
    v8->_bundle = (NSBundle *)a3;
    v8->_includeDeveloperDirectory = a4;
    v8->_includeBundleDirectory = a5;
    v8->super._developerDirectory = (NSURL *)[(id)objc_opt_class() _developerDirectory];
  }
  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)DYStandardPluginDirectoryProvider;
  [(DYStandardPluginDirectoryProvider *)&v3 dealloc];
}

- (void)enumerateDirectories:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v5 = objc_opt_new();
  id v6 = [(NSURL *)[(NSBundle *)self->_bundle bundleURL] URLByStandardizingPath];
  if (self->_includeBundleDirectory) {
    (*((void (**)(id, NSURL *))a3 + 2))(a3, v6);
  }
  (*((void (**)(id, NSURL *))a3 + 2))(a3, [(NSURL *)[(NSBundle *)self->_bundle builtInPlugInsURL] URLByStandardizingPath]);
  if (getenv("GT_SIBLING_PLUGINS")) {
    (*((void (**)(id, NSURL *))a3 + 2))(a3, [(NSURL *)v6 URLByDeletingLastPathComponent]);
  }
  if (self->_includeDeveloperDirectory)
  {
    if (self->super._developerDirectory)
    {
      id v7 = [(NSDictionary *)[(NSBundle *)self->_bundle infoDictionary] objectForKey:@"CFBundleName"];
      id v8 = [(DYPluginDirectoryProvider *)self getPlatformDirectoriesWithBundleName:v7];
      (*((void (**)(id, NSURL *))a3 + 2))(a3, -[NSURL URLByAppendingPathComponent:](self->super._developerDirectory, "URLByAppendingPathComponent:", [NSString stringWithFormat:@"Library/%@/PlugIns", v7]));
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v14;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v14 != v11) {
              objc_enumerationMutation(v8);
            }
            (*((void (**)(id, void))a3 + 2))(a3, *(void *)(*((void *)&v13 + 1) + 8 * i));
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v10);
      }
    }
  }
}

void __56__DYStandardPluginDirectoryProvider__developerDirectory__block_invoke_cold_1()
{
}

@end