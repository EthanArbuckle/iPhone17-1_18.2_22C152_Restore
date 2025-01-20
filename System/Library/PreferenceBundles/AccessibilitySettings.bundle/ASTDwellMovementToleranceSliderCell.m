@interface ASTDwellMovementToleranceSliderCell
- (ASTDwellMovementToleranceSliderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (double)initialValue;
- (double)maximumValue;
- (double)minimumValue;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (unint64_t)clientType;
- (void)handleSliderBeingDragged:(id)a3;
- (void)setClientType:(unint64_t)a3;
@end

@implementation ASTDwellMovementToleranceSliderCell

- (ASTDwellMovementToleranceSliderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v30.receiver = self;
  v30.super_class = (Class)ASTDwellMovementToleranceSliderCell;
  v10 = [(ASTDwellMovementToleranceSliderCell *)&v30 initWithStyle:a3 reuseIdentifier:v8 specifier:v9];
  if (v10)
  {
    v11 = [v9 propertyForKey:@"DwellMovementToleranceClientType"];

    if (v11)
    {
      v12 = [v9 propertyForKey:@"DwellMovementToleranceClientType"];
      v10->_clientType = (unint64_t)[v12 unsignedIntegerValue];

      [(ASTDwellMovementToleranceSliderCell *)v10 minimumValue];
      float v14 = v13;
      v15 = [(ASTDwellMovementToleranceSliderCell *)v10 slider];
      *(float *)&double v16 = v14;
      [v15 setMinimumValue:v16];

      [(ASTDwellMovementToleranceSliderCell *)v10 maximumValue];
      float v18 = v17;
      v19 = [(ASTDwellMovementToleranceSliderCell *)v10 slider];
      *(float *)&double v20 = v18;
      [v19 setMaximumValue:v20];

      [(ASTDwellMovementToleranceSliderCell *)v10 initialValue];
      float v22 = v21;
      v23 = [(ASTDwellMovementToleranceSliderCell *)v10 slider];
      *(float *)&double v24 = v22;
      [v23 setValue:v24];

      objc_initWeak(&location, v10);
      v25 = [(ASTDwellMovementToleranceSliderCell *)v10 slider];
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = __79__ASTDwellMovementToleranceSliderCell_initWithStyle_reuseIdentifier_specifier___block_invoke;
      v27[3] = &unk_209258;
      objc_copyWeak(&v28, &location);
      [v25 setAccessibilityValueBlock:v27];

      objc_destroyWeak(&v28);
      objc_destroyWeak(&location);
    }
  }

  return v10;
}

id __79__ASTDwellMovementToleranceSliderCell_initWithStyle_reuseIdentifier_specifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained accessibilityValue];

  return v2;
}

- (void)handleSliderBeingDragged:(id)a3
{
  id v4 = a3;
  [v4 value];
  objc_msgSend(v4, "setValue:animated:", 0);
  [v4 value];
  float v6 = v5;

  double v7 = roundf(v6);
  unint64_t v8 = [(ASTDwellMovementToleranceSliderCell *)self clientType];
  if (v8)
  {
    if (v8 != 1) {
      return;
    }
    id v9 = +[AXSettings sharedInstance];
    [v9 setSwitchControlCameraPointPickerDwellMovementToleranceRadius:v7];
  }
  else
  {
    id v9 = +[AXSettings sharedInstance];
    [v9 setAssistiveTouchMouseDwellControlMovementToleranceRadius:v7];
  }
}

- (double)maximumValue
{
  unint64_t v2 = [(ASTDwellMovementToleranceSliderCell *)self clientType];
  if (v2)
  {
    if (v2 != 1) {
      return result;
    }
    id v4 = (double *)&kAXSSwitchControlHeadTrackingDwellMovementToleranceMax;
  }
  else
  {
    id v4 = (double *)&kAXSAssistiveTouchMouseDwellControlMovementToleranceMax;
  }
  return *v4;
}

- (double)minimumValue
{
  unint64_t v2 = [(ASTDwellMovementToleranceSliderCell *)self clientType];
  if (v2)
  {
    if (v2 != 1) {
      return result;
    }
    id v4 = (double *)&kAXSSwitchControlHeadTrackingDwellMovementToleranceMin;
  }
  else
  {
    id v4 = (double *)&kAXSAssistiveTouchMouseDwellControlMovementToleranceMin;
  }
  return *v4;
}

- (double)initialValue
{
  unint64_t v3 = [(ASTDwellMovementToleranceSliderCell *)self clientType];
  if (!v3)
  {
    id v4 = +[AXSettings sharedInstance];
    [v4 assistiveTouchMouseDwellControlMovementToleranceRadius];
    goto LABEL_5;
  }
  if (v3 == 1)
  {
    id v4 = +[AXSettings sharedInstance];
    [v4 switchControlCameraPointPickerDwellMovementToleranceRadius];
LABEL_5:
    double v2 = v5;
  }
  return v2;
}

- (id)accessibilityLabel
{
  return settingsLocString(@"MOUSE_POINTER_DWELL_TOLERANCE", @"HandSettings");
}

- (id)accessibilityValue
{
  id v3 = objc_alloc((Class)NSNumber);
  [(ASTDwellMovementToleranceSliderCell *)self initialValue];
  double v5 = v4 + v4;
  *(float *)&double v5 = v5;
  id v6 = [v3 initWithFloat:v5];
  double v7 = settingsLocString(@"NUMBER_OF_POINTS", @"HandSettings");
  unint64_t v8 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v7, [v6 intValue]);

  return v8;
}

- (unint64_t)clientType
{
  return self->_clientType;
}

- (void)setClientType:(unint64_t)a3
{
  self->_clientType = a3;
}

@end