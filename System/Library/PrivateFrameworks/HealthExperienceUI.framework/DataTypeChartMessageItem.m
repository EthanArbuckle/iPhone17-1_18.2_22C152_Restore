@interface DataTypeChartMessageItem
- (_TtC18HealthExperienceUI24DataTypeChartMessageItem)init;
- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4;
@end

@implementation DataTypeChartMessageItem

- (_TtC18HealthExperienceUI24DataTypeChartMessageItem)init
{
  result = (_TtC18HealthExperienceUI24DataTypeChartMessageItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI24DataTypeChartMessageItem____lazy_storage___cnCapabilitiesManager));

  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI24DataTypeChartMessageItem_viewConfiguration));

  v3 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI24DataTypeChartMessageItem_profileInformation;
  uint64_t v4 = sub_1AD73C130();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
}

@end