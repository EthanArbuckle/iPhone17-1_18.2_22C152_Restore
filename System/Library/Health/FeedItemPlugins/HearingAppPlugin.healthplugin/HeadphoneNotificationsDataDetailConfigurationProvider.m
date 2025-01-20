@interface HeadphoneNotificationsDataDetailConfigurationProvider
- (_TtC16HearingAppPlugin53HeadphoneNotificationsDataDetailConfigurationProvider)init;
@end

@implementation HeadphoneNotificationsDataDetailConfigurationProvider

- (_TtC16HearingAppPlugin53HeadphoneNotificationsDataDetailConfigurationProvider)init
{
  uint64_t v2 = OBJC_IVAR____TtC16HearingAppPlugin53HeadphoneNotificationsDataDetailConfigurationProvider_logger;
  uint64_t v3 = qword_268C99318;
  v4 = self;
  if (v3 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_240A04018();
  uint64_t v6 = sub_240979894(v5, (uint64_t)qword_268C9AA58);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))((char *)v4 + v2, v6, v5);
  uint64_t v7 = OBJC_IVAR____TtC16HearingAppPlugin53HeadphoneNotificationsDataDetailConfigurationProvider_dataType;
  sub_2409824B8(0, (unint64_t *)&qword_26AFD48C0);
  *(Class *)((char *)&v4->super.isa + v7) = (Class)MEMORY[0x245604B10]((id)*MEMORY[0x263F09300]);

  v9.receiver = v4;
  v9.super_class = (Class)type metadata accessor for HeadphoneNotificationsDataDetailConfigurationProvider();
  return [(HeadphoneNotificationsDataDetailConfigurationProvider *)&v9 init];
}

- (void).cxx_destruct
{
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC16HearingAppPlugin53HeadphoneNotificationsDataDetailConfigurationProvider_logger;
  uint64_t v4 = sub_240A04018();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC16HearingAppPlugin53HeadphoneNotificationsDataDetailConfigurationProvider_dataType);
}

@end