@interface CredentialSharingUIServiceApplication
+ (BOOL)shouldBackgroundMainThreadOnSuspendedLaunch;
@end

@implementation CredentialSharingUIServiceApplication

+ (BOOL)shouldBackgroundMainThreadOnSuspendedLaunch
{
  return 0;
}

@end