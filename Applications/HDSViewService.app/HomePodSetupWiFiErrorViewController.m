@interface HomePodSetupWiFiErrorViewController
- (_TtC14HDSViewService35HomePodSetupWiFiErrorViewController)initWithContentView:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation HomePodSetupWiFiErrorViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_10004BA74();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for HomePodSetupWiFiErrorViewController();
  id v4 = v5.receiver;
  [(HomePodSetupIconContentViewController *)&v5 viewDidAppear:v3];
  if (swift_unknownObjectWeakLoadStrong())
  {
    sub_10007E75C();

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (_TtC14HDSViewService35HomePodSetupWiFiErrorViewController)initWithContentView:(id)a3
{
  *(void *)&self->super.PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService35HomePodSetupWiFiErrorViewController____lazy_storage___infoTableView] = 0;
  self->super.PRXCardContentViewController_opaque[OBJC_IVAR____TtC14HDSViewService35HomePodSetupWiFiErrorViewController_showInfo] = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for HomePodSetupWiFiErrorViewController();
  return [(HomePodSetupIconContentViewController *)&v5 initWithContentView:a3];
}

- (void).cxx_destruct
{
}

@end