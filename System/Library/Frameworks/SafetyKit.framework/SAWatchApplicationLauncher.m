@interface SAWatchApplicationLauncher
- (SAWatchApplicationLauncher)init;
- (void)openApplicationInBackgroundWithBundleId:(id)a3 withReason:(int64_t)a4 completion:(id)a5;
@end

@implementation SAWatchApplicationLauncher

- (SAWatchApplicationLauncher)init
{
  v3.receiver = self;
  v3.super_class = (Class)SAWatchApplicationLauncher;
  return [(SAWatchApplicationLauncher *)&v3 init];
}

- (void)openApplicationInBackgroundWithBundleId:(id)a3 withReason:(int64_t)a4 completion:(id)a5
{
  id v6 = a3;
  id v7 = a5;
  v8 = sa_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[SAWatchApplicationLauncher openApplicationInBackgroundWithBundleId:withReason:completion:]((uint64_t)v6, v8);
  }

  if (v7) {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
}

- (void)openApplicationInBackgroundWithBundleId:(uint64_t)a1 withReason:(NSObject *)a2 completion:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  objc_super v3 = "-[SAWatchApplicationLauncher openApplicationInBackgroundWithBundleId:withReason:completion:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_245182000, a2, OS_LOG_TYPE_ERROR, "%s - attempted to use watch launcher on non watch platform, bundleId: %@", (uint8_t *)&v2, 0x16u);
}

@end