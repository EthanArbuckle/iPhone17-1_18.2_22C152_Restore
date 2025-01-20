@interface OnDemandAudioDiagnosticTriggerInputs
- (BOOL)validateAndInitializeParameters:(id)a3;
- (BOOL)validateAndInitializePredicates:(id)a3;
- (BOOL)validateAndInitializeSpecifications:(id)a3;
- (OnDemandAudioDiagnosticTriggerInputs)init;
@end

@implementation OnDemandAudioDiagnosticTriggerInputs

- (BOOL)validateAndInitializeParameters:(id)a3
{
  if (a3) {
    uint64_t v4 = sub_1000065A8();
  }
  else {
    uint64_t v4 = 0;
  }
  v5 = self;
  char v6 = sub_100005C8C(v4);

  swift_bridgeObjectRelease();
  return v6 & 1;
}

- (BOOL)validateAndInitializeSpecifications:(id)a3
{
  return 1;
}

- (BOOL)validateAndInitializePredicates:(id)a3
{
  return 1;
}

- (OnDemandAudioDiagnosticTriggerInputs)init
{
  return (OnDemandAudioDiagnosticTriggerInputs *)sub_1000060A0();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end