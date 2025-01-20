@interface HKInteractiveChartNumberRangeFormatter
- (BOOL)_shouldRemoveUnit:(id)a3 fromMaximumFormattedValue:(id)a4;
- (BOOL)_shouldRemoveUnit:(id)a3 fromMinimumFormattedValue:(id)a4;
- (id)_attributedStringFromValue:(id)a3 withValueFormatter:(id)a4 displayType:(id)a5 unitController:(id)a6 valueFont:(id)a7 unitFont:(id)a8 formatForChart:(BOOL)a9;
- (id)attributedStringForMinimumString:(id)a3 maximumString:(id)a4 minimumUnitString:(id)a5 maximumUnitString:(id)a6 valueFont:(id)a7 formatForChart:(BOOL)a8 resultIsASingleValue:(BOOL *)a9;
- (id)attributedStringForMinimumValue:(id)a3 maximumValue:(id)a4 displayType:(id)a5 unitController:(id)a6 valueFont:(id)a7 unitFont:(id)a8 formatForChart:(BOOL)a9;
- (id)attributedStringForMinimumValue:(id)a3 maximumValue:(id)a4 displayType:(id)a5 unitController:(id)a6 valueFont:(id)a7 unitFont:(id)a8 formatForChart:(BOOL)a9 resultIsSingleValue:(BOOL *)a10;
- (id)stringForMinimumValue:(id)a3 maximumValue:(id)a4 displayType:(id)a5 unitPreferenceController:(id)a6;
@end

@implementation HKInteractiveChartNumberRangeFormatter

- (id)stringForMinimumValue:(id)a3 maximumValue:(id)a4 displayType:(id)a5 unitPreferenceController:(id)a6
{
  v10 = (void *)MEMORY[0x1E4FB08E0];
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  v15 = [v10 systemFontOfSize:12.0];
  LOBYTE(v19) = 0;
  v16 = [(HKInteractiveChartNumberRangeFormatter *)self attributedStringForMinimumValue:v14 maximumValue:v13 displayType:v12 unitController:v11 valueFont:v15 unitFont:v15 formatForChart:v19];

  v17 = [v16 string];

  return v17;
}

- (id)attributedStringForMinimumValue:(id)a3 maximumValue:(id)a4 displayType:(id)a5 unitController:(id)a6 valueFont:(id)a7 unitFont:(id)a8 formatForChart:(BOOL)a9
{
  LOBYTE(v10) = a9;
  return [(HKInteractiveChartNumberRangeFormatter *)self attributedStringForMinimumValue:a3 maximumValue:a4 displayType:a5 unitController:a6 valueFont:a7 unitFont:a8 formatForChart:v10 resultIsSingleValue:0];
}

