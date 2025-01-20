@interface OnDemandAudioDiagnosticMonitorInputs
- (BOOL)validateAndInitializeParameters:(id)a3;
- (BOOL)validateAndInitializePredicates:(id)a3;
- (BOOL)validateAndInitializeSpecifications:(id)a3;
- (OnDemandAudioDiagnosticMonitorInputs)init;
@end

@implementation OnDemandAudioDiagnosticMonitorInputs

- (BOOL)validateAndInitializeParameters:(id)a3
{
  if (a3) {
    uint64_t v4 = sub_1000093C8();
  }
  else {
    uint64_t v4 = 0;
  }
  v5 = self;
  char v6 = sub_1000081A4(v4);

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

- (OnDemandAudioDiagnosticMonitorInputs)init
{
  return (OnDemandAudioDiagnosticMonitorInputs *)sub_100008B14();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end