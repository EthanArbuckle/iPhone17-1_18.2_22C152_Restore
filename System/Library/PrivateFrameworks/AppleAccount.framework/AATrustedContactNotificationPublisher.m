@interface AATrustedContactNotificationPublisher
+ (void)postInheritanceContactChangedNotification;
+ (void)postRecoveryContactChangedNotification;
@end

@implementation AATrustedContactNotificationPublisher

+ (void)postRecoveryContactChangedNotification
{
  v2 = _AALogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A11D8000, v2, OS_LOG_TYPE_DEFAULT, "Posting AARecoveryContactChangedNotification", v4, 2u);
  }

  v3 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v3 postNotificationName:@"com.apple.appleaccount.recovery-contact-changed-notification" object:0 userInfo:0 deliverImmediately:1];
}

+ (void)postInheritanceContactChangedNotification
{
  v2 = _AALogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A11D8000, v2, OS_LOG_TYPE_DEFAULT, "Posting AAInheritanceContactChangedNotification", v4, 2u);
  }

  v3 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v3 postNotificationName:@"com.apple.appleaccount.inheritance-contact-changed-notification" object:0 userInfo:0 deliverImmediately:1];
}

@end