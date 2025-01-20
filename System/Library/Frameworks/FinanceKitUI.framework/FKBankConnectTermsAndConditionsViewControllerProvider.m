@interface FKBankConnectTermsAndConditionsViewControllerProvider
+ (id)makeViewControllerWithTermsAndConditionsID:(id)a3;
+ (id)makeViewControllerWithTermsAndConditionsID:(id)a3 completion:(id)a4;
- (FKBankConnectTermsAndConditionsViewControllerProvider)init;
@end

@implementation FKBankConnectTermsAndConditionsViewControllerProvider

+ (id)makeViewControllerWithTermsAndConditionsID:(id)a3
{
  uint64_t v3 = type metadata accessor for BankConnectTermsAndConditionsWebView(0);
  uint64_t v4 = v3 - 8;
  MEMORY[0x270FA5388](v3);
  v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v7);
  v9 = (char *)&v17 - v8;
  uint64_t v10 = sub_243DFE910();
  uint64_t v12 = v11;
  objc_allocWithZone((Class)type metadata accessor for BankConnectTermsAndConditionsViewController());
  v13 = (void *)swift_allocObject();
  v13[2] = v10;
  v13[3] = v12;
  v13[4] = 0;
  v13[5] = 0;
  *(void *)v9 = sub_243D6F700;
  *((void *)v9 + 1) = v13;
  v9[16] = 0;
  v14 = (uint64_t *)&v9[*(int *)(v4 + 28)];
  uint64_t *v14 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E1A860);
  swift_storeEnumTagMultiPayload();
  sub_243D6F2E8((uint64_t)v9, (uint64_t)v6);
  swift_bridgeObjectRetain();
  v15 = (void *)sub_243DFD060();
  sub_243D6F34C((uint64_t)v9);
  swift_bridgeObjectRelease();

  return v15;
}

+ (id)makeViewControllerWithTermsAndConditionsID:(id)a3 completion:(id)a4
{
  uint64_t v5 = type metadata accessor for BankConnectTermsAndConditionsWebView(0);
  uint64_t v6 = v5 - 8;
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v21 - v10;
  uint64_t v12 = _Block_copy(a4);
  uint64_t v13 = sub_243DFE910();
  uint64_t v15 = v14;
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v12;
  objc_allocWithZone((Class)type metadata accessor for BankConnectTermsAndConditionsViewController());
  uint64_t v17 = (void *)swift_allocObject();
  v17[2] = v13;
  v17[3] = v15;
  v17[4] = sub_243D6F2C4;
  v17[5] = v16;
  *(void *)uint64_t v11 = sub_243D6F2D8;
  *((void *)v11 + 1) = v17;
  v11[16] = 0;
  v18 = (uint64_t *)&v11[*(int *)(v6 + 28)];
  uint64_t *v18 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268E1A860);
  swift_storeEnumTagMultiPayload();
  sub_243D6F2E8((uint64_t)v11, (uint64_t)v8);
  swift_bridgeObjectRetain();
  swift_retain();
  v19 = (void *)sub_243DFD060();
  sub_243D6F34C((uint64_t)v11);
  swift_bridgeObjectRelease();
  swift_release();

  return v19;
}

- (FKBankConnectTermsAndConditionsViewControllerProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)FKBankConnectTermsAndConditionsViewControllerProvider;
  return [(FKBankConnectTermsAndConditionsViewControllerProvider *)&v3 init];
}

@end