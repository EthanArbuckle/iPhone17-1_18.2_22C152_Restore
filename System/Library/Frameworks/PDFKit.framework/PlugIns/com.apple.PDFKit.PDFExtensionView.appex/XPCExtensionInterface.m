@interface XPCExtensionInterface
+ (id)extensionInterface;
+ (id)hostInterface;
@end

@implementation XPCExtensionInterface

+ (id)extensionInterface
{
  if (qword_100008598 != -1) {
    dispatch_once(&qword_100008598, &stru_100004058);
  }
  v2 = (void *)qword_100008590;

  return v2;
}

+ (id)hostInterface
{
  if (qword_1000085A8 != -1) {
    dispatch_once(&qword_1000085A8, &stru_100004078);
  }
  v2 = (void *)qword_1000085A0;

  return v2;
}

@end