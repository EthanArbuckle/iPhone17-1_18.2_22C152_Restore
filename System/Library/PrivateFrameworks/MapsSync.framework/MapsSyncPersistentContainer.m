@interface MapsSyncPersistentContainer
+ (id)defaultDirectoryURL;
- (_TtC8MapsSync27MapsSyncPersistentContainer)initWithName:(id)a3 managedObjectModel:(id)a4;
@end

@implementation MapsSyncPersistentContainer

+ (id)defaultDirectoryURL
{
  uint64_t v2 = sub_1A709D178();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x1F4188790](v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getObjCClassMetadata();
  sub_1A6F28B48((uint64_t)v5);
  v6 = (void *)sub_1A709D118();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v6;
}

- (_TtC8MapsSync27MapsSyncPersistentContainer)initWithName:(id)a3 managedObjectModel:(id)a4
{
  sub_1A709D438();
  id v6 = a4;
  v7 = (void *)sub_1A709D428();
  swift_bridgeObjectRelease();
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for MapsSyncPersistentContainer();
  uint64_t v8 = [(NSPersistentContainer *)&v10 initWithName:v7 managedObjectModel:v6];

  return v8;
}

@end