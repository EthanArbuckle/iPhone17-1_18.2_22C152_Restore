@interface ODISessionInternal
- (NSString)description;
- (_TtC7CoreODI18ODISessionInternal)init;
- (_TtC7CoreODI18ODISessionInternal)initWithServiceIdentifier:(id)a3 forDSIDType:(unint64_t)a4 locationBundle:(id)a5 andLocationBundleIdentifier:(id)a6 sessionStateDelegate:(id)a7;
- (void)getAssessment:(id)a3;
- (void)provideFeedbackOnPartialAssessmentID:(id)a3;
- (void)provideFeedbackOnPayloadOutcome:(unint64_t)a3;
- (void)updateWithAdditionalAttributes:(id)a3;
- (void)validateForDeinit;
@end

@implementation ODISessionInternal

- (NSString)description
{
  swift_retain();
  sub_2151FA038();
  sub_2151F9E68();
  type metadata accessor for ODIServiceProviderId(0);
  sub_2151FA0B8();
  swift_release();
  v2 = (void *)sub_2151F9DF8();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (_TtC7CoreODI18ODISessionInternal)initWithServiceIdentifier:(id)a3 forDSIDType:(unint64_t)a4 locationBundle:(id)a5 andLocationBundleIdentifier:(id)a6 sessionStateDelegate:(id)a7
{
  if (a6)
  {
    uint64_t v11 = sub_2151F9E28();
    uint64_t v13 = v12;
  }
  else
  {
    uint64_t v11 = 0;
    uint64_t v13 = 0;
  }
  id v14 = a3;
  id v15 = a5;
  swift_unknownObjectRetain();
  return (_TtC7CoreODI18ODISessionInternal *)ODISessionInternal.init(serviceIdentifier:forDSIDType:locationBundle:andLocationBundleIdentifier:sessionStateDelegate:)(v14, a4, a5, v11, v13, (uint64_t)a7);
}

- (void)updateWithAdditionalAttributes:(id)a3
{
  id v4 = a3;
  swift_retain();
  sub_2151D7C60(a3);
  swift_release();
}

- (void)getAssessment:(id)a3
{
  uint64_t v16 = sub_2151F9AC8();
  uint64_t v5 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2151F9D58();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a3);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v12;
  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger), *(void *)&self->$defaultActor[OBJC_IVAR____TtC7CoreODI18ODISessionInternal_logger + 16]);
  (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, *MEMORY[0x263F36D18], v8);
  swift_retain();
  sub_2151F9C58();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  sub_2151F9AA8();
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = sub_2151EF458;
  *(void *)(v14 + 24) = v13;
  swift_retain();
  sub_2151E309C((uint64_t)v7, (uint64_t)sub_2151ED844, v14);
  swift_release();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v16);
  swift_release();
  swift_release();
}

- (void)provideFeedbackOnPayloadOutcome:(unint64_t)a3
{
  swift_retain();
  sub_2151D8E0C(a3);
  swift_release();
}

- (void)provideFeedbackOnPartialAssessmentID:(id)a3
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2678652A0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_2151F9E28();
  uint64_t v9 = v8;
  uint64_t v10 = sub_2151F9F18();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v6, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = self;
  v11[5] = v7;
  v11[6] = v9;
  swift_retain_n();
  swift_bridgeObjectRetain();
  sub_2151D16EC((uint64_t)v6, (uint64_t)&unk_267865768, (uint64_t)v11);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
}

- (void)validateForDeinit
{
  swift_retain();
  sub_2151EBF64();
  swift_release();
}

- (_TtC7CoreODI18ODISessionInternal)init
{
  swift_defaultActor_initialize();
  result = (_TtC7CoreODI18ODISessionInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end