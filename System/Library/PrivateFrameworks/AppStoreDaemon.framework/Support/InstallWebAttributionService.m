@interface InstallWebAttributionService
+ (NSString)entitlement;
+ (_TtC9appstored28InstallWebAttributionService)defaultService;
- (_TtC9appstored28InstallWebAttributionService)init;
- (void)addInstallWebAttributionParamsWithConfig:(id)a3 completionHandler:(id)a4;
@end

@implementation InstallWebAttributionService

+ (_TtC9appstored28InstallWebAttributionService)defaultService
{
  if (qword_1005A2FC8 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1005B1480;
  return (_TtC9appstored28InstallWebAttributionService *)v2;
}

+ (NSString)entitlement
{
  NSString v2 = String._bridgeToObjectiveC()();
  return (NSString *)v2;
}

- (void)addInstallWebAttributionParamsWithConfig:(id)a3 completionHandler:(id)a4
{
  v6 = (void (*)(void *))_Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    v6 = (void (*)(void *))sub_100034BAC;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = a3;
  v9 = self;
  sub_100038094(v8, v6, v7);
  sub_100018DD4((uint64_t)v6);
}

- (_TtC9appstored28InstallWebAttributionService)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(InstallWebAttributionService *)&v3 init];
}

@end