@interface CNPhotosPosterConfigurationReaderFaceRectResult
- (CGRect)faceRect;
- (double)percentFromTop;
- (void)setFaceRect:(CGRect)a3;
- (void)setPercentFromTop:(double)a3;
@end

@implementation CNPhotosPosterConfigurationReaderFaceRectResult

- (void)setFaceRect:(CGRect)a3
{
  self->_faceRect = a3;
}

- (CGRect)faceRect
{
  double x = self->_faceRect.origin.x;
  double y = self->_faceRect.origin.y;
  double width = self->_faceRect.size.width;
  double height = self->_faceRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPercentFromTop:(double)a3
{
  self->_percentFromTop = a3;
}

- (double)percentFromTop
{
  return self->_percentFromTop;
}

@end