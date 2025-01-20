@interface ADEspressoJasperColorV2InferenceDescriptor
- (ADEspressoImageDescriptor)colorFeaturesOutput;
- (ADEspressoImageDescriptor)colorInput;
- (ADEspressoImageDescriptor)depthFeaturesOutput;
- (ADEspressoImageDescriptor)depthOutput;
- (ADEspressoImageDescriptor)jasperInput;
- (ADEspressoImageDescriptor)prevColorInput;
- (ADEspressoImageDescriptor)prevDepthInput;
- (ADEspressoImageDescriptor)prevUncertaintyInput;
- (ADEspressoImageDescriptor)uncertaintyOutput;
- (ADEspressoJasperColorV2InferenceDescriptor)initWithNetworkProvider:(id)a3 espressoEngine:(unint64_t)a4 lidarType:(unint64_t)a5;
@end

@implementation ADEspressoJasperColorV2InferenceDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorFeaturesOutput, 0);
  objc_storeStrong((id *)&self->_depthFeaturesOutput, 0);
  objc_storeStrong((id *)&self->_uncertaintyOutput, 0);
  objc_storeStrong((id *)&self->_depthOutput, 0);
  objc_storeStrong((id *)&self->_prevUncertaintyInput, 0);
  objc_storeStrong((id *)&self->_prevColorInput, 0);
  objc_storeStrong((id *)&self->_prevDepthInput, 0);
  objc_storeStrong((id *)&self->_jasperInput, 0);
  objc_storeStrong((id *)&self->_colorInput, 0);
}

- (ADEspressoImageDescriptor)colorFeaturesOutput
{
  return self->_colorFeaturesOutput;
}

- (ADEspressoImageDescriptor)depthFeaturesOutput
{
  return self->_depthFeaturesOutput;
}

- (ADEspressoImageDescriptor)uncertaintyOutput
{
  return self->_uncertaintyOutput;
}

- (ADEspressoImageDescriptor)depthOutput
{
  return self->_depthOutput;
}

- (ADEspressoImageDescriptor)prevUncertaintyInput
{
  return self->_prevUncertaintyInput;
}

- (ADEspressoImageDescriptor)prevColorInput
{
  return self->_prevColorInput;
}

- (ADEspressoImageDescriptor)prevDepthInput
{
  return self->_prevDepthInput;
}

- (ADEspressoImageDescriptor)jasperInput
{
  return self->_jasperInput;
}

- (ADEspressoImageDescriptor)colorInput
{
  return self->_colorInput;
}

- (ADEspressoJasperColorV2InferenceDescriptor)initWithNetworkProvider:(id)a3 espressoEngine:(unint64_t)a4 lidarType:(unint64_t)a5
{
  id v8 = a3;
  v9 = v8;
  if (a4 - 3 >= 2) {
    uint64_t v10 = 1717855600;
  }
  else {
    uint64_t v10 = 1751410032;
  }
  if (a4 - 3 >= 2) {
    uint64_t v11 = 1278226534;
  }
  else {
    uint64_t v11 = 1278226536;
  }
  v12 = [v8 url];
  v13 = [v9 layoutNamesDict];
  v36.receiver = self;
  v36.super_class = (Class)ADEspressoJasperColorV2InferenceDescriptor;
  v14 = [(ADEspressoInferenceDescriptor *)&v36 initWithUrl:v12 layoutNames:v13];

  if (v14)
  {
    uint64_t v15 = [v9 descriptorForBufferOfType:kADEspressoBufferIDColor isInput:1 pixelFormat:1111970369];
    colorInput = v14->_colorInput;
    v14->_colorInput = (ADEspressoImageDescriptor *)v15;

    if (a5 == 1)
    {
      uint64_t v17 = [v9 descriptorForBufferOfType:kADEspressoBufferIDPrevColor isInput:1 pixelFormat:1111970369];
      prevColorInput = v14->_prevColorInput;
      v14->_prevColorInput = (ADEspressoImageDescriptor *)v17;

      [v9 descriptorForBufferOfType:kADEspressoBufferIDPrevDepth isInput:1 pixelFormat:v10];
    }
    else
    {
      uint64_t v20 = [v9 descriptorForBufferOfType:kADEspressoBufferIDOpaqueFeatures isInput:1 pixelFormat:v11];
      v21 = v14->_prevColorInput;
      v14->_prevColorInput = (ADEspressoImageDescriptor *)v20;

      [v9 descriptorForBufferOfType:kADEspressoBufferIDOpaqueDepthFeatures isInput:1 pixelFormat:v11];
    uint64_t v19 = };
    prevDepthInput = v14->_prevDepthInput;
    v14->_prevDepthInput = (ADEspressoImageDescriptor *)v19;

    uint64_t v23 = [v9 descriptorForBufferOfType:kADEspressoBufferIDJasper isInput:1 pixelFormat:v10];
    jasperInput = v14->_jasperInput;
    v14->_jasperInput = (ADEspressoImageDescriptor *)v23;

    uint64_t v25 = [v9 descriptorForBufferOfType:kADEspressoBufferIDPrevConfidence isInput:1 pixelFormat:v11];
    prevUncertaintyInput = v14->_prevUncertaintyInput;
    v14->_prevUncertaintyInput = (ADEspressoImageDescriptor *)v25;

    uint64_t v27 = [v9 descriptorForBufferOfType:kADEspressoBufferIDDepth isInput:0 pixelFormat:v10];
    depthOutput = v14->_depthOutput;
    v14->_depthOutput = (ADEspressoImageDescriptor *)v27;

    uint64_t v29 = [v9 descriptorForBufferOfType:kADEspressoBufferIDConfidence[0] isInput:0 pixelFormat:v11];
    uncertaintyOutput = v14->_uncertaintyOutput;
    v14->_uncertaintyOutput = (ADEspressoImageDescriptor *)v29;

    uint64_t v31 = [v9 descriptorForBufferOfType:kADEspressoBufferIDOpaqueDepthFeatures isInput:0 pixelFormat:v11];
    depthFeaturesOutput = v14->_depthFeaturesOutput;
    v14->_depthFeaturesOutput = (ADEspressoImageDescriptor *)v31;

    uint64_t v33 = [v9 descriptorForBufferOfType:kADEspressoBufferIDOpaqueFeatures isInput:0 pixelFormat:v11];
    colorFeaturesOutput = v14->_colorFeaturesOutput;
    v14->_colorFeaturesOutput = (ADEspressoImageDescriptor *)v33;
  }
  return v14;
}

@end