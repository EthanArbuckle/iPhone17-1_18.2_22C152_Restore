@interface ForegroundApp
- (NSString)debugDescription;
- (_TtC15ConversationKit13ForegroundApp)init;
@end

@implementation ForegroundApp

- (NSString)debugDescription
{
  v2 = self;
  uint64_t v3 = ForegroundApp.debugDescription.getter();
  uint64_t v5 = v4;

  v6 = (void *)MEMORY[0x1C87730B0](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (_TtC15ConversationKit13ForegroundApp)init
{
}

- (void).cxx_destruct
{
}

@end