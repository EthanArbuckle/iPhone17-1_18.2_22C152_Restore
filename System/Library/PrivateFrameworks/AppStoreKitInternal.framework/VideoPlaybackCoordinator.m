@interface VideoPlaybackCoordinator
- (_TtC19AppStoreKitInternal24VideoPlaybackCoordinator)init;
- (void)didChangeAutoPlayVideoSetting:(id)a3;
- (void)didEnterBackground;
- (void)willEnterForeground;
@end

@implementation VideoPlaybackCoordinator

- (void)didChangeAutoPlayVideoSetting:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1E15EDB34(v4);
}

- (void)didEnterBackground
{
  v2 = self;
  sub_1E172CB40();
  sub_1E172CF98();
  v3 = *(Class *)((char *)&v2->super.isa + OBJC_IVAR____TtC19AppStoreKitInternal24VideoPlaybackCoordinator__activeVideo);
  if (v3)
  {
    uint64_t v4 = *(void *)&v2->visibilityTracker[OBJC_IVAR____TtC19AppStoreKitInternal24VideoPlaybackCoordinator__activeVideo];
    uint64_t ObjectType = swift_getObjectType();
    v6 = *(uint64_t (**)(uint64_t, uint64_t))(v4 + 96);
    v8 = v3;
    if (v6(ObjectType, v4)) {
      (*(void (**)(uint64_t, uint64_t))(v4 + 152))(ObjectType, v4);
    }

    v7 = v8;
  }
  else
  {
    v7 = v2;
  }
}

- (void)willEnterForeground
{
  v2 = self;
  sub_1E17306CC();
}

- (_TtC19AppStoreKitInternal24VideoPlaybackCoordinator)init
{
  result = (_TtC19AppStoreKitInternal24VideoPlaybackCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();
  v3 = (char *)self + OBJC_IVAR____TtC19AppStoreKitInternal24VideoPlaybackCoordinator_metricsPipeline;
  uint64_t v4 = sub_1E1D5A498();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19AppStoreKitInternal24VideoPlaybackCoordinator__activeVideo);
}

@end