@interface ApplePayOrderFetchController
+ (id)makeFetchController;
- (_TtC12FinanceKitUI28ApplePayOrderFetchController)init;
- (void)fetchAllRowViewModelsForTransactionWithIdentifier:(NSString *)a3 completionHandler:(id)a4;
@end

@implementation ApplePayOrderFetchController

- (_TtC12FinanceKitUI28ApplePayOrderFetchController)init
{
  result = (_TtC12FinanceKitUI28ApplePayOrderFetchController *)sub_243DFF2A0();
  __break(1u);
  return result;
}

+ (id)makeFetchController
{
  sub_243DF9460();
  sub_243DF9450();
  uint64_t v2 = sub_243DF9440();
  swift_release();
  Controller = (objc_class *)type metadata accessor for ApplePayOrderFetchController();
  v4 = (char *)objc_allocWithZone(Controller);
  *(void *)&v4[OBJC_IVAR____TtC12FinanceKitUI28ApplePayOrderFetchController_store] = v2;
  v7.receiver = v4;
  v7.super_class = Controller;
  id v5 = objc_msgSendSuper2(&v7, sel_init);

  return v5;
}

- (void)fetchAllRowViewModelsForTransactionWithIdentifier:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268E1A950);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_243DFEBB0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_268E18CA0;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_268E20C30;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_243DAA940((uint64_t)v9, (uint64_t)&unk_268E1D400, (uint64_t)v14);
  swift_release();
}

- (void).cxx_destruct
{
}

@end