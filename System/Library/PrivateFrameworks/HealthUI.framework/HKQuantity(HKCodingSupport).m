@interface HKQuantity(HKCodingSupport)
+ (id)createWithCodableQuantity:()HKCodingSupport;
- (HKCodableQuantity)codableRepresentation;
@end

@implementation HKQuantity(HKCodingSupport)

+ (id)createWithCodableQuantity:()HKCodingSupport
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [v3 hasUnitString]
    && [v3 hasValue])
  {
    v4 = (void *)MEMORY[0x1E4F2B618];
    v5 = [v3 unitString];
    v6 = [v4 unitFromString:v5];

    v7 = (void *)MEMORY[0x1E4F2B370];
    [v3 value];
    v8 = objc_msgSend(v7, "quantityWithUnit:doubleValue:", v6);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (HKCodableQuantity)codableRepresentation
{
  v2 = objc_alloc_init(HKCodableQuantity);
  id v3 = [a1 _unit];
  v4 = [v3 unitString];
  [(HKCodableQuantity *)v2 setUnitString:v4];

  [a1 doubleValueForUnit:v3];
  -[HKCodableQuantity setValue:](v2, "setValue:");

  return v2;
}

+ (void)createWithCodableQuantity:()HKCodingSupport .cold.1(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138543618;
  *(void *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2114;
  *(void *)(a3 + 14) = a2;
  id v6 = a1;
  _os_log_error_impl(&dword_1E0B26000, a4, OS_LOG_TYPE_ERROR, "Caught exception while decoding %{public}@: %{public}@", (uint8_t *)a3, 0x16u);
}

@end