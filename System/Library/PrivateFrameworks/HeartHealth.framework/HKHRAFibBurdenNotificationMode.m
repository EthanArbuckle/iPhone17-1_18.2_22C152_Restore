@interface HKHRAFibBurdenNotificationMode
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldForwardToWatch;
- (HKHRAFibBurdenNotificationMode)initWithCoder:(id)a3;
- (HKHRAFibBurdenNotificationMode)initWithType:(int64_t)a3 shouldForwardToWatch:(BOOL)a4 currentPercentage:(id)a5 currentValueClamped:(id)a6 currentValueDateInterval:(id)a7 currentValueUUID:(id)a8 previousPercentage:(id)a9 previousValueClamped:(id)a10 previousTimeZoneDiffersFromCurrent:(id)a11;
- (NSDateInterval)currentValueDateInterval;
- (NSNumber)currentPercentage;
- (NSNumber)currentValueClamped;
- (NSNumber)previousPercentage;
- (NSNumber)previousTimeZoneDiffersFromCurrent;
- (NSNumber)previousValueClamped;
- (NSUUID)currentValueUUID;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKHRAFibBurdenNotificationMode

- (HKHRAFibBurdenNotificationMode)initWithType:(int64_t)a3 shouldForwardToWatch:(BOOL)a4 currentPercentage:(id)a5 currentValueClamped:(id)a6 currentValueDateInterval:(id)a7 currentValueUUID:(id)a8 previousPercentage:(id)a9 previousValueClamped:(id)a10 previousTimeZoneDiffersFromCurrent:(id)a11
{
  id v27 = a5;
  id v26 = a6;
  id v25 = a7;
  id v24 = a8;
  id v23 = a9;
  id v16 = a10;
  id v17 = a11;
  v28.receiver = self;
  v28.super_class = (Class)HKHRAFibBurdenNotificationMode;
  v18 = [(HKHRAFibBurdenNotificationMode *)&v28 init];
  v19 = v18;
  if (v18)
  {
    v18->_type = a3;
    v18->_shouldForwardToWatch = a4;
    objc_storeStrong((id *)&v18->_currentPercentage, a5);
    objc_storeStrong((id *)&v19->_currentValueClamped, a6);
    objc_storeStrong((id *)&v19->_currentValueDateInterval, a7);
    objc_storeStrong((id *)&v19->_currentValueUUID, a8);
    objc_storeStrong((id *)&v19->_previousPercentage, a9);
    objc_storeStrong((id *)&v19->_previousValueClamped, a10);
    objc_storeStrong((id *)&v19->_previousTimeZoneDiffersFromCurrent, a11);
  }

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int64_t type = self->_type;
    if (type == [v5 type]
      && (int shouldForwardToWatch = self->_shouldForwardToWatch,
          shouldForwardToWatch == [v5 shouldForwardToWatch]))
    {
      currentPercentage = self->_currentPercentage;
      v9 = [v5 currentPercentage];
      if ([(NSNumber *)currentPercentage isEqualToNumber:v9])
      {
        currentValueClamped = self->_currentValueClamped;
        v11 = [v5 currentValueClamped];
        if ([(NSNumber *)currentValueClamped isEqualToNumber:v11])
        {
          currentValueDateInterval = self->_currentValueDateInterval;
          v13 = [v5 currentValueDateInterval];
          if ([(NSDateInterval *)currentValueDateInterval isEqualToDateInterval:v13])
          {
            currentValueUUID = self->_currentValueUUID;
            v15 = [v5 currentValueUUID];
            if ([(NSUUID *)currentValueUUID isEqual:v15])
            {
              previousPercentage = self->_previousPercentage;
              id v17 = [v5 previousPercentage];
              if ([(NSNumber *)previousPercentage isEqualToNumber:v17])
              {
                previousValueClamped = self->_previousValueClamped;
                v19 = [v5 previousValueClamped];
                if ([(NSNumber *)previousValueClamped isEqualToNumber:v19])
                {
                  previousTimeZoneDiffersFromCurrent = self->_previousTimeZoneDiffersFromCurrent;
                  v21 = [v5 previousTimeZoneDiffersFromCurrent];
                  BOOL v22 = [(NSNumber *)previousTimeZoneDiffersFromCurrent isEqualToNumber:v21];
                }
                else
                {
                  BOOL v22 = 0;
                }
              }
              else
              {
                BOOL v22 = 0;
              }
            }
            else
            {
              BOOL v22 = 0;
            }
          }
          else
          {
            BOOL v22 = 0;
          }
        }
        else
        {
          BOOL v22 = 0;
        }
      }
      else
      {
        BOOL v22 = 0;
      }
    }
    else
    {
      BOOL v22 = 0;
    }
  }
  else
  {
    BOOL v22 = 0;
  }

  return v22;
}

