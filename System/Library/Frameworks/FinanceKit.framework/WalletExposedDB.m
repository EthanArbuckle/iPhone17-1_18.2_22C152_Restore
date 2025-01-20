@interface WalletExposedDB
+ (id)makeClassAndReturnError:(id *)a3;
- (BOOL)deleteAppleAccountWith:(id)a3 error:(id *)a4;
- (BOOL)deleteTransactionsWithIdentifiers:(id)a3 forAppleAccountIdentifier:(id)a4 error:(id *)a5;
- (BOOL)insertOrUpdateTransactions:(id)a3 forAppleAccountWithID:(id)a4 error:(id *)a5;
- (BOOL)insertOrUpdateWithAppleAccount:(id)a3 error:(id *)a4;
- (_TtC10FinanceKit15WalletExposedDB)init;
- (id)fetchAppleAccountsAndReturnError:(id *)a3;
@end

@implementation WalletExposedDB

- (id)fetchAppleAccountsAndReturnError:(id *)a3
{
  v3 = (void *)(*(void **)((char *)&self->super.isa + OBJC_IVAR____TtC10FinanceKit15WalletExposedDB_store))[2];
  v4 = self;
  id v7 = objc_msgSend(v3, sel_newBackgroundContext);
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B0C5D08);
  sub_243958D90();

  sub_24337C218(0, &qword_26B0C5D10);
  v5 = (void *)sub_243958630();
  swift_bridgeObjectRelease();

  return v5;
}

- (BOOL)insertOrUpdateWithAppleAccount:(id)a3 error:(id *)a4
{
  v6 = (FKAppleAccount *)a3;
  id v7 = self;
  WalletExposedDB.insertOrUpdate(appleAccount:)(v6);

  if (v8)
  {
    if (a4)
    {
      v9 = (void *)sub_243956E00();

      id v10 = v9;
      *a4 = v9;
    }
    else
    {
    }
  }
  return v8 == 0;
}

- (BOOL)deleteAppleAccountWith:(id)a3 error:(id *)a4
{
  uint64_t v6 = sub_2439582D0();
  v8 = v7;
  v9 = self;
  v10._countAndFlagsBits = v6;
  v10._object = v8;
  WalletExposedDB.deleteAppleAccount(with:)(v10);
  swift_bridgeObjectRelease();

  if (v11)
  {
    if (a4)
    {
      v12 = (void *)sub_243956E00();

      id v13 = v12;
      *a4 = v12;
    }
    else
    {
    }
  }
  return v11 == 0;
}

- (BOOL)insertOrUpdateTransactions:(id)a3 forAppleAccountWithID:(id)a4 error:(id *)a5
{
  sub_24337C218(0, &qword_268D9F780);
  uint64_t v7 = sub_243958650();
  uint64_t v8 = sub_2439582D0();
  Swift::String v10 = v9;
  v11 = self;
  v12._countAndFlagsBits = v8;
  v12._object = v10;
  WalletExposedDB.insertOrUpdateTransactions(_:forAppleAccountWithID:)((Swift::OpaquePointer)v7, v12);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  if (v13)
  {
    if (a5)
    {
      v14 = (void *)sub_243956E00();

      id v15 = v14;
      *a5 = v14;
    }
    else
    {
    }
  }
  return v13 == 0;
}

- (BOOL)deleteTransactionsWithIdentifiers:(id)a3 forAppleAccountIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v6 = sub_2439588E0();
  uint64_t v7 = sub_2439582D0();
  unint64_t v9 = v8;
  Swift::String v10 = self;
  WalletExposedDB.deleteTransactions(with:for:)(v6, v7, v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return 1;
}

+ (id)makeClassAndReturnError:(id *)a3
{
  id v3 = sub_243902410();

  return v3;
}

- (_TtC10FinanceKit15WalletExposedDB)init
{
  result = (_TtC10FinanceKit15WalletExposedDB *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end