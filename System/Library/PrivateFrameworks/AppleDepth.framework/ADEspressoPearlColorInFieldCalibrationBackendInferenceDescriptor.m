@interface ADEspressoPearlColorInFieldCalibrationBackendInferenceDescriptor
- (ADEspressoImageDescriptor)colorInput;
- (ADEspressoImageDescriptor)featuresOutput;
- (ADEspressoImageDescriptor)pearlInput;
- (ADEspressoImageDescriptor)pearlMaskInput;
- (ADEspressoPearlColorInFieldCalibrationBackendInferenceDescriptor)initWithNetworkProvider:(id)a3 espressoEngine:(unint64_t)a4 networkFlowType:(int)a5;
@end

@implementation ADEspressoPearlColorInFieldCalibrationBackendInferenceDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featuresOutput, 0);
  objc_storeStrong((id *)&self->_pearlMaskInput, 0);
  objc_storeStrong((id *)&self->_pearlInput, 0);
  objc_storeStrong((id *)&self->_colorInput, 0);
}

- (ADEspressoImageDescriptor)featuresOutput
{
  return self->_featuresOutput;
}

- (ADEspressoImageDescriptor)pearlMaskInput
{
  return self->_pearlMaskInput;
}

- (ADEspressoImageDescriptor)pearlInput
{
  return self->_pearlInput;
}

- (ADEspressoImageDescriptor)colorInput
{
  return self->_colorInput;
}

- (ADEspressoPearlColorInFieldCalibrationBackendInferenceDescriptor)initWithNetworkProvider:(id)a3 espressoEngine:(unint64_t)a4 networkFlowType:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  v9 = [v8 url];
  v10 = [v8 layoutNamesDict];
  v27.receiver = self;
  v27.super_class = (Class)ADEspressoPearlColorInFieldCalibrationBackendInferenceDescriptor;
  v11 = [(ADEspressoInferenceDescriptor *)&v27 initWithUrl:v9 layoutNames:v10];

  if (v11)
  {
    if (a4 - 3 > 1)
    {
      v18 = @"backend_output:0";
      v15 = @"Backend/inputs/jasper_image:0";
      uint64_t v19 = 1717855600;
    }
    else
    {
      pearlMaskInput = v11->_pearlMaskInput;
      v11->_pearlMaskInput = 0;

      if (+[ADPearlColorInFieldCalibrationPipeline isPearlMaskExpectedFor:v5])
      {
        if (v5 == 3) {
          v13 = @"mask_b";
        }
        else {
          v13 = @"mask";
        }
        uint64_t v14 = [v8 descriptorForBuffer:v13 isInput:1 pixelFormat:1278226536];
        if (v5 == 3) {
          v15 = @"depth_input_b";
        }
        else {
          v15 = @"depth_input";
        }
        if (v5 == 3) {
          v16 = @"image_b";
        }
        else {
          v16 = @"image";
        }
        v17 = v11->_pearlMaskInput;
        v11->_pearlMaskInput = (ADEspressoImageDescriptor *)v14;

        v18 = @"feat_vec";
        uint64_t v19 = 1278226536;
        goto LABEL_17;
      }
      v18 = @"backend_output:0";
      v15 = @"Backend/inputs/jasper_image:0";
      uint64_t v19 = 1751410032;
    }
    v16 = @"Backend/inputs/image:0";
LABEL_17:
    uint64_t v20 = [v8 descriptorForBuffer:v16 isInput:1 pixelFormat:1111970369];
    colorInput = v11->_colorInput;
    v11->_colorInput = (ADEspressoImageDescriptor *)v20;

    uint64_t v22 = [v8 descriptorForBuffer:v15 isInput:1 pixelFormat:v19];
    pearlInput = v11->_pearlInput;
    v11->_pearlInput = (ADEspressoImageDescriptor *)v22;

    uint64_t v24 = [v8 descriptorForBuffer:v18 isInput:0 pixelFormat:v19];
    featuresOutput = v11->_featuresOutput;
    v11->_featuresOutput = (ADEspressoImageDescriptor *)v24;
  }
  return v11;
}

@end