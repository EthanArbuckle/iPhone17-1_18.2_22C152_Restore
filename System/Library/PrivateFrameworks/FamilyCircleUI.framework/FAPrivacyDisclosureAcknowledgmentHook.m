@interface FAPrivacyDisclosureAcknowledgmentHook
- (BOOL)shouldMatchElement:(id)a3;
- (BOOL)shouldMatchModel:(id)a3;
- (RUIServerHookDelegate)delegate;
- (_TtC14FamilyCircleUI37FAPrivacyDisclosureAcknowledgmentHook)init;
- (void)processElement:(RUIElement *)a3 attributes:(NSDictionary *)a4 objectModel:(RUIObjectModel *)a5 completion:(id)a6;
- (void)processObjectModel:(RUIObjectModel *)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation FAPrivacyDisclosureAcknowledgmentHook

- (RUIServerHookDelegate)delegate
{
  swift_beginAccess();
  v2 = (void *)swift_unknownObjectRetain();
  return (RUIServerHookDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
  v4 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC14FamilyCircleUI37FAPrivacyDisclosureAcknowledgmentHook_delegate);
  swift_beginAccess();
  id *v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (BOOL)shouldMatchElement:(id)a3
{
  v4 = (_TtC14FamilyCircleUI37FAPrivacyDisclosureAcknowledgmentHook *)a3;
  v5 = self;
  id v6 = [(FAPrivacyDisclosureAcknowledgmentHook *)v4 name];
  if (v6)
  {
    v7 = v6;
    uint64_t v8 = sub_218CAEE38();
    uint64_t v10 = v9;

    if (v8 == 0xD00000000000001FLL && v10 == 0x8000000218CD7DA0)
    {

      swift_bridgeObjectRelease();
      char v11 = 1;
    }
    else
    {
      char v11 = sub_218CAFC08();

      swift_bridgeObjectRelease();
    }
  }
  else
  {

    char v11 = 0;
    v4 = v5;
  }

  return v11 & 1;
}

- (BOOL)shouldMatchModel:(id)a3
{
  id v4 = a3;
  v5 = self;
  char v6 = sub_218C4F15C(v4);

  return v6 & 1;
}

- (void)processElement:(RUIElement *)a3 attributes:(NSDictionary *)a4 objectModel:(RUIObjectModel *)a5 completion:(id)a6
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AA85500);
  MEMORY[0x270FA5388](v11 - 8);
  v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  v15 = (void *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  uint64_t v16 = sub_218CAF198();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_267BF00A0;
  v17[5] = v15;
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_267BF00A8;
  v18[5] = v17;
  v19 = a3;
  v20 = a4;
  v21 = a5;
  v22 = self;
  sub_218C50914((uint64_t)v13, (uint64_t)&unk_267BF00B0, (uint64_t)v18);
  swift_release();
}

- (void)processObjectModel:(RUIObjectModel *)a3 completion:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AA85500);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_218CAF198();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_267BF0090;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_267BEF290;
  v14[5] = v13;
  v15 = a3;
  uint64_t v16 = self;
  sub_218C50914((uint64_t)v9, (uint64_t)&unk_267BE8C80, (uint64_t)v14);
  swift_release();
}

- (_TtC14FamilyCircleUI37FAPrivacyDisclosureAcknowledgmentHook)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14FamilyCircleUI37FAPrivacyDisclosureAcknowledgmentHook_delegate) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FAPrivacyDisclosureAcknowledgmentHook();
  return [(FAPrivacyDisclosureAcknowledgmentHook *)&v3 init];
}

- (void).cxx_destruct
{
}

@end