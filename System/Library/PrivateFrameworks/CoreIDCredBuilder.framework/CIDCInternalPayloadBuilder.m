@interface CIDCInternalPayloadBuilder
- (_TtC17CoreIDCredBuilder26CIDCInternalPayloadBuilder)init;
- (_TtC17CoreIDCredBuilder26CIDCInternalPayloadBuilder)initWithDelegate:(id)a3 payloadBuilder:(id)a4;
- (void)buildPayloadWithDetails:(CIDCPayloadBuilderDetails *)a3 completionHandler:(id)a4;
@end

@implementation CIDCInternalPayloadBuilder

- (_TtC17CoreIDCredBuilder26CIDCInternalPayloadBuilder)initWithDelegate:(id)a3 payloadBuilder:(id)a4
{
  swift_unknownObjectRetain();
  id v5 = a4;
  v6 = (_TtC17CoreIDCredBuilder26CIDCInternalPayloadBuilder *)sub_225C7AEE0();
  swift_unknownObjectRelease();

  return v6;
}

- (void)buildPayloadWithDetails:(CIDCPayloadBuilderDetails *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2681184C8);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_225C7BE40();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_2681184D8;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2681184E8;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_225C79594((uint64_t)v9, (uint64_t)&unk_2681184F8, (uint64_t)v14);
  swift_release();
}

- (_TtC17CoreIDCredBuilder26CIDCInternalPayloadBuilder)init
{
  result = (_TtC17CoreIDCredBuilder26CIDCInternalPayloadBuilder *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17CoreIDCredBuilder26CIDCInternalPayloadBuilder_payloadBuilder));
}

@end