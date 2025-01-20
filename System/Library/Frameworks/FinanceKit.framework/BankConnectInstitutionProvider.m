@interface BankConnectInstitutionProvider
+ (id)makeProviderAndReturnError:(id *)a3;
- (FKBankConnectInstitutionsProviderDelegate)delegate;
- (_TtC10FinanceKit30BankConnectInstitutionProvider)init;
- (void)institutionFor:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation BankConnectInstitutionProvider

- (FKBankConnectInstitutionsProviderDelegate)delegate
{
  v2 = (char *)self + OBJC_IVAR____TtC10FinanceKit30BankConnectInstitutionProvider_delegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x245680210](v2);

  return (FKBankConnectInstitutionsProviderDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
}

+ (id)makeProviderAndReturnError:(id *)a3
{
  if (qword_26B0C7F68 != -1) {
    swift_once();
  }
  uint64_t v3 = *((void *)off_26B0C7F60 + 2);
  v4 = (objc_class *)type metadata accessor for BankConnectInstitutionProvider();
  v5 = (char *)objc_allocWithZone(v4);
  swift_unknownObjectWeakInit();
  *(void *)&v5[OBJC_IVAR____TtC10FinanceKit30BankConnectInstitutionProvider_store] = v3;
  v8.receiver = v5;
  v8.super_class = v4;
  swift_retain();
  id v6 = objc_msgSendSuper2(&v8, sel_init);

  return v6;
}

- (void)institutionFor:(id)a3 completion:(id)a4
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B0C7F80);
  MEMORY[0x270FA5388](v6 - 8);
  objc_super v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a4);
  uint64_t v10 = sub_2439582D0();
  uint64_t v12 = v11;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v9;
  uint64_t v14 = sub_243958800();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v8, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = self;
  v15[5] = v10;
  v15[6] = v12;
  v15[7] = sub_24388C8A8;
  v15[8] = v13;
  v16 = self;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_24363A9D4((uint64_t)v8, (uint64_t)&unk_268DA2270, (uint64_t)v15);

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

- (_TtC10FinanceKit30BankConnectInstitutionProvider)init
{
  result = (_TtC10FinanceKit30BankConnectInstitutionProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC10FinanceKit30BankConnectInstitutionProvider_delegate;

  sub_2434F0BE8((uint64_t)v3);
}

@end