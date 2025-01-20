@interface GDVUEntityClass
+ (id)animal;
+ (id)entity;
+ (id)person;
- (BOOL)isEqual:(id)a3;
- (GDVUEntityClass)init;
- (NSString)id;
- (NSString)name;
- (int64_t)hash;
- (unsigned)intValue;
@end

@implementation GDVUEntityClass

- (NSString)id
{
  return (NSString *)sub_1B2E2C780((uint64_t)self, (uint64_t)a2, (void (*)(void))GDVUEntityClass.id.getter);
}

- (NSString)name
{
  return (NSString *)sub_1B2E2C780((uint64_t)self, (uint64_t)a2, (void (*)(void))GDVUEntityClass.name.getter);
}

- (unsigned)intValue
{
  return GDVUEntityClass.intValue.getter();
}

- (BOOL)isEqual:(id)a3
{
  return sub_1B2E2E598(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))GDVUEntityClass.isEqual(_:));
}

- (int64_t)hash
{
  v2 = self;
  id v3 = GDVUEntityClass.hash.getter();

  return (int64_t)v3;
}

+ (id)person
{
  id v2 = static GDVUEntityClass.person()();

  return v2;
}

+ (id)animal
{
  id v2 = static GDVUEntityClass.animal()();

  return v2;
}

+ (id)entity
{
  id v2 = static GDVUEntityClass.entity()();

  return v2;
}

- (GDVUEntityClass)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end