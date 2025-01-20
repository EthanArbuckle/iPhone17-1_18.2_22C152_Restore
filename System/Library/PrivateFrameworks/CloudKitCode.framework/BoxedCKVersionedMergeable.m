@interface BoxedCKVersionedMergeable
- (id)stateVector;
- (unint64_t)deltaDeliveryRequirements;
@end

@implementation BoxedCKVersionedMergeable

- (id)stateVector
{
  v2 = self;
  v3 = (void *)sub_20CB6F590();

  return v3;
}

- (unint64_t)deltaDeliveryRequirements
{
  v2 = self;
  unint64_t v3 = sub_20CB6F674();

  return v3;
}

@end