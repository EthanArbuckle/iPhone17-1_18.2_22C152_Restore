@interface D2DSetupStartViewController
- (_TtC18SharingViewService27D2DSetupStartViewController)initWithContentView:(id)a3;
- (void)didReceiveDeviceSetupNotification:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation D2DSetupStartViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_10006C214();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_10006CB18(a3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for D2DSetupStartViewController();
  id v4 = v7.receiver;
  [(D2DSetupBaseViewController *)&v7 viewDidDisappear:v3];
  id v5 = [self defaultCenter];
  NSString v6 = String._bridgeToObjectiveC()();
  [v5 removeObserver:v4 name:v6 object:0];
}

- (void)didReceiveDeviceSetupNotification:(id)a3
{
  if (swift_unknownObjectWeakLoadStrong())
  {
    id v5 = a3;
    NSString v6 = self;
    sub_1000B4B58(v5);

    swift_unknownObjectRelease();
  }
}

- (_TtC18SharingViewService27D2DSetupStartViewController)initWithContentView:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for D2DSetupStartViewController();
  return [(D2DSetupBaseViewController *)&v5 initWithContentView:a3];
}

@end