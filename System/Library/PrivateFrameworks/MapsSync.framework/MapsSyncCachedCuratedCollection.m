@interface MapsSyncCachedCuratedCollection
+ (void)fetch:(int64_t)a3 :(int64_t)a4 :(id)a5 sort:(int64_t)a6 ascending:(BOOL)a7 completion:(id)a8;
+ (void)fetchWithCuratedCollection:(id)a3 completion:(id)a4;
+ (void)fetchWithCuratedCollections:(id)a3 callbackQueue:(id)a4 completion:(id)a5;
+ (void)fetchWithHistoryCuratedCollection:(id)a3 completion:(id)a4;
+ (void)fetchWithHistoryCuratedCollections:(id)a3 callbackQueue:(id)a4 completion:(id)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTombstone;
- (Class)managedObjectClass;
- (NSData)image;
- (NSDate)lastFetchedDate;
- (NSDate)lastSignificantChangeDate;
- (NSString)collectionDescription;
- (NSString)description;
- (NSString)imageUrl;
- (NSString)publisherAttribution;
- (NSString)title;
- (NSString)titleLocale;
- (_TtC8MapsSync19MapsSyncDataSession)session;
- (_TtC8MapsSync31MapsSyncCachedCuratedCollection)initWithCuratedCollectionIdentifier:(unint64_t)a3;
- (_TtC8MapsSync31MapsSyncCachedCuratedCollection)initWithCuratedCollectionIdentifier:(unint64_t)a3 resultProviderIdentifier:(int)a4;
- (_TtC8MapsSync31MapsSyncCachedCuratedCollection)initWithObject:(id)a3;
- (int)placesCount;
- (int)resultProviderIdentifier;
- (int64_t)identifierHash;
- (unint64_t)curatedCollectionIdentifier;
- (void)addEditWithBlock:(id)a3;
- (void)setPropertiesWithObject:(id)a3;
@end

@implementation MapsSyncCachedCuratedCollection

- (_TtC8MapsSync31MapsSyncCachedCuratedCollection)initWithCuratedCollectionIdentifier:(unint64_t)a3 resultProviderIdentifier:(int)a4
{
  return (_TtC8MapsSync31MapsSyncCachedCuratedCollection *)MapsSyncCachedCuratedCollection.init(curatedCollectionIdentifier:resultProviderIdentifier:)(a3, a4);
}

- (_TtC8MapsSync31MapsSyncCachedCuratedCollection)initWithCuratedCollectionIdentifier:(unint64_t)a3
{
  return [(MapsSyncCachedCuratedCollection *)self initWithCuratedCollectionIdentifier:a3 resultProviderIdentifier:0];
}

- (_TtC8MapsSync31MapsSyncCachedCuratedCollection)initWithObject:(id)a3
{
  id v4 = a3;
  return (_TtC8MapsSync31MapsSyncCachedCuratedCollection *)sub_1A6F3DACC(a3);
}

- (int64_t)identifierHash
{
  return sub_1A709DDF8();
}

- (NSString)collectionDescription
{
  return (NSString *)sub_1A6F389D8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync31MapsSyncCachedCuratedCollection__collectionDescription);
}

- (NSData)image
{
  v2 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8MapsSync31MapsSyncCachedCuratedCollection__image);
  unint64_t v3 = *(void *)&self->super.super._managedObjectID[OBJC_IVAR____TtC8MapsSync31MapsSyncCachedCuratedCollection__image];
  if (v3 >> 60 == 15)
  {
    id v4 = 0;
  }
  else
  {
    uint64_t v5 = *v2;
    sub_1A6EEF59C(*v2, v3);
    id v4 = (void *)sub_1A709D188();
    sub_1A6EEF5F4(v5, v3);
  }
  return (NSData *)v4;
}

- (NSString)imageUrl
{
  return (NSString *)sub_1A6F389D8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync31MapsSyncCachedCuratedCollection__imageUrl);
}

- (NSString)title
{
  return (NSString *)sub_1A6F389D8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync31MapsSyncCachedCuratedCollection__title);
}

- (unint64_t)curatedCollectionIdentifier
{
  return *(unint64_t *)((char *)&self->super.super.super.isa
                             + OBJC_IVAR____TtC8MapsSync31MapsSyncCachedCuratedCollection__curatedCollectionIdentifier);
}

- (BOOL)isTombstone
{
  return *((unsigned char *)&self->super.super.super.isa
         + OBJC_IVAR____TtC8MapsSync31MapsSyncCachedCuratedCollection__isTombstone);
}

- (NSDate)lastFetchedDate
{
  return (NSDate *)sub_1A6F3DE3C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync31MapsSyncCachedCuratedCollection__lastFetchedDate);
}

- (NSDate)lastSignificantChangeDate
{
  return (NSDate *)sub_1A6F3DE3C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync31MapsSyncCachedCuratedCollection__lastSignificantChangeDate);
}

- (int)placesCount
{
  return *(_DWORD *)((char *)&self->super.super.super.isa
                   + OBJC_IVAR____TtC8MapsSync31MapsSyncCachedCuratedCollection__placesCount);
}

