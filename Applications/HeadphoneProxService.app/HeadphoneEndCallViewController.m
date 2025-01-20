@interface HeadphoneEndCallViewController
- (BOOL)_canShowWhileLocked;
- (_TtC20HeadphoneProxService30HeadphoneEndCallViewController)initWithContentView:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation HeadphoneEndCallViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_100013398();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_100014074(a3);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC20HeadphoneProxService30HeadphoneEndCallViewController)initWithContentView:(id)a3
{
  id v4 = a3;
  v5 = (_TtC20HeadphoneProxService30HeadphoneEndCallViewController *)sub_100014F6C((uint64_t)a3);

  return v5;
}

- (void).cxx_destruct
{
  v3 = &self->PRXFeatureTourContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService30HeadphoneEndCallViewController_presenter];

  sub_100008F00((uint64_t)v3);
}

@end