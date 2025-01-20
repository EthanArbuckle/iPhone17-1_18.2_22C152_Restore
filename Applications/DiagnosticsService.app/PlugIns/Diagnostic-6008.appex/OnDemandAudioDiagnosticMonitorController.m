@interface OnDemandAudioDiagnosticMonitorController
- (OnDemandAudioDiagnosticMonitorController)init;
- (void)cancel;
- (void)setupWithInputs:(id)a3 responder:(id)a4;
- (void)start;
- (void)teardown;
@end

@implementation OnDemandAudioDiagnosticMonitorController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v7 = self;
  sub_100003354((uint64_t)a3, a4);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (void)start
{
  v2 = self;
  sub_100003824();
}

- (void)cancel
{
  v2 = self;
  sub_1000060C8(1);
}

- (void)teardown
{
  v2 = *(void **)&self->DKDiagnosticController_opaque[OBJC_IVAR___OnDemandAudioDiagnosticMonitorController_hearingModeClient];
  v4 = self;
  [v2 invalidate];
  v3 = *(void **)&v4->DKDiagnosticController_opaque[OBJC_IVAR___OnDemandAudioDiagnosticMonitorController_responder];
  if (v3)
  {
    [v3 clearAllowSessionAccessoryDisconnect];
  }
  else
  {
    __break(1u);
  }
}

- (OnDemandAudioDiagnosticMonitorController)init
{
  return (OnDemandAudioDiagnosticMonitorController *)sub_100006888();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

@end