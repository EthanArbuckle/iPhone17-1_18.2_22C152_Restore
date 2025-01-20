@interface NanoSleepBridgeSetupController
+ (BOOL)controllerNeedsToRun;
+ (BOOL)skipControllerForExpressMode:(id)a3;
- (BOOL)controllerAllowsNavigatingBackFrom;
- (BOOL)controllerAllowsNavigatingBackTo;
- (BOOL)holdBeforeDisplaying;
- (_TtC20NanoSleepBridgeSetup30NanoSleepBridgeSetupController)init;
- (id)viewController;
@end

@implementation NanoSleepBridgeSetupController

- (_TtC20NanoSleepBridgeSetup30NanoSleepBridgeSetupController)init
{
  return (_TtC20NanoSleepBridgeSetup30NanoSleepBridgeSetupController *)sub_4D18();
}

- (id)viewController
{
  v2 = self;
  id v3 = sub_4950();

  return v3;
}

+ (BOOL)controllerNeedsToRun
{
  if (qword_C7A0 != -1) {
    swift_once();
  }
  sub_6020(&qword_C7A8, qword_C7C0);
  return sub_6DF0() & 1;
}

+ (BOOL)skipControllerForExpressMode:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  char v5 = sub_5704();

  return v5 & 1;
}

- (BOOL)controllerAllowsNavigatingBackTo
{
  return 0;
}

- (BOOL)controllerAllowsNavigatingBackFrom
{
  return 1;
}

- (BOOL)holdBeforeDisplaying
{
  return self->BPSSetupMiniFlowController_opaque[OBJC_IVAR____TtC20NanoSleepBridgeSetup30NanoSleepBridgeSetupController_isLoadingSuggestedSchedule];
}

- (void).cxx_destruct
{
}

@end