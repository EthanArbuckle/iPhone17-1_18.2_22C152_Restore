@interface EnclosingViewController
- (BOOL)hasBlackBackground;
- (BOOL)usesWhiteBackButton;
- (_TtC5Setup23EnclosingViewController)initWithCoder:(id)a3;
- (_TtC5Setup23EnclosingViewController)initWithEnclosedViewController:(id)a3 spinnerDelegate:(id)a4;
- (_TtC5Setup23EnclosingViewController)initWithEnclosedViewController:(id)a3 spinnerDelegate:(id)a4 overrideBackButton:(BOOL)a5;
- (_TtC5Setup23EnclosingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation EnclosingViewController

- (_TtC5Setup23EnclosingViewController)initWithEnclosedViewController:(id)a3 spinnerDelegate:(id)a4
{
  return [(EnclosingViewController *)self initWithEnclosedViewController:a3 spinnerDelegate:a4 overrideBackButton:0];
}

- (_TtC5Setup23EnclosingViewController)initWithEnclosedViewController:(id)a3 spinnerDelegate:(id)a4 overrideBackButton:(BOOL)a5
{
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC5Setup23EnclosingViewController_enclosedViewController) = (Class)a3;
  swift_unknownObjectWeakAssign();
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC5Setup23EnclosingViewController_overrideBackButton) = a5;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for EnclosingViewController();
  id v8 = a3;
  return [(EnclosingViewController *)&v10 initWithNibName:0 bundle:0];
}

- (_TtC5Setup23EnclosingViewController)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  id v5 = a3;

  result = (_TtC5Setup23EnclosingViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100044104();
}

- (BOOL)hasBlackBackground
{
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    v4 = (void *)Strong;
    id v5 = self;
    unsigned __int8 v6 = [v4 hasBlackBackground];

    swift_unknownObjectRelease();
    LOBYTE(Strong) = v6;
  }
  return Strong;
}

- (BOOL)usesWhiteBackButton
{
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (!Strong) {
    return 0;
  }
  v4 = Strong;
  if ([Strong respondsToSelector:"usesWhiteBackButton"])
  {
    id v5 = self;
    unsigned __int8 v6 = [v4 usesWhiteBackButton];
  }
  else
  {
    unsigned __int8 v6 = 0;
  }
  swift_unknownObjectRelease();
  return v6;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_100044740(a3);
}

- (_TtC5Setup23EnclosingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC5Setup23EnclosingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Setup23EnclosingViewController_enclosedViewController));
  v3 = (char *)self + OBJC_IVAR____TtC5Setup23EnclosingViewController_delegate;

  sub_1000449A0((uint64_t)v3);
}

@end