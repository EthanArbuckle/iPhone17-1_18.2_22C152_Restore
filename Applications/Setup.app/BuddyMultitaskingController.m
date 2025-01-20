@interface BuddyMultitaskingController
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (BOOL)controllerNeedsToRun;
- (BYAnalyticsManager)analyticsManager;
- (BYCapabilities)capabilities;
- (BYPaneFeatureAnalyticsManager)paneFeatureAnalyticsManager;
- (BYRunState)runState;
- (_TtC5Setup27BuddyMultitaskingController)init;
- (_TtC5Setup27BuddyMultitaskingController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (_TtC5Setup27BuddyMultitaskingController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (void)continueTapped;
- (void)performExtendedInitializationWithCompletion:(id)a3;
- (void)setAnalyticsManager:(id)a3;
- (void)setCapabilities:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPaneFeatureAnalyticsManager:(id)a3;
- (void)setRunState:(id)a3;
- (void)useDefaultSettingsTapped;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation BuddyMultitaskingController

- (void)setDelegate:(id)a3
{
  *(void *)&self->OBSetupAssistantMultitaskingViewController_opaque[OBJC_IVAR____TtC5Setup27BuddyMultitaskingController_delegate] = a3;
  swift_unknownObjectRetain();

  swift_unknownObjectRelease();
}

- (_TtC5Setup27BuddyMultitaskingController)init
{
  return (_TtC5Setup27BuddyMultitaskingController *)sub_10000E260();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_10000E47C();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_10000EC44(a3);
}

- (void)continueTapped
{
  v2 = self;
  sub_10000ED24();
}

- (void)useDefaultSettingsTapped
{
  v2 = self;
  sub_10000F16C();
}

- (BYRunState)runState
{
  v2 = (void *)swift_unknownObjectRetain();

  return (BYRunState *)v2;
}

- (void)setRunState:(id)a3
{
}

- (BYCapabilities)capabilities
{
  v2 = (void *)swift_unknownObjectRetain();

  return (BYCapabilities *)v2;
}

- (void)setCapabilities:(id)a3
{
}

- (BYPaneFeatureAnalyticsManager)paneFeatureAnalyticsManager
{
  return (BYPaneFeatureAnalyticsManager *)*(id *)&self->OBSetupAssistantMultitaskingViewController_opaque[OBJC_IVAR____TtC5Setup27BuddyMultitaskingController_paneFeatureAnalyticsManager];
}

- (void)setPaneFeatureAnalyticsManager:(id)a3
{
  id v4 = *(id *)&self->OBSetupAssistantMultitaskingViewController_opaque[OBJC_IVAR____TtC5Setup27BuddyMultitaskingController_paneFeatureAnalyticsManager];
  *(void *)&self->OBSetupAssistantMultitaskingViewController_opaque[OBJC_IVAR____TtC5Setup27BuddyMultitaskingController_paneFeatureAnalyticsManager] = a3;
  id v3 = a3;
}

- (BYAnalyticsManager)analyticsManager
{
  return (BYAnalyticsManager *)*(id *)&self->OBSetupAssistantMultitaskingViewController_opaque[OBJC_IVAR____TtC5Setup27BuddyMultitaskingController_analyticsManager];
}

- (void)setAnalyticsManager:(id)a3
{
  id v4 = *(id *)&self->OBSetupAssistantMultitaskingViewController_opaque[OBJC_IVAR____TtC5Setup27BuddyMultitaskingController_analyticsManager];
  *(void *)&self->OBSetupAssistantMultitaskingViewController_opaque[OBJC_IVAR____TtC5Setup27BuddyMultitaskingController_analyticsManager] = a3;
  id v3 = a3;
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 8;
}

- (BOOL)controllerNeedsToRun
{
  v2 = self;
  char v3 = sub_10000F634();

  return v3 & 1;
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  id v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  sub_10000F740((uint64_t)sub_10000FF94, v5);

  swift_release();
}

- (_TtC5Setup27BuddyMultitaskingController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  result = (_TtC5Setup27BuddyMultitaskingController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC5Setup27BuddyMultitaskingController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v6 = a5;
  result = (_TtC5Setup27BuddyMultitaskingController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  char v3 = *(void **)&self->OBSetupAssistantMultitaskingViewController_opaque[OBJC_IVAR____TtC5Setup27BuddyMultitaskingController_analyticsManager];
}

@end