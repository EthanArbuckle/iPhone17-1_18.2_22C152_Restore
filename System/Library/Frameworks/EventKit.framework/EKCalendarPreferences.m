@interface EKCalendarPreferences
+ (id)calendarPreferences;
- (BOOL)_checkedStateForDisabledOrCollapsedItemWithUID:(id)a3 delegateID:(id)a4 withKey:(id)a5;
- (BOOL)checkedStateForCalendarWithUID:(id)a3 delegateID:(id)a4;
- (BOOL)expandedStateForTopLevelNodeWithUID:(id)a3;
- (BOOL)invitationNotificationsDisabled;
- (BOOL)sharedCalendarNotificationsDisabled;
- (CalPreferences)calPreferences;
- (EKCalendarPreferences)init;
- (id)_disabledOrCollapsedItemsForDelegateID:(id)a3 withKey:(id)a4;
- (id)_keyForDelegateID:(id)a3;
- (id)disabledCalendarsForDelegateWithUID:(id)a3;
- (id)disabledCalendarsForMainWindow;
- (id)displayOrderForAccounts;
- (unint64_t)_displayOrderForSourceWithIdentifier:(id)a3 key:(id)a4;
- (unint64_t)displayOrderForAccountWithSourceIdentifier:(id)a3;
- (unint64_t)displayOrderForLocalGroupWithSourceIdentifier:(id)a3;
- (void)_updateDisplayOrderForSources:(id)a3 key:(id)a4;
- (void)_updateStateForDisabledOrCollapsedItemWithUID:(id)a3 delegateID:(id)a4 state:(BOOL)a5 withKey:(id)a6 withNotification:(id)a7;
- (void)setCalPreferences:(id)a3;
- (void)setInvitationNotificationsDisabled:(BOOL)a3;
- (void)setSharedCalendarNotificationsDisabled:(BOOL)a3;
- (void)updateCheckedStateForCalendarWithUID:(id)a3 delegateID:(id)a4 state:(BOOL)a5;
- (void)updateDisplayOrderForAccountsWithSourceIdentifiers:(id)a3;
- (void)updateDisplayOrderForLocalGroupsWithSourceIdentifiers:(id)a3;
- (void)updateExpandedStateForTopLevelNodeWithUID:(id)a3 state:(BOOL)a4;
@end

@implementation EKCalendarPreferences

+ (id)calendarPreferences
{
  if (calendarPreferences_onceToken != -1) {
    dispatch_once(&calendarPreferences_onceToken, &__block_literal_global_83);
  }
  v2 = (void *)calendarPreferences_calendarPreferences;

  return v2;
}

uint64_t __44__EKCalendarPreferences_calendarPreferences__block_invoke()
{
  v0 = objc_alloc_init(EKCalendarPreferences);
  uint64_t v1 = calendarPreferences_calendarPreferences;
  calendarPreferences_calendarPreferences = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (EKCalendarPreferences)init
{
  v7.receiver = self;
  v7.super_class = (Class)EKCalendarPreferences;
  v2 = [(EKCalendarPreferences *)&v7 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F57780]);
    uint64_t v4 = [v3 initWithDomain:*MEMORY[0x1E4F57900]];
    preferences = v2->_preferences;
    v2->_preferences = (CalPreferences *)v4;

    [(CalPreferences *)v2->_preferences registerReflectionForPreferenceWithNotificationName:@"com.apple.iCal.viewModelChanged"];
    [(CalPreferences *)v2->_preferences registerReflectionForPreferenceWithNotificationName:@"com.apple.calendar.preference.notification.changed"];
  }
  return v2;
}

- (BOOL)sharedCalendarNotificationsDisabled
{
  return [(CalPreferences *)self->_preferences getBooleanPreference:@"SharedCalendarNotificationsDisabled" defaultValue:0];
}

- (void)setSharedCalendarNotificationsDisabled:(BOOL)a3
{
}

- (BOOL)invitationNotificationsDisabled
{
  return [(CalPreferences *)self->_preferences getBooleanPreference:@"InvitationNotificationsDisabled" defaultValue:0];
}

- (void)setInvitationNotificationsDisabled:(BOOL)a3
{
}

- (void)updateCheckedStateForCalendarWithUID:(id)a3 delegateID:(id)a4 state:(BOOL)a5
{
}

- (BOOL)checkedStateForCalendarWithUID:(id)a3 delegateID:(id)a4
{
  id v6 = a3;
  objc_super v7 = [(EKCalendarPreferences *)self _disabledOrCollapsedItemsForDelegateID:a4 withKey:@"DisabledCalendars"];
  v8 = v7;
  if (v7) {
    int v9 = [v7 containsObject:v6] ^ 1;
  }
  else {
    LOBYTE(v9) = 1;
  }

  return v9;
}

- (id)disabledCalendarsForDelegateWithUID:(id)a3
{
  return [(EKCalendarPreferences *)self _disabledOrCollapsedItemsForDelegateID:a3 withKey:@"DisabledCalendars"];
}

