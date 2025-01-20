@interface MedicalIDCache
- (_TtC16HealthExperience14MedicalIDCache)init;
- (void)medicalIDDidChange;
@end

@implementation MedicalIDCache

- (_TtC16HealthExperience14MedicalIDCache)init
{
  result = (_TtC16HealthExperience14MedicalIDCache *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC16HealthExperience14MedicalIDCache__medicalIDDataResult;
  sub_1C27BDC7C(0, &qword_1EBB770E0, MEMORY[0x1E4F1AC70]);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16HealthExperience14MedicalIDCache_medicalIDChangeObserver));

  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16HealthExperience14MedicalIDCache_medicalIDFetchQueue);
}

- (void)medicalIDDidChange
{
  v2 = *(void (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0x108);
  v3 = self;
  v2();
}

@end