@interface HKMCUnconfirmedDeviation
+ (BOOL)supportsSecureCoding;
- ($0AC6E346AE4835514AAA8AC86D8F4844)days;
- (BOOL)isEqual:(id)a3;
- (HKMCUnconfirmedDeviation)initWithCoder:(id)a3;
- (HKMCUnconfirmedDeviation)initWithType:(int64_t)a3 days:(id)a4 analyticsMetadata:(id)a5;
- (NSDictionary)analyticsMetadata;
- (NSString)hk_redactedDescription;
- (id)description;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKMCUnconfirmedDeviation

- (HKMCUnconfirmedDeviation)initWithType:(int64_t)a3 days:(id)a4 analyticsMetadata:(id)a5
{
  int64_t var1 = a4.var1;
  int64_t var0 = a4.var0;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HKMCUnconfirmedDeviation;
  v11 = [(HKMCUnconfirmedDeviation *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_type = a3;
    v11->_days.start = var0;
    v11->_days.duration = var1;
    objc_storeStrong((id *)&v11->_analyticsMetadata, a5);
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type = self->_type;
  id v5 = a3;
  [v5 encodeInteger:type forKey:@"Type"];
  [v5 encodeInteger:self->_days.start forKey:@"DaysStart"];
  [v5 encodeInteger:self->_days.duration forKey:@"DaysDuration"];
  [v5 encodeObject:self->_analyticsMetadata forKey:@"AnalyticsMetadata"];
}

- (HKMCUnconfirmedDeviation)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HKMCUnconfirmedDeviation;
  id v5 = [(HKMCUnconfirmedDeviation *)&v16 init];
  if (v5)
  {
    v5->_int64_t type = [v4 decodeIntegerForKey:@"Type"];
    v5->_days.start = [v4 decodeIntegerForKey:@"DaysStart"];
    v5->_days.duration = [v4 decodeIntegerForKey:@"DaysDuration"];
    v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"AnalyticsMetadata"];
    analyticsMetadata = v5->_analyticsMetadata;
    v5->_analyticsMetadata = (NSDictionary *)v13;
  }
  return v5;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = NSStringFromDeviationType(self->_type);
  v6 = NSStringFromHKDayIndexRange();
  uint64_t v7 = [v3 stringWithFormat:@"<%@:%p type:%@ days:%@ analytics:%@>", v4, self, v5, v6, self->_analyticsMetadata];

  return v7;
}

- (NSString)hk_redactedDescription
{
  return (NSString *)[NSString stringWithFormat:@"<%@:%p>", objc_opt_class(), self];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HKMCUnconfirmedDeviation *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (int64_t v5 = [(HKMCUnconfirmedDeviation *)self type], v5 == [(HKMCUnconfirmedDeviation *)v4 type]))
    {
      uint64_t v6 = [(HKMCUnconfirmedDeviation *)self days];
      uint64_t v8 = v7;
      char v10 = 0;
      if (v6 == [(HKMCUnconfirmedDeviation *)v4 days] && v8 == v9)
      {
        uint64_t v11 = [(HKMCUnconfirmedDeviation *)self analyticsMetadata];
        v12 = [(HKMCUnconfirmedDeviation *)v4 analyticsMetadata];
        if (v11 == v12)
        {
          char v10 = 1;
        }
        else
        {
          uint64_t v13 = [(HKMCUnconfirmedDeviation *)v4 analyticsMetadata];
          if (v13)
          {
            objc_super v14 = [(HKMCUnconfirmedDeviation *)self analyticsMetadata];
            v15 = [(HKMCUnconfirmedDeviation *)v4 analyticsMetadata];
            char v10 = [v14 isEqual:v15];
          }
          else
          {
            char v10 = 0;
          }
        }
      }
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  int64_t v2 = self->_days.start ^ self->_type ^ self->_days.duration;
  return v2 ^ [(NSDictionary *)self->_analyticsMetadata hash];
}

- (int64_t)type
{
  return self->_type;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)days
{
  int64_t duration = self->_days.duration;
  int64_t start = self->_days.start;
  result.int64_t var1 = duration;
  result.int64_t var0 = start;
  return result;
}

- (NSDictionary)analyticsMetadata
{
  return self->_analyticsMetadata;
}

- (void).cxx_destruct
{
}

@end