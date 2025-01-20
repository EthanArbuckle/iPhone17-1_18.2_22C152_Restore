@interface DashboardItem
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (NSString)description;
- (_TtC13FTMInternal_413DashboardItem)init;
- (_TtC13FTMInternal_413DashboardItem)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DashboardItem

+ (BOOL)supportsSecureCoding
{
  return byte_1002D8548;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_1002D8548 = a3;
}

- (NSString)description
{
  v2 = self;
  sub_10016A2A8();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10016A404(v4);
}

- (_TtC13FTMInternal_413DashboardItem)initWithCoder:(id)a3
{
  return (_TtC13FTMInternal_413DashboardItem *)sub_10016A670(a3);
}

- (_TtC13FTMInternal_413DashboardItem)init
{
  result = (_TtC13FTMInternal_413DashboardItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end