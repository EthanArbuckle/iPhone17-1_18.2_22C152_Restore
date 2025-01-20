@interface HKQueryDescriptor(HKMenstrualCycles)
+ (id)hkmc_descriptorsForTypes:()HKMenstrualCycles predicate:;
@end

@implementation HKQueryDescriptor(HKMenstrualCycles)

+ (id)hkmc_descriptorsForTypes:()HKMenstrualCycles predicate:
{
  id v5 = a4;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __75__HKQueryDescriptor_HKMenstrualCycles__hkmc_descriptorsForTypes_predicate___block_invoke;
  v9[3] = &unk_2646E9748;
  id v10 = v5;
  id v6 = v5;
  v7 = objc_msgSend(a3, "hk_map:", v9);

  return v7;
}

@end