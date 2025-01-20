@interface ADEspressoStereoInferenceDescriptor
- (ADEspressoImageDescriptor)auxiliaryInput;
- (ADEspressoImageDescriptor)auxiliaryNoiseSigmaInput;
- (ADEspressoImageDescriptor)disparityOutput;
- (ADEspressoImageDescriptor)referenceInput;
- (ADEspressoImageDescriptor)referenceNoiseSigmaInput;
- (ADEspressoStereoInferenceDescriptor)initWithNetworkProvider:(id)a3 inputColorFormat:(unsigned int)a4 outputDisparityFormat:(unsigned int)a5;
@end

@implementation ADEspressoStereoInferenceDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disparityOutput, 0);
  objc_storeStrong((id *)&self->_auxiliaryNoiseSigmaInput, 0);
  objc_storeStrong((id *)&self->_referenceNoiseSigmaInput, 0);
  objc_storeStrong((id *)&self->_auxiliaryInput, 0);
  objc_storeStrong((id *)&self->_referenceInput, 0);
}

- (ADEspressoImageDescriptor)disparityOutput
{
  return self->_disparityOutput;
}

- (ADEspressoImageDescriptor)auxiliaryNoiseSigmaInput
{
  return self->_auxiliaryNoiseSigmaInput;
}

- (ADEspressoImageDescriptor)referenceNoiseSigmaInput
{
  return self->_referenceNoiseSigmaInput;
}

- (ADEspressoImageDescriptor)auxiliaryInput
{
  return self->_auxiliaryInput;
}

- (ADEspressoImageDescriptor)referenceInput
{
  return self->_referenceInput;
}

- (ADEspressoStereoInferenceDescriptor)initWithNetworkProvider:(id)a3 inputColorFormat:(unsigned int)a4 outputDisparityFormat:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  v9 = [v8 url];
  v10 = [v8 layoutNamesDict];
  v21.receiver = self;
  v21.super_class = (Class)ADEspressoStereoInferenceDescriptor;
  v11 = [(ADEspressoInferenceDescriptor *)&v21 initWithUrl:v9 layoutNames:v10];

  if (v11)
  {
    uint64_t v12 = [v8 descriptorForBufferOfType:kADEspressoBufferIDRefColor isInput:1 pixelFormat:v6];
    referenceInput = v11->_referenceInput;
    v11->_referenceInput = (ADEspressoImageDescriptor *)v12;

    uint64_t v14 = [v8 descriptorForBufferOfType:kADEspressoBufferIDAuxColor isInput:1 pixelFormat:v6];
    auxiliaryInput = v11->_auxiliaryInput;
    v11->_auxiliaryInput = (ADEspressoImageDescriptor *)v14;

    uint64_t v16 = [v8 descriptorForBufferOfType:kADEspressoBufferIDDisparity isInput:0 pixelFormat:v5];
    disparityOutput = v11->_disparityOutput;
    v11->_disparityOutput = (ADEspressoImageDescriptor *)v16;

    referenceNoiseSigmaInput = v11->_referenceNoiseSigmaInput;
    v11->_referenceNoiseSigmaInput = 0;

    auxiliaryNoiseSigmaInput = v11->_auxiliaryNoiseSigmaInput;
    v11->_auxiliaryNoiseSigmaInput = 0;
  }
  return v11;
}

@end