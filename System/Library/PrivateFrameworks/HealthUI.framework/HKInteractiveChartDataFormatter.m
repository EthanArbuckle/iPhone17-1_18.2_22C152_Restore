@interface HKInteractiveChartDataFormatter
- (HKDisplayType)displayType;
- (HKUnitPreferenceController)unitController;
- (UIFont)majorFont;
- (UIFont)minorFont;
- (id)_formattedPercentageStringWithValue:(double)a3 unitString:(id)a4 showUnit:(BOOL)a5;
- (id)attributedStringForValue:(id)a3;
- (id)attributedStringWithValue:(double)a3 unit:(id)a4 showUnit:(BOOL)a5;
- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 context:(int64_t)a4;
- (id)formattedStringWithValue:(double)a3 unitString:(id)a4 showUnit:(BOOL)a5;
- (id)unitStringFromUnit:(id)a3 number:(id)a4;
- (id)valueStringFromNumber:(id)a3;
- (void)setDisplayType:(id)a3;
- (void)setMajorFont:(id)a3;
- (void)setMinorFont:(id)a3;
- (void)setUnitController:(id)a3;
@end

@implementation HKInteractiveChartDataFormatter

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_displayType);
  objc_storeStrong((id *)&self->_unitController, 0);
  objc_storeStrong((id *)&self->_minorFont, 0);
  objc_storeStrong((id *)&self->_majorFont, 0);
}

- (id)formattedStringWithValue:(double)a3 unitString:(id)a4 showUnit:(BOOL)a5
{
  BOOL v5 = a5;
  v27[2] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v9 = [(HKInteractiveChartDataFormatter *)self displayType];
  if (v9)
  {
    v10 = [(HKInteractiveChartDataFormatter *)self displayType];
    v11 = [v10 presentation];
    [v11 adjustedDoubleForDaemonDouble:a3];
    a3 = v12;
  }
  v13 = [NSNumber numberWithDouble:a3];
  v14 = [(HKInteractiveChartDataFormatter *)self attributedStringForValue:v13];

  if (v5 && [v8 length])
  {
    id v15 = objc_alloc(MEMORY[0x1E4F28B18]);
    v26[0] = *MEMORY[0x1E4FB06F8];
    v16 = [(HKInteractiveChartDataFormatter *)self minorFont];
    v27[0] = v16;
    v26[1] = *MEMORY[0x1E4FB0700];
    v17 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartLollipopLabelColor");
    v27[1] = v17;
    v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:2];
    v19 = (void *)[v15 initWithString:v8 attributes:v18];

    v25[0] = v14;
    v25[1] = v19;
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
    v21 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v22 = [v21 localizedStringForKey:@"QUANTITY_TYPE_DISPLAY_FORMAT %@ %@" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    HKUIJoinAttributedStringsWithFormat(v20, v22);
    id v23 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v23 = v14;
  }

  return v23;
}

- (id)_formattedPercentageStringWithValue:(double)a3 unitString:(id)a4 showUnit:(BOOL)a5
{
  BOOL v5 = a5;
  v28[2] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  v9 = v8;
  if (v5 && [v8 length])
  {
    v10 = [(HKInteractiveChartDataFormatter *)self displayType];
    if (v10)
    {
      v11 = [(HKInteractiveChartDataFormatter *)self displayType];
      double v12 = [v11 presentation];
      [v12 adjustedDoubleForDaemonDouble:a3];
      a3 = v13;
    }
    v14 = [NSNumber numberWithDouble:a3];
    id v15 = [(HKInteractiveChartDataFormatter *)self attributedStringForValue:v14];

    id v16 = objc_alloc(MEMORY[0x1E4F28B18]);
    v27[0] = *MEMORY[0x1E4FB06F8];
    v17 = [(HKInteractiveChartDataFormatter *)self minorFont];
    v28[0] = v17;
    v27[1] = *MEMORY[0x1E4FB0700];
    v18 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartLollipopLabelColor");
    v28[1] = v18;
    v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];
    v20 = (void *)[v16 initWithString:v9 attributes:v19];

    v26[0] = v15;
    v26[1] = v20;
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
    v22 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    id v23 = [v22 localizedStringForKey:@"PERCENTAGE_QUANTITY_TYPE_DISPLAY_FORMAT %@ %@" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    v24 = HKUIJoinAttributedStringsWithFormat(v21, v23);
  }
  else
  {
    v24 = [(HKInteractiveChartDataFormatter *)self formattedStringWithValue:v9 unitString:v5 showUnit:a3];
  }

  return v24;
}

- (id)unitStringFromUnit:(id)a3 number:(id)a4
{
  id v6 = a4;
  v7 = [(HKInteractiveChartDataFormatter *)self unitController];
  id v8 = [(HKInteractiveChartDataFormatter *)self displayType];
  if (a3) {
    [v7 localizedDisplayNameForDisplayType:v8 value:v6];
  }
  else {
  v9 = HKUIUnitDisplayName(v7, v8, (uint64_t)v6);
  }

  return v9;
}

- (id)attributedStringWithValue:(double)a3 unit:(id)a4 showUnit:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = NSNumber;
  id v9 = a4;
  v10 = [v8 numberWithDouble:a3];
  v11 = [(HKInteractiveChartDataFormatter *)self unitStringFromUnit:v9 number:v10];

  double v12 = [MEMORY[0x1E4F2B618] percentUnit];
  int v13 = [v9 isEqual:v12];

  if (v13) {
    [(HKInteractiveChartDataFormatter *)self _formattedPercentageStringWithValue:v11 unitString:v5 showUnit:a3];
  }
  else {
  v14 = [(HKInteractiveChartDataFormatter *)self formattedStringWithValue:v11 unitString:v5 showUnit:a3];
  }

  return v14;
}

- (id)attributedStringForValue:(id)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v4 = [(HKInteractiveChartDataFormatter *)self valueStringFromNumber:a3];
  id v5 = objc_alloc(MEMORY[0x1E4F28B18]);
  v11[0] = *MEMORY[0x1E4FB06F8];
  id v6 = [(HKInteractiveChartDataFormatter *)self majorFont];
  v12[0] = v6;
  v11[1] = *MEMORY[0x1E4FB0700];
  v7 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartLollipopValueColor");
  v12[1] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  id v9 = (void *)[v5 initWithString:v4 attributes:v8];

  return v9;
}

- (id)valueStringFromNumber:(id)a3
{
  id v4 = a3;
  id v5 = [(HKInteractiveChartDataFormatter *)self displayType];
  id v6 = [(HKInteractiveChartDataFormatter *)self unitController];
  v7 = HKFormattedStringFromValue(v4, v5, v6, 0, 0);

  return v7;
}

- (UIFont)majorFont
{
  return self->_majorFont;
}

- (void)setMajorFont:(id)a3
{
}

- (UIFont)minorFont
{
  return self->_minorFont;
}

- (void)setMinorFont:(id)a3
{
}

- (HKUnitPreferenceController)unitController
{
  return self->_unitController;
}

- (void)setUnitController:(id)a3
{
}

- (HKDisplayType)displayType
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_displayType);
  return (HKDisplayType *)WeakRetained;
}

- (void)setDisplayType:(id)a3
{
}

- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 context:(int64_t)a4
{
  return (id)MEMORY[0x1E4F1CBF0];
}

@end