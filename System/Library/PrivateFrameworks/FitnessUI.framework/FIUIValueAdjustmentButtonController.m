@interface FIUIValueAdjustmentButtonController
- (BOOL)didUserUpdatevalue;
- (FIUIWorkoutLapLengthIndexTranslator)lapLengthIndexTranslator;
- (UIButton)decrementButton;
- (UIButton)incrementButton;
- (double)maxValue;
- (double)minValue;
- (double)minumumStepValueIncrement;
- (double)value;
- (double)valueStepIncremement;
- (id)buttonStateUpdateHandler;
- (id)valueUpdateHandler;
- (void)_incrementRepeatCount;
- (void)_notifyValueChanged;
- (void)_performPlusMinusActionWithButton:(id)a3;
- (void)_performPlusMinusActionWithIndexTranslationForButton:(id)a3;
- (void)_plusMinusActionTimerDidFire:(id)a3;
- (void)_plusMinusButtonTouchCancel:(id)a3;
- (void)_plusMinusButtonTouchDown:(id)a3;
- (void)_plusMinusButtonTouchUpInside:(id)a3;
- (void)_updateButton:(id)a3 forPressedState:(BOOL)a4;
- (void)_updatePlusMinusButtonStates;
- (void)setButtonStateUpdateHandler:(id)a3;
- (void)setDidUserUpdatevalue:(BOOL)a3;
- (void)setIncrementButton:(id)a3 decrementButton:(id)a4;
- (void)setLapLengthIndexTranslator:(id)a3;
- (void)setMaxValue:(double)a3;
- (void)setMinValue:(double)a3;
- (void)setMinumumStepValueIncrement:(double)a3;
- (void)setValue:(double)a3;
- (void)setValueStepIncremement:(double)a3;
- (void)setValueUpdateHandler:(id)a3;
@end

@implementation FIUIValueAdjustmentButtonController

- (void)setIncrementButton:(id)a3 decrementButton:(id)a4
{
  p_incrementButton = &self->_incrementButton;
  id v7 = a4;
  objc_storeWeak((id *)p_incrementButton, a3);
  objc_storeWeak((id *)&self->_decrementButton, v7);

  id WeakRetained = objc_loadWeakRetained((id *)p_incrementButton);
  [WeakRetained addTarget:self action:sel__plusMinusButtonTouchDown_ forControlEvents:1];

  id v9 = objc_loadWeakRetained((id *)&self->_decrementButton);
  [v9 addTarget:self action:sel__plusMinusButtonTouchDown_ forControlEvents:1];

  id v10 = objc_loadWeakRetained((id *)p_incrementButton);
  [v10 addTarget:self action:sel__plusMinusButtonTouchUpInside_ forControlEvents:64];

  id v11 = objc_loadWeakRetained((id *)&self->_decrementButton);
  [v11 addTarget:self action:sel__plusMinusButtonTouchUpInside_ forControlEvents:64];

  id v12 = objc_loadWeakRetained((id *)p_incrementButton);
  [v12 addTarget:self action:sel__plusMinusButtonTouchCancel_ forControlEvents:448];

  id v13 = objc_loadWeakRetained((id *)&self->_decrementButton);
  [v13 addTarget:self action:sel__plusMinusButtonTouchCancel_ forControlEvents:448];
}

- (void)_plusMinusButtonTouchDown:(id)a3
{
  id v8 = a3;
  -[FIUIValueAdjustmentButtonController _updateButton:forPressedState:](self, "_updateButton:forPressedState:");
  plusMinusActionTimer = self->_plusMinusActionTimer;
  if (plusMinusActionTimer)
  {
    [(NSTimer *)plusMinusActionTimer invalidate];
    v5 = self->_plusMinusActionTimer;
    self->_plusMinusActionTimer = 0;
  }
  self->_plusMinusActionRepeatCount = 0;
  v6 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel__plusMinusActionTimerDidFire_ selector:v8 userInfo:1 repeats:0.25];
  id v7 = self->_plusMinusActionTimer;
  self->_plusMinusActionTimer = v6;
}

