@interface CellWithAccessoryViewController
- (NSString)description;
- (_TtC18HealthExperienceUI31CellWithAccessoryViewController)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI31CellWithAccessoryViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation CellWithAccessoryViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_1AD62C010();
}

- (NSString)description
{
  v2 = self;
  sub_1AD62C230();

  v3 = (void *)sub_1AD73F180();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC18HealthExperienceUI31CellWithAccessoryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC18HealthExperienceUI31CellWithAccessoryViewController *)CellWithAccessoryViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC18HealthExperienceUI31CellWithAccessoryViewController)initWithCoder:(id)a3
{
  uint64_t v5 = (char *)self + OBJC_IVAR____TtC18HealthExperienceUI31CellWithAccessoryViewController_context;
  *(_OWORD *)uint64_t v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((void *)v5 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI31CellWithAccessoryViewController_contentView) = 0;
  uint64_t v6 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC18HealthExperienceUI31CellWithAccessoryViewController_baseIdentifier);
  uint64_t v7 = (objc_class *)type metadata accessor for CellWithAccessoryViewController();
  *uint64_t v6 = 0;
  v6[1] = 0;
  v9.receiver = self;
  v9.super_class = v7;
  return [(CellWithAccessoryViewController *)&v9 initWithCoder:a3];
}

- (void).cxx_destruct
{
  sub_1AD353CB0((uint64_t)self + OBJC_IVAR____TtC18HealthExperienceUI31CellWithAccessoryViewController_context);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI31CellWithAccessoryViewController_contentView));
  swift_bridgeObjectRelease();
}

@end