@interface TipWithActionViewController
- (_TtC18HealthExperienceUI27TipWithActionViewController)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI27TipWithActionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation TipWithActionViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_1AD3F1FC0();
}

- (_TtC18HealthExperienceUI27TipWithActionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
    v6 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI27TipWithActionViewController_context;
    *(_OWORD *)v6 = 0u;
    *((_OWORD *)v6 + 1) = 0u;
    *((void *)v6 + 4) = 0;
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC18HealthExperienceUI27TipWithActionViewController____lazy_storage___tileView) = 0;
    id v7 = a4;
    v8 = (void *)sub_1AD73F180();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI27TipWithActionViewController_context;
    *(_OWORD *)v9 = 0u;
    *((_OWORD *)v9 + 1) = 0u;
    *((void *)v9 + 4) = 0;
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC18HealthExperienceUI27TipWithActionViewController____lazy_storage___tileView) = 0;
    id v10 = a4;
    v8 = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for TipWithActionViewController();
  v11 = [(TipWithActionViewController *)&v13 initWithNibName:v8 bundle:a4];

  return v11;
}

- (_TtC18HealthExperienceUI27TipWithActionViewController)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI27TipWithActionViewController_context;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI27TipWithActionViewController____lazy_storage___tileView) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for TipWithActionViewController();
  return [(TipWithActionViewController *)&v6 initWithCoder:a3];
}

- (void).cxx_destruct
{
  sub_1AD353CB0((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI27TipWithActionViewController_context);
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC18HealthExperienceUI27TipWithActionViewController____lazy_storage___tileView);
}

@end