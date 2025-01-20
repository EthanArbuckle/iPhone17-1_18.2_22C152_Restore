@interface HDHeartRateMeasurement
+ (id)_buildWithBinaryValue:(id)a3 error:(id *)a4;
+ (id)uuid;
- (BOOL)hasEnergyExpended;
- (BOOL)hasSensorContact;
- (BOOL)sensorContact;
- (NSArray)rrIntervals;
- (id)description;
- (id)generateDatums:(id)a3;
- (int64_t)energyExpended;
- (int64_t)heartRateValue;
- (unint64_t)derivedContactStatus;
- (void)setEnergyExpended:(int64_t)a3;
- (void)setHasEnergyExpended:(BOOL)a3;
- (void)setHasSensorContact:(BOOL)a3;
- (void)setHeartRateValue:(int64_t)a3;
- (void)setRrIntervals:(id)a3;
- (void)setSensorContact:(BOOL)a3;
@end

@implementation HDHeartRateMeasurement

+ (id)uuid
{
  return +[CBUUID UUIDWithString:@"2a37"];
}

+ (id)_buildWithBinaryValue:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [(HDHealthServiceCharacteristic *)[HDHeartRateMeasurement alloc] _init];
  v7 = (char *)[v5 length];
  id v8 = v5;
  id v9 = [v8 bytes];
  id v20 = v9;
  if (v9 && (unint64_t)v7 > 1)
  {
    v10 = &v7[(void)v9];
    unsigned int v11 = [(id)objc_opt_class() uint8FromData:&v20 before:&v7[(void)v9]];
    [v6 setHasSensorContact:(v11 >> 2) & 1];
    objc_msgSend(v6, "setSensorContact:", objc_msgSend(v6, "hasSensorContact") & ((v11 & 2) >> 1));
    [v6 setHasEnergyExpended:(v11 >> 3) & 1];
    v12 = objc_opt_class();
    if (v11)
    {
      objc_msgSend(v6, "setHeartRateValue:", objc_msgSend(v12, "uint16FromData:before:", &v20, v10));
      if (!v20)
      {
        +[NSError hk_error:303, @"Insufficient data (%lu bytes) for heart rate value.", v7 format];
        goto LABEL_6;
      }
    }
    else
    {
      objc_msgSend(v6, "setHeartRateValue:", objc_msgSend(v12, "uint8FromData:before:", &v20, v10));
    }
    if (![v6 hasEnergyExpended]
      || (objc_msgSend(v6, "setEnergyExpended:", objc_msgSend((id)objc_opt_class(), "uint16FromData:before:", &v20, v10)), v20))
    {
      v14 = +[NSMutableArray array];
      if ((v11 & 0x10) != 0)
      {
        do
        {
          unsigned int v15 = [(id)objc_opt_class() uint16FromData:&v20 before:v10];
          if (!v20) {
            break;
          }
          v16 = +[NSNumber numberWithDouble:(double)v15 * 0.0009765625];
          [v14 addObject:v16];
        }
        while (v20);
        if (![v14 count])
        {
          id v19 = +[NSError hk_error:303, @"Insufficient data (%lu bytes) for RR interval.", v7 format];
          if (v19)
          {
            if (a4) {
              *a4 = v19;
            }
            else {
              _HKLogDroppedError();
            }
          }

          id v17 = 0;
          goto LABEL_18;
        }
        [v6 setRrIntervals:v14];
      }
      id v17 = v6;
LABEL_18:

      goto LABEL_21;
    }
    +[NSError hk_error:303, @"Insufficient data (%lu bytes) for energy expended.", v7 format];
  }
  else
  {
    +[NSError hk_error:303, @"Insufficient data (%lu bytes) for heart rate measurement.", v7 format];
  }
LABEL_6:
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    if (a4) {
      *a4 = v13;
    }
    else {
      _HKLogDroppedError();
    }
  }

  id v17 = 0;
LABEL_21:

  return v17;
}

- (id)description
{
  v3 = [(id)objc_opt_class() uuid];
  v4 = +[NSMutableString stringWithFormat:@"Heart rate measurement (%@) %ld BPM", v3, self->_heartRateValue];

  if (self->_hasEnergyExpended) {
    [v4 appendFormat:@", %ld J", self->_energyExpended];
  }
  if (self->_hasSensorContact)
  {
    if (self->_sensorContact) {
      CFStringRef v5 = &stru_61AE0;
    }
    else {
      CFStringRef v5 = @"no ";
    }
    [v4 appendFormat:@", %@sensor contact detected", v5];
  }
  if ([(NSArray *)self->_rrIntervals count])
  {
    [v4 appendString:@", RRIntervals:[ "];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = self->_rrIntervals;
    id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          [v4 appendFormat:@"%@ ", *(void *)(*((void *)&v12 + 1) + 8 * i)];
        }
        id v8 = [(NSArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }

    [v4 appendString:@"]"];
  }

  return v4;
}

- (unint64_t)derivedContactStatus
{
  if (![(HDHeartRateMeasurement *)self hasSensorContact]) {
    return 0;
  }
  if ([(HDHeartRateMeasurement *)self sensorContact]) {
    return 1;
  }
  return 2;
}

- (int64_t)heartRateValue
{
  return self->_heartRateValue;
}

- (void)setHeartRateValue:(int64_t)a3
{
  self->_heartRateValue = a3;
}

- (BOOL)hasEnergyExpended
{
  return self->_hasEnergyExpended;
}

- (void)setHasEnergyExpended:(BOOL)a3
{
  self->_hasEnergyExpended = a3;
}

- (int64_t)energyExpended
{
  return self->_energyExpended;
}

- (void)setEnergyExpended:(int64_t)a3
{
  self->_energyExpended = a3;
}

- (BOOL)hasSensorContact
{
  return self->_hasSensorContact;
}

- (void)setHasSensorContact:(BOOL)a3
{
  self->_hasSensorContact = a3;
}

- (BOOL)sensorContact
{
  return self->_sensorContact;
}

- (void)setSensorContact:(BOOL)a3
{
  self->_sensorContact = a3;
}

- (NSArray)rrIntervals
{
  return self->_rrIntervals;
}

- (void)setRrIntervals:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id)generateDatums:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = +[HKUnit unitFromString:@"count/min"];
  id v6 = +[HKQuantity quantityWithUnit:v5 doubleValue:(double)[(HDHeartRateMeasurement *)self heartRateValue]];

  id v7 = objc_alloc((Class)HDHeartRateSensorDatum);
  id v8 = +[NSUUID UUID];
  id v9 = [v7 initWithIdentifier:v8 dateInterval:v4 heartRate:v6 heartRateContext:0 resumeContext:0];

  long long v12 = &off_63F78;
  id v13 = v9;
  v10 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];

  return v10;
}

@end