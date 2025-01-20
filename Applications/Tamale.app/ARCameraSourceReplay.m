@interface ARCameraSourceReplay
- (_TtC6Tamale20ARCameraSourceReplay)init;
- (void)replayConfigurationDidFinishReplaying:(id)a3;
@end

@implementation ARCameraSourceReplay

- (void)replayConfigurationDidFinishReplaying:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10014A204();
}

- (_TtC6Tamale20ARCameraSourceReplay)init
{
  result = (_TtC6Tamale20ARCameraSourceReplay *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6Tamale20ARCameraSourceReplay_session);
}

@end