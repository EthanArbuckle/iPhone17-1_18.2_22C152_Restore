@interface InstallSheetViewController
- (CGSize)preferredContentSize;
- (_TtC26AppDistributionLaunchAngel26InstallSheetViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC26AppDistributionLaunchAngel26InstallSheetViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (id)textView:(id)a3 primaryActionForTextItem:(id)a4 defaultAction:(id)a5;
- (void)cancelPressed;
- (void)confirmPressed;
- (void)miniProductPageRequestDidFinish;
- (void)moreButtonPressed;
- (void)setPreferredContentSize:(CGSize)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation InstallSheetViewController

- (void)viewDidLoad
{
}

- (void)viewDidAppear:(BOOL)a3
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v5 = self;
  sub_10001BCBC(a3);
  swift_release();
}

- (CGSize)preferredContentSize
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v3 = self;
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }

  swift_release();
  swift_release();
  double v4 = 624.0;
  double v5 = 0.0;
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)setPreferredContentSize:(CGSize)a3
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  double v4 = self;
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }

  swift_release();

  swift_release();
}

- (void)miniProductPageRequestDidFinish
{
}

- (void)moreButtonPressed
{
}

- (id)textView:(id)a3 primaryActionForTextItem:(id)a4 defaultAction:(id)a5
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = self;
  id v13 = (id)sub_10001E9A8((uint64_t)v10, (uint64_t)v11);
  swift_release();

  return v13;
}

- (void)confirmPressed
{
}

- (void)cancelPressed
{
  uint64_t v3 = sub_100007978(&qword_100074EA0);
  __chkstk_darwin(v3 - 8);
  double v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  v6 = self;
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  uint64_t v7 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v5, 1, 1, v7);
  v8 = v6;
  uint64_t v9 = static MainActor.shared.getter();
  id v10 = (void *)swift_allocObject();
  v10[2] = v9;
  v10[3] = &protocol witness table for MainActor;
  v10[4] = v8;
  sub_100033538((uint64_t)v5, (uint64_t)&unk_100075578, (uint64_t)v10);
  swift_release();

  swift_release();
  swift_release();
}

- (_TtC26AppDistributionLaunchAngel26InstallSheetViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  CGSize result = (_TtC26AppDistributionLaunchAngel26InstallSheetViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC26AppDistributionLaunchAngel26InstallSheetViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  type metadata accessor for MainActor();
  static MainActor.shared.getter();
  dispatch thunk of Actor.unownedExecutor.getter();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v7 = a5;
  CGSize result = (_TtC26AppDistributionLaunchAngel26InstallSheetViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10001F3C0((uint64_t)&self->delegate[OBJC_IVAR____TtC26AppDistributionLaunchAngel26InstallSheetViewController_localizedContent]);
  sub_10001FC3C((uint64_t)&self->delegate[OBJC_IVAR____TtC26AppDistributionLaunchAngel26InstallSheetViewController_delegate]);
  uint64_t v3 = *(void **)&self->delegate[OBJC_IVAR____TtC26AppDistributionLaunchAngel26InstallSheetViewController_confirmButton];
}

@end