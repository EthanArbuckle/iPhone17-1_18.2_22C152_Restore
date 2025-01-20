@interface HeadphoneBatteryViewController
- (BOOL)_canShowWhileLocked;
- (_TtC20HeadphoneProxService30HeadphoneBatteryViewController)initWithContentView:(id)a3;
- (void)updateBatteryLevels;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HeadphoneBatteryViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_10006152C();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  v4 = (char *)v7.receiver;
  [(HeadphoneBatteryViewController *)&v7 viewWillAppear:v3];
  sub_100061CB8();
  v5 = (id *)&v4[OBJC_IVAR____TtC20HeadphoneProxService30HeadphoneBatteryViewController_movieBatteryView];
  swift_beginAccess();
  if (*v5)
  {
    v6 = (char *)*v5;
    sub_10000A5C4();

    v4 = v6;
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  sub_1000622D4(a3);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)updateBatteryLevels
{
  v2 = self;
  sub_100067940();
}

- (_TtC20HeadphoneProxService30HeadphoneBatteryViewController)initWithContentView:(id)a3
{
  id v4 = a3;
  v5 = (_TtC20HeadphoneProxService30HeadphoneBatteryViewController *)sub_100068C68((uint64_t)a3);

  return v5;
}

- (void).cxx_destruct
{
  sub_10001A2AC((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService30HeadphoneBatteryViewController_viewModel], &qword_1000D5660);
  BOOL v3 = &self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService30HeadphoneBatteryViewController_presenter];

  sub_100008F00((uint64_t)v3);
}

@end