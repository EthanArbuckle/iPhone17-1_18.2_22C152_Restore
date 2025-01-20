@interface NSString(FSEventAdditions)
+ (__CFString)fpfs_initWithFSEventsFlags:()FSEventAdditions;
@end

@implementation NSString(FSEventAdditions)

+ (__CFString)fpfs_initWithFSEventsFlags:()FSEventAdditions
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  for (uint64_t i = 0; i != 92; i += 4)
  {
    if ((mapping[i] & a3) != 0)
    {
      v6 = [NSString stringWithUTF8String:*(void *)&mapping[i + 2]];
      [v4 addObject:v6];
    }
  }
  if ([v4 count])
  {
    v7 = [v4 componentsJoinedByString:@","];
  }
  else
  {
    v7 = @"none";
  }

  return v7;
}

@end