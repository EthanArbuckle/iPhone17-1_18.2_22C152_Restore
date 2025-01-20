@interface GDVUClusterResult
- (BOOL)isKeyFace;
- (GDEntityIdentifier)entityIdentifier;
- (GDVUClusterResult)init;
- (int64_t)observationIdentifier;
@end

@implementation GDVUClusterResult

- (int64_t)observationIdentifier
{
  return GDVUClusterResult.observationIdentifier.getter();
}

- (GDEntityIdentifier)entityIdentifier
{
  id v2 = GDVUClusterResult.entityIdentifier.getter();

  return (GDEntityIdentifier *)v2;
}

- (BOOL)isKeyFace
{
  return GDVUClusterResult.isKeyFace.getter() & 1;
}

- (GDVUClusterResult)init
{
}

- (void).cxx_destruct
{
}

@end