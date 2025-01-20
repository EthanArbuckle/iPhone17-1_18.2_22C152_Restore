@interface BankConnectInstitutionMatcher
- (_TtC10FinanceKit29BankConnectInstitutionMatcher)init;
- (void)institutionForPaymentPass:(id)a3 withCompletion:(id)a4;
@end

@implementation BankConnectInstitutionMatcher

- (void)institutionForPaymentPass:(id)a3 withCompletion:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B0C7F80);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  id v12 = a3;
  v13 = self;
  id v14 = objc_msgSend(v12, sel_primaryAccountIdentifier);
  uint64_t v15 = sub_2439582D0();
  uint64_t v17 = v16;

  uint64_t v18 = sub_243958800();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v9, 1, 1, v18);
  v19 = (void *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = v12;
  v19[5] = sub_2433FB428;
  v19[6] = v11;
  v19[7] = v13;
  v19[8] = v15;
  v19[9] = v17;
  id v20 = v12;
  v21 = v13;
  swift_retain();
  sub_24363A9D4((uint64_t)v9, (uint64_t)&unk_268D9D7E8, (uint64_t)v19);

  swift_release();
  swift_release();
}

- (_TtC10FinanceKit29BankConnectInstitutionMatcher)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for BankConnectInstitutionMatcher();
  return [(BankConnectInstitutionMatcher *)&v3 init];
}

@end