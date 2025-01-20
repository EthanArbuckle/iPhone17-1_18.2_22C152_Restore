@interface XPCFinancialConnectionExtensionAuthorizationParams
+ (BOOL)supportsSecureCoding;
- (_TtC12FinanceKitUI50XPCFinancialConnectionExtensionAuthorizationParams)init;
- (_TtC12FinanceKitUI50XPCFinancialConnectionExtensionAuthorizationParams)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation XPCFinancialConnectionExtensionAuthorizationParams

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC12FinanceKitUI50XPCFinancialConnectionExtensionAuthorizationParams)initWithCoder:(id)a3
{
  swift_getObjectType();
  sub_243D1EFD8(&qword_268E20548, (void (*)(void))type metadata accessor for XPCFinancialConnectionExtensionAuthorizationParams);
  sub_243D1D258(&qword_268E20550);
  sub_243D1D258(&qword_268E20560);
  id v4 = a3;
  v5 = (_TtC12FinanceKitUI50XPCFinancialConnectionExtensionAuthorizationParams *)sub_243DF9690();
  swift_deallocPartialClassInstance();
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  swift_getObjectType();
  sub_243D1EFD8(&qword_268E20548, (void (*)(void))type metadata accessor for XPCFinancialConnectionExtensionAuthorizationParams);
  sub_243D1D258(&qword_268E20550);
  sub_243D1D258(&qword_268E20560);
  id v5 = a3;
  v6 = self;
  sub_243DF96A0();
}

- (_TtC12FinanceKitUI50XPCFinancialConnectionExtensionAuthorizationParams)init
{
  result = (_TtC12FinanceKitUI50XPCFinancialConnectionExtensionAuthorizationParams *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end