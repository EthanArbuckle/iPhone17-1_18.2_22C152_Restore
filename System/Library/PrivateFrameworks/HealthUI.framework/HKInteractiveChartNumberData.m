@interface HKInteractiveChartNumberData
- (NSNumber)value;
- (NSNumberFormatter)numberFormatter;
- (void)setNumberFormatter:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation HKInteractiveChartNumberData

- (NSNumber)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (NSNumberFormatter)numberFormatter
{
  return self->_numberFormatter;
}

- (void)setNumberFormatter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_numberFormatter, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

@end