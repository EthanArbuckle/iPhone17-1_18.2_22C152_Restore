@interface AKFollowUpManagerFactory
+ (id)sharedAuthKitFollowupManager;
+ (id)sharedAuthKitFollowupPushDelegate;
@end

@implementation AKFollowUpManagerFactory

+ (id)sharedAuthKitFollowupManager
{
  if (qword_100272418 != -1) {
    dispatch_once(&qword_100272418, &stru_100228448);
  }
  v2 = (void *)qword_100272410;

  return v2;
}

+ (id)sharedAuthKitFollowupPushDelegate
{
  v2 = objc_opt_class();

  return [v2 sharedAuthKitFollowupManager];
}

@end