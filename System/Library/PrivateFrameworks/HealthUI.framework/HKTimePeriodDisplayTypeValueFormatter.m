@interface HKTimePeriodDisplayTypeValueFormatter
- (id)attributedStringFromValue:(id)a3 displayType:(id)a4 unitController:(id)a5 valueFont:(id)a6 unitFont:(id)a7;
- (id)attributedStringFromValue:(id)a3 displayType:(id)a4 unitController:(id)a5 valueFont:(id)a6 unitFont:(id)a7 formatForChart:(BOOL)a8;
- (id)attributedStringFromValue:(id)a3 roundToHours:(BOOL)a4 displayType:(id)a5 unitController:(id)a6 valueFont:(id)a7 unitFont:(id)a8 formatForChart:(BOOL)a9;
- (id)attributedStringFromValue:(id)a3 roundToHours:(BOOL)a4 displayType:(id)a5 unitController:(id)a6 valueFont:(id)a7 unitFont:(id)a8 formatForChart:(BOOL)a9 usePerDayFormatting:(BOOL)a10;
- (id)stringFromValue:(id)a3 displayType:(id)a4 unitController:(id)a5;
@end

@implementation HKTimePeriodDisplayTypeValueFormatter

- (id)attributedStringFromValue:(id)a3 displayType:(id)a4 unitController:(id)a5 valueFont:(id)a6 unitFont:(id)a7
{
  LOBYTE(v8) = 1;
  return [(HKTimePeriodDisplayTypeValueFormatter *)self attributedStringFromValue:a3 roundToHours:0 displayType:a4 unitController:a5 valueFont:a6 unitFont:a7 formatForChart:v8];
}

- (id)attributedStringFromValue:(id)a3 displayType:(id)a4 unitController:(id)a5 valueFont:(id)a6 unitFont:(id)a7 formatForChart:(BOOL)a8
{
  LOBYTE(v9) = a8;
  return [(HKTimePeriodDisplayTypeValueFormatter *)self attributedStringFromValue:a3 roundToHours:0 displayType:a4 unitController:a5 valueFont:a6 unitFont:a7 formatForChart:v9];
}

- (id)attributedStringFromValue:(id)a3 roundToHours:(BOOL)a4 displayType:(id)a5 unitController:(id)a6 valueFont:(id)a7 unitFont:(id)a8 formatForChart:(BOOL)a9
{
  LOWORD(v10) = a9;
  return -[HKTimePeriodDisplayTypeValueFormatter attributedStringFromValue:roundToHours:displayType:unitController:valueFont:unitFont:formatForChart:usePerDayFormatting:](self, "attributedStringFromValue:roundToHours:displayType:unitController:valueFont:unitFont:formatForChart:usePerDayFormatting:", a3, a4, a5, a6, a7, a8, v10);
}

