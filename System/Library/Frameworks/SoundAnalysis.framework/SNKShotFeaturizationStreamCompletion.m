@interface SNKShotFeaturizationStreamCompletion
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)inferenceWindowSize;
- (MLMultiArray)exemplar;
- (SNKShotFeaturizationStreamCompletion)init;
- (void)setExemplar:(id)a3;
- (void)setInferenceWindowSize:(id *)a3;
@end

@implementation SNKShotFeaturizationStreamCompletion

- (SNKShotFeaturizationStreamCompletion)init
{
  return (SNKShotFeaturizationStreamCompletion *)SNKShotFeaturizationStreamCompletion.init()();
}

- (MLMultiArray)exemplar
{
  v2 = (void *)sub_1DC890810();

  return (MLMultiArray *)v2;
}

- (void)setExemplar:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1DC890894((uint64_t)v4);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)inferenceWindowSize
{
  sub_1DC893EEC(self, sub_1DC890954, &retstr->var0);
  return result;
}

- (void)setInferenceWindowSize:(id *)a3
{
}

- (void).cxx_destruct
{
}

@end