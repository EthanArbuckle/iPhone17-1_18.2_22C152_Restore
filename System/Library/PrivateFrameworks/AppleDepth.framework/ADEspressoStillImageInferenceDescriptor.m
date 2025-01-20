@interface ADEspressoStillImageInferenceDescriptor
- (ADEspressoImageDescriptor)colorInput;
- (ADEspressoImageDescriptor)depthOutput;
- (ADEspressoImageDescriptor)jasperInput;
- (ADEspressoStillImageInferenceDescriptor)initWithNetworkProvider:(id)a3;
@end

@implementation ADEspressoStillImageInferenceDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_depthOutput, 0);
  objc_storeStrong((id *)&self->_jasperInput, 0);
  objc_storeStrong((id *)&self->_colorInput, 0);
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

- (ADEspressoStillImageInferenceDescriptor)initWithNetworkProvider:(id)a3
{
  id v4 = a3;
  v5 = [v4 url];
  v6 = [v4 layoutNamesDict];
  v19.receiver = self;
  v19.super_class = (Class)ADEspressoStillImageInferenceDescriptor;
  v7 = [(ADEspressoInferenceDescriptor *)&v19 initWithUrl:v5 layoutNames:v6];

  if (v7)
  {
    uint64_t v8 = [v4 descriptorForBufferOfType:kADEspressoBufferIDColor isInput:1 pixelFormat:1111970369];
    colorInput = v7->_colorInput;
    v7->_colorInput = (ADEspressoImageDescriptor *)v8;

    uint64_t v10 = [v4 descriptorForBufferOfType:kADEspressoBufferIDDisparity isInput:1 pixelFormat:1717856627];
    jasperInput = v7->_jasperInput;
    v7->_jasperInput = (ADEspressoImageDescriptor *)v10;

    if (!v7->_jasperInput)
    {
      uint64_t v12 = [v4 descriptorForBufferOfType:kADEspressoBufferIDJasper isInput:1 pixelFormat:1717855600];
      v13 = v7->_jasperInput;
      v7->_jasperInput = (ADEspressoImageDescriptor *)v12;
    }
    uint64_t v14 = [v4 descriptorForBufferOfType:kADEspressoBufferIDDisparity isInput:0 pixelFormat:1717856627];
    depthOutput = v7->_depthOutput;
    v7->_depthOutput = (ADEspressoImageDescriptor *)v14;

    if (!v7->_depthOutput)
    {
      uint64_t v16 = [v4 descriptorForBufferOfType:kADEspressoBufferIDDepth isInput:0 pixelFormat:1717855600];
      v17 = v7->_depthOutput;
      v7->_depthOutput = (ADEspressoImageDescriptor *)v16;
    }
  }

  return v7;
}

@end