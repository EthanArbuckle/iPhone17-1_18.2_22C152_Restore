@interface PDPrivateUserNotificationManager
+ (id)notificationCenter;
- (UNUserNotificationCenter)notificationCenter;
- (void)setNotificationCenter:(id)a3;
@end

@implementation PDPrivateUserNotificationManager

+ (id)notificationCenter
{
  if (qword_10023E4C8 != -1) {
    dispatch_once(&qword_10023E4C8, &stru_1001F2C10);
  }
  v2 = (void *)qword_10023E4C0;

  return v2;
}

- (UNUserNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (void)setNotificationCenter:(id)a3
{
}

- (void).cxx_destruct
{
}

@end