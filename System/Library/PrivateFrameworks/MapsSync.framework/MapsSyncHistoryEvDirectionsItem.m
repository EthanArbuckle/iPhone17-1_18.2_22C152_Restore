@interface MapsSyncHistoryEvDirectionsItem
- (BOOL)isEqual:(id)a3;
- (Class)managedObjectClass;
- (NSString)description;
- (NSString)vehicleIdentifier;
- (_TtC8MapsSync31MapsSyncHistoryEvDirectionsItem)initWithObject:(id)a3;
- (double)requiredCharge;
- (void)addEditWithBlock:(id)a3;
- (void)setPropertiesWithObject:(id)a3;
@end

@implementation MapsSyncHistoryEvDirectionsItem

- (NSString)description
{
  v2 = self;
  sub_1A6F4D328();

  v3 = (void *)sub_1A709D428();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (double)requiredCharge
{
  return *(double *)((char *)&self->super.super.super.super.super.isa
                   + OBJC_IVAR____TtC8MapsSync31MapsSyncHistoryEvDirectionsItem__requiredCharge);
}

- (NSString)vehicleIdentifier
{
  if (*(void *)&self->super.super.super.super._managedObjectID[OBJC_IVAR____TtC8MapsSync31MapsSyncHistoryEvDirectionsItem__vehicleIdentifier])
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
  char v6 = sub_1A6F4D5B4((uint64_t)v8);

  sub_1A6F00364((uint64_t)v8);
  return v6 & 1;
}

- (void)setPropertiesWithObject:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1A6F4D894(v4);
}

- (Class)managedObjectClass
{
  type metadata accessor for MapsSyncManagedHistoryEvDirectionsItem();
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
  *(void *)(v7 + 16) = sub_1A6F4DB7C;
  *(void *)(v7 + 24) = v6;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = sub_1A6F4EAD4;
  *(void *)(v8 + 24) = v7;
  v9 = self;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_1A7019234((uint64_t)sub_1A6F4EAD8, v8);

  swift_release();
  swift_release();
  swift_release();
  swift_release();
}

- (_TtC8MapsSync31MapsSyncHistoryEvDirectionsItem)initWithObject:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC8MapsSync31MapsSyncHistoryEvDirectionsItem__requiredCharge) = 0;
  id v4 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC8MapsSync31MapsSyncHistoryEvDirectionsItem__vehicleIdentifier);
  void *v4 = 0;
  v4[1] = 0;
  *((unsigned char *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC8MapsSync29MapsSyncHistoryDirectionsItem__navigationInterrupted) = 0;
  *(_OWORD *)((char *)&self->super.super.super.super.super.isa
            + OBJC_IVAR____TtC8MapsSync29MapsSyncHistoryDirectionsItem__routeRequestStorage) = xmmword_1A70A4EA0;
  *(_OWORD *)((char *)&self->super.super.super.super.super.isa
            + OBJC_IVAR____TtC8MapsSync29MapsSyncHistoryDirectionsItem__sharedETAData) = xmmword_1A70A4EA0;
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC8MapsSync19MapsSyncHistoryItem__position) = 0;
  id v5 = a3;
  return (_TtC8MapsSync31MapsSyncHistoryEvDirectionsItem *)sub_1A70198A0(a3);
}

- (void).cxx_destruct
{
}

@end