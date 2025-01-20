@interface XPCTransactionInsight
+ (BOOL)supportsSecureCoding;
- (XPCTransactionInsight)init;
- (XPCTransactionInsight)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation XPCTransactionInsight

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (XPCTransactionInsight)initWithCoder:(id)a3
{
  swift_getObjectType();
  v4 = (XPCTransactionInsight *)sub_24337F824(a3);
  swift_deallocPartialClassInstance();
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  _s10FinanceKit11TransactionV7InsightO3XPCC6encode4withySo7NSCoderC_tF_0(v4);
}

- (XPCTransactionInsight)init
{
  result = (XPCTransactionInsight *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end