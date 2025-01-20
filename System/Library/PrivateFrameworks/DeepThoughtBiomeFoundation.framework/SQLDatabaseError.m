@interface SQLDatabaseError
- (_TtC26DeepThoughtBiomeFoundation16SQLDatabaseError)initWithCoder:(id)a3;
- (_TtC26DeepThoughtBiomeFoundation16SQLDatabaseError)initWithDomain:(id)a3 code:(int64_t)a4 userInfo:(id)a5;
@end

@implementation SQLDatabaseError

- (_TtC26DeepThoughtBiomeFoundation16SQLDatabaseError)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SQLDatabaseError();
  return [(SQLDatabaseError *)&v5 initWithCoder:a3];
}

- (_TtC26DeepThoughtBiomeFoundation16SQLDatabaseError)initWithDomain:(id)a3 code:(int64_t)a4 userInfo:(id)a5
{
  result = (_TtC26DeepThoughtBiomeFoundation16SQLDatabaseError *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end