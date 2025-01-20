@interface SpecifierState
- (_TtC22PodcastsSettingsPlugin14SpecifierState)init;
- (void)reloadSpecifiers;
@end

@implementation SpecifierState

- (_TtC22PodcastsSettingsPlugin14SpecifierState)init
{
  return (_TtC22PodcastsSettingsPlugin14SpecifierState *)sub_6800();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC22PodcastsSettingsPlugin14SpecifierState__specifierSections;
  uint64_t v4 = sub_3238((uint64_t *)&unk_309C0);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC22PodcastsSettingsPlugin14SpecifierState_systemPolicy);
}

- (void)reloadSpecifiers
{
  v2 = self;
  sub_6A34();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_20A98();
}

@end