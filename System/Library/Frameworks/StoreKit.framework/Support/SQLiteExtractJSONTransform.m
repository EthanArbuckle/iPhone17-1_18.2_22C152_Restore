@interface SQLiteExtractJSONTransform
+ (id)extractJSONAtKey:(id)a3;
- (_TtC9storekitd26SQLiteExtractJSONTransform)init;
- (_TtC9storekitd26SQLiteExtractJSONTransform)initWithIndex:(int64_t)a3;
- (_TtC9storekitd26SQLiteExtractJSONTransform)initWithKey:(id)a3;
- (_TtC9storekitd26SQLiteExtractJSONTransform)initWithKeyPath:(id)a3;
- (id)appending:(id)a3;
- (id)appendingWithIndex:(int64_t)a3;
- (id)appendingWithKey:(id)a3;
- (id)transformSQLWithRoot:(id)a3;
- (void)applyTransformBinding:(id)a3 atIndex:(int *)a4;
@end

@implementation SQLiteExtractJSONTransform

- (_TtC9storekitd26SQLiteExtractJSONTransform)initWithKey:(id)a3
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  return (_TtC9storekitd26SQLiteExtractJSONTransform *)sub_10013FB50(v3, v4);
}

- (_TtC9storekitd26SQLiteExtractJSONTransform)initWithIndex:(int64_t)a3
{
  return (_TtC9storekitd26SQLiteExtractJSONTransform *)sub_10013FC0C();
}

- (_TtC9storekitd26SQLiteExtractJSONTransform)initWithKeyPath:(id)a3
{
  uint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  return (_TtC9storekitd26SQLiteExtractJSONTransform *)sub_10013FCE0(v3);
}

+ (id)extractJSONAtKey:(id)a3
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  swift_getObjCClassMetadata();
  id v3 = sub_10013FE70();
  swift_bridgeObjectRelease();

  return v3;
}

- (id)appendingWithKey:(id)a3
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v4 = self;
  id v5 = sub_10013FF2C();

  swift_bridgeObjectRelease();

  return v5;
}

- (id)appendingWithIndex:(int64_t)a3
{
  id v3 = self;
  id v4 = sub_10014003C();

  return v4;
}

- (id)appending:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = sub_100140100();

  return v6;
}

- (_TtC9storekitd26SQLiteExtractJSONTransform)init
{
}

- (void).cxx_destruct
{
}

- (id)transformSQLWithRoot:(id)a3
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v4 = self;
  sub_100140250();

  swift_bridgeObjectRelease();
  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v5;
}

- (void)applyTransformBinding:(id)a3 atIndex:(int *)a4
{
  swift_unknownObjectRetain();
  v7 = self;
  sub_1001404BC(a3, (unsigned int *)a4);
  swift_unknownObjectRelease();
}

@end