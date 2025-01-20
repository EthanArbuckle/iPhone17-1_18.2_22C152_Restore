@interface ADEspressoMonocularV2InferenceDescriptor
- (ADEspressoImageDescriptor)colorInput;
- (ADEspressoImageDescriptor)disparityOutput;
- (ADEspressoImageDescriptor)prevDisparityInput;
- (ADEspressoMonocularV2InferenceDescriptor)initWithNetworkProvider:(id)a3 inputColorFormat:(unsigned int)a4 disparityFormat:(unsigned int)a5;
@end

@implementation ADEspressoMonocularV2InferenceDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disparityOutput, 0);
  objc_storeStrong((id *)&self->_prevDisparityInput, 0);
  objc_storeStrong((id *)&self->_colorInput, 0);
}

- (ADEspressoMonocularV2InferenceDescriptor)initWithNetworkProvider:(id)a3 inputColorFormat:(unsigned int)a4 disparityFormat:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  v9 = [v8 url];
  v10 = [v8 layoutNamesDict];
  v19.receiver = self;
  v19.super_class = (Class)ADEspressoMonocularV2InferenceDescriptor;
  v11 = [(ADEspressoInferenceDescriptor *)&v19 initWithUrl:v9 layoutNames:v10];

  if (v11)
  {
    uint64_t v12 = [v8 descriptorForBufferOfType:kADEspressoBufferIDColor isInput:1 pixelFormat:v6];
    colorInput = v11->_colorInput;
    v11->_colorInput = (ADEspressoImageDescriptor *)v12;

    uint64_t v14 = [v8 descriptorForBufferOfType:kADEspressoBufferIDPrevDisparity isInput:1 pixelFormat:v5];
    prevDisparityInput = v11->_prevDisparityInput;
    v11->_prevDisparityInput = (ADEspressoImageDescriptor *)v14;

    uint64_t v16 = [v8 descriptorForBufferOfType:kADEspressoBufferIDDisparity isInput:0 pixelFormat:v5];
    disparityOutput = v11->_disparityOutput;
    v11->_disparityOutput = (ADEspressoImageDescriptor *)v16;
  }
  return v11;
}

- (ADEspressoImageDescriptor)prevDisparityInput
{
  return self->_prevDisparityInput;
}

- (ADEspressoImageDescriptor)disparityOutput
{
  return self->_disparityOutput;
}

- (ADEspressoImageDescriptor)colorInput
{
  return self->_colorInput;
}

@end