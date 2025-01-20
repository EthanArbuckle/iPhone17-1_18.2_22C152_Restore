@interface AppleAccountDataImporter
+ (id)makeClassAndReturnError:(id *)a3;
- (BOOL)deleteAllTransactionsFor:(id)a3 error:(id *)a4;
- (BOOL)deleteAppleAccountWith:(id)a3 error:(id *)a4;
- (BOOL)deleteTransactionsWithIdentifiers:(id)a3 forAppleAccountIdentifier:(id)a4 error:(id *)a5;
- (BOOL)insertOrUpdateWithAppleAccount:(id)a3 error:(id *)a4;
- (BOOL)insertOrUpdateWithAppleAccounts:(id)a3 error:(id *)a4;
- (_TtC10FinanceKit24AppleAccountDataImporter)init;
@end

@implementation AppleAccountDataImporter

- (_TtC10FinanceKit24AppleAccountDataImporter)init
{
  result = (_TtC10FinanceKit24AppleAccountDataImporter *)sub_243959540();
  __break(1u);
  return result;
}

+ (id)makeClassAndReturnError:(id *)a3
{
  id v3 = sub_2433ACD68();

  return v3;
}

- (BOOL)insertOrUpdateWithAppleAccount:(id)a3 error:(id *)a4
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B0C9900);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_243960A20;
  *(void *)(v6 + 32) = a3;
  unint64_t v12 = v6;
  sub_243958670();
  v7 = (void *)(*(void **)((char *)&self->super.isa + OBJC_IVAR____TtC10FinanceKit24AppleAccountDataImporter_store))[2];
  id v8 = a3;
  v9 = self;
  id v10 = objc_msgSend(v7, sel_newBackgroundContext);
  sub_2433ACE68(v12);

  swift_bridgeObjectRelease();
  return 1;
}

- (BOOL)insertOrUpdateWithAppleAccounts:(id)a3 error:(id *)a4
{
  if (a3)
  {
    sub_24337C218(0, &qword_268D97868);
    unint64_t v5 = sub_243958650();
    uint64_t v6 = (void *)(*(void **)((char *)&self->super.isa + OBJC_IVAR____TtC10FinanceKit24AppleAccountDataImporter_store))[2];
    v7 = self;
    id v8 = objc_msgSend(v6, sel_newBackgroundContext);
    sub_2433ACE68(v5);
    swift_bridgeObjectRelease();
  }
  return 1;
}

- (BOOL)deleteTransactionsWithIdentifiers:(id)a3 forAppleAccountIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v6 = sub_2439588E0();
  uint64_t v7 = sub_2439582D0();
  unint64_t v9 = v8;
  id v10 = self;
  sub_2433AABD4(v6, v7, v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return 1;
}

- (BOOL)deleteAllTransactionsFor:(id)a3 error:(id *)a4
{
  return sub_2433AC660(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t, uint64_t))sub_2433AB960);
}

- (BOOL)deleteAppleAccountWith:(id)a3 error:(id *)a4
{
  return sub_2433AC660(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (void (*)(uint64_t, uint64_t))sub_2433ABFD4);
}

- (void).cxx_destruct
{
}

@end