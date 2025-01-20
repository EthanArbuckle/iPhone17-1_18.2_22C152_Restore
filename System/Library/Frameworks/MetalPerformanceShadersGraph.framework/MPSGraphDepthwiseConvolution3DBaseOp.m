@interface MPSGraphDepthwiseConvolution3DBaseOp
- (MPSGraphDepthwiseConvolution3DBaseOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 descriptor:(id)a6 name:(id)a7;
@end

@implementation MPSGraphDepthwiseConvolution3DBaseOp

- (MPSGraphDepthwiseConvolution3DBaseOp)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 descriptor:(id)a6 name:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = (MPSGraphDepthwiseConvolution3DOpDescriptor *)[v15 copy];
  desc = self->_desc;
  self->_desc = v17;

  v19 = [(MPSGraphOperation *)self initWithGraph:v12 inputTensors:v13 controlDependencies:v14 name:v16];
  return v19;
}

- (void).cxx_destruct
{
}

@end