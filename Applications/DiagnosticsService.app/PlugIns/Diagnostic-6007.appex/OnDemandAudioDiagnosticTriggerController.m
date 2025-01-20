@interface OnDemandAudioDiagnosticTriggerController
- (OnDemandAudioDiagnosticTriggerController)init;
- (void)cancel;
- (void)setupWithInputs:(id)a3 responder:(id)a4;
- (void)start;
- (void)teardown;
@end

@implementation OnDemandAudioDiagnosticTriggerController

- (void)setupWithInputs:(id)a3 responder:(id)a4
{
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v7 = self;
  sub_10000399C((uint64_t)a3, (uint64_t)a4);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (void)start
{
  v2 = self;
  sub_100003AE8();
}

- (void)cancel
{
  v2 = self;
  sub_100004978(1);
}

- (void)teardown
{
}

- (OnDemandAudioDiagnosticTriggerController)init
{
  uint64_t v3 = OBJC_IVAR___OnDemandAudioDiagnosticTriggerController_hearingModeClient;
  id v4 = objc_allocWithZone((Class)HMServiceClient);
  v5 = self;
  *(void *)&self->DKDiagnosticController_opaque[v3] = [v4 init];
  *(void *)&v5->DKDiagnosticController_opaque[OBJC_IVAR___OnDemandAudioDiagnosticTriggerController_inputs] = 0;
  *(void *)&v5->DKDiagnosticController_opaque[OBJC_IVAR___OnDemandAudioDiagnosticTriggerController_responder] = 0;
  *(void *)&v5->DKDiagnosticController_opaque[OBJC_IVAR___OnDemandAudioDiagnosticTriggerController_retryCount] = 0;

  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for OnDemandAudioDiagnosticTriggerController();
  return [(OnDemandAudioDiagnosticTriggerController *)&v7 init];
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
}

@end