@interface GDVUEntityUpdate
- (GDEntityIdentifier)entityIdentifier;
- (GDVUEntityUpdate)init;
- (NSUUID)tag;
- (int64_t)updateType;
@end

@implementation GDVUEntityUpdate

- (int64_t)updateType
{
  return GDVUEntityUpdate.updateType.getter();
}

- (GDEntityIdentifier)entityIdentifier
{
  v2 = self;
  id v3 = GDVUEntityUpdate.entityIdentifier.getter();

  return (GDEntityIdentifier *)v3;
}

- (NSUUID)tag
{
  return (NSUUID *)sub_1B2E2F04C(self, (uint64_t)a2, (void (*)(void))GDVUEntityUpdate.tag.getter);
}

- (GDVUEntityUpdate)init
{
}

- (void).cxx_destruct
{
}

@end