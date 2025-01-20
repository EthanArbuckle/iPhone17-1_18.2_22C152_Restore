@interface ADEspressoPearlColorInFieldCalibrationFrontendInferenceDescriptor
- (ADEspressoImageDescriptor)errorXOutput;
- (ADEspressoImageDescriptor)errorYOutput;
- (ADEspressoImageDescriptor)errorZOutput;
- (ADEspressoImageDescriptor)featuresInput;
- (ADEspressoImageDescriptor)rotationXOutput;
- (ADEspressoImageDescriptor)rotationYOutput;
- (ADEspressoImageDescriptor)rotationZOutput;
- (ADEspressoPearlColorInFieldCalibrationFrontendInferenceDescriptor)initWithNetworkProvider:(id)a3 espressoEngine:(unint64_t)a4 networkFlowType:(int)a5;
@end

@implementation ADEspressoPearlColorInFieldCalibrationFrontendInferenceDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorZOutput, 0);
  objc_storeStrong((id *)&self->_errorYOutput, 0);
  objc_storeStrong((id *)&self->_errorXOutput, 0);
  objc_storeStrong((id *)&self->_rotationZOutput, 0);
  objc_storeStrong((id *)&self->_rotationYOutput, 0);
  objc_storeStrong((id *)&self->_rotationXOutput, 0);
  objc_storeStrong((id *)&self->_featuresInput, 0);
}

- (ADEspressoImageDescriptor)errorZOutput
{
  return self->_errorZOutput;
}

- (ADEspressoImageDescriptor)errorYOutput
{
  return self->_errorYOutput;
}

- (ADEspressoImageDescriptor)errorXOutput
{
  return self->_errorXOutput;
}

- (ADEspressoImageDescriptor)rotationZOutput
{
  return self->_rotationZOutput;
}

- (ADEspressoImageDescriptor)rotationYOutput
{
  return self->_rotationYOutput;
}

- (ADEspressoImageDescriptor)rotationXOutput
{
  return self->_rotationXOutput;
}

- (ADEspressoImageDescriptor)featuresInput
{
  return self->_featuresInput;
}

- (ADEspressoPearlColorInFieldCalibrationFrontendInferenceDescriptor)initWithNetworkProvider:(id)a3 espressoEngine:(unint64_t)a4 networkFlowType:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  v9 = [v8 url];
  v10 = [v8 layoutNamesDict];
  v35.receiver = self;
  v35.super_class = (Class)ADEspressoPearlColorInFieldCalibrationFrontendInferenceDescriptor;
  v11 = [(ADEspressoInferenceDescriptor *)&v35 initWithUrl:v9 layoutNames:v10];

  if (v11)
  {
    if (a4 - 3 >= 2) {
      uint64_t v12 = 1278226534;
    }
    else {
      uint64_t v12 = 1278226536;
    }
    rotationZOutput = v11->_rotationZOutput;
    v11->_rotationZOutput = 0;

    errorZOutput = v11->_errorZOutput;
    v11->_errorZOutput = 0;

    if (+[ADPearlColorInFieldCalibrationPipeline isZUsedFor:v5])
    {
      uint64_t v15 = [v8 descriptorForBuffer:@"rotz" isInput:0 pixelFormat:v12];
      v16 = v11->_rotationZOutput;
      v11->_rotationZOutput = (ADEspressoImageDescriptor *)v15;

      uint64_t v17 = [v8 descriptorForBuffer:@"stdz" isInput:0 pixelFormat:v12];
      v18 = v11->_errorZOutput;
      v11->_errorZOutput = (ADEspressoImageDescriptor *)v17;

      v19 = @"stdy";
      v20 = @"stdx";
      v21 = @"roty";
      v22 = @"rotx";
      v23 = @"feat_vec_tb";
    }
    else
    {
      v19 = @"pred_error_roty:0";
      v20 = @"pred_error_rotx:0";
      v21 = @"pred_roty:0";
      v22 = @"pred_rotx:0";
      v23 = @"frontend_input:0";
    }
    uint64_t v24 = [v8 descriptorForBuffer:v23 isInput:1 pixelFormat:v12];
    featuresInput = v11->_featuresInput;
    v11->_featuresInput = (ADEspressoImageDescriptor *)v24;

    uint64_t v26 = [v8 descriptorForBuffer:v22 isInput:0 pixelFormat:v12];
    rotationXOutput = v11->_rotationXOutput;
    v11->_rotationXOutput = (ADEspressoImageDescriptor *)v26;

    uint64_t v28 = [v8 descriptorForBuffer:v21 isInput:0 pixelFormat:v12];
    rotationYOutput = v11->_rotationYOutput;
    v11->_rotationYOutput = (ADEspressoImageDescriptor *)v28;

    uint64_t v30 = [v8 descriptorForBuffer:v20 isInput:0 pixelFormat:v12];
    errorXOutput = v11->_errorXOutput;
    v11->_errorXOutput = (ADEspressoImageDescriptor *)v30;

    uint64_t v32 = [v8 descriptorForBuffer:v19 isInput:0 pixelFormat:v12];
    errorYOutput = v11->_errorYOutput;
    v11->_errorYOutput = (ADEspressoImageDescriptor *)v32;
  }
  return v11;
}

@end