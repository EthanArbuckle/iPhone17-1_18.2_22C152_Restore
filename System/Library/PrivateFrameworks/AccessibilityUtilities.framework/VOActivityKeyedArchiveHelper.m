@interface VOActivityKeyedArchiveHelper
+ (BOOL)supportsSecureCoding;
- (VOActivityKeyedArchiveHelper)init;
- (VOActivityKeyedArchiveHelper)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VOActivityKeyedArchiveHelper

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (VOActivityKeyedArchiveHelper)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = (VOActivityKeyedArchiveHelper *)sub_18D3FD31C();

  return v4;
}

- (VOActivityKeyedArchiveHelper)init
{
  result = (VOActivityKeyedArchiveHelper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end