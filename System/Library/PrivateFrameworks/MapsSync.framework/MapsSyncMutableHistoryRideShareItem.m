@interface MapsSyncMutableHistoryRideShareItem
- (GEOComposedWaypoint)endWaypoint;
- (GEOComposedWaypoint)startWaypoint;
- (_TtC8MapsSync35MapsSyncMutableHistoryRideShareItem)initWithProxyObject:(id)a3;
- (void)setEndWaypoint:(id)a3;
- (void)setStartWaypoint:(id)a3;
@end

@implementation MapsSyncMutableHistoryRideShareItem

- (_TtC8MapsSync35MapsSyncMutableHistoryRideShareItem)initWithProxyObject:(id)a3
{
  type metadata accessor for MapsSyncManagedHistoryRideShareItem();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8MapsSync35MapsSyncMutableHistoryRideShareItem__proxyHistory) = (Class)swift_dynamicCastClassUnconditional();
  type metadata accessor for MapsSyncManagedHistoryItem();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync26MapsSyncMutableHistoryItem__proxyHistory) = (Class)swift_dynamicCastClassUnconditional();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync23MapsSyncMutableBaseItem__proxyObject) = (Class)a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MapsSyncMutableBaseItem();
  id v5 = a3;
  return [(MapsSyncMutableBaseItem *)&v7 init];
}

- (GEOComposedWaypoint)startWaypoint
{
  return (GEOComposedWaypoint *)sub_1A7076428((char *)self, (uint64_t)a2, (SEL *)&selRef_startWaypoint);
}

- (void)setStartWaypoint:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1A707633C(a3);
}

- (GEOComposedWaypoint)endWaypoint
{
  return (GEOComposedWaypoint *)sub_1A7076428((char *)self, (uint64_t)a2, (SEL *)&selRef_endWaypoint);
}

- (void)setEndWaypoint:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_1A70765F8(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8MapsSync35MapsSyncMutableHistoryRideShareItem__proxyHistory));
}

@end