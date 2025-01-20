@interface CARThemeEditorViewController
- (_TtC15CarPlaySettings28CARThemeEditorViewController)initWithCoder:(id)a3;
- (_TtC15CarPlaySettings28CARThemeEditorViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)didSelectButton:(id)a3 withInteractionModel:(unint64_t)a4;
- (void)dismissHandler;
- (void)resetHandler;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CARThemeEditorViewController

- (_TtC15CarPlaySettings28CARThemeEditorViewController)initWithCoder:(id)a3
{
  result = (_TtC15CarPlaySettings28CARThemeEditorViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10005BE60();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for CARThemeEditorViewController();
  id v4 = v8.receiver;
  [(CARThemeEditorViewController *)&v8 viewWillAppear:v3];
  id v5 = [v4 navigationController];
  if (v5)
  {
    v6 = v5;
    id v7 = [v5 navigationBar];

    [v7 setBarStyle:4];
    id v4 = v7;
  }
}

- (void)dismissHandler
{
  sub_10002F83C(0, (unint64_t *)&qword_1000AFA80);
  id v4 = self;
  BOOL v3 = (void *)static OS_os_log.default.getter();
  static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)();

  [(CARThemeEditorViewController *)v4 dismissViewControllerAnimated:1 completion:0];
}

- (void)resetHandler
{
  v2 = self;
  sub_10005D53C();
}

- (void)didSelectButton:(id)a3 withInteractionModel:(unint64_t)a4
{
  swift_unknownObjectRetain();
  id v5 = self;
  _bridgeAnyObjectToAny(_:)();
  uint64_t v6 = swift_unknownObjectRelease();
  (*(void (**)(uint64_t))((swift_isaMask & (uint64_t)v5->super.super.super.isa) + 0x70))(v6);

  sub_10002FF84((uint64_t)&v7);
}

- (_TtC15CarPlaySettings28CARThemeEditorViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC15CarPlaySettings28CARThemeEditorViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15CarPlaySettings28CARThemeEditorViewController_clusterThemeManager));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15CarPlaySettings28CARThemeEditorViewController_carSession);
}

@end