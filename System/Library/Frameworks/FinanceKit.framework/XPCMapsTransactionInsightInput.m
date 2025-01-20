@interface XPCMapsTransactionInsightInput
+ (BOOL)supportsSecureCoding;
- (XPCMapsTransactionInsightInput)init;
- (XPCMapsTransactionInsightInput)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation XPCMapsTransactionInsightInput

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (XPCMapsTransactionInsightInput)initWithCoder:(id)a3
{
  swift_getObjectType();
  v4 = (XPCMapsTransactionInsightInput *)sub_243380178(a3);
  swift_deallocPartialClassInstance();
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  _s10FinanceKit27MapsTransactionInsightInputV3XPCC6encode4withySo7NSCoderC_tF_0(v4);
}

- (XPCMapsTransactionInsightInput)init
{
  result = (XPCMapsTransactionInsightInput *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end