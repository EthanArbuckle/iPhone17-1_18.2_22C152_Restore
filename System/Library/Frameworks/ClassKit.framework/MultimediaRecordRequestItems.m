@interface MultimediaRecordRequestItems
- (NSArray)assetFieldNames;
- (NSString)parentObjectID;
- (NSString)recordName;
- (_TtC9progressd28MultimediaRecordRequestItems)init;
- (int64_t)parentEntityType;
- (void)setAssetFieldNames:(id)a3;
- (void)setParentEntityType:(int64_t)a3;
- (void)setParentObjectID:(id)a3;
- (void)setRecordName:(id)a3;
@end

@implementation MultimediaRecordRequestItems

- (NSString)recordName
{
  return (NSString *)sub_100015E44();
}

- (void)setRecordName:(id)a3
{
}

- (NSString)parentObjectID
{
  return (NSString *)sub_100015E44();
}

- (void)setParentObjectID:(id)a3
{
}

- (int64_t)parentEntityType
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC9progressd28MultimediaRecordRequestItems_parentEntityType);
  swift_beginAccess();
  return *v2;
}

- (void)setParentEntityType:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR____TtC9progressd28MultimediaRecordRequestItems_parentEntityType);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (NSArray)assetFieldNames
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v2.super.isa;
}

- (void)setAssetFieldNames:(id)a3
{
  uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC9progressd28MultimediaRecordRequestItems_assetFieldNames);
  swift_beginAccess();
  uint64_t *v5 = v4;
  swift_bridgeObjectRelease();
}

- (_TtC9progressd28MultimediaRecordRequestItems)init
{
  NSArray v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9progressd28MultimediaRecordRequestItems_recordName);
  void *v2 = 0;
  v2[1] = 0xE000000000000000;
  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9progressd28MultimediaRecordRequestItems_parentObjectID);
  void *v3 = 0;
  v3[1] = 0xE000000000000000;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9progressd28MultimediaRecordRequestItems_parentEntityType) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9progressd28MultimediaRecordRequestItems_assetFieldNames) = (Class)&_swiftEmptyArrayStorage;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MultimediaRecordRequestItems();
  return [(MultimediaRecordRequestItems *)&v5 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end