- (id)attributedStringForMinimumValue:(id)a3 maximumValue:(id)a4 displayType:(id)a5 unitController:(id)a6 valueFont:(id)a7 unitFont:(id)a8 formatForChart:(BOOL)a9 resultIsSingleValue:(BOOL *)a10
{
  unint64_t v17 = (unint64_t)a3;
  unint64_t v18 = (unint64_t)a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  if (!v19)
  {
    v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2, self, @"HKInteractiveChartNumberRangeFormatter.m", 103, @"Invalid parameter not satisfying: %@", @"displayType != nil" object file lineNumber description];
  }
  if (v17 | v18)
  {
    v34 = [v20 unitForDisplayType:v19];
    uint64_t v23 = objc_msgSend(v19, "hk_valueFormatterForUnit:");
    if (v17)
    {
      LOBYTE(v31) = a9;
      v32 = [(HKInteractiveChartNumberRangeFormatter *)self _attributedStringFromValue:v17 withValueFormatter:v23 displayType:v19 unitController:v20 valueFont:v21 unitFont:v22 formatForChart:v31];
      v24 = [v20 localizedDisplayNameForDisplayType:v19 value:v17];
    }
    else
    {
      v32 = 0;
      v24 = 0;
    }
    id v35 = v22;
    v33 = (void *)v23;
    if (v18)
    {
      BOOL v26 = a9;
      LOBYTE(v31) = a9;
      v27 = [(HKInteractiveChartNumberRangeFormatter *)self _attributedStringFromValue:v18 withValueFormatter:v23 displayType:v19 unitController:v20 valueFont:v21 unitFont:v22 formatForChart:v31];
      v28 = [v20 localizedDisplayNameForDisplayType:v19 value:v18];
    }
    else
    {
      v27 = 0;
      v28 = 0;
      BOOL v26 = a9;
    }
    v25 = [(HKInteractiveChartNumberRangeFormatter *)self attributedStringForMinimumString:v32 maximumString:v27 minimumUnitString:v24 maximumUnitString:v28 valueFont:v21 formatForChart:v26 resultIsASingleValue:a10];

    id v22 = v35;
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (id)attributedStringForMinimumString:(id)a3 maximumString:(id)a4 minimumUnitString:(id)a5 maximumUnitString:(id)a6 valueFont:(id)a7 formatForChart:(BOOL)a8 resultIsASingleValue:(BOOL *)a9
{
  BOOL v9 = a8;
  v15 = a9;
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  if (v16 && v17)
  {
    id v21 = [v16 string];
    id v22 = [v17 string];
    int v23 = [v21 isEqualToString:v22];

    if (v23)
    {
      id v24 = v16;
      char v25 = 1;
      id v16 = v24;
      v15 = a9;
      if (!a9) {
        goto LABEL_21;
      }
LABEL_20:
      BOOL *v15 = v25;
      goto LABEL_21;
    }
    BOOL v26 = [v16 string];
    BOOL v27 = [(HKInteractiveChartNumberRangeFormatter *)self _shouldRemoveUnit:v18 fromMinimumFormattedValue:v26];

    if (v27)
    {
      v28 = (void *)[v16 mutableCopy];
      v29 = [v28 mutableString];
      objc_msgSend(v29, "_hk_trimString:", v18);

      v30 = [v28 mutableString];
      uint64_t v31 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
      objc_msgSend(v30, "_hk_trimCharactersInSet:", v31);

      uint64_t v32 = [v28 copy];
      id v16 = (id)v32;
    }
    v33 = [v17 string];
    BOOL v34 = [(HKInteractiveChartNumberRangeFormatter *)self _shouldRemoveUnit:v19 fromMaximumFormattedValue:v33];

    if (v34)
    {
      id v35 = (void *)[v17 mutableCopy];
      v36 = [v35 mutableString];
      objc_msgSend(v36, "_hk_trimString:", v19);

      v37 = [v35 mutableString];
      v38 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
      objc_msgSend(v37, "_hk_trimCharactersInSet:", v38);

      uint64_t v39 = [v35 copy];
      id v17 = (id)v39;
    }
    id v48 = v18;
    if (v9)
    {
      v40 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartLollipopValueColor");
    }
    else
    {
      v40 = 0;
    }
    id v41 = objc_alloc(MEMORY[0x1E4F28B18]);
    v42 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v43 = [v42 localizedStringForKey:@"OVERLAY_RANGE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    v44 = HKAttributedStringAttributesForFont(v20, v40);
    id v45 = v20;
    v46 = (void *)[v41 initWithString:v43 attributes:v44];

    id v24 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F28B18]), "initWithFormat:options:locale:", v46, 1, 0, v16, v17);
    id v20 = v45;

    char v25 = 0;
    id v18 = v48;
    v15 = a9;
    if (a9) {
      goto LABEL_20;
    }
  }
  else if (v16)
  {
    id v24 = v16;
    char v25 = 1;
    id v16 = v24;
    if (a9) {
      goto LABEL_20;
    }
  }
  else if (v17)
  {
    id v24 = v17;
    id v16 = 0;
    char v25 = 1;
    id v17 = v24;
    if (a9) {
      goto LABEL_20;
    }
  }
  else
  {
    id v24 = 0;
    id v16 = 0;
    char v25 = 1;
    if (a9) {
      goto LABEL_20;
    }
  }
LABEL_21:

  return v24;
}

- (BOOL)_shouldRemoveUnit:(id)a3 fromMinimumFormattedValue:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([MEMORY[0x1E4FB1EB0] userInterfaceLayoutDirectionForSemanticContentAttribute:0] == 1)
  {
    BOOL v7 = 1;
  }
  else
  {
    uint64_t v8 = [v6 rangeOfString:v5 options:4];
    BOOL v7 = v8 != 0x7FFFFFFFFFFFFFFFLL && [v6 length] == v8 + v9;
  }

  return v7;
}

- (BOOL)_shouldRemoveUnit:(id)a3 fromMaximumFormattedValue:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = [MEMORY[0x1E4FB1EB0] userInterfaceLayoutDirectionForSemanticContentAttribute:0] != 1
    && [v6 rangeOfString:v5] == 0;

  return v7;
}

- (id)_attributedStringFromValue:(id)a3 withValueFormatter:(id)a4 displayType:(id)a5 unitController:(id)a6 valueFont:(id)a7 unitFont:(id)a8 formatForChart:(BOOL)a9
{
  id v29 = a8;
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a3;
  id v18 = [a4 stringFromValue:v17 displayType:v16 unitController:v15];
  if (a9)
  {
    id v19 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartLollipopValueColor");
  }
  else
  {
    id v19 = 0;
  }
  id v20 = objc_alloc(MEMORY[0x1E4F28E48]);
  id v21 = HKAttributedStringAttributesForFont(v14, v19);

  id v22 = (void *)[v20 initWithString:v18 attributes:v21];
  int v23 = [v15 localizedDisplayNameForDisplayType:v16 value:v17];

  if (a9)
  {
    id v24 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartLollipopLabelColor");
  }
  else
  {
    id v24 = 0;
  }
  char v25 = HKAttributedStringAttributesForFont(v29, v24);
  uint64_t v26 = [v18 rangeOfString:v23];
  objc_msgSend(v22, "addAttributes:range:", v25, v26, v27);

  return v22;
}

@end