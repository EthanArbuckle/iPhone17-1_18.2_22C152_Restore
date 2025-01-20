@interface ADEspressoMonocularInferenceDescriptor
- (ADEspressoImageDescriptor)colorInput;
- (ADEspressoImageDescriptor)depthOutput;
- (ADEspressoMonocularInferenceDescriptor)initWithNetworkProvider:(id)a3;
@end

@implementation ADEspressoMonocularInferenceDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_depthOutput, 0);
  objc_storeStrong((id *)&self->_colorInput, 0);
}

- (ADEspressoImageDescriptor)depthOutput
{
  return self->_depthOutput;
}

- (ADEspressoImageDescriptor)colorInput
{
  return self->_colorInput;
}

- (ADEspressoMonocularInferenceDescriptor)initWithNetworkProvider:(id)a3
{
  id v4 = a3;
  v5 = [v4 url];
  v6 = [v4 layoutNamesDict];
  v13.receiver = self;
  v13.super_class = (Class)ADEspressoMonocularInferenceDescriptor;
  v7 = [(ADEspressoInferenceDescriptor *)&v13 initWithUrl:v5 layoutNames:v6];

  if (v7)
  {
    uint64_t v8 = [v4 descriptorForBufferOfType:kADEspressoBufferIDColor isInput:1 pixelFormat:1111970369];
    colorInput = v7->_colorInput;
    v7->_colorInput = (ADEspressoImageDescriptor *)v8;

    uint64_t v10 = [v4 descriptorForBufferOfType:kADEspressoBufferIDDepth isInput:0 pixelFormat:1717855600];
    depthOutput = v7->_depthOutput;
    v7->_depthOutput = (ADEspressoImageDescriptor *)v10;
  }
  return v7;
}

@end