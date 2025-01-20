@interface MapsSyncHistoryTransitItem
- (BOOL)isEqual:(id)a3;
- (Class)managedObjectClass;
- (NSData)transitLineItemStorageData;
- (NSString)description;
- (_TtC8MapsSync26MapsSyncHistoryTransitItem)initWithObject:(id)a3;
- (unint64_t)muid;
- (void)addEditWithBlock:(id)a3;
- (void)setPropertiesWithObject:(id)a3;
@end

@implementation MapsSyncHistoryTransitItem

- (NSString)description
{
  v2 = self;
  sub_1A6FB33A8();

  v3 = (void *)sub_1A709D428();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSData)transitLineItemStorageData
{
  v2 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8MapsSync26MapsSyncHistoryTransitItem__transitLineStorage);
  unint64_t v3 = *(void *)&self->super.super.super._managedObjectID[OBJC_IVAR____TtC8MapsSync26MapsSyncHistoryTransitItem__transitLineStorage];
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

- (unint64_t)muid
{
  return *(unint64_t *)((char *)&self->super.super.super.super.isa
                             + OBJC_IVAR____TtC8MapsSync26MapsSyncHistoryTransitItem__muid);
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
  char v6 = sub_1A6FB3614((uint64_t)v8);

  sub_1A6F00364((uint64_t)v8);
  return v6 & 1;
}

- (void)setPropertiesWithObject:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1A6FB3894(v4);
}

- (Class)managedObjectClass
{
  type metadata accessor for MapsSyncManagedHistoryTransitItem();
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
  *(void *)(v7 + 16) = sub_1A6FB3B64;
  *(void *)(v7 + 24) = v6;
  v8 = self;
  swift_retain();
  swift_retain();
  sub_1A7019234((uint64_t)sub_1A6F4EAD8, v7);

  swift_release();
  swift_release();
  swift_release();
}

- (_TtC8MapsSync26MapsSyncHistoryTransitItem)initWithObject:(id)a3
{
  *(_OWORD *)((char *)&self->super.super.super.super.isa
            + OBJC_IVAR____TtC8MapsSync26MapsSyncHistoryTransitItem__transitLineStorage) = xmmword_1A70A4EA0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8MapsSync26MapsSyncHistoryTransitItem__muid) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8MapsSync19MapsSyncHistoryItem__position) = 0;
  id v4 = a3;
  return (_TtC8MapsSync26MapsSyncHistoryTransitItem *)sub_1A70198A0(a3);
}

- (void).cxx_destruct
{
}

@end