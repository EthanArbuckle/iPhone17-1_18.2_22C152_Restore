@interface HKAudioVisibleRangeQuantityContextDelegate
@end

@implementation HKAudioVisibleRangeQuantityContextDelegate

void __102___HKAudioVisibleRangeQuantityContextDelegate_valueString_applicationItems_representativeDisplayType___block_invoke(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x1E4F2AC30];
  id v4 = a2;
  id v5 = [v3 alloc];
  [v4 averageLEQ];
  double v7 = v6;
  [v4 duration];
  double v9 = v8;

  id v10 = (id)[v5 initWithValue:v7 duration:v9];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v10];
}

double __109___HKAudioVisibleRangeQuantityContextDelegate_valueContextString_applicationItems_representativeDisplayType___block_invoke(uint64_t a1, void *a2)
{
  [a2 duration];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  double result = v4 + *(double *)(v3 + 24);
  *(double *)(v3 + 24) = result;
  return result;
}

@end