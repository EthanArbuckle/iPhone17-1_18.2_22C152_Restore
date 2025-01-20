@interface HMDHomeKitVersionStringTransformer
+ (Class)transformedValueClass;
+ (Class)valueClass;
+ (id)reverseTransformedValue:(id)a3 error:(id *)a4;
+ (id)transformedValue:(id)a3 error:(id *)a4;
@end

@implementation HMDHomeKitVersionStringTransformer

+ (id)reverseTransformedValue:(id)a3 error:(id *)a4
{
  id v4 = a3;
  v5 = [[HMDHomeKitVersion alloc] initWithVersionString:v4];

  return v5;
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