@interface MapsSyncCollection
+ (id)fetchCollectionForIdentifier:(id)a3;
+ (void)deleteUniquelyOwnedCollectionItemsWithCollection:(id)a3 context:(id)a4 completion:(id)a5;
+ (void)fetchUniquelyOwnedCollectionItemsWithCollection:(id)a3 context:(id)a4 completion:(id)a5;
- (BOOL)attributesEqual:(id)a3;
- (BOOL)isEqual:(id)a3;
- (Class)managedObjectClass;
- (NSData)image;
- (NSSet)_placesUnstored;
- (NSSet)places;
- (NSString)collectionDescription;
- (NSString)description;
- (NSString)imageUrl;
- (NSString)title;
- (_TtC8MapsSync18MapsSyncCollection)initWithObject:(id)a3;
- (id)copyWithZone:(void *)a3;
- (int64_t)placesCount;
- (void)addEditWithBlock:(id)a3;
- (void)deleteWithCompletion:(id)a3;
- (void)executeOnFirstSave:(id)a3;
- (void)setPropertiesWithObject:(id)a3;
- (void)set_placesUnstored:(id)a3;
@end

@implementation MapsSyncCollection

+ (void)fetchUniquelyOwnedCollectionItemsWithCollection:(id)a3 context:(id)a4 completion:(id)a5
{
}

+ (void)deleteUniquelyOwnedCollectionItemsWithCollection:(id)a3 context:(id)a4 completion:(id)a5
{
}

+ (id)fetchCollectionForIdentifier:(id)a3
{
  uint64_t v3 = sub_1A709D258();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A709D238();
  _s8MapsSync0aB10CollectionC05fetchC13ForIdentifieryACSg10Foundation4UUIDVFZ_0();
  v8 = v7;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v8;
}

- (NSSet)_placesUnstored
{
  swift_beginAccess();
  type metadata accessor for MapsSyncCollectionItem();
  sub_1A6FFEE2C((unint64_t *)&qword_1EB66F538, (void (*)(uint64_t))type metadata accessor for MapsSyncCollectionItem);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A709D618();
  swift_bridgeObjectRelease();
  return (NSSet *)v2;
}

- (void)set_placesUnstored:(id)a3
{
  type metadata accessor for MapsSyncCollectionItem();
  sub_1A6FFEE2C((unint64_t *)&qword_1EB66F538, (void (*)(uint64_t))type metadata accessor for MapsSyncCollectionItem);
  uint64_t v4 = sub_1A709D648();
  uint64_t v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8MapsSync18MapsSyncCollection__placesUnstored);
  swift_beginAccess();
  *uint64_t v5 = v4;
  swift_bridgeObjectRelease();
}

- (id)copyWithZone:(void *)a3
{
  uint64_t v3 = self;
  sub_1A6FF94B8(v6);

  __swift_project_boxed_opaque_existential_0(v6, v6[3]);
  uint64_t v4 = (void *)sub_1A709DCB8();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
  return v4;
}

- (NSString)description
{
  v2 = self;
  sub_1A6FF97AC();

  uint64_t v3 = (void *)sub_1A709D428();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSString)collectionDescription
{
  return (NSString *)sub_1A6F389D8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync18MapsSyncCollection__collectionDescription);
}

- (NSData)image
{
  v2 = (uint64_t *)((char *)self + OBJC_IVAR____TtC8MapsSync18MapsSyncCollection__image);
  unint64_t v3 = *(void *)&self->super.super._managedObjectID[OBJC_IVAR____TtC8MapsSync18MapsSyncCollection__image];
  if (v3 >> 60 == 15)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v5 = *v2;
    sub_1A6EEF59C(*v2, v3);
    uint64_t v4 = (void *)sub_1A709D188();
    sub_1A6EEF5F4(v5, v3);
  }
  return (NSData *)v4;
}

- (NSString)imageUrl
{
  return (NSString *)sub_1A6F389D8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync18MapsSyncCollection__imageUrl);
}

- (NSString)title
{
  return (NSString *)sub_1A6F389D8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC8MapsSync18MapsSyncCollection__title);
}

- (NSSet)places
{
  return (NSSet *)sub_1A6FFD0A8(self, (uint64_t)a2, sub_1A6FF9B8C);
}

- (int64_t)placesCount
{
  return *(int *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync18MapsSyncCollection__placesCount);
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    uint64_t v4 = self;
    swift_unknownObjectRetain();
    sub_1A709D888();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    uint64_t v5 = self;
  }
  char v6 = sub_1A6FFA318((uint64_t)v8);

  sub_1A6F22460((uint64_t)v8, (uint64_t *)&unk_1EB671260);
  return v6 & 1;
}

- (BOOL)attributesEqual:(id)a3
{
  uint64_t v3 = (uint64_t)a3;
  id v5 = a3;
  char v6 = self;
  LOBYTE(v3) = sub_1A6FFA6F4(v3);

  return v3 & 1;
}

- (void)executeOnFirstSave:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1A6FFA974(v4);
}

- (void)setPropertiesWithObject:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1A6FFB4C0(v4);
}

- (Class)managedObjectClass
{
  type metadata accessor for MapsSyncManagedCollection();
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
  sub_1A7019234((uint64_t)sub_1A6FFDFAC, v6);

  swift_release();
  swift_release();
}

- (void)deleteWithCompletion:(id)a3
{
  id v4 = _Block_copy(a3);
  _Block_copy(v4);
  uint64_t v5 = self;
  sub_1A6FFE7BC(v5, (void (**)(void, void))v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (_TtC8MapsSync18MapsSyncCollection)initWithObject:(id)a3
{
  id v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC8MapsSync18MapsSyncCollection__collectionDescription);
  *id v4 = 0;
  v4[1] = 0;
  *(_OWORD *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync18MapsSyncCollection__image) = xmmword_1A70A4EA0;
  uint64_t v5 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync18MapsSyncCollection__imageUrl);
  *uint64_t v5 = 0;
  v5[1] = 0;
  uint64_t v6 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync18MapsSyncCollection__title);
  void *v6 = 0;
  v6[1] = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync18MapsSyncCollection__places) = 0;
  *(_DWORD *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync18MapsSyncCollection__placesCount) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync18MapsSyncCollection__placesUnstored) = (Class)MEMORY[0x1E4FBC870];
  id v7 = a3;
  return (_TtC8MapsSync18MapsSyncCollection *)sub_1A70198A0(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1A6EEF5F4(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync18MapsSyncCollection__image), *(void *)&self->super.super._managedObjectID[OBJC_IVAR____TtC8MapsSync18MapsSyncCollection__image]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end