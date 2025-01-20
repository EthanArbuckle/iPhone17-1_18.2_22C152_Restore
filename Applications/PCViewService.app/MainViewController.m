@interface MainViewController
+ (BOOL)_isSecureForRemoteViewService;
- (BOOL)_canShowWhileLocked;
- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear;
- (MainViewController)initWithCoder:(id)a3;
- (MainViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)didInvalidateForRemoteAlert;
- (void)handleButtonActions:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
@end

@implementation MainViewController

- (void)dealloc
{
  v2 = self;
  id v3 = sub_10006ED9C();
  NSString v4 = String._bridgeToObjectiveC()();
  [v3 ulog:40 message:v4];

  v5.receiver = v2;
  v5.super_class = (Class)type metadata accessor for MainViewController();
  [(MainViewController *)&v5 dealloc];
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_release();

  swift_release();
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  v6 = (void (*)(void *))_Block_copy(a4);
  if (v6)
  {
    *(void *)(swift_allocObject() + 16) = v6;
    v6 = (void (*)(void *))sub_100012990;
  }
  id v7 = a3;
  v8 = self;
  sub_10000FB08(a3, v6);
  sub_10000F808((uint64_t)v6);
}

- (void)didInvalidateForRemoteAlert
{
  v2 = self;
  sub_100010064();
}

- (void)handleButtonActions:(id)a3
{
  sub_10001280C(0, &qword_1000F7060);
  sub_100012848();
  uint64_t v4 = static Set._unconditionallyBridgeFromObjectiveC(_:)();
  objc_super v5 = self;
  sub_100010224(v4);

  swift_bridgeObjectRelease();
}

- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear
{
  return 0;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1000115D0((uint64_t)a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v4 = self;
  sub_1000117E4(a3);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100011938();
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  id v7 = a3;
  v8 = self;
  sub_100011A78(a3, a4);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (MainViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (MainViewController *)sub_100012124(v5, v7, a4);
}

- (MainViewController)initWithCoder:(id)a3
{
  return (MainViewController *)sub_100012294(a3);
}

@end