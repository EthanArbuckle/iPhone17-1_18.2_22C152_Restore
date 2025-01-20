@interface HMDSoftwareVersionStringDataTransformer
+ (Class)transformedValueClass;
+ (Class)valueClass;
+ (id)reverseTransformedValue:(id)a3 error:(id *)a4;
+ (id)transformedValue:(id)a3 error:(id *)a4;
@end

@implementation HMDSoftwareVersionStringDataTransformer

+ (id)reverseTransformedValue:(id)a3 error:(id *)a4
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSString) initWithData:v4 encoding:4];

  if (v5) {
    id v6 = [objc_alloc((Class)HMFSoftwareVersion) initWithVersionString:v5];
  }
  else {
    id v6 = 0;
  }

  return v6;
}

+ (id)transformedValue:(id)a3 error:(id *)a4
{
  id v4 = [a3 versionString];
  id v5 = [v4 dataUsingEncoding:4];

  return v5;
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