@interface NLRouterOverrideService
+ (BOOL)isEnabled;
- (_TtC13CDMFoundation23NLRouterOverrideService)init;
@end

@implementation NLRouterOverrideService

+ (BOOL)isEnabled
{
  return sub_22647ABD4() & 1;
}

- (_TtC13CDMFoundation23NLRouterOverrideService)init
{
  return (_TtC13CDMFoundation23NLRouterOverrideService *)sub_22647ACA8();
}

- (void).cxx_destruct
{
  sub_22647AE68(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13CDMFoundation23NLRouterOverrideService_overridesStore), *(void **)&self->overridesStore[OBJC_IVAR____TtC13CDMFoundation23NLRouterOverrideService_overridesStore]);
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13CDMFoundation23NLRouterOverrideService_assetInfo);
  uint64_t v4 = *(void *)&self->overridesStore[OBJC_IVAR____TtC13CDMFoundation23NLRouterOverrideService_assetInfo];
  sub_2264121EC(v3, v4);
}

@end