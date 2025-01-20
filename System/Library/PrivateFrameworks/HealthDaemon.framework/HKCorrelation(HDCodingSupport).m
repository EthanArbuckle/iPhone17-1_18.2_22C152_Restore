@interface HKCorrelation(HDCodingSupport)
+ (id)createWithCodable:()HDCodingSupport;
- (BOOL)addCodableRepresentationToCollection:()HDCodingSupport;
- (HDCodableCorrelation)codableRepresentationForSync;
@end

@implementation HKCorrelation(HDCodingSupport)

- (HDCodableCorrelation)codableRepresentationForSync
{
  v2 = objc_alloc_init(HDCodableCorrelation);
  v5.receiver = a1;
  v5.super_class = (Class)&off_1F187BE48;
  v3 = objc_msgSendSuper2(&v5, sel_codableRepresentationForSync);
  [(HDCodableCorrelation *)v2 setSample:v3];

  return v2;
}

- (BOOL)addCodableRepresentationToCollection:()HDCodingSupport
{
  id v4 = a3;
  objc_super v5 = [a1 codableRepresentationForSync];
  if (v5) {
    [v4 addCorrelations:v5];
  }

  return v5 != 0;
}

+ (id)createWithCodable:()HDCodingSupport
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    objc_super v5 = (void *)[objc_alloc(MEMORY[0x1E4F2B880]) _init];
    if ([v4 applyToObject:v5])
    {
      uint64_t v6 = HKDefaultObjectValidationConfigurationIgnoringAllOptions();
      v8 = objc_msgSend(v5, "_validateWithConfiguration:", v6, v7);
      if (v8) {
        v9 = 0;
      }
      else {
        v9 = v5;
      }
      id v10 = v9;
    }
    else
    {
      id v10 = 0;
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

@end