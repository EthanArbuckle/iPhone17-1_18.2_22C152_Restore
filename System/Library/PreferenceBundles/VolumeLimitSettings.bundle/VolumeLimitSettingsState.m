@interface VolumeLimitSettingsState
- (_TtC19VolumeLimitSettings24VolumeLimitSettingsState)init;
- (void)effectiveSettingsChanged;
@end

@implementation VolumeLimitSettingsState

- (_TtC19VolumeLimitSettings24VolumeLimitSettingsState)init
{
  return (_TtC19VolumeLimitSettings24VolumeLimitSettingsState *)VolumeLimitSettingsState.init()();
}

- (void)effectiveSettingsChanged
{
  v2 = self;
  sub_C350();
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC19VolumeLimitSettings24VolumeLimitSettingsState___observationRegistrar;
  uint64_t v3 = sub_C8B8();
  v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

@end