- (NSString)publisherAttribution
{
  return (NSString *)sub_1A6F389D8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync31MapsSyncCachedCuratedCollection__publisherAttribution);
}

- (NSString)titleLocale
{
  return (NSString *)sub_1A6F389D8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync31MapsSyncCachedCuratedCollection__titleLocale);
}

- (int)resultProviderIdentifier
{
  return *(_DWORD *)((char *)&self->super.super.super.isa
                   + OBJC_IVAR____TtC8MapsSync31MapsSyncCachedCuratedCollection__resultProviderIdentifier);
}

- (_TtC8MapsSync19MapsSyncDataSession)session
{
  if (byte_1E96E7990 == 1)
  {
    uint64_t v3 = qword_1E96E6F20;
    id v4 = self;
    if (v3 != -1) {
      swift_once();
    }
    uint64_t v5 = &qword_1E96E7988;
  }
  else
  {
    uint64_t v6 = qword_1EB670280;
    v7 = self;
    if (v6 != -1) {
      swift_once();
    }
    uint64_t v5 = &qword_1EB670248;
  }
  v8 = (_TtC8MapsSync19MapsSyncDataSession *)(id)*v5;

  return v8;
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
    uint64_t v5 = self;
  }
  char v6 = sub_1A6F3E114((uint64_t)v8);

  sub_1A6F22460((uint64_t)v8, (uint64_t *)&unk_1EB671260);
  return v6 & 1;
}

- (void)setPropertiesWithObject:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1A6F3EB4C(v4);
}

- (Class)managedObjectClass
{
  type metadata accessor for MapsSyncManagedCachedCuratedCollection();
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
  sub_1A7019234((uint64_t)sub_1A6F3F168, v6);

  swift_release();
  swift_release();
}

- (NSString)description
{
  v2 = self;
  sub_1A6F3F29C();

  uint64_t v3 = (void *)sub_1A709D428();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1A6EEF5F4(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync31MapsSyncCachedCuratedCollection__image), *(void *)&self->super.super._managedObjectID[OBJC_IVAR____TtC8MapsSync31MapsSyncCachedCuratedCollection__image]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1A6F22460((uint64_t)self + OBJC_IVAR____TtC8MapsSync31MapsSyncCachedCuratedCollection__lastFetchedDate, &qword_1EB670330);
  sub_1A6F22460((uint64_t)self + OBJC_IVAR____TtC8MapsSync31MapsSyncCachedCuratedCollection__lastSignificantChangeDate, &qword_1EB670330);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

+ (void)fetch:(int64_t)a3 :(int64_t)a4 :(id)a5 sort:(int64_t)a6 ascending:(BOOL)a7 completion:(id)a8
{
  v13 = _Block_copy(a8);
  if (a5)
  {
    swift_unknownObjectRetain();
    sub_1A709D888();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v14, 0, sizeof(v14));
  }
  sub_1A70389B4(a3, a4, (uint64_t)v14, a6, a7, v13);
  _Block_release(v13);
  sub_1A6F00364((uint64_t)v14);
}

+ (void)fetchWithCuratedCollections:(id)a3 callbackQueue:(id)a4 completion:(id)a5
{
}

+ (void)fetchWithHistoryCuratedCollections:(id)a3 callbackQueue:(id)a4 completion:(id)a5
{
}

+ (void)fetchWithCuratedCollection:(id)a3 completion:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB670680);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_1A70A4E90;
  *(void *)(v7 + 32) = a3;
  uint64_t v12 = v7;
  sub_1A709D4F8();
  uint64_t v8 = qword_1E96E69D0;
  id v9 = a3;
  if (v8 != -1) {
    swift_once();
  }
  v10 = (void *)qword_1E96EB360;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = sub_1A7038F4C;
  *(void *)(v11 + 24) = v6;
  swift_retain();
  _s8MapsSync0aB23CachedCuratedCollectionC09fetchWithD11Collections_13callbackQueue10completionySayAA0abdE0CG_So17OS_dispatch_queueCySayACG_AItctFZ_0(v12, v10, (uint64_t)sub_1A7038F50, v11);

  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
}

+ (void)fetchWithHistoryCuratedCollection:(id)a3 completion:(id)a4
{
  uint64_t v5 = _Block_copy(a4);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EB670680);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_1A70A4E90;
  *(void *)(v7 + 32) = a3;
  uint64_t v12 = v7;
  sub_1A709D4F8();
  uint64_t v8 = qword_1E96E69D0;
  id v9 = a3;
  if (v8 != -1) {
    swift_once();
  }
  v10 = (void *)qword_1E96EB360;
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = sub_1A7038558;
  *(void *)(v11 + 24) = v6;
  swift_retain();
  _s8MapsSync0aB23CachedCuratedCollectionC016fetchWithHistoryD11Collections_13callbackQueue10completionySayAA0abhdE0CG_So17OS_dispatch_queueCySayACG_AiA0aB5ErrorCSgtctFZ_0(v12, v10, (uint64_t)sub_1A70381CC, v11);

  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
}

@end