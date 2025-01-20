@interface DYToolsPluginDirectoryProvider
- (DYToolsPluginDirectoryProvider)init;
- (DYToolsPluginDirectoryProvider)initWithDeveloperPath:(id)a3 includePrivatePlugins:(BOOL)a4;
- (void)enumerateDirectories:(id)a3;
@end

@implementation DYToolsPluginDirectoryProvider

- (DYToolsPluginDirectoryProvider)init
{
  return 0;
}

- (DYToolsPluginDirectoryProvider)initWithDeveloperPath:(id)a3 includePrivatePlugins:(BOOL)a4
{
  v8.receiver = self;
  v8.super_class = (Class)DYToolsPluginDirectoryProvider;
  v6 = [(DYPluginDirectoryProvider *)&v8 init];
  if (v6)
  {
    v6->super._developerDirectory = (NSURL *)[NSURL URLWithString:a3];
    v6->_toolsPluginBundle = (NSString *)@"GPUToolsPlatform";
    v6->_toolsPrivatePluginBundle = (NSString *)@"GPUToolsPlatformPrivate";
    v6->_includePrivatePlugins = a4;
  }
  return v6;
}

- (void)enumerateDirectories:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v5 = objc_opt_new();
  objc_msgSend(v5, "addObjectsFromArray:", -[DYPluginDirectoryProvider getPlatformDirectoriesWithBundleName:](self, "getPlatformDirectoriesWithBundleName:", self->_toolsPluginBundle));
  if (self->_includePrivatePlugins) {
    objc_msgSend(v5, "addObjectsFromArray:", -[DYPluginDirectoryProvider getPlatformDirectoriesWithBundleName:](self, "getPlatformDirectoriesWithBundleName:", self->_toolsPrivatePluginBundle));
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        (*((void (**)(id, void))a3 + 2))(a3, *(void *)(*((void *)&v10 + 1) + 8 * i));
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

@end