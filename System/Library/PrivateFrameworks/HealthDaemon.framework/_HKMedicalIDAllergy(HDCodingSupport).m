@interface _HKMedicalIDAllergy(HDCodingSupport)
+ (id)createWithCodable:()HDCodingSupport;
- (HDCodableMedicalIDAllergy)codableRepresentationForSync;
@end

@implementation _HKMedicalIDAllergy(HDCodingSupport)

- (HDCodableMedicalIDAllergy)codableRepresentationForSync
{
  v2 = objc_alloc_init(HDCodableMedicalIDAllergy);
  v3 = [a1 textDescription];
  [(HDCodableMedicalIDAllergy *)v2 setTextDescription:v3];

  return v2;
}

+ (id)createWithCodable:()HDCodingSupport
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = (objc_class *)MEMORY[0x1E4F2B910];
    id v5 = v3;
    id v6 = objc_alloc_init(v4);
    v7 = [v5 textDescription];

    [v6 setTextDescription:v7];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

@end