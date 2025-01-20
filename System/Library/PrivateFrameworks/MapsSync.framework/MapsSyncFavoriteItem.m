@interface MapsSyncFavoriteItem
+ (id)fetchFavoriteItemForIdentifier:(id)a3;
+ (id)fetchFavoriteItemForOriginatingAddressString:(id)a3;
+ (id)fetchFavoriteItemForShortcutIdentifier:(id)a3;
+ (void)fetch:(int64_t)a3 :(int64_t)a4 :(id)a5 sort:(int64_t)a6 ascending:(BOOL)a7 completion:(id)a8;
+ (void)fetchNearbyPlacesWithLatitude:(double)a3 longitude:(double)a4 callbackQueue:(id)a5 completion:(id)a6;
- (BOOL)hidden;
- (BOOL)isEqual:(id)a3;
- (Class)managedObjectClass;
- (GEOMapItemStorage)mapItemStorage;
- (NSNumber)latitude;
- (NSNumber)longitude;
- (NSNumber)muid;
- (NSSet)contactHandles;
- (NSString)customName;
- (NSString)description;
- (NSString)originatingAddressString;
- (NSString)shortcutIdentifier;
- (_TtC8MapsSync20MapsSyncFavoriteItem)initWithObject:(id)a3;
- (signed)source;
- (signed)type;
- (signed)version;
- (void)addEditWithBlock:(id)a3;
- (void)setPropertiesWithObject:(id)a3;
@end

@implementation MapsSyncFavoriteItem

- (_TtC8MapsSync20MapsSyncFavoriteItem)initWithObject:(id)a3
{
  id v4 = a3;
  return (_TtC8MapsSync20MapsSyncFavoriteItem *)sub_1A70619D0(a3);
}

- (NSString)description
{
  v2 = self;
  sub_1A7061B7C();

  v3 = (void *)sub_1A709D428();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSSet)contactHandles
{
  if (*(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__contactHandles))
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1A709D618();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSSet *)v2;
}

- (NSString)customName
{
  return (NSString *)sub_1A6F389D8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__customName);
}

- (BOOL)hidden
{
  return *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__hidden);
}

- (GEOMapItemStorage)mapItemStorage
{
  unint64_t v2 = *(void *)&self->super.super._managedObjectID[OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__mapItemStorage];
  if (v2 >> 60 == 15)
  {
    id v3 = 0;
  }
  else
  {
    uint64_t v5 = *(uint64_t *)((char *)&self->super.super.super.isa
                    + OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__mapItemStorage);
    id v6 = objc_allocWithZone(MEMORY[0x1E4F646E0]);
    v7 = self;
    sub_1A6EEF588(v5, v2);
    v8 = (void *)sub_1A709D188();
    sub_1A6EEF5F4(v5, v2);
    id v3 = objc_msgSend(v6, sel_initWithData_, v8);
  }
  return (GEOMapItemStorage *)v3;
}

- (NSString)originatingAddressString
{
  return (NSString *)sub_1A6F389D8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__originatingAddressString);
}

- (signed)type
{
  return *(_WORD *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__type);
}

- (signed)source
{
  return *(_WORD *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__source);
}

- (NSString)shortcutIdentifier
{
  return (NSString *)sub_1A6F389D8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__shortcutIdentifier);
}

- (signed)version
{
  return *(_WORD *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__version);
}

- (NSNumber)latitude
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                             + OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__latitude));
}

- (NSNumber)longitude
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                             + OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__longitude));
}

- (NSNumber)muid
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                             + OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__muid));
}

+ (void)fetchNearbyPlacesWithLatitude:(double)a3 longitude:(double)a4 callbackQueue:(id)a5 completion:(id)a6
{
  v9 = _Block_copy(a6);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  id v11 = a5;
  _s8MapsSync0aB12FavoriteItemC17fetchNearbyPlaces8latitude9longitude13callbackQueue10completionySd_SdSo17OS_dispatch_queueCySayACGctFZ_0(v11, (uint64_t)sub_1A6FE7674, v10, a3, a4);

  swift_release();
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
  char v6 = sub_1A70624EC((uint64_t)v8);

  sub_1A6F00364((uint64_t)v8);
  return v6 & 1;
}

- (void)setPropertiesWithObject:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1A706294C(v4);
}

- (Class)managedObjectClass
{
  type metadata accessor for MapsSyncManagedFavoriteItem();
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
  sub_1A7019234((uint64_t)sub_1A7067300, v6);

  swift_release();
  swift_release();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1A6EEF5F4(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__mapItemStorage), *(void *)&self->super.super._managedObjectID[OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__mapItemStorage]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync20MapsSyncFavoriteItem__muid);
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
  sub_1A707448C((void *)a3, a4, (uint64_t)v14, a6, a7, v13);
  _Block_release(v13);
  sub_1A6F00364((uint64_t)v14);
}

+ (id)fetchFavoriteItemForIdentifier:(id)a3
{
  uint64_t v3 = sub_1A709D258();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A709D238();
  _s8MapsSync0aB12FavoriteItemC05fetchcD13ForIdentifieryACSg10Foundation4UUIDVFZ_0();
  v8 = v7;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v8;
}

+ (id)fetchFavoriteItemForShortcutIdentifier:(id)a3
{
  id v3 = a3;
  sub_1A7074BF4(v3, (void (*)(void))sub_1A6F69DF0);
  uint64_t v5 = v4;

  return v5;
}

+ (id)fetchFavoriteItemForOriginatingAddressString:(id)a3
{
  id v3 = a3;
  sub_1A7074BF4(v3, (void (*)(void))sub_1A6F6A288);
  uint64_t v5 = v4;

  return v5;
}

@end