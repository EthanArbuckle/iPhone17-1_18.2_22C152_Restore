@interface HearingAppPluginAppDelegate
- (_TtC16HearingAppPlugin27HearingAppPluginAppDelegate)init;
@end

@implementation HearingAppPluginAppDelegate

- (_TtC16HearingAppPlugin27HearingAppPluginAppDelegate)init
{
  uint64_t v2 = OBJC_IVAR____TtC16HearingAppPlugin27HearingAppPluginAppDelegate_logger;
  uint64_t v3 = qword_268C99318;
  v4 = self;
  if (v3 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_240A04018();
  uint64_t v6 = sub_240979894(v5, (uint64_t)qword_268C9AA58);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))((char *)v4 + v2, v6, v5);
  *(Class *)((char *)&v4->super.isa
           + OBJC_IVAR____TtC16HearingAppPlugin27HearingAppPluginAppDelegate____lazy_storage___articleIdentifiersByUrl) = 0;

  v8.receiver = v4;
  v8.super_class = (Class)type metadata accessor for HearingAppPluginAppDelegate();
  return [(HearingAppPluginAppDelegate *)&v8 init];
}

- (void).cxx_destruct
{
  uint64_t v2 = (char *)self + OBJC_IVAR____TtC16HearingAppPlugin27HearingAppPluginAppDelegate_logger;
  uint64_t v3 = sub_240A04018();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);

  swift_bridgeObjectRelease();
}

@end