@interface PlatformHelper
+ (id)sharedInstance;
@end

@implementation PlatformHelper

+ (id)sharedInstance
{
  if (qword_10013BD70 != -1) {
    dispatch_once(&qword_10013BD70, &stru_100124BF0);
  }
  return (id)qword_10013BD68;
}

@end