@interface HMDCKRecordIDCanonicalStringDataTransformer
+ (Class)transformedValueClass;
+ (Class)valueClass;
+ (id)reverseTransformedValue:(id)a3 error:(id *)a4;
+ (id)transformedValue:(id)a3 error:(id *)a4;
@end

@implementation HMDCKRecordIDCanonicalStringDataTransformer

+ (id)reverseTransformedValue:(id)a3 error:(id *)a4
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSString) initWithData:v4 encoding:1];

  if (v5)
  {
    id v6 = objc_alloc((Class)CKRecordID);
    id v7 = objc_msgSend(v6, "hmd_initWithCanonicalStringRepresentation:", v5);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)transformedValue:(id)a3 error:(id *)a4
{
  id v4 = objc_msgSend(a3, "hmd_canonicalStringRepresentation");
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