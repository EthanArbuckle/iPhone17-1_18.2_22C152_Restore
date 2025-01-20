@interface SessionsViewController
+ (BOOL)_isSecureForRemoteViewService;
- (BOOL)_canShowWhileLocked;
- (_TtC13MediaControls22SessionsViewController)initWithCoder:(id)a3;
- (_TtC13MediaControls22SessionsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
- (void)viewDidLoad;
@end

@implementation SessionsViewController

- (_TtC13MediaControls22SessionsViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AE919D74();
}

- (void)loadView
{
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1AE916FC0();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (_TtC13MediaControls22SessionsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC13MediaControls22SessionsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaControls22SessionsViewController_sessionsView));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaControls22SessionsViewController_backdropDataSource));
  swift_release();
  swift_release();
  sub_1AE8F5874(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC13MediaControls22SessionsViewController_dismissHandler));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC13MediaControls22SessionsViewController_shareAudioTransitioningDelegate);
}

@end