- (void)_plusMinusButtonTouchUpInside:(id)a3
{
  if (!self->_plusMinusActionRepeatCount)
  {
    id v4 = a3;
    [(FIUIValueAdjustmentButtonController *)self _performPlusMinusActionWithButton:v4];
    [(FIUIValueAdjustmentButtonController *)self _updateButton:v4 forPressedState:0];
  }
}

- (void)_plusMinusButtonTouchCancel:(id)a3
{
  [(FIUIValueAdjustmentButtonController *)self _updateButton:a3 forPressedState:0];
  [(NSTimer *)self->_plusMinusActionTimer invalidate];
  plusMinusActionTimer = self->_plusMinusActionTimer;
  self->_plusMinusActionTimer = 0;
}

- (void)_plusMinusActionTimerDidFire:(id)a3
{
  id v4 = [a3 userInfo];
  [(FIUIValueAdjustmentButtonController *)self _performPlusMinusActionWithButton:v4];
}

- (void)_performPlusMinusActionWithButton:(id)a3
{
  id v14 = a3;
  id v4 = [(FIUIValueAdjustmentButtonController *)self lapLengthIndexTranslator];

  if (v4)
  {
    [(FIUIValueAdjustmentButtonController *)self _performPlusMinusActionWithIndexTranslationForButton:v14];
    goto LABEL_12;
  }
  [(FIUIValueAdjustmentButtonController *)self value];
  double v6 = v5;
  [(FIUIValueAdjustmentButtonController *)self valueStepIncremement];
  double v8 = v7;
  double v9 = round(v6 / v7 * 1000.0) / 1000.0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_decrementButton);

  if (WeakRetained == v14)
  {
    double v11 = floor(v9);
    double v12 = v9 - v11;
    if (v9 - v11 >= 2.22044605e-16) {
      goto LABEL_9;
    }
    double v13 = -1.0;
  }
  else
  {
    double v11 = ceil(v9);
    double v12 = v11 - v9;
    if (v11 - v9 >= 2.22044605e-16) {
      goto LABEL_9;
    }
    double v13 = 1.0;
  }
  double v11 = v9 + v13;
LABEL_9:
  -[FIUIValueAdjustmentButtonController setValue:](self, "setValue:", v8 * v11, v12);
  self->_didUserUpdatevalue = 1;
  if ([v14 isEnabled]) {
    [(FIUIValueAdjustmentButtonController *)self _incrementRepeatCount];
  }
  else {
    [(FIUIValueAdjustmentButtonController *)self _plusMinusButtonTouchCancel:v14];
  }
LABEL_12:
}

- (void)_performPlusMinusActionWithIndexTranslationForButton:(id)a3
{
  id v11 = a3;
  [(FIUIValueAdjustmentButtonController *)self value];
  double v5 = v4;
  double v6 = [(FIUIValueAdjustmentButtonController *)self lapLengthIndexTranslator];
  uint64_t v7 = [v6 indexForValue:v5];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_decrementButton);
  if (WeakRetained == v11) {
    uint64_t v9 = v7 - 1;
  }
  else {
    uint64_t v9 = v7 + 1;
  }
  id v10 = [(FIUIValueAdjustmentButtonController *)self lapLengthIndexTranslator];
  [v10 valueForIndex:v9];
  -[FIUIValueAdjustmentButtonController setValue:](self, "setValue:");

  self->_didUserUpdatevalue = 1;
  if ([v11 isEnabled]) {
    [(FIUIValueAdjustmentButtonController *)self _incrementRepeatCount];
  }
  else {
    [(FIUIValueAdjustmentButtonController *)self _plusMinusButtonTouchCancel:v11];
  }
}

- (void)_incrementRepeatCount
{
  plusMinusActionTimer = self->_plusMinusActionTimer;
  int64_t plusMinusActionRepeatCount = self->_plusMinusActionRepeatCount;
  double v4 = dbl_21E4D8A80[plusMinusActionRepeatCount > 18];
  self->_int64_t plusMinusActionRepeatCount = plusMinusActionRepeatCount + 1;
  if (plusMinusActionRepeatCount <= 3) {
    double v4 = 0.25;
  }
  id v5 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:v4];
  [(NSTimer *)plusMinusActionTimer setFireDate:v5];
}