- (id)disabledCalendarsForMainWindow
{
  return [(EKCalendarPreferences *)self disabledCalendarsForDelegateWithUID:@"MainWindow"];
}

- (void)updateExpandedStateForTopLevelNodeWithUID:(id)a3 state:(BOOL)a4
{
}

- (BOOL)expandedStateForTopLevelNodeWithUID:(id)a3
{
  id v4 = a3;
  v5 = [(EKCalendarPreferences *)self _disabledOrCollapsedItemsForDelegateID:0 withKey:@"CollapsedTopLevelNodes"];
  id v6 = v5;
  if (v5) {
    int v7 = [v5 containsObject:v4] ^ 1;
  }
  else {
    LOBYTE(v7) = 1;
  }

  return v7;
}

- (void)_updateStateForDisabledOrCollapsedItemWithUID:(id)a3 delegateID:(id)a4 state:(BOOL)a5 withKey:(id)a6 withNotification:(id)a7
{
  BOOL v9 = a5;
  id v21 = a3;
  id v12 = a4;
  id v13 = a6;
  preferences = self->_preferences;
  id v15 = a7;
  v16 = [(CalPreferences *)preferences getValueForPreference:v13 expectedClass:objc_opt_class()];
  v17 = (void *)[v16 mutableCopy];

  if (!v17)
  {
    v17 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  v18 = [(EKCalendarPreferences *)self _keyForDelegateID:v12];
  v19 = [v17 objectForKey:v18];
  v20 = (void *)[v19 mutableCopy];

  if (!v20)
  {
    v20 = [MEMORY[0x1E4F1CA48] array];
  }
  [v17 setObject:v20 forKeyedSubscript:v18];
  if (v9) {
    objc_msgSend(v20, "removeObject:inRange:", v21, 0, objc_msgSend(v20, "count"));
  }
  else {
    [v20 addObject:v21];
  }
  [(CalPreferences *)self->_preferences setValueForPreference:v13 value:v17 notificationName:v15];
}

- (id)_disabledOrCollapsedItemsForDelegateID:(id)a3 withKey:(id)a4
{
  id v6 = a4;
  int v7 = [(EKCalendarPreferences *)self _keyForDelegateID:a3];
  v8 = [(CalPreferences *)self->_preferences getValueForPreference:v6 expectedClass:objc_opt_class()];

  if (v8)
  {
    BOOL v9 = [v8 objectForKey:v7];
    v10 = (void *)[v9 mutableCopy];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)_checkedStateForDisabledOrCollapsedItemWithUID:(id)a3 delegateID:(id)a4 withKey:(id)a5
{
  id v7 = a3;
  v8 = [(EKCalendarPreferences *)self _disabledOrCollapsedItemsForDelegateID:a4 withKey:@"DisabledCalendars"];
  BOOL v9 = v8;
  if (v8) {
    int v10 = [v8 containsObject:v7] ^ 1;
  }
  else {
    LOBYTE(v10) = 1;
  }

  return v10;
}

- (id)_keyForDelegateID:(id)a3
{
  id v3 = (__CFString *)a3;
  if (!v3) {
    id v3 = @"MainWindow";
  }

  return v3;
}

- (unint64_t)displayOrderForLocalGroupWithSourceIdentifier:(id)a3
{
  return [(EKCalendarPreferences *)self _displayOrderForSourceWithIdentifier:a3 key:@"LocalGroupsDisplayOrder"];
}

- (void)updateDisplayOrderForLocalGroupsWithSourceIdentifiers:(id)a3
{
}

- (id)displayOrderForAccounts
{
  preferences = self->_preferences;
  uint64_t v3 = objc_opt_class();

  return (id)[(CalPreferences *)preferences getValueForPreference:@"AccountDisplayOrder" expectedClass:v3];
}

- (unint64_t)displayOrderForAccountWithSourceIdentifier:(id)a3
{
  return [(EKCalendarPreferences *)self _displayOrderForSourceWithIdentifier:a3 key:@"AccountDisplayOrder"];
}

- (void)updateDisplayOrderForAccountsWithSourceIdentifiers:(id)a3
{
}

- (unint64_t)_displayOrderForSourceWithIdentifier:(id)a3 key:(id)a4
{
  id v6 = a3;
  preferences = self->_preferences;
  id v8 = a4;
  BOOL v9 = [(CalPreferences *)preferences getValueForPreference:v8 expectedClass:objc_opt_class()];

  if (v9) {
    unint64_t v10 = [v9 indexOfObject:v6];
  }
  else {
    unint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v10;
}

- (void)_updateDisplayOrderForSources:(id)a3 key:(id)a4
{
}

- (CalPreferences)calPreferences
{
  return (CalPreferences *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCalPreferences:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calPreferences, 0);

  objc_storeStrong((id *)&self->_preferences, 0);
}

@end