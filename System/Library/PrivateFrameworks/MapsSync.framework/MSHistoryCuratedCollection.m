@interface MSHistoryCuratedCollection
+ (Class)managedClass;
- (MSHistoryCuratedCollection)initWithCuratedCollectionIdentifier:(unint64_t)a3 resultProviderIdentifier:(int)a4;
- (MSHistoryCuratedCollection)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5;
- (MSHistoryCuratedCollection)initWithStore:(id)a3 curatedCollectionIdentifier:(unint64_t)a4 resultProviderIdentifier:(int)a5;
- (int)resultProviderIdentifier;
- (unint64_t)curatedCollectionIdentifier;
- (void)setCuratedCollectionIdentifier:(unint64_t)a3;
- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4;
- (void)setResultProviderIdentifier:(int)a3;
@end

@implementation MSHistoryCuratedCollection

- (MSHistoryCuratedCollection)initWithCuratedCollectionIdentifier:(unint64_t)a3 resultProviderIdentifier:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  if (qword_1EB6705E0 != -1) {
    swift_once();
  }
  uint64_t v7 = qword_1EB670750;
  return [(MSHistoryCuratedCollection *)self initWithStore:v7 curatedCollectionIdentifier:a3 resultProviderIdentifier:v4];
}

- (MSHistoryCuratedCollection)initWithStore:(id)a3 curatedCollectionIdentifier:(unint64_t)a4 resultProviderIdentifier:(int)a5
{
  return (MSHistoryCuratedCollection *)HistoryCuratedCollection.init(store:curatedCollectionIdentifier:resultProviderIdentifier:)(a3, a4, a5);
}

+ (Class)managedClass
{
  type metadata accessor for MapsSyncManagedHistoryCuratedCollection();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)setPropertiesUnsafeWithManagedObject:(id)a3 lazyLoad:(BOOL)a4
{
  id v5 = a3;
  v6 = self;
  sub_1A6F5D3CC(v5);
}

- (unint64_t)curatedCollectionIdentifier
{
  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  v3 = self;
  objc_msgSend(v2, sel_lock);
  unint64_t v4 = *(unint64_t *)((char *)&v3->super.super.super.isa
                           + OBJC_IVAR___MSHistoryCuratedCollection__curatedCollectionIdentifier);
  objc_msgSend(v2, sel_unlock);

  return v4;
}

- (void)setCuratedCollectionIdentifier:(unint64_t)a3
{
  unint64_t v4 = self;
  sub_1A6F5C858(a3);
}

- (int)resultProviderIdentifier
{
  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync14MapsSyncObject__propertyLock);
  v3 = self;
  objc_msgSend(v2, sel_lock);
  int v4 = *(_DWORD *)((char *)&v3->super.super.super.isa + OBJC_IVAR___MSHistoryCuratedCollection__resultProviderIdentifier);
  objc_msgSend(v2, sel_unlock);

  return v4;
}

- (void)setResultProviderIdentifier:(int)a3
{
  int v4 = self;
  sub_1A6F5CC1C(a3);
}

- (MSHistoryCuratedCollection)initWithObject:(id)a3 store:(id)a4 lazyLoad:(BOOL)a5
{
  BOOL v5 = a5;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MSHistoryCuratedCollection__curatedCollectionIdentifier) = 0;
  *(_DWORD *)((char *)&self->super.super.super.isa + OBJC_IVAR___MSHistoryCuratedCollection__resultProviderIdentifier) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MSHistoryItem__position) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___MSHistoryItem__positionIndex) = 0;
  id v8 = a3;
  return (MSHistoryCuratedCollection *)sub_1A6FBFBA0(a3, a4, v5);
}

@end