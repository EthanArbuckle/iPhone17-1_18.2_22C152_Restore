@interface BCSVisualCode
- (CGPoint)bottomLeft;
- (CGPoint)bottomRight;
- (CGPoint)topLeft;
- (CGPoint)topRight;
- (CGRect)boundingBox;
- (NSData)rawPayload;
- (NSString)payloadString;
- (double)radius;
- (int64_t)codeType;
- (unint64_t)codeVersion;
- (void)setBottomLeft:(CGPoint)a3;
- (void)setBottomRight:(CGPoint)a3;
- (void)setTopLeft:(CGPoint)a3;
- (void)setTopRight:(CGPoint)a3;
@end

@implementation BCSVisualCode

- (CGPoint)topLeft
{
  double x = self->_topLeft.x;
  double y = self->_topLeft.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setTopLeft:(CGPoint)a3
{
  self->_topLeft = a3;
}

- (CGPoint)topRight
{
  double x = self->_topRight.x;
  double y = self->_topRight.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setTopRight:(CGPoint)a3
{
  self->_topRight = a3;
}

- (CGPoint)bottomRight
{
  double x = self->_bottomRight.x;
  double y = self->_bottomRight.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setBottomRight:(CGPoint)a3
{
  self->_bottomRight = a3;
}

- (CGPoint)bottomLeft
{
  double x = self->_bottomLeft.x;
  double y = self->_bottomLeft.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setBottomLeft:(CGPoint)a3
{
  self->_bottomLeft = a3;
}

- (CGRect)boundingBox
{
  double x = self->_boundingBox.origin.x;
  double y = self->_boundingBox.origin.y;
  double width = self->_boundingBox.size.width;
  double height = self->_boundingBox.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (double)radius
{
  return self->_radius;
}

- (NSString)payloadString
{
  return self->_payloadString;
}

- (NSData)rawPayload
{
  return self->_rawPayload;
}

- (unint64_t)codeVersion
{
  return self->_codeVersion;
}

- (int64_t)codeType
{
  return self->_codeType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawPayload, 0);

  objc_storeStrong((id *)&self->_payloadString, 0);
}

@end