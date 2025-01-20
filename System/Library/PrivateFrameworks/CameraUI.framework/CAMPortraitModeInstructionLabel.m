@interface CAMPortraitModeInstructionLabel
+ (BOOL)shouldDisplayInstructionForShallowDepthOfFieldStatus:(int64_t)a3;
+ (id)_textForShallowDepthOfFieldStatus:(int64_t)a3 numberOfPeopleFound:(unint64_t)a4 flashSupported:(BOOL)a5 flashMode:(int64_t)a6 devicePosition:(int64_t)a7 lightingType:(int64_t)a8 lowlightMode:(int64_t)a9 lowLightStatus:(int64_t)a10;
- (BOOL)isFlashSupported;
- (CGSize)sizeThatFits:(CGSize)a3;
- (int64_t)devicePosition;
- (int64_t)flashMode;
- (int64_t)lightingType;
- (int64_t)lowLightMode;
- (int64_t)lowLightStatus;
- (int64_t)shallowDepthOfFieldStatus;
- (unint64_t)numberOfPeopleFound;
- (void)_updateTextWithPriorStatus:(int64_t)a3;
- (void)setDevicePosition:(int64_t)a3;
- (void)setFlashMode:(int64_t)a3;
- (void)setFlashSupported:(BOOL)a3;
- (void)setLightingType:(int64_t)a3;
- (void)setLowLightMode:(int64_t)a3;
- (void)setLowLightStatus:(int64_t)a3;
- (void)setNumberOfPeopleFound:(unint64_t)a3;
- (void)setShallowDepthOfFieldStatus:(int64_t)a3;
@end

@implementation CAMPortraitModeInstructionLabel

+ (BOOL)shouldDisplayInstructionForShallowDepthOfFieldStatus:(int64_t)a3
{
  v3 = [a1 _textForShallowDepthOfFieldStatus:a3 numberOfPeopleFound:0 flashSupported:1 flashMode:2 devicePosition:0 lightingType:0 lowlightMode:0 lowLightStatus:0];
  BOOL v4 = [v3 length] != 0;

  return v4;
}

- (void)setShallowDepthOfFieldStatus:(int64_t)a3
{
  int64_t shallowDepthOfFieldStatus = self->_shallowDepthOfFieldStatus;
  if (shallowDepthOfFieldStatus != a3)
  {
    self->_int64_t shallowDepthOfFieldStatus = a3;
    [(CAMPortraitModeInstructionLabel *)self _updateTextWithPriorStatus:shallowDepthOfFieldStatus];
    id v5 = [(CAMInstructionLabel *)self delegate];
    [v5 instructionLabelDidChangeIntrinsicContentSize:self];
  }
}

- (void)setNumberOfPeopleFound:(unint64_t)a3
{
  if (self->_numberOfPeopleFound != a3)
  {
    self->_numberOfPeopleFound = a3;
    int64_t v4 = [(CAMPortraitModeInstructionLabel *)self shallowDepthOfFieldStatus];
    [(CAMPortraitModeInstructionLabel *)self _updateTextWithPriorStatus:v4];
  }
}

- (void)setFlashSupported:(BOOL)a3
{
  if (self->_flashSupported != a3)
  {
    self->_flashSupported = a3;
    int64_t v4 = [(CAMPortraitModeInstructionLabel *)self shallowDepthOfFieldStatus];
    [(CAMPortraitModeInstructionLabel *)self _updateTextWithPriorStatus:v4];
  }
}

- (void)setFlashMode:(int64_t)a3
{
  if (self->_flashMode != a3)
  {
    self->_flashMode = a3;
    int64_t v4 = [(CAMPortraitModeInstructionLabel *)self shallowDepthOfFieldStatus];
    [(CAMPortraitModeInstructionLabel *)self _updateTextWithPriorStatus:v4];
  }
}

- (void)setDevicePosition:(int64_t)a3
{
  if (self->_devicePosition != a3)
  {
    self->_devicePosition = a3;
    int64_t v4 = [(CAMPortraitModeInstructionLabel *)self shallowDepthOfFieldStatus];
    [(CAMPortraitModeInstructionLabel *)self _updateTextWithPriorStatus:v4];
  }
}

