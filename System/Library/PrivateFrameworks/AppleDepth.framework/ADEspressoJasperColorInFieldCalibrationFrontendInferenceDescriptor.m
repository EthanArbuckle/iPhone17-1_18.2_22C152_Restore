@interface ADEspressoJasperColorInFieldCalibrationFrontendInferenceDescriptor
- (ADEspressoImageDescriptor)errorXOutput;
- (ADEspressoImageDescriptor)errorYOutput;
- (ADEspressoImageDescriptor)errorZOutput;
- (ADEspressoImageDescriptor)featuresInput;
- (ADEspressoImageDescriptor)rotationXOutput;
- (ADEspressoImageDescriptor)rotationYOutput;
- (ADEspressoImageDescriptor)rotationZOutput;
- (ADEspressoJasperColorInFieldCalibrationFrontendInferenceDescriptor)initWithNetworkProvider:(id)a3 espressoEngine:(unint64_t)a4 networkFlowType:(int)a5;
@end

@implementation ADEspressoJasperColorInFieldCalibrationFrontendInferenceDescriptor

- (ADEspressoImageDescriptor)rotationZOutput
{
  return self->_rotationZOutput;
}

- (ADEspressoImageDescriptor)errorZOutput
{
  return self->_errorZOutput;
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

- (ADEspressoImageDescriptor)errorYOutput
{
  return self->_errorYOutput;
}

- (ADEspressoImageDescriptor)errorXOutput
{
  return self->_errorXOutput;
}

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

- (ADEspressoJasperColorInFieldCalibrationFrontendInferenceDescriptor)initWithNetworkProvider:(id)a3 espressoEngine:(unint64_t)a4 networkFlowType:(int)a5
{
  id v8 = a3;
  v9 = [v8 url];
  v10 = [v8 layoutNamesDict];
  v28.receiver = self;
  v28.super_class = (Class)ADEspressoJasperColorInFieldCalibrationFrontendInferenceDescriptor;
  v11 = [(ADEspressoInferenceDescriptor *)&v28 initWithUrl:v9 layoutNames:v10];

  if (v11)
  {
    if (a4 - 3 >= 2) {
      uint64_t v12 = 1278226534;
    }
    else {
      uint64_t v12 = 1278226536;
    }
    uint64_t v13 = [v8 descriptorForBuffer:@"frontend_input:0" isInput:1 pixelFormat:v12];
    featuresInput = v11->_featuresInput;
    v11->_featuresInput = (ADEspressoImageDescriptor *)v13;

    uint64_t v15 = [v8 descriptorForBuffer:@"pred_rotx:0" isInput:0 pixelFormat:v12];
    rotationXOutput = v11->_rotationXOutput;
    v11->_rotationXOutput = (ADEspressoImageDescriptor *)v15;

    uint64_t v17 = [v8 descriptorForBuffer:@"pred_roty:0" isInput:0 pixelFormat:v12];
    rotationYOutput = v11->_rotationYOutput;
    v11->_rotationYOutput = (ADEspressoImageDescriptor *)v17;

    uint64_t v19 = [v8 descriptorForBuffer:@"pred_error_rotx:0" isInput:0 pixelFormat:v12];
    errorXOutput = v11->_errorXOutput;
    v11->_errorXOutput = (ADEspressoImageDescriptor *)v19;

    uint64_t v21 = [v8 descriptorForBuffer:@"pred_error_roty:0" isInput:0 pixelFormat:v12];
    errorYOutput = v11->_errorYOutput;
    v11->_errorYOutput = (ADEspressoImageDescriptor *)v21;

    if (a5 == 1)
    {
      uint64_t v23 = [v8 descriptorForBuffer:@"pred_rotz:0" isInput:0 pixelFormat:v12];
      rotationZOutput = v11->_rotationZOutput;
      v11->_rotationZOutput = (ADEspressoImageDescriptor *)v23;

      uint64_t v25 = [v8 descriptorForBuffer:@"pred_error_rotz:0" isInput:0 pixelFormat:v12];
      errorZOutput = v11->_errorZOutput;
      v11->_errorZOutput = (ADEspressoImageDescriptor *)v25;
    }
  }

  return v11;
}

@end