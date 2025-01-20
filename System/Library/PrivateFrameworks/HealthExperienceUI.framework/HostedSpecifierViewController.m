@interface HostedSpecifierViewController
- (_TtC18HealthExperienceUI29HostedSpecifierViewController)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI29HostedSpecifierViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewControllerDidLeaveAdaptiveModal;
- (void)viewControllerWillEnterAdaptiveModal;
- (void)viewDidLoad;
@end

@implementation HostedSpecifierViewController

- (_TtC18HealthExperienceUI29HostedSpecifierViewController)initWithCoder:(id)a3
{
  result = (_TtC18HealthExperienceUI29HostedSpecifierViewController *)sub_1AD7408B0();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1AD2C9DAC();
}

- (_TtC18HealthExperienceUI29HostedSpecifierViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC18HealthExperienceUI29HostedSpecifierViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI29HostedSpecifierViewController_specifierViewController));
}

- (void)viewControllerWillEnterAdaptiveModal
{
  v2 = self;
  _s18HealthExperienceUI29HostedSpecifierViewControllerC04viewG22WillEnterAdaptiveModalyyF_0();
}

- (void)viewControllerDidLeaveAdaptiveModal
{
  id v4 = self;
  id v2 = [(HostedSpecifierViewController *)v4 traitCollection];
  id v3 = objc_msgSend(v2, sel_horizontalSizeClass);

  if (v3 == (id)1) {
    sub_1AD2CA018();
  }
}

@end