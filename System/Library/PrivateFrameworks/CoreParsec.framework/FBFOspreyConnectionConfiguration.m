@interface FBFOspreyConnectionConfiguration
- (BOOL)disableDeviceAuthentication;
- (NSDictionary)extraHeaders;
- (_TtC11FlusherUtil32FBFOspreyConnectionConfiguration)init;
- (void)prepare:(id)a3;
- (void)setDisableDeviceAuthentication:(BOOL)a3;
- (void)setExtraHeaders:(id)a3;
@end

@implementation FBFOspreyConnectionConfiguration

- (BOOL)disableDeviceAuthentication
{
  return sub_1000A80C4() & 1;
}

- (void)setDisableDeviceAuthentication:(BOOL)a3
{
}

- (NSDictionary)extraHeaders
{
  sub_1000A816C();
  v2.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSDictionary *)v2.super.isa;
}

- (void)setExtraHeaders:(id)a3
{
  uint64_t v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = self;
  sub_1000A81F0(v4);
}

- (void)prepare:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000A85CC(v4);
}

- (_TtC11FlusherUtil32FBFOspreyConnectionConfiguration)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end