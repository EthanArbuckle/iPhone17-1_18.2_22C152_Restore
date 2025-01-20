@interface LogKey
- (NSString)description;
- (NSString)redactedDescription;
- (_TtC22ManagedAppDistribution6LogKey)init;
@end

@implementation LogKey

- (NSString)description
{
  return (NSString *)sub_2445A8D7C(self, (uint64_t)a2, (void (*)(void))LogKey.description.getter);
}

- (NSString)redactedDescription
{
  return (NSString *)sub_2445A8D7C(self, (uint64_t)a2, (void (*)(void))sub_2445A8DEC);
}

- (_TtC22ManagedAppDistribution6LogKey)init
{
  result = (_TtC22ManagedAppDistribution6LogKey *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end