@interface AVCacheLargestInscribedRectInBoundingPathKey
- (AVCacheLargestInscribedRectInBoundingPathKey)initWithCenter:(CGPoint)a3 aspectRatio:(double)a4;
- (BOOL)isEqual:(id)a3;
- (CGPoint)center;
- (double)aspectRatio;
- (void)setAspectRatio:(double)a3;
- (void)setCenter:(CGPoint)a3;
@end

@implementation AVCacheLargestInscribedRectInBoundingPathKey

- (void)setAspectRatio:(double)a3
{
  self->_aspectRatio = a3;
}

- (double)aspectRatio
{
  return self->_aspectRatio;
}

- (void)setCenter:(CGPoint)a3
{
  self->_center = a3;
}

- (CGPoint)center
{
  double x = self->_center.x;
  double y = self->_center.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (AVCacheLargestInscribedRectInBoundingPathKey *)a3;
  v5 = v4;
  if (v4 == self)
  {
    BOOL v16 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    [(AVCacheLargestInscribedRectInBoundingPathKey *)self center];
    double v8 = v7;
    [(AVCacheLargestInscribedRectInBoundingPathKey *)v6 center];
    if (v8 == v9
      && ([(AVCacheLargestInscribedRectInBoundingPathKey *)self center],
          double v11 = v10,
          [(AVCacheLargestInscribedRectInBoundingPathKey *)v6 center],
          v11 == v12))
    {
      [(AVCacheLargestInscribedRectInBoundingPathKey *)self aspectRatio];
      double v14 = v13;
      [(AVCacheLargestInscribedRectInBoundingPathKey *)v6 aspectRatio];
      BOOL v16 = v14 == v15;
    }
    else
    {
      BOOL v16 = 0;
    }
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (AVCacheLargestInscribedRectInBoundingPathKey)initWithCenter:(CGPoint)a3 aspectRatio:(double)a4
{
  double y = a3.y;
  double x = a3.x;
  v10.receiver = self;
  v10.super_class = (Class)AVCacheLargestInscribedRectInBoundingPathKey;
  double v7 = [(AVCacheLargestInscribedRectInBoundingPathKey *)&v10 init];
  double v8 = v7;
  if (v7)
  {
    -[AVCacheLargestInscribedRectInBoundingPathKey setCenter:](v7, "setCenter:", x, y);
    [(AVCacheLargestInscribedRectInBoundingPathKey *)v8 setAspectRatio:a4];
  }
  return v8;
}

@end