@interface GDVUObservationUpdate
- (GDEntityIdentifier)entityIdentifier;
- (GDVUObservationUpdate)init;
- (int64_t)observationIdentifier;
- (int64_t)updateType;
@end

@implementation GDVUObservationUpdate

- (int64_t)updateType
{
  return GDVUObservationUpdate.updateType.getter();
}

- (int64_t)observationIdentifier
{
  v2 = self;
  int64_t v3 = GDVUObservationUpdate.observationIdentifier.getter();

  return v3;
}

- (GDEntityIdentifier)entityIdentifier
{
  v2 = self;
  id v3 = GDVUObservationUpdate.entityIdentifier.getter();

  return (GDEntityIdentifier *)v3;
}

- (GDVUObservationUpdate)init
{
}

@end