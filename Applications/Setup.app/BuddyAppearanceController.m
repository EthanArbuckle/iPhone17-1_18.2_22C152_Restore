@interface BuddyAppearanceController
+ (BOOL)controllerAffectedByTapFreeSetup;
+ (BOOL)hiddenFromMultiUser;
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BOOL)controllerNeedsToRun;
- (BOOL)scrollViewContentIsUnderTray;
- (BYAnalyticsEventAppearance)analyticsEventAppearance;
- (BYRunState)runState;
- (BuddyDisplayZoomExecutor)displayZoomExecutor;
- (BuddyFlowItemDispositionProvider)flowItemDispositionProvider;
- (_TtC5Setup22AppearanceModeProvider)appearanceModeProvider;
- (_TtC5Setup25BuddyAppearanceController)init;
- (_TtC5Setup25BuddyAppearanceController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC5Setup25BuddyAppearanceController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)continueTapped;
- (void)dealloc;
- (void)modeChanged;
- (void)performExtendedInitializationWithCompletion:(id)a3;
- (void)revertTapped;
- (void)setAnalyticsEventAppearance:(id)a3;
- (void)setAppearanceModeProvider:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayZoomExecutor:(id)a3;
- (void)setFlowItemDispositionProvider:(id)a3;
- (void)setRunState:(id)a3;
- (void)showAccessibilitySettings;
- (void)updateContentViewForScrollViewLayoutChange;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation BuddyAppearanceController

- (_TtC5Setup25BuddyAppearanceController)init
{
  return (_TtC5Setup25BuddyAppearanceController *)sub_100031E58();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100032390();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_1000336F0(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_100033ECC(a3);
}

- (void)modeChanged
{
  v2 = self;
  sub_100034968();
}

- (void)updateContentViewForScrollViewLayoutChange
{
  v2 = self;
  sub_100034DF8();
}

- (BOOL)scrollViewContentIsUnderTray
{
  v3 = *(void **)&self->OBSetupAssistantAppearanceController_opaque[OBJC_IVAR____TtC5Setup25BuddyAppearanceController_revertButton];
  if (!v3)
  {
    v6 = self;
    goto LABEL_5;
  }
  v4 = self;
  if (([v3 isHidden] & 1) == 0)
  {
LABEL_5:
    v8.receiver = self;
    v8.super_class = (Class)type metadata accessor for BuddyAppearanceController();
    BOOL v5 = [(BuddyAppearanceController *)&v8 scrollViewContentIsUnderTray];

    return v5;
  }

  return 0;
}

- (void)continueTapped
{
  v2 = self;
  sub_100035058();
}

- (void)revertTapped
{
  v2 = *(void **)&self->OBSetupAssistantAppearanceController_opaque[OBJC_IVAR____TtC5Setup25BuddyAppearanceController_slider];
  if (v2)
  {
    uint64_t v3 = qword_10031CB10;
    v7 = self;
    id v4 = v2;
    if (v3 != -1) {
      swift_once();
    }
    sub_100036534((id)qword_100321FC8, byte_100321FD0, (void *)qword_100321FD8);
    char v6 = v5;
    sub_100036278(v4);
    if (v6) {
      sub_100034028();
    }
  }
}

- (void)showAccessibilitySettings
{
  uint64_t v3 = self;
  v7 = self;
  id v4 = (_TtC5Setup25BuddyAppearanceController *)[v3 accessibilityViewController];
  if (v4)
  {
    char v5 = v4;
    [(BuddyAppearanceController *)v7 presentViewController:v4 animated:1 completion:0];

    char v6 = v5;
  }
  else
  {
    char v6 = v7;
  }
}

- (BYRunState)runState
{
  v2 = (void *)swift_unknownObjectRetain();

  return (BYRunState *)v2;
}

- (void)setRunState:(id)a3
{
  *(void *)&self->OBSetupAssistantAppearanceController_opaque[OBJC_IVAR____TtC5Setup25BuddyAppearanceController_runState] = a3;
  swift_unknownObjectRetain();

  swift_unknownObjectRelease();
}

- (_TtC5Setup22AppearanceModeProvider)appearanceModeProvider
{
  return (_TtC5Setup22AppearanceModeProvider *)*(id *)&self->OBSetupAssistantAppearanceController_opaque[OBJC_IVAR____TtC5Setup25BuddyAppearanceController_appearanceModeProvider];
}

- (void)setAppearanceModeProvider:(id)a3
{
  id v4 = *(id *)&self->OBSetupAssistantAppearanceController_opaque[OBJC_IVAR____TtC5Setup25BuddyAppearanceController_appearanceModeProvider];
  *(void *)&self->OBSetupAssistantAppearanceController_opaque[OBJC_IVAR____TtC5Setup25BuddyAppearanceController_appearanceModeProvider] = a3;
  id v3 = a3;
}

- (BuddyDisplayZoomExecutor)displayZoomExecutor
{
  return (BuddyDisplayZoomExecutor *)*(id *)&self->OBSetupAssistantAppearanceController_opaque[OBJC_IVAR____TtC5Setup25BuddyAppearanceController_displayZoomExecutor];
}

- (void)setDisplayZoomExecutor:(id)a3
{
  id v4 = *(id *)&self->OBSetupAssistantAppearanceController_opaque[OBJC_IVAR____TtC5Setup25BuddyAppearanceController_displayZoomExecutor];
  *(void *)&self->OBSetupAssistantAppearanceController_opaque[OBJC_IVAR____TtC5Setup25BuddyAppearanceController_displayZoomExecutor] = a3;
  id v3 = a3;
}

- (BuddyFlowItemDispositionProvider)flowItemDispositionProvider
{
  return (BuddyFlowItemDispositionProvider *)*(id *)&self->OBSetupAssistantAppearanceController_opaque[OBJC_IVAR____TtC5Setup25BuddyAppearanceController_flowItemDispositionProvider];
}

- (void)setFlowItemDispositionProvider:(id)a3
{
  id v4 = *(id *)&self->OBSetupAssistantAppearanceController_opaque[OBJC_IVAR____TtC5Setup25BuddyAppearanceController_flowItemDispositionProvider];
  *(void *)&self->OBSetupAssistantAppearanceController_opaque[OBJC_IVAR____TtC5Setup25BuddyAppearanceController_flowItemDispositionProvider] = a3;
  id v3 = a3;
}

- (BYAnalyticsEventAppearance)analyticsEventAppearance
{
  return (BYAnalyticsEventAppearance *)*(id *)&self->OBSetupAssistantAppearanceController_opaque[OBJC_IVAR____TtC5Setup25BuddyAppearanceController_analyticsEventAppearance];
}

- (void)setAnalyticsEventAppearance:(id)a3
{
  id v4 = *(id *)&self->OBSetupAssistantAppearanceController_opaque[OBJC_IVAR____TtC5Setup25BuddyAppearanceController_analyticsEventAppearance];
  *(void *)&self->OBSetupAssistantAppearanceController_opaque[OBJC_IVAR____TtC5Setup25BuddyAppearanceController_analyticsEventAppearance] = a3;
  id v3 = a3;
}

+ (id)cloudConfigSkipKey
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v2;
}

