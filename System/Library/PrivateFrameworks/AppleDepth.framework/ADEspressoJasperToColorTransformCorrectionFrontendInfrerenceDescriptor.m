@interface ADEspressoJasperToColorTransformCorrectionFrontendInfrerenceDescriptor
- (ADEspressoImageDescriptor)anglesOutput;
- (ADEspressoImageDescriptor)errorsOutput;
- (ADEspressoImageDescriptor)featuresInput;
- (ADEspressoJasperToColorTransformCorrectionFrontendInfrerenceDescriptor)initWithNetworkProvider:(id)a3;
@end

@implementation ADEspressoJasperToColorTransformCorrectionFrontendInfrerenceDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorsOutput, 0);
  objc_storeStrong((id *)&self->_anglesOutput, 0);
  objc_storeStrong((id *)&self->_featuresInput, 0);
}

- (ADEspressoImageDescriptor)errorsOutput
{
  return self->_errorsOutput;
}

- (ADEspressoImageDescriptor)anglesOutput
{
  return self->_anglesOutput;
}

- (ADEspressoImageDescriptor)featuresInput
{
  return self->_featuresInput;
}

- (ADEspressoJasperToColorTransformCorrectionFrontendInfrerenceDescriptor)initWithNetworkProvider:(id)a3
{
  id v4 = a3;
  v5 = [v4 url];
  v6 = [v4 layoutNamesDict];
  v15.receiver = self;
  v15.super_class = (Class)ADEspressoJasperToColorTransformCorrectionFrontendInfrerenceDescriptor;
  v7 = [(ADEspressoInferenceDescriptor *)&v15 initWithUrl:v5 layoutNames:v6];

  if (v7)
  {
    uint64_t v8 = [v4 descriptorForBufferOfType:kADEspressoBufferIDInputOpaqueFeatures isInput:1 pixelFormat:1278226534];
    featuresInput = v7->_featuresInput;
    v7->_featuresInput = (ADEspressoImageDescriptor *)v8;

    uint64_t v10 = [v4 descriptorForBufferOfType:kADEspressoBufferIDAnglesVector isInput:0 pixelFormat:1278226534];
    anglesOutput = v7->_anglesOutput;
    v7->_anglesOutput = (ADEspressoImageDescriptor *)v10;

    uint64_t v12 = [v4 descriptorForBufferOfType:kADEspressoBufferIDErrorsVector isInput:0 pixelFormat:1278226534];
    errorsOutput = v7->_errorsOutput;
    v7->_errorsOutput = (ADEspressoImageDescriptor *)v12;
  }
  return v7;
}

@end