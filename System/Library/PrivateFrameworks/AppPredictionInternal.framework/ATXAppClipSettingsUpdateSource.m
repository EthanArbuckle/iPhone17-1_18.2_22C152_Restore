@interface ATXAppClipSettingsUpdateSource
- (ATXAppClipSettingsUpdateSource)init;
- (ATXUpdatePredictionsDelegate)delegate;
- (void)handleSiriSettingsChangedNotification;
- (void)registerSiriSettingsChangedNotificationHandler;
- (void)setDelegate:(id)a3;
@end

@implementation ATXAppClipSettingsUpdateSource

uint64_t __80__ATXAppClipSettingsUpdateSource_registerSiriSettingsChangedNotificationHandler__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleSiriSettingsChangedNotification];
}

- (void)handleSiriSettingsChangedNotification
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = (void *)CFPreferencesCopyAppValue(@"SuggestionsSuggestAppClips", @"com.apple.suggestions");
  v4 = v3;
  if (v3) {
    int v5 = [v3 BOOLValue];
  }
  else {
    int v5 = 1;
  }

  v6 = __atxlog_handle_default();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (objc_class *)objc_opt_class();
    uint64_t v8 = NSStringFromClass(v7);
    v9 = (void *)v8;
    v10 = @"NO";
    if (v5) {
      v10 = @"YES";
    }
    int v14 = 138412546;
    uint64_t v15 = v8;
    __int16 v16 = 2112;
    v17 = v10;
    _os_log_impl(&dword_1D0FA3000, v6, OS_LOG_TYPE_DEFAULT, "%@ - got siri settings notification, canSuggestAppClips is: %@", (uint8_t *)&v14, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v12 = WeakRetained;
  if (v5) {
    [WeakRetained tryUpdatePredictionsDefaultIntervalWithReason:4];
  }
  else {
    [WeakRetained forceUpdatePredictionsImmediatelyWithReason:4];
  }

  v13 = +[ATXAppDirectoryOrderingProvider sharedInstance];
  [v13 updateRecents];
}

- (ATXAppClipSettingsUpdateSource)init
{
  v9.receiver = self;
  v9.super_class = (Class)ATXAppClipSettingsUpdateSource;
  v2 = [(ATXAppClipSettingsUpdateSource *)&v9 init];
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    Name = class_getName(v3);
    int v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create(Name, v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;
  }
  [(ATXAppClipSettingsUpdateSource *)v2 registerSiriSettingsChangedNotificationHandler];
  return v2;
}

- (void)registerSiriSettingsChangedNotificationHandler
{
  queue = self->_queue;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __80__ATXAppClipSettingsUpdateSource_registerSiriSettingsChangedNotificationHandler__block_invoke;
  handler[3] = &unk_1E68AC2F8;
  handler[4] = self;
  notify_register_dispatch("com.apple.suggestions.settingsChanged", &self->_token, queue, handler);
}

- (ATXUpdatePredictionsDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ATXUpdatePredictionsDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end