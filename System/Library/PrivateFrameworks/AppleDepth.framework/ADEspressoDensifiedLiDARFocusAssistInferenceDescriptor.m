@interface ADEspressoDensifiedLiDARFocusAssistInferenceDescriptor
- (ADEspressoDensifiedLiDARFocusAssistInferenceDescriptor)initWithNetworkProvider:(id)a3 espressoEngine:(unint64_t)a4;
- (ADEspressoImageDescriptor)colorInput;
- (ADEspressoImageDescriptor)depthOutput;
- (ADEspressoImageDescriptor)lidarInput;
- (ADEspressoImageDescriptor)uncertaintyOutput;
@end

@implementation ADEspressoDensifiedLiDARFocusAssistInferenceDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uncertaintyOutput, 0);
  objc_storeStrong((id *)&self->_depthOutput, 0);
  objc_storeStrong((id *)&self->_lidarInput, 0);
  objc_storeStrong((id *)&self->_colorInput, 0);
}

- (ADEspressoImageDescriptor)uncertaintyOutput
{
  return self->_uncertaintyOutput;
}

- (ADEspressoImageDescriptor)depthOutput
{
  return self->_depthOutput;
}

- (ADEspressoImageDescriptor)lidarInput
{
  return self->_lidarInput;
}

- (ADEspressoImageDescriptor)colorInput
{
  return self->_colorInput;
}

- (ADEspressoDensifiedLiDARFocusAssistInferenceDescriptor)initWithNetworkProvider:(id)a3 espressoEngine:(unint64_t)a4
{
  id v6 = a3;
  v7 = v6;
  if (a4 - 3 >= 2) {
    uint64_t v8 = 1717855600;
  }
  else {
    uint64_t v8 = 1751410032;
  }
  if (a4 - 3 >= 2) {
    uint64_t v9 = 1278226534;
  }
  else {
    uint64_t v9 = 1278226536;
  }
  v10 = [v6 url];
  v11 = [v7 layoutNamesDict];
  v22.receiver = self;
  v22.super_class = (Class)ADEspressoDensifiedLiDARFocusAssistInferenceDescriptor;
  v12 = [(ADEspressoInferenceDescriptor *)&v22 initWithUrl:v10 layoutNames:v11];

  if (v12)
  {
    uint64_t v13 = [v7 descriptorForBufferOfType:kADEspressoBufferIDColor isInput:1 pixelFormat:1111970369];
    colorInput = v12->_colorInput;
    v12->_colorInput = (ADEspressoImageDescriptor *)v13;

    uint64_t v15 = [v7 descriptorForBufferOfType:kADEspressoBufferIDJasper isInput:1 pixelFormat:v8];
    lidarInput = v12->_lidarInput;
    v12->_lidarInput = (ADEspressoImageDescriptor *)v15;

    uint64_t v17 = [v7 descriptorForBufferOfType:kADEspressoBufferIDDepth isInput:0 pixelFormat:v8];
    depthOutput = v12->_depthOutput;
    v12->_depthOutput = (ADEspressoImageDescriptor *)v17;

    uint64_t v19 = [v7 descriptorForBufferOfType:kADEspressoBufferIDConfidence[0] isInput:0 pixelFormat:v9];
    uncertaintyOutput = v12->_uncertaintyOutput;
    v12->_uncertaintyOutput = (ADEspressoImageDescriptor *)v19;
  }
  return v12;
}

@end