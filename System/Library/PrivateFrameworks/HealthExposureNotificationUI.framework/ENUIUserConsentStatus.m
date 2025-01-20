@interface ENUIUserConsentStatus
- (NSDate)dateConsented;
- (NSString)textConsented;
- (NSString)versionConsented;
- (_TtC28HealthExposureNotificationUI21ENUIUserConsentStatus)init;
- (_TtC28HealthExposureNotificationUI21ENUIUserConsentStatus)initWithTextConsented:(id)a3 versionConsented:(id)a4 dateConsented:(id)a5;
@end

@implementation ENUIUserConsentStatus

- (NSString)textConsented
{
  return (NSString *)sub_229399C30();
}

- (NSString)versionConsented
{
  return (NSString *)sub_229399C30();
}

- (NSDate)dateConsented
{
  v2 = (void *)sub_229418E18();

  return (NSDate *)v2;
}

- (_TtC28HealthExposureNotificationUI21ENUIUserConsentStatus)initWithTextConsented:(id)a3 versionConsented:(id)a4 dateConsented:(id)a5
{
  uint64_t v6 = sub_229418E68();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_2294191A8();
  uint64_t v12 = v11;
  uint64_t v13 = sub_2294191A8();
  uint64_t v15 = v14;
  sub_229418E48();
  v16 = (uint64_t *)((char *)self + OBJC_IVAR____TtC28HealthExposureNotificationUI21ENUIUserConsentStatus_textConsented);
  uint64_t *v16 = v10;
  v16[1] = v12;
  v17 = (uint64_t *)((char *)self + OBJC_IVAR____TtC28HealthExposureNotificationUI21ENUIUserConsentStatus_versionConsented);
  uint64_t *v17 = v13;
  v17[1] = v15;
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))((char *)self + OBJC_IVAR____TtC28HealthExposureNotificationUI21ENUIUserConsentStatus_dateConsented, v9, v6);
  v18 = (objc_class *)type metadata accessor for ENUIUserConsentStatus(0);
  v21.receiver = self;
  v21.super_class = v18;
  v19 = [(ENUIUserConsentStatus *)&v21 init];
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v19;
}

- (_TtC28HealthExposureNotificationUI21ENUIUserConsentStatus)init
{
  result = (_TtC28HealthExposureNotificationUI21ENUIUserConsentStatus *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC28HealthExposureNotificationUI21ENUIUserConsentStatus_dateConsented;
  uint64_t v4 = sub_229418E68();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end