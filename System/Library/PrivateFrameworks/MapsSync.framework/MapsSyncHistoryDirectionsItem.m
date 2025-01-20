@interface MapsSyncHistoryDirectionsItem
- (BOOL)isEqual:(id)a3;
- (BOOL)navigationInterrupted;
- (Class)managedObjectClass;
- (GEOStorageRouteRequestStorage)routeRequestStorage;
- (NSData)sharedETAData;
- (NSString)description;
- (_TtC8MapsSync29MapsSyncHistoryDirectionsItem)initWithObject:(id)a3;
- (void)addEditWithBlock:(id)a3;
- (void)setPropertiesWithObject:(id)a3;
@end

@implementation MapsSyncHistoryDirectionsItem

- (NSString)description
{
  v2 = self;
  sub_1A703FA2C();

  v3 = (void *)sub_1A709D428();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (BOOL)navigationInterrupted
{
  return *((unsigned char *)&self->super.super.super.super.isa
         + OBJC_IVAR____TtC8MapsSync29MapsSyncHistoryDirectionsItem__navigationInterrupted);
}

- (GEOStorageRouteRequestStorage)routeRequestStorage
{
  unint64_t v2 = *(void *)&self->super.super.super._managedObjectID[OBJC_IVAR____TtC8MapsSync29MapsSyncHistoryDirectionsItem__routeRequestStorage];
  if (v2 >> 60 == 15)
  {
    id v3 = 0;
  }
  else
  {
    uint64_t v5 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                    + OBJC_IVAR____TtC8MapsSync29MapsSyncHistoryDirectionsItem__routeRequestStorage);
    id v6 = objc_allocWithZone(MEMORY[0x1E4F64A88]);
    v7 = self;
    sub_1A6EEF588(v5, v2);
    v8 = (void *)sub_1A709D188();
    sub_1A6EEF5F4(v5, v2);
    id v3 = objc_msgSend(v6, sel_initWithData_, v8);
  }
  return (GEOStorageRouteRequestStorage *)v3;
}

- (NSData)sharedETAData
{
  unint64_t v2 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8MapsSync29MapsSyncHistoryDirectionsItem__sharedETAData);
  unint64_t v3 = *(void *)&self->super.super.super._managedObjectID[OBJC_IVAR____TtC8MapsSync29MapsSyncHistoryDirectionsItem__sharedETAData];
  if (v3 >> 60 == 15)
  {
    v4 = 0;
  }
  else
  {
    uint64_t v5 = *v2;
    sub_1A6EEF59C(*v2, v3);
    v4 = (void *)sub_1A709D188();
    sub_1A6EEF5F4(v5, v3);
  }
  return (NSData *)v4;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1A709D888();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    uint64_t v5 = self;
  }
  char v6 = sub_1A703FE1C((uint64_t)v8);

  sub_1A6F00364((uint64_t)v8);
  return v6 & 1;
}

- (void)setPropertiesWithObject:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1A703EED0(v4);
}

- (Class)managedObjectClass
{
  type metadata accessor for MapsSyncManagedHistoryDirectionsItem();
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
  *(void *)(v7 + 16) = sub_1A7040368;
  *(void *)(v7 + 24) = v6;
  v8 = self;
  swift_retain();
  swift_retain();
  sub_1A7019234((uint64_t)sub_1A6F4EAD8, v7);

  swift_release();
  swift_release();
  swift_release();
}

- (_TtC8MapsSync29MapsSyncHistoryDirectionsItem)initWithObject:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC8MapsSync29MapsSyncHistoryDirectionsItem__navigationInterrupted) = 0;
  *(_OWORD *)((char *)&self->super.super.super.super.isa
            + OBJC_IVAR____TtC8MapsSync29MapsSyncHistoryDirectionsItem__routeRequestStorage) = xmmword_1A70A4EA0;
  *(_OWORD *)((char *)&self->super.super.super.super.isa
            + OBJC_IVAR____TtC8MapsSync29MapsSyncHistoryDirectionsItem__sharedETAData) = xmmword_1A70A4EA0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8MapsSync19MapsSyncHistoryItem__position) = 0;
  id v4 = a3;
  return (_TtC8MapsSync29MapsSyncHistoryDirectionsItem *)sub_1A70198A0(a3);
}

- (void).cxx_destruct
{
  sub_1A6EEF5F4(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC8MapsSync29MapsSyncHistoryDirectionsItem__routeRequestStorage), *(void *)&self->super.super.super._managedObjectID[OBJC_IVAR____TtC8MapsSync29MapsSyncHistoryDirectionsItem__routeRequestStorage]);
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC8MapsSync29MapsSyncHistoryDirectionsItem__sharedETAData);
  unint64_t v4 = *(void *)&self->super.super.super._managedObjectID[OBJC_IVAR____TtC8MapsSync29MapsSyncHistoryDirectionsItem__sharedETAData];
  sub_1A6EEF5F4(v3, v4);
}

@end