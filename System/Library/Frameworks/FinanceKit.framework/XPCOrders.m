@interface XPCOrders
+ (BOOL)supportsSecureCoding;
- (XPCOrders)init;
- (XPCOrders)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation XPCOrders

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (XPCOrders)initWithCoder:(id)a3
{
  swift_getObjectType();
  v4 = (XPCOrders *)sub_24337F650(a3);
  swift_deallocPartialClassInstance();
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  _s10FinanceKit5OrderV8XPCArrayC6encode4withySo7NSCoderC_tF_0(v4);
}

- (XPCOrders)init
{
  result = (XPCOrders *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end