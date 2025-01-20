@interface AKSignInWithAppleHealthCheckService
+ (AKSignInWithAppleHealthCheckService)sharedService;
- (AKSignInWithAppleHealthCheckService)init;
- (void)registerService;
@end

@implementation AKSignInWithAppleHealthCheckService

+ (AKSignInWithAppleHealthCheckService)sharedService
{
  if (qword_10026F9A8 != -1) {
    swift_once();
  }
  v2 = (void *)qword_100274458;

  return (AKSignInWithAppleHealthCheckService *)v2;
}

- (void)registerService
{
  v2 = self;
  sub_100111960();
}

- (AKSignInWithAppleHealthCheckService)init
{
  return (AKSignInWithAppleHealthCheckService *)sub_100112C88();
}

- (void).cxx_destruct
{
}

@end