@interface NSMutableArray(BWGraphAdditions_Stack)
- (BOOL)bw_empty;
- (uint64_t)bw_pop;
@end

@implementation NSMutableArray(BWGraphAdditions_Stack)

- (uint64_t)bw_pop
{
  if (objc_msgSend(a1, "bw_empty")) {
    return 0;
  }
  uint64_t v3 = [a1 lastObject];
  [a1 removeLastObject];
  return v3;
}

- (BOOL)bw_empty
{
  return [a1 count] == 0;
}

@end