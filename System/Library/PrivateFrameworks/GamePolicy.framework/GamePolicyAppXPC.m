@interface GamePolicyAppXPC
+ (id)GamePolicyAppClientInterface;
+ (id)GamePolicyAppServerInterface;
- (_TtC10GamePolicy16GamePolicyAppXPC)init;
@end

@implementation GamePolicyAppXPC

+ (id)GamePolicyAppServerInterface
{
  return sub_24F924830((uint64_t)a1, (uint64_t)a2, &protocolRef__TtP10GamePolicy19GamePolicyAppServer_);
}

+ (id)GamePolicyAppClientInterface
{
  return sub_24F924830((uint64_t)a1, (uint64_t)a2, &protocolRef__TtP10GamePolicy19GamePolicyAppClient_);
}

- (_TtC10GamePolicy16GamePolicyAppXPC)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for GamePolicyAppXPC();
  return [(GamePolicyAppXPC *)&v3 init];
}

@end