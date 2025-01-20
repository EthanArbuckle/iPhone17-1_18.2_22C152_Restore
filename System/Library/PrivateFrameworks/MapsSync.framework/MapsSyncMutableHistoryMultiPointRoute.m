@interface MapsSyncMutableHistoryMultiPointRoute
- (BOOL)navigationInterrupted;
- (GEOStorageRouteRequestStorage)routeRequestStorage;
- (NSData)sharedETAData;
- (NSNumber)requiredCharge;
- (NSString)vehicleIdentifier;
- (_TtC8MapsSync37MapsSyncMutableHistoryMultiPointRoute)initWithProxyObject:(id)a3;
- (signed)routeProgressWaypointIndex;
- (signed)type;
- (void)setNavigationInterrupted:(BOOL)a3;
- (void)setRequiredCharge:(id)a3;
- (void)setRouteProgressWaypointIndex:(signed __int16)a3;
- (void)setRouteRequestStorage:(id)a3;
- (void)setSharedETAData:(id)a3;
- (void)setType:(signed __int16)a3;
- (void)setVehicleIdentifier:(id)a3;
@end

@implementation MapsSyncMutableHistoryMultiPointRoute

- (_TtC8MapsSync37MapsSyncMutableHistoryMultiPointRoute)initWithProxyObject:(id)a3
{
  type metadata accessor for MapsSyncManagedHistoryMultiPointRoute();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8MapsSync37MapsSyncMutableHistoryMultiPointRoute__proxyHistory) = (Class)swift_dynamicCastClassUnconditional();
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
  return objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8MapsSync37MapsSyncMutableHistoryMultiPointRoute__proxyHistory), sel_navigationInterrupted);
}

- (void)setNavigationInterrupted:(BOOL)a3
{
}

- (signed)routeProgressWaypointIndex
{
  return (unsigned __int16)objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8MapsSync37MapsSyncMutableHistoryMultiPointRoute__proxyHistory), sel_routeProgressWaypointIndex);
}

- (void)setRouteProgressWaypointIndex:(signed __int16)a3
{
}

- (GEOStorageRouteRequestStorage)routeRequestStorage
{
  v2 = self;
  id v3 = sub_1A6F52B80();

  return (GEOStorageRouteRequestStorage *)v3;
}

- (void)setRouteRequestStorage:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1A6F52CC8(a3);
}

- (NSData)sharedETAData
{
  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8MapsSync37MapsSyncMutableHistoryMultiPointRoute__proxyHistory);
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
                  + OBJC_IVAR____TtC8MapsSync37MapsSyncMutableHistoryMultiPointRoute__proxyHistory);
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
                  + OBJC_IVAR____TtC8MapsSync37MapsSyncMutableHistoryMultiPointRoute__proxyHistory);
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

- (NSNumber)requiredCharge
{
  id v2 = objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC8MapsSync37MapsSyncMutableHistoryMultiPointRoute__proxyHistory), sel_requiredCharge);
  return (NSNumber *)v2;
}

- (void)setRequiredCharge:(id)a3
{
}

- (signed)type
{
  id v2 = self;
  signed __int16 v3 = sub_1A6F5382C();

  return v3;
}

- (void)setType:(signed __int16)a3
{
}

- (NSString)vehicleIdentifier
{
  id v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8MapsSync37MapsSyncMutableHistoryMultiPointRoute__proxyHistory);
  signed __int16 v3 = self;
  id v4 = objc_msgSend(v2, sel_vehicleIdentifier);
  if (v4)
  {
    id v5 = v4;
    sub_1A709D438();

    id v6 = (void *)sub_1A709D428();
    swift_bridgeObjectRelease();
  }
  else
  {

    id v6 = 0;
  }
  return (NSString *)v6;
}

- (void)setVehicleIdentifier:(id)a3
{
  if (a3)
  {
    sub_1A709D438();
    id v4 = *(Class *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC8MapsSync37MapsSyncMutableHistoryMultiPointRoute__proxyHistory);
    if (v5)
    {
      id v6 = self;
      id v7 = v4;
      id v10 = (id)sub_1A709D428();
      swift_bridgeObjectRelease();
      id v8 = v10;
      goto LABEL_6;
    }
  }
  else
  {
    id v4 = *(Class *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC8MapsSync37MapsSyncMutableHistoryMultiPointRoute__proxyHistory);
  }
  v9 = self;
  id v7 = v4;
  id v8 = 0;
LABEL_6:
  id v11 = v8;
  objc_msgSend(v7, sel_setVehicleIdentifier_);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8MapsSync37MapsSyncMutableHistoryMultiPointRoute__proxyHistory));
}

@end