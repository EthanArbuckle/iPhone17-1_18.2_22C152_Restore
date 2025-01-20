@interface HKPopulationNormsUnboundedEndAxisLabel
- (HKPopulationNormsUnboundedEndAxisLabel)initWithRangeStart:(id)a3;
- (id)stringRepresentation;
@end

@implementation HKPopulationNormsUnboundedEndAxisLabel

- (HKPopulationNormsUnboundedEndAxisLabel)initWithRangeStart:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HKPopulationNormsUnboundedEndAxisLabel;
  return [(HKPopulationNormsAxisLabel *)&v4 initWithRangeStart:a3 end:0];
}

- (id)stringRepresentation
{
  v8.receiver = self;
  v8.super_class = (Class)HKPopulationNormsUnboundedEndAxisLabel;
  v2 = [(HKPopulationNormsAxisLabel *)&v8 stringRepresentation];
  v3 = NSString;
  objc_super v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v5 = [v4 localizedStringForKey:@"%@_UNBOUNDED_UPPER_RANGE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  v6 = objc_msgSend(v3, "stringWithFormat:", v5, v2);

  return v6;
}

@end