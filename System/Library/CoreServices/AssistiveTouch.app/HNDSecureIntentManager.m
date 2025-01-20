@interface HNDSecureIntentManager
+ (id)sharedInstance;
- (BOOL)cachedHasShownHint;
- (BOOL)waitingForSecureIntent;
- (HNDSecureIntentManager)init;
- (void)_showFirstTimeAlert;
- (void)dealloc;
- (void)setCachedHasShownHint:(BOOL)a3;
- (void)setWaitingForSecureIntent:(BOOL)a3;
@end

@implementation HNDSecureIntentManager

+ (id)sharedInstance
{
  if (qword_1001F0AE0 != -1) {
    dispatch_once(&qword_1001F0AE0, &stru_1001AD198);
  }
  v2 = (void *)qword_1001F0AD8;

  return v2;
}

- (HNDSecureIntentManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)HNDSecureIntentManager;
  v2 = [(HNDSecureIntentManager *)&v9 init];
  if (v2)
  {
    v3 = ASTLogCommon();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "AST/SC registering for Secure Intent Notifications", v8, 2u);
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_100081F70, @"com.apple.LocalAuthentication.intent.waiting", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v5 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v5, v2, (CFNotificationCallback)sub_100081F70, @"com.apple.LocalAuthentication.intent.not-waiting", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v6 = +[NSUserDefaults standardUserDefaults];
    -[HNDSecureIntentManager setCachedHasShownHint:](v2, "setCachedHasShownHint:", [v6 BOOLForKey:@"com.apple.assistivetouchd.has_shown_secure_intent_confirm"]);
  }
  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)HNDSecureIntentManager;
  [(HNDSecureIntentManager *)&v4 dealloc];
}

- (void)_showFirstTimeAlert
{
  v3 = +[AXSpringBoardServer server];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100082178;
  v4[3] = &unk_1001AB8E0;
  v4[4] = self;
  [v3 showAlert:24 withHandler:v4];
}

- (BOOL)waitingForSecureIntent
{
  return self->_waitingForSecureIntent;
}

- (void)setWaitingForSecureIntent:(BOOL)a3
{
  self->_waitingForSecureIntent = a3;
}

- (BOOL)cachedHasShownHint
{
  return self->_cachedHasShownHint;
}

- (void)setCachedHasShownHint:(BOOL)a3
{
  self->_cachedHasShownHint = a3;
}

@end