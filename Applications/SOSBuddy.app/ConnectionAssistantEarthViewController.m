@interface ConnectionAssistantEarthViewController
- (BOOL)_canShowWhileLocked;
- (_TtC8SOSBuddy38ConnectionAssistantEarthViewController)initWithCoder:(id)a3;
- (_TtC8SOSBuddy38ConnectionAssistantEarthViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation ConnectionAssistantEarthViewController

- (_TtC8SOSBuddy38ConnectionAssistantEarthViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000533E4();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10005295C();
}

- (void)viewIsAppearing:(BOOL)a3
{
}

- (void)viewWillDisappear:(BOOL)a3
{
}

- (void)viewWillLayoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for ConnectionAssistantEarthViewController();
  v2 = (char *)v14.receiver;
  [(ConnectionAssistantEarthViewController *)&v14 viewWillLayoutSubviews];
  id v3 = *(void **)&v2[OBJC_IVAR____TtC8SOSBuddy38ConnectionAssistantEarthViewController__metalView];
  id v4 = [v2 view];
  if (v4)
  {
    v5 = v4;
    [v4 bounds];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;

    [v3 setFrame:v7, v9, v11, v13];
  }
  else
  {
    __break(1u);
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC8SOSBuddy38ConnectionAssistantEarthViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8SOSBuddy38ConnectionAssistantEarthViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8SOSBuddy38ConnectionAssistantEarthViewController__metalView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8SOSBuddy38ConnectionAssistantEarthViewController__displayLink));

  swift_release();
}

@end