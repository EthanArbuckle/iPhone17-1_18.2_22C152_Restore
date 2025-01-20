@interface NSMutableArray
- (uint64_t)currentReferenceCount;
- (void)incrementReference;
@end

@implementation NSMutableArray

- (void)incrementReference
{
  if (a1)
  {
    v2 = [a1 firstObject];
    id v5 = v2;
    if (v2)
    {
      uint64_t v3 = [v2 unsignedIntegerValue];
      v4 = [NSNumber numberWithInteger:v3 + 1];
      [a1 replaceObjectAtIndex:0 withObject:v4];
    }
    else
    {
      [a1 addObject:&unk_1F17EB6B8];
    }
  }
}

- (uint64_t)currentReferenceCount
{
  if (!a1) {
    return 0;
  }
  v1 = [a1 firstObject];
  v2 = v1;
  if (v1) {
    uint64_t v3 = [v1 unsignedIntegerValue];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

@end