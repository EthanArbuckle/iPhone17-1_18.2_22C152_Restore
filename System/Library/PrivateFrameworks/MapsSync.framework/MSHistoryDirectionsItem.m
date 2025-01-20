@interface MSHistoryDirectionsItem
+ (Class)managedClass;
- (BOOL)navigationInterrupted;
- (GEOStorageRouteRequestStorage)routeRequestStorage;
- (MSHistoryDirectionsItem)initWithNavigationInterrupted:(BOOL)a3 routeRequestStorage:(id)a4 sharedETAData:(id)a5;
- (MSHistoryDirectionsItem)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5;
- (MSHistoryDirectionsItem)initWithStore:(id)a3 navigationInterrupted:(BOOL)a4 routeRequestStorage:(id)a5 sharedETAData:(id)a6;
- (NSData)sharedETAData;
- (void)setNavigationInterrupted:(BOOL)a3;
- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4;
- (void)setRouteRequestStorage:(id)a3;
- (void)setSharedETAData:(id)a3;
@end

@implementation MSHistoryDirectionsItem

- (MSHistoryDirectionsItem)initWithNavigationInterrupted:(BOOL)a3 routeRequestStorage:(id)a4 sharedETAData:(id)a5
{
  v5 = a5;
  BOOL v7 = a3;
  if (a5)
  {
    id v9 = a4;
    id v10 = v5;
    v5 = (void *)sub_1A709D198();
    unint64_t v12 = v11;
  }
  else
  {
    id v13 = a4;
    unint64_t v12 = 0xF000000000000000;
  }
  if (qword_1EB6705E0 != -1) {
    swift_once();
  }
  uint64_t v14 = qword_1EB670750;
  if (v12 >> 60 == 15)
  {
    v15 = 0;
  }
  else
  {
    sub_1A6EEF59C((uint64_t)v5, v12);
    v15 = (void *)sub_1A709D188();
    sub_1A6EEF5F4((uint64_t)v5, v12);
  }
  v16 = [(MSHistoryDirectionsItem *)self initWithStore:v14 navigationInterrupted:v7 routeRequestStorage:a4 sharedETAData:v15];
  sub_1A6EEF5F4((uint64_t)v5, v12);

  return v16;
}

- (MSHistoryDirectionsItem)initWithStore:(id)a3 navigationInterrupted:(BOOL)a4 routeRequestStorage:(id)a5 sharedETAData:(id)a6
{
  v6 = a6;
  if (a6)
  {
    id v11 = a3;
    id v12 = a5;
    id v13 = v6;
    v6 = (void *)sub_1A709D198();
    unint64_t v15 = v14;
  }
  else
  {
    id v16 = a3;
    id v17 = a5;
    unint64_t v15 = 0xF000000000000000;
  }
  v18 = [(MapsSyncObject *)self initWithStore:a3];
  v19 = *(Class *)((char *)&v18->super.super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  v20 = v18;
  objc_msgSend(v19, sel_lock);
  sub_1A6FF765C((int)v19, a4, a5, (uint64_t)v6, v15, (uint64_t)v20);
  objc_msgSend(v19, sel_unlock);

  sub_1A6EEF5F4((uint64_t)v6, v15);
  return v20;
}

+ (Class)managedClass
{
  type metadata accessor for MapsSyncManagedHistoryDirectionsItem();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4
{
  id v6 = a3;
  BOOL v7 = self;
  sub_1A6FF62D0(v6, a4);
}

- (BOOL)navigationInterrupted
{
  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  v3 = self;
  objc_msgSend(v2, sel_lock);
  char v4 = *((unsigned char *)&v3->super.super.super.isa + OBJC_IVAR___MSHistoryDirectionsItem__navigationInterrupted);
  objc_msgSend(v2, sel_unlock);

  return v4;
}

- (void)setNavigationInterrupted:(BOOL)a3
{
  char v4 = self;
  sub_1A6FF6508(a3);
}

- (GEOStorageRouteRequestStorage)routeRequestStorage
{
  v2 = self;
  v3 = (void *)sub_1A6FF6764();

  return (GEOStorageRouteRequestStorage *)v3;
}

- (void)setRouteRequestStorage:(id)a3
{
  v5 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  id v7 = a3;
  id v6 = self;
  objc_msgSend(v5, sel_lock);
  sub_1A6FF7EB8((uint64_t)v5, a3, (uint64_t)v6);
  objc_msgSend(v5, sel_unlock);
}

- (NSData)sharedETAData
{
  v2 = self;
  uint64_t v3 = sub_1A6FF6D38();
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
  sub_1A6FF894C((uint64_t)v3, v7);
  sub_1A6EEF5F4((uint64_t)v3, v7);
}

- (MSHistoryDirectionsItem)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5
{
  BOOL v5 = a5;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___MSHistoryDirectionsItem__navigationInterrupted) = 0;
  *(_OWORD *)((char *)&self->super.super.super.isa + OBJC_IVAR___MSHistoryDirectionsItem__routeRequestStorage) = xmmword_1A70A4EA0;
  *(_OWORD *)((char *)&self->super.super.super.isa + OBJC_IVAR___MSHistoryDirectionsItem__sharedETAData) = xmmword_1A70A4EA0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MSHistoryItem__position) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MSHistoryItem__positionIndex) = 0;
  id v8 = a3;
  return (MSHistoryDirectionsItem *)sub_1A6FBFBA0(a3, a4, v5);
}

- (void).cxx_destruct
{
  sub_1A6EEF5F4(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___MSHistoryDirectionsItem__routeRequestStorage), *(void *)&self->super.super._store[OBJC_IVAR___MSHistoryDirectionsItem__routeRequestStorage]);
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___MSHistoryDirectionsItem__sharedETAData);
  unint64_t v4 = *(void *)&self->super.super._store[OBJC_IVAR___MSHistoryDirectionsItem__sharedETAData];
  sub_1A6EEF5F4(v3, v4);
}

@end