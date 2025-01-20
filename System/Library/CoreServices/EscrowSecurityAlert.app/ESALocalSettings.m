@interface ESALocalSettings
- (BOOL)isNotificationDisabled;
- (BOOL)shouldAllowSnooze;
- (int)alertType;
- (void)notificationSnoozed;
- (void)reset;
- (void)setAlertType:(int)a3;
- (void)setNotificationDisabled:(BOOL)a3;
@end

@implementation ESALocalSettings

- (BOOL)isNotificationDisabled
{
  v2 = (void *)CFPreferencesCopyValue(@"notificationsAllowed", @"com.apple.EscrowSecurityAlert", kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (void)setNotificationDisabled:(BOOL)a3
{
  CFPreferencesSetValue(@"notificationsAllowed", +[NSNumber numberWithBool:a3], @"com.apple.EscrowSecurityAlert", kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);

  CFPreferencesSynchronize(@"com.apple.EscrowSecurityAlert", kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
}

- (BOOL)shouldAllowSnooze
{
  v2 = (void *)CFPreferencesCopyValue(@"thresholdLevel", @"com.apple.EscrowSecurityAlert", kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
  unsigned __int8 v3 = v2;
  BOOL v4 = !v2 || [v2 intValue];

  return v4;
}

- (void)notificationSnoozed
{
  v2 = (void *)CFPreferencesCopyValue(@"thresholdLevel", @"com.apple.EscrowSecurityAlert", kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
  if (v2)
  {
    unsigned __int8 v3 = v2;
    uint64_t v4 = (uint64_t)[v2 intValue];

    if ((int)v4 >= 1) {
      uint64_t v4 = (v4 - 1);
    }
  }
  else
  {
    uint64_t v4 = 1;
  }
  CFPreferencesSetValue(@"thresholdLevel", +[NSNumber numberWithInt:v4], @"com.apple.EscrowSecurityAlert", kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);

  CFPreferencesSynchronize(@"com.apple.EscrowSecurityAlert", kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
}

- (int)alertType
{
  v2 = (void *)CFPreferencesCopyValue(@"notificationType", @"com.apple.EscrowSecurityAlert", kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
  if (v2)
  {
    unsigned __int8 v3 = v2;
    unsigned int v4 = [v2 intValue];

    LODWORD(v2) = v4;
  }
  return (int)v2;
}

- (void)setAlertType:(int)a3
{
  CFPreferencesSetValue(@"notificationType", +[NSNumber numberWithUnsignedInt:*(void *)&a3], @"com.apple.EscrowSecurityAlert", kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);

  CFPreferencesSynchronize(@"com.apple.EscrowSecurityAlert", kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
}

- (void)reset
{
  CFPreferencesSetValue(@"thresholdLevel", 0, @"com.apple.EscrowSecurityAlert", kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
  CFPreferencesSetValue(@"notificationsAllowed", 0, @"com.apple.EscrowSecurityAlert", kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
  CFPreferencesSetValue(@"notificationType", 0, @"com.apple.EscrowSecurityAlert", kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);

  CFPreferencesSynchronize(@"com.apple.EscrowSecurityAlert", kCFPreferencesCurrentUser, kCFPreferencesCurrentHost);
}

@end