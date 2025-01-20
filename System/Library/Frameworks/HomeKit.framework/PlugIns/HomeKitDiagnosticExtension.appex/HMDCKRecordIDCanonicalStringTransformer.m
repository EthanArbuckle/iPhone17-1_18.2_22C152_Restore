@interface HMDCKRecordIDCanonicalStringTransformer
+ (Class)transformedValueClass;
+ (Class)valueClass;
+ (id)reverseTransformedValue:(id)a3 error:(id *)a4;
+ (id)transformedValue:(id)a3 error:(id *)a4;
@end

@implementation HMDCKRecordIDCanonicalStringTransformer

+ (id)reverseTransformedValue:(id)a3 error:(id *)a4
{
  id v4 = a3;
  id v5 = objc_alloc((Class)CKRecordID);
  id v6 = objc_msgSend(v5, "hmd_initWithCanonicalStringRepresentation:", v4);

  return v6;
}

+ (id)transformedValue:(id)a3 error:(id *)a4
{
  return objc_msgSend(a3, "hmd_canonicalStringRepresentation");
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