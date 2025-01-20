@interface HKClinicalIngestionOutcome
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)taskSuccess;
- (HKClinicalIngestionOutcome)init;
- (HKClinicalIngestionOutcome)initWithCoder:(id)a3;
- (HKClinicalIngestionOutcome)initWithTaskSuccess:(BOOL)a3 taskError:(id)a4 taskRuntime:(double)a5 perAccountOutcomes:(id)a6 analyticsString:(id)a7;
- (NSArray)perAccountOutcomes;
- (NSError)taskError;
- (NSNumber)taskRuntime;
- (NSString)analyticsString;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKClinicalIngestionOutcome

- (HKClinicalIngestionOutcome)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKClinicalIngestionOutcome)initWithTaskSuccess:(BOOL)a3 taskError:(id)a4 taskRuntime:(double)a5 perAccountOutcomes:(id)a6 analyticsString:(id)a7
{
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  v26.receiver = self;
  v26.super_class = (Class)HKClinicalIngestionOutcome;
  v15 = [(HKClinicalIngestionOutcome *)&v26 init];
  v16 = v15;
  if (v15)
  {
    v15->_taskSuccess = a3;
    uint64_t v17 = [v12 copy];
    taskError = v16->_taskError;
    v16->_taskError = (NSError *)v17;

    uint64_t v19 = [NSNumber numberWithDouble:a5];
    taskRuntime = v16->_taskRuntime;
    v16->_taskRuntime = (NSNumber *)v19;

    uint64_t v21 = [v13 copy];
    perAccountOutcomes = v16->_perAccountOutcomes;
    v16->_perAccountOutcomes = (NSArray *)v21;

    uint64_t v23 = [v14 copy];
    analyticsString = v16->_analyticsString;
    v16->_analyticsString = (NSString *)v23;
  }
  return v16;
}

- (unint64_t)hash
{
  BOOL taskSuccess = self->_taskSuccess;
  uint64_t v4 = [(NSError *)self->_taskError hash] ^ taskSuccess;
  uint64_t v5 = [(NSNumber *)self->_taskRuntime hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSArray *)self->_perAccountOutcomes hash];
  return v6 ^ [(NSString *)self->_analyticsString hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (HKClinicalIngestionOutcome *)a3;
  uint64_t v6 = v5;
  if (self != v5)
  {
    v7 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (BOOL taskSuccess = self->_taskSuccess, taskSuccess != [(HKClinicalIngestionOutcome *)v7 taskSuccess]))
    {
      LOBYTE(v14) = 0;
LABEL_39:

      goto LABEL_40;
    }
    taskError = self->_taskError;
    v10 = [(HKClinicalIngestionOutcome *)v7 taskError];
    if (taskError != v10)
    {
      uint64_t v11 = [(HKClinicalIngestionOutcome *)v7 taskError];
      if (!v11)
      {
        LOBYTE(v14) = 0;
        goto LABEL_38;
      }
      v3 = (void *)v11;
      id v12 = self->_taskError;
      id v13 = [(HKClinicalIngestionOutcome *)v7 taskError];
      if (![(NSError *)v12 isEqual:v13])
      {
        LOBYTE(v14) = 0;
LABEL_37:

        goto LABEL_38;
      }
      v40 = v13;
    }
    taskRuntime = self->_taskRuntime;
    v16 = [(HKClinicalIngestionOutcome *)v7 taskRuntime];
    if (taskRuntime == v16)
    {
      v39 = taskRuntime;
    }
    else
    {
      id v14 = [(HKClinicalIngestionOutcome *)v7 taskRuntime];
      if (!v14) {
        goto LABEL_35;
      }
      v39 = taskRuntime;
      uint64_t v17 = self->_taskRuntime;
      v18 = [(HKClinicalIngestionOutcome *)v7 taskRuntime];
      if (([(NSNumber *)v17 isEqual:v18] & 1) == 0)
      {

        LOBYTE(v14) = 0;
        goto LABEL_36;
      }
      v35 = v18;
      v36 = v14;
    }
    perAccountOutcomes = self->_perAccountOutcomes;
    v20 = [(HKClinicalIngestionOutcome *)v7 perAccountOutcomes];
    if (perAccountOutcomes == v20)
    {
      v37 = v3;
      v38 = perAccountOutcomes;
    }
    else
    {
      id v14 = [(HKClinicalIngestionOutcome *)v7 perAccountOutcomes];
      if (!v14)
      {
LABEL_32:

LABEL_33:
        if (v39 != v16)
        {
LABEL_34:
        }
LABEL_35:

LABEL_36:
        id v13 = v40;
        if (taskError != v10) {
          goto LABEL_37;
        }
LABEL_38:

        goto LABEL_39;
      }
      v38 = perAccountOutcomes;
      uint64_t v21 = self->_perAccountOutcomes;
      uint64_t v22 = [(HKClinicalIngestionOutcome *)v7 perAccountOutcomes];
      uint64_t v23 = v21;
      v24 = (void *)v22;
      if (![(NSArray *)v23 isEqualToArray:v22])
      {

        LOBYTE(v14) = 0;
        goto LABEL_33;
      }
      v32 = v24;
      v34 = v14;
      v37 = v3;
    }
    analyticsString = self->_analyticsString;
    uint64_t v26 = [(HKClinicalIngestionOutcome *)v7 analyticsString];
    LOBYTE(v14) = analyticsString == (NSString *)v26;
    if (analyticsString == (NSString *)v26)
    {
    }
    else
    {
      v27 = (void *)v26;
      uint64_t v28 = [(HKClinicalIngestionOutcome *)v7 analyticsString];
      if (v28)
      {
        v29 = (void *)v28;
        id v14 = self->_analyticsString;
        v30 = [(HKClinicalIngestionOutcome *)v7 analyticsString];
        LOBYTE(v14) = [v14 isEqualToString:v30];

        if (v38 == v20)
        {

LABEL_43:
          v3 = v37;
          if (v39 == v16) {
            goto LABEL_35;
          }
          goto LABEL_34;
        }

LABEL_41:
        goto LABEL_43;
      }
    }
    if (v38 == v20) {
      goto LABEL_41;
    }

    v3 = v37;
    goto LABEL_32;
  }
  LOBYTE(v14) = 1;
