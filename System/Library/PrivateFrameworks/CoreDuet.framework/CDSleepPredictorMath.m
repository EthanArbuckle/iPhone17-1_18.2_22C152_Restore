@interface CDSleepPredictorMath
@end

@implementation CDSleepPredictorMath

uint64_t __61___CDSleepPredictorMath_predictFrom_withTuning_usingVersion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  int v6 = [a2 intValue];
  return objc_msgSend(*(id *)(a1 + 32), "replaceBytesInRange:withBytes:", 4 * a3, 4, &v6);
}

@end