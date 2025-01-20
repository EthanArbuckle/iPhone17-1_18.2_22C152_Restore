@interface LockScreenViewController
+ (BOOL)_isSecureForRemoteViewService;
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (BOOL)_canShowWhileLocked;
- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear;
- (BOOL)prefersStatusBarHidden;
- (_TtC15SleepLockScreen24LockScreenViewController)init;
- (_TtC15SleepLockScreen24LockScreenViewController)initWithCoder:(id)a3;
- (_TtC15SleepLockScreen24LockScreenViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)configureWithUserInfo:(id)a3 contentBounds:(id)a4 endpoint:(id)a5;
- (void)dealloc;
- (void)didChangeContentBounds;
- (void)didDismissForDismissType:(int64_t)a3;
- (void)getContentPreferencesWithReplyBlock:(id)a3;
- (void)getInlinePresentationContentFrameWithReplyBlock:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation LockScreenViewController

- (_TtC15SleepLockScreen24LockScreenViewController)init
{
  return (_TtC15SleepLockScreen24LockScreenViewController *)sub_100004C9C();
}

- (_TtC15SleepLockScreen24LockScreenViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10000F8D0();
}

- (void)dealloc
{
  v2 = self;
  sub_1000051EC();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_model));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_containerView));
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_contentPreferences));

  swift_release();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1000054D4();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_100005990(a3, (SEL *)&selRef_viewDidAppear_, "[%{public}s] view did appear");
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  sub_100005990(a3, (SEL *)&selRef_viewDidDisappear_, "[%{public}s] view did disappear");
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

+ (id)_remoteViewControllerInterface
{
  id v2 = (id)HKSPSleepLockScreenRemoteContentHostInterface();

  return v2;
}

+ (id)_exportedInterface
{
  id v2 = (id)HKSPSleepLockScreenRemoteContentServiceInterface();

  return v2;
}

- (void)configureWithUserInfo:(id)a3 contentBounds:(id)a4 endpoint:(id)a5
{
  if (a3) {
    uint64_t v8 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else {
    uint64_t v8 = 0;
  }
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v9 = self;
  sub_100008EC0(v8, (uint64_t)a4, (uint64_t)a5);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)didChangeContentBounds
{
  id v2 = self;
  sub_1000095F8();
}

- (void)getInlinePresentationContentFrameWithReplyBlock:(id)a3
{
  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_10000F984(v5, v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (void)getContentPreferencesWithReplyBlock:(id)a3
{
  uint64_t v5 = type metadata accessor for DispatchPredicate();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (uint64_t *)((char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = (void (**)(void *, void))_Block_copy(a3);
  sub_10000E944(0, (unint64_t *)&qword_1000193C8);
  v10 = self;
  *uint64_t v8 = static OS_dispatch_queue.main.getter();
  (*(void (**)(uint64_t *, void, uint64_t))(v6 + 104))(v8, enum case for DispatchPredicate.onQueue(_:), v5);
  LOBYTE(a3) = _dispatchPreconditionTest(_:)();
  (*(void (**)(uint64_t *, uint64_t))(v6 + 8))(v8, v5);
  if (a3)
  {
    v9[2](v9, *(Class *)((char *)&v10->super.super.super.isa+ OBJC_IVAR____TtC15SleepLockScreen24LockScreenViewController_contentPreferences));
    _Block_release(v9);
  }
  else
  {
    __break(1u);
  }
}

- (void)didDismissForDismissType:(int64_t)a3
{
  v4 = self;
  sub_10000AFE4(a3);
}

- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear
{
  return 0;
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC15SleepLockScreen24LockScreenViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC15SleepLockScreen24LockScreenViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end