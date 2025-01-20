@interface SubcredentialUIServiceApplication
+ (BOOL)shouldBackgroundMainThreadOnSuspendedLaunch;
@end

@implementation SubcredentialUIServiceApplication

+ (BOOL)shouldBackgroundMainThreadOnSuspendedLaunch
{
  return 0;
}

@end