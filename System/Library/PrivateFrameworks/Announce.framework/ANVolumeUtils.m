@interface ANVolumeUtils
+ (float)dBFromVolume:(float)a3;
+ (float)volumeFromDB:(float)a3;
@end

@implementation ANVolumeUtils

+ (float)volumeFromDB:(float)a3
{
  uint64_t v4 = MGGetProductType();
  if (v4 != 4240173202)
  {
    if (v4 == 3348380076)
    {
      float v6 = -48.0;
      return (float)(v6 - a3) / v6;
    }
    float result = 0.0;
    if (v4 != 2702125347) {
      return result;
    }
  }
  if (a3 < -30.0) {
    return (float)(a3 + 60.0) / 150.0;
  }
  float v6 = -37.5;
  return (float)(v6 - a3) / v6;
}

+ (float)dBFromVolume:(float)a3
{
  uint64_t v4 = MGGetProductType();
  if (v4 == 4240173202) {
    goto LABEL_4;
  }
  if (v4 == 3348380076) {
    return (float)(1.0 - a3) * -48.0;
  }
  if (v4 != 2702125347) {
    return -120.0;
  }
LABEL_4:
  float result = (float)((float)(1.0 - a3) * -150.0) + 90.0;
  if (a3 > 0.2) {
    return (float)(1.0 - a3) * -37.5;
  }
  return result;
}

@end