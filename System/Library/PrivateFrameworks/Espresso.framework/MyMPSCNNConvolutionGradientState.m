@interface MyMPSCNNConvolutionGradientState
- (unint64_t)sourceHeight;
- (unint64_t)sourceWidth;
@end

@implementation MyMPSCNNConvolutionGradientState

- (unint64_t)sourceHeight
{
  return self->_sourceHeight;
}

- (unint64_t)sourceWidth
{
  return self->_sourceWidth;
}

@end