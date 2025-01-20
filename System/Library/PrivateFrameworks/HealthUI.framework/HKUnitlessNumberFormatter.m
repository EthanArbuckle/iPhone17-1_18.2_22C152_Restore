@interface HKUnitlessNumberFormatter
- (BOOL)forceUnitlessForAllTypes;
- (BOOL)returnsUnitWithValueForDisplay;
- (HKDisplayType)displayType;
- (HKUnitPreferenceController)unitPreferenceController;
- (HKUnitlessNumberFormatter)initWithDisplayType:(id)a3 unitPreferenceController:(id)a4;
- (HKUnitlessNumberFormatter)initWithDisplayType:(id)a3 unitPreferenceController:(id)a4 forceUnitlessForAllTypes:(BOOL)a5;
- (id)stringFromNumber:(id)a3 displayType:(id)a4 unitController:(id)a5;
- (void)setForceUnitlessForAllTypes:(BOOL)a3;
@end

@implementation HKUnitlessNumberFormatter

- (HKUnitlessNumberFormatter)initWithDisplayType:(id)a3 unitPreferenceController:(id)a4
{
  return [(HKUnitlessNumberFormatter *)self initWithDisplayType:a3 unitPreferenceController:a4 forceUnitlessForAllTypes:0];
}

- (HKUnitlessNumberFormatter)initWithDisplayType:(id)a3 unitPreferenceController:(id)a4 forceUnitlessForAllTypes:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKUnitlessNumberFormatter;
  v11 = [(HKUnitlessNumberFormatter *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_displayType, a3);
    objc_storeStrong((id *)&v12->_unitPreferenceController, a4);
    v12->_forceUnitlessForAllTypes = a5;
  }

  return v12;
}

- (BOOL)returnsUnitWithValueForDisplay
{
  return 0;
}

- (id)stringFromNumber:(id)a3 displayType:(id)a4 unitController:(id)a5
{
  BOOL forceUnitlessForAllTypes = self->_forceUnitlessForAllTypes;
  id v7 = a3;
  v8 = [(HKUnitlessNumberFormatter *)self displayType];
  id v9 = [(HKUnitlessNumberFormatter *)self unitPreferenceController];
  if (forceUnitlessForAllTypes) {
    objc_msgSend(v8, "hk_defaultChartAxisBoundStringFromValue:defaultNumberFormatter:unitController:", v7, 0, v9);
  }
  else {
  id v10 = objc_msgSend(v8, "hk_interactiveChartAxisStringFromValue:defaultNumberFormatter:unitController:", v7, 0, v9);
  }

  return v10;
}

- (HKDisplayType)displayType
{
  return self->_displayType;
}

- (HKUnitPreferenceController)unitPreferenceController
{
  return self->_unitPreferenceController;
}

- (BOOL)forceUnitlessForAllTypes
{
  return self->_forceUnitlessForAllTypes;
}

- (void)setForceUnitlessForAllTypes:(BOOL)a3
{
  self->_BOOL forceUnitlessForAllTypes = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitPreferenceController, 0);
  objc_storeStrong((id *)&self->_displayType, 0);
}

@end