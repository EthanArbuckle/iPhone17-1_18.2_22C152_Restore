@interface LabelSlotTag
+ (uint64_t)cacheLimit;
- (BOOL)isEqual:(id)a3;
- (_TtC19FamilyControlsAgent12LabelSlotTag)init;
- (int64_t)hash;
@end

@implementation LabelSlotTag

- (int64_t)hash
{
  Hasher.init()();
  v3 = self;
  Swift::UInt v4 = LabelSlotType.rawValue.getter();
  Hasher._combine(_:)(v4);
  swift_bridgeObjectRetain();
  String.hash(into:)();
  swift_bridgeObjectRelease();
  Swift::Int v5 = Hasher.finalize()();

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    Swift::UInt v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    Swift::Int v5 = self;
  }
  BOOL v6 = sub_100019798((uint64_t)v8);

  sub_10001A8D4((uint64_t)v8);
  return v6;
}

- (_TtC19FamilyControlsAgent12LabelSlotTag)init
{
  result = (_TtC19FamilyControlsAgent12LabelSlotTag *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

+ (uint64_t)cacheLimit
{
  type metadata accessor for UsageStore();
  static UsageStore.shared.getter();
  sub_10001A99C(&qword_100074078, (void (*)(uint64_t))&type metadata accessor for UsageStore);
  dispatch thunk of Collection.startIndex.getter();
  dispatch thunk of Collection.endIndex.getter();
  uint64_t v0 = dispatch thunk of Collection.distance(from:to:)();
  sub_10001A9E4(v6, v7, v8);
  sub_10001A9E4(v9, v10, v11);
  swift_release();
  id v1 = [self sharedCategories];
  id v2 = [v1 availableCategoryIDs];

  type metadata accessor for Identifier(0);
  uint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v4 = *(void *)(v3 + 16);
  swift_bridgeObjectRelease();
  uint64_t result = v0 + v4;
  if (__OFADD__(v0, v4)) {
    __break(1u);
  }
  return result;
}

@end