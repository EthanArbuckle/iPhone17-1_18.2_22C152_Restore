@interface ATXManagedConfigurationUpdateSource
- (ATXManagedConfigurationUpdateSource)init;
- (ATXManagedConfigurationUpdateSource)initWithProfileConnection:(id)a3;
- (ATXUpdatePredictionsDelegate)delegate;
- (MCProfileConnection)profileConnection;
- (void)_registerForRestrictionChangedNotifications;
- (void)handleProfileChangedNotification;
- (void)setDelegate:(id)a3;
- (void)setProfileConnection:(id)a3;
@end

@implementation ATXManagedConfigurationUpdateSource

- (ATXManagedConfigurationUpdateSource)init
{
  v3 = [MEMORY[0x1E4F74230] sharedConnection];
  v4 = [(ATXManagedConfigurationUpdateSource *)self initWithProfileConnection:v3];

  return v4;
}

- (ATXManagedConfigurationUpdateSource)initWithProfileConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXManagedConfigurationUpdateSource;
  v6 = [(ATXManagedConfigurationUpdateSource *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_profileConnection, a3);
    [(ATXManagedConfigurationUpdateSource *)v7 _registerForRestrictionChangedNotifications];
  }

  return v7;
}

- (void)_registerForRestrictionChangedNotifications
{
  if (!self->_restrictionChangedNotificationToken)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v4 = *MEMORY[0x1E4F741F0];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __82__ATXManagedConfigurationUpdateSource__registerForRestrictionChangedNotifications__block_invoke;
    v7[3] = &unk_1E68AE6E8;
    v7[4] = self;
    id v5 = [v3 addObserverForName:v4 object:0 queue:0 usingBlock:v7];
    id restrictionChangedNotificationToken = self->_restrictionChangedNotificationToken;
    self->_id restrictionChangedNotificationToken = v5;
  }
}

uint64_t __82__ATXManagedConfigurationUpdateSource__registerForRestrictionChangedNotifications__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleProfileChangedNotification];
}

- (void)handleProfileChangedNotification
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int v3 = [(MCProfileConnection *)self->_profileConnection isAppClipsAllowed];
  [(MCProfileConnection *)self->_profileConnection invalidateRestrictionCache];
  uint64_t v4 = __atxlog_handle_default();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = NSStringFromClass(v5);
    v7 = (void *)v6;
    v8 = @"NO";
    if (v3) {
      v8 = @"YES";
    }
    int v12 = 138412546;
    uint64_t v13 = v6;
    __int16 v14 = 2112;
    v15 = v8;
    _os_log_impl(&dword_1D0FA3000, v4, OS_LOG_TYPE_DEFAULT, "%@ - MCProfileConnection isAppClipsAllowed status changed to: %@", (uint8_t *)&v12, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v10 = WeakRetained;
  if (v3) {
    [WeakRetained tryUpdatePredictionsDefaultIntervalWithReason:19];
  }
  else {
    [WeakRetained forceUpdatePredictionsImmediatelyWithReason:19];
  }

  v11 = +[ATXAppDirectoryOrderingProvider sharedInstance];
  [v11 updateRecents];
}

- (ATXUpdatePredictionsDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ATXUpdatePredictionsDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MCProfileConnection)profileConnection
{
  return self->_profileConnection;
}

- (void)setProfileConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileConnection, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_restrictionChangedNotificationToken, 0);
}

@end