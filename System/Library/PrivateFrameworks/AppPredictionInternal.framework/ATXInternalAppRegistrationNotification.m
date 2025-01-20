@interface ATXInternalAppRegistrationNotification
+ (void)postNotificationWithInstallDictionary:(id)a3;
- (ATXInternalAppRegistrationNotification)init;
- (void)registerForNotificationsWithRegisterBlock:(id)a3;
@end

@implementation ATXInternalAppRegistrationNotification

- (ATXInternalAppRegistrationNotification)init
{
  v6.receiver = self;
  v6.super_class = (Class)ATXInternalAppRegistrationNotification;
  v2 = [(ATXInternalAppRegistrationNotification *)&v6 init];
  if (v2)
  {
    v3 = [[_ATXInternalNotification alloc] initWithNotificationName:@"com.apple.duetexpertd.ATXInternalAppRegistrationNotification.appRegistered"];
    note = v2->_note;
    v2->_note = v3;
  }
  return v2;
}

- (void)registerForNotificationsWithRegisterBlock:(id)a3
{
}

+ (void)postNotificationWithInstallDictionary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end