@interface HMAccessoryNetworkAccessViolation
+ (BOOL)supportsSecureCoding;
- (BOOL)hasCurrentViolation;
- (BOOL)isEqual:(id)a3;
- (HMAccessoryNetworkAccessViolation)initWithCoder:(id)a3;
- (HMAccessoryNetworkAccessViolation)initWithLastViolationDate:(id)a3 lastViolationResetDate:(id)a4;
- (NSDate)lastResetDate;
- (NSDate)lastViolationDate;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMAccessoryNetworkAccessViolation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HMAccessoryNetworkAccessViolation)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMANAV.lastOccurrenceDate"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMANAV.lastResetDate"];

  v7 = [(HMAccessoryNetworkAccessViolation *)self initWithLastViolationDate:v5 lastViolationResetDate:v6];
  return v7;
}

- (HMAccessoryNetworkAccessViolation)initWithLastViolationDate:(id)a3 lastViolationResetDate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMAccessoryNetworkAccessViolation;
  v9 = [(HMAccessoryNetworkAccessViolation *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_lastViolationDate, a3);
    objc_storeStrong((id *)&v10->_lastResetDate, a4);
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastResetDate, 0);

  objc_storeStrong((id *)&self->_lastViolationDate, 0);
}

- (NSDate)lastResetDate
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (NSDate)lastViolationDate
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3B8];
  id v7 = NSString;
  id v8 = NSStringFromSelector(a2);
  v9 = [v7 stringWithFormat:@"%@ is unavailable", v8];
  id v10 = [v5 exceptionWithName:v6 reason:v9 userInfo:0];

  objc_exception_throw(v10);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HMAccessoryNetworkAccessViolation *)a3;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    uint64_t v6 = v5;
    if (v6
      && ([(HMAccessoryNetworkAccessViolation *)self lastViolationDate],
          id v7 = objc_claimAutoreleasedReturnValue(),
          [(HMAccessoryNetworkAccessViolation *)v6 lastViolationDate],
          id v8 = objc_claimAutoreleasedReturnValue(),
          int v9 = HMFEqualObjects(),
          v8,
          v7,
          v9))
    {
      id v10 = [(HMAccessoryNetworkAccessViolation *)self lastResetDate];
      v11 = [(HMAccessoryNetworkAccessViolation *)v6 lastResetDate];
      char v12 = HMFEqualObjects();
    }
    else
    {
      char v12 = 0;
    }
  }
  return v12;
}

- (unint64_t)hash
{
  v3 = [(HMAccessoryNetworkAccessViolation *)self lastViolationDate];
  uint64_t v4 = [v3 hash];
  v5 = [(HMAccessoryNetworkAccessViolation *)self lastResetDate];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (BOOL)hasCurrentViolation
{
  v3 = [(HMAccessoryNetworkAccessViolation *)self lastViolationDate];

  if (!v3) {
    return 0;
  }
  uint64_t v4 = [(HMAccessoryNetworkAccessViolation *)self lastResetDate];

  if (!v4) {
    return 1;
  }
  v5 = [(HMAccessoryNetworkAccessViolation *)self lastViolationDate];
  unint64_t v6 = [(HMAccessoryNetworkAccessViolation *)self lastResetDate];
  BOOL v7 = [v5 compare:v6] == 1;

  return v7;
}

@end