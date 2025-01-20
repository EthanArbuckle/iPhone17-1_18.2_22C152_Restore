@interface NSSet(HMFMerging)
- (id)hmf_addedObjectsFromSet:()HMFMerging;
- (id)hmf_commonObjectsFromSet:()HMFMerging;
- (id)hmf_removedObjectsFromSet:()HMFMerging;
@end

@implementation NSSet(HMFMerging)

- (id)hmf_removedObjectsFromSet:()HMFMerging
{
  id v4 = a3;
  v5 = (void *)[a1 mutableCopy];
  [v5 minusSet:v4];

  v6 = (void *)[v5 copy];
  return v6;
}

- (id)hmf_addedObjectsFromSet:()HMFMerging
{
  id v4 = (void *)[a3 mutableCopy];
  [v4 minusSet:a1];
  v5 = (void *)[v4 copy];

  return v5;
}

- (id)hmf_commonObjectsFromSet:()HMFMerging
{
  id v4 = a3;
  v5 = (void *)[a1 mutableCopy];
  [v5 intersectSet:v4];

  v6 = (void *)[v5 copy];
  return v6;
}

@end