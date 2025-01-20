@interface DTError
+ (BOOL)supportsSecureCoding;
- (_TtC17DistributedTimers7DTError)initWithCoder:(id)a3;
- (_TtC17DistributedTimers7DTError)initWithDomain:(id)a3 code:(int64_t)a4 userInfo:(id)a5;
@end

@implementation DTError

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC17DistributedTimers7DTError)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(DTError *)&v5 initWithCoder:a3];
}

- (_TtC17DistributedTimers7DTError)initWithDomain:(id)a3 code:(int64_t)a4 userInfo:(id)a5
{
  result = (_TtC17DistributedTimers7DTError *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end