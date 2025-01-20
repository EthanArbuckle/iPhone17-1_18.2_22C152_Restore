@interface HKAxisLabelDimensionDisplayType
- (HKAxisLabelDimensionDisplayType)initWithDisplayType:(id)a3 unitPreferencesController:(id)a4;
- (HKDisplayType)displayType;
- (HKDisplayTypeValueFormatter)valueFormatter;
- (HKUnitPreferenceController)unitController;
- (id)stringForLocation:(id)a3 formatterForStepSize:(id)a4;
- (void)setDisplayType:(id)a3;
- (void)setUnitController:(id)a3;
- (void)setValueFormatter:(id)a3;
@end

@implementation HKAxisLabelDimensionDisplayType

- (HKAxisLabelDimensionDisplayType)initWithDisplayType:(id)a3 unitPreferencesController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HKAxisLabelDimensionDisplayType;
  v9 = [(HKAxisLabelDimensionDisplayType *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_unitController, a4);
    objc_storeStrong((id *)&v10->_displayType, a3);
    v11 = [(HKUnitPreferenceController *)v10->_unitController unitForDisplayType:v10->_displayType];
    uint64_t v12 = [(HKDisplayType *)v10->_displayType hk_valueFormatterForUnit:v11];
    valueFormatter = v10->_valueFormatter;
    v10->_valueFormatter = (HKDisplayTypeValueFormatter *)v12;
  }
  return v10;
}

- (id)stringForLocation:(id)a3 formatterForStepSize:(id)a4
{
  id v5 = a3;
  v6 = [(HKAxisLabelDimensionDisplayType *)self valueFormatter];
  id v7 = [(HKAxisLabelDimensionDisplayType *)self displayType];
  id v8 = [(HKAxisLabelDimensionDisplayType *)self unitController];
  v9 = [v6 stringFromValue:v5 displayType:v7 unitController:v8];

  return v9;
}

- (HKDisplayTypeValueFormatter)valueFormatter
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