@interface ABPKDirectScalingParams
- (ABPKDirectScalingParams)initWithInputResolution:(CGSize)a3 andOutputResolution:(CGSize)a4;
- (float)heightScale;
- (float)widthScale;
@end

@implementation ABPKDirectScalingParams

- (ABPKDirectScalingParams)initWithInputResolution:(CGSize)a3 andOutputResolution:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  double v6 = a3.height;
  double v7 = a3.width;
  v13.receiver = self;
  v13.super_class = (Class)ABPKDirectScalingParams;
  result = [(ABPKDirectScalingParams *)&v13 init];
  if (result)
  {
    float v9 = width;
    float v10 = v9 / v7;
    float v11 = height;
    float v12 = v11 / v6;
    result->_heightScale = v12;
    result->_widthScale = v10;
  }
  return result;
}

- (float)heightScale
{
  return self->_heightScale;
}

- (float)widthScale
{
  return self->_widthScale;
}

@end