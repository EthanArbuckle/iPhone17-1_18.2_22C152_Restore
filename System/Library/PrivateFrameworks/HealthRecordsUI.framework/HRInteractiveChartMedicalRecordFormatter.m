@interface HRInteractiveChartMedicalRecordFormatter
- (HRInteractiveChartMedicalRecordFormatter)init;
- (id)unitStringFromUnit:(id)a3 number:(id)a4;
@end

@implementation HRInteractiveChartMedicalRecordFormatter

- (HRInteractiveChartMedicalRecordFormatter)init
{
  v5.receiver = self;
  v5.super_class = (Class)HRInteractiveChartMedicalRecordFormatter;
  v2 = [(HRInteractiveChartMedicalRecordFormatter *)&v5 init];
  v3 = v2;
  if (v2) {
    [(HKInteractiveChartGenericStatFormatter *)v2 setOverrideStatFormatterItemOptions:&unk_1F1DC2210];
  }
  return v3;
}

- (id)unitStringFromUnit:(id)a3 number:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    goto LABEL_7;
  }
  v8 = [(HKInteractiveChartDataFormatter *)self unitController];
  v9 = [v8 localizedDisplayNameForUnit:v6 value:v7];

  if (![v9 length] && (objc_msgSend(v6, "isNull") & 1) == 0)
  {
    uint64_t v10 = [v6 unitString];

    v9 = (void *)v10;
  }
  if (v9)
  {
    v11 = [MEMORY[0x1E4F2B610] sharedConverter];
    v12 = [v11 synonymForUCUMUnitString:v9];
  }
  else
  {
LABEL_7:
    v12 = 0;
  }
  if (v12) {
    v13 = v12;
  }
  else {
    v13 = &stru_1F1D9FF30;
  }
  v14 = v13;

  return v14;
}

@end