@interface PKMutableStroke
- (UIColor)_color;
- (void)_setColor:(id)a3;
- (void)_setLocation:(CGPoint)a3 atIndex:(unint64_t)a4;
@end

@implementation PKMutableStroke

- (void)_setLocation:(CGPoint)a3 atIndex:(unint64_t)a4
{
  double y = a3.y;
  double x = a3.x;
  [(_PKStrokeConcrete *)self _transform];
  CGAffineTransformInvert(&v11, &v10);
  float64x2_t v9 = vaddq_f64(*(float64x2_t *)&v11.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v11.c, y), *(float64x2_t *)&v11.a, x));
  v6 = [(PKStroke *)self _strokeData];
  [v6 setLocation:a4 atIndex:*(_OWORD *)&v9];
}

- (UIColor)_color
{
  v2 = [(_PKStrokeConcrete *)self ink];
  v3 = [v2 color];

  return (UIColor *)v3;
}

- (void)_setColor:(id)a3
{
  id v6 = a3;
  v4 = [(_PKStrokeConcrete *)self ink];
  v5 = +[PKInk inkFromInk:v4 color:v6];
  [(PKStroke *)self _setInk:v5];
}

@end