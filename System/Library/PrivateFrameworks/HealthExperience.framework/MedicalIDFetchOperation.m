@interface MedicalIDFetchOperation
- (_TtC16HealthExperience23MedicalIDFetchOperation)init;
- (void)main;
@end

@implementation MedicalIDFetchOperation

- (void)main
{
  v2 = self;
  sub_1C27C20F0();
}

- (_TtC16HealthExperience23MedicalIDFetchOperation)init
{
  result = (_TtC16HealthExperience23MedicalIDFetchOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16HealthExperience23MedicalIDFetchOperation_medicalIDData));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16HealthExperience23MedicalIDFetchOperation_fetchError));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16HealthExperience23MedicalIDFetchOperation_medicalIDStore);
}

@end