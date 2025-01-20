@interface HKLastUpdatedDayDataProviderCurrentValue
- (NSDate)date;
- (id)attributedStringWithDisplayType:(id)a3 unitController:(id)a4 valueFont:(id)a5 unitFont:(id)a6 dateCache:(id)a7;
- (id)lastUpdatedDescriptionWithDateCache:(id)a3;
- (void)setDate:(id)a3;
@end

@implementation HKLastUpdatedDayDataProviderCurrentValue

- (id)attributedStringWithDisplayType:(id)a3 unitController:(id)a4 valueFont:(id)a5 unitFont:(id)a6 dateCache:(id)a7
{
  v49[1] = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  id v12 = a7;
  v13 = [(HKLastUpdatedDayDataProviderCurrentValue *)self date];
  if ([v12 isDateInToday:v13])
  {
  }
  else
  {
    v14 = [(HKLastUpdatedDayDataProviderCurrentValue *)self date];
    int v15 = [v12 isDateInYesterday:v14];

    if (!v15)
    {
      v21 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      v22 = [(HKLastUpdatedDayDataProviderCurrentValue *)self date];
      v23 = [MEMORY[0x1E4F1C9C8] date];
      v17 = [v21 components:16 fromDate:v22 toDate:v23 options:0];

      unint64_t v24 = [v17 day];
      if (v24 > 0x28)
      {
        v39 = [(HKLastUpdatedDayDataProviderCurrentValue *)self date];
        v19 = HKLocalizedStringForDateAndTemplate(v39, 12);

        id v40 = objc_alloc(MEMORY[0x1E4F28B18]);
        uint64_t v42 = *MEMORY[0x1E4FB06F8];
        id v43 = v10;
        v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
        v20 = (void *)[v40 initWithString:v19 attributes:v31];
      }
      else
      {
        unint64_t v25 = v24;
        v26 = HKIntegerFormatter();
        v27 = [NSNumber numberWithInteger:v25];
        v19 = [v26 stringFromNumber:v27];

        v28 = NSString;
        v29 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
        v30 = [v29 localizedStringForKey:@"%d DAYS_AGO" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
        v31 = objc_msgSend(v28, "localizedStringWithFormat:", v30, v25);

        id v32 = objc_alloc(MEMORY[0x1E4F28E48]);
        uint64_t v46 = *MEMORY[0x1E4FB06F8];
        uint64_t v33 = v46;
        id v47 = v11;
        v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
        v20 = (void *)[v32 initWithString:v31 attributes:v34];

        uint64_t v44 = v33;
        id v45 = v10;
        v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
        v36 = [v20 string];
        uint64_t v37 = [v36 rangeOfString:v19];
        objc_msgSend(v20, "setAttributes:range:", v35, v37, v38);
      }
      goto LABEL_9;
    }
  }
  v16 = [(HKLastUpdatedDayDataProviderCurrentValue *)self date];
  v17 = HKLocalizedStringForDateAndTemplate(v16, 36);

  id v18 = objc_alloc(MEMORY[0x1E4F28B18]);
  uint64_t v48 = *MEMORY[0x1E4FB06F8];
  v49[0] = v10;
  v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:&v48 count:1];
  v20 = (void *)[v18 initWithString:v17 attributes:v19];
LABEL_9:

  return v20;
}

- (id)lastUpdatedDescriptionWithDateCache:(id)a3
{
  id v4 = a3;
  v5 = [(HKLastUpdatedDayDataProviderCurrentValue *)self date];
  v6 = HKLastUpdatedText(v5, v4);

  return v6;
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
}

@end