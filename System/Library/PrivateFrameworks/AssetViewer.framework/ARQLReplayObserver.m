@interface ARQLReplayObserver
- (_TtC11AssetViewer18ARQLReplayObserver)init;
- (void)replayConfigurationDidFinishReplaying:(id)a3;
@end

@implementation ARQLReplayObserver

- (void)replayConfigurationDidFinishReplaying:(id)a3
{
  v3 = *(void (**)(uint64_t))((char *)&self->super.isa
                                      + OBJC_IVAR____TtC11AssetViewer18ARQLReplayObserver_callback);
  if (v3)
  {
    id v5 = a3;
    v7 = self;
    uint64_t v6 = sub_1E2873E2C((uint64_t)v3);
    v3(v6);
    sub_1E287427C((uint64_t)v3);
  }
}

- (_TtC11AssetViewer18ARQLReplayObserver)init
{
  result = (_TtC11AssetViewer18ARQLReplayObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end