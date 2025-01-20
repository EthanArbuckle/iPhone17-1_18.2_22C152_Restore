@interface CVAPRRangeMeasurement
- (double)measurement;
- (double)uncertainty;
- (void)setMeasurement:(double)a3;
- (void)setUncertainty:(double)a3;
@end

@implementation CVAPRRangeMeasurement

- (double)measurement
{
  return self->_measurement;
}

- (void)setMeasurement:(double)a3
{
  self->_measurement = a3;
}

- (double)uncertainty
{
  return self->_uncertainty;
}

- (void)setUncertainty:(double)a3
{
  self->_uncertainty = a3;
}

@end