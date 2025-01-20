@interface SNKShotFeaturizationResult
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)inferenceWindowSize;
- (MLMultiArray)exemplar;
- (NSArray)trainingDataEmbeddings;
- (NSArray)trainingDataLabels;
- (NSArray)validationDataEmbeddings;
- (NSArray)validationDataLabels;
- (SNKShotFeaturizationResult)init;
- (void)setExemplar:(id)a3;
- (void)setInferenceWindowSize:(id *)a3;
- (void)setTrainingDataEmbeddings:(id)a3;
- (void)setTrainingDataLabels:(id)a3;
- (void)setValidationDataEmbeddings:(id)a3;
- (void)setValidationDataLabels:(id)a3;
@end

@implementation SNKShotFeaturizationResult

- (SNKShotFeaturizationResult)init
{
  return (SNKShotFeaturizationResult *)SNKShotFeaturizationResult.init()();
}

- (NSArray)trainingDataEmbeddings
{
  return (NSArray *)sub_1DC891F54(self, (uint64_t)a2, (void (*)(void))sub_1DC891CB0, (unint64_t *)&unk_1EAA9DB50);
}

- (void)setTrainingDataEmbeddings:(id)a3
{
}

- (NSArray)trainingDataLabels
{
  return (NSArray *)sub_1DC891F54(self, (uint64_t)a2, (void (*)(void))sub_1DC891FD8, (unint64_t *)&qword_1EAA9C7A0);
}

- (void)setTrainingDataLabels:(id)a3
{
}

- (NSArray)validationDataEmbeddings
{
  return (NSArray *)sub_1DC891F54(self, (uint64_t)a2, (void (*)(void))sub_1DC8922F8, (unint64_t *)&unk_1EAA9DB50);
}

- (void)setValidationDataEmbeddings:(id)a3
{
}

- (NSArray)validationDataLabels
{
  return (NSArray *)sub_1DC891F54(self, (uint64_t)a2, (void (*)(void))sub_1DC8925A0, (unint64_t *)&qword_1EAA9C7A0);
}

- (void)setValidationDataLabels:(id)a3
{
}

- (MLMultiArray)exemplar
{
  v2 = self;
  v3 = (void *)sub_1DC892860();

  return (MLMultiArray *)v3;
}

- (void)setExemplar:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1DC89291C((uint64_t)v4);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)inferenceWindowSize
{
  sub_1DC893EEC(self, sub_1DC8929D4, &retstr->var0);
  return result;
}

- (void)setInferenceWindowSize:(id *)a3
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end