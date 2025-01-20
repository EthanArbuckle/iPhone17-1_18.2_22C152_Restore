@interface ABPKMLModelConfiguration3DLiftingLSTM
- (ABPKMLModelConfiguration3DLiftingLSTM)init;
- (id)compiledMLModelPath;
- (id)inputCellStateTensorNames;
- (id)inputHiddenStateTensorNames;
- (id)inputPose2dTensorNames;
- (id)inputTensorNames;
- (id)outputPose3dTensorNames;
- (id)outputTensorNames;
- (id)outputToCellStateTensorNames;
- (id)outputToHiddenStateTensorNames;
@end

@implementation ABPKMLModelConfiguration3DLiftingLSTM

- (ABPKMLModelConfiguration3DLiftingLSTM)init
{
  v8.receiver = self;
  v8.super_class = (Class)ABPKMLModelConfiguration3DLiftingLSTM;
  v2 = [(ABPKMLModelConfiguration *)&v8 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v4 = (id)kABPK3DLiftingLSTMNetworkName;
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
  v4[3] = *MEMORY[0x263EF8340];
  v4[0] = kABPK3DLiftingLSTMInputPose2dTensorName;
  v4[1] = kABPK3DLiftingLSTMInputHiddenStateTensorName;
  v4[2] = kABPK3DLiftingLSTMInputCellStateTensorName;
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:3];
  return v2;
}

- (id)outputTensorNames
{
  v4[3] = *MEMORY[0x263EF8340];
  v4[0] = kABPK3DLiftingLSTMOutputPose3dTensorName;
  v4[1] = kABPK3DLiftingLSTMOutputToHiddenStateTensorName;
  v4[2] = kABPK3DLiftingLSTMOutputToCellStateTensorName;
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:3];
  return v2;
}

- (id)inputPose2dTensorNames
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = kABPK3DLiftingLSTMInputPose2dTensorName;
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

- (id)inputHiddenStateTensorNames
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = kABPK3DLiftingLSTMInputHiddenStateTensorName;
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

- (id)inputCellStateTensorNames
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = kABPK3DLiftingLSTMInputCellStateTensorName;
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

- (id)outputPose3dTensorNames
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = kABPK3DLiftingLSTMOutputPose3dTensorName;
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

- (id)outputToHiddenStateTensorNames
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = kABPK3DLiftingLSTMOutputToHiddenStateTensorName;
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

- (id)outputToCellStateTensorNames
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = kABPK3DLiftingLSTMOutputToCellStateTensorName;
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

- (void).cxx_destruct
{
}

@end