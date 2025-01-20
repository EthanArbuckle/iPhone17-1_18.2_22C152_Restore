@interface MSHistoryItem
+ (Class)managedClass;
+ (id)optionsWith:(id)a3;
+ (void)beforeFetchWithStore:(id)a3;
+ (void)pruneHistoryItemsWithStore:(id)a3;
- (MSHistoryItem)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5;
- (MSHistoryItem)initWithPosition:(double)a3 positionIndex:(int64_t)a4;
- (MSHistoryItem)initWithStore:(id)a3 position:(double)a4 positionIndex:(int64_t)a5;
- (double)position;
- (int64_t)positionIndex;
- (void)setPosition:(double)a3;
- (void)setPositionIndex:(int64_t)a3;
- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4;
@end

@implementation MSHistoryItem

- (MSHistoryItem)initWithPosition:(double)a3 positionIndex:(int64_t)a4
{
  if (qword_1EB6705E0 != -1) {
    swift_once();
  }
  uint64_t v7 = qword_1EB670750;
  return [(MSHistoryItem *)self initWithStore:v7 position:a4 positionIndex:a3];
}

- (MSHistoryItem)initWithStore:(id)a3 position:(double)a4 positionIndex:(int64_t)a5
{
  return (MSHistoryItem *)HistoryItem.init(store:position:positionIndex:)(a3, a5, a4);
}

+ (Class)managedClass
{
  type metadata accessor for MapsSyncManagedHistoryItem();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4
{
  id v5 = a3;
  v11 = self;
  sub_1A6FC1F80(v5);
  type metadata accessor for MapsSyncManagedHistoryItem();
  uint64_t v6 = swift_dynamicCastClass();
  if (v6)
  {
    uint64_t v7 = (void *)v6;
    id v8 = v5;
    objc_msgSend(v7, sel_position);
    *(Class *)((char *)&v11->super.super.isa + OBJC_IVAR___MSHistoryItem__position) = v9;
    v10 = (objc_class *)objc_msgSend(v7, sel_positionIndex);

    *(Class *)((char *)&v11->super.super.isa + OBJC_IVAR___MSHistoryItem__positionIndex) = v10;
  }
}

- (double)position
{
  v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  v3 = self;
  objc_msgSend(v2, sel_lock);
  double v4 = *(double *)((char *)&v3->super.super.isa + OBJC_IVAR___MSHistoryItem__position);
  objc_msgSend(v2, sel_unlock);

  return v4;
}

- (void)setPosition:(double)a3
{
  double v4 = self;
  sub_1A707AF54(a3);
}

- (int64_t)positionIndex
{
  v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  v3 = self;
  objc_msgSend(v2, sel_lock);
  int64_t v4 = *(int64_t *)((char *)&v3->super.super.isa + OBJC_IVAR___MSHistoryItem__positionIndex);
  objc_msgSend(v2, sel_unlock);

  return v4;
}

- (void)setPositionIndex:(int64_t)a3
{
  int64_t v4 = self;
  sub_1A707B208(a3);
}

- (MSHistoryItem)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5
{
  BOOL v5 = a5;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___MSHistoryItem__position) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___MSHistoryItem__positionIndex) = 0;
  id v8 = a3;
  return (MSHistoryItem *)sub_1A6FBFBA0(a3, a4, v5);
}

+ (void)beforeFetchWithStore:(id)a3
{
  id v3 = a3;
  sub_1A708277C();
}

+ (id)optionsWith:(id)a3
{
  swift_getObjCClassMetadata();
  id v4 = a3;
  id v5 = sub_1A7081DD0(a3);

  return v5;
}

+ (void)pruneHistoryItemsWithStore:(id)a3
{
  id v3 = a3;
  sub_1A708277C();
}

@end