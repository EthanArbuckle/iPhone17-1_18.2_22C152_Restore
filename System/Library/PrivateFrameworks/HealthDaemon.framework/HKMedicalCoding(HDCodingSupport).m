@interface HKMedicalCoding(HDCodingSupport)
+ (id)createWithCodable:()HDCodingSupport;
- (HDCodableMedicalCoding)codableRepresentationForSync;
@end

@implementation HKMedicalCoding(HDCodingSupport)

+ (id)createWithCodable:()HDCodingSupport
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    if ([v4 hasCodingSystem])
    {
      v5 = (void *)MEMORY[0x1E4F2B180];
      v6 = [v4 codingSystem];
      v7 = [v5 codeSystemWithIdentifier:v6];
    }
    else
    {
      v7 = 0;
    }
    v9 = (void *)MEMORY[0x1E4F2B170];
    v10 = [v4 codingVersion];
    v11 = [v4 code];
    v12 = [v4 displayString];
    v13 = [v9 medicalCodingWithSystem:v7 codingVersion:v10 code:v11 displayString:v12];

    v14 = [v13 _validateConfiguration];
    if (v14) {
      id v8 = 0;
    }
    else {
      id v8 = v13;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (HDCodableMedicalCoding)codableRepresentationForSync
{
  v2 = objc_alloc_init(HDCodableMedicalCoding);
  id v3 = [a1 codingSystem];
  id v4 = [v3 identifier];
  [(HDCodableMedicalCoding *)v2 setCodingSystem:v4];

  v5 = [a1 codingVersion];
  [(HDCodableMedicalCoding *)v2 setCodingVersion:v5];

  v6 = [a1 code];
  [(HDCodableMedicalCoding *)v2 setCode:v6];

  v7 = [a1 displayString];
  [(HDCodableMedicalCoding *)v2 setDisplayString:v7];

  return v2;
}

@end