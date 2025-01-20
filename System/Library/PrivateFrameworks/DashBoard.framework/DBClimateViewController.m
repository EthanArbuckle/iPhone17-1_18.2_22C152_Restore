@interface DBClimateViewController
- (BOOL)isPersistent;
- (CGRect)sceneFrame;
- (NSString)sceneIdentifier;
- (UIApplicationStarkSceneSpecification)sceneSpecification;
- (_TtC9DashBoard23DBClimateViewController)initWithApplication:(id)a3 proxyApplication:(id)a4 environment:(id)a5;
- (_TtC9DashBoard23DBClimateViewController)initWithEnvironment:(id)a3 layoutEngine:(id)a4 didUpdateInsets:(id)a5;
- (int64_t)sceneInterfaceStyle;
- (void)clientSceneSettingsDidUpdate:(id)a3;
- (void)loadView;
- (void)performCancelTapGesture:(id)a3;
- (void)updateStatusBarWithStyle:(int64_t)a3;
- (void)updateWithDeactivationReasons:(unint64_t)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation DBClimateViewController

- (int64_t)sceneInterfaceStyle
{
  return *(int64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC9DashBoard23DBClimateViewController_currentInterfaceStyle);
}

- (_TtC9DashBoard23DBClimateViewController)initWithEnvironment:(id)a3 layoutEngine:(id)a4 didUpdateInsets:(id)a5
{
  v7 = _Block_copy(a5);
  if (v7)
  {
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = v7;
    v7 = sub_22D801578;
  }
  else
  {
    uint64_t v8 = 0;
  }
  swift_unknownObjectRetain();
  return (_TtC9DashBoard23DBClimateViewController *)DBClimateViewController.init(environment:layoutEngine:didUpdateInsets:)(a3, a4, (uint64_t)v7, v8);
}

- (void)performCancelTapGesture:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_22D7FF288(v4);
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DBClimateViewController();
  id v2 = v3.receiver;
  [(DBClimateViewController *)&v3 viewDidLoad];
  sub_22D7FF97C();
}

- (void)viewDidLayoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for DBClimateViewController();
  id v2 = v7.receiver;
  [(DBClimateViewController *)&v7 viewDidLayoutSubviews];
  uint64_t v3 = swift_allocObject();
  *(void *)(v3 + 16) = v2;
  v6[4] = sub_22D8016D0;
  v6[5] = v3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 1107296256;
  v6[2] = sub_22D7F45C4;
  v6[3] = &block_descriptor_41;
  id v4 = _Block_copy(v6);
  id v5 = v2;
  swift_release();
  objc_msgSend(v5, sel_updateSceneSettingsWithBlock_, v4);
  _Block_release(v4);
}

- (void)loadView
{
  id v3 = objc_allocWithZone((Class)type metadata accessor for DBClimateView());
  id v4 = self;
  id v5 = objc_msgSend(v3, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  [(DBClimateViewController *)v4 setView:v5];
}

- (_TtC9DashBoard23DBClimateViewController)initWithApplication:(id)a3 proxyApplication:(id)a4 environment:(id)a5
{
  id v6 = a3;
  id v7 = a4;
  swift_unknownObjectRetain();
  result = (_TtC9DashBoard23DBClimateViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_22D7FF1B4(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC9DashBoard23DBClimateViewController_insetsUpdatedCompletion));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9DashBoard23DBClimateViewController_tapDismissGestureRecognizer));
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC9DashBoard23DBClimateViewController_layoutEngine);
}

- (NSString)sceneIdentifier
{
  swift_bridgeObjectRetain();
  id v2 = (void *)sub_22D85E4B8();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (UIApplicationStarkSceneSpecification)sceneSpecification
{
  id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x263F31450]), sel_init);
  return (UIApplicationStarkSceneSpecification *)v2;
}

- (BOOL)isPersistent
{
  return 1;
}

- (CGRect)sceneFrame
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC9DashBoard23DBClimateViewController_layoutEngine), sel_climateWindowFrame);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)clientSceneSettingsDidUpdate:(id)a3
{
  id v4 = a3;
  double v5 = self;
  DBClimateViewController.clientSceneSettingsDidUpdate(_:)(v4);
}

- (void)updateStatusBarWithStyle:(int64_t)a3
{
  id v4 = self;
  DBClimateViewController.updateStatusBar(style:)((void *)a3);
}

- (void)updateWithDeactivationReasons:(unint64_t)a3
{
  id v4 = self;
  DBClimateViewController.update(deactivationReasons:)((__C::UIApplicationSceneDeactivationReasonMask)a3);
}

@end