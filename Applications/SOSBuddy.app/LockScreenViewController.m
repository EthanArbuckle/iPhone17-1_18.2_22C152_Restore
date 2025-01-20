@interface LockScreenViewController
+ (BOOL)_isSecureForRemoteViewService;
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (BOOL)_canShowWhileLocked;
- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear;
- (BOOL)prefersStatusBarHidden;
- (_TtC8SOSBuddy24LockScreenViewController)init;
- (_TtC8SOSBuddy24LockScreenViewController)initWithCoder:(id)a3;
- (_TtC8SOSBuddy24LockScreenViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)configureWithUserInfo:(id)a3 contentBounds:(id)a4 endpoint:(id)a5;
- (void)dealloc;
- (void)didDismissForDismissType:(int64_t)a3;
- (void)didTap;
- (void)getContentPreferencesWithReplyBlock:(id)a3;
- (void)getInlinePresentationContentFrameWithReplyBlock:(id)a3;
- (void)loadView;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation LockScreenViewController

- (_TtC8SOSBuddy24LockScreenViewController)init
{
  return (_TtC8SOSBuddy24LockScreenViewController *)sub_100095CD4();
}

- (_TtC8SOSBuddy24LockScreenViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100098F30();
}

- (void)dealloc
{
  v2 = self;
  sub_100095F50();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8SOSBuddy24LockScreenViewController_tapGesture));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8SOSBuddy24LockScreenViewController_contentView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8SOSBuddy24LockScreenViewController_contentPreferences);
}

- (void)loadView
{
  v2 = self;
  sub_100096188();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1000967A8();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_100096A68(a3, (SEL *)&selRef_viewDidAppear_, "viewDidAppear for '%{public}@'");
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4 = self;
  sub_100096A68(a3, (SEL *)&selRef_viewDidDisappear_, "viewDidDisappear for '%{public}@'");
}

- (void)didTap
{
  v2 = self;
  sub_100096C88();
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)configureWithUserInfo:(id)a3 contentBounds:(id)a4 endpoint:(id)a5
{
  if (a3) {
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v6 = self;
  sub_10009915C();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)getContentPreferencesWithReplyBlock:(id)a3
{
  uint64_t v5 = type metadata accessor for DispatchPredicate();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (uint64_t *)((char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = (void (**)(void *, void))_Block_copy(a3);
  sub_10001E6FC(0, (unint64_t *)&qword_100387440);
  v10 = self;
  uint64_t *v8 = static OS_dispatch_queue.main.getter();
  (*(void (**)(uint64_t *, void, uint64_t))(v6 + 104))(v8, enum case for DispatchPredicate.onQueue(_:), v5);
  LOBYTE(a3) = _dispatchPreconditionTest(_:)();
  (*(void (**)(uint64_t *, uint64_t))(v6 + 8))(v8, v5);
  if (a3)
  {
    v9[2](v9, *(Class *)((char *)&v10->super.super.super.isa+ OBJC_IVAR____TtC8SOSBuddy24LockScreenViewController_contentPreferences));
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
  sub_10009768C(a3);
}

- (void)getInlinePresentationContentFrameWithReplyBlock:(id)a3
{
  id v3 = _Block_copy(a3);

  _Block_release(v3);
}

- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear
{
  v2 = self;
  sub_100097E38();

  return 0;
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  v2 = self;
  sub_1000981B8();

  return 1;
}

+ (id)_remoteViewControllerInterface
{
  swift_getObjCClassMetadata();
  id v2 = sub_100098388();

  return v2;
}

+ (id)_exportedInterface
{
  swift_getObjCClassMetadata();
  id v2 = (void *)sub_100098578();

  return v2;
}

- (_TtC8SOSBuddy24LockScreenViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8SOSBuddy24LockScreenViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end