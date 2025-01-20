@interface NSUserDefaults
+ (id)motionTrackingUserDefaults;
@end

@implementation NSUserDefaults

+ (id)motionTrackingUserDefaults
{
  if (qword_100054E18 != -1) {
    dispatch_once(&qword_100054E18, &stru_100048CE8);
  }
  v2 = (void *)qword_100054E10;

  return v2;
}

@end