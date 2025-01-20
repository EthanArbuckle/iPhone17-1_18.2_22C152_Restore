@interface XPCInternalTransaction
+ (BOOL)supportsSecureCoding;
- (XPCInternalTransaction)init;
- (XPCInternalTransaction)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation XPCInternalTransaction

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (XPCInternalTransaction)initWithCoder:(id)a3
{
  swift_getObjectType();
  v4 = (XPCInternalTransaction *)sub_24337FE5C(a3);
  swift_deallocPartialClassInstance();
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  _s10FinanceKit19InternalTransactionV3XPCC6encode4withySo7NSCoderC_tF_0(v4);
}

- (XPCInternalTransaction)init
{
  result = (XPCInternalTransaction *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end