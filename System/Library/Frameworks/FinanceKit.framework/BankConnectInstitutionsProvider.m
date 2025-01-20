@interface BankConnectInstitutionsProvider
+ (id)makeProviderAndReturnError:(id *)a3;
- (FKBankConnectInstitutionsProviderDelegate)delegate;
- (_TtC10FinanceKit31BankConnectInstitutionsProvider)init;
- (void)fetchConnectedInstitutionsWithCompletion:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation BankConnectInstitutionsProvider

- (FKBankConnectInstitutionsProviderDelegate)delegate
{
  v2 = (char *)self + OBJC_IVAR____TtC10FinanceKit31BankConnectInstitutionsProvider_delegate;
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
  id v3 = objc_allocWithZone((Class)type metadata accessor for BankConnectInstitutionsProvider());
  uint64_t v4 = swift_retain();
  id v5 = sub_24383B6CC(v4);
  swift_release();

  return v5;
}

- (void)fetchConnectedInstitutionsWithCompletion:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10FinanceKit31BankConnectInstitutionsProvider_context);
  v7 = (void *)swift_allocObject();
  v7[2] = self;
  v7[3] = sub_24383BCD4;
  v7[4] = v5;
  v10[4] = sub_24383BCF0;
  v10[5] = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 1107296256;
  v10[2] = sub_2433FAFC4;
  v10[3] = &block_descriptor_40_0;
  v8 = _Block_copy(v10);
  v9 = self;
  swift_retain();
  swift_release();
  objc_msgSend(v6, sel_performBlock_, v8);
  _Block_release(v8);
  swift_release();
}

- (_TtC10FinanceKit31BankConnectInstitutionsProvider)init
{
  result = (_TtC10FinanceKit31BankConnectInstitutionsProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC10FinanceKit31BankConnectInstitutionsProvider_lastNotificationToken));
  swift_release();
  id v3 = (char *)self + OBJC_IVAR____TtC10FinanceKit31BankConnectInstitutionsProvider_delegate;

  sub_2434F0BE8((uint64_t)v3);
}

@end