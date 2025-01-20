@interface MSCollectionItem
+ (Class)managedClass;
- (MSCollectionItem)initWithCollection:(id)a3;
- (MSCollectionItem)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5;
- (MSCollectionItem)initWithPositionIndex:(int64_t)a3;
- (MSCollectionItem)initWithStore:(id)a3 positionIndex:(int64_t)a4;
- (id)fetchCollections;
- (int64_t)positionIndex;
- (void)addCollection:(id)a3;
- (void)flushChanges;
- (void)removeCollection:(id)a3;
- (void)setPositionIndex:(int64_t)a3;
- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4;
@end

@implementation MSCollectionItem

- (MSCollectionItem)initWithPositionIndex:(int64_t)a3
{
  if (qword_1EB6705E0 != -1) {
    swift_once();
  }
  uint64_t v5 = qword_1EB670750;
  return [(MSCollectionItem *)self initWithStore:v5 positionIndex:a3];
}

- (MSCollectionItem)initWithStore:(id)a3 positionIndex:(int64_t)a4
{
  return (MSCollectionItem *)CollectionItem.init(store:positionIndex:)(a3, a4);
}

- (void)flushChanges
{
  v3 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__editBlocks);
  swift_beginAccess();
  uint64_t v4 = MEMORY[0x1E4FBC860];
  void *v3 = MEMORY[0x1E4FBC860];
  uint64_t v5 = self;
  swift_bridgeObjectRelease();
  v6 = (Class *)((char *)&v5->super.super.isa + OBJC_IVAR___MSCollectionItem__collectionChanges);
  swift_beginAccess();
  void *v6 = v4;

  swift_bridgeObjectRelease();
}

+ (Class)managedClass
{
  type metadata accessor for MapsSyncManagedCollectionItem();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4
{
  id v5 = a3;
  v8 = self;
  sub_1A6FC1F80(v5);
  type metadata accessor for MapsSyncManagedCollectionItem();
  v6 = (void *)swift_dynamicCastClass();
  if (v6)
  {
    v7 = (objc_class *)objc_msgSend(v6, sel_positionIndex);
    *(Class *)((char *)&v8->super.super.isa + OBJC_IVAR___MSCollectionItem__positionIndex) = v7;
  }
}

- (int64_t)positionIndex
{
  v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  v3 = self;
  objc_msgSend(v2, sel_lock);
  int64_t v4 = *(int64_t *)((char *)&v3->super.super.isa + OBJC_IVAR___MSCollectionItem__positionIndex);
  objc_msgSend(v2, sel_unlock);

  return v4;
}

- (void)setPositionIndex:(int64_t)a3
{
  int64_t v4 = self;
  sub_1A6EE4228(a3);
}

- (id)fetchCollections
{
  v2 = self;
  sub_1A6EE4584();

  type metadata accessor for Collection();
  v3 = (void *)sub_1A709D4C8();
  swift_bridgeObjectRelease();
  return v3;
}

- (void)addCollection:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1A6EE4ED0(v4, 0, (uint64_t)sub_1A6EE4D88, 0);
}

- (void)removeCollection:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1A6EE4ED0(v4, 1, (uint64_t)sub_1A6EE4E3C, 0);
}

- (MSCollectionItem)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5
{
  BOOL v5 = a5;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___MSCollectionItem__positionIndex) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___MSCollectionItem__collectionChanges) = (Class)MEMORY[0x1E4FBC860];
  id v8 = a3;
  return (MSCollectionItem *)sub_1A6FBFBA0(a3, a4, v5);
}

- (void).cxx_destruct
{
}

- (MSCollectionItem)initWithCollection:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(MapsSyncObject *)self init];
  sub_1A6EE4ED0(v4, 0, (uint64_t)sub_1A6EE4D88, 0);

  return v5;
}

@end