@interface BankConnectAttributeLoaderWrapper
+ (void)refreshAttributes:(NSSet *)a3 forFullyQualifiedAccountIdentifier:(FKFullyQualifiedAccountIdentifier *)a4 completionHandler:(id)a5;
+ (void)refreshAttributes:(NSSet *)a3 forPrimaryAccountIdentifier:(NSString *)a4 completionHandler:(id)a5;
- (_TtC10FinanceKit33BankConnectAttributeLoaderWrapper)init;
@end

@implementation BankConnectAttributeLoaderWrapper

+ (void)refreshAttributes:(NSSet *)a3 forPrimaryAccountIdentifier:(NSString *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B0C7F80);
  MEMORY[0x270FA5388](v9 - 8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = a1;
  uint64_t v14 = sub_243958800();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_268DA3808;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_268DA3810;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  sub_243937CA0((uint64_t)v11, (uint64_t)&unk_268DA3818, (uint64_t)v16);
  swift_release();
}

+ (void)refreshAttributes:(NSSet *)a3 forFullyQualifiedAccountIdentifier:(FKFullyQualifiedAccountIdentifier *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B0C7F80);
  MEMORY[0x270FA5388](v9 - 8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = a1;
  uint64_t v14 = sub_243958800();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_268DA37D0;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_268DA2C50;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  sub_243937CA0((uint64_t)v11, (uint64_t)&unk_268D9CA90, (uint64_t)v16);
  swift_release();
}

- (_TtC10FinanceKit33BankConnectAttributeLoaderWrapper)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(BankConnectAttributeLoaderWrapper *)&v3 init];
}

@end