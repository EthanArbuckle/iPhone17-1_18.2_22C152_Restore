@interface ODIPartialAssessmentInitiator
- (_TtC7CoreODI29ODIPartialAssessmentInitiator)init;
- (_TtC7CoreODI29ODIPartialAssessmentInitiator)initWithProviderID:(id)a3;
- (id)makeInitialPartialAssessmentID;
- (id)makeInitialPartialAssessmentPayload;
@end

@implementation ODIPartialAssessmentInitiator

- (_TtC7CoreODI29ODIPartialAssessmentInitiator)initWithProviderID:(id)a3
{
  uint64_t v5 = sub_2151F9BE8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7CoreODI29ODIPartialAssessmentInitiator_providerID) = (Class)a3;
  sub_2151F9E28();
  id v9 = a3;
  v10 = self;
  sub_2151F9BC8();
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))((uint64_t)v10 + OBJC_IVAR____TtC7CoreODI29ODIPartialAssessmentInitiator_adapter, v8, v5);

  v11 = (objc_class *)type metadata accessor for ODIPartialAssessmentInitiator();
  v14.receiver = v10;
  v14.super_class = v11;
  v12 = [(ODIPartialAssessmentInitiator *)&v14 init];

  return v12;
}

- (id)makeInitialPartialAssessmentPayload
{
  v2 = self;
  sub_2151F0BAC();

  v3 = (void *)sub_2151F9DF8();
  swift_bridgeObjectRelease();
  return v3;
}

- (id)makeInitialPartialAssessmentID
{
  v2 = (void *)sub_2151F9DF8();
  return v2;
}

- (_TtC7CoreODI29ODIPartialAssessmentInitiator)init
{
  result = (_TtC7CoreODI29ODIPartialAssessmentInitiator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC7CoreODI29ODIPartialAssessmentInitiator_adapter;
  uint64_t v4 = sub_2151F9BE8();
  uint64_t v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

@end