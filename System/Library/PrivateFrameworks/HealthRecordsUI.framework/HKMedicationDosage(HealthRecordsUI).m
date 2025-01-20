@interface HKMedicationDosage(HealthRecordsUI)
- (id)hr_dosageTimePeriodString;
@end

@implementation HKMedicationDosage(HealthRecordsUI)

- (id)hr_dosageTimePeriodString
{
  v2 = [a1 timingPeriod];

  if (!v2)
  {
    HRLocalizedString(@"MEDICAL_RECORD_DETAIL_TEXT_NO_DATE");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  v3 = [a1 timingPeriod];
  v4 = [v3 startDate];
  v5 = objc_msgSend(v4, "hr_dateWithoutTime");

  v6 = [a1 timingPeriod];
  v7 = [v6 endDate];
  v8 = objc_msgSend(v7, "hr_dateWithoutTime");

  if (!v8)
  {
    v10 = NSString;
    v11 = HRLocalizedString(@"MEDICAL_RECORD_STARTED_ON_DATE%1$@");
    objc_msgSend(v10, "stringWithFormat:", v11, v5);
LABEL_9:
    id v9 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:

    goto LABEL_12;
  }
  if (!v5)
  {
    v12 = NSString;
    v11 = HRLocalizedString(@"MEDICAL_RECORD_ENDED_ON_DATE%1$@");
    objc_msgSend(v12, "stringWithFormat:", v11, v8);
    goto LABEL_9;
  }
  if (![v5 isEqualToString:v8])
  {
    v13 = NSString;
    v11 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v14 = [v11 localizedStringForKey:@"DATE_RANGE %@ %@" value:&stru_1F1D9FF30 table:@"HealthUI-Localizable"];
    objc_msgSend(v13, "stringWithFormat:", v14, v5, v8);
    id v9 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_11;
  }
  id v9 = v5;
LABEL_12:

LABEL_13:
  return v9;
}

@end