@interface CUIPSDGradientColorStop
+ (id)colorStopWithLocation:(double)a3 gradientColor:(_psdGradientColor)a4;
+ (void)initialize;
- (BOOL)isColorStop;
- (CUIPSDGradientColorStop)initWithCoder:(id)a3;
- (CUIPSDGradientColorStop)initWithLocation:(double)a3 gradientColor:(_psdGradientColor)a4;
- (_psdGradientColor)gradientColor;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CUIPSDGradientColorStop

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    [a1 setVersion:1];
  }
}

+ (id)colorStopWithLocation:(double)a3 gradientColor:(_psdGradientColor)a4
{
  id v4 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithLocation:gradientColor:", a3, a4.red, a4.green, a4.blue, a4.alpha);
  return v4;
}

- (CUIPSDGradientColorStop)initWithLocation:(double)a3 gradientColor:(_psdGradientColor)a4
{
  double alpha = a4.alpha;
  double blue = a4.blue;
  double green = a4.green;
  double red = a4.red;
  v9.receiver = self;
  v9.super_class = (Class)CUIPSDGradientColorStop;
  result = [(CUIPSDGradientStop *)&v9 initWithLocation:a3];
  if (result)
  {
    result->gradientColor.double red = red;
    result->gradientColor.double green = green;
    result->gradientColor.double blue = blue;
    result->gradientColor.double alpha = alpha;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CUIPSDGradientColorStop;
  id result = [(CUIPSDGradientStop *)&v6 copyWithZone:a3];
  if (result)
  {
    long long v5 = *(_OWORD *)&self->gradientColor.blue;
    *((_OWORD *)result + 1) = *(_OWORD *)&self->gradientColor.red;
    *((_OWORD *)result + 2) = v5;
  }
  return result;
}

- (CUIPSDGradientColorStop)initWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CUIPSDGradientColorStop;
  id v4 = -[CUIPSDGradientStop initWithCoder:](&v10, sel_initWithCoder_);
  if (v4)
  {
    if ([a3 allowsKeyedCoding])
    {
      [a3 decodeDoubleForKey:@"CUIPSDGradientColorStopRed"];
      v4->gradientColor.double red = v5;
      [a3 decodeDoubleForKey:@"CUIPSDGradientColorStopGreen"];
      v4->gradientColor.double green = v6;
      [a3 decodeDoubleForKey:@"CUIPSDGradientColorStopBlue"];
      v4->gradientColor.double blue = v7;
      [a3 decodeDoubleForKey:@"CUIPSDGradientColorStopAlpha"];
      v4->gradientColor.double alpha = v8;
    }
    else
    {
      objc_msgSend(a3, "decodeValuesOfObjCTypes:", "dddd", &v4->gradientColor, &v4->gradientColor.green, &v4->gradientColor.blue, &v4->gradientColor.alpha);
    }
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CUIPSDGradientColorStop;
  -[CUIPSDGradientStop encodeWithCoder:](&v6, sel_encodeWithCoder_);
  if ([a3 allowsKeyedCoding])
  {
    objc_msgSend(a3, "encodeInteger:forKey:", +[CUIPSDGradientColorStop version](CUIPSDGradientColorStop, "version"), @"CUIPSDGradientColorStopVersion");
    p_gradientColor = &self->gradientColor;
    [a3 encodeDouble:@"CUIPSDGradientColorStopRed" forKey:p_gradientColor->red];
    [a3 encodeDouble:@"CUIPSDGradientColorStopGreen" forKey:p_gradientColor->green];
    [a3 encodeDouble:@"CUIPSDGradientColorStopBlue" forKey:p_gradientColor->blue];
    [a3 encodeDouble:@"CUIPSDGradientColorStopAlpha" forKey:p_gradientColor->alpha];
  }
  else
  {
    objc_msgSend(a3, "encodeValuesOfObjCTypes:", "dddd", &self->gradientColor, &self->gradientColor.green, &self->gradientColor.blue, &self->gradientColor.alpha);
  }
}

- (_psdGradientColor)gradientColor
{
  double red = self->gradientColor.red;
  double green = self->gradientColor.green;
  double blue = self->gradientColor.blue;
  double alpha = self->gradientColor.alpha;
  result.double alpha = alpha;
  result.double blue = blue;
  result.double green = green;
  result.double red = red;
  return result;
}

- (BOOL)isColorStop
{
  return 1;
}

- (id)description
{
  v6.receiver = self;
  v6.super_class = (Class)CUIPSDGradientColorStop;
  id v3 = [(CUIPSDGradientColorStop *)&v6 description];
  [(CUIPSDGradientStop *)self location];
  return +[NSString stringWithFormat:@"%@ - location: %f color: (%f, %f, %f, %f) - (%d, %d, %d)", v3, v4, *(void *)&self->gradientColor.red, *(void *)&self->gradientColor.green, *(void *)&self->gradientColor.blue, *(void *)&self->gradientColor.alpha, (int)(self->gradientColor.red * 255.0 + 0.5), (int)(self->gradientColor.green * 255.0 + 0.5), (int)(self->gradientColor.blue * 255.0 + 0.5)];
}

@end