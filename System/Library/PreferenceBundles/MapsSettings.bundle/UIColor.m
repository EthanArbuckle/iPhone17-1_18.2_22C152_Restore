@interface UIColor
+ (id)_maps_colorFromHexRepresentation:(id)a3;
+ (id)_maps_darkKeyColor;
+ (id)_maps_keyColor;
- (double)_maps_euclideanDistanceFromColor:(id)a3;
- (id)_maps_hexRepresentation;
@end

@implementation UIColor

+ (id)_maps_keyColor
{
  if (qword_8E288 != -1) {
    dispatch_once(&qword_8E288, &stru_72558);
  }
  v2 = (void *)qword_8E280;

  return v2;
}

+ (id)_maps_darkKeyColor
{
  if (qword_8E298 != -1) {
    dispatch_once(&qword_8E298, &stru_72578);
  }
  v2 = (void *)qword_8E290;

  return v2;
}

- (id)_maps_hexRepresentation
{
  Components = CGColorGetComponents([(UIColor *)self CGColor]);
  return +[NSString stringWithFormat:@"%02lX%02lX%02lX%02lX", llround(*Components * 255.0), llround(Components[1] * 255.0), llround(Components[2] * 255.0), llround(Components[3] * 255.0)];
}

+ (id)_maps_colorFromHexRepresentation:(id)a3
{
  id v3 = a3;
  if ([v3 length] == &dword_8)
  {
    unsigned int v7 = 0;
    v4 = +[NSScanner scannerWithString:v3];
    [v4 scanHexInt:&v7];
    v5 = +[UIColor colorWithRed:(double)HIBYTE(v7) / 255.0 green:(double)BYTE2(v7) / 255.0 blue:(double)BYTE1(v7) / 255.0 alpha:(double)v7 / 255.0];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (double)_maps_euclideanDistanceFromColor:(id)a3
{
  float64x2_t v9 = 0u;
  *(_OWORD *)v10 = 0u;
  id v4 = a3;
  [(UIColor *)self getRed:&v9 green:&v9.f64[1] blue:v10 alpha:&v10[1]];
  float64x2_t v7 = 0u;
  long long v8 = 0u;
  [v4 getRed:&v7 green:&v7.f64[1] blue:&v8 alpha:(char *)&v8 + 8];

  float64x2_t v5 = vsubq_f64(v9, v7);
  return sqrt(vaddvq_f64(vmulq_f64(v5, v5)) + (v10[0] - *(double *)&v8) * (v10[0] - *(double *)&v8));
}

@end