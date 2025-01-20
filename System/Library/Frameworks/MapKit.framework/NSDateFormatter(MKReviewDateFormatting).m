@interface NSDateFormatter(MKReviewDateFormatting)
- (__CFString)_mapkit_roundedPastUnitsStringFromDate:()MKReviewDateFormatting;
@end

@implementation NSDateFormatter(MKReviewDateFormatting)

- (__CFString)_mapkit_roundedPastUnitsStringFromDate:()MKReviewDateFormatting
{
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1C9C8] date];
  v5 = [v4 earlierDate:v3];

  if (v5 == v4)
  {
    v16 = &stru_1ED919588;
    goto LABEL_20;
  }
  v6 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  v7 = [v6 components:28 fromDate:v3];
  v8 = [v6 components:28 fromDate:v4];
  int v9 = [v8 year];
  uint64_t v10 = v9 - [v7 year];
  int v11 = [v8 month];
  int v12 = [v7 month];
  int v13 = [v8 day];
  int v14 = [v7 day];
  if ((int)v10 < 1)
  {
    uint64_t v17 = (v11 - v12);
    if ((int)v17 < 1)
    {
      uint64_t v17 = (v13 - v14);
      if (!v17)
      {
        v15 = @"TODAY_KEY";
        goto LABEL_15;
      }
      if (v17 == 1)
      {
        v15 = @"YESTERDAY_KEY";
        goto LABEL_15;
      }
      v19 = @"N_DAYS_AGO_FORMAT_KEY";
    }
    else
    {
      if (v17 == 1)
      {
        v15 = @"LAST_MONTH_KEY";
        goto LABEL_15;
      }
      v19 = @"N_MONTHS_AGO_FORMAT_KEY";
    }
    v18 = _MKLocalizedStringFromThisBundle(v19);
    objc_msgSend(NSString, "localizedStringWithFormat:", v18, v17);
    goto LABEL_18;
  }
  if (v10 != 1)
  {
    v18 = _MKLocalizedStringFromThisBundle(@"N_YEARS_AGO_FORMAT_KEY");
    objc_msgSend(NSString, "localizedStringWithFormat:", v18, v10);
LABEL_18:
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_19;
  }
  v15 = @"LAST_YEAR_KEY";
LABEL_15:
  _MKLocalizedStringFromThisBundle(v15);
  v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_19:

LABEL_20:

  return v16;
}

@end