@interface DisclosureCellViewController
- (_TtC18HealthExperienceUI28DisclosureCellViewController)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI28DisclosureCellViewController)initWithNibName:(id)a3 bundle:(id)a4;
@end

@implementation DisclosureCellViewController

- (_TtC18HealthExperienceUI28DisclosureCellViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC18HealthExperienceUI28DisclosureCellViewController____lazy_storage___disclosureIndicator) = 0;
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC18HealthExperienceUI28DisclosureCellViewController____lazy_storage___cellAccessoryView) = 0;
    id v6 = a4;
    v7 = (void *)sub_1AD73F180();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC18HealthExperienceUI28DisclosureCellViewController____lazy_storage___disclosureIndicator) = 0;
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC18HealthExperienceUI28DisclosureCellViewController____lazy_storage___cellAccessoryView) = 0;
    id v8 = a4;
    v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for DisclosureCellViewController();
  v9 = [(CellWithAccessoryViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC18HealthExperienceUI28DisclosureCellViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI28DisclosureCellViewController____lazy_storage___disclosureIndicator) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI28DisclosureCellViewController____lazy_storage___cellAccessoryView) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DisclosureCellViewController();
  return [(CellWithAccessoryViewController *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI28DisclosureCellViewController____lazy_storage___disclosureIndicator));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI28DisclosureCellViewController____lazy_storage___cellAccessoryView);
}

@end