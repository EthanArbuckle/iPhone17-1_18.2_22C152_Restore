@interface HeadphoneRepairViewController
- (BOOL)_canShowWhileLocked;
- (_TtC20HeadphoneProxService29HeadphoneRepairViewController)initWithContentView:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HeadphoneRepairViewController

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(HeadphoneRepairViewController *)&v3 viewDidLoad];
  [v2 setDismissalType:1];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_10007F634(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  sub_10007FA38(a3);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLayoutSubviews
{
  id v2 = self;
  sub_1000811D4();
}

- (_TtC20HeadphoneProxService29HeadphoneRepairViewController)initWithContentView:(id)a3
{
  id v4 = a3;
  v5 = (_TtC20HeadphoneProxService29HeadphoneRepairViewController *)sub_100081828((uint64_t)a3);

  return v5;
}

- (void).cxx_destruct
{
  sub_10004BF88((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService29HeadphoneRepairViewController_movieContainer], (uint64_t)v3, &qword_1000D5B10);
  sub_10007C6C4((uint64_t)v3);

  sub_10001A2AC((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService29HeadphoneRepairViewController_viewModel], &qword_1000D5660);
  sub_100008F00((uint64_t)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService29HeadphoneRepairViewController_presenter]);
}

@end