@interface SwiftHelloMessageUI
- (NSString)world;
- (_TtC9MessageUI19SwiftHelloMessageUI)init;
- (id)worldWithTruncated:(int64_t)a3;
@end

@implementation SwiftHelloMessageUI

- (NSString)world
{
  v2 = self;
  SwiftHelloMessageUI.world.getter();

  id v5 = (id)sub_1AFA53FB8();
  swift_bridgeObjectRelease();

  return (NSString *)v5;
}

- (id)worldWithTruncated:(int64_t)a3
{
  v3 = self;
  SwiftHelloMessageUI.world(truncated:)(a3);

  v7 = (void *)sub_1AFA53FB8();
  swift_bridgeObjectRelease();

  return v7;
}

- (_TtC9MessageUI19SwiftHelloMessageUI)init
{
  return (_TtC9MessageUI19SwiftHelloMessageUI *)SwiftHelloMessageUI.init()();
}

@end