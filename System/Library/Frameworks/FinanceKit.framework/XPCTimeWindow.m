@interface XPCTimeWindow
+ (BOOL)supportsSecureCoding;
- (XPCTimeWindow)init;
- (XPCTimeWindow)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation XPCTimeWindow

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (XPCTimeWindow)initWithCoder:(id)a3
{
  swift_getObjectType();
  v4 = (XPCTimeWindow *)sub_24337FB40(a3);
  swift_deallocPartialClassInstance();
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  _s10FinanceKit10TimeWindowV3XPCC6encode4withySo7NSCoderC_tF_0(v4);
}

- (XPCTimeWindow)init
{
  result = (XPCTimeWindow *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end