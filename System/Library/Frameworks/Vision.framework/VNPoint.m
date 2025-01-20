@interface VNPoint
+ (BOOL)supportsSecureCoding;
+ (VNPoint)pointByApplyingVector:(VNVector *)vector toPoint:(VNPoint *)point;
+ (VNPoint)zeroPoint;
+ (double)distanceBetweenPoint:(VNPoint *)point1 point:(VNPoint *)point2;
- (BOOL)isEqual:(id)a3;
- (CGPoint)location;
- (VNPoint)init;
- (VNPoint)initWithCoder:(id)a3;
- (VNPoint)initWithX:(double)x y:(double)y;
- (double)distanceToPoint:(VNPoint *)point;
- (double)x;
- (double)y;
- (id)description;
- (id)transformedWith:(CGAffineTransform *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VNPoint

- (double)y
{
  return self->_y;
}

- (double)x
{
  return self->_x;
}

- (id)description
{
  id v3 = [NSString alloc];
  [(VNPoint *)self x];
  uint64_t v5 = v4;
  [(VNPoint *)self y];
  v7 = objc_msgSend(v3, "initWithFormat:", @"[%f; %f]", v5, v6);

  return v7;
}

- (unint64_t)hash
{
  double x = self->_x;
  if (x == 0.0) {
    double x = 0.0;
  }
  double y = self->_y;
  if (y == 0.0) {
    double y = 0.0;
  }
  return *(void *)&y ^ __ROR8__(*(void *)&x, 51);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    [(VNPoint *)self x];
    double v7 = v6;
    [v5 x];
    if (v7 == v8)
    {
      [(VNPoint *)self y];
      double v11 = v10;
      [v5 y];
      BOOL v9 = v11 == v12;
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)transformedWith:(CGAffineTransform *)a3
{
  [(VNPoint *)self location];
  double v6 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithLocation:", vaddq_f64(*(float64x2_t *)&a3->tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&a3->c, v4), *(float64x2_t *)&a3->a, v5)));

  return v6;
}

- (CGPoint)location
{
  [(VNPoint *)self x];
  double v4 = v3;
  [(VNPoint *)self y];
  double v6 = v5;
  double v7 = v4;
  result.double y = v6;
  result.double x = v7;
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeDouble:@"x" forKey:self->_x];
  [v4 encodeDouble:@"y" forKey:self->_y];
}

- (VNPoint)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeDoubleForKey:@"x"];
  double v6 = v5;
  [v4 decodeDoubleForKey:@"y"];
  double v8 = [(VNPoint *)self initWithX:v6 y:v7];

  return v8;
}

- (VNPoint)initWithX:(double)x y:(double)y
{
  v10.receiver = self;
  v10.super_class = (Class)VNPoint;
  double v6 = [(VNPoint *)&v10 init];
  double v7 = v6;
  if (v6
    && (*(void *)&x & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL
    && (*(void *)&y & 0x7FFFFFFFFFFFFFFFuLL) <= 0x7FEFFFFFFFFFFFFFLL)
  {
    v6->_double x = x;
    v6->_double y = y;
    double v8 = v6;
  }
  else
  {
    double v8 = 0;
  }

  return v8;
}

- (VNPoint)init
{
  return [(VNPoint *)self initWithX:0.0 y:0.0];
}

- (double)distanceToPoint:(VNPoint *)point
{
  id v4 = point;
  double v5 = [[VNVector alloc] initWithVectorHead:self tail:v4];
  [(VNVector *)v5 length];
  double v7 = v6;

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (double)distanceBetweenPoint:(VNPoint *)point1 point:(VNPoint *)point2
{
  [(VNPoint *)point1 distanceToPoint:point2];
  return result;
}

+ (VNPoint)pointByApplyingVector:(VNVector *)vector toPoint:(VNPoint *)point
{
  double v5 = vector;
  double v6 = point;
  double v7 = [VNPoint alloc];
  [(VNPoint *)v6 x];
  double v9 = v8;
  [(VNVector *)v5 x];
  double v11 = v10;
  [(VNPoint *)v6 y];
  double v13 = v12;
  [(VNVector *)v5 y];
  v15 = -[VNPoint initWithLocation:](v7, "initWithLocation:", v9 + v11, v13 + v14);

  return v15;
}

+ (VNPoint)zeroPoint
{
  if (+[VNPoint zeroPoint]::onceToken != -1) {
    dispatch_once(&+[VNPoint zeroPoint]::onceToken, &__block_literal_global_5584);
  }
  v2 = (void *)+[VNPoint zeroPoint]::zeroPoint;

  return (VNPoint *)v2;
}

uint64_t __20__VNPoint_zeroPoint__block_invoke()
{
  v0 = [VNPoint alloc];
  +[VNPoint zeroPoint]::zeroPoint = -[VNPoint initWithLocation:](v0, "initWithLocation:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));

  return MEMORY[0x1F41817F8]();
}

@end