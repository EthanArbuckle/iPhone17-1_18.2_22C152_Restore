@interface CPTextBox
- (BOOL)isBoxRegion;
- (BOOL)isRotated;
- (CGRect)bounds;
- (CPTextBox)init;
- (double)rotationAngle;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)accept:(id)a3;
- (void)setRotationAngle:(double)a3;
@end

@implementation CPTextBox

- (id)description
{
  return (id)[NSString stringWithFormat:@"TextBox[%@...]", objc_msgSend(-[CPObject firstChild](self, "firstChild"), "description")];
}

- (CGRect)bounds
{
  v17.receiver = self;
  v17.super_class = (Class)CPTextBox;
  [(CPChunk *)&v17 bounds];
  CGFloat x = v3;
  CGFloat y = v5;
  CGFloat width = v7;
  CGFloat height = v9;
  if ([(CPTextBox *)self isRotated])
  {
    __double2 v11 = __sincos_stret(self->rotationAngle * 0.0174532925);
    v16.a = v11.__cosval;
    v16.b = v11.__sinval;
    v16.c = -v11.__sinval;
    v16.d = v11.__cosval;
    v16.tCGFloat x = 0.0;
    v16.tCGFloat y = 0.0;
    v18.origin.CGFloat x = x;
    v18.origin.CGFloat y = y;
    v18.size.CGFloat width = width;
    v18.size.CGFloat height = height;
    CGRect v19 = CGRectApplyAffineTransform(v18, &v16);
    CGFloat x = v19.origin.x;
    CGFloat y = v19.origin.y;
    CGFloat width = v19.size.width;
    CGFloat height = v19.size.height;
  }
  double v12 = x;
  double v13 = y;
  double v14 = width;
  double v15 = height;
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

- (BOOL)isRotated
{
  double rotationAngle = self->rotationAngle;
  return 360.0 - rotationAngle > 0.1 && rotationAngle > 0.1;
}

- (double)rotationAngle
{
  return self->rotationAngle;
}

- (void)setRotationAngle:(double)a3
{
  float v3 = a3;
  self->double rotationAngle = fmodf(v3, 360.0);
}

- (void)accept:(id)a3
{
}

- (BOOL)isBoxRegion
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CPTextBox;
  return [(CPRegion *)&v4 copyWithZone:a3];
}

- (CPTextBox)init
{
  v3.receiver = self;
  v3.super_class = (Class)CPTextBox;
  return [(CPChunk *)&v3 init];
}

@end