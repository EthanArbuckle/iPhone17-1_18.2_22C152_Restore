@interface AXUISettingsListController
- (AXUISettingsListController)init;
- (id)specifierForKey:(id)a3;
- (void)dealloc;
- (void)setButtonCellStatus:(BOOL)a3 forSpecifier:(id)a4;
@end

@implementation AXUISettingsListController

- (AXUISettingsListController)init
{
  v6.receiver = self;
  v6.super_class = (Class)AXUISettingsListController;
  v2 = [(AXUISettingsSetupCapableListController *)&v6 init];
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_accessibilityiTunesSettings, (CFStringRef)*MEMORY[0x1E4FB93D0], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v4 = v2;
  }

  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)AXUISettingsListController;
  [(AXUISettingsSetupCapableListController *)&v4 dealloc];
}

- (id)specifierForKey:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(AXUISettingsListController *)self specifiers];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    uint64_t v9 = *MEMORY[0x1E4F931B0];
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "propertyForKey:", v9, (void)v16);
        int v13 = [v12 isEqualToString:v4];

        if (v13)
        {
          id v14 = v11;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v14 = 0;
LABEL_11:

  return v14;
}

- (void)setButtonCellStatus:(BOOL)a3 forSpecifier:(id)a4
{
  if (a4)
  {
    BOOL v4 = a3;
    id v5 = [a4 propertyForKey:*MEMORY[0x1E4F93220]];
    [v5 setCellEnabled:v4];
  }
}

@end