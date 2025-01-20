@interface MapsSyncHistoryRideShareItem
- (BOOL)isEqual:(id)a3;
- (Class)managedObjectClass;
- (GEOComposedWaypoint)endWaypoint;
- (GEOComposedWaypoint)startWaypoint;
- (NSString)description;
- (_TtC8MapsSync28MapsSyncHistoryRideShareItem)initWithObject:(id)a3;
- (void)addEditWithBlock:(id)a3;
- (void)setPropertiesWithObject:(id)a3;
@end

@implementation MapsSyncHistoryRideShareItem

- (NSString)description
{
  v2 = self;
  sub_1A70752B4();

  v3 = (void *)sub_1A709D428();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (GEOComposedWaypoint)startWaypoint
{
  return (GEOComposedWaypoint *)sub_1A7075530((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync28MapsSyncHistoryRideShareItem__startWaypoint);
}

- (GEOComposedWaypoint)endWaypoint
{
  return (GEOComposedWaypoint *)sub_1A7075530((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync28MapsSyncHistoryRideShareItem__endWaypoint);
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
    v5 = self;
  }
  char v6 = sub_1A7075718((uint64_t)v8);

  sub_1A6F00364((uint64_t)v8);
  return v6 & 1;
}

- (void)setPropertiesWithObject:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1A7075B24(v4);
}

- (Class)managedObjectClass
{
  type metadata accessor for MapsSyncManagedHistoryRideShareItem();
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
  *(void *)(v7 + 16) = sub_1A7076ABC;
  *(void *)(v7 + 24) = v6;
  v8 = self;
  swift_retain();
  swift_retain();
  sub_1A7019234((uint64_t)sub_1A6F4EAD8, v7);

  swift_release();
  swift_release();
  swift_release();
}

- (_TtC8MapsSync28MapsSyncHistoryRideShareItem)initWithObject:(id)a3
{
  *(_OWORD *)((char *)&self->super.super.super.super.isa
            + OBJC_IVAR____TtC8MapsSync28MapsSyncHistoryRideShareItem__startWaypoint) = xmmword_1A70A4EA0;
  *(_OWORD *)((char *)&self->super.super.super.super.isa
            + OBJC_IVAR____TtC8MapsSync28MapsSyncHistoryRideShareItem__endWaypoint) = xmmword_1A70A4EA0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8MapsSync19MapsSyncHistoryItem__position) = 0;
  id v4 = a3;
  return (_TtC8MapsSync28MapsSyncHistoryRideShareItem *)sub_1A70198A0(a3);
}

- (void).cxx_destruct
{
  sub_1A6EEF5F4(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC8MapsSync28MapsSyncHistoryRideShareItem__startWaypoint), *(void *)&self->super.super.super._managedObjectID[OBJC_IVAR____TtC8MapsSync28MapsSyncHistoryRideShareItem__startWaypoint]);
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC8MapsSync28MapsSyncHistoryRideShareItem__endWaypoint);
  unint64_t v4 = *(void *)&self->super.super.super._managedObjectID[OBJC_IVAR____TtC8MapsSync28MapsSyncHistoryRideShareItem__endWaypoint];
  sub_1A6EEF5F4(v3, v4);
}

@end