@interface _FKWalletBankCredentialImporter
+ (id)makeImporter;
- (_FKWalletBankCredentialImporter)init;
- (void)insertCredentialFrom:(PKBankAccountInformation *)a3 completionHandler:(id)a4;
@end

@implementation _FKWalletBankCredentialImporter

+ (id)makeImporter
{
  if (qword_26B0C5770 != -1) {
    swift_once();
  }
  ObjCClassMetadata = (objc_class *)swift_getObjCClassMetadata();
  v3 = off_26B0C5E08;
  v4 = (char *)objc_allocWithZone(ObjCClassMetadata);
  *(void *)&v4[OBJC_IVAR____FKWalletBankCredentialImporter_financeStore] = v3;
  v7.receiver = v4;
  v7.super_class = ObjCClassMetadata;
  swift_retain();
  id v5 = objc_msgSendSuper2(&v7, sel_init);

  return v5;
}

- (void)insertCredentialFrom:(PKBankAccountInformation *)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B0C7F80);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_243958800();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_268DA0BD0;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_268DA2C50;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_243937CA0((uint64_t)v9, (uint64_t)&unk_268D9CA90, (uint64_t)v14);
  swift_release();
}

- (_FKWalletBankCredentialImporter)init
{
  result = (_FKWalletBankCredentialImporter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end