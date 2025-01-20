@interface NSSet(DAExtensions)
- (id)DACompactDescription;
@end

@implementation NSSet(DAExtensions)

- (id)DACompactDescription
{
  v2 = [MEMORY[0x1E4F28E78] stringWithString:@"["];
  v3 = [a1 objectEnumerator];
  uint64_t v4 = [v3 nextObject];
  if (v4)
  {
    v5 = (void *)v4;
    char v6 = 1;
    do
    {
      if ((v6 & 1) == 0) {
        [v2 appendString:@", "];
      }
      v7 = [v5 description];
      [v2 appendString:v7];

      uint64_t v8 = [v3 nextObject];

      char v6 = 0;
      v5 = (void *)v8;
    }
    while (v8);
  }
  [v2 appendString:@"]"];

  return v2;
}

@end