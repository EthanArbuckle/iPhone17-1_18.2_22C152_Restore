@interface HeadphoneConnectViewController
- (BOOL)_canShowWhileLocked;
- (_TtC20HeadphoneProxService30HeadphoneConnectViewController)initWithContentView:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HeadphoneConnectViewController

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(HeadphoneConnectViewController *)&v3 viewDidLoad];
  [v2 setDismissalType:1];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_100046970(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  sub_100046D68(a3);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC20HeadphoneProxService30HeadphoneConnectViewController)initWithContentView:(id)a3
{
  id v4 = a3;
  v5 = (_TtC20HeadphoneProxService30HeadphoneConnectViewController *)sub_10004D2C4((uint64_t)a3);

  return v5;
}

- (void).cxx_destruct
{
  sub_10004BF88((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService30HeadphoneConnectViewController_movieContainer], (uint64_t)v3, &qword_1000D5B10);
  sub_10004CE60((uint64_t)v3, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_10004CEE4);

  sub_10001A2AC((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService30HeadphoneConnectViewController_viewModel], &qword_1000D5660);
  sub_100008F00((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService30HeadphoneConnectViewController_presenter]);
}

@end