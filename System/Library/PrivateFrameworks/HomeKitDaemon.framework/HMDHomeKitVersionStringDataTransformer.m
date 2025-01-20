@interface HMDHomeKitVersionStringDataTransformer
+ (Class)transformedValueClass;
+ (Class)valueClass;
+ (id)reverseTransformedValue:(id)a3 error:(id *)a4;
+ (id)transformedValue:(id)a3 error:(id *)a4;
@end

@implementation HMDHomeKitVersionStringDataTransformer

+ (id)reverseTransformedValue:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = (void *)[[NSString alloc] initWithData:v5 encoding:4];
  if (v6)
  {
    v7 = [[HMDHomeKitVersion alloc] initWithVersionString:v6];
    if (v7)
    {
      v8 = v7;
      v9 = v8;
    }
    else
    {
      if (a4)
      {
        v11 = (void *)MEMORY[0x263F087E8];
        v12 = [NSString stringWithFormat:@"String isn't valid as HMDHomeKitVersion: %@", v6];
        *a4 = [v11 hmfErrorWithCode:3 reason:v12];
      }
      v8 = 0;
      v9 = 0;
    }
    goto LABEL_9;
  }
  if (a4)
  {
    v10 = (void *)MEMORY[0x263F087E8];
    v8 = [NSString stringWithFormat:@"Data is not UTF8: %@", v5];
    [v10 hmfErrorWithCode:3 reason:v8];
    v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:

    goto LABEL_10;
  }
  v9 = 0;
LABEL_10:

  return v9;
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