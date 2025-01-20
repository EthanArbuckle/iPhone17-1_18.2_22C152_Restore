@interface SiriUIVisualResponseViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)isInAmbient;
- (BOOL)isInAmbientInteractivity;
- (BOOL)isPresentedWithSmartDialogText;
- (NSString)appBundleId;
- (_TtC4Siri34SiriUIVisualResponseViewController)initWithCoder:(id)a3;
- (_TtC4Siri34SiriUIVisualResponseViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC4Siri34SiriUIVisualResponseViewController)initWithView:(id)a3 aceObject:(id)a4;
- (void)didEndEditing;
- (void)informHostOfViewResize:(CGSize)a3;
- (void)navigateWithAceCommand:(id)a3;
- (void)navigateWithPluginModelData:(id)a3 bundleName:(id)a4;
- (void)navigateWithResponseData:(id)a3;
- (void)performAceCommand:(id)a3;
- (void)performSFCommand:(id)a3;
- (void)performShowResponse:(id)a3;
- (void)setAppBundleId:(id)a3;
- (void)setIsInAmbient:(BOOL)a3;
- (void)setIsInAmbientInteractivity:(BOOL)a3;
- (void)setIsPresentedWithSmartDialogText:(BOOL)a3;
- (void)siriDidDeactivate;
- (void)siriDidStartSpeakingWithIdentifier:(id)a3;
- (void)siriDidStopSpeakingWithIdentifier:(id)a3 speechQueueIsEmpty:(BOOL)a4;
- (void)siriDidTapOutsideContent;
- (void)siriDidUpdateASRWithRecognition:(id)a3;
- (void)siriIsIdleAndQuiet;
- (void)siriWillStartRequest;
- (void)submitIFMessagePayload:(id)a3;
- (void)updateBackgroundIfNeeded;
- (void)updateSharedState:(id)a3;
- (void)willBeginEditing;
@end

@implementation SiriUIVisualResponseViewController

- (BOOL)isInAmbient
{
  return sub_1000A2A34(self, (uint64_t)a2, (SEL *)&selRef_isInAmbient);
}

- (void)setIsInAmbient:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v4 = (char *)v6.receiver;
  [(SiriUIVisualResponseViewController *)&v6 setIsInAmbient:v3];
  double v5 = SiriSharedUICompactAmbientContentScaleAmount;
  if (!v3) {
    double v5 = 1.0;
  }
  [*(id *)&v4[OBJC_IVAR____TtC4Siri34SiriUIVisualResponseViewController_visualResponseView] setIsInAmbient:v3 withScaleFactor:v5];
}

- (BOOL)isInAmbientInteractivity
{
  return sub_1000A2A34(self, (uint64_t)a2, (SEL *)&selRef_isInAmbientInteractivity);
}

- (void)setIsInAmbientInteractivity:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v4 = (char *)v6.receiver;
  [(SiriUIVisualResponseViewController *)&v6 setIsInAmbientInteractivity:v3];
  double v5 = (double *)&SiriSharedUICompactAmbientContentScaleAmount;
  if (v3) {
    double v5 = (double *)&SiriSharedUICompactAmbientContentScaleAmountForInteractivity;
  }
  [*(id *)&v4[OBJC_IVAR____TtC4Siri34SiriUIVisualResponseViewController_visualResponseView] setIsInAmbient:1 withScaleFactor:*v5];
}

- (BOOL)isPresentedWithSmartDialogText
{
  return sub_1000A2A34(self, (uint64_t)a2, (SEL *)&selRef_isPresentedWithSmartDialogText);
}

- (void)setIsPresentedWithSmartDialogText:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v4 = (char *)v5.receiver;
  [(SiriUIVisualResponseViewController *)&v5 setIsPresentedWithSmartDialogText:v3];
  [*(id *)&v4[OBJC_IVAR____TtC4Siri34SiriUIVisualResponseViewController_visualResponseView] setIsPresentedWithSmartDialogText:v3];
}

- (NSString)appBundleId
{
  if (*(void *)&self->visualResponseView[OBJC_IVAR____TtC4Siri34SiriUIVisualResponseViewController_appBundleId])
  {
    swift_bridgeObjectRetain();
    NSString v2 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v2 = 0;
  }

  return (NSString *)v2;
}

