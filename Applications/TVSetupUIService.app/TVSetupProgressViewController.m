@interface TVSetupProgressViewController
- (_TtC16TVSetupUIService29TVSetupProgressViewController)initWithContentView:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TVSetupProgressViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_100006800();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for TVSetupProgressViewController();
  id v4 = v6.receiver;
  [(TVSetupProgressViewController *)&v6 viewWillAppear:v3];
  sub_10001128C(0x5F474E4954544553, (void *)0xEA00000000005055);
  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v4 showActivityIndicatorWithStatus:v5];
}

- (_TtC16TVSetupUIService29TVSetupProgressViewController)initWithContentView:(id)a3
{
  *(_WORD *)&self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC16TVSetupUIService29TVSetupProgressViewController_deviceModelCode] = 256;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TVSetupProgressViewController();
  return [(TVSetupProgressViewController *)&v5 initWithContentView:a3];
}

@end