@interface HMDVersionStringTransformer
+ (Class)transformedValueClass;
+ (Class)valueClass;
+ (id)reverseTransformedValue:(id)a3 error:(id *)a4;
+ (id)transformedValue:(id)a3 error:(id *)a4;
@end

@implementation HMDVersionStringTransformer

+ (id)reverseTransformedValue:(id)a3 error:(id *)a4
{
  v4 = (objc_class *)MEMORY[0x263F42670];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithVersionString:v5];

  return v6;
}

+ (id)transformedValue:(id)a3 error:(id *)a4
{
  return (id)[a3 versionString];
}

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

+ (Class)valueClass
{
  return (Class)objc_opt_class();
}

@end