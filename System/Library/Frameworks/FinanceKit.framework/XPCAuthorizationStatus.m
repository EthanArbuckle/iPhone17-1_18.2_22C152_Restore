@interface XPCAuthorizationStatus
+ (BOOL)supportsSecureCoding;
- (XPCAuthorizationStatus)init;
- (XPCAuthorizationStatus)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation XPCAuthorizationStatus

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (XPCAuthorizationStatus)initWithCoder:(id)a3
{
  swift_getObjectType();
  v4 = (XPCAuthorizationStatus *)sub_24337F044(a3);
  swift_deallocPartialClassInstance();
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  _s10FinanceKit19AuthorizationStatusO3XPCC6encode4withySo7NSCoderC_tF_0(v4);
}

- (XPCAuthorizationStatus)init
{
  result = (XPCAuthorizationStatus *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end