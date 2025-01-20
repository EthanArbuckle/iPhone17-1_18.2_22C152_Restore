@interface HKAxisLabelDimensionRelativeTemperature
- (HKAxisLabelDimensionRelativeTemperature)initWithDisplayType:(id)a3 unitPreferencesController:(id)a4;
- (HKDisplayType)displayType;
- (HKQuantityDisplayTypeValueFormatter)valueFormatter;
- (HKUnitPreferenceController)unitController;
- (id)stringForLocation:(id)a3 formatterForStepSize:(id)a4;
- (void)setDisplayType:(id)a3;
- (void)setUnitController:(id)a3;
- (void)setValueFormatter:(id)a3;
@end

@implementation HKAxisLabelDimensionRelativeTemperature

- (HKAxisLabelDimensionRelativeTemperature)initWithDisplayType:(id)a3 unitPreferencesController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HKAxisLabelDimensionRelativeTemperature;
  v9 = [(HKAxisLabelDimensionRelativeTemperature *)&v17 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_unitController, a4);
    objc_storeStrong((id *)&v10->_displayType, a3);
    v11 = (void *)MEMORY[0x1E4F2B618];
    v12 = [(HKUnitPreferenceController *)v10->_unitController unitForDisplayType:v10->_displayType];
    v13 = [v11 _changeInUnit:v12];

    uint64_t v14 = [(HKDisplayType *)v10->_displayType hk_valueFormatterForUnit:v13];
    valueFormatter = v10->_valueFormatter;
    v10->_valueFormatter = (HKQuantityDisplayTypeValueFormatter *)v14;
  }
  return v10;
}

- (id)stringForLocation:(id)a3 formatterForStepSize:(id)a4
{
  id v5 = a3;
  [v5 doubleValue];
  if (v6 == 0.0)
  {
    id v7 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    id v8 = [v7 localizedStringForKey:@"TEMPERATURE_BASELINE_SHORT" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Kali"];
  }
  else
  {
    id v7 = [(HKAxisLabelDimensionRelativeTemperature *)self valueFormatter];
    v9 = [(HKAxisLabelDimensionRelativeTemperature *)self displayType];
    v10 = [(HKAxisLabelDimensionRelativeTemperature *)self unitController];
    v11 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
    v12 = [v11 localizedStringForKey:@"TEMPERATURE_QUANTITY_AXIS_LABEL_FORMAT %@ %@" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-Kali"];
    id v8 = [v7 stringFromValue:v5 displayType:v9 unitController:v10 formatString:v12];
  }
  return v8;
}

- (HKQuantityDisplayTypeValueFormatter)valueFormatter
{
  return self->_valueFormatter;
}

- (void)setValueFormatter:(id)a3
{
}

- (HKDisplayType)displayType
{
  return self->_displayType;
}

- (void)setDisplayType:(id)a3
{
}

- (HKUnitPreferenceController)unitController
{
  return self->_unitController;
}

- (void)setUnitController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitController, 0);
  objc_storeStrong((id *)&self->_displayType, 0);
  objc_storeStrong((id *)&self->_valueFormatter, 0);
}

@end