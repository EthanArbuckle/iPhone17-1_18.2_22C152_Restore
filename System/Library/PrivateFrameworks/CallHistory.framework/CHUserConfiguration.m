@interface CHUserConfiguration
+ (id)registeredDefaults;
+ (id)userDefaults;
- (BOOL)propertyNameForKeyPath:(id)a3;
- (CHUserConfiguration)init;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setKeepCallsTimeIntervalType:(int64_t)a3;
- (void)synchronize;
@end

@implementation CHUserConfiguration

+ (id)registeredDefaults
{
  if (registeredDefaults_onceToken != -1) {
    dispatch_once(&registeredDefaults_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)registeredDefaults_sRegisteredDefaults;
  return v2;
}

void __41__CHUserConfiguration_registeredDefaults__block_invoke()
{
  v3[2] = *MEMORY[0x1E4F143B8];
  v2[0] = @"cloudKitEnabled";
  v2[1] = @"keepCallsTimeIntervalType";
  v3[0] = MEMORY[0x1E4F1CC38];
  v3[1] = &unk_1F12ABB98;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:2];
  v1 = (void *)registeredDefaults_sRegisteredDefaults;
  registeredDefaults_sRegisteredDefaults = v0;
}

+ (id)userDefaults
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__CHUserConfiguration_userDefaults__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (userDefaults_onceToken_0 != -1) {
    dispatch_once(&userDefaults_onceToken_0, block);
  }
  v2 = (void *)userDefaults_sUserDefaults_0;
  return v2;
}

void __35__CHUserConfiguration_userDefaults__block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F28B50] mainBundle];
  v3 = [v2 bundleIdentifier];
  int v4 = [v3 isEqualToString:@"com.apple.CallHistory"];

  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  }
  else
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.CallHistory"];
  }
  v6 = (void *)userDefaults_sUserDefaults_0;
  userDefaults_sUserDefaults_0 = v5;

  v7 = (void *)userDefaults_sUserDefaults_0;
  id v8 = [*(id *)(a1 + 32) registeredDefaults];
  [v7 registerDefaults:v8];
}

- (CHUserConfiguration)init
{
  v3 = [(id)objc_opt_class() userDefaults];
  [v3 addObserver:self forKeyPath:@"cloudKitEnabled" options:0 context:&CHUserConfigurationKeyValueObserverContext];
  [v3 addObserver:self forKeyPath:@"keepCallsTimeIntervalType" options:0 context:&CHUserConfigurationKeyValueObserverContext];
  v6.receiver = self;
  v6.super_class = (Class)CHUserConfiguration;
  int v4 = [(CHConfiguration *)&v6 initWithDataSource:v3];

  return v4;
}

- (void)dealloc
{
  v3 = [(CHConfiguration *)self dataSource];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    [v4 removeObserver:self forKeyPath:@"cloudKitEnabled" context:&CHUserConfigurationKeyValueObserverContext];
    [v4 removeObserver:self forKeyPath:@"keepCallsTimeIntervalType" context:&CHUserConfigurationKeyValueObserverContext];
  }
  v5.receiver = self;
  v5.super_class = (Class)CHUserConfiguration;
  [(CHUserConfiguration *)&v5 dealloc];
}

- (void)setKeepCallsTimeIntervalType:(int64_t)a3
{
  id v5 = [(CHConfiguration *)self dataSource];
  id v4 = [NSNumber numberWithInteger:a3];
  [v5 setObject:v4 forKey:@"keepCallsTimeIntervalType"];
}

- (void)synchronize
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CAD0] setWithObject:@"keepCallsTimeIntervalType"];
  v3 = ch_framework_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = @"com.apple.CallHistory";
    _os_log_impl(&dword_1B8E4A000, v3, OS_LOG_TYPE_DEFAULT, "Synchronizing user configuration for %{public}@ to Apple Watch", (uint8_t *)&buf, 0xCu);
  }

  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2050000000;
  id v4 = (void *)getNPSManagerClass_softClass;
  uint64_t v10 = getNPSManagerClass_softClass;
  if (!getNPSManagerClass_softClass)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v12 = __getNPSManagerClass_block_invoke;
    v13 = &unk_1E61C75B8;
    v14 = &v7;
    __getNPSManagerClass_block_invoke((uint64_t)&buf);
    id v4 = (void *)v8[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v7, 8);
  id v6 = objc_alloc_init(v5);
  objc_msgSend(v6, "synchronizeUserDefaultsDomain:keys:", @"com.apple.CallHistory", v2, v7);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v11 = ch_framework_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543618;
    id v15 = v9;
    __int16 v16 = 2114;
    id v17 = v10;
    _os_log_impl(&dword_1B8E4A000, v11, OS_LOG_TYPE_DEFAULT, "Received a key-value observing notification for key path (%{public}@) object (%{public}@).", buf, 0x16u);
  }

  if (a6 == &CHUserConfigurationKeyValueObserverContext)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([(CHUserConfiguration *)self propertyNameForKeyPath:v9])
      {
        v12 = [(CHConfiguration *)self delegateController];
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __70__CHUserConfiguration_observeValueForKeyPath_ofObject_change_context___block_invoke;
        v13[3] = &unk_1E61C7590;
        v13[4] = self;
        [v12 enumerateDelegatesUsingBlock:v13];
      }
    }
  }
}

void __70__CHUserConfiguration_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (objc_opt_respondsToSelector())
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __70__CHUserConfiguration_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
    v9[3] = &unk_1E61C7568;
    id v7 = v5;
    uint64_t v8 = *(void *)(a1 + 32);
    id v10 = v7;
    uint64_t v11 = v8;
    dispatch_async(v6, v9);
  }
}

uint64_t __70__CHUserConfiguration_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) propertiesDidChangeForConfiguration:*(void *)(a1 + 40)];
}

- (BOOL)propertyNameForKeyPath:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"cloudKitEnabled"]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 isEqualToString:@"keepCallsTimeIntervalType"];
  }

  return v4;
}

@end