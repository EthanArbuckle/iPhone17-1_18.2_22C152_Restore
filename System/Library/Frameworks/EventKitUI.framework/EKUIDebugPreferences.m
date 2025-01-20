@interface EKUIDebugPreferences
+ (id)shared;
- (BOOL)showInviteesAndMoreRegion;
- (BOOL)showReportAProblemNotificationButton;
- (EKUIDebugPreferences)init;
- (void)setShowInviteesAndMoreRegion:(BOOL)a3;
- (void)setShowReportAProblemNotificationButton:(BOOL)a3;
@end

@implementation EKUIDebugPreferences

+ (id)shared
{
  if (shared_onceToken_0 != -1) {
    dispatch_once(&shared_onceToken_0, &__block_literal_global_21);
  }
  v2 = (void *)shared_sharedPreferences;

  return v2;
}

void __30__EKUIDebugPreferences_shared__block_invoke()
{
  v0 = objc_alloc_init(EKUIDebugPreferences);
  v1 = (void *)shared_sharedPreferences;
  shared_sharedPreferences = (uint64_t)v0;
}

- (EKUIDebugPreferences)init
{
  v7.receiver = self;
  v7.super_class = (Class)EKUIDebugPreferences;
  v2 = [(EKUIDebugPreferences *)&v7 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F57780]);
    uint64_t v4 = [v3 initWithDomain:*MEMORY[0x1E4F57900]];
    preferences = v2->_preferences;
    v2->_preferences = (CalPreferences *)v4;

    [(CalPreferences *)v2->_preferences registerReflectionForPreferenceWithNotificationName:@"com.apple.eventkitui.debug.preference.notification.showInviteesAndMoreRegion"];
    [(CalPreferences *)v2->_preferences registerReflectionForPreferenceWithNotificationName:@"com.apple.eventkitui.debug.preference.notification.showReportAProblemNotificationButton"];
  }
  return v2;
}

- (BOOL)showInviteesAndMoreRegion
{
  return [(CalPreferences *)self->_preferences getBooleanPreference:@"showInviteesAndMoreRegion" defaultValue:0];
}

- (void)setShowInviteesAndMoreRegion:(BOOL)a3
{
}

- (BOOL)showReportAProblemNotificationButton
{
  return [(CalPreferences *)self->_preferences getBooleanPreference:@"showReportAProblemNotificationButton" defaultValue:1];
}

- (void)setShowReportAProblemNotificationButton:(BOOL)a3
{
}

- (void).cxx_destruct
{
}

@end