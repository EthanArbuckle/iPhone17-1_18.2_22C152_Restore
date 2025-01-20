@interface JSClientDemo
- (BOOL)inStoreDemoMode;
- (NSDictionary)options;
- (NSString)storeId;
- (_TtC14amsengagementd12JSClientDemo)init;
- (int64_t)deviceType;
@end

@implementation JSClientDemo

- (_TtC14amsengagementd12JSClientDemo)init
{
  return (_TtC14amsengagementd12JSClientDemo *)sub_100054768();
}

- (int64_t)deviceType
{
  v2 = self;
  unint64_t v3 = sub_1000D5214();

  return v3;
}

- (BOOL)inStoreDemoMode
{
  v2 = self;
  unsigned __int8 v3 = sub_1000D5330();

  return v3 & 1;
}

- (NSDictionary)options
{
  v2 = self;
  sub_1000D53D0();

  v3.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSDictionary *)v3.super.isa;
}

- (NSString)storeId
{
  v2 = self;
  sub_1000D558C();
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }
  return (NSString *)v5;
}

@end