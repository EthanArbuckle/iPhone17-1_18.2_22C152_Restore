@interface CBTwilightParams
- (CBTwilightNightShiftAdaptationParams)nightShiftAdaptation;
- (CBTwilightParams)initWithService:(unsigned int)a3;
@end

@implementation CBTwilightParams

- (CBTwilightParams)initWithService:(unsigned int)a3
{
  v9 = self;
  SEL v8 = a2;
  unsigned int v7 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CBTwilightParams;
  v9 = [(CBChromaticCorrectionParams *)&v6 initFromTwilightFromService:a3];
  if (v9)
  {
    v3 = [CBTwilightNightShiftAdaptationParams alloc];
    uint64_t v4 = [(CBTwilightNightShiftAdaptationParams *)v3 initWithService:v7];
    v9->_nightShiftAdaptation = (CBTwilightNightShiftAdaptationParams *)v4;
  }
  return v9;
}

- (CBTwilightNightShiftAdaptationParams)nightShiftAdaptation
{
  return self->_nightShiftAdaptation;
}

@end