@interface HMDSoftwareVersionStringTransformer
+ (Class)transformedValueClass;
+ (Class)valueClass;
+ (id)reverseTransformedValue:(id)a3 error:(id *)a4;
+ (id)transformedValue:(id)a3 error:(id *)a4;
@end

@implementation HMDSoftwareVersionStringTransformer

+ (id)reverseTransformedValue:(id)a3 error:(id *)a4
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)HMFSoftwareVersion) initWithVersionString:v4];

  return v5;
}

+ (id)transformedValue:(id)a3 error:(id *)a4
{
  return [a3 versionString];
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