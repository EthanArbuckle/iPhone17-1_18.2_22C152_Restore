@interface SkannerService
+ (NSString)entitlement;
+ (_TtC9appstored14SkannerService)defaultService;
- (_TtC9appstored14SkannerService)init;
- (void)fetchStoriesWithCompletionHandler:(id)a3;
@end

@implementation SkannerService

+ (_TtC9appstored14SkannerService)defaultService
{
  if (qword_1005A3028 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1005B1500;
  return (_TtC9appstored14SkannerService *)v2;
}

+ (NSString)entitlement
{
  NSString v2 = String._bridgeToObjectiveC()();
  return (NSString *)v2;
}

- (void)fetchStoriesWithCompletionHandler:(id)a3
{
  v4 = (void (**)(void *, Class, void))_Block_copy(a3);
  uint64_t v5 = qword_1005A2FD0;
  v7 = self;
  if (v5 != -1) {
    swift_once();
  }
  sub_10003EF4C();
  sub_10001644C(&qword_1005A5100);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  v4[2](v4, isa, 0);
  swift_bridgeObjectRelease();

  _Block_release(v4);
}

- (_TtC9appstored14SkannerService)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SkannerService();
  return [(SkannerService *)&v3 init];
}

@end