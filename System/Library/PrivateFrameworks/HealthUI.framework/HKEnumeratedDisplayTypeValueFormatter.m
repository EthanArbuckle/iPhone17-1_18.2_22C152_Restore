@interface HKEnumeratedDisplayTypeValueFormatter
- (id)attributedStringFromValue:(id)a3 displayType:(id)a4 unitController:(id)a5 valueFont:(id)a6 unitFont:(id)a7;
- (id)attributedStringFromValue:(id)a3 displayType:(id)a4 unitController:(id)a5 valueFont:(id)a6 unitFont:(id)a7 formatForChart:(BOOL)a8;
@end

@implementation HKEnumeratedDisplayTypeValueFormatter

- (id)attributedStringFromValue:(id)a3 displayType:(id)a4 unitController:(id)a5 valueFont:(id)a6 unitFont:(id)a7
{
  return [(HKEnumeratedDisplayTypeValueFormatter *)self attributedStringFromValue:a3 displayType:a4 unitController:a5 valueFont:a6 unitFont:a7 formatForChart:1];
}

- (id)attributedStringFromValue:(id)a3 displayType:(id)a4 unitController:(id)a5 valueFont:(id)a6 unitFont:(id)a7 formatForChart:(BOOL)a8
{
  v10 = NSNumber;
  id v11 = a6;
  id v12 = a4;
  v13 = objc_msgSend(v10, "numberWithInteger:", objc_msgSend(a3, "integerValue"));
  v14 = objc_msgSend(v12, "hk_enumeratedValueLabels");

  v15 = [v14 objectForKeyedSubscript:v13];
  if (!v15)
  {
    v15 = HKLocalizedNoDataString();
  }
  id v16 = objc_alloc(MEMORY[0x1E4F28B18]);
  v17 = [MEMORY[0x1E4FB1618] labelColor];
  v18 = HKAttributedStringAttributesForFont(v11, v17);

  v19 = (void *)[v16 initWithString:v15 attributes:v18];
  return v19;
}

@end