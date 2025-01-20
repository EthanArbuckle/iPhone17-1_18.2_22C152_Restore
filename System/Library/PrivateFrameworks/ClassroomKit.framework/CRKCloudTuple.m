@interface CRKCloudTuple
- (CRKCloudTuple)initWithChangedObject:(id)a3 originalObject:(id)a4;
- (id)changedObject;
- (id)originalObject;
@end

@implementation CRKCloudTuple

- (CRKCloudTuple)initWithChangedObject:(id)a3 originalObject:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)CRKCloudTuple;
  return [(CRKCloudTuple *)&v5 init];
}

- (id)originalObject
{
  return 0;
}

- (id)changedObject
{
  return 0;
}

@end