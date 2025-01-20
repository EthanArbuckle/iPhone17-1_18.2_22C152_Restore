@interface HMDTimeOffsetToDateComponentsTransformer
+ (Class)transformedValueClass;
+ (Class)valueClass;
+ (id)transformedValue:(id)a3 error:(id *)a4;
- (id)reverseTransformedValue:(id)a3 error:(id *)a4;
@end

@implementation HMDTimeOffsetToDateComponentsTransformer

+ (id)transformedValue:(id)a3 error:(id *)a4
{
  char v9 = 0;
  v4 = HMDTimeOffsetToDateComponents([a3 integerValue], &v9);
  v5 = v4;
  if (v9)
  {
    if (v4) {
      id v6 = v4;
    }
    else {
      id v6 = objc_alloc_init(MEMORY[0x263EFF918]);
    }
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

+ (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (id)reverseTransformedValue:(id)a3 error:(id *)a4
{
  BOOL v7 = 0;
  uint64_t v4 = HMDTimeOffsetFromDateComponents(a3, &v7);
  if (v7)
  {
    v5 = [NSNumber numberWithDouble:(double)v4];
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

@end