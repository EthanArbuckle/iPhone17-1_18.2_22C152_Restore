@interface NSFileManager(DESExtensions)
- (uint64_t)_fides_removeItemAtPath:()DESExtensions error:;
@end

@implementation NSFileManager(DESExtensions)

- (uint64_t)_fides_removeItemAtPath:()DESExtensions error:
{
  id v12 = 0;
  char v5 = [a1 removeItemAtPath:a3 error:&v12];
  id v6 = v12;
  id v7 = v6;
  if (v5) {
    goto LABEL_5;
  }
  v8 = [v6 domain];
  if ([v8 isEqualToString:*MEMORY[0x1E4F281F8]])
  {
    uint64_t v9 = [v7 code];

    if (v9 == 4)
    {

      id v7 = 0;
LABEL_5:
      uint64_t v10 = 1;
      goto LABEL_10;
    }
  }
  else
  {
  }
  if (a4)
  {
    id v7 = v7;
    uint64_t v10 = 0;
    *a4 = v7;
  }
  else
  {
    uint64_t v10 = 0;
  }
LABEL_10:

  return v10;
}

@end