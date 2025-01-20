@interface MapsSyncMutableCollectionTransitItem
- (NSData)transitLineStorageData;
- (_TtC8MapsSync36MapsSyncMutableCollectionTransitItem)initWithProxyObject:(id)a3;
- (unint64_t)muid;
- (void)setMuid:(unint64_t)a3;
- (void)setTransitLineStorageData:(id)a3;
@end

@implementation MapsSyncMutableCollectionTransitItem

- (_TtC8MapsSync36MapsSyncMutableCollectionTransitItem)initWithProxyObject:(id)a3
{
  type metadata accessor for MapsSyncManagedCollectionTransitItem();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8MapsSync36MapsSyncMutableCollectionTransitItem__proxyCollectionTransitItem) = (Class)swift_dynamicCastClassUnconditional();
  type metadata accessor for MapsSyncManagedCollectionItem();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8MapsSync29MapsSyncMutableCollectionItem__proxyCollectionItem) = (Class)swift_dynamicCastClassUnconditional();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync23MapsSyncMutableBaseItem__proxyObject) = (Class)a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MapsSyncMutableBaseItem();
  id v5 = a3;
  return [(MapsSyncMutableBaseItem *)&v7 init];
}

- (NSData)transitLineStorageData
{
  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8MapsSync36MapsSyncMutableCollectionTransitItem__proxyCollectionTransitItem);
  v3 = self;
  id v4 = objc_msgSend(v2, sel_transitLineStorage);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = sub_1A709D198();
    unint64_t v8 = v7;

    v9 = (void *)sub_1A709D188();
    sub_1A6EEF608(v6, v8);
  }
  else
  {

    v9 = 0;
  }
  return (NSData *)v9;
}

- (void)setTransitLineStorageData:(id)a3
{
  v3 = a3;
  if (a3)
  {
    id v4 = self;
    id v5 = v3;
    v3 = (void *)sub_1A709D198();
    unint64_t v7 = v6;
  }
  else
  {
    unint64_t v8 = self;
    unint64_t v7 = 0xF000000000000000;
  }
  sub_1A6F271F8((uint64_t)v3, v7);
}

- (unint64_t)muid
{
  return (unint64_t)objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8MapsSync36MapsSyncMutableCollectionTransitItem__proxyCollectionTransitItem), sel_muid);
}

- (void)setMuid:(unint64_t)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8MapsSync36MapsSyncMutableCollectionTransitItem__proxyCollectionTransitItem));
}

@end