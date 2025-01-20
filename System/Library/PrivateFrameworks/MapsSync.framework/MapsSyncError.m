@interface MapsSyncError
+ (BOOL)supportsSecureCoding;
- (_TtC8MapsSync13MapsSyncError)initWithCoder:(id)a3;
- (_TtC8MapsSync13MapsSyncError)initWithDomain:(id)a3 code:(int64_t)a4 userInfo:(id)a5;
@end

@implementation MapsSyncError

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC8MapsSync13MapsSyncError)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MapsSyncError();
  return [(MapsSyncError *)&v5 initWithCoder:a3];
}

- (_TtC8MapsSync13MapsSyncError)initWithDomain:(id)a3 code:(int64_t)a4 userInfo:(id)a5
{
  result = (_TtC8MapsSync13MapsSyncError *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end