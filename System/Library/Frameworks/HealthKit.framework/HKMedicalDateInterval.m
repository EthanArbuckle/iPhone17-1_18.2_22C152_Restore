@interface HKMedicalDateInterval
+ (BOOL)supportsSecureCoding;
+ (HKMedicalDateInterval)medicalDateIntervalWithEndDate:(id)a3;
+ (HKMedicalDateInterval)medicalDateIntervalWithStartDate:(id)a3;
+ (HKMedicalDateInterval)medicalDateIntervalWithStartDate:(id)a3 endDate:(id)a4 error:(id *)a5;
- (BOOL)isEqual:(id)a3;
- (HKMedicalDate)endDate;
- (HKMedicalDate)startDate;
- (HKMedicalDateInterval)initWithCoder:(id)a3;
- (id)_initWithStartDate:(id)a3 endDate:(id)a4;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKMedicalDateInterval

+ (HKMedicalDateInterval)medicalDateIntervalWithStartDate:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"HKMedicalDateInterval.m", 20, @"Invalid parameter not satisfying: %@", @"startDate != nil" object file lineNumber description];
  }
  id v6 = [[HKMedicalDateInterval alloc] _initWithStartDate:v5 endDate:0];

  return (HKMedicalDateInterval *)v6;
}

+ (HKMedicalDateInterval)medicalDateIntervalWithEndDate:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"HKMedicalDateInterval.m", 25, @"Invalid parameter not satisfying: %@", @"endDate != nil" object file lineNumber description];
  }
  id v6 = [[HKMedicalDateInterval alloc] _initWithStartDate:0 endDate:v5];

  return (HKMedicalDateInterval *)v6;
}

+ (HKMedicalDateInterval)medicalDateIntervalWithStartDate:(id)a3 endDate:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, a1, @"HKMedicalDateInterval.m", 33, @"Invalid parameter not satisfying: %@", @"startDate != nil" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, a1, @"HKMedicalDateInterval.m", 34, @"Invalid parameter not satisfying: %@", @"endDate != nil" object file lineNumber description];

LABEL_3:
  v12 = [v9 dateForUTC];
  v13 = [v11 dateForUTC];
  int v14 = objc_msgSend(v12, "hk_isAfterDate:", v13);

  if (v14)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a5, 3, @"%@: endDate must not be before startDate", objc_opt_class());
    id v15 = 0;
  }
  else
  {
    id v15 = [[HKMedicalDateInterval alloc] _initWithStartDate:v9 endDate:v11];
  }

  return (HKMedicalDateInterval *)v15;
}

- (id)_initWithStartDate:(id)a3 endDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKMedicalDateInterval;
  v8 = [(HKMedicalDateInterval *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    startDate = v8->_startDate;
    v8->_startDate = (HKMedicalDate *)v9;

    uint64_t v11 = [v7 copy];
    endDate = v8->_endDate;
    v8->_endDate = (HKMedicalDate *)v11;
  }
  return v8;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(HKMedicalDateInterval *)self startDate];
  id v6 = [v5 description];
  id v7 = [(HKMedicalDateInterval *)self endDate];
  v8 = [v7 description];
  uint64_t v9 = [v3 stringWithFormat:@"%@: startDate: %@, endDate: %@", v4, v6, v8];

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKMedicalDateInterval)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKMedicalDateInterval;
  id v5 = [(HKMedicalDateInterval *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];
    startDate = v5->_startDate;
    v5->_startDate = (HKMedicalDate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"endDate"];
    endDate = v5->_endDate;
    v5->_endDate = (HKMedicalDate *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(HKMedicalDateInterval *)self startDate];
  [v4 encodeObject:v5 forKey:@"startDate"];

  id v6 = [(HKMedicalDateInterval *)self endDate];
  [v4 encodeObject:v6 forKey:@"endDate"];
}

- (unint64_t)hash
{
  v3 = [(HKMedicalDateInterval *)self startDate];
  uint64_t v4 = [v3 hash];
  id v5 = [(HKMedicalDateInterval *)self endDate];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HKMedicalDateInterval *)a3;
  if (self == v4)
  {
    BOOL v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      unint64_t v6 = [(HKMedicalDateInterval *)self startDate];
      uint64_t v7 = [(HKMedicalDateInterval *)v5 startDate];
      if (v6 == (void *)v7)
      {
      }
      else
      {
        uint64_t v8 = (void *)v7;
        uint64_t v9 = [(HKMedicalDateInterval *)v5 startDate];
        if (!v9) {
          goto LABEL_14;
        }
        id v10 = (void *)v9;
        objc_super v11 = [(HKMedicalDateInterval *)self startDate];
        v12 = [(HKMedicalDateInterval *)v5 startDate];
        int v13 = [v11 isEqual:v12];

        if (!v13) {
          goto LABEL_15;
        }
      }
      unint64_t v6 = [(HKMedicalDateInterval *)self endDate];
      uint64_t v15 = [(HKMedicalDateInterval *)v5 endDate];
      if (v6 == (void *)v15)
      {

LABEL_17:
        BOOL v14 = 1;
        goto LABEL_18;
      }
      uint64_t v8 = (void *)v15;
      uint64_t v16 = [(HKMedicalDateInterval *)v5 endDate];
      if (v16)
      {
        v17 = (void *)v16;
        v18 = [(HKMedicalDateInterval *)self endDate];
        v19 = [(HKMedicalDateInterval *)v5 endDate];
        char v20 = [v18 isEqual:v19];

        if (v20) {
          goto LABEL_17;
        }
LABEL_15:
        BOOL v14 = 0;
LABEL_18:

        goto LABEL_19;
      }
LABEL_14:

      goto LABEL_15;
    }
    BOOL v14 = 0;
  }
LABEL_19:

  return v14;
}

- (HKMedicalDate)startDate
{
  return self->_startDate;
}

- (HKMedicalDate)endDate
{
  return self->_endDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);

  objc_storeStrong((id *)&self->_startDate, 0);
}

@end