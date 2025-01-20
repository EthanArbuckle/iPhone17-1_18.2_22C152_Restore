@interface MapsSyncHistoryPlaceItem
+ (void)fetchNearbyPlacesWithLatitude:(double)a3 longitude:(double)a4 callbackQueue:(id)a5 completion:(id)a6;
- (BOOL)isEqual:(id)a3;
- (Class)managedObjectClass;
- (GEOMapItemStorage)mapItemStorage;
- (NSNumber)latitude;
- (NSNumber)longitude;
- (NSNumber)muid;
- (NSString)description;
- (NSUUID)supersededSearchId;
- (_TtC8MapsSync24MapsSyncHistoryPlaceItem)initWithObject:(id)a3;
- (void)addEditWithBlock:(id)a3;
- (void)setPropertiesWithObject:(id)a3;
@end

@implementation MapsSyncHistoryPlaceItem

- (NSString)description
{
  v2 = self;
  sub_1A6FC9F78();

  v3 = (void *)sub_1A709D428();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (GEOMapItemStorage)mapItemStorage
{
  unint64_t v2 = *(void *)&self->super.super.super._managedObjectID[OBJC_IVAR____TtC8MapsSync24MapsSyncHistoryPlaceItem__mapItemStorage];
  if (v2 >> 60 == 15)
  {
    id v3 = 0;
  }
  else
  {
    uint64_t v5 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                    + OBJC_IVAR____TtC8MapsSync24MapsSyncHistoryPlaceItem__mapItemStorage);
    id v6 = objc_allocWithZone(MEMORY[0x1E4F646E0]);
    v7 = self;
    sub_1A6EEF588(v5, v2);
    v8 = (void *)sub_1A709D188();
    sub_1A6EEF5F4(v5, v2);
    id v3 = objc_msgSend(v6, sel_initWithData_, v8);
  }
  return (GEOMapItemStorage *)v3;
}

- (NSUUID)supersededSearchId
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EB670A40);
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = (char *)self + OBJC_IVAR____TtC8MapsSync24MapsSyncHistoryPlaceItem__supersededSearchId;
  swift_beginAccess();
  sub_1A6F235F8((uint64_t)v6, (uint64_t)v5, (uint64_t *)&unk_1EB670A40);
  uint64_t v7 = sub_1A709D258();
  uint64_t v8 = *(void *)(v7 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    v9 = (void *)sub_1A709D228();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (NSUUID *)v9;
}

- (NSNumber)latitude
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                             + OBJC_IVAR____TtC8MapsSync24MapsSyncHistoryPlaceItem__latitude));
}

- (NSNumber)longitude
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                             + OBJC_IVAR____TtC8MapsSync24MapsSyncHistoryPlaceItem__longitude));
}

- (NSNumber)muid
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                             + OBJC_IVAR____TtC8MapsSync24MapsSyncHistoryPlaceItem__muid));
}

+ (void)fetchNearbyPlacesWithLatitude:(double)a3 longitude:(double)a4 callbackQueue:(id)a5 completion:(id)a6
{
  v9 = _Block_copy(a6);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  id v11 = a5;
  _s8MapsSync0aB16HistoryPlaceItemC17fetchNearbyPlaces8latitude9longitude13callbackQueue10completionySd_SdSo17OS_dispatch_queueCySayACGctFZ_0(v11, (uint64_t)sub_1A6FCD19C, v10, a3, a4);

  swift_release();
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
  char v6 = sub_1A6FCA680((uint64_t)v8);

  sub_1A6F22460((uint64_t)v8, (uint64_t *)&unk_1EB671260);
  return v6 & 1;
}

- (void)setPropertiesWithObject:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1A6FCADF0(v4);
}

- (Class)managedObjectClass
{
  type metadata accessor for MapsSyncManagedHistoryPlaceItem();
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
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = sub_1A6FCCBEC;
  *(void *)(v7 + 24) = v6;
  uint64_t v8 = self;
  swift_retain();
  swift_retain();
  sub_1A7019234((uint64_t)sub_1A6F4EAD8, v7);

  swift_release();
  swift_release();
  swift_release();
}

- (_TtC8MapsSync24MapsSyncHistoryPlaceItem)initWithObject:(id)a3
{
  *(_OWORD *)((char *)&self->super.super.super.super.isa
            + OBJC_IVAR____TtC8MapsSync24MapsSyncHistoryPlaceItem__mapItemStorage) = xmmword_1A70A4EA0;
  uint64_t v5 = (char *)self + OBJC_IVAR____TtC8MapsSync24MapsSyncHistoryPlaceItem__supersededSearchId;
  uint64_t v6 = sub_1A709D258();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8MapsSync24MapsSyncHistoryPlaceItem__latitude) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8MapsSync24MapsSyncHistoryPlaceItem__longitude) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8MapsSync24MapsSyncHistoryPlaceItem__muid) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8MapsSync19MapsSyncHistoryItem__position) = 0;
  id v7 = a3;
  return (_TtC8MapsSync24MapsSyncHistoryPlaceItem *)sub_1A70198A0(a3);
}

- (void).cxx_destruct
{
  sub_1A6EEF5F4(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC8MapsSync24MapsSyncHistoryPlaceItem__mapItemStorage), *(void *)&self->super.super.super._managedObjectID[OBJC_IVAR____TtC8MapsSync24MapsSyncHistoryPlaceItem__mapItemStorage]);
  sub_1A6F22460((uint64_t)self + OBJC_IVAR____TtC8MapsSync24MapsSyncHistoryPlaceItem__supersededSearchId, (uint64_t *)&unk_1EB670A40);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8MapsSync24MapsSyncHistoryPlaceItem__latitude));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8MapsSync24MapsSyncHistoryPlaceItem__longitude));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8MapsSync24MapsSyncHistoryPlaceItem__muid);
}

@end