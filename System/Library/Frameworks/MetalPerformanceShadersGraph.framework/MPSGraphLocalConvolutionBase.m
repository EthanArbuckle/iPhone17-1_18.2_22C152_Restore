@interface MPSGraphLocalConvolutionBase
- (MPSGraphLocalConvolutionBase)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 dataLayout:(unint64_t)a6 kernelShape:(id)a7 dilationRateInX:(unint64_t)a8 dilationRateInY:(unint64_t)a9 name:(id)a10;
@end

@implementation MPSGraphLocalConvolutionBase

- (MPSGraphLocalConvolutionBase)initWithGraph:(id)a3 inputTensors:(id)a4 controlDependencies:(id)a5 dataLayout:(unint64_t)a6 kernelShape:(id)a7 dilationRateInX:(unint64_t)a8 dilationRateInY:(unint64_t)a9 name:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a7;
  id v20 = a10;
  self->_dataLayout = a6;
  v21 = (NSArray *)[v19 copy];
  kernelShape = self->_kernelShape;
  self->_kernelShape = v21;

  self->_dilationRateInX = a8;
  self->_dilationRateInY = a9;
  v23 = [(MPSGraphOperation *)self initWithGraph:v16 inputTensors:v17 controlDependencies:v18 name:v20];

  return v23;
}

- (void).cxx_destruct
{
}

@end