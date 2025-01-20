@interface SQLiteFunction
+ (_TtC9storekitd14SQLiteFunction)extractJWSPayload;
+ (_TtC9storekitd14SQLiteFunction)unarchiveRenewalInfoAsJSON;
- (BOOL)canCallIndirectly;
- (BOOL)isPure;
- (NSString)name;
- (_TtC9storekitd14SQLiteFunction)init;
- (id)transformSQLWithRoot:(id)a3;
- (int)flags;
- (int64_t)argumentCount;
- (void)withUnsafePropertyPointers:(id)a3;
@end

@implementation SQLiteFunction

- (NSString)name
{
  sub_1000A9988();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (int64_t)argumentCount
{
  return sub_1000A99E8();
}

- (BOOL)isPure
{
  return sub_1000A9DD4() & 1;
}

- (BOOL)canCallIndirectly
{
  return sub_1000A9E14();
}

- (int)flags
{
  return sub_1000A9E54();
}

- (void)withUnsafePropertyPointers:(id)a3
{
  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_1000AA1A8((uint64_t)v5, v4);
  _Block_release(v4);
}

- (_TtC9storekitd14SQLiteFunction)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_release();
}

- (id)transformSQLWithRoot:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = v5;
  v7 = self;
  sub_1000AAD0C(v4, v6);

  swift_bridgeObjectRelease();
  NSString v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v8;
}

+ (_TtC9storekitd14SQLiteFunction)extractJWSPayload
{
  id v2 = sub_100171270(&qword_10039A040, (void **)&qword_1003AFFF8);

  return (_TtC9storekitd14SQLiteFunction *)v2;
}

+ (_TtC9storekitd14SQLiteFunction)unarchiveRenewalInfoAsJSON
{
  id v2 = sub_100171270(&qword_10039A048, (void **)&qword_1003B0000);

  return (_TtC9storekitd14SQLiteFunction *)v2;
}

@end