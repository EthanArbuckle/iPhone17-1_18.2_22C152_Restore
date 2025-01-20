@interface MapsSyncHistoryCuratedCollection
- (BOOL)isEqual:(id)a3;
- (Class)managedObjectClass;
- (_TtC8MapsSync32MapsSyncHistoryCuratedCollection)initWithCuratedCollectionIdentifier:(unint64_t)a3;
- (_TtC8MapsSync32MapsSyncHistoryCuratedCollection)initWithCuratedCollectionIdentifier:(unint64_t)a3 resultProviderIdentifier:(int)a4;
- (_TtC8MapsSync32MapsSyncHistoryCuratedCollection)initWithObject:(id)a3;
- (int)resultProviderIdentifier;
- (int64_t)identifierHash;
- (unint64_t)curatedCollectionIdentifier;
- (void)addEditWithBlock:(id)a3;
- (void)deleteWithCompletion:(id)a3;
- (void)setPropertiesWithObject:(id)a3;
@end

@implementation MapsSyncHistoryCuratedCollection

- (_TtC8MapsSync32MapsSyncHistoryCuratedCollection)initWithCuratedCollectionIdentifier:(unint64_t)a3 resultProviderIdentifier:(int)a4
{
  return (_TtC8MapsSync32MapsSyncHistoryCuratedCollection *)MapsSyncHistoryCuratedCollection.init(curatedCollectionIdentifier:resultProviderIdentifier:)(a3, a4);
}

- (_TtC8MapsSync32MapsSyncHistoryCuratedCollection)initWithCuratedCollectionIdentifier:(unint64_t)a3
{
  return [(MapsSyncHistoryCuratedCollection *)self initWithCuratedCollectionIdentifier:a3 resultProviderIdentifier:0];
}

- (_TtC8MapsSync32MapsSyncHistoryCuratedCollection)initWithObject:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8MapsSync32MapsSyncHistoryCuratedCollection__curatedCollectionIdentifier) = 0;
  *(_DWORD *)((char *)&self->super.super.super.super.isa
            + OBJC_IVAR____TtC8MapsSync32MapsSyncHistoryCuratedCollection__resultProviderIdentifier) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8MapsSync19MapsSyncHistoryItem__position) = 0;
  id v4 = a3;
  return (_TtC8MapsSync32MapsSyncHistoryCuratedCollection *)sub_1A70198A0(a3);
}

- (int64_t)identifierHash
{
  return sub_1A709DDF8();
}

- (unint64_t)curatedCollectionIdentifier
{
  return *(unint64_t *)((char *)&self->super.super.super.super.isa
                             + OBJC_IVAR____TtC8MapsSync32MapsSyncHistoryCuratedCollection__curatedCollectionIdentifier);
}

- (int)resultProviderIdentifier
{
  return *(_DWORD *)((char *)&self->super.super.super.super.isa
                   + OBJC_IVAR____TtC8MapsSync32MapsSyncHistoryCuratedCollection__resultProviderIdentifier);
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_1A709D888();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = sub_1A6FB1CD4((uint64_t)v8);

  sub_1A6F00364((uint64_t)v8);
  return v6 & 1;
}

- (void)setPropertiesWithObject:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1A6FB1F74(v4);
}

- (Class)managedObjectClass
{
  type metadata accessor for MapsSyncManagedHistoryCuratedCollection();
  return (Class)swift_getObjCClassFromMetadata();
}

- (void)addEditWithBlock:(id)a3
{
  id v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = sub_1A6F022EC;
  *(void *)(v6 + 24) = v5;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = sub_1A6FB21C4;
  *(void *)(v7 + 24) = v6;
  v8 = self;
  swift_retain();
  swift_retain();
  sub_1A7019234((uint64_t)sub_1A6F4EAD8, v7);

  swift_release();
  swift_release();
  swift_release();
}

- (void)deleteWithCompletion:(id)a3
{
  id v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = (void *)swift_allocObject();
  v6[2] = self;
  v6[3] = sub_1A6F339E0;
  v6[4] = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB670680);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_1A70A4E90;
  *(void *)(v7 + 32) = self;
  uint64_t v12 = v7;
  sub_1A709D4F8();
  uint64_t v8 = qword_1E96E69D0;
  v9 = self;
  swift_retain();
  if (v8 != -1) {
    swift_once();
  }
  v10 = (void *)qword_1E96EB360;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = sub_1A6FB308C;
  *(void *)(v11 + 24) = v6;
  swift_retain();
  _s8MapsSync0aB23CachedCuratedCollectionC016fetchWithHistoryD11Collections_13callbackQueue10completionySayAA0abhdE0CG_So17OS_dispatch_queueCySayACG_AiA0aB5ErrorCSgtctFZ_0(v12, v10, (uint64_t)sub_1A6FB3088, v11);

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
}

@end