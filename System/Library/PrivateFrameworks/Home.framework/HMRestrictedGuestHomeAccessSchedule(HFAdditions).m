@interface HMRestrictedGuestHomeAccessSchedule(HFAdditions)
+ (id)hf_restrictedGuestHomeAccessScheduleFromHFSchedule:()HFAdditions;
@end

@implementation HMRestrictedGuestHomeAccessSchedule(HFAdditions)

+ (id)hf_restrictedGuestHomeAccessScheduleFromHFSchedule:()HFAdditions
{
  if (a3)
  {
    id v3 = a3;
    v4 = [v3 rules];
    v5 = [v4 allObjects];
    v6 = objc_msgSend(v5, "na_filter:", &__block_literal_global_200);
    v7 = objc_msgSend(v6, "na_map:", &__block_literal_global_3_32);

    v8 = [v3 rules];

    v9 = [v8 allObjects];
    v10 = objc_msgSend(v9, "na_filter:", &__block_literal_global_5_3);
    v11 = objc_msgSend(v10, "na_map:", &__block_literal_global_7_13);

    v12 = (void *)[objc_alloc(MEMORY[0x263F0E6E0]) initWithWeekDayRules:v7 yearDayRules:v11];
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

@end