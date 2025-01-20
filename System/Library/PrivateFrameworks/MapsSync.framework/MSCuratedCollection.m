@interface MSCuratedCollection
+ (Class)managedClass;
- (MSCuratedCollection)initWithCuratedCollectionIdentifier:(unint64_t)a3 positionIndex:(int64_t)a4 resultProviderIdentifier:(int)a5;
- (MSCuratedCollection)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5;
- (MSCuratedCollection)initWithStore:(id)a3 curatedCollectionIdentifier:(unint64_t)a4 positionIndex:(int64_t)a5 resultProviderIdentifier:(int)a6;
- (int)resultProviderIdentifier;
- (int64_t)positionIndex;
- (unint64_t)curatedCollectionIdentifier;
- (void)setCuratedCollectionIdentifier:(unint64_t)a3;
- (void)setPositionIndex:(int64_t)a3;
- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4;
- (void)setResultProviderIdentifier:(int)a3;
@end

@implementation MSCuratedCollection

- (MSCuratedCollection)initWithCuratedCollectionIdentifier:(unint64_t)a3 positionIndex:(int64_t)a4 resultProviderIdentifier:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  if (qword_1EB6705E0 != -1) {
    swift_once();
  }
  uint64_t v9 = qword_1EB670750;
  return [(MSCuratedCollection *)self initWithStore:v9 curatedCollectionIdentifier:a3 positionIndex:a4 resultProviderIdentifier:v5];
}

- (MSCuratedCollection)initWithStore:(id)a3 curatedCollectionIdentifier:(unint64_t)a4 positionIndex:(int64_t)a5 resultProviderIdentifier:(int)a6
{
  return (MSCuratedCollection *)CuratedCollection.init(store:curatedCollectionIdentifier:positionIndex:resultProviderIdentifier:)(a3, a4, a5, a6);
}

+ (Class)managedClass
{
  type metadata accessor for MapsSyncManagedCuratedCollection();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4
{
  id v5 = a3;
  v6 = self;
  sub_1A706C074(v5);
}

- (unint64_t)curatedCollectionIdentifier
{
  v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  v3 = self;
  objc_msgSend(v2, sel_lock);
  unint64_t v4 = *(unint64_t *)((char *)&v3->super.super.isa + OBJC_IVAR___MSCuratedCollection__curatedCollectionIdentifier);
  objc_msgSend(v2, sel_unlock);

  return v4;
}

- (void)setCuratedCollectionIdentifier:(unint64_t)a3
{
  unint64_t v4 = self;
  sub_1A706B030(a3);
}

- (int64_t)positionIndex
{
  v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  v3 = self;
  objc_msgSend(v2, sel_lock);
  int64_t v4 = *(int64_t *)((char *)&v3->super.super.isa + OBJC_IVAR___MSCuratedCollection__positionIndex);
  objc_msgSend(v2, sel_unlock);

  return v4;
}

- (void)setPositionIndex:(int64_t)a3
{
  int64_t v4 = self;
  sub_1A706B390(a3);
}

- (int)resultProviderIdentifier
{
  v2 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  v3 = self;
  objc_msgSend(v2, sel_lock);
  int v4 = *(_DWORD *)((char *)&v3->super.super.isa + OBJC_IVAR___MSCuratedCollection__resultProviderIdentifier);
  objc_msgSend(v2, sel_unlock);

  return v4;
}

- (void)setResultProviderIdentifier:(int)a3
{
  int v4 = self;
  sub_1A706B760(a3);
}

- (MSCuratedCollection)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5
{
  BOOL v5 = a5;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___MSCuratedCollection__curatedCollectionIdentifier) = 0;
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___MSCuratedCollection__positionIndex) = 0;
  *(_DWORD *)((char *)&self->super.super.isa + OBJC_IVAR___MSCuratedCollection__resultProviderIdentifier) = 0;
  id v8 = a3;
  return (MSCuratedCollection *)sub_1A6FBFBA0(a3, a4, v5);
}

@end