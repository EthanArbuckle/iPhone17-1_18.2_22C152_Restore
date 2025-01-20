@interface NTKKuiperFontRotationAnimation
- (BOOL)isEqual:(id)a3;
- (NTKKuiperFontRotationAnimation)initWithFromDensity:(unint64_t)a3;
- (NTKKuiperFontRotationAnimation)initWithFromDensity:(unint64_t)a3 toDensity:(unint64_t)a4;
- (double)rotationForDigitIndex:(unint64_t)a3 fraction:(double)a4;
- (unint64_t)fromDensity;
- (unint64_t)toDensity;
@end

@implementation NTKKuiperFontRotationAnimation

- (NTKKuiperFontRotationAnimation)initWithFromDensity:(unint64_t)a3
{
  return [(NTKKuiperFontRotationAnimation *)self initWithFromDensity:a3 toDensity:4];
}

- (NTKKuiperFontRotationAnimation)initWithFromDensity:(unint64_t)a3 toDensity:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)NTKKuiperFontRotationAnimation;
  result = [(NTKKuiperFontRotationAnimation *)&v7 init];
  if (result)
  {
    result->_fromDensity = a3;
    result->_toDensity = a4;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (id v5 = -[NTKKuiperFontRotationAnimation fromDensity](self, "fromDensity"), v5 == [v4 fromDensity]))
  {
    id v6 = [(NTKKuiperFontRotationAnimation *)self toDensity];
    BOOL v7 = v6 == [v4 toDensity];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (double)rotationForDigitIndex:(unint64_t)a3 fraction:(double)a4
{
  double v7 = NTKKuiperDigitRotationForDensity([(NTKKuiperFontRotationAnimation *)self fromDensity], a3);
  v8.n128_u64[0] = NTKKuiperDigitRotationForDensity([(NTKKuiperFontRotationAnimation *)self toDensity], a3);
  v9.n128_f64[0] = v7;
  v10.n128_f64[0] = a4;

  _CLKInterpolateBetweenFloatsClipped(v9, v8, v10);
  return result;
}

- (unint64_t)fromDensity
{
  return self->_fromDensity;
}

- (unint64_t)toDensity
{
  return self->_toDensity;
}

@end