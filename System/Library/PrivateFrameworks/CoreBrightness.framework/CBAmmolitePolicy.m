@interface CBAmmolitePolicy
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

@implementation CBAmmolitePolicy

- (id)isEnabledPropertyKey
{
  return @"CBAmmoliteEnabled";
}

- (BOOL)luxIsInActiveRange:(float)a3
{
  [(CBChromaticCorrectionParams *)self->_params luxActivationThreshold];
  return a3 >= v3;
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;

  v4->_params = 0;
  v2.receiver = v4;
  v2.super_class = (Class)CBAmmolitePolicy;
  [(CBAmmolitePolicy *)&v2 dealloc];
}

- (const)name
{
  return "Ammolite";
}

- (id)strengthNotification
{
  return @"AmmoliteStrength";
}

- (BOOL)nitsAreInActiveRange:(float)a3
{
  [(CBChromaticCorrectionParams *)self->_params nitsActivationThreshold];
  return a3 >= v3;
}

- (float)cappedRampStartLux:(float)a3
{
  [(CBChromaticCorrectionParams *)self->_params luxActivationThreshold];
  return fmaxf(a3, v3);
}

- (float)cappedRampTargetLux:(float)a3
{
  [(CBAmmolitePolicy *)self rampTargetLuxCap];
  return fmaxf(a3, v3);
}

- (float)rampTargetLuxCap
{
  [(CBChromaticCorrectionParams *)self->_params luxActivationThreshold];
  float v5 = v2;
  [(CBChromaticCorrectionParams *)self->_params rampUpLuxDeltaThreshold];
  return v5 - v3;
}

- (id)rampIdentifier
{
  return @"Ammolite";
}

- (CBChromaticCorrectionParams)params
{
  return (CBChromaticCorrectionParams *)objc_getProperty(self, a2, 8, 1);
}

- (void)setParams:(id)a3
{
}

@end