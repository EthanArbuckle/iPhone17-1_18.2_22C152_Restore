@interface GDIPDiagnosticExtension
- (GDIPDiagnosticExtension)init;
- (id)attachmentList;
- (id)attachmentsForParameters:(id)a3;
@end

@implementation GDIPDiagnosticExtension

- (id)attachmentList
{
  sub_100006B88();
  v2.super.isa = sub_1000071A0().super.isa;
  swift_bridgeObjectRelease();

  return v2.super.isa;
}

- (id)attachmentsForParameters:(id)a3
{
  uint64_t v4 = sub_100007150();
  v5 = self;
  sub_1000054F0(v4);

  swift_bridgeObjectRelease();
  sub_100006B88();
  v6.super.isa = sub_1000071A0().super.isa;
  swift_bridgeObjectRelease();

  return v6.super.isa;
}

- (GDIPDiagnosticExtension)init
{
  return (GDIPDiagnosticExtension *)sub_100005F74();
}

@end