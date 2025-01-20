@interface BDSAppVersion
+ (id)appVersion;
@end

@implementation BDSAppVersion

+ (id)appVersion
{
  if (qword_268854B48 != -1) {
    dispatch_once(&qword_268854B48, &unk_26E971BB0);
  }
  v2 = (void *)qword_268854B40;
  return v2;
}

@end