- (void)setValue:(double)a3
{
  [(FIUIValueAdjustmentButtonController *)self minValue];
  if (v6 > a3)
  {
    [(FIUIValueAdjustmentButtonController *)self minValue];
    a3 = v7;
  }
  [(FIUIValueAdjustmentButtonController *)self maxValue];
  if (a3 > v8)
  {
    [(FIUIValueAdjustmentButtonController *)self maxValue];
    a3 = v9;
  }
  [(FIUIValueAdjustmentButtonController *)self minumumStepValueIncrement];
  if (v10 > 0.0) {
    a3 = v10 * round(a3 / v10);
  }
  self->_value = a3;
  [(FIUIValueAdjustmentButtonController *)self _notifyValueChanged];
  [(FIUIValueAdjustmentButtonController *)self _updatePlusMinusButtonStates];
}

- (void)_notifyValueChanged
{
  uint64_t v3 = [(FIUIValueAdjustmentButtonController *)self valueUpdateHandler];

  if (v3)
  {
    double v4 = [(FIUIValueAdjustmentButtonController *)self valueUpdateHandler];
    v4[2]();
  }
}

- (void)_updatePlusMinusButtonStates
{
  [(FIUIValueAdjustmentButtonController *)self value];
  double v4 = v3;
  [(FIUIValueAdjustmentButtonController *)self minValue];
  BOOL v6 = v4 - v5 > 2.22044605e-16;
  double v7 = [(FIUIValueAdjustmentButtonController *)self decrementButton];
  [v7 setEnabled:v6];

  [(FIUIValueAdjustmentButtonController *)self valueStepIncremement];
  double v9 = v4 + v8;
  [(FIUIValueAdjustmentButtonController *)self maxValue];
  BOOL v11 = v9 <= v10;
  id v12 = [(FIUIValueAdjustmentButtonController *)self incrementButton];
  [v12 setEnabled:v11];
}

- (void)_updateButton:(id)a3 forPressedState:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  self->_didUserUpdatevalue = 1;
  BOOL v6 = [(FIUIValueAdjustmentButtonController *)self buttonStateUpdateHandler];

  if (v6)
  {
    double v7 = [(FIUIValueAdjustmentButtonController *)self buttonStateUpdateHandler];
    ((void (**)(void, id, BOOL))v7)[2](v7, v8, v4);
  }
}

- (double)value
{
  return self->_value;
}

- (double)valueStepIncremement
{
  return self->_valueStepIncremement;
}

- (void)setValueStepIncremement:(double)a3
{
  self->_valueStepIncremement = a3;
}

- (double)minumumStepValueIncrement
{
  return self->_minumumStepValueIncrement;
}

- (void)setMinumumStepValueIncrement:(double)a3
{
  self->_minumumStepValueIncrement = a3;
}

- (double)maxValue
{
  return self->_maxValue;
}

- (void)setMaxValue:(double)a3
{
  self->_maxValue = a3;
}

- (double)minValue
{
  return self->_minValue;
}

- (void)setMinValue:(double)a3
{
  self->_minValue = a3;
}

- (id)valueUpdateHandler
{
  return self->_valueUpdateHandler;
}

- (void)setValueUpdateHandler:(id)a3
{
}

- (FIUIWorkoutLapLengthIndexTranslator)lapLengthIndexTranslator
{
  return self->_lapLengthIndexTranslator;
}

- (void)setLapLengthIndexTranslator:(id)a3
{
}

- (id)buttonStateUpdateHandler
{
  return self->_buttonStateUpdateHandler;
}

- (void)setButtonStateUpdateHandler:(id)a3
{
}

- (BOOL)didUserUpdatevalue
{
  return self->_didUserUpdatevalue;
}

- (void)setDidUserUpdatevalue:(BOOL)a3
{
  self->_didUserUpdatevalue = a3;
}

- (UIButton)incrementButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_incrementButton);
  return (UIButton *)WeakRetained;
}

- (UIButton)decrementButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_decrementButton);
  return (UIButton *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_decrementButton);
  objc_destroyWeak((id *)&self->_incrementButton);
  objc_storeStrong(&self->_buttonStateUpdateHandler, 0);
  objc_storeStrong((id *)&self->_lapLengthIndexTranslator, 0);
  objc_storeStrong(&self->_valueUpdateHandler, 0);
  objc_storeStrong((id *)&self->_plusMinusActionTimer, 0);
}

@end