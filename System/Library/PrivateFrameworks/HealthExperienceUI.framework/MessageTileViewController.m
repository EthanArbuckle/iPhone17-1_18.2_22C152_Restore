@interface MessageTileViewController
- (_TtC18HealthExperienceUI25MessageTileViewController)initWithCoder:(id)a3;
- (_TtC18HealthExperienceUI25MessageTileViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation MessageTileViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_1AD2B5CC4();
}

- (_TtC18HealthExperienceUI25MessageTileViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC18HealthExperienceUI25MessageTileViewController *)MessageTileViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC18HealthExperienceUI25MessageTileViewController)initWithCoder:(id)a3
{
  return (_TtC18HealthExperienceUI25MessageTileViewController *)MessageTileViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC18HealthExperienceUI25MessageTileViewController_messageView));
}

@end