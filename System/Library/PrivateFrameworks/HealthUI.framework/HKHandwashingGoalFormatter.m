@interface HKHandwashingGoalFormatter
- (BOOL)returnsUnitWithValueForDisplay;
- (HKDisplayType)displayType;
- (HKHandwashingGoalFormatter)initWithDisplayType:(id)a3 unitPreferenceController:(id)a4;
- (HKUnitPreferenceController)unitPreferenceController;
- (id)stringFromNumber:(id)a3 displayType:(id)a4 unitController:(id)a5;
- (void)setDisplayType:(id)a3;
- (void)setUnitPreferenceController:(id)a3;
@end

@implementation HKHandwashingGoalFormatter

- (HKHandwashingGoalFormatter)initWithDisplayType:(id)a3 unitPreferenceController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HKHandwashingGoalFormatter;
  v8 = [(HKHandwashingGoalFormatter *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(HKHandwashingGoalFormatter *)v8 setDisplayType:v6];
    [(HKHandwashingGoalFormatter *)v9 setUnitPreferenceController:v7];
  }

  return v9;
}

- (BOOL)returnsUnitWithValueForDisplay
{
  return 1;
}

- (id)stringFromNumber:(id)a3 displayType:(id)a4 unitController:(id)a5
{
  id v6 = a3;
  id v7 = [(HKHandwashingGoalFormatter *)self unitPreferenceController];
  v8 = [(HKHandwashingGoalFormatter *)self displayType];
  v9 = [v7 unitForDisplayType:v8];

  v10 = [(HKHandwashingGoalFormatter *)self displayType];
  objc_super v11 = objc_msgSend(v10, "hk_valueFormatterForUnit:", v9);

  v12 = [(HKHandwashingGoalFormatter *)self displayType];
  v13 = [(HKHandwashingGoalFormatter *)self unitPreferenceController];
  v14 = [v11 stringFromValue:v6 displayType:v12 unitController:v13];

  return v14;
}

- (HKDisplayType)displayType
{
  return self->_displayType;
}

- (void)setDisplayType:(id)a3
{
}

- (HKUnitPreferenceController)unitPreferenceController
{
  return self->_unitPreferenceController;
}

- (void)setUnitPreferenceController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitPreferenceController, 0);
  objc_storeStrong((id *)&self->_displayType, 0);
}

@end