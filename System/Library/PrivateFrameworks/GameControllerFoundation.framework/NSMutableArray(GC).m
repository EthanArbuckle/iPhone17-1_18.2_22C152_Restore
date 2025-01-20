@interface NSMutableArray(GC)
- (uint64_t)gc_transformElementsUsingBlock:()GC;
- (void)gc_transformElementsWithOptions:()GC usingBlock:;
@end

@implementation NSMutableArray(GC)

- (void)gc_transformElementsWithOptions:()GC usingBlock:
{
  uint64_t v7 = [a1 count];
  uint64_t v8 = 0;
  if (v7)
  {
    uint64_t v9 = 0;
    uint64_t v10 = a3 & 1;
    do
    {
      v11 = (*(void (**)(uint64_t, id))(a4 + 16))(a4, (id)[a1 objectAtIndexedSubscript:v9]);
      if (v11) {
        BOOL v12 = 1;
      }
      else {
        BOOL v12 = v10 == 0;
      }
      if (v12) {
        [a1 replaceObjectAtIndex:v8++ withObject:v11];
      }

      ++v9;
    }
    while (v7 != v9);
  }
  if (v7 != v8)
  {
    objc_msgSend(a1, "removeObjectsInRange:", v8, v7 - v8);
  }
}

- (uint64_t)gc_transformElementsUsingBlock:()GC
{
  return objc_msgSend(a1, "gc_transformElementsWithOptions:usingBlock:", 0, a3);
}

@end