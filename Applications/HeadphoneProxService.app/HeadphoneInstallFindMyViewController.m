@interface HeadphoneInstallFindMyViewController
- (BOOL)_canShowWhileLocked;
- (_TtC20HeadphoneProxService36HeadphoneInstallFindMyViewController)initWithContentView:(id)a3;
- (void)viewDidLoad;
@end

@implementation HeadphoneInstallFindMyViewController

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for HeadphoneInstallFindMyViewController();
  id v2 = v3.receiver;
  [(HeadphoneInstallFindMyViewController *)&v3 viewDidLoad];
  [v2 setDismissalType:1];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC20HeadphoneProxService36HeadphoneInstallFindMyViewController)initWithContentView:(id)a3
{
  *(void *)&self->presenter[OBJC_IVAR____TtC20HeadphoneProxService36HeadphoneInstallFindMyViewController_presenter] = 0;
  swift_unknownObjectWeakInit();
  self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC20HeadphoneProxService36HeadphoneInstallFindMyViewController_type] = 25;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for HeadphoneInstallFindMyViewController();
  return [(HeadphoneInstallFindMyViewController *)&v6 initWithContentView:a3];
}

- (void).cxx_destruct
{
}

@end