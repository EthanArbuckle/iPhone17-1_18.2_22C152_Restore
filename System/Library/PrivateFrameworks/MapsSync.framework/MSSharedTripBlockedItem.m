@interface MSSharedTripBlockedItem
+ (Class)managedClass;
- (MSSharedTripBlockedItem)initWithExpiryTime:(int64_t)a3 sharedTripIdentifier:(id)a4;
- (MSSharedTripBlockedItem)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5;
- (MSSharedTripBlockedItem)initWithStore:(id)a3 expiryTime:(int64_t)a4 sharedTripIdentifier:(id)a5;
- (NSString)sharedTripIdentifier;
- (int64_t)expiryTime;
- (void)setExpiryTime:(int64_t)a3;
- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4;
- (void)setSharedTripIdentifier:(id)a3;
@end

@implementation MSSharedTripBlockedItem

- (MSSharedTripBlockedItem)initWithExpiryTime:(int64_t)a3 sharedTripIdentifier:(id)a4
{
  if (a4)
  {
    sub_1A709D438();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v7 = 0;
  }
  if (qword_1EB6705E0 != -1) {
    swift_once();
  }
  uint64_t v8 = qword_1EB670750;
  if (v7)
  {
    v9 = (void *)sub_1A709D428();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  v10 = [(MSSharedTripBlockedItem *)self initWithStore:v8 expiryTime:a3 sharedTripIdentifier:v9];

  return v10;
}

- (MSSharedTripBlockedItem)initWithStore:(id)a3 expiryTime:(int64_t)a4 sharedTripIdentifier:(id)a5
{
  if (a5)
  {
    uint64_t v7 = sub_1A709D438();
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v9 = 0;
  }
  v10 = sub_1A6F16FC0(a3, a4, v7, v9);
  swift_bridgeObjectRelease();
  return (MSSharedTripBlockedItem *)v10;
}

+ (Class)managedClass
{
  type metadata accessor for MapsSyncManagedSharedTripBlockedItem();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  sub_1A6F16210(v6, a4);
}

- (int64_t)expiryTime
{
  v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  v3 = self;
  objc_msgSend(v2, sel_lock);
  int64_t v4 = *(int64_t *)((char *)&v3->super.super.isa + OBJC_IVAR___MSSharedTripBlockedItem__expiryTime);
  objc_msgSend(v2, sel_unlock);

  return v4;
}

- (void)setExpiryTime:(int64_t)a3
{
  int64_t v4 = self;
  sub_1A6F16490(a3);
}

- (NSString)sharedTripIdentifier
{
  v2 = self;
  sub_1A6F167B4();
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

- (void)setSharedTripIdentifier:(id)a3
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
  uint64_t v7 = self;
  sub_1A6F1728C(v4, v6);

  swift_bridgeObjectRelease();
}

- (MSSharedTripBlockedItem)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5
{
  BOOL v5 = a5;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___MSSharedTripBlockedItem__expiryTime) = 0;
  uint64_t v8 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR___MSSharedTripBlockedItem__sharedTripIdentifier);
  *uint64_t v8 = 0;
  v8[1] = 0;
  id v9 = a3;
  return (MSSharedTripBlockedItem *)sub_1A6FBFBA0(a3, a4, v5);
}

- (void).cxx_destruct
{
}

@end