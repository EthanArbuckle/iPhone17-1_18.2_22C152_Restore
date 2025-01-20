@interface HealthExperienceStoreCleanupOperation
- (NSString)description;
- (_TtC14HealthPlatform37HealthExperienceStoreCleanupOperation)init;
- (void)main;
@end

@implementation HealthExperienceStoreCleanupOperation

- (void)main
{
  v2 = self;
  sub_1C2651750();
}

- (NSString)description
{
  v2 = self;
  sub_1C277C2D0();
  sub_1C277B8D0();
  sub_1C277C450();
  sub_1C277B8D0();

  v3 = (void *)sub_1C277B820();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (_TtC14HealthPlatform37HealthExperienceStoreCleanupOperation)init
{
  result = (_TtC14HealthPlatform37HealthExperienceStoreCleanupOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC14HealthPlatform37HealthExperienceStoreCleanupOperation_context));
}

@end