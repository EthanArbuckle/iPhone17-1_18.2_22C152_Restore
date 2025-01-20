@interface CBTwilightPolicy
- (BOOL)luxIsInActiveRange:(float)a3;
- (BOOL)nitsAreInActiveRange:(float)a3;
- (CBChromaticCorrectionParams)params;
- (const)name;
- (float)cappedRampStartLux:(float)a3;
- (float)cappedRampTargetLux:(float)a3;
- (float)rampTargetLuxCap;
- (id)isEnabledPropertyKey;
- (id)rampIdentifier;
- (id)strengthNotification;
- (void)dealloc;
- (void)setParams:(id)a3;
@end

@implementation CBTwilightPolicy

- (id)isEnabledPropertyKey
{
  return @"TwilightEnabled";
}

- (BOOL)nitsAreInActiveRange:(float)a3
{
  [(CBFloatArray *)[(CBChromaticCorrectionParams *)self->_params nitsTable] get:0];
  BOOL v7 = 0;
  if (a3 >= v3)
  {
    [(CBChromaticCorrectionParams *)self->_params nitsActivationThreshold];
    return a3 <= v4;
  }
  return v7;
}

- (BOOL)luxIsInActiveRange:(float)a3
{
  [(CBChromaticCorrectionParams *)self->_params luxActivationThreshold];
  return a3 <= v3;
}

- (void)dealloc
{
  float v4 = self;
  SEL v3 = a2;

  v4->_params = 0;
  v2.receiver = v4;
  v2.super_class = (Class)CBTwilightPolicy;
  [(CBTwilightPolicy *)&v2 dealloc];
}

- (const)name
{
  return "Twilight";
}

- (id)strengthNotification
{
  return @"TwilightStrength";
}

- (id)rampIdentifier
{
  return @"Twilight";
}

- (float)cappedRampStartLux:(float)a3
{
  [(CBChromaticCorrectionParams *)self->_params luxActivationThreshold];
  return fminf(a3, v3);
}

- (float)cappedRampTargetLux:(float)a3
{
  [(CBTwilightPolicy *)self rampTargetLuxCap];
  return fminf(a3, v3);
}

- (float)rampTargetLuxCap
{
  [(CBChromaticCorrectionParams *)self->_params luxActivationThreshold];
  float v5 = v2;
  [(CBChromaticCorrectionParams *)self->_params rampDownLuxDeltaThreshold];
  return v5 + v3;
}

- (CBChromaticCorrectionParams)params
{
  return (CBChromaticCorrectionParams *)objc_getProperty(self, a2, 8, 1);
}

- (void)setParams:(id)a3
{
}

@end