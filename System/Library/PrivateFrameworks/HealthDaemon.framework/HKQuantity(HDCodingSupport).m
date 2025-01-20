@interface HKQuantity(HDCodingSupport)
+ (id)createWithCodable:()HDCodingSupport;
- (HDCodableQuantity)codableRepresentationForSync;
@end

@implementation HKQuantity(HDCodingSupport)

- (HDCodableQuantity)codableRepresentationForSync
{
  v2 = objc_alloc_init(HDCodableQuantity);
  v3 = [a1 _unit];
  v4 = [v3 unitString];
  [(HDCodableQuantity *)v2 setUnitString:v4];

  [a1 doubleValueForUnit:v3];
  -[HDCodableQuantity setValue:](v2, "setValue:");

  return v2;
}

+ (id)createWithCodable:()HDCodingSupport
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    if ([v4 hasUnitString] && objc_msgSend(v4, "hasValue"))
    {
      v5 = (void *)MEMORY[0x1E4F2B618];
      v6 = [v4 unitString];
      v7 = [v5 unitFromString:v6];

      v8 = (void *)MEMORY[0x1E4F2B370];
      [v4 value];
      v9 = objc_msgSend(v8, "quantityWithUnit:doubleValue:", v7);
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end