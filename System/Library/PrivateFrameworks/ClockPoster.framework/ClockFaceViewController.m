@interface ClockFaceViewController
- (BOOL)_canShowWhileLocked;
- (_TtC11ClockPoster23ClockFaceViewController)initWithCoder:(id)a3;
- (_TtC11ClockPoster23ClockFaceViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation ClockFaceViewController

- (void)loadView
{
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ClockFaceViewController();
  id v2 = v3.receiver;
  [(ClockFaceViewController *)&v3 viewDidLoad];
  objc_msgSend(v2, sel_setOverrideUserInterfaceStyle_, 2, v3.receiver, v3.super_class);
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ClockFaceViewController();
  v4 = v5.receiver;
  [(ClockFaceViewController *)&v5 viewDidAppear:v3];
  v4[OBJC_IVAR____TtC11ClockPoster23ClockFaceViewController_canAnimateRedMode] = 1;
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ClockFaceViewController();
  v4 = v5.receiver;
  [(ClockFaceViewController *)&v5 viewDidDisappear:v3];
  v4[OBJC_IVAR____TtC11ClockPoster23ClockFaceViewController_canAnimateRedMode] = 0;
}

- (_TtC11ClockPoster23ClockFaceViewController)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC11ClockPoster23ClockFaceViewController_isDisplayStyleRedMode) = 0;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC11ClockPoster23ClockFaceViewController_canAnimateRedMode) = 0;
  id v4 = a3;

  result = (_TtC11ClockPoster23ClockFaceViewController *)sub_24A057BC8();
  __break(1u);
  return result;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC11ClockPoster23ClockFaceViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC11ClockPoster23ClockFaceViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11ClockPoster23ClockFaceViewController_hostView));
}

@end