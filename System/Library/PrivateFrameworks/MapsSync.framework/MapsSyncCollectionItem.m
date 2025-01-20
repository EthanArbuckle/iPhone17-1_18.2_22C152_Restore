@interface MapsSyncCollectionItem
+ (id)fetchCollectionItemForIdentifier:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)requiresCollection;
- (Class)managedObjectClass;
- (NSSet)collections;
- (_TtC8MapsSync22MapsSyncCollectionItem)initWithCollection:(id)a3;
- (_TtC8MapsSync22MapsSyncCollectionItem)initWithObject:(id)a3;
- (id)copyWithZone:(void *)a3;
- (void)addEditWithBlock:(id)a3;
- (void)executeOnFirstSave:(id)a3;
- (void)setPropertiesWithObject:(id)a3;
@end

@implementation MapsSyncCollectionItem

+ (id)fetchCollectionItemForIdentifier:(id)a3
{
  uint64_t v3 = sub_1A709D258();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A709D238();
  _s8MapsSync0aB14CollectionItemC05fetchcD13ForIdentifieryACSg10Foundation4UUIDVFZ_0();
  v8 = v7;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v8;
}

- (_TtC8MapsSync22MapsSyncCollectionItem)initWithCollection:(id)a3
{
  return (_TtC8MapsSync22MapsSyncCollectionItem *)MapsSyncCollectionItem.init(collection:)(a3);
}

- (id)copyWithZone:(void *)a3
{
  uint64_t v3 = self;
  sub_1A6FC34D4(v6);

  __swift_project_boxed_opaque_existential_0(v6, v6[3]);
  uint64_t v4 = (void *)sub_1A709DCB8();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
  return v4;
}

- (void)executeOnFirstSave:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1A6FC37E4(v4);
}

- (_TtC8MapsSync22MapsSyncCollectionItem)initWithObject:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8MapsSync22MapsSyncCollectionItem__collections) = 0;
  id v4 = a3;
  return (_TtC8MapsSync22MapsSyncCollectionItem *)sub_1A70198A0(a3);
}

- (BOOL)requiresCollection
{
  return 1;
}

- (NSSet)collections
{
  v2 = self;
  uint64_t v3 = sub_1A6FC4208((uint64_t)v2, (uint64_t)sub_1A6FC61E0, 0);
  uint64_t v4 = OBJC_IVAR____TtC8MapsSync22MapsSyncCollectionItem__collections;
  *(Class *)((char *)&v2->super.super.super.isa + OBJC_IVAR____TtC8MapsSync22MapsSyncCollectionItem__collections) = (Class)v3;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(uint64_t *)((char *)&v2->super.super.super.isa + v4);
  swift_bridgeObjectRetain();

  if (v5)
  {
    type metadata accessor for MapsSyncCollection();
    sub_1A6FC93CC(&qword_1E96E80F0, (void (*)(uint64_t))type metadata accessor for MapsSyncCollection);
    v6 = (void *)sub_1A709D618();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  return (NSSet *)v6;
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
  char v6 = sub_1A6FC777C((uint64_t)v8);

  sub_1A6F00364((uint64_t)v8);
  return v6 & 1;
}

- (void)setPropertiesWithObject:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1A6FC3564(v4);
}

- (Class)managedObjectClass
{
  type metadata accessor for MapsSyncManagedCollectionItem();
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
  sub_1A7019234((uint64_t)sub_1A6FC85E8, v6);

  swift_release();
  swift_release();
}

- (void).cxx_destruct
{
}

@end