@interface CLFAppAvailabilityChecker
+ (CLFAppAvailabilityChecker)sharedInstance;
- (BOOL)isAppAvailableForBundleIdentifier:(id)a3;
- (BOOL)isHiddenByUserForBundleIdentifier:(id)a3;
- (BOOL)requiresPreflightForBundleIdentifier:(id)a3;
- (CLFAppAvailabilityChecker)init;
- (PDCPreflightManager)privacyPreflightManager;
- (id)clarityBundleIdentifierForStandardBundleIdentifier:(id)a3;
- (id)observeUpdatesWithHandler:(id)a3;
- (id)standardBundleIdentifierForClarityBundleIdentifier:(id)a3;
@end

@implementation CLFAppAvailabilityChecker

+ (CLFAppAvailabilityChecker)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1) {
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_5);
  }
  v2 = (void *)sharedInstance_SharedInstance;
  return (CLFAppAvailabilityChecker *)v2;
}

uint64_t __43__CLFAppAvailabilityChecker_sharedInstance__block_invoke()
{
  sharedInstance_SharedInstance = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (CLFAppAvailabilityChecker)init
{
  v9.receiver = self;
  v9.super_class = (Class)CLFAppAvailabilityChecker;
  v2 = [(CLFAppAvailabilityChecker *)&v9 init];
  if (v2)
  {
    uint64_t v11 = 0;
    v12 = &v11;
    uint64_t v13 = 0x2050000000;
    v3 = (void *)getPDCPreflightManagerClass_softClass;
    uint64_t v14 = getPDCPreflightManagerClass_softClass;
    if (!getPDCPreflightManagerClass_softClass)
    {
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __getPDCPreflightManagerClass_block_invoke;
      v10[3] = &unk_2642F3758;
      v10[4] = &v11;
      __getPDCPreflightManagerClass_block_invoke((uint64_t)v10);
      v3 = (void *)v12[3];
    }
    v4 = v3;
    _Block_object_dispose(&v11, 8);
    id v5 = [v4 alloc];
    uint64_t v6 = [v5 initWithTargetQueue:MEMORY[0x263EF83A0]];
    privacyPreflightManager = v2->_privacyPreflightManager;
    v2->_privacyPreflightManager = (PDCPreflightManager *)v6;
  }
  return v2;
}

- (BOOL)isAppAvailableForBundleIdentifier:(id)a3
{
  id v4 = a3;
  if ([(CLFAppAvailabilityChecker *)self requiresPreflightForBundleIdentifier:v4])
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    BOOL v5 = ![(CLFAppAvailabilityChecker *)self isHiddenByUserForBundleIdentifier:v4];
  }

  return v5;
}

- (BOOL)requiresPreflightForBundleIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2050000000;
  BOOL v5 = (void *)getLSApplicationRecordClass_softClass;
  uint64_t v19 = getLSApplicationRecordClass_softClass;
  if (!getLSApplicationRecordClass_softClass)
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __getLSApplicationRecordClass_block_invoke;
    v15[3] = &unk_2642F3758;
    v15[4] = &v16;
    __getLSApplicationRecordClass_block_invoke((uint64_t)v15);
    BOOL v5 = (void *)v17[3];
  }
  uint64_t v6 = v5;
  _Block_object_dispose(&v16, 8);
  id v7 = [v6 alloc];
  v8 = [(CLFAppAvailabilityChecker *)self standardBundleIdentifierForClarityBundleIdentifier:v4];
  id v14 = 0;
  objc_super v9 = (void *)[v7 initWithBundleIdentifier:v8 allowPlaceholder:0 error:&v14];
  id v10 = v14;

  if (v10)
  {
    uint64_t v11 = +[CLFLog commonLog];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      [(CLFAppAvailabilityChecker *)(uint64_t)v4 requiresPreflightForBundleIdentifier:v11];
    }
  }
  else
  {
    if (v9)
    {
      uint64_t v11 = [(CLFAppAvailabilityChecker *)self privacyPreflightManager];
      char v12 = [v11 requiresPreflightForApplicationRecord:v9];
      goto LABEL_9;
    }
    uint64_t v11 = +[CLFLog commonLog];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[CLFAppAvailabilityChecker requiresPreflightForBundleIdentifier:]((uint64_t)v4, v11);
    }
  }
  char v12 = 0;
LABEL_9:

  return v12;
}

- (BOOL)isHiddenByUserForBundleIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2050000000;
  BOOL v5 = (void *)getAPApplicationClass_softClass;
  uint64_t v15 = getAPApplicationClass_softClass;
  if (!getAPApplicationClass_softClass)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __getAPApplicationClass_block_invoke;
    v11[3] = &unk_2642F3758;
    v11[4] = &v12;
    __getAPApplicationClass_block_invoke((uint64_t)v11);
    BOOL v5 = (void *)v13[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v12, 8);
  id v7 = [(CLFAppAvailabilityChecker *)self standardBundleIdentifierForClarityBundleIdentifier:v4];
  v8 = [v6 applicationWithBundleIdentifier:v7];
  char v9 = [v8 isHidden];

  return v9;
}

- (id)standardBundleIdentifierForClarityBundleIdentifier:(id)a3
{
  return (id)MEMORY[0x270F90B08](a3, a2);
}

- (id)clarityBundleIdentifierForStandardBundleIdentifier:(id)a3
{
  return (id)MEMORY[0x270F90678](a3, a2);
}

- (id)observeUpdatesWithHandler:(id)a3
{
  id v3 = a3;
  id v4 = [[_CLFAppAvailabilityObserver alloc] initWithHandler:v3];

  return v4;
}

- (PDCPreflightManager)privacyPreflightManager
{
  return self->_privacyPreflightManager;
}

- (void).cxx_destruct
{
}

- (void)requiresPreflightForBundleIdentifier:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_217F54000, a2, OS_LOG_TYPE_ERROR, "Unable to look up record for application with bundle identifier %@, but no error was provided.", (uint8_t *)&v2, 0xCu);
}

- (void)requiresPreflightForBundleIdentifier:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_217F54000, log, OS_LOG_TYPE_ERROR, "Error getting application record for app with identifier %@: %@", (uint8_t *)&v3, 0x16u);
}

@end