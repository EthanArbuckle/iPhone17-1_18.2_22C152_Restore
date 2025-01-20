@interface MapsSyncMutableHistoryEvDirectionsItem
- (NSString)vehicleIdentifier;
- (_TtC8MapsSync38MapsSyncMutableHistoryEvDirectionsItem)initWithProxyObject:(id)a3;
- (double)requiredCharge;
- (void)setRequiredCharge:(double)a3;
- (void)setVehicleIdentifier:(id)a3;
@end

@implementation MapsSyncMutableHistoryEvDirectionsItem

- (_TtC8MapsSync38MapsSyncMutableHistoryEvDirectionsItem)initWithProxyObject:(id)a3
{
  type metadata accessor for MapsSyncManagedHistoryEvDirectionsItem();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8MapsSync38MapsSyncMutableHistoryEvDirectionsItem__proxyHistory) = (Class)swift_dynamicCastClassUnconditional();
  type metadata accessor for MapsSyncManagedHistoryDirectionsItem();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8MapsSync36MapsSyncMutableHistoryDirectionsItem__proxyHistory) = (Class)swift_dynamicCastClassUnconditional();
  type metadata accessor for MapsSyncManagedHistoryItem();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8MapsSync26MapsSyncMutableHistoryItem__proxyHistory) = (Class)swift_dynamicCastClassUnconditional();
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8MapsSync23MapsSyncMutableBaseItem__proxyObject) = (Class)a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MapsSyncMutableBaseItem();
  id v5 = a3;
  return [(MapsSyncMutableBaseItem *)&v7 init];
}

- (double)requiredCharge
{
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC8MapsSync38MapsSyncMutableHistoryEvDirectionsItem__proxyHistory), sel_requiredCharge);
  return result;
}

- (void)setRequiredCharge:(double)a3
{
}

- (NSString)vehicleIdentifier
{
  v2 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8MapsSync38MapsSyncMutableHistoryEvDirectionsItem__proxyHistory);
  v3 = self;
  id v4 = objc_msgSend(v2, sel_vehicleIdentifier);
  if (v4)
  {
    id v5 = v4;
    sub_1A709D438();

    v6 = (void *)sub_1A709D428();
    swift_bridgeObjectRelease();
  }
  else
  {

    v6 = 0;
  }
  return (NSString *)v6;
}

- (void)setVehicleIdentifier:(id)a3
{
  if (a3)
  {
    sub_1A709D438();
    id v4 = *(Class *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC8MapsSync38MapsSyncMutableHistoryEvDirectionsItem__proxyHistory);
    if (v5)
    {
      v6 = self;
      id v7 = v4;
      id v10 = (id)sub_1A709D428();
      swift_bridgeObjectRelease();
      id v8 = v10;
      goto LABEL_6;
    }
  }
  else
  {
    id v4 = *(Class *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC8MapsSync38MapsSyncMutableHistoryEvDirectionsItem__proxyHistory);
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
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8MapsSync38MapsSyncMutableHistoryEvDirectionsItem__proxyHistory));
}

@end