@interface MetricsIdentifierCloudDataController
- (id)createRecordForKey:(id)a3 recordType:(id)a4;
- (id)identifierRecordType;
- (id)identifierStoreRecordType;
- (id)keyForRecordIdentifier:(id)a3;
- (id)recordIdentifierForKey:(id)a3;
- (void)dataSourceAccountDidChange:(id)a3;
- (void)dataSourceDidChange:(id)a3;
@end

@implementation MetricsIdentifierCloudDataController

- (void)dataSourceAccountDidChange:(id)a3
{
}

- (void)dataSourceDidChange:(id)a3
{
}

- (id)identifierStoreRecordType
{
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return v2;
}

- (id)identifierRecordType
{
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return v2;
}

- (id)createRecordForKey:(id)a3 recordType:(id)a4
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  swift_retain();
  sub_100142910();
  v5 = v4;
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5;
}

- (id)keyForRecordIdentifier:(id)a3
{
  swift_unknownObjectRetain();
  swift_retain();
  sub_100142F94(a3);
  uint64_t v5 = v4;
  swift_unknownObjectRelease();
  swift_release();
  if (v5)
  {
    NSString v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
  }
  return v6;
}

- (id)recordIdentifierForKey:(id)a3
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = v4;
  swift_retain();
  v6.super.isa = sub_10014307C(v3, v5).super.isa;
  swift_release();
  swift_bridgeObjectRelease();
  return v6.super.isa;
}

@end