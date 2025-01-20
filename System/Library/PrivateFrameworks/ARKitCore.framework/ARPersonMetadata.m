@interface ARPersonMetadata
+ (BOOL)supportsSecureCoding;
- (ARPersonMetadata)initWithBoundingBox:(CGRect)a3 meanDepth:(double)a4;
- (ARPersonMetadata)initWithCoder:(id)a3;
- (ARPersonMetadata)initWithDepthBasedPersonDetectionResult:(id)a3;
- (CGRect)boundingBox;
- (CGRect)rectScaledToSize:(CGSize)a3;
- (double)meanDepth;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ARPersonMetadata

- (ARPersonMetadata)initWithDepthBasedPersonDetectionResult:(id)a3
{
  id v4 = a3;
  [v4 boundingBox];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [v4 meanValue];
  float v14 = v13;

  return -[ARPersonMetadata initWithBoundingBox:meanDepth:](self, "initWithBoundingBox:meanDepth:", v6, v8, v10, v12, v14);
}

- (ARPersonMetadata)initWithBoundingBox:(CGRect)a3 meanDepth:(double)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)ARPersonMetadata;
  result = [(ARPersonMetadata *)&v10 init];
  if (result)
  {
    result->_boundingBox.origin.CGFloat y = y;
    result->_boundingBox.size.CGFloat width = width;
    result->_boundingBox.size.CGFloat height = height;
    result->_meanDepth = a4;
    result->_boundingBox.origin.CGFloat x = x;
  }
  return result;
}

- (CGRect)rectScaledToSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(ARPersonMetadata *)self boundingBox];
  double v7 = width * v6;
  [(ARPersonMetadata *)self boundingBox];
  double v9 = height * v8;
  [(ARPersonMetadata *)self boundingBox];
  double v11 = width * v10;
  [(ARPersonMetadata *)self boundingBox];
  double v13 = height * v12;
  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  result.size.double height = v13;
  result.size.double width = v16;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)[(id)objc_opt_class() allocWithZone:a3];
  if (result)
  {
    CGSize size = self->_boundingBox.size;
    *((_OWORD *)result + 1) = self->_boundingBox.origin;
    *((CGSize *)result + 2) = size;
    *((void *)result + 1) = *(void *)&self->_meanDepth;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  float meanDepth = self->_meanDepth;
  id v6 = a3;
  *(float *)&double v5 = meanDepth;
  [v6 encodeFloat:@"meanDepth" forKey:v5];
  objc_msgSend(v6, "encodeRect:forKey:", @"boundingBox", self->_boundingBox.origin.x, self->_boundingBox.origin.y, self->_boundingBox.size.width, self->_boundingBox.size.height);
}

- (ARPersonMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ARPersonMetadata;
  double v5 = [(ARPersonMetadata *)&v12 init];
  if (v5)
  {
    [v4 decodeFloatForKey:@"meanDepth"];
    v5->_float meanDepth = v6;
    [v4 decodeRectForKey:@"boundingBox"];
    v5->_boundingBox.origin.CGFloat x = v7;
    v5->_boundingBox.origin.CGFloat y = v8;
    v5->_boundingBox.size.double width = v9;
    v5->_boundingBox.size.double height = v10;
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

- (double)meanDepth
{
  return self->_meanDepth;
}

@end