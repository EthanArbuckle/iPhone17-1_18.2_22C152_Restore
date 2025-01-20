@interface CSLNotificationsController
- (id)specifiers;
- (void)_subscribeToNotificationsForSpecifiers:(id)a3;
- (void)_unsubscribeFromNotificationsForSpecifiers:(id)a3;
- (void)dealloc;
- (void)showController:(id)a3 animate:(BOOL)a4;
@end

@implementation CSLNotificationsController

- (void)showController:(id)a3 animate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v6 setSettingsMode:1];
  }
  v7.receiver = self;
  v7.super_class = (Class)CSLNotificationsController;
  [(CSLNotificationsController *)&v7 showController:v6 animate:v4];
}

- (id)specifiers
{
  [(CSLNotificationsController *)self _unsubscribeFromNotificationsForSpecifiers:*(void *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers]];
  v5.receiver = self;
  v5.super_class = (Class)CSLNotificationsController;
  v3 = [(CSLNotificationsController *)&v5 specifiers];
  [(CSLNotificationsController *)self _subscribeToNotificationsForSpecifiers:v3];

  return v3;
}

- (void)dealloc
{
  [(CSLNotificationsController *)self _unsubscribeFromNotificationsForSpecifiers:*(void *)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers]];
  v3.receiver = self;
  v3.super_class = (Class)CSLNotificationsController;
  [(CSLNotificationsController *)&v3 dealloc];
}

- (void)_subscribeToNotificationsForSpecifiers:(id)a3
{
  id v3 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
    uint64_t v7 = PSValueChangedNotificationKey;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        v10 = [v9 propertyForKey:v7];
        if (v10)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFNotificationCenterAddObserver(DarwinNotifyCenter, v9, (CFNotificationCallback)sub_4CE4, v10, 0, (CFNotificationSuspensionBehavior)1028);
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
}

- (void)_unsubscribeFromNotificationsForSpecifiers:(id)a3
{
  id v3 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
    uint64_t v7 = PSValueChangedNotificationKey;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        v10 = [v9 propertyForKey:v7];
        if (v10)
        {
          DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
          CFNotificationCenterRemoveObserver(DarwinNotifyCenter, v9, v10, 0);
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
}

@end