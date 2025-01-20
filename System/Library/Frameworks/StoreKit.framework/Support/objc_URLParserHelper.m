@interface objc_URLParserHelper
+ (id)urlTypeFor:(id)a3 bag:(id)a4 error:(id *)a5;
- (_TtC9storekitd20objc_URLParserHelper)init;
@end

@implementation objc_URLParserHelper

+ (id)urlTypeFor:(id)a3 bag:(id)a4 error:(id *)a5
{
  uint64_t v7 = sub_10001E6FC((uint64_t *)&unk_10039B760);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v10 = type metadata accessor for URL();
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v10 = type metadata accessor for URL();
    uint64_t v11 = 1;
  }
  sub_10001B5DC((uint64_t)v9, v11, 1, v10);
  swift_unknownObjectRetain();
  Class v12 = sub_10011D7E4((uint64_t)v9, (uint64_t)a4);
  sub_1000F2804((uint64_t)v9);
  swift_unknownObjectRelease();

  return v12;
}

- (_TtC9storekitd20objc_URLParserHelper)init
{
  return (_TtC9storekitd20objc_URLParserHelper *)sub_10011DB68();
}

@end