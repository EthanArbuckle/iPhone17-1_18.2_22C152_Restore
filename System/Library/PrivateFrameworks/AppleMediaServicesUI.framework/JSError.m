@interface JSError
- (NSDictionary)export;
- (NSString)message;
- (NSString)title;
- (_TtC14amsengagementd7JSError)initWithCoder:(id)a3;
- (_TtC14amsengagementd7JSError)initWithDomain:(id)a3 code:(int64_t)a4 userInfo:(id)a5;
@end

@implementation JSError

- (NSString)message
{
  return (NSString *)sub_1000DE26C(self, (uint64_t)a2, (void (*)(void))sub_1000284EC);
}

- (NSString)title
{
  return (NSString *)sub_1000DE26C(self, (uint64_t)a2, (void (*)(void))sub_1000284F8);
}

- (NSDictionary)export
{
  v2 = self;
  sub_100028288();

  v3.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSDictionary *)v3.super.isa;
}

- (_TtC14amsengagementd7JSError)initWithCoder:(id)a3
{
}

- (_TtC14amsengagementd7JSError)initWithDomain:(id)a3 code:(int64_t)a4 userInfo:(id)a5
{
  if (a5) {
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  sub_1000DE3CC();
}

@end