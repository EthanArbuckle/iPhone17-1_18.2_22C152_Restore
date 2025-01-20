@interface DisplayPatternToolInputs
- (BOOL)brightnessAdjustable;
- (BOOL)disableAmbientLightAdaptation;
- (BOOL)randomizeImageOrder;
- (BOOL)resetBrightnessOnChange;
- (BOOL)validateAndInitializeParameters:(id)a3;
- (UIColor)drawColor;
- (double)minimumSquareLength;
- (void)setBrightnessAdjustable:(BOOL)a3;
- (void)setDisableAmbientLightAdaptation:(BOOL)a3;
- (void)setDrawColor:(id)a3;
- (void)setMinimumSquareLength:(double)a3;
- (void)setRandomizeImageOrder:(BOOL)a3;
- (void)setResetBrightnessOnChange:(BOOL)a3;
@end

@implementation DisplayPatternToolInputs

- (BOOL)validateAndInitializeParameters:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DisplayPatternToolInputs;
  char v14 = ![(DisplayViewInputs *)&v13 validateAndInitializeParameters:v4];
  v5 = [v4 dk_stringFromRequiredKey:@"drawColor" maxLength:7 failed:&v14];
  id v12 = 0;
  v6 = +[UIColor colorWithHexValue:v5 error:&v12];
  id v7 = v12;
  [(DisplayPatternToolInputs *)self setDrawColor:v6];

  v8 = [(DisplayPatternToolInputs *)self drawColor];

  if (!v8) {
    char v14 = 1;
  }
  v9 = [v4 dk_numberFromRequiredKey:@"minimumSquareLength" lowerBound:&off_10000C790 upperBound:&off_10000C7A0 failed:&v14];
  [v9 doubleValue];
  -[DisplayPatternToolInputs setMinimumSquareLength:](self, "setMinimumSquareLength:");

  [self setRandomizeImageOrder:[v4 dk_BOOLFromRequiredKey:@"randomizeImageOrder" failed:&v14]];
  -[DisplayPatternToolInputs setBrightnessAdjustable:[self dk_BOOLFromKey:@"brightnessAdjustable" defaultValue:0 failed:&v14]];
  -[DisplayPatternToolInputs setResetBrightnessOnChange:](self, "setResetBrightnessOnChange:", [v4 dk_BOOLFromKey:@"resetBrightnessOnChange" defaultValue:0 failed:&v14]);
  -[DisplayPatternToolInputs setDisableAmbientLightAdaptation:[self dk_BOOLFromKey:@"disableAmbientLightAdaptation" defaultValue:0 failed:&v14]];
  BOOL v10 = v14 == 0;

  return v10;
}

- (double)minimumSquareLength
{
  return self->_minimumSquareLength;
}

- (void)setMinimumSquareLength:(double)a3
{
  self->_minimumSquareLength = a3;
}

- (BOOL)randomizeImageOrder
{
  return self->_randomizeImageOrder;
}

- (void)setRandomizeImageOrder:(BOOL)a3
{
  self->_randomizeImageOrder = a3;
}

- (BOOL)brightnessAdjustable
{
  return self->_brightnessAdjustable;
}

- (void)setBrightnessAdjustable:(BOOL)a3
{
  self->_brightnessAdjustable = a3;
}

- (BOOL)resetBrightnessOnChange
{
  return self->_resetBrightnessOnChange;
}

- (void)setResetBrightnessOnChange:(BOOL)a3
{
  self->_resetBrightnessOnChange = a3;
}

- (UIColor)drawColor
{
  return self->_drawColor;
}

- (void)setDrawColor:(id)a3
{
}

- (BOOL)disableAmbientLightAdaptation
{
  return self->_disableAmbientLightAdaptation;
}

- (void)setDisableAmbientLightAdaptation:(BOOL)a3
{
  self->_disableAmbientLightAdaptation = a3;
}

- (void).cxx_destruct
{
}

@end