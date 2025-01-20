@interface AXMVisionScreenRecognitionOptions
- (BOOL)disableCoagulator;
- (BOOL)isRTL;
- (CGRect)fullRect;
- (CIImage)testingImage;
- (int64_t)orientation;
- (void)setDisableCoagulator:(BOOL)a3;
- (void)setFullRect:(CGRect)a3;
- (void)setIsRTL:(BOOL)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setTestingImage:(id)a3;
@end

@implementation AXMVisionScreenRecognitionOptions

- (CIImage)testingImage
{
  return self->_testingImage;
}

- (void)setTestingImage:(id)a3
{
}

- (BOOL)disableCoagulator
{
  return self->_disableCoagulator;
}

- (void)setDisableCoagulator:(BOOL)a3
{
  self->_disableCoagulator = a3;
}

- (CGRect)fullRect
{
  double x = self->_fullRect.origin.x;
  double y = self->_fullRect.origin.y;
  double width = self->_fullRect.size.width;
  double height = self->_fullRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setFullRect:(CGRect)a3
{
  self->_fullRect = a3;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

- (BOOL)isRTL
{
  return self->_isRTL;
}

- (void)setIsRTL:(BOOL)a3
{
  self->_isRTL = a3;
}

- (void).cxx_destruct
{
}

@end