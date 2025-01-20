@interface OrganDonationStatusViewController
- (_TtC18HealthExperienceUI33OrganDonationStatusViewController)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI33OrganDonationStatusViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation OrganDonationStatusViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_1AD4CF9F8();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for OrganDonationStatusViewController();
  [(OrganDonationStatusViewController *)&v4 viewWillAppear:v3];
}

- (_TtC18HealthExperienceUI33OrganDonationStatusViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    _sSo19HKFeatureIdentifiera18HealthExperienceUIE2idSSvg_0();
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC18HealthExperienceUI33OrganDonationStatusViewController_currentChildViewController) = 0;
    id v6 = a4;
    v7 = (void *)sub_1AD73F180();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC18HealthExperienceUI33OrganDonationStatusViewController_currentChildViewController) = 0;
    id v8 = a4;
    v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for OrganDonationStatusViewController();
  v9 = [(OrganDonationStatusViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC18HealthExperienceUI33OrganDonationStatusViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC18HealthExperienceUI33OrganDonationStatusViewController_currentChildViewController) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for OrganDonationStatusViewController();
  return [(OrganDonationStatusViewController *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI33OrganDonationStatusViewController_currentChildViewController));
}

@end