LABEL_40:

  return (char)v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKClinicalIngestionOutcome)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeBoolForKey:@"TaskSuccess"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TaskError"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TaskRuntime"];
  v8 = (void *)MEMORY[0x263EFFA08];
  uint64_t v9 = objc_opt_class();
  v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
  uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"PerAccountOutcomes"];
  id v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"AnalyticsString"];

  if (v7)
  {
    [v7 doubleValue];
    self = -[HKClinicalIngestionOutcome initWithTaskSuccess:taskError:taskRuntime:perAccountOutcomes:analyticsString:](self, "initWithTaskSuccess:taskError:taskRuntime:perAccountOutcomes:analyticsString:", v5, v6, v11, v12);
    id v13 = self;
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  [v7 encodeBool:self->_taskSuccess forKey:@"TaskSuccess"];
  taskError = self->_taskError;
  if (taskError) {
    [v7 encodeObject:taskError forKey:@"TaskError"];
  }
  [v7 encodeObject:self->_taskRuntime forKey:@"TaskRuntime"];
  perAccountOutcomes = self->_perAccountOutcomes;
  if (perAccountOutcomes) {
    [v7 encodeObject:perAccountOutcomes forKey:@"PerAccountOutcomes"];
  }
  analyticsString = self->_analyticsString;
  if (analyticsString) {
    [v7 encodeObject:analyticsString forKey:@"AnalyticsString"];
  }
}

- (BOOL)taskSuccess
{
  return self->_taskSuccess;
}

- (NSNumber)taskRuntime
{
  return self->_taskRuntime;
}

- (NSError)taskError
{
  return self->_taskError;
}

- (NSArray)perAccountOutcomes
{
  return self->_perAccountOutcomes;
}

- (NSString)analyticsString
{
  return self->_analyticsString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsString, 0);
  objc_storeStrong((id *)&self->_perAccountOutcomes, 0);
  objc_storeStrong((id *)&self->_taskError, 0);

  objc_storeStrong((id *)&self->_taskRuntime, 0);
}

@end