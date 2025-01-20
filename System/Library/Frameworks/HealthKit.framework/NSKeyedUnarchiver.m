@interface NSKeyedUnarchiver
@end

@implementation NSKeyedUnarchiver

uint64_t __77__NSKeyedUnarchiver_HealthKit__hk_unarchivedObjectOfClass_forKey_data_error___block_invoke(void *a1, void *a2)
{
  *(void *)(*(void *)(a1[5] + 8) + 40) = [a2 decodeObjectOfClass:a1[6] forKey:a1[4]];

  return MEMORY[0x1F41817F8]();
}

uint64_t __79__NSKeyedUnarchiver_HealthKit__hk_unarchivedObjectOfClasses_forKey_data_error___block_invoke(void *a1, void *a2)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [a2 decodeObjectOfClasses:a1[4] forKey:a1[5]];

  return MEMORY[0x1F41817F8]();
}

@end