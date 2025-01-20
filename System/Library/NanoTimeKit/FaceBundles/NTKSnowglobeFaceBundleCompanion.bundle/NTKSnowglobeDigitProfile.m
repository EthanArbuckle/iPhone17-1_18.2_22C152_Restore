@interface NTKSnowglobeDigitProfile
+ (id)profileForCharacter:(unint64_t)a3;
- (float)accelerometerFactor;
- (float)blinkDuration;
- (float)blinkTime;
- (float)kickMultiplier;
- (float)randomMotionMultiplier;
- (float)springMultiplier;
- (float)squintRatio;
@end

@implementation NTKSnowglobeDigitProfile

+ (id)profileForCharacter:(unint64_t)a3
{
  v3 = (_DWORD *)objc_opt_new();
  CLKInterpolateBetweenFloatsClipped();
  *(float *)&double v4 = v4;
  v3[2] = LODWORD(v4);
  CLKInterpolateBetweenFloatsClipped();
  *(float *)&double v5 = v5;
  v3[3] = LODWORD(v5);
  CLKInterpolateBetweenFloatsClipped();
  *(float *)&double v6 = v6;
  v3[4] = LODWORD(v6);
  CLKInterpolateBetweenFloatsClipped();
  *(float *)&double v7 = v7;
  v3[5] = LODWORD(v7);
  CLKInterpolateBetweenFloatsClipped();
  *(float *)&double v8 = v8;
  v3[6] = LODWORD(v8);
  v3[7] = 1077936128;
  CLKInterpolateBetweenFloatsClipped();
  *(float *)&double v9 = v9 / (1.0 - v9);
  v3[8] = LODWORD(v9);

  return v3;
}

- (float)kickMultiplier
{
  return self->_kickMultiplier;
}

- (float)randomMotionMultiplier
{
  return self->_randomMotionMultiplier;
}

- (float)springMultiplier
{
  return self->_springMultiplier;
}

- (float)accelerometerFactor
{
  return self->_accelerometerFactor;
}

- (float)blinkDuration
{
  return self->_blinkDuration;
}

- (float)blinkTime
{
  return self->_blinkTime;
}

- (float)squintRatio
{
  return self->_squintRatio;
}

@end