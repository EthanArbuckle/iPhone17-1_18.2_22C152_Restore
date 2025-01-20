@interface NSSet(ACTrackingSet)
+ (id)setWithTrackedSet:()ACTrackingSet;
- (uint64_t)initWithTrackedSet:()ACTrackingSet;
@end

@implementation NSSet(ACTrackingSet)

+ (id)setWithTrackedSet:()ACTrackingSet
{
  id v5 = a3;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"ACTrackedSet.m", 263, @"Invalid parameter not satisfying: %@", @"trackedSet" object file lineNumber description];
  }
  v6 = (void *)[[a1 alloc] initWithTrackedSet:v5];

  return v6;
}

- (uint64_t)initWithTrackedSet:()ACTrackingSet
{
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, a1, @"ACTrackedSet.m", 269, @"Invalid parameter not satisfying: %@", @"trackedSet" object file lineNumber description];
  }
  v6 = (void *)[v5[1] copy];
  uint64_t v7 = [a1 initWithSet:v6];

  return v7;
}

@end