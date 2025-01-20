@interface NSURL(InstallCoordinationAdditions)
- (id)urlByAppendingPathComponents:()InstallCoordinationAdditions lastIsDirectory:;
@end

@implementation NSURL(InstallCoordinationAdditions)

- (id)urlByAppendingPathComponents:()InstallCoordinationAdditions lastIsDirectory:
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x1AD0D4670]();
  id v8 = a1;
  uint64_t v9 = [v6 count];
  if (v9)
  {
    uint64_t v10 = v9 - 1;
    if (v9 == 1)
    {
      v13 = v8;
    }
    else
    {
      uint64_t v11 = 0;
      do
      {
        v12 = [v6 objectAtIndexedSubscript:v11];
        v13 = [v8 URLByAppendingPathComponent:v12 isDirectory:1];

        ++v11;
        id v8 = v13;
      }
      while (v10 != v11);
    }
    v14 = [v6 objectAtIndexedSubscript:v10];
    id v8 = [v13 URLByAppendingPathComponent:v14 isDirectory:a4];
  }
  id v15 = v8;

  return v15;
}

@end