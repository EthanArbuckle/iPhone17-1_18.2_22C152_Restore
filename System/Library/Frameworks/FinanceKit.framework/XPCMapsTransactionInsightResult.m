@interface XPCMapsTransactionInsightResult
+ (BOOL)supportsSecureCoding;
- (XPCMapsTransactionInsightResult)init;
- (XPCMapsTransactionInsightResult)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation XPCMapsTransactionInsightResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (XPCMapsTransactionInsightResult)initWithCoder:(id)a3
{
  swift_getObjectType();
  v4 = (XPCMapsTransactionInsightResult *)sub_243380494(a3);
  swift_deallocPartialClassInstance();
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  _s10FinanceKit28MapsTransactionInsightResultO3XPCC6encode4withySo7NSCoderC_tF_0(v4);
}

- (XPCMapsTransactionInsightResult)init
{
  result = (XPCMapsTransactionInsightResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end