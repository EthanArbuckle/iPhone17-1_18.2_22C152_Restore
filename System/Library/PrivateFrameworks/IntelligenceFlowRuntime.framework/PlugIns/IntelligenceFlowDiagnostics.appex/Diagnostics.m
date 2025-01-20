@interface Diagnostics
- (_TtC27IntelligenceFlowDiagnostics11Diagnostics)init;
- (id)attachmentsForParameters:(id)a3;
@end

@implementation Diagnostics

- (id)attachmentsForParameters:(id)a3
{
  if (a3) {
    v4 = (void *)sub_10000A120();
  }
  else {
    v4 = 0;
  }
  v5 = self;
  v10.value._rawValue = v4;
  unint64_t v6 = (unint64_t)Diagnostics.attachments(forParameters:)(v10);

  swift_bridgeObjectRelease();
  if (v6)
  {
    v7.super.isa = sub_10000A1C0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v7.super.isa = 0;
  }

  return v7.super.isa;
}

- (_TtC27IntelligenceFlowDiagnostics11Diagnostics)init
{
  return (_TtC27IntelligenceFlowDiagnostics11Diagnostics *)Diagnostics.init()();
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC27IntelligenceFlowDiagnostics11Diagnostics_logger;
  sub_10000A0E0();
  sub_100009DF4();
  v5 = *(void (**)(char *, uint64_t))(v4 + 8);

  v5(v2, v3);
}

@end