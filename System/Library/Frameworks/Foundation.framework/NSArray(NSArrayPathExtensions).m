@interface NSArray(NSArrayPathExtensions)
- (void)pathsMatchingExtensions:()NSArrayPathExtensions;
- (void)stringsByAppendingPathComponent:()NSArrayPathExtensions;
@end

@implementation NSArray(NSArrayPathExtensions)

- (void)pathsMatchingExtensions:()NSArrayPathExtensions
{
  uint64_t v5 = [a1 count];
  v6 = (void *)[MEMORY[0x1E4F1CA48] array];
  if (v5 >= 1)
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      v8 = (void *)[a1 objectAtIndex:i];
      v9 = (void *)[v8 pathExtension];
      if (([v9 isEqual:&stru_1ECA5C228] & 1) == 0
        && [a3 containsObject:v9])
      {
        [v6 addObject:v8];
      }
    }
  }
  return v6;
}

- (void)stringsByAppendingPathComponent:()NSArrayPathExtensions
{
  uint64_t v5 = [a1 count];
  v6 = (void *)[MEMORY[0x1E4F1CA48] array];
  if (v5 >= 1)
  {
    for (uint64_t i = 0; i != v5; ++i)
      objc_msgSend(v6, "addObject:", objc_msgSend((id)objc_msgSend(a1, "objectAtIndex:", i), "stringByAppendingPathComponent:", a3));
  }
  return v6;
}

@end