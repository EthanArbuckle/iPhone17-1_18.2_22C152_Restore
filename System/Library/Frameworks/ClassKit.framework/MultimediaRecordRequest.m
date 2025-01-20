@interface MultimediaRecordRequest
- (NSArray)requestItems;
- (NSString)orgID;
- (NSString)zoneName;
- (NSString)zoneOwnerName;
- (_TtC9progressd23MultimediaRecordRequest)init;
- (void)setOrgID:(id)a3;
- (void)setRequestItems:(id)a3;
- (void)setZoneName:(id)a3;
- (void)setZoneOwnerName:(id)a3;
@end

@implementation MultimediaRecordRequest

- (NSString)zoneName
{
  return (NSString *)sub_100015E44();
}

- (void)setZoneName:(id)a3
{
}

- (NSString)zoneOwnerName
{
  return (NSString *)sub_100015E44();
}

- (void)setZoneOwnerName:(id)a3
{
}

- (NSString)orgID
{
  return (NSString *)sub_100015E44();
}

- (void)setOrgID:(id)a3
{
}

- (NSArray)requestItems
{
  swift_beginAccess();
  type metadata accessor for MultimediaRecordRequestItems();
  swift_bridgeObjectRetain();
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSArray *)v2.super.isa;
}

- (void)setRequestItems:(id)a3
{
  type metadata accessor for MultimediaRecordRequestItems();
  uint64_t v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC9progressd23MultimediaRecordRequest_requestItems);
  swift_beginAccess();
  uint64_t *v5 = v4;
  swift_bridgeObjectRelease();
}

- (_TtC9progressd23MultimediaRecordRequest)init
{
  NSArray v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9progressd23MultimediaRecordRequest_zoneName);
  *NSArray v2 = 0;
  v2[1] = 0xE000000000000000;
  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9progressd23MultimediaRecordRequest_zoneOwnerName);
  void *v3 = 0;
  v3[1] = 0xE000000000000000;
  uint64_t v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9progressd23MultimediaRecordRequest_orgID);
  *uint64_t v4 = 0;
  v4[1] = 0xE000000000000000;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9progressd23MultimediaRecordRequest_requestItems) = (Class)&_swiftEmptyArrayStorage;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for MultimediaRecordRequest();
  return [(MultimediaRecordRequest *)&v6 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end