@interface CARThemeSelectorViewController
- (_TtC15CarPlaySettings30CARThemeSelectorViewController)initWithCoder:(id)a3;
- (_TtC15CarPlaySettings30CARThemeSelectorViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC15CarPlaySettings30CARThemeSelectorViewController)initWithPanelController:(id)a3;
- (void)clusterThemeManagerDidFinishLoading:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)synchronizeThemeIfNeeded;
- (void)vehicleDidUpdate;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CARThemeSelectorViewController

- (_TtC15CarPlaySettings30CARThemeSelectorViewController)initWithPanelController:(id)a3
{
  return (_TtC15CarPlaySettings30CARThemeSelectorViewController *)sub_100033D44((uint64_t)a3);
}

- (_TtC15CarPlaySettings30CARThemeSelectorViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000372E8();
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)type metadata accessor for CARThemeSelectorViewController();
  [(CARThemeSelectorViewController *)&v2 viewDidLoad];
}

- (void)viewWillAppear:(BOOL)a3
{
}

- (void)viewWillDisappear:(BOOL)a3
{
}

- (void)synchronizeThemeIfNeeded
{
  objc_super v2 = self;
  sub_100034ADC();
}

- (void)vehicleDidUpdate
{
  objc_super v2 = self;
  sub_100034E34();
}

- (void)dealloc
{
  id v3 = self;
  v4 = self;
  id v5 = [v3 defaultCenter];
  [v5 removeObserver:v4];

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for CARThemeSelectorViewController();
  [(CARThemeSelectorViewController *)&v6 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15CarPlaySettings30CARThemeSelectorViewController_clusterThemeManager));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15CarPlaySettings30CARThemeSelectorViewController_layoutSelectorViewController));

  swift_unknownObjectRelease();
}

- (_TtC15CarPlaySettings30CARThemeSelectorViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC15CarPlaySettings30CARThemeSelectorViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)invalidate
{
}

- (void)clusterThemeManagerDidFinishLoading:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = [v4 displays];
  sub_10002F83C(0, &qword_1000AF0C8);
  unint64_t v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  id v8 = [v4 themeData];
  sub_10002F83C(0, &qword_1000AF088);
  uint64_t v9 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  sub_1000352C0(v7, v9);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end