- (void)setLightingType:(int64_t)a3
{
  if (self->_lightingType != a3)
  {
    self->_lightingType = a3;
    int64_t v4 = [(CAMPortraitModeInstructionLabel *)self shallowDepthOfFieldStatus];
    [(CAMPortraitModeInstructionLabel *)self _updateTextWithPriorStatus:v4];
  }
}

- (void)_updateTextWithPriorStatus:(int64_t)a3
{
  int64_t v5 = [(CAMPortraitModeInstructionLabel *)self shallowDepthOfFieldStatus];
  unint64_t v6 = [(CAMPortraitModeInstructionLabel *)self numberOfPeopleFound];
  BOOL v7 = [(CAMPortraitModeInstructionLabel *)self isFlashSupported];
  int64_t v8 = [(CAMPortraitModeInstructionLabel *)self flashMode];
  objc_msgSend((id)objc_opt_class(), "_textForShallowDepthOfFieldStatus:numberOfPeopleFound:flashSupported:flashMode:devicePosition:lightingType:lowlightMode:lowLightStatus:", v5, v6, v7, v8, -[CAMPortraitModeInstructionLabel devicePosition](self, "devicePosition"), -[CAMPortraitModeInstructionLabel lightingType](self, "lightingType"), -[CAMPortraitModeInstructionLabel lowLightMode](self, "lowLightMode"), -[CAMPortraitModeInstructionLabel lowLightStatus](self, "lowLightStatus"));
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = objc_msgSend((id)objc_opt_class(), "_textForShallowDepthOfFieldStatus:numberOfPeopleFound:flashSupported:flashMode:devicePosition:lightingType:lowlightMode:lowLightStatus:", a3, v6, v7, v8, -[CAMPortraitModeInstructionLabel devicePosition](self, "devicePosition"), -[CAMPortraitModeInstructionLabel lightingType](self, "lightingType"), -[CAMPortraitModeInstructionLabel lowLightMode](self, "lowLightMode"), -[CAMPortraitModeInstructionLabel lowLightStatus](self, "lowLightStatus"));
  v10 = (void *)v9;
  if (v12)
  {
    -[CAMInstructionLabel setText:](self, "setText:");
    if (v10) {
      goto LABEL_6;
    }
  }
  else if (!v9)
  {
    goto LABEL_6;
  }
  v11 = [(CAMInstructionLabel *)self delegate];
  [v11 instructionLabelDidChangeIntrinsicContentSize:self];

LABEL_6:
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)CAMPortraitModeInstructionLabel;
  -[CAMInstructionLabel sizeThatFits:](&v9, sel_sizeThatFits_);
  if (v5 < 108.0 && height == 0.0 && width == 0.0) {
    double v5 = 108.0;
  }
  result.double height = v6;
  result.double width = v5;
  return result;
}

