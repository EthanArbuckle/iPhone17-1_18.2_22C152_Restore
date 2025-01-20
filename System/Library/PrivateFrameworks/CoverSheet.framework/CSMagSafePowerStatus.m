@interface CSMagSafePowerStatus
- (CSMagSafePowerStatus)init;
- (double)powerPercent;
- (int)chargeState;
- (unint64_t)powerStatus;
- (void)setChargeState:(int)a3;
- (void)setPowerPercent:(double)a3;
- (void)setPowerStatus:(unint64_t)a3;
@end

@implementation CSMagSafePowerStatus

- (CSMagSafePowerStatus)init
{
  v3.receiver = self;
  v3.super_class = (Class)CSMagSafePowerStatus;
  result = [(CSMagSafePowerStatus *)&v3 init];
  if (result)
  {
    result->_chargeState = 0;
    result->_powerStatus = 0;
    result->_powerPercent = 0.0;
  }
  return result;
}

- (void)setPowerStatus:(unint64_t)a3
{
  if (self->_powerStatus != a3) {
    self->_powerStatus = a3;
  }
}

- (unint64_t)powerStatus
{
  return self->_powerStatus;
}

- (int)chargeState
{
  return self->_chargeState;
}

- (void)setChargeState:(int)a3
{
  self->_chargeState = a3;
}

- (double)powerPercent
{
  return self->_powerPercent;
}

- (void)setPowerPercent:(double)a3
{
  self->_powerPercent = a3;
}

@end