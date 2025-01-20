@interface ARCameraParameters
+ (BOOL)supportsSecureCoding;
- (ARCameraParameters)initWithCoder:(id)a3;
- (ARCameraParameters)initWithFocalLength:(CGPoint)a3 imageResolution:(CGSize)a4 principalPoint:(CGPoint)a5;
- (CGPoint)focalLength;
- (CGPoint)principalPoint;
- (CGSize)imageResolution;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ARCameraParameters

- (ARCameraParameters)initWithFocalLength:(CGPoint)a3 imageResolution:(CGSize)a4 principalPoint:(CGPoint)a5
{
  CGFloat y = a5.y;
  CGFloat x = a5.x;
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  CGFloat v9 = a3.y;
  CGFloat v10 = a3.x;
  v12.receiver = self;
  v12.super_class = (Class)ARCameraParameters;
  result = [(ARCameraParameters *)&v12 init];
  if (result)
  {
    result->_focalLength.CGFloat x = v10;
    result->_focalLength.CGFloat y = v9;
    result->_imageResolution.CGFloat width = width;
    result->_imageResolution.CGFloat height = height;
    result->_principalPoint.CGFloat x = x;
    result->_principalPoint.CGFloat y = y;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    [(ARCameraParameters *)self imageResolution];
    v4[1] = v5;
    v4[2] = v6;
    [(ARCameraParameters *)self focalLength];
    v4[3] = v7;
    v4[4] = v8;
    [(ARCameraParameters *)self principalPoint];
    v4[5] = v9;
    v4[6] = v10;
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v13 = a3;
  [(ARCameraParameters *)self imageResolution];
  *(float *)&double v5 = v4;
  [v13 encodeFloat:@"resolutionHeight" forKey:v5];
  [(ARCameraParameters *)self imageResolution];
  *(float *)&double v6 = v6;
  [v13 encodeFloat:@"resolutionWidth" forKey:v6];
  [(ARCameraParameters *)self focalLength];
  *(float *)&double v7 = v7;
  [v13 encodeFloat:@"focalLengthX" forKey:v7];
  [(ARCameraParameters *)self focalLength];
  *(float *)&double v9 = v8;
  [v13 encodeFloat:@"focalLengthY" forKey:v9];
  [(ARCameraParameters *)self principalPoint];
  *(float *)&double v10 = v10;
  [v13 encodeFloat:@"principalPointX" forKey:v10];
  [(ARCameraParameters *)self principalPoint];
  *(float *)&double v12 = v11;
  [v13 encodeFloat:@"principalPointY" forKey:v12];
}

- (ARCameraParameters)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeFloatForKey:@"resolutionHeight"];
  double v6 = v5;
  [v4 decodeFloatForKey:@"resolutionWidth"];
  double v8 = v7;
  [v4 decodeFloatForKey:@"focalLengthX"];
  double v10 = v9;
  [v4 decodeFloatForKey:@"focalLengthY"];
  double v12 = v11;
  [v4 decodeFloatForKey:@"principalPointX"];
  double v14 = v13;
  [v4 decodeFloatForKey:@"principalPointY"];
  float v16 = v15;

  return -[ARCameraParameters initWithFocalLength:imageResolution:principalPoint:](self, "initWithFocalLength:imageResolution:principalPoint:", v10, v12, v8, v6, v14, v16);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CGSize)imageResolution
{
  double width = self->_imageResolution.width;
  double height = self->_imageResolution.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (CGPoint)focalLength
{
  double x = self->_focalLength.x;
  double y = self->_focalLength.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGPoint)principalPoint
{
  double x = self->_principalPoint.x;
  double y = self->_principalPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

@end