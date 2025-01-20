@interface AKAppleIDPasskeyHealthCheckService
+ (AKAppleIDPasskeyHealthCheckService)sharedService;
- (AKAppleIDPasskeyHealthCheckService)init;
- (void)start;
@end

@implementation AKAppleIDPasskeyHealthCheckService

+ (AKAppleIDPasskeyHealthCheckService)sharedService
{
  if (qword_10026F9E0 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1002744C8;

  return (AKAppleIDPasskeyHealthCheckService *)v2;
}

- (AKAppleIDPasskeyHealthCheckService)init
{
  v3 = self;
  v4 = self;
  v5 = (objc_class *)[v3 sharedInstance];
  *(Class *)((char *)&v4->super.isa + OBJC_IVAR___AKAppleIDPasskeyHealthCheckService_accountManager) = v5;

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for AppleIDPasskeyHealthCheckService();
  return [(AKAppleIDPasskeyHealthCheckService *)&v7 init];
}

- (void)start
{
  v2 = self;
  sub_100157848();
}

- (void).cxx_destruct
{
}

@end