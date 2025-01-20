@interface MSHistoryMultiPointRoute
+ (Class)managedClass;
- (BOOL)navigationInterrupted;
- (GEOStorageRouteRequestStorage)routeRequestStorage;
- (MSHistoryMultiPointRoute)initWithNavigationInterrupted:(BOOL)a3 requiredCharge:(id)a4 routeProgressWaypointIndex:(signed __int16)a5 routeRequestStorage:(id)a6 sharedETAData:(id)a7 type:(signed __int16)a8 vehicleIdentifier:(id)a9;
- (MSHistoryMultiPointRoute)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5;
- (MSHistoryMultiPointRoute)initWithStore:(id)a3 navigationInterrupted:(BOOL)a4 requiredCharge:(id)a5 routeProgressWaypointIndex:(signed __int16)a6 routeRequestStorage:(id)a7 sharedETAData:(id)a8 type:(signed __int16)a9 vehicleIdentifier:(id)a10;
- (NSData)sharedETAData;
- (NSNumber)requiredCharge;
- (NSString)vehicleIdentifier;
- (signed)routeProgressWaypointIndex;
- (signed)type;
- (void)setNavigationInterrupted:(BOOL)a3;
- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4;
- (void)setRequiredCharge:(id)a3;
- (void)setRouteProgressWaypointIndex:(signed __int16)a3;
- (void)setRouteRequestStorage:(id)a3;
- (void)setSharedETAData:(id)a3;
- (void)setType:(signed __int16)a3;
- (void)setVehicleIdentifier:(id)a3;
@end

@implementation MSHistoryMultiPointRoute

- (MSHistoryMultiPointRoute)initWithNavigationInterrupted:(BOOL)a3 requiredCharge:(id)a4 routeProgressWaypointIndex:(signed __int16)a5 routeRequestStorage:(id)a6 sharedETAData:(id)a7 type:(signed __int16)a8 vehicleIdentifier:(id)a9
{
  v9 = a7;
  if (!a7)
  {
    id v23 = a4;
    id v24 = a6;
    id v25 = a9;
    unint64_t v19 = 0xF000000000000000;
    if (a9) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v20 = 0;
    uint64_t v22 = 0;
    return (MSHistoryMultiPointRoute *)HistoryMultiPointRoute.init(navigationInterrupted:requiredCharge:routeProgressWaypointIndex:routeRequestStorage:sharedETAData:type:vehicleIdentifier:)(a3, a4, a5, a6, (uint64_t)v9, v19, a8, v20, v22);
  }
  id v14 = a4;
  id v15 = a6;
  id v16 = a9;
  id v17 = v9;
  v9 = (void *)sub_1A709D198();
  unint64_t v19 = v18;

  if (!a9) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v20 = sub_1A709D438();
  uint64_t v22 = v21;

  return (MSHistoryMultiPointRoute *)HistoryMultiPointRoute.init(navigationInterrupted:requiredCharge:routeProgressWaypointIndex:routeRequestStorage:sharedETAData:type:vehicleIdentifier:)(a3, a4, a5, a6, (uint64_t)v9, v19, a8, v20, v22);
}