+ (unint64_t)applicableDispositions
{
  return 18;
}

- (BOOL)controllerNeedsToRun
{
  NSString v2 = *(void **)&self->OBSetupAssistantAppearanceController_opaque[OBJC_IVAR____TtC5Setup25BuddyAppearanceController_runState];
  if (v2) {
    LOBYTE(v2) = [v2 hasCompletedInitialRun] ^ 1;
  }
  return (char)v2;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  id v4 = _Block_copy(a3);
  _Block_copy(v4);
  char v5 = self;
  sub_100037180((char *)v5, (void (**)(void, void))v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (void)dealloc
{
  NSString v2 = self;
  sub_100035FD4();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  sub_10001364C((uint64_t)&self->OBSetupAssistantAppearanceController_opaque[OBJC_IVAR____TtC5Setup25BuddyAppearanceController_presentationDismissalObserver]);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  id v3 = *(void **)&self->OBSetupAssistantAppearanceController_opaque[OBJC_IVAR____TtC5Setup25BuddyAppearanceController_analyticsEventAppearance];
}

- (void)setDelegate:(id)a3
{
  *(void *)&self->OBSetupAssistantAppearanceController_opaque[OBJC_IVAR____TtC5Setup25BuddyAppearanceController_delegate] = a3;
  swift_unknownObjectRetain();

  swift_unknownObjectRelease();
}

+ (BOOL)controllerAffectedByTapFreeSetup
{
  return 1;
}

+ (BOOL)hiddenFromMultiUser
{
  return 1;
}

- (_TtC5Setup25BuddyAppearanceController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC5Setup25BuddyAppearanceController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC5Setup25BuddyAppearanceController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC5Setup25BuddyAppearanceController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end