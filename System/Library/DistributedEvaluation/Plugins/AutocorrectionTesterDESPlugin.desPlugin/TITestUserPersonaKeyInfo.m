@interface TITestUserPersonaKeyInfo
- (CGPoint)center;
- (TIFitAffineMLLMatrixWrapper)rotationMatrix;
- (TIGaussianErrorGenerator)errorGenerator;
- (id)description;
- (void)setCenter:(CGPoint)a3;
- (void)setErrorGenerator:(id)a3;
- (void)setRotationMatrix:(id)a3;
@end

@implementation TITestUserPersonaKeyInfo

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)TITestUserPersonaKeyInfo;
  v3 = [(TITestUserPersonaKeyInfo *)&v6 description];
  v4 = +[NSString stringWithFormat:@"%@ @ {%.1f, %.1f}", v3, *(void *)&self->_center.x, *(void *)&self->_center.y];

  return v4;
}

- (CGPoint)center
{
  double x = self->_center.x;
  double y = self->_center.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setCenter:(CGPoint)a3
{
  self->_center = a3;
}

- (TIGaussianErrorGenerator)errorGenerator
{
  return self->_errorGenerator;
}

- (void)setErrorGenerator:(id)a3
{
}

- (TIFitAffineMLLMatrixWrapper)rotationMatrix
{
  return self->_rotationMatrix;
}

- (void)setRotationMatrix:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rotationMatrix, 0);

  objc_storeStrong((id *)&self->_errorGenerator, 0);
}

@end