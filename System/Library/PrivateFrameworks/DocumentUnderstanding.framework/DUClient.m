@interface DUClient
- (NSString)identifier;
- (_TtC21DocumentUnderstanding8DUClient)init;
- (_TtC21DocumentUnderstanding8DUClient)initWithIdentifier:(id)a3;
@end

@implementation DUClient

- (NSString)identifier
{
  return (NSString *)sub_2367EA764((uint64_t)self, (uint64_t)a2, (void (*)(void))DUClient.identifier.getter);
}

- (_TtC21DocumentUnderstanding8DUClient)initWithIdentifier:(id)a3
{
  uint64_t v3 = sub_23697AF6C();
  return (_TtC21DocumentUnderstanding8DUClient *)DUClient.init(identifier:)(v3, v4);
}

- (_TtC21DocumentUnderstanding8DUClient)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
}

@end