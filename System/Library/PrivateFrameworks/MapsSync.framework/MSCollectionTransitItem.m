@interface MSCollectionTransitItem
+ (Class)managedClass;
- (MSCollectionTransitItem)initWithMuid:(unint64_t)a3 transitLineStorage:(id)a4;
- (MSCollectionTransitItem)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5;
- (MSCollectionTransitItem)initWithStore:(id)a3 muid:(unint64_t)a4 transitLineStorage:(id)a5;
- (NSData)transitLineStorage;
- (unint64_t)muid;
- (void)setMuid:(unint64_t)a3;
- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4;
- (void)setTransitLineStorage:(id)a3;
@end

@implementation MSCollectionTransitItem

- (MSCollectionTransitItem)initWithMuid:(unint64_t)a3 transitLineStorage:(id)a4
{
  uint64_t v4 = (uint64_t)a4;
  if (a4)
  {
    id v7 = a4;
    uint64_t v4 = sub_1A709D198();
    unint64_t v9 = v8;
  }
  else
  {
    unint64_t v9 = 0xF000000000000000;
  }
  if (qword_1EB6705E0 != -1) {
    swift_once();
  }
  uint64_t v10 = qword_1EB670750;
  if (v9 >> 60 == 15)
  {
    v11 = 0;
  }
  else
  {
    sub_1A6EEF59C(v4, v9);
    v11 = (void *)sub_1A709D188();
    sub_1A6EEF5F4(v4, v9);
  }
  v12 = [(MSCollectionTransitItem *)self initWithStore:v10 muid:a3 transitLineStorage:v11];
  sub_1A6EEF5F4(v4, v9);

  return v12;
}

- (MSCollectionTransitItem)initWithStore:(id)a3 muid:(unint64_t)a4 transitLineStorage:(id)a5
{
  v5 = a5;
  if (a5)
  {
    id v8 = a3;
    id v9 = v5;
    v5 = (void *)sub_1A709D198();
    unint64_t v11 = v10;
  }
  else
  {
    id v12 = a3;
    unint64_t v11 = 0xF000000000000000;
  }
  return (MSCollectionTransitItem *)CollectionTransitItem.init(store:muid:transitLineStorage:)(a3, a4, (uint64_t)v5, v11);
}

+ (Class)managedClass
{
  type metadata accessor for MapsSyncManagedCollectionTransitItem();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4
{
  id v6 = a3;
  id v7 = self;
  sub_1A6F933A4(v6, a4);
}

- (unint64_t)muid
{
  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  v3 = self;
  objc_msgSend(v2, sel_lock);
  unint64_t v4 = *(unint64_t *)((char *)&v3->super.super.super.isa + OBJC_IVAR___MSCollectionTransitItem__muid);
  objc_msgSend(v2, sel_unlock);

  return v4;
}

- (void)setMuid:(unint64_t)a3
{
  unint64_t v4 = self;
  sub_1A6F93654(a3);
}

- (NSData)transitLineStorage
{
  v2 = self;
  uint64_t v3 = sub_1A6F93984();
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

- (void)setTransitLineStorage:(id)a3
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
    id v8 = self;
    unint64_t v7 = 0xF000000000000000;
  }
  sub_1A6F942E0((uint64_t)v3, v7);
  sub_1A6EEF5F4((uint64_t)v3, v7);
}

- (MSCollectionTransitItem)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5
{
  BOOL v5 = a5;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MSCollectionTransitItem__muid) = 0;
  *(_OWORD *)((char *)&self->super.super.super.isa + OBJC_IVAR___MSCollectionTransitItem__transitLineStorage) = xmmword_1A70A4EA0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MSCollectionItem__positionIndex) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MSCollectionItem__collectionChanges) = (Class)MEMORY[0x1E4FBC860];
  id v8 = a3;
  return (MSCollectionTransitItem *)sub_1A6FBFBA0(a3, a4, v5);
}

- (void).cxx_destruct
{
}

@end