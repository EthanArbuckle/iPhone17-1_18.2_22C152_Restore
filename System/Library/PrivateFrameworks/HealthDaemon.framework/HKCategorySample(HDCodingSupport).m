@interface HKCategorySample(HDCodingSupport)
+ (id)createWithCodable:()HDCodingSupport;
- (BOOL)addCodableRepresentationToCollection:()HDCodingSupport;
- (HDCodableCategorySample)codableRepresentationForSync;
@end

@implementation HKCategorySample(HDCodingSupport)

- (BOOL)addCodableRepresentationToCollection:()HDCodingSupport
{
  id v4 = a3;
  v5 = [a1 codableRepresentationForSync];
  if (v5) {
    [v4 addCategorySamples:v5];
  }

  return v5 != 0;
}

- (HDCodableCategorySample)codableRepresentationForSync
{
  v2 = objc_alloc_init(HDCodableCategorySample);
  v5.receiver = a1;
  v5.super_class = (Class)&off_1F1879660;
  v3 = objc_msgSendSuper2(&v5, sel_codableRepresentationForSync);
  [(HDCodableCategorySample *)v2 setSample:v3];

  -[HDCodableCategorySample setValue:](v2, "setValue:", [a1 value]);

  return v2;
}

+ (id)createWithCodable:()HDCodingSupport
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if ([v5 hasValue])
    {
      v6 = (void *)[[a1 alloc] _init];
      if ([v5 applyToObject:v6])
      {
        uint64_t v7 = HKDefaultObjectValidationConfigurationIgnoringAllOptions();
        v9 = objc_msgSend(v6, "_validateWithConfiguration:", v7, v8);
        if (v9) {
          v10 = 0;
        }
        else {
          v10 = v6;
        }
        id v11 = v10;
      }
      else
      {
        id v11 = 0;
      }
    }
    else
    {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

@end