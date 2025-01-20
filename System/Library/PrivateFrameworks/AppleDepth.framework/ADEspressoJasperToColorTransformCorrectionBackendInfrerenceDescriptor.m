@interface ADEspressoJasperToColorTransformCorrectionBackendInfrerenceDescriptor
- (ADEspressoImageDescriptor)colorInput;
- (ADEspressoImageDescriptor)featuresOutput;
- (ADEspressoImageDescriptor)jasperInput;
- (ADEspressoJasperToColorTransformCorrectionBackendInfrerenceDescriptor)initWithNetworkProvider:(id)a3;
@end

@implementation ADEspressoJasperToColorTransformCorrectionBackendInfrerenceDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featuresOutput, 0);
  objc_storeStrong((id *)&self->_jasperInput, 0);
  objc_storeStrong((id *)&self->_colorInput, 0);
}

- (ADEspressoImageDescriptor)featuresOutput
{
  return self->_featuresOutput;
}

- (ADEspressoImageDescriptor)jasperInput
{
  return self->_jasperInput;
}

- (ADEspressoImageDescriptor)colorInput
{
  return self->_colorInput;
}

- (ADEspressoJasperToColorTransformCorrectionBackendInfrerenceDescriptor)initWithNetworkProvider:(id)a3
{
  id v4 = a3;
  v5 = [v4 url];
  v6 = [v4 layoutNamesDict];
  v15.receiver = self;
  v15.super_class = (Class)ADEspressoJasperToColorTransformCorrectionBackendInfrerenceDescriptor;
  v7 = [(ADEspressoInferenceDescriptor *)&v15 initWithUrl:v5 layoutNames:v6];

  if (v7)
  {
    uint64_t v8 = [v4 descriptorForBufferOfType:kADEspressoBufferIDColor isInput:1 pixelFormat:1111970369];
    colorInput = v7->_colorInput;
    v7->_colorInput = (ADEspressoImageDescriptor *)v8;

    uint64_t v10 = [v4 descriptorForBufferOfType:kADEspressoBufferIDJasper isInput:1 pixelFormat:1717855600];
    jasperInput = v7->_jasperInput;
    v7->_jasperInput = (ADEspressoImageDescriptor *)v10;

    uint64_t v12 = [v4 descriptorForBufferOfType:kADEspressoBufferIDOutputOpaqueFeatures isInput:0 pixelFormat:1278226534];
    featuresOutput = v7->_featuresOutput;
    v7->_featuresOutput = (ADEspressoImageDescriptor *)v12;
  }
  return v7;
}

@end