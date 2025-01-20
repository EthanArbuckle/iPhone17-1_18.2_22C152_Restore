@interface CUIPSDGradientDoubleColorStop
+ (id)doubleColorStopWithLocation:(double)a3 leadInColor:(_psdGradientColor)a4 leadOutColor:(_psdGradientColor)a5;
+ (void)initialize;
- (BOOL)isDoubleStop;
- (CUIPSDGradientDoubleColorStop)initWithCoder:(id)a3;
- (CUIPSDGradientDoubleColorStop)initWithLocation:(double)a3 leadInColor:(_psdGradientColor)a4 leadOutColor:(_psdGradientColor)a5;
- (_psdGradientColor)leadOutColor;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CUIPSDGradientDoubleColorStop

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    [a1 setVersion:1];
  }
}

+ (id)doubleColorStopWithLocation:(double)a3 leadInColor:(_psdGradientColor)a4 leadOutColor:(_psdGradientColor)a5
{
  id v5 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithLocation:leadInColor:leadOutColor:", a3, a4.red, a4.green, a4.blue, a4.alpha, *(void *)&a5.red, *(void *)&a5.green, *(void *)&a5.blue, *(void *)&a5.alpha);
  return v5;
}

- (CUIPSDGradientDoubleColorStop)initWithLocation:(double)a3 leadInColor:(_psdGradientColor)a4 leadOutColor:(_psdGradientColor)a5
{
  v6.receiver = self;
  v6.super_class = (Class)CUIPSDGradientDoubleColorStop;
  result = -[CUIPSDGradientColorStop initWithLocation:gradientColor:](&v6, sel_initWithLocation_gradientColor_, a3, a4.red, a4.green, a4.blue, a4.alpha);
  if (result) {
    result->leadOutColor = a5;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CUIPSDGradientDoubleColorStop;
  id result = [(CUIPSDGradientColorStop *)&v6 copyWithZone:a3];
  if (result)
  {
    long long v5 = *(_OWORD *)&self->leadOutColor.blue;
    *((_OWORD *)result + 3) = *(_OWORD *)&self->leadOutColor.red;
    *((_OWORD *)result + 4) = v5;
  }
  return result;
}

- (CUIPSDGradientDoubleColorStop)initWithCoder:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CUIPSDGradientDoubleColorStop;
  v4 = -[CUIPSDGradientColorStop initWithCoder:](&v10, sel_initWithCoder_);
  if (v4)
  {
    if ([a3 allowsKeyedCoding])
    {
      [a3 decodeDoubleForKey:@"CUIPSDGradientDoubleColorStopRed"];
      v4->leadOutColor.red = v5;
      [a3 decodeDoubleForKey:@"CUIPSDGradientDoubleColorStopGreen"];
      v4->leadOutColor.green = v6;
      [a3 decodeDoubleForKey:@"CUIPSDGradientDoubleColorStopBlue"];
      v4->leadOutColor.blue = v7;
      [a3 decodeDoubleForKey:@"CUIPSDGradientDoubleColorStopAlpha"];
      v4->leadOutColor.alpha = v8;
    }
    else
    {
      objc_msgSend(a3, "decodeValuesOfObjCTypes:", "dddd", &v4->leadOutColor, &v4->leadOutColor.green, &v4->leadOutColor.blue, &v4->leadOutColor.alpha);
    }
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CUIPSDGradientDoubleColorStop;
  -[CUIPSDGradientColorStop encodeWithCoder:](&v6, sel_encodeWithCoder_);
  if ([a3 allowsKeyedCoding])
  {
    objc_msgSend(a3, "encodeInteger:forKey:", +[CUIPSDGradientDoubleColorStop version](CUIPSDGradientDoubleColorStop, "version"), @"CUIPSDGradientDoubleColorStopVersion");
    p_leadOutColor = &self->leadOutColor;
    [a3 encodeDouble:@"CUIPSDGradientDoubleColorStopRed" forKey:p_leadOutColor->red];
    [a3 encodeDouble:@"CUIPSDGradientDoubleColorStopGreen" forKey:p_leadOutColor->green];
    [a3 encodeDouble:@"CUIPSDGradientDoubleColorStopBlue" forKey:p_leadOutColor->blue];
    [a3 encodeDouble:@"CUIPSDGradientDoubleColorStopAlpha" forKey:p_leadOutColor->alpha];
  }
  else
  {
    objc_msgSend(a3, "encodeValuesOfObjCTypes:", "dddd", &self->leadOutColor, &self->leadOutColor.green, &self->leadOutColor.blue, &self->leadOutColor.alpha);
  }
}

- (_psdGradientColor)leadOutColor
{
  double red = self->leadOutColor.red;
  double green = self->leadOutColor.green;
  double blue = self->leadOutColor.blue;
  double alpha = self->leadOutColor.alpha;
  result.double alpha = alpha;
  result.double blue = blue;
  result.double green = green;
  result.double red = red;
  return result;
}

- (BOOL)isDoubleStop
{
  return 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)CUIPSDGradientDoubleColorStop;
  return +[NSString stringWithFormat:@"%@ lead-out color: (%f, %f, %f, %f) - (%d, %d, %d)", [(CUIPSDGradientColorStop *)&v3 description], *(void *)&self->leadOutColor.red, *(void *)&self->leadOutColor.green, *(void *)&self->leadOutColor.blue, *(void *)&self->leadOutColor.alpha, (int)(self->leadOutColor.red * 255.0 + 0.5), (int)(self->leadOutColor.green * 255.0 + 0.5), (int)(self->leadOutColor.blue * 255.0 + 0.5)];
}

@end