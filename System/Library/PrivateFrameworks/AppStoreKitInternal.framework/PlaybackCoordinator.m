@interface PlaybackCoordinator
- (_TtC19AppStoreKitInternal19PlaybackCoordinator)init;
- (void)didEnterBackground;
- (void)willEnterForeground;
@end

@implementation PlaybackCoordinator

- (_TtC19AppStoreKitInternal19PlaybackCoordinator)init
{
  return (_TtC19AppStoreKitInternal19PlaybackCoordinator *)PlaybackCoordinator.init()();
}

- (void)didEnterBackground
{
  v2 = self;
  sub_1E18226A8();
}

- (void)willEnterForeground
{
  v2 = self;
  sub_1E182371C();
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
}

@end