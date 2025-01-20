@interface CBDisplayRamps
- (BOOL)isDisplayRampRunning;
- (CBDisplayRamps)init;
- (void)handleRampEnd:(id)a3;
- (void)handleRampStart:(id)a3;
@end

@implementation CBDisplayRamps

- (CBDisplayRamps)init
{
  v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)CBDisplayRamps;
  v5 = [(CBDisplayRamps *)&v3 init];
  if (!v5) {
    return 0;
  }
  v5->_ammoliteRamp = 0;
  v5->_twilightRamp = 0;
  v5->_minimumIndicatorRamp = 0;
  return v5;
}

- (void)handleRampStart:(id)a3
{
  if ([a3 isEqualToString:@"Ammolite"])
  {
    self->_ammoliteRamp = 1;
  }
  else if ([a3 isEqualToString:@"Twilight"])
  {
    self->_twilightRamp = 1;
  }
  else if ([a3 isEqualToString:@"IndicatorBrightness"])
  {
    self->_minimumIndicatorRamp = 1;
  }
}

- (void)handleRampEnd:(id)a3
{
  if ([a3 isEqualToString:@"Ammolite"])
  {
    self->_ammoliteRamp = 2;
  }
  else if ([a3 isEqualToString:@"Twilight"])
  {
    self->_twilightRamp = 2;
  }
  else if ([a3 isEqualToString:@"IndicatorBrightness"])
  {
    self->_minimumIndicatorRamp = 2;
  }
}

- (BOOL)isDisplayRampRunning
{
  return self->_ammoliteRamp == 1 || self->_twilightRamp == 1 || self->_minimumIndicatorRamp == 1;
}

@end