@interface HKMostRecentRangeProviderCurrentValue
- (HKMostRecentRangeProviderCurrentValue)initWithMinimumValue:(id)a3 maximumValue:(id)a4 date:(id)a5;
- (NSDate)date;
- (id)attributedStringWithDisplayType:(id)a3 unitController:(id)a4 valueFont:(id)a5 unitFont:(id)a6 dateCache:(id)a7;
- (id)attributedSupplementaryStringWithDisplayType:(id)a3 unitController:(id)a4 font:(id)a5;
- (void)setDate:(id)a3;
@end

@implementation HKMostRecentRangeProviderCurrentValue

- (HKMostRecentRangeProviderCurrentValue)initWithMinimumValue:(id)a3 maximumValue:(id)a4 date:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HKMostRecentRangeProviderCurrentValue;
  v12 = [(HKMostRecentRangeProviderCurrentValue *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_date, a5);
    v13->_isSingleValue = 0;
    objc_storeStrong((id *)&v13->_minimumValue, a3);
    objc_storeStrong((id *)&v13->_maximumValue, a4);
  }

  return v13;
}

- (id)attributedStringWithDisplayType:(id)a3 unitController:(id)a4 valueFont:(id)a5 unitFont:(id)a6 dateCache:(id)a7
{
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  objc_super v15 = [v13 unitForDisplayType:v14];
  v16 = [v14 presentation];
  v17 = NSNumber;
  [(HKQuantity *)self->_minimumValue doubleValueForUnit:v15];
  v18 = objc_msgSend(v17, "numberWithDouble:");
  v19 = [v16 adjustedValueForDaemonValue:v18];

  v20 = [v14 presentation];
  v21 = NSNumber;
  [(HKQuantity *)self->_maximumValue doubleValueForUnit:v15];
  v22 = objc_msgSend(v21, "numberWithDouble:");
  v23 = [v20 adjustedValueForDaemonValue:v22];

  v24 = objc_alloc_init(HKInteractiveChartNumberRangeFormatter);
  LOBYTE(v27) = 1;
  v25 = [(HKInteractiveChartNumberRangeFormatter *)v24 attributedStringForMinimumValue:v19 maximumValue:v23 displayType:v14 unitController:v13 valueFont:v12 unitFont:v11 formatForChart:v27 resultIsSingleValue:&self->_isSingleValue];

  return v25;
}

- (id)attributedSupplementaryStringWithDisplayType:(id)a3 unitController:(id)a4 font:(id)a5
{
  if (self->_isSingleValue)
  {
    v5 = 0;
  }
  else
  {
    v6 = (void *)MEMORY[0x1E4F28B50];
    id v7 = a5;
    v8 = [v6 bundleWithIdentifier:@"com.apple.HealthUI"];
    id v9 = [v8 localizedStringForKey:@"RANGE_ABBREVIATED" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];

    id v10 = objc_alloc(MEMORY[0x1E4F28B18]);
    id v11 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    id v12 = HKAttributedStringAttributesForFont(v7, v11);

    v5 = (void *)[v10 initWithString:v9 attributes:v12];
  }
  return v5;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_maximumValue, 0);
  objc_storeStrong((id *)&self->_minimumValue, 0);
}

@end