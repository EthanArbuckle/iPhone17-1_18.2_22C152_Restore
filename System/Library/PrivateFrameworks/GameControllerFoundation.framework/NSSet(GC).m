@interface NSSet(GC)
- (id)gc_setByRemovingObject:()GC;
- (id)gc_setByRemovingObjectsFromSet:()GC;
@end

@implementation NSSet(GC)

- (id)gc_setByRemovingObject:()GC
{
  v4 = (void *)[a1 mutableCopy];
  [v4 removeObject:a3];
  v5 = (void *)[v4 copy];

  return v5;
}

- (id)gc_setByRemovingObjectsFromSet:()GC
{
  v4 = (void *)[a1 mutableCopy];
  [v4 minusSet:a3];
  v5 = (void *)[v4 copy];

  return v5;
}

@end