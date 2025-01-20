@interface DBVoiceControlViewController
- (BOOL)isPersistent;
- (NSString)sceneIdentifier;
- (RBSProcessIdentity)processIdentity;
- (_TtC9DashBoard28DBVoiceControlViewController)initWithApplication:(id)a3 proxyApplication:(id)a4 environment:(id)a5;
- (_TtC9DashBoard28DBVoiceControlViewController)initWithEnvironment:(id)a3;
- (void)dashboardStateProvider:(id)a3 didChangeLockoutState:(unint64_t)a4;
- (void)dealloc;
- (void)viewDidLoad;
@end

@implementation DBVoiceControlViewController

- (_TtC9DashBoard28DBVoiceControlViewController)initWithEnvironment:(id)a3
{
  return (_TtC9DashBoard28DBVoiceControlViewController *)DBVoiceControlViewController.init(environment:)(a3);
}

- (void)dealloc
{
  v2 = self;
  v3 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(v3, v2);

  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for DBVoiceControlViewController();
  [(DBVoiceControlViewController *)&v4 dealloc];
}

- (void).cxx_destruct
{
}

- (void)viewDidLoad
{
  v2 = self;
  DBVoiceControlViewController.viewDidLoad()();
}

- (_TtC9DashBoard28DBVoiceControlViewController)initWithApplication:(id)a3 proxyApplication:(id)a4 environment:(id)a5
{
  id v6 = a3;
  id v7 = a4;
  swift_unknownObjectRetain();
  result = (_TtC9DashBoard28DBVoiceControlViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (BOOL)isPersistent
{
  return _AXSCommandAndControlCarPlayEnabled() != 0;
}

- (RBSProcessIdentity)processIdentity
{
  sub_22D85E4C8();
  v3 = self;
  objc_super v4 = (void *)sub_22D85E4B8();
  swift_bridgeObjectRelease();
  id v5 = objc_msgSend(self, sel_identityForDaemonJobLabel_, v4);

  return (RBSProcessIdentity *)v5;
}

- (NSString)sceneIdentifier
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_22D85E4B8();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)dashboardStateProvider:(id)a3 didChangeLockoutState:(unint64_t)a4
{
  id v6 = *(void (**)(unint64_t))((*MEMORY[0x263F8EED0] & (uint64_t)self->super.super.super.super.isa)
                                               + 0x68);
  id v7 = a3;
  v8 = self;
  v6(a4);
  sub_22D81EED4();
}

@end