@interface CSDelegateDetailsController
- (BOOL)_canChangeDefaultCalendar;
- (BOOL)_canChangeNotificationSetting;
- (BOOL)_shouldShowNotificationSetting;
- (BOOL)_shouldShowSpinner;
- (id)_defaultCalendar;
- (id)_showDelegationCalendar;
- (id)_showNotifications;
- (id)specifiers;
- (void)_refreshAccounts;
- (void)_setDefaultCalendar:(id)a3 specifier:(id)a4;
- (void)_setShowDelegationCalendar:(id)a3;
- (void)_setShowNotifications:(id)a3;
- (void)accountRefreshFinished:(id)a3;
- (void)cleanupAccountRefresher;
- (void)setSpecifier:(id)a3;
@end

@implementation CSDelegateDetailsController

- (void)setSpecifier:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CSDelegateDetailsController;
  [(CSDelegateDetailsController *)&v7 setSpecifier:a3];
  v4 = [(CSDelegateDetailsController *)self specifier];
  v5 = [v4 propertyForKey:@"CSSourceKey"];
  source = self->_source;
  self->_source = v5;
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->PSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    v5 = +[NSBundle bundleForClass:objc_opt_class()];
    v6 = +[NSMutableArray array];
    objc_super v7 = [v5 localizedStringForKey:@"Show Delegation Calendar" value:&stru_1CE38 table:@"MobileCalSettings"];
    v8 = +[PSSpecifier preferenceSpecifierNamed:v7 target:self set:"_setShowDelegationCalendar:" get:"_showDelegationCalendar" detail:0 cell:6 edit:0];

    [v6 addObject:v8];
    if ([(CSDelegateDetailsController *)self _shouldShowNotificationSetting])
    {
      v9 = +[PSSpecifier emptyGroupSpecifier];

      if ([(CSDelegateDetailsController *)self _canChangeNotificationSetting]) {
        CFStringRef v10 = @"Receive system notifications for this account. Notifications will always appear in the inbox.";
      }
      else {
        CFStringRef v10 = @"View Only delegates will not receive notifications in the inbox or receive system notifications.";
      }
      v11 = [v5 localizedStringForKey:v10 value:&stru_1CE38 table:@"MobileCalSettings"];
      [v9 setProperty:v11 forKey:PSFooterTextGroupKey];

      [v6 addObject:v9];
      v12 = [v5 localizedStringForKey:@"Show Notifications" value:&stru_1CE38 table:@"MobileCalSettings"];
      v8 = +[PSSpecifier preferenceSpecifierNamed:v12 target:self set:"_setShowNotifications:" get:"_showNotifications" detail:0 cell:6 edit:0];

      if (![(CSDelegateDetailsController *)self _canChangeNotificationSetting]) {
        [v8 setProperty:&__kCFBooleanFalse forKey:PSEnabledKey];
      }
      [v6 addObject:v8];
    }
    if ([(CSDelegateDetailsController *)self _canChangeDefaultCalendar])
    {
      v13 = +[PSSpecifier emptyGroupSpecifier];

      [v6 addObject:v13];
      unsigned int v14 = [(CSDelegateDetailsController *)self _shouldShowSpinner];
      v15 = [v5 localizedStringForKey:@"Default Calendar" value:&stru_1CE38 table:@"MobileCalSettings"];
      if (v14)
      {
        v8 = +[PSSpecifier preferenceSpecifierNamed:v15 target:0 set:0 get:0 detail:0 cell:3 edit:0];

        uint64_t source = objc_opt_class();
        v17 = (__CFString **)&PSCellClassKey;
      }
      else
      {
        uint64_t v18 = objc_opt_class();
        v8 = +[PSSpecifier preferenceSpecifierNamed:v15 target:self set:"_setDefaultCalendar:specifier:" get:"_defaultCalendar" detail:v18 cell:2 edit:NSClassFromString(@"CSDefaultCalendarPane")];

        uint64_t source = (uint64_t)self->_source;
        v17 = &CSSourceKey;
      }
      [v8 setProperty:source forKey:*v17];
      [v6 addObject:v8];
    }
    v19 = *(void **)&self->PSListController_opaque[v3];
    *(void *)&self->PSListController_opaque[v3] = v6;

    v4 = *(void **)&self->PSListController_opaque[v3];
  }

  return v4;
}

- (id)_showDelegationCalendar
{
  id v2 = [(EKSource *)self->_source isEnabled];

  return +[NSNumber numberWithBool:v2];
}

- (BOOL)_shouldShowSpinner
{
  if (!self->_reloadingAccount) {
    return 0;
  }
  id v2 = [(EKSource *)self->_source allCalendars];
  BOOL v3 = [v2 count] == 0;

  return v3;
}

