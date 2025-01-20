@interface LogKey
- (NSString)description;
- (NSString)redactedDescription;
- (_TtC28AppInstallationMetricsDaemon6LogKey)init;
@end

@implementation LogKey

- (NSString)description
{
  return (NSString *)sub_10000DD44(self, (uint64_t)a2, (void (*)(void))sub_10000DBF8);
}

- (NSString)redactedDescription
{
  return (NSString *)sub_10000DD44(self, (uint64_t)a2, (void (*)(void))sub_10000DDB4);
}

- (_TtC28AppInstallationMetricsDaemon6LogKey)init
{
  result = (_TtC28AppInstallationMetricsDaemon6LogKey *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end