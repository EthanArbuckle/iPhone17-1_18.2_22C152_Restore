@interface HKDisplayTypeValueFormatter
- (HKDisplayTypeValueFormatter)initWithNumberFormatter:(id)a3;
- (id)attributedStringFromValue:(id)a3 displayType:(id)a4 unitController:(id)a5 valueFont:(id)a6 unitFont:(id)a7;
- (id)attributedStringFromValue:(id)a3 displayType:(id)a4 unitController:(id)a5 valueFont:(id)a6 unitFont:(id)a7 formatForChart:(BOOL)a8;
- (id)attributedStringFromValue:(id)a3 displayType:(id)a4 unitController:(id)a5 valueFont:(id)a6 unitFont:(id)a7 formatForChart:(BOOL)a8 unitFormatString:(id)a9;
- (id)stringFromValue:(id)a3 displayType:(id)a4 unitController:(id)a5;
@end

@implementation HKDisplayTypeValueFormatter

- (void).cxx_destruct
{
}

- (HKDisplayTypeValueFormatter)initWithNumberFormatter:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKDisplayTypeValueFormatter;
  v6 = [(HKDisplayTypeValueFormatter *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_numberFormatter, a3);
  }

  return v7;
}

- (id)stringFromValue:(id)a3 displayType:(id)a4 unitController:(id)a5
{
  v8 = (void *)MEMORY[0x1E4FB08E0];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [v8 systemFontOfSize:0.0];
  v13 = [(HKDisplayTypeValueFormatter *)self attributedStringFromValue:v11 displayType:v10 unitController:v9 valueFont:v12 unitFont:v12];

  v14 = [v13 string];

  return v14;
}

- (id)attributedStringFromValue:(id)a3 displayType:(id)a4 unitController:(id)a5 valueFont:(id)a6 unitFont:(id)a7
{
  return 0;
}

- (id)attributedStringFromValue:(id)a3 displayType:(id)a4 unitController:(id)a5 valueFont:(id)a6 unitFont:(id)a7 formatForChart:(BOOL)a8
{
  return 0;
}

- (id)attributedStringFromValue:(id)a3 displayType:(id)a4 unitController:(id)a5 valueFont:(id)a6 unitFont:(id)a7 formatForChart:(BOOL)a8 unitFormatString:(id)a9
{
  return 0;
}

@end