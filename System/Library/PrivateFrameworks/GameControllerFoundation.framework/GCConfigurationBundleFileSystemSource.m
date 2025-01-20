@interface GCConfigurationBundleFileSystemSource
- (GCConfigurationBundleFileSystemSource)init;
- (id)configurationBundleURLsForType:(id)a3;
@end

@implementation GCConfigurationBundleFileSystemSource

- (GCConfigurationBundleFileSystemSource)init
{
  v6.receiver = self;
  v6.super_class = (Class)GCConfigurationBundleFileSystemSource;
  v2 = [(GCConfigurationBundleFileSystemSource *)&v6 init];
  uint64_t v3 = gc_log_create_configuration("Filesystem");
  log = v2->_log;
  v2->_log = (OS_os_log *)v3;

  return v2;
}

- (id)configurationBundleURLsForType:(id)a3
{
  v4 = objc_opt_new();
  v5 = +[NSFileManager defaultManager];
  v21 = +[NSBundle bundleForClass:objc_opt_class()];
  objc_super v6 = [v21 resourceURL];
  v7 = [v6 path];
  uint64_t v8 = [v7 stringByResolvingSymlinksInPath];

  v20 = (void *)v8;
  v9 = +[NSURL fileURLWithPath:v8];

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
    -[GCConfigurationBundleFileSystemSource configurationBundleURLsForType:](log, v9);
  }
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = __72__GCConfigurationBundleFileSystemSource_configurationBundleURLsForType___block_invoke;
  v27[3] = &unk_26BEC3B10;
  v27[4] = self;
  v22 = v5;
  v11 = [v5 enumeratorAtURL:v9 includingPropertiesForKeys:&__NSArray0__struct options:7 errorHandler:v27];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v30 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v24 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        v17 = self->_log;
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
          -[GCConfigurationBundleFileSystemSource configurationBundleURLsForType:](v28, v17, v16, &v29);
        }
        [v4 addObject:v16];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v30 count:16];
    }
    while (v13);
  }

  v18 = +[GCFuture futureWithResult:v4];

  return v18;
}

uint64_t __72__GCConfigurationBundleFileSystemSource_configurationBundleURLsForType___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v5 = *(NSObject **)(*(void *)(a1 + 32) + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __72__GCConfigurationBundleFileSystemSource_configurationBundleURLsForType___block_invoke_cold_1((uint64_t)v4, v5);
  }

  return 1;
}

- (void).cxx_destruct
{
}

- (void)configurationBundleURLsForType:(void *)a3 .cold.1(uint8_t *a1, void *a2, void *a3, void *a4)
{
  v7 = a2;
  uint64_t v8 = [a3 path];
  *(_DWORD *)a1 = 138412290;
  *a4 = v8;
  _os_log_debug_impl(&dword_20AD04000, v7, OS_LOG_TYPE_DEBUG, "    %@", a1, 0xCu);
}

- (void)configurationBundleURLsForType:(void *)a1 .cold.2(void *a1, void *a2)
{
  uint64_t v3 = a1;
  id v4 = [a2 path];
  int v5 = 138543362;
  objc_super v6 = v4;
  _os_log_debug_impl(&dword_20AD04000, v3, OS_LOG_TYPE_DEBUG, "Checking '%{public}@'...", (uint8_t *)&v5, 0xCu);
}

void __72__GCConfigurationBundleFileSystemSource_configurationBundleURLsForType___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_20AD04000, a2, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v2, 0xCu);
}

@end