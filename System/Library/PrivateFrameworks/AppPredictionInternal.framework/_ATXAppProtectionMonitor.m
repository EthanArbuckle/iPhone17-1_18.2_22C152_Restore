@interface _ATXAppProtectionMonitor
+ (id)sharedInstance;
- (APSubjectMonitorSubscription)appProtectionSubjectMonitorSubscription;
- (_ATXAppProtectionMonitor)init;
- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4;
- (void)dealloc;
@end

@implementation _ATXAppProtectionMonitor

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6_35 != -1) {
    dispatch_once(&sharedInstance__pasOnceToken6_35, &__block_literal_global_193);
  }
  v2 = (void *)sharedInstance__pasExprOnceResult_46;
  return v2;
}

- (_ATXAppProtectionMonitor)init
{
  v8.receiver = self;
  v8.super_class = (Class)_ATXAppProtectionMonitor;
  v2 = [(_ATXAppProtectionMonitor *)&v8 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F4B800] subjectMonitorRegistry];
    v4 = [v3 addMonitor:v2 subjectMask:1];
    objc_storeWeak((id *)&v2->_appProtectionSubjectMonitorSubscription, v4);

    v5 = __atxlog_handle_default();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1D0FA3000, v5, OS_LOG_TYPE_DEFAULT, "_ATXAppProtectionMonitor initialized", v7, 2u);
    }
  }
  return v2;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appProtectionSubjectMonitorSubscription);
  [WeakRetained invalidate];

  v4.receiver = self;
  v4.super_class = (Class)_ATXAppProtectionMonitor;
  [(_ATXAppProtectionMonitor *)&v4 dealloc];
}

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73___ATXAppProtectionMonitor_appProtectionSubjectsChanged_forSubscription___block_invoke;
  block[3] = &unk_1E68AC320;
  id v12 = v7;
  v13 = self;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

- (APSubjectMonitorSubscription)appProtectionSubjectMonitorSubscription
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appProtectionSubjectMonitorSubscription);
  return (APSubjectMonitorSubscription *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end