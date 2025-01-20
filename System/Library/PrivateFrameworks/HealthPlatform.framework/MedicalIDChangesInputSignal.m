@interface MedicalIDChangesInputSignal
- (NSString)description;
- (_TtC14HealthPlatform27MedicalIDChangesInputSignal)init;
@end

@implementation MedicalIDChangesInputSignal

- (NSString)description
{
  uint64_t v3 = sub_1C277AEE0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  sub_1C277AED0();
  sub_1C270E5D8(&qword_1EBB841D8, 255, MEMORY[0x1E4F66E78]);
  sub_1C277C7B0();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  v8 = (void *)sub_1C277B820();
  swift_bridgeObjectRelease();

  return (NSString *)v8;
}

- (_TtC14HealthPlatform27MedicalIDChangesInputSignal)init
{
  result = (_TtC14HealthPlatform27MedicalIDChangesInputSignal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14HealthPlatform27MedicalIDChangesInputSignal_observerQueue));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14HealthPlatform27MedicalIDChangesInputSignal_healthStore));
  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14HealthPlatform27MedicalIDChangesInputSignal_medicalIDStore);
}

@end