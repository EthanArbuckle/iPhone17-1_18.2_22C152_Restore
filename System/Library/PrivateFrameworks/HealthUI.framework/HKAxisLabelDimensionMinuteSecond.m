@interface HKAxisLabelDimensionMinuteSecond
- (HKAxisLabelDimensionMinuteSecond)initWithStartDate:(id)a3;
- (NSDate)startDate;
- (NSDateFormatter)dateFormatter;
- (id)stringForLocation:(id)a3 formatterForStepSize:(id)a4;
- (void)setDateFormatter:(id)a3;
- (void)setStartDate:(id)a3;
@end

@implementation HKAxisLabelDimensionMinuteSecond

- (HKAxisLabelDimensionMinuteSecond)initWithStartDate:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HKAxisLabelDimensionMinuteSecond;
  v6 = [(HKAxisLabelDimensionMinuteSecond *)&v10 init];
  if (v6)
  {
    v7 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    dateFormatter = v6->_dateFormatter;
    v6->_dateFormatter = v7;

    [(NSDateFormatter *)v6->_dateFormatter setDateFormat:@":ss"];
    objc_storeStrong((id *)&v6->_startDate, a3);
  }

  return v6;
}

- (id)stringForLocation:(id)a3 formatterForStepSize:(id)a4
{
  [a3 doubleValue];
  double v6 = v5;
  startDate = self->_startDate;
  if (startDate)
  {
    [(NSDate *)startDate timeIntervalSinceReferenceDate];
    double v6 = v6 + v8;
  }
  dateFormatter = self->_dateFormatter;
  objc_super v10 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v6];
  v11 = [(NSDateFormatter *)dateFormatter stringFromDate:v10];

  v12 = NSString;
  v13 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v14 = [v13 localizedStringForKey:@"TRUNCATED_SECONDS_TIME" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  v15 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v16 = [v15 localizedStringForKey:@"SECONDS_MEDIUM" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  v17 = objc_msgSend(v12, "stringWithFormat:", v14, v11, v16);

  return v17;
}

- (NSDateFormatter)dateFormatter
{
  return self->_dateFormatter;
}

- (void)setDateFormatter:(id)a3
{
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
}

@end