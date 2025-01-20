@interface IdentityRemoteAlertViewController
- (BOOL)prefersStatusBarHidden;
- (_TtC19ContactlessReaderUI33IdentityRemoteAlertViewController)initWithCoder:(id)a3;
- (_TtC19ContactlessReaderUI33IdentityRemoteAlertViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (int64_t)preferredStatusBarUpdateAnimation;
- (unint64_t)preferredScreenEdgesDeferringSystemGestures;
- (unint64_t)supportedInterfaceOrientations;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)handleHomeButtonPressed;
- (void)handlePanWithSender:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation IdentityRemoteAlertViewController

- (BOOL)prefersStatusBarHidden
{
  return *((unsigned char *)&self->super.super.super.super.isa
         + OBJC_IVAR____TtC19ContactlessReaderUI33IdentityRemoteAlertViewController_hideStatusBar);
}

- (int64_t)preferredStatusBarUpdateAnimation
{
  return 2;
}

- (unint64_t)preferredScreenEdgesDeferringSystemGestures
{
  return 4;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)dealloc
{
  v2 = self;
  sub_23EEBFB18();
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC19ContactlessReaderUI33IdentityRemoteAlertViewController_identityViewController));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC19ContactlessReaderUI33IdentityRemoteAlertViewController_hideMenuIndicatorTimer));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC19ContactlessReaderUI33IdentityRemoteAlertViewController_interruptionMonitor);
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(IdentityRemoteAlertViewController *)&v3 viewDidLoad];
  sub_23EEBFDBC();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = v5.receiver;
  [(IdentityRemoteAlertViewController *)&v5 viewWillAppear:v3];
  if (qword_268C20328 != -1) {
    swift_once();
  }
  BrightnessManager.increaseBrightnessIfNeeded()();
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = self;
  sub_23EEC034C(v3);
}

- (void)handleHomeButtonPressed
{
  id v2 = self;
  sub_23EEC0840();
}

- (void)handlePanWithSender:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  sub_23EEC0AA8(v4);
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  v6 = (void (*)(uint64_t))_Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    v6 = (void (*)(uint64_t))sub_23EEC3BC0;
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v8 = a3;
  v9 = self;
  sub_23EEC11AC(a3, v6, v7);
  sub_23EDB8970((uint64_t)v6);
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  objc_super v5 = _Block_copy(a4);
  if (v5)
  {
    *(void *)(swift_allocObject() + 16) = v5;
    v6 = sub_23EEC3A10;
  }
  else
  {
    v6 = 0;
  }
  uint64_t v7 = self;
  sub_23EEC36CC();
  sub_23EDB8970((uint64_t)v6);
}

- (_TtC19ContactlessReaderUI33IdentityRemoteAlertViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_23EF05418();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC19ContactlessReaderUI33IdentityRemoteAlertViewController *)sub_23EEC2F24(v5, v7, a4);
}

- (_TtC19ContactlessReaderUI33IdentityRemoteAlertViewController)initWithCoder:(id)a3
{
  return (_TtC19ContactlessReaderUI33IdentityRemoteAlertViewController *)sub_23EEC32BC(a3);
}

@end