@interface HeadphoneMismatchViewController
- (BOOL)_canShowWhileLocked;
- (_TtC20HeadphoneProxService31HeadphoneMismatchViewController)initWithContentView:(id)a3;
- (void)viewDidLoad;
@end

@implementation HeadphoneMismatchViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_10001FF4C();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC20HeadphoneProxService31HeadphoneMismatchViewController)initWithContentView:(id)a3
{
  id v4 = a3;
  v5 = (_TtC20HeadphoneProxService31HeadphoneMismatchViewController *)sub_100022D98((uint64_t)a3);

  return v5;
}

- (void).cxx_destruct
{
  sub_10001A2AC((uint64_t)&self->leftLabel[OBJC_IVAR____TtC20HeadphoneProxService31HeadphoneMismatchViewController_viewModel], &qword_1000D5660);

  v3 = &self->leftLabel[OBJC_IVAR____TtC20HeadphoneProxService31HeadphoneMismatchViewController_presenter];

  sub_100008F00((uint64_t)v3);
}

@end