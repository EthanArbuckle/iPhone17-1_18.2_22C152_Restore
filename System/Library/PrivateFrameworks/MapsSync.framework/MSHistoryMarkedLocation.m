@interface MSHistoryMarkedLocation
+ (Class)managedClass;
- (GEOMapItemStorage)mapItemStorage;
- (MSHistoryMarkedLocation)initWithCustomName:(id)a3 floorOrdinal:(int)a4 latitude:(id)a5 longitude:(id)a6 mapItemStorage:(id)a7 muid:(id)a8;
- (MSHistoryMarkedLocation)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5;
- (MSHistoryMarkedLocation)initWithStore:(id)a3 customName:(id)a4 floorOrdinal:(int)a5 latitude:(id)a6 longitude:(id)a7 mapItemStorage:(id)a8 muid:(id)a9;
- (NSNumber)latitude;
- (NSNumber)longitude;
- (NSNumber)muid;
- (NSString)customName;
- (int)floorOrdinal;
- (void)setCustomName:(id)a3;
- (void)setFloorOrdinal:(int)a3;
- (void)setLatitude:(id)a3;
- (void)setLongitude:(id)a3;
- (void)setMapItemStorage:(id)a3;
- (void)setMuid:(id)a3;
- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4;
@end

@implementation MSHistoryMarkedLocation

- (MSHistoryMarkedLocation)initWithCustomName:(id)a3 floorOrdinal:(int)a4 latitude:(id)a5 longitude:(id)a6 mapItemStorage:(id)a7 muid:(id)a8
{
  uint64_t v12 = *(void *)&a4;
  if (a3)
  {
    sub_1A709D438();
    uint64_t v15 = v14;
  }
  else
  {
    uint64_t v15 = 0;
  }
  uint64_t v16 = qword_1EB6705E0;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  if (v16 != -1) {
    swift_once();
  }
  uint64_t v21 = qword_1EB670750;
  if (v15)
  {
    v22 = (void *)sub_1A709D428();
    swift_bridgeObjectRelease();
  }
  else
  {
    v22 = 0;
  }
  v23 = [(MSHistoryMarkedLocation *)self initWithStore:v21 customName:v22 floorOrdinal:v12 latitude:v17 longitude:v18 mapItemStorage:v19 muid:v20];

  return v23;
}

- (MSHistoryMarkedLocation)initWithStore:(id)a3 customName:(id)a4 floorOrdinal:(int)a5 latitude:(id)a6 longitude:(id)a7 mapItemStorage:(id)a8 muid:(id)a9
{
  if (a4)
  {
    uint64_t v23 = sub_1A709D438();
    uint64_t v15 = v14;
  }
  else
  {
    uint64_t v23 = 0;
    uint64_t v15 = 0;
  }
  id v16 = a3;
  id v25 = a6;
  id v24 = a7;
  id v17 = a8;
  id v18 = a9;
  id v19 = [(MapsSyncObject *)self initWithStore:v16];
  id v20 = *(Class *)((char *)&v19->super.super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  uint64_t v21 = v19;
  objc_msgSend(v20, sel_lock);
  sub_1A6EEBA24((uint64_t)v20, v23, v15, a5, a6, a7, a8, a9, (uint64_t)v21);
  objc_msgSend(v20, sel_unlock);

  swift_bridgeObjectRelease();
  return v21;
}

+ (Class)managedClass
{
  type metadata accessor for MapsSyncManagedHistoryMarkedLocation();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  sub_1A6EEC020(v6, a4);
}

- (NSString)customName
{
  v2 = self;
  sub_1A6EEC3AC();
  uint64_t v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1A709D428();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (void)setCustomName:(id)a3
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
  v7 = self;
  sub_1A6EEEF88(v4, v6);

  swift_bridgeObjectRelease();
}

- (int)floorOrdinal
{
  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  uint64_t v3 = self;
  objc_msgSend(v2, sel_lock);
  int v4 = *(_DWORD *)((char *)&v3->super.super.super.isa + OBJC_IVAR___MSHistoryMarkedLocation__floorOrdinal);
  objc_msgSend(v2, sel_unlock);

  return v4;
}

- (void)setFloorOrdinal:(int)a3
{
  int v4 = self;
  sub_1A6EECBE4(a3);
}

- (NSNumber)latitude
{
  v2 = self;
  uint64_t v3 = (void *)sub_1A6EECED8();

  return (NSNumber *)v3;
}

- (void)setLatitude:(id)a3
{
  id v6 = a3;
  uint64_t v5 = self;
  sub_1A6EEF1E8(a3);
}

- (NSNumber)longitude
{
  v2 = self;
  uint64_t v3 = (void *)sub_1A6EED330();

  return (NSNumber *)v3;
}

- (void)setLongitude:(id)a3
{
  id v6 = a3;
  uint64_t v5 = self;
  sub_1A6EEF3D4(a3);
}

- (GEOMapItemStorage)mapItemStorage
{
  v2 = self;
  uint64_t v3 = (void *)sub_1A6EED788();

  return (GEOMapItemStorage *)v3;
}

- (void)setMapItemStorage:(id)a3
{
  uint64_t v5 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  id v7 = a3;
  id v6 = self;
  objc_msgSend(v5, sel_lock);
  sub_1A6EEDE8C((uint64_t)v5, a3, (char *)v6);
  objc_msgSend(v5, sel_unlock);
}

- (NSNumber)muid
{
  v2 = self;
  uint64_t v3 = (void *)sub_1A6EEE5A8();

  return (NSNumber *)v3;
}

- (void)setMuid:(id)a3
{
  id v6 = a3;
  uint64_t v5 = self;
  sub_1A6EEF6B4(a3);
}

- (MSHistoryMarkedLocation)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  return (MSHistoryMarkedLocation *)sub_1A6EEEC78(a3, a4, v5);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  sub_1A6EEF5F4(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___MSHistoryMarkedLocation__mapItemStorage), *(void *)&self->super.super._store[OBJC_IVAR___MSHistoryMarkedLocation__mapItemStorage]);
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MSHistoryMarkedLocation__muid);
}

@end