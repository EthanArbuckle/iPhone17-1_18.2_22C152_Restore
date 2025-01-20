@interface XPCFinancialConnectionExtensionAuthorizationResult
+ (BOOL)supportsSecureCoding;
- (XPCFinancialConnectionExtensionAuthorizationResult)init;
- (XPCFinancialConnectionExtensionAuthorizationResult)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation XPCFinancialConnectionExtensionAuthorizationResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (XPCFinancialConnectionExtensionAuthorizationResult)initWithCoder:(id)a3
{
  swift_getObjectType();
  sub_243D1EFD8(&qword_268E20640, (void (*)(void))type metadata accessor for FinancialConnectionExtensionAuthorizationResult.XPC);
  sub_243D1F01C();
  sub_243D1F070();
  id v4 = a3;
  v5 = (XPCFinancialConnectionExtensionAuthorizationResult *)sub_243DF9690();
  swift_deallocPartialClassInstance();
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  swift_getObjectType();
  sub_243D1EFD8(&qword_268E20640, (void (*)(void))type metadata accessor for FinancialConnectionExtensionAuthorizationResult.XPC);
  sub_243D1F01C();
  sub_243D1F070();
  id v5 = a3;
  v6 = self;
  sub_243DF96A0();
}

- (XPCFinancialConnectionExtensionAuthorizationResult)init
{
  result = (XPCFinancialConnectionExtensionAuthorizationResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end