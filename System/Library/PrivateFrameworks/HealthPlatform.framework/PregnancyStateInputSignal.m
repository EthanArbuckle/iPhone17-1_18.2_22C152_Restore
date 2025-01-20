@interface PregnancyStateInputSignal
- (NSString)description;
- (_TtC14HealthPlatform25PregnancyStateInputSignal)init;
@end

@implementation PregnancyStateInputSignal

- (NSString)description
{
  uint64_t v3 = sub_1C277AEE0();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = MEMORY[0x1F4188790](v3);
  v7 = &v17[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1F4188790](v5);
  v9 = &v17[-v8];
  uint64_t v10 = qword_1EBB83B60;
  v11 = self;
  if (v10 != -1) {
    swift_once();
  }
  uint64_t v12 = __swift_project_value_buffer(v3, (uint64_t)qword_1EBB83B40);
  v13 = *(void (**)(unsigned char *, uint64_t, uint64_t))(v4 + 16);
  v13(v9, v12, v3);
  v13(v7, (uint64_t)v9, v3);
  sub_1C277C830();
  id v14 = (id)HKSensitiveLogItem();
  swift_unknownObjectRelease();
  sub_1C277C110();
  swift_unknownObjectRelease();
  sub_1C277B860();
  (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v9, v3);

  v15 = (void *)sub_1C277B820();
  swift_bridgeObjectRelease();

  return (NSString *)v15;
}

- (_TtC14HealthPlatform25PregnancyStateInputSignal)init
{
  result = (_TtC14HealthPlatform25PregnancyStateInputSignal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_release();
}

@end