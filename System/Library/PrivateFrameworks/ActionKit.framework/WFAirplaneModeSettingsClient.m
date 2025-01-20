@interface WFAirplaneModeSettingsClient
- (void)getStateWithCompletionHandler:(id)a3;
- (void)setState:(BOOL)a3 completionHandler:(id)a4;
@end

@implementation WFAirplaneModeSettingsClient

- (void)setState:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  uint64_t v13 = *MEMORY[0x263EF8340];
  v6 = (void (**)(id, void))a4;
  v7 = [(WFRadiosPreferencesSettingsClient *)self radiosPreferences];
  [v7 setAirplaneMode:v4];

  v8 = getWFBundledIntentsLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315394;
    v10 = "-[WFAirplaneModeSettingsClient setState:completionHandler:]";
    __int16 v11 = 1024;
    BOOL v12 = v4;
    _os_log_impl(&dword_23C364000, v8, OS_LOG_TYPE_INFO, "%s Set Airplane Mode state to %d", (uint8_t *)&v9, 0x12u);
  }

  v6[2](v6, 0);
}

- (void)getStateWithCompletionHandler:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  BOOL v4 = (void (**)(id, uint64_t, void))a3;
  v5 = [(WFRadiosPreferencesSettingsClient *)self radiosPreferences];
  uint64_t v6 = [v5 airplaneMode];

  v7 = getWFBundledIntentsLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v8 = 136315394;
    int v9 = "-[WFAirplaneModeSettingsClient getStateWithCompletionHandler:]";
    __int16 v10 = 1024;
    int v11 = v6;
    _os_log_impl(&dword_23C364000, v7, OS_LOG_TYPE_INFO, "%s Retrieved Airplane Mode state: %d", (uint8_t *)&v8, 0x12u);
  }

  v4[2](v4, v6, 0);
}

@end