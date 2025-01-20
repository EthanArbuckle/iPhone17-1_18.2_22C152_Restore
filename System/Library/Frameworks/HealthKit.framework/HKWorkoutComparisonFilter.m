@interface HKWorkoutComparisonFilter
@end

@implementation HKWorkoutComparisonFilter

BOOL __61___HKWorkoutComparisonFilter_areValidTypes_forKeyPath_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  uint64_t v5 = [v4 code];
  if (v5 != 79) {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a3, 3, @"unexpected data type code %ld for %@", objc_msgSend(v4, "code"), objc_opt_class());
  }

  return v5 == 79;
}

@end