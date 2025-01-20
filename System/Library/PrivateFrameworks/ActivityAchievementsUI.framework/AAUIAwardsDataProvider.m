@interface AAUIAwardsDataProvider
- (AAUIAwardsDataProvider)init;
- (void)dealloc;
@end

@implementation AAUIAwardsDataProvider

- (void)dealloc
{
  v2 = self;
  AAUIAwardsDataProvider.__deallocating_deinit();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR___AAUIAwardsDataProvider_calendar;
  uint64_t v4 = sub_2292CC1A8();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  swift_bridgeObjectRelease();
}

- (AAUIAwardsDataProvider)init
{
  result = (AAUIAwardsDataProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end