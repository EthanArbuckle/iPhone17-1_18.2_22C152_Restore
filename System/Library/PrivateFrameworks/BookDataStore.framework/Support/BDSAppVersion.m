@interface BDSAppVersion
+ (id)appVersion;
@end

@implementation BDSAppVersion

+ (id)appVersion
{
  if (qword_1002974D8 != -1) {
    dispatch_once(&qword_1002974D8, &stru_10025FC00);
  }
  v2 = (void *)qword_1002974D0;
  return v2;
}

@end