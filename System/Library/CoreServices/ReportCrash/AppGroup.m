@interface AppGroup
+ (BOOL)isALE:(id)a3;
- (_TtC11ReportCrash8AppGroup)init;
@end

@implementation AppGroup

+ (BOOL)isALE:(id)a3
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  char v5 = sub_10001FB88(v3, v4);
  swift_bridgeObjectRelease();
  return v5 & 1;
}

- (_TtC11ReportCrash8AppGroup)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AppGroup();
  return [(AppGroup *)&v3 init];
}

@end