@interface ADEspressoJasperColorInferenceDescriptor
- (ADEspressoImageDescriptor)alphaMapOutput;
- (ADEspressoImageDescriptor)colorInput;
- (ADEspressoImageDescriptor)confidenceOutput;
- (ADEspressoImageDescriptor)depthOutput;
- (ADEspressoImageDescriptor)jasperInput;
- (ADEspressoImageDescriptor)normalsOutput;
- (ADEspressoJasperColorInferenceDescriptor)initWithNetworkProvider:(id)a3;
@end

@implementation ADEspressoJasperColorInferenceDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_normalsOutput, 0);
  objc_storeStrong((id *)&self->_alphaMapOutput, 0);
  objc_storeStrong((id *)&self->_confidenceOutput, 0);
  objc_storeStrong((id *)&self->_depthOutput, 0);
  objc_storeStrong((id *)&self->_jasperInput, 0);
  objc_storeStrong((id *)&self->_colorInput, 0);
}

- (ADEspressoImageDescriptor)normalsOutput
{
  return self->_normalsOutput;
}

- (ADEspressoImageDescriptor)alphaMapOutput
{
  return self->_alphaMapOutput;
}

- (ADEspressoImageDescriptor)confidenceOutput
{
  return self->_confidenceOutput;
}

- (ADEspressoImageDescriptor)depthOutput
{
  return self->_depthOutput;
}

- (ADEspressoImageDescriptor)jasperInput
{
  return self->_jasperInput;
}

- (ADEspressoImageDescriptor)colorInput
{
  return self->_colorInput;
}

- (ADEspressoJasperColorInferenceDescriptor)initWithNetworkProvider:(id)a3
{
  id v4 = a3;
  v5 = [v4 url];
  v6 = [v4 layoutNamesDict];
  v21.receiver = self;
  v21.super_class = (Class)ADEspressoJasperColorInferenceDescriptor;
  v7 = [(ADEspressoInferenceDescriptor *)&v21 initWithUrl:v5 layoutNames:v6];

  if (v7)
  {
    uint64_t v8 = [v4 descriptorForBufferOfType:kADEspressoBufferIDColor isInput:1 pixelFormat:1111970369];
    colorInput = v7->_colorInput;
    v7->_colorInput = (ADEspressoImageDescriptor *)v8;

    uint64_t v10 = [v4 descriptorForBufferOfType:kADEspressoBufferIDJasper isInput:1 pixelFormat:1717855600];
    jasperInput = v7->_jasperInput;
    v7->_jasperInput = (ADEspressoImageDescriptor *)v10;

    uint64_t v12 = [v4 descriptorForBufferOfType:kADEspressoBufferIDDepth isInput:0 pixelFormat:1717855600];
    depthOutput = v7->_depthOutput;
    v7->_depthOutput = (ADEspressoImageDescriptor *)v12;

    uint64_t v14 = [v4 descriptorForBufferOfType:kADEspressoBufferIDConfidence[0] isInput:0 pixelFormat:1278226534];
    confidenceOutput = v7->_confidenceOutput;
    v7->_confidenceOutput = (ADEspressoImageDescriptor *)v14;

    uint64_t v16 = [v4 descriptorForBufferOfType:kADEspressoBufferIDAlphaMap isInput:0 pixelFormat:1278226534];
    alphaMapOutput = v7->_alphaMapOutput;
    v7->_alphaMapOutput = (ADEspressoImageDescriptor *)v16;

    uint64_t v18 = [v4 descriptorForBufferOfType:kADEspressoBufferIDNormals isInput:0 pixelFormat:1380410945];
    normalsOutput = v7->_normalsOutput;
    v7->_normalsOutput = (ADEspressoImageDescriptor *)v18;
  }
  return v7;
}

@end