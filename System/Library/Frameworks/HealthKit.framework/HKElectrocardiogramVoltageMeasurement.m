@interface HKElectrocardiogramVoltageMeasurement
- (BOOL)isEqual:(id)a3;
- (HKElectrocardiogramVoltageMeasurement)initWithLeadIVoltage:(id)a3 timeSinceSampleStart:(double)a4;
- (HKQuantity)quantityForLead:(HKElectrocardiogramLead)lead;
- (NSTimeInterval)timeSinceSampleStart;
- (id)description;
- (unint64_t)hash;
@end

@implementation HKElectrocardiogramVoltageMeasurement

- (HKElectrocardiogramVoltageMeasurement)initWithLeadIVoltage:(id)a3 timeSinceSampleStart:(double)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKElectrocardiogramVoltageMeasurement;
  v7 = [(HKElectrocardiogramVoltageMeasurement *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    leadIVoltage = v7->_leadIVoltage;
    v7->_leadIVoltage = (HKQuantity *)v8;

    v7->_timeSinceSampleStart = a4;
  }

  return v7;
}

- (HKQuantity)quantityForLead:(HKElectrocardiogramLead)lead
{
  if (lead == HKElectrocardiogramLeadAppleWatchSimilarToLeadI)
  {
    v4 = self->_leadIVoltage;
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (unint64_t)hash
{
  double timeSinceSampleStart = self->_timeSinceSampleStart;
  return [(HKQuantity *)self->_leadIVoltage hash] ^ *(void *)&timeSinceSampleStart;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HKElectrocardiogramVoltageMeasurement *)a3;
  if (self == v4) {
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || self->_timeSinceSampleStart != v4->_timeSinceSampleStart) {
    goto LABEL_7;
  }
  leadIVoltage = self->_leadIVoltage;
  id v6 = v4->_leadIVoltage;
  if (leadIVoltage == v6)
  {
LABEL_8:
    char v7 = 1;
    goto LABEL_9;
  }
  if (!v6)
  {
LABEL_7:
    char v7 = 0;
    goto LABEL_9;
  }
  char v7 = -[HKQuantity isEqual:](leadIVoltage, "isEqual:");
LABEL_9:

  return v7;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p %lf %@>", self, self, *(void *)&self->_timeSinceSampleStart, self->_leadIVoltage];
}

- (NSTimeInterval)timeSinceSampleStart
{
  return self->_timeSinceSampleStart;
}

- (void).cxx_destruct
{
}

@end