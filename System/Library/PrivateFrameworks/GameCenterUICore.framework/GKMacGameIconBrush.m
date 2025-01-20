@interface GKMacGameIconBrush
- (CGSize)outputSize;
- (id)renderedImageIdentifier;
- (void)setOutputSize:(CGSize)a3;
@end

@implementation GKMacGameIconBrush

- (id)renderedImageIdentifier
{
  [(GKMacGameIconBrush *)self outputSize];
  return NSStringFromCGSize(*(CGSize *)&v2);
}

- (CGSize)outputSize
{
  double width = self->_outputSize.width;
  double height = self->_outputSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setOutputSize:(CGSize)a3
{
  self->_outputSize = a3;
}

@end