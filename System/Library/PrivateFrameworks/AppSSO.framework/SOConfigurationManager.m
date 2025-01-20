@interface SOConfigurationManager
+ (id)defaultManager;
+ (void)defaultManager;
- (SOConfigurationManager)init;
- (void)saveConfigurationData:(id)a3 completion:(id)a4;
@end

@implementation SOConfigurationManager

+ (id)defaultManager
{
  if (defaultManager_onceToken != -1) {
    dispatch_once(&defaultManager_onceToken, &__block_literal_global_6);
  }
  v2 = (void *)defaultManager_manager;
  if (!defaultManager_manager)
  {
    v3 = SO_LOG_SOConfigurationManager();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      +[SOConfigurationManager defaultManager](v3);
    }

    v2 = (void *)defaultManager_manager;
  }
  return v2;
}

uint64_t __40__SOConfigurationManager_defaultManager__block_invoke()
{
  defaultManager_manager = objc_alloc_init(SOConfigurationManager);
  return MEMORY[0x270F9A758]();
}

- (SOConfigurationManager)init
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v3 = SO_LOG_SOConfigurationManager();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v7 = "-[SOConfigurationManager init]";
    __int16 v8 = 2112;
    v9 = self;
    _os_log_impl(&dword_2185C9000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  v5.receiver = self;
  v5.super_class = (Class)SOConfigurationManager;
  return [(SOConfigurationManager *)&v5 init];
}

- (void)saveConfigurationData:(id)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = SO_LOG_SOConfigurationManager();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[SOConfigurationManager saveConfigurationData:completion:]";
    __int16 v17 = 2112;
    v18 = self;
    _os_log_impl(&dword_2185C9000, v8, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  v9 = dispatch_get_global_queue(0, 0);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __59__SOConfigurationManager_saveConfigurationData_completion___block_invoke;
  v12[3] = &unk_26432A4B8;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, v12);
}

void __59__SOConfigurationManager_saveConfigurationData_completion___block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(SOConfigurationHost);
  uint64_t v3 = *(void *)(a1 + 32);
  id v6 = 0;
  [(SOConfigurationHost *)v2 saveConfiguration:v3 error:&v6];
  id v4 = v6;
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, BOOL, id))(v5 + 16))(v5, v4 == 0, v4);
  }
}

+ (void)defaultManager
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2185C9000, log, OS_LOG_TYPE_ERROR, "no SOConfigurationManager!", v1, 2u);
}

@end