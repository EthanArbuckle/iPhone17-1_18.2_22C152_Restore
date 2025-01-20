@interface SHNotificationCenterProvider
+ (id)matchResultNotificationCenter;
@end

@implementation SHNotificationCenterProvider

+ (id)matchResultNotificationCenter
{
  if (qword_100090A38 != -1) {
    dispatch_once(&qword_100090A38, &stru_1000750A8);
  }
  v2 = (void *)qword_100090A30;

  return v2;
}

@end