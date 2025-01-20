@interface ADEspressoJasperColorInFieldCalibrationBackendInferenceDescriptor
- (ADEspressoImageDescriptor)colorInput;
- (ADEspressoImageDescriptor)featuresOutput;
- (ADEspressoImageDescriptor)jasperInput;
- (ADEspressoJasperColorInFieldCalibrationBackendInferenceDescriptor)initWithNetworkProvider:(id)a3 espressoEngine:(unint64_t)a4;
@end

@implementation ADEspressoJasperColorInFieldCalibrationBackendInferenceDescriptor

- (ADEspressoImageDescriptor)jasperInput
{
  return self->_jasperInput;
}

- (ADEspressoImageDescriptor)featuresOutput
{
  return self->_featuresOutput;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featuresOutput, 0);
  objc_storeStrong((id *)&self->_jasperInput, 0);
  objc_storeStrong((id *)&self->_colorInput, 0);
}

- (ADEspressoImageDescriptor)colorInput
{
  return self->_colorInput;
}

- (ADEspressoJasperColorInFieldCalibrationBackendInferenceDescriptor)initWithNetworkProvider:(id)a3 espressoEngine:(unint64_t)a4
{
  id v6 = a3;
  v7 = [v6 url];
  v8 = [v6 layoutNamesDict];
  v18.receiver = self;
  v18.super_class = (Class)ADEspressoJasperColorInFieldCalibrationBackendInferenceDescriptor;
  v9 = [(ADEspressoInferenceDescriptor *)&v18 initWithUrl:v7 layoutNames:v8];

  if (v9)
  {
    if (a4 - 3 >= 2) {
      uint64_t v10 = 1717855600;
    }
    else {
      uint64_t v10 = 1751410032;
    }
    uint64_t v11 = [v6 descriptorForBuffer:@"Backend/inputs/image:0" isInput:1 pixelFormat:1111970369];
    colorInput = v9->_colorInput;
    v9->_colorInput = (ADEspressoImageDescriptor *)v11;

    uint64_t v13 = [v6 descriptorForBuffer:@"Backend/inputs/jasper_image:0" isInput:1 pixelFormat:v10];
    jasperInput = v9->_jasperInput;
    v9->_jasperInput = (ADEspressoImageDescriptor *)v13;

    uint64_t v15 = [v6 descriptorForBuffer:@"backend_output:0" isInput:0 pixelFormat:v10];
    featuresOutput = v9->_featuresOutput;
    v9->_featuresOutput = (ADEspressoImageDescriptor *)v15;
  }
  return v9;
}

@end