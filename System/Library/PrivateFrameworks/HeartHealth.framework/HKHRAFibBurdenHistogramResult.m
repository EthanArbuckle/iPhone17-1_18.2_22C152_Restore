@interface HKHRAFibBurdenHistogramResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKHRAFibBurdenDayOfWeekHistogram)dayOfWeekHistogram;
- (HKHRAFibBurdenHistogramResult)initWithCoder:(id)a3;
- (HKHRAFibBurdenHistogramResult)initWithDayOfWeekHistogram:(id)a3 timeOfDayHistogram:(id)a4;
- (HKHRAFibBurdenTimeOfDayHistogram)timeOfDayHistogram;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKHRAFibBurdenHistogramResult

- (HKHRAFibBurdenHistogramResult)initWithDayOfWeekHistogram:(id)a3 timeOfDayHistogram:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKHRAFibBurdenHistogramResult;
  v9 = [(HKHRAFibBurdenHistogramResult *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dayOfWeekHistogram, a3);
    objc_storeStrong((id *)&v10->_timeOfDayHistogram, a4);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HKHRAFibBurdenHistogramResult *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      if ([(HKHRAFibBurdenDayOfWeekHistogram *)self->_dayOfWeekHistogram isEqual:v5->_dayOfWeekHistogram]) {
        BOOL v6 = [(HKHRAFibBurdenTimeOfDayHistogram *)self->_timeOfDayHistogram isEqual:v5->_timeOfDayHistogram];
      }
      else {
        BOOL v6 = 0;
      }
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3 = [(HKHRAFibBurdenDayOfWeekHistogram *)self->_dayOfWeekHistogram hash];
  return [(HKHRAFibBurdenTimeOfDayHistogram *)self->_timeOfDayHistogram hash] ^ v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  dayOfWeekHistogram = self->_dayOfWeekHistogram;
  id v5 = a3;
  [v5 encodeObject:dayOfWeekHistogram forKey:@"DayOfWeekHistogramKey"];
  [v5 encodeObject:self->_timeOfDayHistogram forKey:@"TimeOfDayHistogramKey"];
}

- (HKHRAFibBurdenHistogramResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKHRAFibBurdenHistogramResult;
  id v5 = [(HKHRAFibBurdenHistogramResult *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"DayOfWeekHistogramKey"];
    dayOfWeekHistogram = v5->_dayOfWeekHistogram;
    v5->_dayOfWeekHistogram = (HKHRAFibBurdenDayOfWeekHistogram *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TimeOfDayHistogramKey"];
    timeOfDayHistogram = v5->_timeOfDayHistogram;
    v5->_timeOfDayHistogram = (HKHRAFibBurdenTimeOfDayHistogram *)v8;
  }
  return v5;
}

- (HKHRAFibBurdenDayOfWeekHistogram)dayOfWeekHistogram
{
  return self->_dayOfWeekHistogram;
}

- (HKHRAFibBurdenTimeOfDayHistogram)timeOfDayHistogram
{
  return self->_timeOfDayHistogram;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeOfDayHistogram, 0);

  objc_storeStrong((id *)&self->_dayOfWeekHistogram, 0);
}

@end