- (id)attributedStringFromValue:(id)a3 roundToHours:(BOOL)a4 displayType:(id)a5 unitController:(id)a6 valueFont:(id)a7 unitFont:(id)a8 formatForChart:(BOOL)a9 usePerDayFormatting:(BOOL)a10
{
  id v13 = a3;
  id v14 = a5;
  id v60 = a7;
  id v15 = a8;
  v16 = [v14 presentation];
  [v16 useSecondsWhenDisplayingDuration];

  v59 = v13;
  [v13 doubleValue];
  HKSeparateTimeIntervalComponents();
  v17 = [v14 presentation];
  [v17 useSecondsWhenDisplayingDuration];

  v63 = v15;
  v58 = v14;
  id v61 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v18 = HKIntegerFormatter();
  v19 = [NSNumber numberWithInteger:0];
  v20 = [v18 stringFromNumber:v19];

  v21 = NSString;
  v22 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  v23 = [v22 localizedStringForKey:@"MINUTES_PAIR_MEDIUM" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  v24 = objc_msgSend(v21, "localizedStringWithFormat:", v23, v20);

  v25 = [v24 stringByReplacingOccurrencesOfString:@" " withString:@"\uFFFC"];

  [v61 addObject:v25];
  uint64_t v26 = [v61 count];
  if (v26 == 3)
  {
    v32 = NSString;
    v33 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v30 = v33;
    if (a10) {
      v34 = @"TIME_DISPLAY_3_DAY";
    }
    else {
      v34 = @"TIME_DISPLAY_3";
    }
    v39 = [v33 localizedStringForKey:v34 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
    v40 = [v61 objectAtIndexedSubscript:0];
    v41 = [v61 objectAtIndexedSubscript:1];
    v42 = [v61 objectAtIndexedSubscript:2];
    objc_msgSend(v32, "localizedStringWithFormat:", v39, v40, v41, v42, v58);
    v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v27 = v60;
    if (v26 == 2)
    {
      v35 = NSString;
      v36 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      v30 = v36;
      if (a10) {
        v37 = @"TIME_DISPLAY_2_DAY";
      }
      else {
        v37 = @"TIME_DISPLAY_2";
      }
      v39 = [v36 localizedStringForKey:v37 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      v40 = [v61 objectAtIndexedSubscript:0];
      v43 = [v61 objectAtIndexedSubscript:1];
      objc_msgSend(v35, "localizedStringWithFormat:", v39, v40, v43);
      v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v26 != 1)
      {
        v38 = @"<error>";
        goto LABEL_18;
      }
      v28 = NSString;
      v29 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
      v30 = v29;
      if (a10) {
        v31 = @"TIME_DISPLAY_1_DAY";
      }
      else {
        v31 = @"TIME_DISPLAY_1";
      }
      v39 = [v29 localizedStringForKey:v31 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
      v40 = [v61 objectAtIndexedSubscript:0];
      objc_msgSend(v28, "localizedStringWithFormat:", v39, v40);
      v38 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }

  id v27 = v60;
LABEL_18:
  v44 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
  v45 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v38];
  v62 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartLollipopValueColor");
  v46 = objc_msgSend(MEMORY[0x1E4FB1618], "hk_chartLollipopLabelColor");
  uint64_t v47 = [(__CFString *)v38 length];
  if (v47 >= 1)
  {
    uint64_t v48 = v47;
    uint64_t v49 = 0;
    uint64_t v50 = *MEMORY[0x1E4FB06F8];
    uint64_t v51 = *MEMORY[0x1E4FB0700];
    do
    {
      if (objc_msgSend(v44, "characterIsMember:", -[__CFString characterAtIndex:](v38, "characterAtIndex:", v49)))
      {
        if (v27) {
          objc_msgSend(v45, "addAttribute:value:range:", v50, v27, v49, 1);
        }
        v52 = v62;
        if (!a9) {
          goto LABEL_29;
        }
      }
      else
      {
        if (v63) {
          objc_msgSend(v45, "addAttribute:value:range:", v50, v63, v49, 1);
        }
        v52 = v46;
        if (!a9) {
          goto LABEL_29;
        }
      }
      objc_msgSend(v45, "addAttribute:value:range:", v51, v52, v49, 1);
LABEL_29:
      ++v49;
    }
    while (v48 != v49);
  }
  v53 = objc_msgSend(MEMORY[0x1E4F28B18], "hk_attributedStringForSpacing:", 1);
  if ([v45 length])
  {
    unint64_t v54 = 0;
    do
    {
      v55 = [v45 string];
      int v56 = [v55 characterAtIndex:v54];

      if (v56 == 65532)
      {
        [v45 replaceCharactersInRange:v54, objc_msgSend(@"\uFFFC", "length"), v53 withAttributedString];
        v54 += [v53 length];
      }
      ++v54;
    }
    while (v54 < [v45 length]);
  }

  return v45;
}

- (id)stringFromValue:(id)a3 displayType:(id)a4 unitController:(id)a5
{
  return (id)[(HKNumberFormatter *)self->super._numberFormatter stringFromNumber:a3 displayType:a4 unitController:a5];
}

@end