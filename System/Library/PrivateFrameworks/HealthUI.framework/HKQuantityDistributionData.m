@interface HKQuantityDistributionData
@end

@implementation HKQuantityDistributionData

id __137___HKQuantityDistributionData_HKCodingSupport__quantityDistributionDataWithCodableQuantityDistributionData_sourceTimeZone_preferredUnit___block_invoke(uint64_t a1, void *a2)
{
  v2 = (objc_class *)MEMORY[0x1E4F29128];
  id v3 = a2;
  v4 = (void *)[[v2 alloc] initWithUUIDString:v3];

  return v4;
}

uint64_t __79___HKQuantityDistributionData_HKCodingSupport__codableQuantityDistributionData__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  [a2 doubleValue];
  return objc_msgSend(v2, "addHistogramCounts:");
}

void __79___HKQuantityDistributionData_HKCodingSupport__codableQuantityDistributionData__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 UUIDString];
  [v2 addContextIdentifiers:v3];
}

@end