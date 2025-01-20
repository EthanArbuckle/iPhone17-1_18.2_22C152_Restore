@interface MapsSyncCommunityID
- (BOOL)expired;
- (BOOL)isEqual:(id)a3;
- (Class)managedObjectClass;
- (NSSet)rapRecords;
- (NSSet)reviewedPlaces;
- (NSString)communityIdentifier;
- (NSString)description;
- (_TtC8MapsSync19MapsSyncCommunityID)init;
- (_TtC8MapsSync19MapsSyncCommunityID)initWithObject:(id)a3;
- (int64_t)usedCount;
- (void)addEditWithBlock:(id)a3;
- (void)setPropertiesWithObject:(id)a3;
@end

@implementation MapsSyncCommunityID

- (_TtC8MapsSync19MapsSyncCommunityID)init
{
  v2 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC8MapsSync19MapsSyncCommunityID__communityIdentifier);
  void *v2 = 0;
  v2[1] = 0;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync19MapsSyncCommunityID__expired) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync19MapsSyncCommunityID__usedCount) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync19MapsSyncCommunityID__reviewedPlaces) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync19MapsSyncCommunityID__rapRecords) = 0;
  return (_TtC8MapsSync19MapsSyncCommunityID *)sub_1A70198A0(0);
}

- (_TtC8MapsSync19MapsSyncCommunityID)initWithObject:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC8MapsSync19MapsSyncCommunityID__communityIdentifier);
  void *v4 = 0;
  v4[1] = 0;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync19MapsSyncCommunityID__expired) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync19MapsSyncCommunityID__usedCount) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync19MapsSyncCommunityID__reviewedPlaces) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync19MapsSyncCommunityID__rapRecords) = 0;
  id v5 = a3;
  return (_TtC8MapsSync19MapsSyncCommunityID *)sub_1A70198A0(a3);
}

- (NSString)communityIdentifier
{
  if (*(void *)&self->super.super._managedObjectID[OBJC_IVAR____TtC8MapsSync19MapsSyncCommunityID__communityIdentifier])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1A709D428();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (BOOL)expired
{
  return *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync19MapsSyncCommunityID__expired);
}

- (int64_t)usedCount
{
  return *(int64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC8MapsSync19MapsSyncCommunityID__usedCount);
}

- (NSSet)rapRecords
{
  v2 = self;
  uint64_t v3 = sub_1A6FC4A00((uint64_t)v2, (uint64_t)sub_1A6FF26AC, 0);
  uint64_t v4 = OBJC_IVAR____TtC8MapsSync19MapsSyncCommunityID__rapRecords;
  *(Class *)((char *)&v2->super.super.super.isa + OBJC_IVAR____TtC8MapsSync19MapsSyncCommunityID__rapRecords) = (Class)v3;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(uint64_t *)((char *)&v2->super.super.super.isa + v4);
  swift_bridgeObjectRetain();

  if (v5)
  {
    type metadata accessor for MapsSyncRAPRecord();
    sub_1A6FF41B8(&qword_1E96E8108, (void (*)(uint64_t))type metadata accessor for MapsSyncRAPRecord);
    v6 = (void *)sub_1A709D618();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  return (NSSet *)v6;
}

- (NSSet)reviewedPlaces
{
  v2 = self;
  uint64_t v3 = sub_1A6FC4CA8((uint64_t)v2, (uint64_t)sub_1A6FF28FC, 0);
  uint64_t v4 = OBJC_IVAR____TtC8MapsSync19MapsSyncCommunityID__reviewedPlaces;
  *(Class *)((char *)&v2->super.super.super.isa + OBJC_IVAR____TtC8MapsSync19MapsSyncCommunityID__reviewedPlaces) = (Class)v3;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(uint64_t *)((char *)&v2->super.super.super.isa + v4);
  swift_bridgeObjectRetain();

  if (v5)
  {
    type metadata accessor for MapsSyncReviewedPlace();
    sub_1A6FF41B8((unint64_t *)&unk_1E96E89D0, (void (*)(uint64_t))type metadata accessor for MapsSyncReviewedPlace);
    v6 = (void *)sub_1A709D618();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  return (NSSet *)v6;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    uint64_t v4 = self;
    swift_unknownObjectRetain();
    sub_1A709D888();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    uint64_t v5 = self;
  }
  char v6 = sub_1A6FF29E8((uint64_t)v8);

  sub_1A6F00364((uint64_t)v8);
  return v6 & 1;
}

- (void)setPropertiesWithObject:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1A6FF2D20(v4);
}

- (Class)managedObjectClass
{
  type metadata accessor for MapsSyncManagedCommunityID();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)addEditWithBlock:(id)a3
{
  id v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = sub_1A6F022EC;
  *(void *)(v6 + 24) = v5;
  v7 = self;
  swift_retain();
  sub_1A7019234((uint64_t)sub_1A6FF2F7C, v6);

  swift_release();
  swift_release();
}

- (NSString)description
{
  v2 = self;
  sub_1A6FF30B0();

  uint64_t v3 = (void *)sub_1A709D428();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end