@interface NSArray(CoreDAVExtensions)
+ (id)_arrayWithIntArg:()CoreDAVExtensions additionalArgs:;
+ (id)cdvArrayWithIntegers:()CoreDAVExtensions;
@end

@implementation NSArray(CoreDAVExtensions)

+ (id)_arrayWithIntArg:()CoreDAVExtensions additionalArgs:
{
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (a3)
  {
    v6 = NSNumber;
    uint64_t v7 = a3;
    while (1)
    {
      v8 = [v6 numberWithInt:v7];
      [v5 addObject:v8];

      v9 = a4;
      a4 += 2;
      uint64_t v7 = *v9;
      if (!v7) {
        break;
      }
      v6 = NSNumber;
    }
  }
  return v5;
}

+ (id)cdvArrayWithIntegers:()CoreDAVExtensions
{
  v9 = [a1 _arrayWithIntArg:a3 additionalArgs:&a9];
  return v9;
}

@end