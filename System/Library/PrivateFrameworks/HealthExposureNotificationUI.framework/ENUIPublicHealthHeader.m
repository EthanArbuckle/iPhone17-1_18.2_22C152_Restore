@interface ENUIPublicHealthHeader
- (NSString)subtitle;
- (NSString)title;
- (NSURL)logoURL;
- (UIColor)backgroundColor;
- (UIColor)textColor;
- (_TtC28HealthExposureNotificationUI22ENUIPublicHealthHeader)init;
- (_TtC28HealthExposureNotificationUI22ENUIPublicHealthHeader)initWithTitle:(id)a3 subtitle:(id)a4 backgroundColor:(id)a5 textColor:(id)a6 logoURL:(id)a7 style:(int64_t)a8;
- (int64_t)style;
@end

@implementation ENUIPublicHealthHeader

- (NSString)title
{
  return (NSString *)sub_229399C30();
}

- (NSString)subtitle
{
  return (NSString *)sub_229399C30();
}

- (UIColor)backgroundColor
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR____TtC28HealthExposureNotificationUI22ENUIPublicHealthHeader_backgroundColor));
}

- (UIColor)textColor
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR____TtC28HealthExposureNotificationUI22ENUIPublicHealthHeader_textColor));
}

- (NSURL)logoURL
{
  return (NSURL *)sub_229399CD4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC28HealthExposureNotificationUI22ENUIPublicHealthHeader_logoURL);
}

- (int64_t)style
{
  return *(int64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC28HealthExposureNotificationUI22ENUIPublicHealthHeader_style);
}

- (_TtC28HealthExposureNotificationUI22ENUIPublicHealthHeader)initWithTitle:(id)a3 subtitle:(id)a4 backgroundColor:(id)a5 textColor:(id)a6 logoURL:(id)a7 style:(int64_t)a8
{
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF0EEB0);
  MEMORY[0x270FA5388](v13 - 8);
  v15 = (char *)&v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_2294191A8();
  uint64_t v18 = v17;
  uint64_t v19 = sub_2294191A8();
  uint64_t v21 = v20;
  if (a7)
  {
    sub_229418DC8();
    uint64_t v22 = sub_229418DE8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v22 - 8) + 56))(v15, 0, 1, v22);
  }
  else
  {
    uint64_t v23 = sub_229418DE8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v15, 1, 1, v23);
  }
  v24 = (uint64_t *)((char *)self + OBJC_IVAR____TtC28HealthExposureNotificationUI22ENUIPublicHealthHeader_title);
  uint64_t *v24 = v16;
  v24[1] = v18;
  v25 = (uint64_t *)((char *)self + OBJC_IVAR____TtC28HealthExposureNotificationUI22ENUIPublicHealthHeader_subtitle);
  uint64_t *v25 = v19;
  v25[1] = v21;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC28HealthExposureNotificationUI22ENUIPublicHealthHeader_backgroundColor) = (Class)a5;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC28HealthExposureNotificationUI22ENUIPublicHealthHeader_textColor) = (Class)a6;
  sub_22939F44C((uint64_t)v15, (uint64_t)self + OBJC_IVAR____TtC28HealthExposureNotificationUI22ENUIPublicHealthHeader_logoURL);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC28HealthExposureNotificationUI22ENUIPublicHealthHeader_style) = (Class)a8;
  v26 = (objc_class *)type metadata accessor for ENUIPublicHealthHeader(0);
  v31.receiver = self;
  v31.super_class = v26;
  id v27 = a5;
  id v28 = a6;
  v29 = [(ENUIPublicHealthHeader *)&v31 init];
  sub_22939F4B4((uint64_t)v15);
  return v29;
}

- (_TtC28HealthExposureNotificationUI22ENUIPublicHealthHeader)init
{
  result = (_TtC28HealthExposureNotificationUI22ENUIPublicHealthHeader *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI22ENUIPublicHealthHeader_backgroundColor));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC28HealthExposureNotificationUI22ENUIPublicHealthHeader_textColor));
  v3 = (char *)self + OBJC_IVAR____TtC28HealthExposureNotificationUI22ENUIPublicHealthHeader_logoURL;

  sub_22939F4B4((uint64_t)v3);
}

@end