@interface HKAccessibilitySpan
- (HKAccessibilitySpan)initWithTitle:(id)a3 seriesType:(int64_t)a4 dataComprehensionMinYValue:(id)a5 dataComprehensionMaxYValue:(id)a6 dataComprehensionUnitForChart:(id)a7;
- (NSNumber)dataComprehensionMaxYValue;
- (NSNumber)dataComprehensionMinYValue;
- (NSString)dataComprehensionUnitForChart;
- (NSString)dataSeriesTitle;
- (id)description;
- (int64_t)dataSeriesType;
@end

@implementation HKAccessibilitySpan

- (HKAccessibilitySpan)initWithTitle:(id)a3 seriesType:(int64_t)a4 dataComprehensionMinYValue:(id)a5 dataComprehensionMaxYValue:(id)a6 dataComprehensionUnitForChart:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)HKAccessibilitySpan;
  v17 = [(HKAccessibilitySpan *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_dataSeriesTitle, a3);
    v18->_dataSeriesType = a4;
    objc_storeStrong((id *)&v18->_dataComprehensionMinYValue, a5);
    objc_storeStrong((id *)&v18->_dataComprehensionMaxYValue, a6);
    objc_storeStrong((id *)&v18->_dataComprehensionUnitForChart, a7);
  }

  return v18;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v4 = objc_msgSend(NSString, "stringWithFormat:", @"HKAccessibiltySpan %p:", self);
  [v3 addObject:v4];

  v5 = NSString;
  v6 = [(HKAccessibilitySpan *)self dataSeriesTitle];
  v7 = [v5 stringWithFormat:@"  dataSeriesTitle: '%@'", v6];
  [v3 addObject:v7];

  unint64_t v8 = [(HKAccessibilitySpan *)self dataSeriesType];
  if (v8 > 2) {
    v9 = @"Unknown";
  }
  else {
    v9 = off_1E6D536E8[v8];
  }
  v10 = [NSString stringWithFormat:@"  dataSeriesType = %@", v9];
  [v3 addObject:v10];

  v11 = NSString;
  v12 = [(HKAccessibilitySpan *)self dataComprehensionMinYValue];
  id v13 = [v11 stringWithFormat:@"  dataComprehensionMinYValue = %@", v12];
  [v3 addObject:v13];

  id v14 = NSString;
  id v15 = [(HKAccessibilitySpan *)self dataComprehensionMaxYValue];
  id v16 = [v14 stringWithFormat:@"  dataComprehensionMaxYValue = %@", v15];
  [v3 addObject:v16];

  v17 = NSString;
  v18 = [(HKAccessibilitySpan *)self dataComprehensionUnitForChart];
  v19 = [v17 stringWithFormat:@"  dataComprehensionUnitForChart = %@", v18];
  [v3 addObject:v19];

  objc_super v20 = [v3 componentsJoinedByString:@"\n"];

  return v20;
}

- (NSString)dataSeriesTitle
{
  return self->_dataSeriesTitle;
}

- (int64_t)dataSeriesType
{
  return self->_dataSeriesType;
}

- (NSNumber)dataComprehensionMinYValue
{
  return self->_dataComprehensionMinYValue;
}

- (NSNumber)dataComprehensionMaxYValue
{
  return self->_dataComprehensionMaxYValue;
}

- (NSString)dataComprehensionUnitForChart
{
  return self->_dataComprehensionUnitForChart;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataComprehensionUnitForChart, 0);
  objc_storeStrong((id *)&self->_dataComprehensionMaxYValue, 0);
  objc_storeStrong((id *)&self->_dataComprehensionMinYValue, 0);
  objc_storeStrong((id *)&self->_dataSeriesTitle, 0);
}

@end