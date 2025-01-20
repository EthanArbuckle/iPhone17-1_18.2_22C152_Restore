@interface NoiseNotificationsDataTypeDetailConfigurationProvider
- (_TtC16HearingAppPlugin53NoiseNotificationsDataTypeDetailConfigurationProvider)init;
@end

@implementation NoiseNotificationsDataTypeDetailConfigurationProvider

- (_TtC16HearingAppPlugin53NoiseNotificationsDataTypeDetailConfigurationProvider)init
{
  uint64_t v3 = OBJC_IVAR____TtC16HearingAppPlugin53NoiseNotificationsDataTypeDetailConfigurationProvider_dataType;
  sub_2409AAEE4();
  v4 = (void *)*MEMORY[0x263F092C0];
  v5 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)MEMORY[0x245604B10](v4);

  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for NoiseNotificationsDataTypeDetailConfigurationProvider();
  return [(NoiseNotificationsDataTypeDetailConfigurationProvider *)&v7 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16HearingAppPlugin53NoiseNotificationsDataTypeDetailConfigurationProvider_dataType));
}

@end