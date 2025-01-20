@interface ADEspressoPCEDisparityColorInferenceDescriptor
- (ADEspressoImageDescriptor)colorInput;
- (ADEspressoImageDescriptor)disparityInput;
- (ADEspressoImageDescriptor)disparityOutput;
- (ADEspressoImageDescriptor)featuresOutput;
- (ADEspressoImageDescriptor)prevDisparityInput;
- (ADEspressoImageDescriptor)prevFeaturesInput;
- (ADEspressoPCEDisparityColorInferenceDescriptor)initWithNetworkProvider:(id)a3 inputColorFormat:(unsigned int)a4 disparityFormat:(unsigned int)a5;
@end

@implementation ADEspressoPCEDisparityColorInferenceDescriptor

- (ADEspressoPCEDisparityColorInferenceDescriptor)initWithNetworkProvider:(id)a3 inputColorFormat:(unsigned int)a4 disparityFormat:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  v9 = [v8 url];
  v10 = [v8 layoutNamesDict];
  v26.receiver = self;
  v26.super_class = (Class)ADEspressoPCEDisparityColorInferenceDescriptor;
  v11 = [(ADEspressoInferenceDescriptor *)&v26 initWithUrl:v9 layoutNames:v10];

  if (v11)
  {
    if (v5 == 1751411059) {
      uint64_t v12 = 1278226536;
    }
    else {
      uint64_t v12 = 1278226534;
    }
    uint64_t v13 = [v8 descriptorForBufferOfType:kADEspressoBufferIDColor isInput:1 pixelFormat:v6];
    colorInput = v11->_colorInput;
    v11->_colorInput = (ADEspressoImageDescriptor *)v13;

    uint64_t v15 = [v8 descriptorForBufferOfType:kADEspressoBufferIDDisparity isInput:1 pixelFormat:v5];
    disparityInput = v11->_disparityInput;
    v11->_disparityInput = (ADEspressoImageDescriptor *)v15;

    uint64_t v17 = [v8 descriptorForBufferOfType:kADEspressoBufferIDPrevDisparity isInput:1 pixelFormat:v5];
    prevDisparityInput = v11->_prevDisparityInput;
    v11->_prevDisparityInput = (ADEspressoImageDescriptor *)v17;

    uint64_t v19 = [v8 descriptorForBufferOfType:kADEspressoBufferIDInputOpaqueFeatures isInput:1 pixelFormat:v12];
    prevFeaturesInput = v11->_prevFeaturesInput;
    v11->_prevFeaturesInput = (ADEspressoImageDescriptor *)v19;

    uint64_t v21 = [v8 descriptorForBufferOfType:kADEspressoBufferIDDisparity isInput:0 pixelFormat:v5];
    disparityOutput = v11->_disparityOutput;
    v11->_disparityOutput = (ADEspressoImageDescriptor *)v21;

    uint64_t v23 = [v8 descriptorForBufferOfType:kADEspressoBufferIDOutputOpaqueFeatures isInput:0 pixelFormat:v12];
    featuresOutput = v11->_featuresOutput;
    v11->_featuresOutput = (ADEspressoImageDescriptor *)v23;
  }
  return v11;
}

- (ADEspressoImageDescriptor)featuresOutput
{
  return self->_featuresOutput;
}

- (ADEspressoImageDescriptor)prevDisparityInput
{
  return self->_prevDisparityInput;
}

- (ADEspressoImageDescriptor)disparityOutput
{
  return self->_disparityOutput;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featuresOutput, 0);
  objc_storeStrong((id *)&self->_disparityOutput, 0);
  objc_storeStrong((id *)&self->_prevFeaturesInput, 0);
  objc_storeStrong((id *)&self->_prevDisparityInput, 0);
  objc_storeStrong((id *)&self->_disparityInput, 0);
  objc_storeStrong((id *)&self->_colorInput, 0);
}

- (ADEspressoImageDescriptor)disparityInput
{
  return self->_disparityInput;
}

- (ADEspressoImageDescriptor)colorInput
{
  return self->_colorInput;
}

- (ADEspressoImageDescriptor)prevFeaturesInput
{
  return self->_prevFeaturesInput;
}

@end