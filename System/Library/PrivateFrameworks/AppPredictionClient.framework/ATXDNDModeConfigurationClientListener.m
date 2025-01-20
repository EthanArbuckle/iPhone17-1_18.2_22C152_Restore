@interface ATXDNDModeConfigurationClientListener
- (ATXDNDModeConfigurationClientListener)initWithDelegate:(id)a3;
- (ATXDNDModeConfigurationClientListenerDelegate)delegate;
- (void)modeConfigurationService:(id)a3 didReceiveAvailableModesUpdate:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation ATXDNDModeConfigurationClientListener

- (ATXDNDModeConfigurationClientListener)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ATXDNDModeConfigurationClientListener;
  v5 = [(ATXDNDModeConfigurationClientListener *)&v8 init];
  v6 = v5;
  if (v5) {
    [(ATXDNDModeConfigurationClientListener *)v5 setDelegate:v4];
  }

  return v6;
}

- (void)modeConfigurationService:(id)a3 didReceiveAvailableModesUpdate:(id)a4
{
  v5 = __atxlog_handle_modes();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1A790D000, v5, OS_LOG_TYPE_DEFAULT, "ATXDNDModeConfigurationClientListener: mode configuration did change", v7, 2u);
  }

  v6 = [(ATXDNDModeConfigurationClientListener *)self delegate];
  [v6 configuredModesDidChange];
}

- (ATXDNDModeConfigurationClientListenerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ATXDNDModeConfigurationClientListenerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end