+ (id)_textForShallowDepthOfFieldStatus:(int64_t)a3 numberOfPeopleFound:(unint64_t)a4 flashSupported:(BOOL)a5 flashMode:(int64_t)a6 devicePosition:(int64_t)a7 lightingType:(int64_t)a8 lowlightMode:(int64_t)a9 lowLightStatus:(int64_t)a10
{
  v10 = 0;
  if (a6) {
    BOOL v11 = 0;
  }
  else {
    BOOL v11 = a5;
  }
  switch(a3)
  {
    case 3:
      unint64_t v15 = a8 - 4;
      v16 = CAMPortraitModeInstructionLabelMeasurementFormatter();
      v17 = [v16 locale];
      v18 = [v17 objectForKey:*MEMORY[0x263EFF510]];
      v19 = +[CAMCaptureCapabilities capabilities];
      int v20 = [v19 isSingleCameraPortraitModeSupportedForDevicePosition:a7];

      if (([v18 isEqualToString:*MEMORY[0x263EFF528]] & 1) != 0
        || ([v18 isEqualToString:*MEMORY[0x263EFF520]] & 1) != 0)
      {
        v21 = [MEMORY[0x263F08CE8] feet];
        double v22 = 3.0;
        BOOL v23 = a7 == 1;
        double v24 = 8.0;
        if (a7 == 1) {
          double v24 = 3.0;
        }
        double v25 = 6.0;
        double v26 = 1.5;
      }
      else
      {
        v21 = [MEMORY[0x263F08CE8] meters];
        double v22 = 1.0;
        BOOL v23 = a7 == 1;
        double v24 = 2.5;
        if (a7 == 1) {
          double v24 = 1.0;
        }
        double v25 = 2.0;
        double v26 = 0.5;
      }
      if (v23) {
        double v25 = v26;
      }
      if (v15 <= 2) {
        double v24 = v25;
      }
      if (v20) {
        double v30 = v22;
      }
      else {
        double v30 = v24;
      }
      v31 = (void *)[objc_alloc(MEMORY[0x263F08980]) initWithDoubleValue:v21 unit:v30];
      v32 = [v16 stringFromMeasurement:v31];
      v33 = @"PORTRAIT_MODE_SUBJECT_TOO_FAR";
      if (v15 < 3) {
        v33 = @"PORTRAIT_MODE_SUBJECT_TOO_FAR_STAGE";
      }
      if (a8 == 6) {
        v33 = @"PORTRAIT_MODE_SUBJECT_TOO_FAR_HIGH_KEY";
      }
      if (v20) {
        v34 = @"PORTRAIT_MODE_SUBJECT_TOO_FAR_SINGLE_CAMERA";
      }
      else {
        v34 = v33;
      }
      v35 = CAMLocalizedFrameworkString(v34, &stru_26BD78BA0);
      v10 = [NSString localizedStringWithValidatedFormat:v35, @"%lu%@", 0, a4, v32 validFormatSpecifiers error];

      goto LABEL_45;
    case 4:
      v28 = @"PORTRAIT_MODE_SUBJECT_TOO_CLOSE";
      goto LABEL_43;
    case 5:
      if (a9) {
        BOOL v27 = 0;
      }
      else {
        BOOL v27 = (unint64_t)(a10 - 3) >= 0xFFFFFFFFFFFFFFFELL;
      }
      if (!v27 || !v11)
      {
        if (v11) {
          v28 = @"PORTRAIT_MODE_LOW_LIGHT_FLASH_DISABLED";
        }
        else {
          v28 = @"PORTRAIT_MODE_LOW_LIGHT";
        }
LABEL_43:
        v29 = &stru_26BD78BA0;
      }
      else
      {
        v28 = @"PORTRAIT_MODE_LOW_LIGHT_NIGHT_MODE_DISABLED_FLASH_DISABLED";
LABEL_18:
        v29 = 0;
      }
      v10 = CAMLocalizedFrameworkString(v28, v29);
LABEL_45:
      return v10;
    case 7:
      v28 = @"PORTRAIT_MODE_TOO_MUCH_LIGHT";
      goto LABEL_43;
    case 8:
      v28 = @"PORTRAIT_MODE_BACKGROUND_TOO_FAR";
      goto LABEL_43;
    case 10:
      v28 = @"PORTRAIT_MODE_LOW_LIGHT_NIGHT_MODE_AVAILABLE";
      goto LABEL_18;
    default:
      goto LABEL_45;
  }
}

- (int64_t)shallowDepthOfFieldStatus
{
  return self->_shallowDepthOfFieldStatus;
}

- (BOOL)isFlashSupported
{
  return self->_flashSupported;
}

- (int64_t)flashMode
{
  return self->_flashMode;
}

- (unint64_t)numberOfPeopleFound
{
  return self->_numberOfPeopleFound;
}

- (int64_t)devicePosition
{
  return self->_devicePosition;
}

- (int64_t)lightingType
{
  return self->_lightingType;
}

- (int64_t)lowLightStatus
{
  return self->_lowLightStatus;
}

- (void)setLowLightStatus:(int64_t)a3
{
  self->_lowLightStatus = a3;
}

- (int64_t)lowLightMode
{
  return self->_lowLightMode;
}

- (void)setLowLightMode:(int64_t)a3
{
  self->_lowLightMode = a3;
}

@end