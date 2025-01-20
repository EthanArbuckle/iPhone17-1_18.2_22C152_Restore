@interface HKHeartRateSummaryReading
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKHeartRateSummaryReading)initWithCoder:(id)a3;
- (HKHeartRateSummaryReading)initWithDate:(id)a3 quantity:(id)a4;
- (HKHeartRateSummaryReading)initWithDate:(id)a3 quantity:(id)a4 context:(int64_t)a5;
- (HKQuantity)quantity;
- (NSDate)date;
- (id)description;
- (int64_t)context;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKHeartRateSummaryReading

- (HKHeartRateSummaryReading)initWithDate:(id)a3 quantity:(id)a4 context:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKHeartRateSummaryReading;
  v11 = [(HKHeartRateSummaryReading *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_date, a3);
    objc_storeStrong((id *)&v12->_quantity, a4);
    v12->_context = a5;
  }

  return v12;
}

- (HKHeartRateSummaryReading)initWithDate:(id)a3 quantity:(id)a4
{
  return [(HKHeartRateSummaryReading *)self initWithDate:a3 quantity:a4 context:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  date = self->_date;
  id v5 = a3;
  [v5 encodeObject:date forKey:@"Date"];
  [v5 encodeObject:self->_quantity forKey:@"Quantity"];
  [v5 encodeInteger:self->_context forKey:@"Context"];
}

- (HKHeartRateSummaryReading)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKHeartRateSummaryReading;
  id v5 = [(HKHeartRateSummaryReading *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Date"];
    date = v5->_date;
    v5->_date = (NSDate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Quantity"];
    quantity = v5->_quantity;
    v5->_quantity = (HKQuantity *)v8;

    v5->_context = [v4 decodeIntegerForKey:@"Context"];
  }

  return v5;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  quantity = self->_quantity;
  uint64_t v6 = +[HKUnit _countPerMinuteUnit];
  [(HKQuantity *)quantity doubleValueForUnit:v6];
  uint64_t v8 = v7;
  id v9 = _NSStringFromPrivateHeartRateContext(self->_context);
  id v10 = [v3 stringWithFormat:@"<%@:%p %.1fbpm (%@) @ %@>", v4, self, v8, v9, self->_date];

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v8 = (HKHeartRateSummaryReading *)a3;
  if (self == v8)
  {
    BOOL v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = [(HKHeartRateSummaryReading *)self date];
      id v10 = [(HKHeartRateSummaryReading *)v8 date];
      if (v9 == v10)
      {
        [(HKHeartRateSummaryReading *)self quantity];
      }
      else
      {
        uint64_t v11 = [(HKHeartRateSummaryReading *)v8 date];
        if (!v11)
        {
          BOOL v12 = 0;
          goto LABEL_23;
        }
        v3 = (void *)v11;
        uint64_t v4 = [(HKHeartRateSummaryReading *)self date];
        id v5 = [(HKHeartRateSummaryReading *)v8 date];
        if (![v4 isEqual:v5])
        {
          BOOL v12 = 0;
LABEL_22:

          goto LABEL_23;
        }
        [(HKHeartRateSummaryReading *)self quantity];
      v13 = };
      objc_super v14 = [(HKHeartRateSummaryReading *)v8 quantity];
      if (v13 == v14) {
        goto LABEL_15;
      }
      uint64_t v15 = [(HKHeartRateSummaryReading *)v8 quantity];
      if (!v15)
      {

        BOOL v12 = 0;
        goto LABEL_21;
      }
      uint64_t v6 = (void *)v15;
      uint64_t v4 = [(HKHeartRateSummaryReading *)self quantity];
      id v5 = [(HKHeartRateSummaryReading *)v8 quantity];
      if ([v4 isEqual:v5])
      {
LABEL_15:
        int64_t v16 = [(HKHeartRateSummaryReading *)self context];
        BOOL v12 = v16 == [(HKHeartRateSummaryReading *)v8 context];
        if (v13 == v14)
        {

          goto LABEL_20;
        }
      }
      else
      {
        BOOL v12 = 0;
      }

LABEL_20:
LABEL_21:
      id v5 = v19;
      uint64_t v4 = v21;
      if (v9 != v10) {
        goto LABEL_22;
      }
LABEL_23:

      goto LABEL_24;
    }
    BOOL v12 = 0;
  }
LABEL_24:

  return v12;
}

- (unint64_t)hash
{
  v3 = [(HKHeartRateSummaryReading *)self date];
  uint64_t v4 = [v3 hash];
  id v5 = [(HKHeartRateSummaryReading *)self quantity];
  uint64_t v6 = [v5 hash] ^ v4;
  unint64_t v7 = v6 ^ [(HKHeartRateSummaryReading *)self context];

  return v7;
}

- (NSDate)date
{
  return self->_date;
}

- (HKQuantity)quantity
{
  return self->_quantity;
}

- (int64_t)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quantity, 0);

  objc_storeStrong((id *)&self->_date, 0);
}

@end