@interface MapsSyncHistoryMultiPointRoute
- (BOOL)isEqual:(id)a3;
- (BOOL)navigationInterrupted;
- (Class)managedObjectClass;
- (GEOStorageRouteRequestStorage)routeRequestStorage;
- (NSData)sharedETAData;
- (NSNumber)requiredCharge;
- (NSString)description;
- (NSString)vehicleIdentifier;
- (_TtC8MapsSync30MapsSyncHistoryMultiPointRoute)initWithObject:(id)a3;
- (signed)routeProgressWaypointIndex;
- (signed)type;
- (void)addEditWithBlock:(id)a3;
- (void)setPropertiesWithObject:(id)a3;
@end

@implementation MapsSyncHistoryMultiPointRoute

- (NSString)description
{
  v2 = self;
  sub_1A6F51404();

  v3 = (void *)sub_1A709D428();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (BOOL)navigationInterrupted
{
  return *((unsigned char *)&self->super.super.super.super.isa
         + OBJC_IVAR____TtC8MapsSync30MapsSyncHistoryMultiPointRoute__navigationInterrupted);
}

- (signed)routeProgressWaypointIndex
{
  return *(_WORD *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC8MapsSync30MapsSyncHistoryMultiPointRoute__routeProgressWaypointIndex);
}

- (GEOStorageRouteRequestStorage)routeRequestStorage
{
  unint64_t v2 = *(void *)&self->super.super.super._managedObjectID[OBJC_IVAR____TtC8MapsSync30MapsSyncHistoryMultiPointRoute__routeRequestStorage];
  if (v2 >> 60 == 15)
  {
    id v3 = 0;
  }
  else
  {
    uint64_t v5 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                    + OBJC_IVAR____TtC8MapsSync30MapsSyncHistoryMultiPointRoute__routeRequestStorage);
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
  unint64_t v2 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8MapsSync30MapsSyncHistoryMultiPointRoute__sharedETAData);
  unint64_t v3 = *(void *)&self->super.super.super._managedObjectID[OBJC_IVAR____TtC8MapsSync30MapsSyncHistoryMultiPointRoute__sharedETAData];
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

- (NSNumber)requiredCharge
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                             + OBJC_IVAR____TtC8MapsSync30MapsSyncHistoryMultiPointRoute__requiredCharge));
}

- (signed)type
{
  if (*(_WORD *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8MapsSync30MapsSyncHistoryMultiPointRoute__type))
    signed __int16 v2 = -1;
  else {
    signed __int16 v2 = 0;
  }
  if (*(_WORD *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8MapsSync30MapsSyncHistoryMultiPointRoute__type) == 1)
    return 1;
  else {
    return v2;
  }
}

- (NSString)vehicleIdentifier
{
  if (*(void *)&self->super.super.super._managedObjectID[OBJC_IVAR____TtC8MapsSync30MapsSyncHistoryMultiPointRoute__vehicleIdentifier])
  {
    swift_bridgeObjectRetain();
    signed __int16 v2 = (void *)sub_1A709D428();
    swift_bridgeObjectRelease();
  }
  else
  {
    signed __int16 v2 = 0;
  }
  return (NSString *)v2;
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
  char v6 = sub_1A6F51AEC((uint64_t)v8);

  sub_1A6F00364((uint64_t)v8);
  return v6 & 1;
}

- (void)setPropertiesWithObject:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1A6F520C0(v4);
}

- (Class)managedObjectClass
{
  type metadata accessor for MapsSyncManagedHistoryMultiPointRoute();
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
  *(void *)(v7 + 16) = sub_1A6F53DF8;
  *(void *)(v7 + 24) = v6;
  v8 = self;
  swift_retain();
  swift_retain();
  sub_1A7019234((uint64_t)sub_1A6F4EAD8, v7);

  swift_release();
  swift_release();
  swift_release();
}

- (_TtC8MapsSync30MapsSyncHistoryMultiPointRoute)initWithObject:(id)a3
{
  id v4 = a3;
  return (_TtC8MapsSync30MapsSyncHistoryMultiPointRoute *)sub_1A6F52594(a3);
}

- (void).cxx_destruct
{
  sub_1A6EEF5F4(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC8MapsSync30MapsSyncHistoryMultiPointRoute__routeRequestStorage), *(void *)&self->super.super.super._managedObjectID[OBJC_IVAR____TtC8MapsSync30MapsSyncHistoryMultiPointRoute__routeRequestStorage]);
  sub_1A6EEF5F4(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC8MapsSync30MapsSyncHistoryMultiPointRoute__sharedETAData), *(void *)&self->super.super.super._managedObjectID[OBJC_IVAR____TtC8MapsSync30MapsSyncHistoryMultiPointRoute__sharedETAData]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8MapsSync30MapsSyncHistoryMultiPointRoute__requiredCharge));
  swift_bridgeObjectRelease();
}

@end