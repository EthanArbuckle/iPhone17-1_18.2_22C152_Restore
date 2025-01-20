@interface GKApplicationWorkspace(UI)
- (uint64_t)applicationIsInstalled:()UI;
- (void)openGameCenterSettings;
- (void)openGameCenterSettingsInviteFriends;
- (void)openURL:()UI;
@end

@implementation GKApplicationWorkspace(UI)

- (uint64_t)applicationIsInstalled:()UI
{
  v3 = (void *)MEMORY[0x1E4F223E0];
  id v4 = a3;
  v5 = [v3 defaultWorkspace];
  uint64_t v6 = [v5 applicationIsInstalled:v4];

  return v6;
}

- (void)openGameCenterSettings
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1AF250000, a2, OS_LOG_TYPE_ERROR, "cannot openGameCenterSettings because of error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)openGameCenterSettingsInviteFriends
{
  id v2 = [MEMORY[0x1E4F1CB10] URLWithString:@"settings-navigation://com.apple.Settings.GameCenter/INVITE_FRIENDS"];
  [a1 openURL:v2];
}

- (void)openURL:()UI
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v10 = *MEMORY[0x1E4F62688];
  v11[0] = MEMORY[0x1E4F1CC38];
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
  v5 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  id v9 = 0;
  [v5 openSensitiveURL:v3 withOptions:v4 error:&v9];
  id v6 = v9;

  if (v6)
  {
    if (!*MEMORY[0x1E4F63860]) {
      id v7 = (id)GKOSLoggers();
    }
    v8 = *MEMORY[0x1E4F63850];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F63850], OS_LOG_TYPE_ERROR)) {
      [(GKApplicationWorkspace(UI) *)(uint64_t)v3 openURL:v8];
    }
  }
}

- (void)openURL:()UI .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1AF250000, log, OS_LOG_TYPE_ERROR, "cannot openURL: %@, because of error: %@", (uint8_t *)&v3, 0x16u);
}

@end