- (void)_setShowDelegationCalendar:(id)a3
{
  id v4 = [a3 BOOLValue];
  [(EKSource *)self->_source setEnabled:v4];
  v5 = [(EKSource *)self->_source eventStore];
  uint64_t source = self->_source;
  id v10 = 0;
  unsigned __int8 v7 = [v5 saveSource:source commit:1 error:&v10];
  id v8 = v10;

  if ((v7 & 1) == 0)
  {
    v9 = kCSLogHandle;
    if (os_log_type_enabled((os_log_t)kCSLogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109378;
      int v12 = (int)v4;
      __int16 v13 = 2112;
      id v14 = v8;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_ERROR, "Error saving source after setting enabled (%d): %@", buf, 0x12u);
    }
  }
  if (v4) {
    [(CSDelegateDetailsController *)self _refreshAccounts];
  }
  [(CSDelegateDetailsController *)self reloadSpecifiers];
}

- (id)_showNotifications
{
  id v2 = [(EKSource *)self->_source showsNotifications];

  return +[NSNumber numberWithBool:v2];
}

- (void)_setShowNotifications:(id)a3
{
  id v4 = [a3 BOOLValue];
  [(EKSource *)self->_source setShowsNotifications:v4];
  v5 = [(EKSource *)self->_source eventStore];
  uint64_t source = self->_source;
  id v10 = 0;
  unsigned __int8 v7 = [v5 saveSource:source commit:1 error:&v10];
  id v8 = v10;

  if ((v7 & 1) == 0)
  {
    v9 = kCSLogHandle;
    if (os_log_type_enabled((os_log_t)kCSLogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109378;
      int v12 = (int)v4;
      __int16 v13 = 2112;
      id v14 = v8;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_ERROR, "Error saving source after showsNotifications enabled (%d): %@", buf, 0x12u);
    }
  }
}

- (id)_defaultCalendar
{
  BOOL v3 = [(EKSource *)self->_source eventStore];
  id v4 = [v3 defaultCalendarForNewEventsInDelegateSource:self->_source];

  if (v4)
  {
    CUIKDisplayedTitleForCalendar();
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = &stru_1CE38;
  }

  return v5;
}

- (void)_setDefaultCalendar:(id)a3 specifier:(id)a4
{
  id v11 = a4;
  if (a3)
  {
    uint64_t source = self->_source;
    id v7 = a3;
    id v8 = [(EKSource *)source eventStore];
    v9 = [v8 calendarWithID:v7];

    id v10 = [(EKSource *)self->_source eventStore];
    [v10 setDefaultCalendar:v9 forNewEventsInDelegateSource:self->_source];
  }
  [(CSDelegateDetailsController *)self reloadSpecifier:v11];
}

- (BOOL)_shouldShowNotificationSetting
{
  return [(EKSource *)self->_source isEnabled];
}

- (BOOL)_canChangeNotificationSetting
{
  return [(EKSource *)self->_source isWritable];
}

- (BOOL)_canChangeDefaultCalendar
{
  if (![(EKSource *)self->_source isEnabled]
    || ![(EKSource *)self->_source isWritable])
  {
    return 0;
  }
  BOOL v3 = [(EKSource *)self->_source allCalendars];
  id v4 = [v3 count];

  if (!v4) {
    return 1;
  }
  uint64_t source = self->_source;
  v5 = +[NSArray arrayWithObjects:&source count:1];
  BOOL v6 = +[CSDelegationUtilities sourceInListHasMoreThanOneWritableCalendar:v5];

  return v6;
}

- (void)_refreshAccounts
{
  self->_reloadingAccount = 1;
  [(CSDelegateDetailsController *)self cleanupAccountRefresher];
  id v3 = objc_alloc((Class)EKAccountRefresher);
  id v4 = [(EKSource *)self->_source eventStore];
  v5 = (EKAccountRefresher *)[v3 initWithEventStore:v4];
  currentAccountRefresher = self->_currentAccountRefresher;
  self->_currentAccountRefresher = v5;

  [(EKAccountRefresher *)self->_currentAccountRefresher setDelegate:self];
  id v7 = self->_currentAccountRefresher;

  [(EKAccountRefresher *)v7 refresh];
}

- (void)accountRefreshFinished:(id)a3
{
  self->_reloadingAccount = 0;
  [(CSDelegateDetailsController *)self reloadSpecifiers];

  [(CSDelegateDetailsController *)self cleanupAccountRefresher];
}

- (void)cleanupAccountRefresher
{
  [(EKAccountRefresher *)self->_currentAccountRefresher setDelegate:0];
  currentAccountRefresher = self->_currentAccountRefresher;
  self->_currentAccountRefresher = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentAccountRefresher, 0);

  objc_storeStrong((id *)&self->_source, 0);
}

@end