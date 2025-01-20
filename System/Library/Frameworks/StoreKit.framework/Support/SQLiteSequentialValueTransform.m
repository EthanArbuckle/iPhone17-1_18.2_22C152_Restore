@interface SQLiteSequentialValueTransform
+ (id)composingTransforms:(id)a3;
- (_TtC9storekitd30SQLiteSequentialValueTransform)init;
- (id)transformSQLWithRoot:(id)a3;
- (void)applyTransformBinding:(id)a3 atIndex:(int *)a4;
@end

@implementation SQLiteSequentialValueTransform

+ (id)composingTransforms:(id)a3
{
  sub_10001E6FC((uint64_t *)&unk_10039CB80);
  uint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  swift_getObjCClassMetadata();
  id v4 = sub_10012EFCC(v3);
  swift_bridgeObjectRelease();

  return v4;
}

- (_TtC9storekitd30SQLiteSequentialValueTransform)init
{
}

- (void).cxx_destruct
{
}

- (id)transformSQLWithRoot:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = self;
  sub_10012F110(v4);

  swift_bridgeObjectRelease();
  NSString v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v6;
}

- (void)applyTransformBinding:(id)a3 atIndex:(int *)a4
{
  swift_unknownObjectRetain();
  v7 = self;
  sub_10012F2F4((uint64_t)a3, (uint64_t)a4);
  swift_unknownObjectRelease();
}

@end