@interface HDEurotasData
+ (id)uuid;
- (BOOL)hasActiveEnergy;
- (BOOL)hasAverageHeartRate;
- (BOOL)hasHeartRate;
- (BOOL)hasTotalEnergy;
- (BOOL)isEqual:(id)a3;
- (id)description;
- (id)getBinaryValueWithError:(id *)a3;
- (id)initForWriting;
- (unsigned)activeEnergy;
- (unsigned)averageHeartRate;
- (unsigned)heartRate;
- (unsigned)totalEnergy;
- (void)addActiveEnergy:(unsigned __int16)a3;
- (void)addAverageHeartRate:(unsigned __int16)a3;
- (void)addHeartRate:(unsigned __int16)a3;
- (void)addTotalEnergy:(unsigned __int16)a3;
@end

@implementation HDEurotasData

- (id)initForWriting
{
  v3.receiver = self;
  v3.super_class = (Class)HDEurotasData;
  return [(HDHealthServiceCharacteristic *)&v3 _init];
}

+ (id)uuid
{
  return +[CBUUID UUIDWithString:@"0x2ADB"];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HDEurotasData *)a3;
  if (self == v4)
  {
    char v6 = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    char v6 = 0;
    if (v4 && (isKindOfClass & 1) != 0)
    {
      BOOL hasHeartRate = self->_hasHeartRate;
      if (hasHeartRate == [(HDEurotasData *)v4 hasHeartRate]
        && (int heartRate = self->_heartRate, heartRate == [(HDEurotasData *)v4 heartRate])
        && (BOOL hasActiveEnergy = self->_hasActiveEnergy,
            hasActiveEnergy == [(HDEurotasData *)v4 hasActiveEnergy])
        && (int activeEnergy = self->_activeEnergy, activeEnergy == [(HDEurotasData *)v4 activeEnergy])
        && (BOOL hasTotalEnergy = self->_hasTotalEnergy,
            hasTotalEnergy == [(HDEurotasData *)v4 hasTotalEnergy])
        && (int totalEnergy = self->_totalEnergy, totalEnergy == [(HDEurotasData *)v4 totalEnergy])
        && (BOOL hasAverageHeartRate = self->_hasAverageHeartRate,
            hasAverageHeartRate == [(HDEurotasData *)v4 hasAverageHeartRate]))
      {
        int averageHeartRate = self->_averageHeartRate;
        char v6 = averageHeartRate == [(HDEurotasData *)v4 averageHeartRate];
      }
      else
      {
        char v6 = 0;
      }
    }
  }

  return v6;
}

- (id)description
{
  BOOL hasHeartRate = self->_hasHeartRate;
  if (self->_hasHeartRate)
  {
    v4 = +[NSNumber numberWithUnsignedShort:self->_heartRate];
  }
  else
  {
    v4 = @"(null)";
  }
  BOOL hasActiveEnergy = self->_hasActiveEnergy;
  if (self->_hasActiveEnergy)
  {
    char v6 = +[NSNumber numberWithUnsignedShort:self->_activeEnergy];
  }
  else
  {
    char v6 = @"(null)";
  }
  BOOL hasTotalEnergy = self->_hasTotalEnergy;
  if (self->_hasTotalEnergy)
  {
    v8 = +[NSNumber numberWithUnsignedShort:self->_totalEnergy];
  }
  else
  {
    v8 = @"(null)";
  }
  if (self->_hasAverageHeartRate)
  {
    v9 = +[NSNumber numberWithUnsignedShort:self->_averageHeartRate];
    v10 = +[NSString stringWithFormat:@"Eurotas Data: instantaneousHeartRate = %@, activeCalories = %@, totalCalories = %@, int averageHeartRate = %@, ", v4, v6, v8, v9];

    if (!hasTotalEnergy) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  v10 = +[NSString stringWithFormat:@"Eurotas Data: instantaneousHeartRate = %@, activeCalories = %@, totalCalories = %@, int averageHeartRate = %@, ", v4, v6, v8, @"(null)"];
  if (hasTotalEnergy) {
LABEL_12:
  }

LABEL_13:
  if (hasActiveEnergy) {

  }
  if (hasHeartRate) {

  }
  return v10;
}

- (id)getBinaryValueWithError:(id *)a3
{
  v9 = v10;
  if ([(id)objc_opt_class() uint8:0 toData:&v9 before:&v11])
  {
    if (self->_hasHeartRate && (sub_2B5F4((uint64_t)self, self->_heartRate, 1, (uint64_t)&v9, (uint64_t)&v11) & 1) == 0)
    {
      CFStringRef v6 = @"Not enough buffer for heart rate";
    }
    else if (self->_hasActiveEnergy {
           && (sub_2B5F4((uint64_t)self, self->_activeEnergy, 2, (uint64_t)&v9, (uint64_t)&v11) & 1) == 0)
    }
    {
      CFStringRef v6 = @"Not enough buffer for active energy";
    }
    else if (self->_hasTotalEnergy {
           && (sub_2B5F4((uint64_t)self, self->_totalEnergy, 3, (uint64_t)&v9, (uint64_t)&v11) & 1) == 0)
    }
    {
      CFStringRef v6 = @"Not enough buffer for total energy";
    }
    else
    {
      if (!self->_hasAverageHeartRate
        || (sub_2B5F4((uint64_t)self, self->_averageHeartRate, 4, (uint64_t)&v9, (uint64_t)&v11) & 1) != 0)
      {
        v5 = +[NSData dataWithBytes:v10 length:v9 - v10];
        goto LABEL_21;
      }
      CFStringRef v6 = @"Not enough buffer for average heart rate";
    }
    id v7 = +[NSError hk_error:303 description:v6];
    if (v7)
    {
      if (a3) {
        *a3 = v7;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  v5 = 0;
LABEL_21:

  return v5;
}

- (void)addHeartRate:(unsigned __int16)a3
{
  self->_BOOL hasHeartRate = 1;
  self->_int heartRate = a3;
}

- (void)addActiveEnergy:(unsigned __int16)a3
{
  self->_BOOL hasActiveEnergy = 1;
  self->_int activeEnergy = a3;
}

- (void)addTotalEnergy:(unsigned __int16)a3
{
  self->_BOOL hasTotalEnergy = 1;
  self->_int totalEnergy = a3;
}

- (void)addAverageHeartRate:(unsigned __int16)a3
{
  self->_BOOL hasAverageHeartRate = 1;
  self->_int averageHeartRate = a3;
}

- (BOOL)hasHeartRate
{
  return self->_hasHeartRate;
}

- (unsigned)heartRate
{
  return self->_heartRate;
}

- (BOOL)hasActiveEnergy
{
  return self->_hasActiveEnergy;
}

- (unsigned)activeEnergy
{
  return self->_activeEnergy;
}

- (BOOL)hasTotalEnergy
{
  return self->_hasTotalEnergy;
}

- (unsigned)totalEnergy
{
  return self->_totalEnergy;
}

- (BOOL)hasAverageHeartRate
{
  return self->_hasAverageHeartRate;
}

- (unsigned)averageHeartRate
{
  return self->_averageHeartRate;
}

@end