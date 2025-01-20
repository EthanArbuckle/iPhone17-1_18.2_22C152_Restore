@interface MapsSyncMutableHistoryDirectionsItem
- (BOOL)navigationInterrupted;
- (GEOStorageRouteRequestStorage)routeRequestStorage;
- (NSData)sharedETAData;
- (_TtC8MapsSync36MapsSyncMutableHistoryDirectionsItem)initWithProxyObject:(id)a3;
- (void)setNavigationInterrupted:(BOOL)a3;
- (void)setRouteRequestStorage:(id)a3;
- (void)setSharedETAData:(id)a3;
@end

@implementation MapsSyncMutableHistoryDirectionsItem

- (_TtC8MapsSync36MapsSyncMutableHistoryDirectionsItem)initWithProxyObject:(id)a3
{
  type metadata accessor for MapsSyncManagedHistoryDirectionsItem();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8MapsSync36MapsSyncMutableHistoryDirectionsItem__proxyHistory) = (Class)swift_dynamicCastClassUnconditional();
  type metadata accessor for MapsSyncManagedHistoryItem();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync26MapsSyncMutableHistoryItem__proxyHistory) = (Class)swift_dynamicCastClassUnconditional();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync23MapsSyncMutableBaseItem__proxyObject) = (Class)a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MapsSyncMutableBaseItem();
  id v5 = a3;
  return [(MapsSyncMutableBaseItem *)&v7 init];
}

- (BOOL)navigationInterrupted
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8MapsSync36MapsSyncMutableHistoryDirectionsItem__proxyHistory), sel_navigationInterrupted);
}

- (void)setNavigationInterrupted:(BOOL)a3
{
}

- (GEOStorageRouteRequestStorage)routeRequestStorage
{
  v2 = self;
  id v3 = sub_1A703F394();

  return (GEOStorageRouteRequestStorage *)v3;
}

- (void)setRouteRequestStorage:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1A703F480(a3);
}

- (NSData)sharedETAData
{
  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8MapsSync36MapsSyncMutableHistoryDirectionsItem__proxyHistory);
  id v3 = self;
  id v4 = objc_msgSend(v2, sel_sharedETAData);
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

- (void)setSharedETAData:(id)a3
{
  id v3 = a3;
  if (a3)
  {
    id v5 = self;
    id v6 = v3;
    id v3 = (void *)sub_1A709D198();
    unint64_t v8 = v7;

    v9 = *(Class *)((char *)&v5->super.super.super.isa
                  + OBJC_IVAR____TtC8MapsSync36MapsSyncMutableHistoryDirectionsItem__proxyHistory);
    if (v8 >> 60 != 15)
    {
      id v10 = v9;
      uint64_t v11 = sub_1A709D188();
      goto LABEL_6;
    }
  }
  else
  {
    v9 = *(Class *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC8MapsSync36MapsSyncMutableHistoryDirectionsItem__proxyHistory);
    v12 = self;
    unint64_t v8 = 0xF000000000000000;
  }
  id v10 = v9;
  uint64_t v11 = 0;
LABEL_6:
  id v13 = (id)v11;
  objc_msgSend(v10, sel_setSharedETAData_);
  sub_1A6EEF5F4((uint64_t)v3, v8);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8MapsSync36MapsSyncMutableHistoryDirectionsItem__proxyHistory));
}

@end