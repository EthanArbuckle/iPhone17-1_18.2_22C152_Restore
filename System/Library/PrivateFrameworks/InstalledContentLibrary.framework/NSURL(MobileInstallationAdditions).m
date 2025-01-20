@interface NSURL(MobileInstallationAdditions)
- (id)MI_URLByAppendingPathComponents:()MobileInstallationAdditions lastIsDirectory:;
- (id)MI_allAccessURLs;
@end

@implementation NSURL(MobileInstallationAdditions)

- (id)MI_URLByAppendingPathComponents:()MobileInstallationAdditions lastIsDirectory:
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x1C1878860]();
  id v8 = a1;
  uint64_t v9 = [v6 count];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = 0;
    uint64_t v12 = v9 - 1;
    do
    {
      if (v12 == v11) {
        uint64_t v13 = a4;
      }
      else {
        uint64_t v13 = 1;
      }
      v14 = [v6 objectAtIndexedSubscript:v11];
      v15 = [v8 URLByAppendingPathComponent:v14 isDirectory:v13];

      ++v11;
      id v8 = v15;
    }
    while (v10 != v11);
  }
  else
  {
    v15 = v8;
  }
  id v16 = v15;

  return v16;
}

- (id)MI_allAccessURLs
{
  v2 = objc_opt_new();
  v3 = [a1 pathComponents];
  v4 = (void *)[v3 mutableCopy];

  while ([v4 count])
  {
    v5 = [MEMORY[0x1E4F1CB10] fileURLWithPathComponents:v4];
    [v2 addObject:v5];

    [v4 removeLastObject];
  }
  id v6 = (void *)[v2 copy];

  return v6;
}

@end