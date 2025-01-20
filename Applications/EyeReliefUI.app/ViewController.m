@interface ViewController
- (BOOL)prefersStatusBarHidden;
- (_TtC11EyeReliefUI14ViewController)initWithCoder:(id)a3;
- (_TtC11EyeReliefUI14ViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (int64_t)preferredStatusBarStyle;
- (int64_t)preferredStatusBarUpdateAnimation;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation ViewController

- (void)viewDidAppear:(BOOL)a3
{
  v3 = self;
  sub_1000081B4();
}

- (void)viewDidDisappear:(BOOL)a3
{
  v3 = self;
  sub_1000085BC();
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for ViewController();
  [(ViewController *)&v2 viewDidLoad];
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  v6 = (void (*)(id))_Block_copy(a4);
  if (v6)
  {
    *(void *)(swift_allocObject() + 16) = v6;
    v6 = (void (*)(id))sub_100008980;
  }
  id v7 = a3;
  v8 = self;
  sub_100006528(a3, v6);
  sub_1000083D4((uint64_t)v6);
}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  v6 = (void (*)(uint64_t))_Block_copy(a4);
  if (v6)
  {
    *(void *)(swift_allocObject() + 16) = v6;
    v6 = (void (*)(uint64_t))sub_10000841C;
  }
  id v7 = a3;
  v8 = self;
  sub_100006AB4(a3, v6);
  sub_1000083D4((uint64_t)v6);
}

- (BOOL)prefersStatusBarHidden
{
  objc_super v2 = self;
  char v3 = sub_100006D64();

  return v3 & 1;
}

- (int64_t)preferredStatusBarStyle
{
  objc_super v2 = self;
  id v3 = [(ViewController *)v2 traitCollection];
  id v4 = [v3 userInterfaceStyle];

  if (v4 == (id)2) {
    return 1;
  }
  else {
    return 3;
  }
}

- (int64_t)preferredStatusBarUpdateAnimation
{
  return 1;
}

- (_TtC11EyeReliefUI14ViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC11EyeReliefUI14ViewController *)sub_100006ED4(v5, v7, a4);
}

- (_TtC11EyeReliefUI14ViewController)initWithCoder:(id)a3
{
  return (_TtC11EyeReliefUI14ViewController *)sub_100007020(a3);
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  id v3 = *(void **)&self->SBUIRemoteAlertServiceViewController_opaque[OBJC_IVAR____TtC11EyeReliefUI14ViewController_isSafeDistanceTimer];
}

@end