@interface XPCAccountSelectionResult
+ (BOOL)supportsSecureCoding;
- (XPCAccountSelectionResult)init;
- (XPCAccountSelectionResult)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation XPCAccountSelectionResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (XPCAccountSelectionResult)initWithCoder:(id)a3
{
  swift_getObjectType();
  v4 = (XPCAccountSelectionResult *)sub_24337F1B8(a3);
  swift_deallocPartialClassInstance();
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  _s10FinanceKit22AccountSelectionResultO3XPCC6encode4withySo7NSCoderC_tF_0(v4);
}

- (XPCAccountSelectionResult)init
{
  result = (XPCAccountSelectionResult *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end