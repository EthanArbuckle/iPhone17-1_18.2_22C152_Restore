@interface HMDCKRecordIDCanonicalStringTransformer
+ (Class)transformedValueClass;
+ (Class)valueClass;
+ (id)reverseTransformedValue:(id)a3 error:(id *)a4;
+ (id)transformedValue:(id)a3 error:(id *)a4;
@end

@implementation HMDCKRecordIDCanonicalStringTransformer

+ (id)reverseTransformedValue:(id)a3 error:(id *)a4
{
  v4 = (objc_class *)MEMORY[0x263EFD7E8];
  id v5 = a3;
  id v6 = [v4 alloc];
  v7 = objc_msgSend(v6, "hmd_initWithCanonicalStringRepresentation:", v5);

  return v7;
}

+ (id)transformedValue:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(a3, "hmd_canonicalStringRepresentation");
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