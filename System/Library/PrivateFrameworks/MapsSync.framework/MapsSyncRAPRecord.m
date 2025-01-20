@interface MapsSyncRAPRecord
- (BOOL)isEqual:(id)a3;
- (Class)managedObjectClass;
- (NSData)contentData;
- (NSData)rapResponse;
- (NSDate)statusLastUpdatedDate;
- (NSString)countryCode;
- (NSString)reportId;
- (NSString)summary;
- (_TtC8MapsSync17MapsSyncRAPRecord)initWithObject:(id)a3;
- (_TtC8MapsSync19MapsSyncCommunityID)communityId;
- (signed)status;
- (signed)type;
- (void)addEditWithBlock:(id)a3;
- (void)setPropertiesWithObject:(id)a3;
@end

@implementation MapsSyncRAPRecord

- (NSString)countryCode
{
  return (NSString *)sub_1A6F389D8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync17MapsSyncRAPRecord__countryCode);
}

- (signed)type
{
  return *(_WORD *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync17MapsSyncRAPRecord__type);
}

- (NSString)summary
{
  return (NSString *)sub_1A6F389D8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync17MapsSyncRAPRecord__summary);
}

- (NSString)reportId
{
  return (NSString *)sub_1A6F389D8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync17MapsSyncRAPRecord__reportId);
}

- (signed)status
{
  return *(_WORD *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync17MapsSyncRAPRecord__status);
}

- (NSDate)statusLastUpdatedDate
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB670330);
  MEMORY[0x1F4188790](v3 - 8);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (char *)self + OBJC_IVAR____TtC8MapsSync17MapsSyncRAPRecord__statusLastUpdatedDate;
  swift_beginAccess();
  sub_1A6F235F8((uint64_t)v6, (uint64_t)v5, &qword_1EB670330);
  uint64_t v7 = sub_1A709D1F8();
  uint64_t v8 = *(void *)(v7 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    v9 = (void *)sub_1A709D1B8();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (NSDate *)v9;
}

- (NSData)contentData
{
  return (NSData *)sub_1A6F38C90((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync17MapsSyncRAPRecord__contentData);
}

- (NSData)rapResponse
{
  return (NSData *)sub_1A6F38C90((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync17MapsSyncRAPRecord__rapResponse);
}

- (_TtC8MapsSync19MapsSyncCommunityID)communityId
{
  v2 = self;
  uint64_t v3 = sub_1A6FC4758((uint64_t)v2, (uint64_t)sub_1A6F38E20, 0);
  uint64_t v4 = OBJC_IVAR____TtC8MapsSync17MapsSyncRAPRecord__communityId;
  v5 = *(Class *)((char *)&v2->super.super.super.isa + OBJC_IVAR____TtC8MapsSync17MapsSyncRAPRecord__communityId);
  *(Class *)((char *)&v2->super.super.super.isa + OBJC_IVAR____TtC8MapsSync17MapsSyncRAPRecord__communityId) = (Class)v3;

  v6 = (_TtC8MapsSync19MapsSyncCommunityID *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&v2->super.super.super.isa
                                                                                     + v4));

  return v6;
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
    v5 = self;
  }
  char v6 = sub_1A6F38EC0((uint64_t)v8);

  sub_1A6F22460((uint64_t)v8, (uint64_t *)&unk_1EB671260);
  return v6 & 1;
}

- (void)setPropertiesWithObject:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1A6F39850(v4);
}

- (Class)managedObjectClass
{
  type metadata accessor for MapsSyncManagedRAPRecord();
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
  uint64_t v7 = self;
  swift_retain();
  sub_1A7019234((uint64_t)sub_1A6F3C2E4, v6);

  swift_release();
  swift_release();
}

- (_TtC8MapsSync17MapsSyncRAPRecord)initWithObject:(id)a3
{
  id v4 = a3;
  return (_TtC8MapsSync17MapsSyncRAPRecord *)sub_1A6F39E0C(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1A6F22460((uint64_t)self + OBJC_IVAR____TtC8MapsSync17MapsSyncRAPRecord__statusLastUpdatedDate, &qword_1EB670330);
  sub_1A6EEF5F4(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync17MapsSyncRAPRecord__contentData), *(void *)&self->super.super._managedObjectID[OBJC_IVAR____TtC8MapsSync17MapsSyncRAPRecord__contentData]);
  sub_1A6EEF5F4(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync17MapsSyncRAPRecord__rapResponse), *(void *)&self->super.super._managedObjectID[OBJC_IVAR____TtC8MapsSync17MapsSyncRAPRecord__rapResponse]);
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync17MapsSyncRAPRecord__communityId);
}

@end