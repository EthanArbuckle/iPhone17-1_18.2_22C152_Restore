@interface HMDCKRecordIDCanonicalStringDataTransformer
+ (Class)transformedValueClass;
+ (Class)valueClass;
+ (id)reverseTransformedValue:(id)a3 error:(id *)a4;
+ (id)transformedValue:(id)a3 error:(id *)a4;
@end

@implementation HMDCKRecordIDCanonicalStringDataTransformer

+ (id)reverseTransformedValue:(id)a3 error:(id *)a4
{
  v4 = (objc_class *)NSString;
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithData:v5 encoding:1];

  if (v6)
  {
    id v7 = objc_alloc(MEMORY[0x263EFD7E8]);
    v8 = objc_msgSend(v7, "hmd_initWithCanonicalStringRepresentation:", v6);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)transformedValue:(id)a3 error:(id *)a4
{
  v4 = objc_msgSend(a3, "hmd_canonicalStringRepresentation");
  id v5 = [v4 dataUsingEncoding:1];

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