@interface HKDisplayTypePresentationConfiguration
- (BOOL)isEqual:(id)a3;
- (BOOL)singleDailyValue;
- (HKDisplayTypePresentationConfiguration)init;
- (HKDisplayTypePresentationConfiguration)initWithCurrentValue:(int64_t)a3 secondaryValue:(int64_t)a4 detailChart:(int64_t)a5 singleDailyValue:(BOOL)a6;
- (int64_t)currentValue;
- (int64_t)detailChart;
- (int64_t)secondaryValue;
- (unint64_t)hash;
@end

@implementation HKDisplayTypePresentationConfiguration

- (HKDisplayTypePresentationConfiguration)initWithCurrentValue:(int64_t)a3 secondaryValue:(int64_t)a4 detailChart:(int64_t)a5 singleDailyValue:(BOOL)a6
{
  v11.receiver = self;
  v11.super_class = (Class)HKDisplayTypePresentationConfiguration;
  result = [(HKDisplayTypePresentationConfiguration *)&v11 init];
  if (result)
  {
    result->_currentValue = a3;
    result->_secondaryValue = a4;
    result->_detailChart = a5;
    result->_singleDailyValue = a6;
  }
  return result;
}

- (HKDisplayTypePresentationConfiguration)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (unint64_t)hash
{
  return self->_secondaryValue ^ self->_currentValue ^ self->_detailChart ^ ((unint64_t)self->_singleDailyValue << 10);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && self->_currentValue == v4[2]
    && self->_secondaryValue == v4[3]
    && self->_detailChart == v4[4]
    && self->_singleDailyValue == *((unsigned __int8 *)v4 + 8);

  return v5;
}

- (int64_t)currentValue
{
  return self->_currentValue;
}

- (int64_t)secondaryValue
{
  return self->_secondaryValue;
}

- (int64_t)detailChart
{
  return self->_detailChart;
}

- (BOOL)singleDailyValue
{
  return self->_singleDailyValue;
}

@end