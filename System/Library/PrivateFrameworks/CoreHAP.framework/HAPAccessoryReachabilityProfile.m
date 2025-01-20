@interface HAPAccessoryReachabilityProfile
+ (double)timeIntervalFromMillisecondNumberValue:(id)a3;
+ (id)shortDescription;
- (HAPAccessoryReachabilityProfile)init;
- (HAPAccessoryReachabilityProfile)initWithDiscoveredServices:(id)a3;
- (HAPAccessoryReachabilityProfile)initWithProfile:(id)a3;
- (HAPCharacteristic)pollCharacteristic;
- (HAPCharacteristic)sleepIntervalCharacteristic;
- (NSString)description;
- (double)sleepInterval;
- (id)attributeDescriptions;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setPollCharacteristic:(id)a3;
- (void)setSleepInterval:(double)a3;
- (void)setSleepIntervalCharacteristic:(id)a3;
@end

@implementation HAPAccessoryReachabilityProfile

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pollCharacteristic, 0);

  objc_storeStrong((id *)&self->_sleepIntervalCharacteristic, 0);
}

- (void)setPollCharacteristic:(id)a3
{
}

- (HAPCharacteristic)pollCharacteristic
{
  return self->_pollCharacteristic;
}

- (void)setSleepIntervalCharacteristic:(id)a3
{
}

- (HAPCharacteristic)sleepIntervalCharacteristic
{
  return self->_sleepIntervalCharacteristic;
}

- (void)setSleepInterval:(double)a3
{
  self->_sleepInterval = a3;
}

- (double)sleepInterval
{
  return self->_sleepInterval;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[HAPAccessoryReachabilityProfile allocWithZone:a3];

  return [(HAPAccessoryReachabilityProfile *)v4 initWithProfile:self];
}

- (id)attributeDescriptions
{
  v15[3] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F653F8]);
  v4 = NSNumber;
  [(HAPAccessoryReachabilityProfile *)self sleepInterval];
  v5 = objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)[v3 initWithName:@"Sleep Interval" value:v5];
  id v7 = objc_alloc(MEMORY[0x1E4F653F8]);
  v8 = [(HAPAccessoryReachabilityProfile *)self sleepIntervalCharacteristic];
  v9 = (void *)[v7 initWithName:@"Sleep Interval Characteristic" value:v8];
  v15[1] = v9;
  id v10 = objc_alloc(MEMORY[0x1E4F653F8]);
  v11 = [(HAPAccessoryReachabilityProfile *)self pollCharacteristic];
  v12 = (void *)[v10 initWithName:@"Poll Characteristic" value:v11];
  v15[2] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:3];

  return v13;
}

- (NSString)description
{
  v10.receiver = self;
  v10.super_class = (Class)HAPAccessoryReachabilityProfile;
  id v3 = [(HMFObject *)&v10 description];
  v4 = NSString;
  double sleepInterval = self->_sleepInterval;
  v6 = [(HAPCharacteristic *)self->_sleepIntervalCharacteristic instanceID];
  id v7 = [(HAPCharacteristic *)self->_pollCharacteristic instanceID];
  v8 = [v4 stringWithFormat:@"%@ sleepInterval=%f sleepIntervalChar=%@ pollChar=%@", v3, *(void *)&sleepInterval, v6, v7];

  return (NSString *)v8;
}

- (HAPAccessoryReachabilityProfile)initWithDiscoveredServices:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(HAPAccessoryReachabilityProfile *)self init];
  if (v5)
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v37 objects:v42 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v38;
LABEL_4:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v38 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v37 + 1) + 8 * v10);
        v12 = [v11 type];
        char v13 = [v12 isEqualToString:@"00000239-0000-1000-8000-0026BB765291"];

        if (v13) {
          break;
        }
        if (v8 == ++v10)
        {
          uint64_t v8 = [v6 countByEnumeratingWithState:&v37 objects:v42 count:16];
          if (v8) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      id v14 = v11;

      if (!v14) {
        goto LABEL_29;
      }
      v31 = v14;
      id v32 = v4;
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      v15 = [v14 characteristics];
      uint64_t v16 = [v15 countByEnumeratingWithState:&v33 objects:v41 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v34;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v34 != v18) {
              objc_enumerationMutation(v15);
            }
            v20 = *(void **)(*((void *)&v33 + 1) + 8 * i);
            v21 = [v20 type];
            int v22 = [v21 isEqualToString:@"0000023A-0000-1000-8000-0026BB765291"];

            if (v22)
            {
              v23 = [v20 value];

              if (v23)
              {
                v24 = [v20 value];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  v25 = [v20 value];
                }
                else
                {
                  v25 = 0;
                }

                [(id)objc_opt_class() timeIntervalFromMillisecondNumberValue:v25];
                -[HAPAccessoryReachabilityProfile setSleepInterval:](v5, "setSleepInterval:");
              }
              [(HAPAccessoryReachabilityProfile *)v5 setSleepIntervalCharacteristic:v20];
            }
            else
            {
              v26 = [v20 type];
              int v27 = [v26 isEqualToString:@"0000023C-0000-1000-8000-0026BB765291"];

              if (v27) {
                [(HAPAccessoryReachabilityProfile *)v5 setPollCharacteristic:v20];
              }
            }
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v33 objects:v41 count:16];
        }
        while (v17);
      }

      v28 = v5;
      id v4 = v32;
    }
    else
    {
LABEL_10:

LABEL_29:
      v29 = v5;
    }
  }

  return v5;
}

- (HAPAccessoryReachabilityProfile)initWithProfile:(id)a3
{
  id v4 = a3;
  v5 = [(HAPAccessoryReachabilityProfile *)self init];
  if (v5)
  {
    [v4 sleepInterval];
    v5->_double sleepInterval = v6;
    uint64_t v7 = [v4 pollCharacteristic];
    pollCharacteristic = v5->_pollCharacteristic;
    v5->_pollCharacteristic = (HAPCharacteristic *)v7;

    uint64_t v9 = [v4 sleepIntervalCharacteristic];
    sleepIntervalCharacteristic = v5->_sleepIntervalCharacteristic;
    v5->_sleepIntervalCharacteristic = (HAPCharacteristic *)v9;

    v11 = v5;
  }

  return v5;
}

- (HAPAccessoryReachabilityProfile)init
{
  v6.receiver = self;
  v6.super_class = (Class)HAPAccessoryReachabilityProfile;
  v2 = [(HAPAccessoryReachabilityProfile *)&v6 init];
  id v3 = v2;
  if (v2) {
    id v4 = v2;
  }

  return v3;
}

+ (id)shortDescription
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

+ (double)timeIntervalFromMillisecondNumberValue:(id)a3
{
  return (double)(unint64_t)[a3 unsignedIntegerValue] / 1000.0;
}

@end