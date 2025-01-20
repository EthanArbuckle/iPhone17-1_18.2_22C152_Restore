@interface HealthFeaturesSetupFlowController
+ (BOOL)controllerNeedsToRun;
+ (BOOL)skipControllerForExpressMode:(id)a3;
- (BOOL)controllerAllowsNavigatingBackFrom;
- (BOOL)controllerAllowsNavigatingBackTo;
- (BOOL)holdBeforeDisplaying;
- (_TtC31HealthFeaturesBridgeSetupPlugin33HealthFeaturesSetupFlowController)init;
- (id)viewController;
- (void)miniFlowStepComplete:(id)a3;
- (void)miniFlowStepComplete:(id)a3 nextControllerClass:(Class)a4;
@end

@implementation HealthFeaturesSetupFlowController

- (_TtC31HealthFeaturesBridgeSetupPlugin33HealthFeaturesSetupFlowController)init
{
  return (_TtC31HealthFeaturesBridgeSetupPlugin33HealthFeaturesSetupFlowController *)sub_AAA0();
}

- (id)viewController
{
  v2 = self;
  v5 = sub_A898((uint64_t)v2, v3, v4);

  return v5;
}

+ (BOOL)controllerNeedsToRun
{
  if (HAFeatureFlagBridgeHealthFeaturesOnboardingEnabled())
  {
    sub_C6E0();
    char v3 = v2 ^ 1;
  }
  else
  {
    char v3 = 0;
  }
  return v3 & 1;
}

+ (BOOL)skipControllerForExpressMode:(id)a3
{
  return 1;
}

- (BOOL)controllerAllowsNavigatingBackTo
{
  return 1;
}

- (BOOL)controllerAllowsNavigatingBackFrom
{
  return 1;
}

- (BOOL)holdBeforeDisplaying
{
  return self->BPSSetupMiniFlowController_opaque[OBJC_IVAR____TtC31HealthFeaturesBridgeSetupPlugin33HealthFeaturesSetupFlowController_isLoadingConfiguration];
}

- (void)miniFlowStepComplete:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_B1C4((uint64_t)a3);
  swift_unknownObjectRelease();
}

- (void)miniFlowStepComplete:(id)a3 nextControllerClass:(Class)a4
{
  if (a4) {
    uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  }
  else {
    uint64_t ObjCClassMetadata = 0;
  }
  swift_unknownObjectRetain();
  v6 = self;
  sub_CAC4(ObjCClassMetadata);
  swift_unknownObjectRelease();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_release();
}

@end