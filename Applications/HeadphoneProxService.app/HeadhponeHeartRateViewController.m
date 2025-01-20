@interface HeadhponeHeartRateViewController
- (BOOL)_canShowWhileLocked;
- (_TtC20HeadphoneProxService32HeadhponeHeartRateViewController)initWithContentView:(id)a3;
- (void)viewDidLoad;
@end

@implementation HeadhponeHeartRateViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_10007684C();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC20HeadphoneProxService32HeadhponeHeartRateViewController)initWithContentView:(id)a3
{
  id v4 = a3;
  v5 = (_TtC20HeadphoneProxService32HeadhponeHeartRateViewController *)sub_100077CD0((uint64_t)a3);

  return v5;
}

- (void).cxx_destruct
{
  v3 = &self->PRXFeatureTourContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService32HeadhponeHeartRateViewController_presenter];

  sub_100008F00((uint64_t)v3);
}

@end