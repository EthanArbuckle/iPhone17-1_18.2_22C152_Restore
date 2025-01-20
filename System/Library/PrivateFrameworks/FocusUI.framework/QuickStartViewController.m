@interface QuickStartViewController
- (_TtC7FocusUI24QuickStartViewController)initWithCoder:(id)a3;
- (_TtC7FocusUI24QuickStartViewController)initWithModeIdentifier:(id)a3;
- (_TtC7FocusUI24QuickStartViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtP7FocusUI32QuickStartViewControllerDelegate_)delegate;
- (void)handleTap:(id)a3;
- (void)setDelegate:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation QuickStartViewController

- (_TtP7FocusUI32QuickStartViewControllerDelegate_)delegate
{
  v2 = (char *)self + OBJC_IVAR____TtC7FocusUI24QuickStartViewController_delegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x223C614B0](v2);
  return (_TtP7FocusUI32QuickStartViewControllerDelegate_ *)v3;
}

- (void)setDelegate:(id)a3
{
}

- (_TtC7FocusUI24QuickStartViewController)initWithModeIdentifier:(id)a3
{
  uint64_t v4 = sub_21FF03558();
  uint64_t v6 = v5;
  swift_unknownObjectWeakInit();
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC7FocusUI24QuickStartViewController_modeIdentifier);
  uint64_t *v7 = v4;
  v7[1] = v6;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for QuickStartViewController();
  return [(QuickStartViewController *)&v9 initWithNibName:0 bundle:0];
}

- (_TtC7FocusUI24QuickStartViewController)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  id v5 = a3;

  result = (_TtC7FocusUI24QuickStartViewController *)sub_21FF03588();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  QuickStartViewController.viewDidLoad()();
}

- (void)viewWillAppear:(BOOL)a3
{
  uint64_t v4 = self;
  QuickStartViewController.viewWillAppear(_:)(a3);
}

- (void)handleTap:(id)a3
{
}

- (_TtC7FocusUI24QuickStartViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC7FocusUI24QuickStartViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_21FF00C04((uint64_t)self + OBJC_IVAR____TtC7FocusUI24QuickStartViewController_delegate);
  swift_bridgeObjectRelease();
}

@end