- (MSHistoryMultiPointRoute)initWithStore:(id)a3 navigationInterrupted:(BOOL)a4 requiredCharge:(id)a5 routeProgressWaypointIndex:(signed __int16)a6 routeRequestStorage:(id)a7 sharedETAData:(id)a8 type:(signed __int16)a9 vehicleIdentifier:(id)a10
{
  if (!a8)
  {
    id v27 = a3;
    id v28 = a5;
    id v29 = a7;
    id v30 = a10;
    uint64_t v21 = 0;
    unint64_t v23 = 0xF000000000000000;
    if (a10) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v24 = 0;
    uint64_t v26 = 0;
    goto LABEL_6;
  }
  id v16 = a3;
  id v17 = a5;
  id v18 = a7;
  id v19 = a10;
  id v20 = a8;
  uint64_t v21 = sub_1A709D198();
  unint64_t v23 = v22;

  if (!a10) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v24 = sub_1A709D438();
  uint64_t v26 = v25;

LABEL_6:
  v31 = [(MapsSyncObject *)self initWithStore:a3];
  v32 = *(Class *)((char *)&v31->super.super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  v33 = v31;
  objc_msgSend(v32, sel_lock);
  sub_1A6F7ADD8((uint64_t)v32, a4, a5, a6, a7, v21, v23, a9, v24, v26, (uint64_t)v33);
  objc_msgSend(v32, sel_unlock);

  sub_1A6EEF5F4(v21, v23);
  swift_bridgeObjectRelease();
  return v33;
}

+ (Class)managedClass
{
  type metadata accessor for MapsSyncManagedHistoryMultiPointRoute();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  sub_1A6F7B4A4(v6, a4);
}

- (BOOL)navigationInterrupted
{
  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  v3 = self;
  objc_msgSend(v2, sel_lock);
  char v4 = *((unsigned char *)&v3->super.super.super.isa + OBJC_IVAR___MSHistoryMultiPointRoute__navigationInterrupted);
  objc_msgSend(v2, sel_unlock);

  return v4;
}

- (void)setNavigationInterrupted:(BOOL)a3
{
  char v4 = self;
  sub_1A6F7B8D4(a3);
}

- (NSNumber)requiredCharge
{
  v2 = self;
  v3 = (void *)sub_1A6F7BBD8();

  return (NSNumber *)v3;
}

- (void)setRequiredCharge:(id)a3
{
  id v6 = a3;
  v5 = self;
  sub_1A6F7E4E0(a3);
}

- (signed)routeProgressWaypointIndex
{
  return sub_1A6F0D754((char *)self, (uint64_t)a2, &OBJC_IVAR___MSHistoryMultiPointRoute__routeProgressWaypointIndex);
}

- (void)setRouteProgressWaypointIndex:(signed __int16)a3
{
  char v4 = self;
  sub_1A6F7C21C(a3);
}

- (GEOStorageRouteRequestStorage)routeRequestStorage
{
  v2 = self;
  v3 = (void *)sub_1A6F7C4BC();

  return (GEOStorageRouteRequestStorage *)v3;
}

- (void)setRouteRequestStorage:(id)a3
{
  v5 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  id v7 = a3;
  id v6 = self;
  objc_msgSend(v5, sel_lock);
  sub_1A6F7CA9C((uint64_t)v5, a3, (uint64_t)v6);
  objc_msgSend(v5, sel_unlock);
}

- (NSData)sharedETAData
{
  v2 = self;
  uint64_t v3 = sub_1A6F7D0C4();
  unint64_t v5 = v4;

  if (v5 >> 60 == 15)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = (void *)sub_1A709D188();
    sub_1A6EEF5F4(v3, v5);
  }
  return (NSData *)v6;
}

- (void)setSharedETAData:(id)a3
{
  uint64_t v3 = a3;
  if (a3)
  {
    unint64_t v4 = self;
    id v5 = v3;
    uint64_t v3 = (void *)sub_1A709D198();
    unint64_t v7 = v6;
  }
  else
  {
    v8 = self;
    unint64_t v7 = 0xF000000000000000;
  }
  sub_1A6F7E788((uint64_t)v3, v7);
  sub_1A6EEF5F4((uint64_t)v3, v7);
}

- (signed)type
{
  return sub_1A6F0D754((char *)self, (uint64_t)a2, &OBJC_IVAR___MSHistoryMultiPointRoute__type);
}

- (void)setType:(signed __int16)a3
{
  unint64_t v4 = self;
  sub_1A6F7D85C(a3);
}

- (NSString)vehicleIdentifier
{
  v2 = self;
  sub_1A6F7DBA0();
  uint64_t v4 = v3;

  if (v4)
  {
    id v5 = (void *)sub_1A709D428();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v5 = 0;
  }
  return (NSString *)v5;
}

- (void)setVehicleIdentifier:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_1A709D438();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  unint64_t v7 = self;
  sub_1A6F7E9BC(v4, v6);

  swift_bridgeObjectRelease();
}

- (MSHistoryMultiPointRoute)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  return (MSHistoryMultiPointRoute *)sub_1A6F7E2BC(a3, a4, v5);
}

- (void).cxx_destruct
{
  sub_1A6EEF5F4(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___MSHistoryMultiPointRoute__routeRequestStorage), *(void *)&self->super.super._store[OBJC_IVAR___MSHistoryMultiPointRoute__routeRequestStorage]);
  sub_1A6EEF5F4(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___MSHistoryMultiPointRoute__sharedETAData), *(void *)&self->super.super._store[OBJC_IVAR___MSHistoryMultiPointRoute__sharedETAData]);
  swift_bridgeObjectRelease();
}

@end