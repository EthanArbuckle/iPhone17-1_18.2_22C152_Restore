@interface XPCMapsTransactionInsight
+ (BOOL)supportsSecureCoding;
- (XPCMapsTransactionInsight)init;
- (XPCMapsTransactionInsight)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation XPCMapsTransactionInsight

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (XPCMapsTransactionInsight)initWithCoder:(id)a3
{
  swift_getObjectType();
  v4 = (XPCMapsTransactionInsight *)sub_24337F334(a3);
  swift_deallocPartialClassInstance();
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  _s10FinanceKit22MapsTransactionInsightV3XPCC6encode4withySo7NSCoderC_tF_0(v4);
}

- (XPCMapsTransactionInsight)init
{
  result = (XPCMapsTransactionInsight *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end