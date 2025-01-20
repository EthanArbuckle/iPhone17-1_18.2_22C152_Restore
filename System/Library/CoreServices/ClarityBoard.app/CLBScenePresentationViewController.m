@interface CLBScenePresentationViewController
+ (id)sceneIdentifierForBundleIdentifier:(id)a3;
- (BOOL)_canShowWhileLocked;
- (CLBScenePresentationViewController)initWithCoder:(id)a3;
- (CLBScenePresentationViewController)initWithName:(id)a3 bundleIdentifier:(id)a4 supportsClarityUI:(BOOL)a5 sceneRequestOptions:(id)a6 shouldDisableIdleTimer:(BOOL)a7 avoidsBackButton:(BOOL)a8 displayLayoutStyle:(int64_t)a9;
- (FBScene)scene;
- (void)dealloc;
- (void)invalidateIfNeeded;
- (void)scene:(id)a3 clientDidConnect:(id)a4;
- (void)scene:(id)a3 didApplyUpdateWithContext:(id)a4;
- (void)setScene:(id)a3;
- (void)viewDidLayoutSubviews;
@end

@implementation CLBScenePresentationViewController

- (FBScene)scene
{
  return (FBScene *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR___CLBScenePresentationViewController_scene));
}

- (void)setScene:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___CLBScenePresentationViewController_scene);
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___CLBScenePresentationViewController_scene) = (Class)a3;
  id v3 = a3;
}

- (CLBScenePresentationViewController)initWithName:(id)a3 bundleIdentifier:(id)a4 supportsClarityUI:(BOOL)a5 sceneRequestOptions:(id)a6 shouldDisableIdleTimer:(BOOL)a7 avoidsBackButton:(BOOL)a8 displayLayoutStyle:(int64_t)a9
{
  uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v15 = v14;
  uint64_t v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v18 = v17;
  id v19 = a6;
  sub_100070F2C(v13, v15, v16, v18, a5, a6, a7, a8, a9);
  return result;
}

- (CLBScenePresentationViewController)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR___CLBScenePresentationViewController_isInvalidated) = 0;
  id v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR___CLBScenePresentationViewController_lastSeenViewSize);
  *id v4 = 0;
  v4[1] = 0;
  id v5 = a3;

  result = (CLBScenePresentationViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)invalidateIfNeeded
{
  v2 = self;
  sub_100071980();
}

- (void)dealloc
{
  v2 = self;
  sub_100071980();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for ScenePresentationViewController();
  [(CLBScenePresentationViewController *)&v3 dealloc];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (id)sceneIdentifierForBundleIdentifier:(id)a3
{
  v3._countAndFlagsBits = static String._unconditionallyBridgeFromObjectiveC(_:)();
  String.append(_:)(v3);
  swift_bridgeObjectRelease();
  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v4;
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_100071EA0();
}

- (void)scene:(id)a3 clientDidConnect:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_100075FB4(v6);
}

- (void)scene:(id)a3 didApplyUpdateWithContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_100072904((uint64_t)v6, v7);
}

@end