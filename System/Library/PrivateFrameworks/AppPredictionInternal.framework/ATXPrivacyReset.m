@interface ATXPrivacyReset
+ (id)sharedInstance;
- (ATXPrivacyReset)init;
- (BOOL)_placeholderExists;
- (id)_placeholderPath;
- (void)_handlePrivacyResetNotification;
- (void)_registerForResetPrivacyWarningsNotification;
- (void)_removeAllAppActionData;
- (void)_removeAllBlendingUICaches;
- (void)_writeDeletionPlaceholder;
- (void)dealloc;
@end

@implementation ATXPrivacyReset

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6_32 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken6_32, &__block_literal_global_182);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_42;
  return v2;
}

void __33__ATXPrivacyReset_sharedInstance__block_invoke()
{
  v0 = (void *)MEMORY[0x1D25F6CC0]();
  uint64_t v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_42;
  sharedInstance__pasExprOnceResult_42 = v1;
}

- (ATXPrivacyReset)init
{
  v5.receiver = self;
  v5.super_class = (Class)ATXPrivacyReset;
  v2 = [(ATXPrivacyReset *)&v5 init];
  v3 = v2;
  if (v2)
  {
    if ([(ATXPrivacyReset *)v2 _placeholderExists]) {
      [(ATXPrivacyReset *)v3 _removeAllAppActionData];
    }
    [(ATXPrivacyReset *)v3 _registerForResetPrivacyWarningsNotification];
  }
  return v3;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self->_resetPrivacyWarningsNotificationToken];

  v4.receiver = self;
  v4.super_class = (Class)ATXPrivacyReset;
  [(ATXPrivacyReset *)&v4 dealloc];
}

- (id)_placeholderPath
{
  v2 = [MEMORY[0x1E4F4B650] appPredictionDirectory];
  v3 = [v2 stringByAppendingPathComponent:@"ATXPrivacyResetTriggered"];

  return v3;
}

- (BOOL)_placeholderExists
{
  v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  objc_super v4 = [(ATXPrivacyReset *)self _placeholderPath];
  char v5 = [v3 fileExistsAtPath:v4];

  return v5;
}

- (void)_registerForResetPrivacyWarningsNotification
{
  if (!self->_resetPrivacyWarningsNotificationToken)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __63__ATXPrivacyReset__registerForResetPrivacyWarningsNotification__block_invoke;
    v6[3] = &unk_1E68AE6E8;
    v6[4] = self;
    objc_super v4 = [v3 addObserverForName:@"com.apple.Preferences.ResetPrivacyWarningsNotification" object:0 queue:0 usingBlock:v6];
    id resetPrivacyWarningsNotificationToken = self->_resetPrivacyWarningsNotificationToken;
    self->_id resetPrivacyWarningsNotificationToken = v4;
  }
}

void __63__ATXPrivacyReset__registerForResetPrivacyWarningsNotification__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) _handlePrivacyResetNotification];
  exit(0);
}

- (void)_handlePrivacyResetNotification
{
  id v3 = (id)objc_opt_new();
  [v3 synchronouslyRelinquishOnDiskResourcesAheadOfDataDeletionWithCompletionHandler:&__block_literal_global_20];
  [(ATXPrivacyReset *)self _writeDeletionPlaceholder];
  [(ATXPrivacyReset *)self _removeAllBlendingUICaches];
}

void __50__ATXPrivacyReset__handlePrivacyResetNotification__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = __atxlog_handle_default();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __50__ATXPrivacyReset__handlePrivacyResetNotification__block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
}

- (void)_writeDeletionPlaceholder
{
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v3 = [(ATXPrivacyReset *)self _placeholderPath];
  [v4 createFileAtPath:v3 contents:0 attributes:0];
}

- (void)_removeAllBlendingUICaches
{
}

- (void)_removeAllAppActionData
{
}

- (void).cxx_destruct
{
}

void __50__ATXPrivacyReset__handlePrivacyResetNotification__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end