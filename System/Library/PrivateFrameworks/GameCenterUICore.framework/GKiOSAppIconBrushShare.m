@interface GKiOSAppIconBrushShare
- (CGSize)outputSize;
- (CGSize)sizeForInput:(id)a3;
- (void)setOutputSize:(CGSize)a3;
@end

@implementation GKiOSAppIconBrushShare

- (CGSize)sizeForInput:(id)a3
{
  id v4 = a3;
  double width = self->_outputSize.width;
  if (width == 0.0)
  {
    double height = self->_outputSize.height;
    if (height == 0.0)
    {
      v11.receiver = self;
      v11.super_class = (Class)GKiOSAppIconBrushShare;
      [(GKImageBrush *)&v11 sizeForInput:v4];
      double width = v7;
      double height = v8;
    }
  }
  else
  {
    double height = self->_outputSize.height;
  }

  double v9 = width;
  double v10 = height;
  result.double height = v10;
  result.double width = v9;
  return result;
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