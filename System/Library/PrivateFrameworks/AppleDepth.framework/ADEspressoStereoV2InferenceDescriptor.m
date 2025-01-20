@interface ADEspressoStereoV2InferenceDescriptor
- (ADEspressoImageDescriptor)auxiliaryInput;
- (ADEspressoImageDescriptor)colorFeaturesOutput;
- (ADEspressoImageDescriptor)depthFeaturesOutput;
- (ADEspressoImageDescriptor)disparityOutput;
- (ADEspressoImageDescriptor)prevColorFeaturesInput;
- (ADEspressoImageDescriptor)prevDepthFeaturesInput;
- (ADEspressoImageDescriptor)referenceInput;
- (ADEspressoImageDescriptor)temporalSmoothingCurrentFeaturesRatioMinInput;
- (ADEspressoImageDescriptor)temporalSmoothingPreviousFeaturesRatioMinInput;
- (ADEspressoStereoV2InferenceDescriptor)initWithNetworkProvider:(id)a3 inputColorFormat:(unsigned int)a4 outputDisparityFormat:(unsigned int)a5;
@end

@implementation ADEspressoStereoV2InferenceDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorFeaturesOutput, 0);
  objc_storeStrong((id *)&self->_depthFeaturesOutput, 0);
  objc_storeStrong((id *)&self->_disparityOutput, 0);
  objc_storeStrong((id *)&self->_temporalSmoothingPreviousFeaturesRatioMinInput, 0);
  objc_storeStrong((id *)&self->_temporalSmoothingCurrentFeaturesRatioMinInput, 0);
  objc_storeStrong((id *)&self->_prevColorFeaturesInput, 0);
  objc_storeStrong((id *)&self->_prevDepthFeaturesInput, 0);
  objc_storeStrong((id *)&self->_auxiliaryInput, 0);
  objc_storeStrong((id *)&self->_referenceInput, 0);
}

- (ADEspressoImageDescriptor)colorFeaturesOutput
{
  return self->_colorFeaturesOutput;
}

- (ADEspressoImageDescriptor)depthFeaturesOutput
{
  return self->_depthFeaturesOutput;
}

- (ADEspressoImageDescriptor)disparityOutput
{
  return self->_disparityOutput;
}

- (ADEspressoImageDescriptor)temporalSmoothingPreviousFeaturesRatioMinInput
{
  return self->_temporalSmoothingPreviousFeaturesRatioMinInput;
}

- (ADEspressoImageDescriptor)temporalSmoothingCurrentFeaturesRatioMinInput
{
  return self->_temporalSmoothingCurrentFeaturesRatioMinInput;
}

- (ADEspressoImageDescriptor)prevColorFeaturesInput
{
  return self->_prevColorFeaturesInput;
}

- (ADEspressoImageDescriptor)prevDepthFeaturesInput
{
  return self->_prevDepthFeaturesInput;
}

- (ADEspressoImageDescriptor)auxiliaryInput
{
  return self->_auxiliaryInput;
}

- (ADEspressoImageDescriptor)referenceInput
{
  return self->_referenceInput;
}

- (ADEspressoStereoV2InferenceDescriptor)initWithNetworkProvider:(id)a3 inputColorFormat:(unsigned int)a4 outputDisparityFormat:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  v9 = v8;
  if (v5 == 1751411059) {
    uint64_t v10 = 1278226536;
  }
  else {
    uint64_t v10 = 1278226534;
  }
  v11 = [v8 url];
  v12 = [v9 layoutNamesDict];
  v33.receiver = self;
  v33.super_class = (Class)ADEspressoStereoV2InferenceDescriptor;
  v13 = [(ADEspressoInferenceDescriptor *)&v33 initWithUrl:v11 layoutNames:v12];

  if (v13)
  {
    uint64_t v14 = [v9 descriptorForBufferOfType:kADEspressoBufferIDRefColor isInput:1 pixelFormat:v6];
    referenceInput = v13->_referenceInput;
    v13->_referenceInput = (ADEspressoImageDescriptor *)v14;

    uint64_t v16 = [v9 descriptorForBufferOfType:kADEspressoBufferIDAuxColor isInput:1 pixelFormat:v6];
    auxiliaryInput = v13->_auxiliaryInput;
    v13->_auxiliaryInput = (ADEspressoImageDescriptor *)v16;

    uint64_t v18 = [v9 descriptorForBufferOfType:kADEspressoBufferIDOpaqueDepthFeatures isInput:1 pixelFormat:v10];
    prevDepthFeaturesInput = v13->_prevDepthFeaturesInput;
    v13->_prevDepthFeaturesInput = (ADEspressoImageDescriptor *)v18;

    uint64_t v20 = [v9 descriptorForBufferOfType:kADEspressoBufferIDOpaqueFeatures isInput:1 pixelFormat:v10];
    prevColorFeaturesInput = v13->_prevColorFeaturesInput;
    v13->_prevColorFeaturesInput = (ADEspressoImageDescriptor *)v20;

    uint64_t v22 = [v9 descriptorForBufferOfType:kADEspressoBufferIDTemporalSmoothingCurrentFeaturesRatioMin isInput:1 pixelFormat:v10];
    temporalSmoothingCurrentFeaturesRatioMinInput = v13->_temporalSmoothingCurrentFeaturesRatioMinInput;
    v13->_temporalSmoothingCurrentFeaturesRatioMinInput = (ADEspressoImageDescriptor *)v22;

    uint64_t v24 = [v9 descriptorForBufferOfType:kADEspressoBufferIDTemporalSmoothingPreviousFeaturesRatioMin isInput:1 pixelFormat:v10];
    temporalSmoothingPreviousFeaturesRatioMinInput = v13->_temporalSmoothingPreviousFeaturesRatioMinInput;
    v13->_temporalSmoothingPreviousFeaturesRatioMinInput = (ADEspressoImageDescriptor *)v24;

    uint64_t v26 = [v9 descriptorForBufferOfType:kADEspressoBufferIDDisparity isInput:0 pixelFormat:v5];
    disparityOutput = v13->_disparityOutput;
    v13->_disparityOutput = (ADEspressoImageDescriptor *)v26;

    uint64_t v28 = [v9 descriptorForBufferOfType:kADEspressoBufferIDOpaqueDepthFeatures isInput:0 pixelFormat:v10];
    depthFeaturesOutput = v13->_depthFeaturesOutput;
    v13->_depthFeaturesOutput = (ADEspressoImageDescriptor *)v28;

    uint64_t v30 = [v9 descriptorForBufferOfType:kADEspressoBufferIDOpaqueFeatures isInput:0 pixelFormat:v10];
    colorFeaturesOutput = v13->_colorFeaturesOutput;
    v13->_colorFeaturesOutput = (ADEspressoImageDescriptor *)v30;
  }
  return v13;
}

@end