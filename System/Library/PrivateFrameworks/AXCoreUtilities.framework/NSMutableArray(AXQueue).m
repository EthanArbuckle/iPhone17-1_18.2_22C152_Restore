@interface NSMutableArray(AXQueue)
- (id)ax_dequeueObject;
- (uint64_t)ax_enqueueObject:()AXQueue;
- (uint64_t)ax_lastEnqueuedObject;
@end

@implementation NSMutableArray(AXQueue)

- (uint64_t)ax_enqueueObject:()AXQueue
{
  return [a1 insertObject:a3 atIndex:0];
}

- (id)ax_dequeueObject
{
  v2 = [a1 lastObject];
  [a1 removeLastObject];
  return v2;
}

- (uint64_t)ax_lastEnqueuedObject
{
  return [a1 objectAtIndex:0];
}

@end