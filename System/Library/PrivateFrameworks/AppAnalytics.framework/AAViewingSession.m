@interface AAViewingSession
- (AAViewingSession)init;
- (NSString)identifier;
@end

@implementation AAViewingSession

- (NSString)identifier
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A916AF60();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (AAViewingSession)init
{
  result = (AAViewingSession *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end