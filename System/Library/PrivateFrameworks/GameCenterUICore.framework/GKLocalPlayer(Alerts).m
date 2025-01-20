@interface GKLocalPlayer(Alerts)
+ (id)currentLocalPlayer;
+ (void)currentLocalPlayer;
- (uint64_t)alertUserInStoreDemoModeEnabled;
- (void)showCancelledAlertForPlayer:()Alerts;
@end

@implementation GKLocalPlayer(Alerts)

+ (id)currentLocalPlayer
{
  if (currentLocalPlayer_sDispatchOnceToken != -1) {
    dispatch_once(&currentLocalPlayer_sDispatchOnceToken, &__block_literal_global_6);
  }
  if ([(id)currentLocalPlayer_sCurrentLocalPlayer hasAcknowledgedLatestGDPR])
  {
    id v0 = (id)currentLocalPlayer_sCurrentLocalPlayer;
  }
  else
  {
    if (!*MEMORY[0x263F40328]) {
      id v1 = (id)GKOSLoggers();
    }
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F40300], OS_LOG_TYPE_ERROR)) {
      +[GKLocalPlayer(Alerts) currentLocalPlayer]();
    }
    id v0 = 0;
  }
  return v0;
}

+ (void)currentLocalPlayer
{
  OUTLINED_FUNCTION_0_1();
  _os_log_error_impl(&dword_22600C000, v0, OS_LOG_TYPE_ERROR, "The current local player will not be available as the GDPR have not been acknowledged yet. This is anticipated behavior and not an error.", v1, 2u);
}

- (void)showCancelledAlertForPlayer:()Alerts
{
  v3 = NSString;
  id v4 = a3;
  v5 = GKGameCenterUIFrameworkBundle();
  v6 = GKGetLocalizedStringFromTableInBundle();
  v7 = [v4 displayNameWithOptions:0];

  objc_msgSend(v3, "localizedStringWithFormat:", v6, v7);
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  v8 = [MEMORY[0x263F1CB68] _gkKeyWindowRootViewController];
  v9 = GKGameCenterUIFrameworkBundle();
  v10 = GKGetLocalizedStringFromTableInBundle();
  id v11 = (id)[v8 _gkPresentAlertWithTitle:v12 message:0 buttonTitle:v10];
}

- (uint64_t)alertUserInStoreDemoModeEnabled
{
  os_log_t v0 = [MEMORY[0x263F40298] shared];
  uint64_t v1 = [v0 isStoreDemoModeEnabled];

  if (v1)
  {
    v2 = [MEMORY[0x263F1CB68] _gkKeyWindowRootViewController];
    v3 = GKGameCenterUIFrameworkBundle();
    id v4 = GKGetLocalizedStringFromTableInBundle();
    v5 = GKGameCenterUIFrameworkBundle();
    v6 = GKGetLocalizedStringFromTableInBundle();
    v7 = GKGameCenterUIFrameworkBundle();
    v8 = GKGetLocalizedStringFromTableInBundle();
    id v9 = (id)[v2 _gkPresentAlertWithTitle:v4 message:v6 buttonTitle:v8];
  }
  return v1;
}

@end