@interface ABPKMLModelConfiguration3DLiftingSequenceFirstStage
- (ABPKMLModelConfiguration3DLiftingSequenceFirstStage)init;
- (id)compiledMLModelPath;
- (id)inputTensorNames;
- (id)outputTensorNames;
@end

@implementation ABPKMLModelConfiguration3DLiftingSequenceFirstStage

- (ABPKMLModelConfiguration3DLiftingSequenceFirstStage)init
{
  v8.receiver = self;
  v8.super_class = (Class)ABPKMLModelConfiguration3DLiftingSequenceFirstStage;
  v2 = [(ABPKMLModelConfiguration *)&v8 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v4 = [NSString stringWithUTF8String:kABPK3DLiftingSequenceFirstStageNetworkName];
    uint64_t v5 = ABPKMLModelPath(v3, v4, 1);
    mlModelPath = v2->_mlModelPath;
    v2->_mlModelPath = (NSString *)v5;
  }
  return v2;
}

- (id)compiledMLModelPath
{
  return self->_mlModelPath;
}

- (id)inputTensorNames
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = kABPK3DLiftingSequenceFirstStageInputTensorName;
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

- (id)outputTensorNames
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = kABPK3DLiftingSequenceFirstStageOutputTensorName;
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

- (void).cxx_destruct
{
}

@end