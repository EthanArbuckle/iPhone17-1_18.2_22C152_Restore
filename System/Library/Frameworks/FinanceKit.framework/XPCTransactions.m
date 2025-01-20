@interface XPCTransactions
+ (BOOL)supportsSecureCoding;
- (XPCTransactions)init;
- (XPCTransactions)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation XPCTransactions

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (XPCTransactions)initWithCoder:(id)a3
{
  swift_getObjectType();
  v4 = (XPCTransactions *)sub_24337EE44(a3);
  swift_deallocPartialClassInstance();
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  _s10FinanceKit11TransactionV8XPCArrayC6encode4withySo7NSCoderC_tF_0(v4);
}

- (XPCTransactions)init
{
  result = (XPCTransactions *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end