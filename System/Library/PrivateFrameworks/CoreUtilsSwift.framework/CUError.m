@interface CUError
+ (BOOL)supportsSecureCoding;
- (_TtC14CoreUtilsSwift7CUError)initWithCoder:(id)a3;
- (_TtC14CoreUtilsSwift7CUError)initWithDomain:(id)a3 code:(int64_t)a4 userInfo:(id)a5;
@end

@implementation CUError

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC14CoreUtilsSwift7CUError)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(CUError *)&v5 initWithCoder:a3];
}

- (_TtC14CoreUtilsSwift7CUError)initWithDomain:(id)a3 code:(int64_t)a4 userInfo:(id)a5
{
  result = (_TtC14CoreUtilsSwift7CUError *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end