@interface CameraSensorAnomalyInputs
- (BOOL)disableAmbientLightAdaptation;
- (BOOL)enableMaxBrightness;
- (BOOL)flashModeOn;
- (BOOL)validateAndInitializeParameters:(id)a3;
- (BOOL)validateAndInitializePredicates:(id)a3;
- (NSString)identifier;
- (NSString)viewfinderInstruction;
- (UIColor)drawColor;
- (float)minimumSquareLength;
- (void)setDisableAmbientLightAdaptation:(BOOL)a3;
- (void)setDrawColor:(id)a3;
- (void)setEnableMaxBrightness:(BOOL)a3;
- (void)setFlashModeOn:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setMinimumSquareLength:(float)a3;
- (void)setViewfinderInstruction:(id)a3;
@end

@implementation CameraSensorAnomalyInputs

- (BOOL)validateAndInitializePredicates:(id)a3
{
  char v8 = 0;
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  v5 = +[NSSet setWithObjects:@"Front", @"Rear", @"RearTelephoto", @"RearSuperWide", @"RearSynced", 0];
  v6 = [v4 dk_stringFromRequiredKey:@"identifier" inSet:v5 failed:&v8];

  [(CameraSensorAnomalyInputs *)self setIdentifier:v6];
  return v8 == 0;
}

- (BOOL)validateAndInitializeParameters:(id)a3
{
  char v14 = 0;
  if (!a3) {
    return 0;
  }
  id v4 = a3;
  v5 = [v4 dk_stringFromRequiredKey:@"drawColor" maxLength:7 failed:&v14];
  uint64_t v13 = 0;
  v6 = +[UIColor colorWithHexValue:v5 error:&v13];
  [(CameraSensorAnomalyInputs *)self setDrawColor:v6];

  v7 = [(CameraSensorAnomalyInputs *)self drawColor];

  if (!v7) {
    char v14 = 1;
  }
  char v8 = [v4 dk_numberFromRequiredKey:@"minimumSquareLength" lowerBound:&off_100010C08 upperBound:&off_100010C18 failed:&v14];
  [v8 doubleValue];
  *(float *)&double v9 = v9;
  [(CameraSensorAnomalyInputs *)self setMinimumSquareLength:v9];

  -[CameraSensorAnomalyInputs setEnableMaxBrightness:[self dk_BOOLFromRequiredKey:@"enableMaxBrightness" failed:&v14]];
  [self setFlashModeOn:[v4 dk_BOOLFromRequiredKey:@"flashModeOn" failed:&v14]];
  v10 = [v4 dk_stringFromRequiredKey:@"viewfinderInstruction" maxLength:1000 failed:&v14];
  [(CameraSensorAnomalyInputs *)self setViewfinderInstruction:v10];

  id v11 = [v4 dk_BOOLFromKey:@"disableAmbientLightAdaptation" defaultValue:0 failed:&v14];
  [(CameraSensorAnomalyInputs *)self setDisableAmbientLightAdaptation:v11];
  return v14 == 0;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (UIColor)drawColor
{
  return self->_drawColor;
}

- (void)setDrawColor:(id)a3
{
}

- (float)minimumSquareLength
{
  return self->_minimumSquareLength;
}

- (void)setMinimumSquareLength:(float)a3
{
  self->_minimumSquareLength = a3;
}

- (BOOL)enableMaxBrightness
{
  return self->_enableMaxBrightness;
}

- (void)setEnableMaxBrightness:(BOOL)a3
{
  self->_enableMaxBrightness = a3;
}

- (BOOL)flashModeOn
{
  return self->_flashModeOn;
}

- (void)setFlashModeOn:(BOOL)a3
{
  self->_flashModeOn = a3;
}

- (NSString)viewfinderInstruction
{
  return self->_viewfinderInstruction;
}

- (void)setViewfinderInstruction:(id)a3
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
  objc_storeStrong((id *)&self->_viewfinderInstruction, 0);
  objc_storeStrong((id *)&self->_drawColor, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end