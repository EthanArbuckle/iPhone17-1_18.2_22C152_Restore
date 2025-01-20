@interface HKDisplayTypeNumberFormatter
- (BOOL)returnsUnitWithValueForDisplay;
- (HKDisplayTypeNumberFormatter)initWithDisplayType:(id)a3 unitController:(id)a4;
- (id)stringFromNumber:(id)a3 displayType:(id)a4 unitController:(id)a5;
@end

@implementation HKDisplayTypeNumberFormatter

- (HKDisplayTypeNumberFormatter)initWithDisplayType:(id)a3 unitController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HKDisplayTypeNumberFormatter;
  v9 = [(HKDisplayTypeNumberFormatter *)&v15 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_displayType, a3);
    objc_storeStrong((id *)&v10->_unitController, a4);
    v11 = [(HKUnitPreferenceController *)v10->_unitController unitForDisplayType:v10->_displayType];
    uint64_t v12 = [(HKDisplayType *)v10->_displayType hk_valueFormatterForUnit:v11];
    valueFormatter = v10->_valueFormatter;
    v10->_valueFormatter = (HKDisplayTypeValueFormatter *)v12;
  }
  return v10;
}

- (BOOL)returnsUnitWithValueForDisplay
{
  return 1;
}

- (id)stringFromNumber:(id)a3 displayType:(id)a4 unitController:(id)a5
{
  displayType = a4;
  if (!a4) {
    displayType = self->_displayType;
  }
  unitController = a5;
  if (!a5) {
    unitController = self->_unitController;
  }
  valueFormatter = self->_valueFormatter;
  id v11 = displayType;
  id v12 = a5;
  id v13 = a4;
  v14 = [(HKDisplayTypeValueFormatter *)valueFormatter stringFromValue:a3 displayType:v11 unitController:unitController];

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueFormatter, 0);
  objc_storeStrong((id *)&self->_unitController, 0);
  objc_storeStrong((id *)&self->_displayType, 0);
}

@end