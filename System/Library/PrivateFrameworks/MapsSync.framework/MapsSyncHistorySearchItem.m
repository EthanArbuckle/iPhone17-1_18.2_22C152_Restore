@interface MapsSyncHistorySearchItem
- (BOOL)isEqual:(id)a3;
- (Class)managedObjectClass;
- (GEOMapRegion)geoMapRegion;
- (NSString)description;
- (NSString)language;
- (NSString)locationDisplay;
- (NSString)query;
- (_TtC8MapsSync25MapsSyncHistorySearchItem)initWithObject:(id)a3;
- (void)addEditWithBlock:(id)a3;
- (void)setPropertiesWithObject:(id)a3;
@end

@implementation MapsSyncHistorySearchItem

- (NSString)description
{
  v2 = self;
  sub_1A6FD68C4();

  v3 = (void *)sub_1A709D428();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (GEOMapRegion)geoMapRegion
{
  unint64_t v2 = *(void *)&self->super.super.super._managedObjectID[OBJC_IVAR____TtC8MapsSync25MapsSyncHistorySearchItem__geoMapRegion];
  if (v2 >> 60 == 15)
  {
    id v3 = 0;
  }
  else
  {
    uint64_t v5 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                    + OBJC_IVAR____TtC8MapsSync25MapsSyncHistorySearchItem__geoMapRegion);
    id v6 = objc_allocWithZone(MEMORY[0x1E4F64700]);
    v7 = self;
    sub_1A6EEF588(v5, v2);
    v8 = (void *)sub_1A709D188();
    sub_1A6EEF5F4(v5, v2);
    id v3 = objc_msgSend(v6, sel_initWithData_, v8);
  }
  return (GEOMapRegion *)v3;
}

- (NSString)language
{
  return (NSString *)sub_1A6F389D8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync25MapsSyncHistorySearchItem__language);
}

- (NSString)locationDisplay
{
  return (NSString *)sub_1A6F389D8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync25MapsSyncHistorySearchItem__locationDisplay);
}

- (NSString)query
{
  return (NSString *)sub_1A6F389D8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync25MapsSyncHistorySearchItem__query);
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
  char v6 = sub_1A6FD6D78((uint64_t)v8);

  sub_1A6F00364((uint64_t)v8);
  return v6 & 1;
}

- (void)setPropertiesWithObject:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1A6FD71B8(v4);
}

- (Class)managedObjectClass
{
  type metadata accessor for MapsSyncManagedHistorySearchItem();
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
  *(void *)(v7 + 16) = sub_1A6FD8664;
  *(void *)(v7 + 24) = v6;
  v8 = self;
  swift_retain();
  swift_retain();
  sub_1A7019234((uint64_t)sub_1A6F4EAD8, v7);

  swift_release();
  swift_release();
  swift_release();
}

- (_TtC8MapsSync25MapsSyncHistorySearchItem)initWithObject:(id)a3
{
  *(_OWORD *)((char *)&self->super.super.super.super.isa
            + OBJC_IVAR____TtC8MapsSync25MapsSyncHistorySearchItem__geoMapRegion) = xmmword_1A70A4EA0;
  id v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC8MapsSync25MapsSyncHistorySearchItem__language);
  void *v4 = 0;
  v4[1] = 0;
  uint64_t v5 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC8MapsSync25MapsSyncHistorySearchItem__locationDisplay);
  *uint64_t v5 = 0;
  v5[1] = 0;
  uint64_t v6 = (Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8MapsSync25MapsSyncHistorySearchItem__query);
  *uint64_t v6 = 0;
  v6[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8MapsSync19MapsSyncHistoryItem__position) = 0;
  id v7 = a3;
  return (_TtC8MapsSync25MapsSyncHistorySearchItem *)sub_1A70198A0(a3);
}

- (void).cxx_destruct
{
  sub_1A6EEF5F4(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC8MapsSync25MapsSyncHistorySearchItem__geoMapRegion), *(void *)&self->super.super.super._managedObjectID[OBJC_IVAR____TtC8MapsSync25MapsSyncHistorySearchItem__geoMapRegion]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end