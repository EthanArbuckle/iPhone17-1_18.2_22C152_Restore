@interface CompatibilityBridge
+ (BOOL)WriteJetsamMemoryReportWithVisibilityEndowmentSet:(id)a3 audioAssertionSet:(id)a4;
- (_TtC15CoreDiagnostics19CompatibilityBridge)init;
@end

@implementation CompatibilityBridge

+ (BOOL)WriteJetsamMemoryReportWithVisibilityEndowmentSet:(id)a3 audioAssertionSet:(id)a4
{
  uint64_t v5 = (uint64_t)a3;
  if (a3)
  {
    sub_24B3D06E4();
    sub_24B3D0724();
    uint64_t v5 = sub_24B3DA0E8();
  }
  if (a4)
  {
    sub_24B3D06E4();
    sub_24B3D0724();
    a4 = (id)sub_24B3DA0E8();
  }
  char v6 = _s15CoreDiagnostics19CompatibilityBridgeC23WriteJetsamMemoryReport22visibilityEndowmentSet014audioAssertionK0SbShySo8NSNumberCGSg_AJtFZ_0(v5, (uint64_t)a4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v6 & 1;
}

- (_TtC15CoreDiagnostics19CompatibilityBridge)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CompatibilityBridge();
  return [(CompatibilityBridge *)&v3 init];
}

@end