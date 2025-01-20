@interface CellWithAccessoryView
- (NSString)description;
- (_TtC18HealthExperienceUI21CellWithAccessoryView)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI21CellWithAccessoryView)initWithFrame:(CGRect)a3;
@end

@implementation CellWithAccessoryView

- (_TtC18HealthExperienceUI21CellWithAccessoryView)initWithCoder:(id)a3
{
  return (_TtC18HealthExperienceUI21CellWithAccessoryView *)sub_1AD5D33E4(a3);
}

- (NSString)description
{
  v2 = self;
  sub_1AD5D3FDC();

  v3 = (void *)sub_1AD73F180();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC18HealthExperienceUI21CellWithAccessoryView)initWithFrame:(CGRect)a3
{
  result = (_TtC18HealthExperienceUI21CellWithAccessoryView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI21CellWithAccessoryView____lazy_storage___textLabel));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI21CellWithAccessoryView_accessoryView);
}

@end