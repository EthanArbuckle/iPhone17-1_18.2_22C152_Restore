@interface ENUIPublicHealthLegalDocument
- (NSString)text;
- (NSString)version;
- (_TtC28HealthExposureNotificationUI29ENUIPublicHealthLegalDocument)init;
- (_TtC28HealthExposureNotificationUI29ENUIPublicHealthLegalDocument)initWithText:(id)a3 version:(id)a4;
@end

@implementation ENUIPublicHealthLegalDocument

- (NSString)text
{
  return (NSString *)sub_229399C30();
}

- (NSString)version
{
  return (NSString *)sub_229399C30();
}

- (_TtC28HealthExposureNotificationUI29ENUIPublicHealthLegalDocument)initWithText:(id)a3 version:(id)a4
{
  uint64_t v5 = sub_2294191A8();
  uint64_t v7 = v6;
  uint64_t v8 = sub_2294191A8();
  v9 = (uint64_t *)((char *)self + OBJC_IVAR____TtC28HealthExposureNotificationUI29ENUIPublicHealthLegalDocument_text);
  uint64_t *v9 = v5;
  v9[1] = v7;
  v10 = (uint64_t *)((char *)self + OBJC_IVAR____TtC28HealthExposureNotificationUI29ENUIPublicHealthLegalDocument_version);
  uint64_t *v10 = v8;
  v10[1] = v11;
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for ENUIPublicHealthLegalDocument();
  return [(ENUIPublicHealthLegalDocument *)&v13 init];
}

- (_TtC28HealthExposureNotificationUI29ENUIPublicHealthLegalDocument)init
{
  result = (_TtC28HealthExposureNotificationUI29ENUIPublicHealthLegalDocument *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end