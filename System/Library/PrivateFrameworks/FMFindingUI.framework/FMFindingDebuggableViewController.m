@interface FMFindingDebuggableViewController
- (BOOL)canBecomeFirstResponder;
- (_TtC11FMFindingUI33FMFindingDebuggableViewController)initWithCoder:(id)a3;
- (void)motionEnded:(int64_t)a3 withEvent:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation FMFindingDebuggableViewController

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (_TtC11FMFindingUI33FMFindingDebuggableViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC11FMFindingUI33FMFindingDebuggableViewController_debugViewController) = 0;
  uint64_t v5 = OBJC_IVAR____TtC11FMFindingUI33FMFindingDebuggableViewController_debugViewContainer;
  id v6 = objc_allocWithZone(MEMORY[0x263F82E00]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  result = (_TtC11FMFindingUI33FMFindingDebuggableViewController *)sub_24D39D2B0();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FMFindingDebuggableViewController();
  id v2 = v3.receiver;
  [(FMFindingViewController *)&v3 viewDidLoad];
  sub_24D39B84C();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for FMFindingDebuggableViewController();
  v4 = (char *)v5.receiver;
  [(FMFindingViewController *)&v5 viewWillAppear:v3];
  objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC11FMFindingUI33FMFindingDebuggableViewController_debugViewContainer], sel_setHidden_, 0, v5.receiver, v5.super_class);
}

- (void)motionEnded:(int64_t)a3 withEvent:(id)a4
{
  if (a3 == 1) {
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC11FMFindingUI33FMFindingDebuggableViewController_debugViewContainer), sel_setHidden_, 0, a4);
  }
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11FMFindingUI33FMFindingDebuggableViewController_debugViewController));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC11FMFindingUI33FMFindingDebuggableViewController_debugViewContainer);
}

@end