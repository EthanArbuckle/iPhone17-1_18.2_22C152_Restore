@interface ARPersonDetectionResult
+ (BOOL)supportsSecureCoding;
- (ARPersonDetectionResult)initWithBoundingBox:(CGRect)a3;
- (ARPersonDetectionResult)initWithCoder:(id)a3;
- (CGRect)boundingBox;
- (CGRect)rectScaledToSizeOfPixelBuffer:(__CVBuffer *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setBoundingBox:(CGRect)a3;
@end

@implementation ARPersonDetectionResult

- (ARPersonDetectionResult)initWithBoundingBox:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)ARPersonDetectionResult;
  result = [(ARPersonDetectionResult *)&v8 init];
  if (result)
  {
    result->_boundingBox.origin.CGFloat x = x;
    result->_boundingBox.origin.CGFloat y = y;
    result->_boundingBox.size.CGFloat width = width;
    result->_boundingBox.size.CGFloat height = height;
  }
  return result;
}

- (CGRect)rectScaledToSizeOfPixelBuffer:(__CVBuffer *)a3
{
  size_t Width = CVPixelBufferGetWidth(a3);
  size_t Height = CVPixelBufferGetHeight(a3);
  [(ARPersonDetectionResult *)self boundingBox];
  double v8 = v7 * (double)Width;
  [(ARPersonDetectionResult *)self boundingBox];
  double v10 = v9 * (double)Height;
  [(ARPersonDetectionResult *)self boundingBox];
  double v12 = v11 * (double)Width;
  [(ARPersonDetectionResult *)self boundingBox];
  double v14 = v13 * (double)Height;
  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  result.size.CGFloat height = v14;
  result.size.CGFloat width = v17;
  result.origin.CGFloat y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)[(id)objc_opt_class() allocWithZone:a3];
  if (result)
  {
    CGPoint origin = self->_boundingBox.origin;
    *(CGSize *)((char *)result + 24) = self->_boundingBox.size;
    *(CGPoint *)((char *)result + 8) = origin;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (ARPersonDetectionResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ARPersonDetectionResult;
  v5 = [(ARPersonDetectionResult *)&v7 init];
  if (v5)
  {
    [v4 decodeRectForKey:@"boundingBox"];
    -[ARPersonDetectionResult setBoundingBox:](v5, "setBoundingBox:");
  }

  return v5;
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

- (void)setBoundingBox:(CGRect)a3
{
  self->_boundingBodouble x = a3;
}

@end