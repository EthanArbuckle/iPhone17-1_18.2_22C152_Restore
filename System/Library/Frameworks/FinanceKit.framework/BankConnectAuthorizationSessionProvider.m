@interface BankConnectAuthorizationSessionProvider
+ (id)makeProviderAndReturnError:(id *)a3;
- (_TtC10FinanceKit39BankConnectAuthorizationSessionProvider)init;
- (void)authorizationSessionWithCompletion:(id)a3;
@end

@implementation BankConnectAuthorizationSessionProvider

+ (id)makeProviderAndReturnError:(id *)a3
{
  id v3 = sub_2433FB260();

  return v3;
}

- (void)authorizationSessionWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC10FinanceKit39BankConnectAuthorizationSessionProvider_context);
  v7 = (void *)swift_allocObject();
  v7[2] = self;
  v7[3] = sub_2433FB428;
  v7[4] = v5;
  v10[4] = sub_2433FB4C8;
  v10[5] = v7;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 1107296256;
  v10[2] = sub_2433FAFC4;
  v10[3] = &block_descriptor_12;
  v8 = _Block_copy(v10);
  v9 = self;
  swift_retain();
  swift_release();
  objc_msgSend(v6, sel_performBlock_, v8);
  _Block_release(v8);

  swift_release();
}

- (_TtC10FinanceKit39BankConnectAuthorizationSessionProvider)init
{
  result = (_TtC10FinanceKit39BankConnectAuthorizationSessionProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  id v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC10FinanceKit39BankConnectAuthorizationSessionProvider_context);
}

@end