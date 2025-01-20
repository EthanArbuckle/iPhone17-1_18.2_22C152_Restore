@interface HealthBalanceDiagnosticExtensionProvider
- (_TtC32HealthBalanceDiagnosticExtension40HealthBalanceDiagnosticExtensionProvider)init;
- (id)attachmentsForParameters:(id)a3;
@end

@implementation HealthBalanceDiagnosticExtensionProvider

- (id)attachmentsForParameters:(id)a3
{
  if (a3) {
    uint64_t v4 = sub_100006A60();
  }
  else {
    uint64_t v4 = 0;
  }
  v5 = self;
  uint64_t v6 = sub_100002964(v4);

  swift_bridgeObjectRelease();
  if (v6)
  {
    v7.super.isa = sub_100006B10().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v7.super.isa = 0;
  }

  return v7.super.isa;
}

- (_TtC32HealthBalanceDiagnosticExtension40HealthBalanceDiagnosticExtensionProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(HealthBalanceDiagnosticExtensionProvider *)&v3 init];
}

@end