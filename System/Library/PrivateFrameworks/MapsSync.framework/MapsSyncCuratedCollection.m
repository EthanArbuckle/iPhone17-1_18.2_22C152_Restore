@interface MapsSyncCuratedCollection
- (BOOL)isEqual:(id)a3;
- (Class)managedObjectClass;
- (NSString)description;
- (_TtC8MapsSync25MapsSyncCuratedCollection)initWithCuratedCollectionIdentifier:(unint64_t)a3;
- (_TtC8MapsSync25MapsSyncCuratedCollection)initWithCuratedCollectionIdentifier:(unint64_t)a3 resultProviderIdentifier:(int)a4;
- (_TtC8MapsSync25MapsSyncCuratedCollection)initWithObject:(id)a3;
- (int)resultProviderIdentifier;
- (int64_t)identifierHash;
- (unint64_t)curatedCollectionIdentifier;
- (void)addEditWithBlock:(id)a3;
- (void)deleteWithCompletion:(id)a3;
- (void)setPropertiesWithObject:(id)a3;
@end

@implementation MapsSyncCuratedCollection

- (_TtC8MapsSync25MapsSyncCuratedCollection)initWithCuratedCollectionIdentifier:(unint64_t)a3 resultProviderIdentifier:(int)a4
{
  return (_TtC8MapsSync25MapsSyncCuratedCollection *)MapsSyncCuratedCollection.init(curatedCollectionIdentifier:resultProviderIdentifier:)(a3, a4);
}

- (_TtC8MapsSync25MapsSyncCuratedCollection)initWithCuratedCollectionIdentifier:(unint64_t)a3
{
  return [(MapsSyncCuratedCollection *)self initWithCuratedCollectionIdentifier:a3 resultProviderIdentifier:0];
}

- (_TtC8MapsSync25MapsSyncCuratedCollection)initWithObject:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8MapsSync25MapsSyncCuratedCollection__curatedCollectionIdentifier) = 0;
  *(_DWORD *)((char *)&self->super.super.super.isa
            + OBJC_IVAR____TtC8MapsSync25MapsSyncCuratedCollection__resultProviderIdentifier) = 0;
  id v4 = a3;
  return (_TtC8MapsSync25MapsSyncCuratedCollection *)sub_1A70198A0(a3);
}

- (int64_t)identifierHash
{
  return sub_1A709DDF8();
}

- (unint64_t)curatedCollectionIdentifier
{
  return *(unint64_t *)((char *)&self->super.super.super.isa
                             + OBJC_IVAR____TtC8MapsSync25MapsSyncCuratedCollection__curatedCollectionIdentifier);
}

- (int)resultProviderIdentifier
{
  return *(_DWORD *)((char *)&self->super.super.super.isa
                   + OBJC_IVAR____TtC8MapsSync25MapsSyncCuratedCollection__resultProviderIdentifier);
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
  char v6 = sub_1A6F9D02C((uint64_t)v8);

  sub_1A6F00364((uint64_t)v8);
  return v6 & 1;
}

- (void)setPropertiesWithObject:(id)a3
{
  id v4 = a3;
  v8 = self;
  sub_1A7018C34(v4);
  type metadata accessor for MapsSyncManagedCuratedCollection();
  if (swift_dynamicCastClass())
  {
    v5 = (void *)swift_dynamicCastClassUnconditional();
    id v6 = v4;
    v7 = (objc_class *)objc_msgSend(v5, sel_curatedCollectionIdentifier);
    *(Class *)((char *)&v8->super.super.super.isa
             + OBJC_IVAR____TtC8MapsSync25MapsSyncCuratedCollection__curatedCollectionIdentifier) = v7;
    LODWORD(v5) = objc_msgSend(v5, sel_resultProviderIdentifier);

    *(_DWORD *)((char *)&v8->super.super.super.isa
              + OBJC_IVAR____TtC8MapsSync25MapsSyncCuratedCollection__resultProviderIdentifier) = v5;
  }
}

- (Class)managedObjectClass
{
  type metadata accessor for MapsSyncManagedCuratedCollection();
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
  v7 = self;
  swift_retain();
  sub_1A7019234((uint64_t)sub_1A6F9D524, v6);

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
  *(void *)(v11 + 16) = sub_1A6F9E528;
  *(void *)(v11 + 24) = v6;
  swift_retain();
  _s8MapsSync0aB23CachedCuratedCollectionC09fetchWithD11Collections_13callbackQueue10completionySayAA0abdE0CG_So17OS_dispatch_queueCySayACG_AItctFZ_0(v12, v10, (uint64_t)sub_1A6F9E524, v11);

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
}

- (NSString)description
{
  v2 = self;
  sub_1A6F9DBD4();

  v3 = (void *)sub_1A709D428();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

@end