- (unint64_t)hash
{
  int64_t v3 = self->_type ^ self->_shouldForwardToWatch;
  uint64_t v4 = v3 ^ [(NSNumber *)self->_currentPercentage hash];
  uint64_t v5 = [(NSNumber *)self->_currentValueClamped hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSDateInterval *)self->_currentValueDateInterval hash];
  uint64_t v7 = [(NSUUID *)self->_currentValueUUID hash];
  uint64_t v8 = v7 ^ [(NSNumber *)self->_previousPercentage hash];
  uint64_t v9 = v6 ^ v8 ^ [(NSNumber *)self->_previousValueClamped hash];
  return v9 ^ [(NSNumber *)self->_previousTimeZoneDiffersFromCurrent hash];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type = self->_type;
  id v5 = a3;
  [v5 encodeInteger:type forKey:@"type"];
  [v5 encodeBool:self->_shouldForwardToWatch forKey:@"shouldForwardToWatch"];
  [v5 encodeObject:self->_currentPercentage forKey:@"currentPercentage"];
  [v5 encodeObject:self->_currentValueClamped forKey:@"currentValueClamped"];
  [v5 encodeObject:self->_currentValueDateInterval forKey:@"currentValueDateInterval"];
  [v5 encodeObject:self->_currentValueUUID forKey:@"currentValueUUID"];
  [v5 encodeObject:self->_previousPercentage forKey:@"previousPercentage"];
  [v5 encodeObject:self->_previousValueClamped forKey:@"previousValueClamped"];
  [v5 encodeObject:self->_previousTimeZoneDiffersFromCurrent forKey:@"previousTimeZoneDiffersFromCurrent"];
}

- (HKHRAFibBurdenNotificationMode)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)HKHRAFibBurdenNotificationMode;
  id v5 = [(HKHRAFibBurdenNotificationMode *)&v21 init];
  if (v5)
  {
    v5->_int64_t type = [v4 decodeIntegerForKey:@"type"];
    v5->_int shouldForwardToWatch = [v4 decodeBoolForKey:@"shouldForwardToWatch"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currentPercentage"];
    currentPercentage = v5->_currentPercentage;
    v5->_currentPercentage = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currentValueClamped"];
    currentValueClamped = v5->_currentValueClamped;
    v5->_currentValueClamped = (NSNumber *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currentValueDateInterval"];
    currentValueDateInterval = v5->_currentValueDateInterval;
    v5->_currentValueDateInterval = (NSDateInterval *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currentValueUUID"];
    currentValueUUID = v5->_currentValueUUID;
    v5->_currentValueUUID = (NSUUID *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"previousPercentage"];
    previousPercentage = v5->_previousPercentage;
    v5->_previousPercentage = (NSNumber *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"previousValueClamped"];
    previousValueClamped = v5->_previousValueClamped;
    v5->_previousValueClamped = (NSNumber *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"previousTimeZoneDiffersFromCurrent"];
    previousTimeZoneDiffersFromCurrent = v5->_previousTimeZoneDiffersFromCurrent;
    v5->_previousTimeZoneDiffersFromCurrent = (NSNumber *)v18;
  }
  return v5;
}

- (int64_t)type
{
  return self->_type;
}

- (BOOL)shouldForwardToWatch
{
  return self->_shouldForwardToWatch;
}

- (NSNumber)currentPercentage
{
  return self->_currentPercentage;
}

- (NSNumber)currentValueClamped
{
  return self->_currentValueClamped;
}

- (NSDateInterval)currentValueDateInterval
{
  return self->_currentValueDateInterval;
}

- (NSUUID)currentValueUUID
{
  return self->_currentValueUUID;
}

- (NSNumber)previousPercentage
{
  return self->_previousPercentage;
}

- (NSNumber)previousValueClamped
{
  return self->_previousValueClamped;
}

- (NSNumber)previousTimeZoneDiffersFromCurrent
{
  return self->_previousTimeZoneDiffersFromCurrent;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousTimeZoneDiffersFromCurrent, 0);
  objc_storeStrong((id *)&self->_previousValueClamped, 0);
  objc_storeStrong((id *)&self->_previousPercentage, 0);
  objc_storeStrong((id *)&self->_currentValueUUID, 0);
  objc_storeStrong((id *)&self->_currentValueDateInterval, 0);
  objc_storeStrong((id *)&self->_currentValueClamped, 0);

  objc_storeStrong((id *)&self->_currentPercentage, 0);
}

@end