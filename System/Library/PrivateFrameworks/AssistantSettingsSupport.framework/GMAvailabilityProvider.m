@interface GMAvailabilityProvider
- (_TtC24AssistantSettingsSupport22GMAvailabilityProvider)init;
@end

@implementation GMAvailabilityProvider

- (_TtC24AssistantSettingsSupport22GMAvailabilityProvider)init
{
  result = (_TtC24AssistantSettingsSupport22GMAvailabilityProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC24AssistantSettingsSupport22GMAvailabilityProvider_provider;
  uint64_t v4 = sub_220C74800();
  v6 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  ((void (*)(void *__return_ptr, char *, uint64_t))v6)((void *)(v4 - 8), v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC24AssistantSettingsSupport22GMAvailabilityProvider_diffusionModelProvider;

  v6(v5, v4);
}

@end