@interface HKPopulationNormsAxisLabel
- (HKPopulationNormsAxisLabel)initWithRangeStart:(id)a3 end:(id)a4;
- (HKPopulationNormsAxisLabel)initWithValue:(id)a3;
- (NSNumber)rangeEnd;
- (NSNumber)rangeStart;
- (NSString)separatorString;
- (id)stringRepresentation;
- (void)setRangeStart:(id)a3;
@end

@implementation HKPopulationNormsAxisLabel

- (HKPopulationNormsAxisLabel)initWithValue:(id)a3
{
  return [(HKPopulationNormsAxisLabel *)self initWithRangeStart:a3 end:0];
}

- (HKPopulationNormsAxisLabel)initWithRangeStart:(id)a3 end:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKPopulationNormsAxisLabel;
  v8 = [(HKPopulationNormsAxisLabel *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    rangeStart = v8->_rangeStart;
    v8->_rangeStart = (NSNumber *)v9;

    uint64_t v11 = [v7 copy];
    rangeEnd = v8->_rangeEnd;
    v8->_rangeEnd = (NSNumber *)v11;
  }
  return v8;
}

- (NSString)separatorString
{
  v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v3 = [v2 localizedStringForKey:@"RANGE_SEPARATOR" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

  return (NSString *)v3;
}

- (id)stringRepresentation
{
  v3 = HKLocalizedStringForNumberWithDecimalPrecision(self->_rangeStart, 0, 0);
  rangeEnd = self->_rangeEnd;
  if (rangeEnd)
  {
    v5 = HKLocalizedStringForNumberWithDecimalPrecision(rangeEnd, 0, 0);
    id v6 = NSString;
    id v7 = [(HKPopulationNormsAxisLabel *)self separatorString];
    id v8 = [v6 stringWithFormat:@"%@%@%@", v3, v7, v5];
  }
  else
  {
    id v8 = v3;
  }

  return v8;
}

- (NSNumber)rangeStart
{
  return self->_rangeStart;
}

- (void)setRangeStart:(id)a3
{
}

- (NSNumber)rangeEnd
{
  return self->_rangeEnd;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rangeEnd, 0);
  objc_storeStrong((id *)&self->_rangeStart, 0);
}

@end