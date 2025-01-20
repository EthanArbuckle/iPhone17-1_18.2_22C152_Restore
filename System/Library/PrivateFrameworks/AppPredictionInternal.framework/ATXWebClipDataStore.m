@interface ATXWebClipDataStore
- (ATXAppClipLaunchListenerProtocol)appClipUsageUpdateListener;
- (ATXWebClipDataStore)init;
- (ATXWebClipDataStore)initWithDataStore:(id)a3;
- (ATXWebClipDataStore)initWithDataStore:(id)a3 contextUpdateListener:(id)a4;
- (_ATXDataStore)dataStore;
- (id)webClipBundleIdsForAppClip:(id)a3;
- (void)updateWithUsageEvent:(id)a3;
@end

@implementation ATXWebClipDataStore

- (ATXWebClipDataStore)init
{
  v3 = +[_ATXDataStore sharedInstance];
  v4 = objc_opt_new();
  v5 = [(ATXWebClipDataStore *)self initWithDataStore:v3 contextUpdateListener:v4];

  return v5;
}

- (ATXWebClipDataStore)initWithDataStore:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  v6 = [(ATXWebClipDataStore *)self initWithDataStore:v4 contextUpdateListener:v5];

  return v6;
}

- (ATXWebClipDataStore)initWithDataStore:(id)a3 contextUpdateListener:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)ATXWebClipDataStore;
  v9 = [(ATXWebClipDataStore *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dataStore, a3);
    objc_storeStrong((id *)&v10->_appClipUsageUpdateListener, a4);
    objc_initWeak(&location, v10);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __63__ATXWebClipDataStore_initWithDataStore_contextUpdateListener___block_invoke;
    v12[3] = &unk_1E68ACB58;
    objc_copyWeak(&v13, &location);
    [v8 startListeningWithCallback:v12 clientId:@"ATXWebClipDataStore"];
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

  return v10;
}

void __63__ATXWebClipDataStore_initWithDataStore_contextUpdateListener___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained updateWithUsageEvent:v3];
}

- (void)updateWithUsageEvent:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 clipBundleId];
  if (v5)
  {
    v6 = (void *)v5;
    id v7 = [v4 webClipBundleId];

    if (v7)
    {
      id v8 = __atxlog_handle_hero();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = [v4 webClipBundleId];
        v10 = [v4 clipBundleId];
        int v14 = 138412546;
        objc_super v15 = v9;
        __int16 v16 = 2112;
        v17 = v10;
        _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_DEFAULT, "Recording usage event for %@:%@", (uint8_t *)&v14, 0x16u);
      }
      v11 = [(ATXWebClipDataStore *)self dataStore];
      v12 = [v4 webClipBundleId];
      id v13 = [v4 clipBundleId];
      [v11 writeWebClip:v12 appClip:v13];

      goto LABEL_8;
    }
  }
  v11 = __atxlog_handle_hero();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = [v4 parentAppBundleId];
    int v14 = 138412290;
    objc_super v15 = v12;
    _os_log_impl(&dword_1D0FA3000, v11, OS_LOG_TYPE_DEFAULT, "Not recording usage event for %@", (uint8_t *)&v14, 0xCu);
LABEL_8:
  }
}

- (id)webClipBundleIdsForAppClip:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ATXWebClipDataStore *)self dataStore];
  v6 = [v5 webClipsForAppClipBundleId:v4];

  return v6;
}

- (_ATXDataStore)dataStore
{
  return self->_dataStore;
}

- (ATXAppClipLaunchListenerProtocol)appClipUsageUpdateListener
{
  return self->_appClipUsageUpdateListener;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appClipUsageUpdateListener, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
}

@end