- (void)setAppBundleId:(id)a3
{
  if (a3)
  {
    uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  objc_super v6 = (uint64_t *)&self->SiriUICardSnippetViewController_opaque[OBJC_IVAR____TtC4Siri34SiriUIVisualResponseViewController_appBundleId];
  *objc_super v6 = v4;
  v6[1] = v5;

  swift_bridgeObjectRelease();
}

- (_TtC4Siri34SiriUIVisualResponseViewController)initWithView:(id)a3 aceObject:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  return (_TtC4Siri34SiriUIVisualResponseViewController *)sub_1000A2BBC(v5, a4);
}

- (_TtC4Siri34SiriUIVisualResponseViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1000A6DC0();
}

- (BOOL)_canShowWhileLocked
{
  return _SiriUISafeForLockScreen(self, a2);
}

- (void)updateSharedState:(id)a3
{
  id v4 = a3;
  v10 = self;
  uint64_t v5 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v7 = v6;

  id v8 = *(id *)&v10->SiriUICardSnippetViewController_opaque[OBJC_IVAR____TtC4Siri34SiriUIVisualResponseViewController_visualResponseView];
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  [v8 updateSharedStateData:isa];

  sub_100088E54(v5, v7);
}

- (void)updateBackgroundIfNeeded
{
  NSString v2 = self;
  sub_1000A2F90();
}

- (void)siriDidUpdateASRWithRecognition:(id)a3
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    id v4 = *(void **)&self->SiriUICardSnippetViewController_opaque[OBJC_IVAR____TtC4Siri34SiriUIVisualResponseViewController_visualResponseView];
    uint64_t v5 = self;
    id v6 = v4;
    id v7 = String._bridgeToObjectiveC()();
    [v6 setAsrText:v7];

    swift_bridgeObjectRelease();
  }
}

- (void)siriDidStartSpeakingWithIdentifier:(id)a3
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    id v4 = *(void **)&self->SiriUICardSnippetViewController_opaque[OBJC_IVAR____TtC4Siri34SiriUIVisualResponseViewController_visualResponseView];
    uint64_t v5 = self;
    id v6 = v4;
    id v7 = String._bridgeToObjectiveC()();
    [v6 setPlayerState:0 aceId:v7];

    swift_bridgeObjectRelease();
  }
}

- (void)siriDidStopSpeakingWithIdentifier:(id)a3 speechQueueIsEmpty:(BOOL)a4
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v5 = *(void **)&self->SiriUICardSnippetViewController_opaque[OBJC_IVAR____TtC4Siri34SiriUIVisualResponseViewController_visualResponseView];
    id v6 = self;
    id v7 = v5;
    id v8 = String._bridgeToObjectiveC()();
    [v7 setPlayerState:1 aceId:v8];

    swift_bridgeObjectRelease();
  }
}

- (void)siriWillStartRequest
{
}

- (void)siriDidDeactivate
{
  uint64_t v3 = OBJC_IVAR____TtC4Siri34SiriUIVisualResponseViewController_visualResponseView;
  id v4 = *(void **)&self->SiriUICardSnippetViewController_opaque[OBJC_IVAR____TtC4Siri34SiriUIVisualResponseViewController_visualResponseView];
  uint64_t v5 = self;
  [v4 endEditing:1];
  [*(id *)&self->SiriUICardSnippetViewController_opaque[v3] postSiriEvent:3];
}

- (void)siriDidTapOutsideContent
{
}

- (void)siriIsIdleAndQuiet
{
}

- (_TtC4Siri34SiriUIVisualResponseViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC4Siri34SiriUIVisualResponseViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(void **)&self->SiriUICardSnippetViewController_opaque[OBJC_IVAR____TtC4Siri34SiriUIVisualResponseViewController_backgroundView];
}

- (void)performAceCommand:(id)a3
{
  swift_getObjectType();
  id v5 = a3;
  id v6 = self;
  sub_1000A6C80(v5, v6);
}

- (void)performSFCommand:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1000A3624();
}

- (void)performShowResponse:(id)a3
{
}

- (void)submitIFMessagePayload:(id)a3
{
}

- (void)navigateWithResponseData:(id)a3
{
}

- (void)navigateWithPluginModelData:(id)a3 bundleName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11 = self;
  uint64_t v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v10 = v9;

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  sub_1000A49FC();
  swift_bridgeObjectRelease();
  sub_100088E54(v8, v10);
}

- (void)navigateWithAceCommand:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1000A4C34(v4);
}

- (void)informHostOfViewResize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = self;
  sub_1000A573C(width, height);
}

- (void)willBeginEditing
{
  NSString v2 = self;
  sub_1000A590C();
}

- (void)didEndEditing
{
  NSString v2 = self;
  sub_1000A59F8();
}

@end