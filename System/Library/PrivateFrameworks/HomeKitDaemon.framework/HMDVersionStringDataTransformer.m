@interface HMDVersionStringDataTransformer
+ (Class)transformedValueClass;
+ (Class)valueClass;
+ (id)reverseTransformedValue:(id)a3 error:(id *)a4;
+ (id)transformedValue:(id)a3 error:(id *)a4;
@end

@implementation HMDVersionStringDataTransformer

+ (id)reverseTransformedValue:(id)a3 error:(id *)a4
{
  v4 = (objc_class *)NSString;
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithData:v5 encoding:4];

  if (v6) {
    v7 = (void *)[objc_alloc(MEMORY[0x263F42670]) initWithVersionString:v6];
  }
  else {
    v7 = 0;
  }

  return v7;
}

+ (id)transformedValue:(id)a3 error:(id *)a4
{
  v4 = [a3 versionString];
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