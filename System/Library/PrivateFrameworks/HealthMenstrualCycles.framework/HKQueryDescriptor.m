@interface HKQueryDescriptor
@end

@implementation HKQueryDescriptor

id __75__HKQueryDescriptor_HKMenstrualCycles__hkmc_descriptorsForTypes_predicate___block_invoke(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x263F0A678];
  id v4 = a2;
  v5 = (void *)[[v3 alloc] initWithSampleType:v4 predicate:*(void *)(a1 + 32)];

  return v5;
}

@end