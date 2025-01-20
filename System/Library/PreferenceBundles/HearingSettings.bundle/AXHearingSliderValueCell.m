@interface AXHearingSliderValueCell
- (AXHearingSliderValueCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (BOOL)isAccessibilityElement;
- (OS_dispatch_queue)valueUpdateQueue;
- (id)accessibilityHint;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (id)description;
- (id)value;
- (id)valueString;
- (signed)numberOfSteps;
- (unint64_t)accessibilityTraits;
- (void)accessibilityDecrement;
- (void)accessibilityIncrement;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setValue:(id)a3;
- (void)setValueUpdateQueue:(id)a3;
- (void)sliderValueDidChange:(id)a3;
- (void)updateValue;
- (void)willMoveToSuperview:(id)a3;
@end

@implementation AXHearingSliderValueCell

- (AXHearingSliderValueCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v15.receiver = self;
  v15.super_class = (Class)AXHearingSliderValueCell;
  v5 = [(AXHearingSliderValueCell *)&v15 initWithStyle:1 reuseIdentifier:a4 specifier:a5];
  if (v5)
  {
    v6 = (NSNumberFormatter *)objc_alloc_init((Class)NSNumberFormatter);
    numberFormatter = v5->_numberFormatter;
    v5->_numberFormatter = v6;

    [(NSNumberFormatter *)v5->_numberFormatter setNumberStyle:3];
    [(NSNumberFormatter *)v5->_numberFormatter setPercentSymbol:&stru_3D6D8];
    [(NSNumberFormatter *)v5->_numberFormatter setMaximumFractionDigits:0];
    v8 = v5->_numberFormatter;
    v9 = +[NSNumber numberWithInt:0];
    v10 = [(NSNumberFormatter *)v8 stringFromNumber:v9];
    [(NSNumberFormatter *)v8 setNotANumberSymbol:v10];

    v11 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v12 = dispatch_queue_create("hearing_slider_queue", v11);
    valueUpdateQueue = v5->_valueUpdateQueue;
    v5->_valueUpdateQueue = (OS_dispatch_queue *)v12;
  }
  return v5;
}

- (void)dealloc
{
  [(UIView *)self->_leftView removeFromSuperview];
  [(HUIStepSlider *)self->_slider removeFromSuperview];
  [(UILabel *)self->_valueLabel removeFromSuperview];
  v3.receiver = self;
  v3.super_class = (Class)AXHearingSliderValueCell;
  [(AXHearingSliderValueCell *)&v3 dealloc];
}

- (void)willMoveToSuperview:(id)a3
{
  v50.receiver = self;
  v50.super_class = (Class)AXHearingSliderValueCell;
  [(AXHearingSliderValueCell *)&v50 willMoveToSuperview:a3];
  if (!self->_leftView)
  {
    v4 = (id *)&self->PSTableCell_opaque[OBJC_IVAR___PSTableCell__specifier];
    id WeakRetained = objc_loadWeakRetained(v4);
    v6 = [WeakRetained propertyForKey:PSKeyNameKey];

    if (!v6)
    {
      id v7 = objc_loadWeakRetained(v4);
      v6 = [v7 propertyForKey:PSIDKey];
    }
    id v8 = objc_loadWeakRetained(v4);
    v9 = [v8 userInfo];
    unsigned int v10 = [v9 leftAvailable];
    if (v10)
    {
      char v11 = v10;
      id v12 = objc_loadWeakRetained(v4);
      v13 = [v12 userInfo];
      if ([v13 rightAvailable]
        && ![v6 hasPrefix:@"Master"])
      {
        goto LABEL_9;
      }
      if ([v6 isEqualToString:@"Treble"])
      {
        if ((v11 & 1) == 0)
        {
LABEL_11:

          goto LABEL_12;
        }
LABEL_9:

        goto LABEL_11;
      }
      unsigned __int8 v31 = [v6 isEqualToString:@"Bass"];
      if (v11)
      {
      }
      if (v31)
      {
LABEL_12:
        v14 = (UIView *)objc_alloc_init((Class)UILabel);
        objc_super v15 = +[UIColor clearColor];
        [(UIView *)v14 setBackgroundColor:v15];

        v16 = +[UIFont systemFontOfSize:15.0];
        [(UIView *)v14 setFont:v16];

        v17 = hearingLocString();
        v18 = hearingLocString();
        if (([v6 isEqualToString:@"Treble"] & 1) != 0
          || [v6 isEqualToString:@"Bass"])
        {
          uint64_t v19 = hearingLocString();

          uint64_t v20 = hearingLocString();

          v18 = (void *)v20;
          v17 = (void *)v19;
        }
        v21 = [(UIView *)v14 font];
        objc_msgSend(v17, "_legacy_sizeWithFont:", v21);
        double v23 = v22;

        v24 = [(UIView *)v14 font];
        objc_msgSend(v18, "_legacy_sizeWithFont:", v24);
        double v26 = v25;

        if (v23 >= v26) {
          double v27 = v23;
        }
        else {
          double v27 = v26;
        }
        self->_sliderMargin = v27 + 10.0 + 15.0;
        if ([v6 rangeOfString:@"Left"] == (id)0x7FFFFFFFFFFFFFFFLL)
        {
          if ([v6 rangeOfString:@"Right"] == (id)0x7FFFFFFFFFFFFFFFLL)
          {
            if ([v6 isEqualToString:@"Treble"]
              || [v6 isEqualToString:@"Bass"])
            {
              v47 = hearingLocString();
              [(UIView *)v14 setText:v47];
            }
            goto LABEL_33;
          }
          v28 = v14;
          v29 = v18;
        }
        else
        {
          v28 = v14;
          v29 = v17;
        }
        [(UIView *)v28 setText:v29];
LABEL_33:
        [(UIView *)v14 sizeToFit];
        v48 = [(AXHearingSliderValueCell *)self contentView];
        [v48 addSubview:v14];

        leftView = self->_leftView;
        self->_leftView = v14;

        goto LABEL_34;
      }
    }
    else
    {
      if ([v6 isEqualToString:@"Treble"]) {
        goto LABEL_11;
      }
      unsigned __int8 v30 = [v6 isEqualToString:@"Bass"];

      if (v30) {
        goto LABEL_12;
      }
    }
    v32 = accessibilityHearingAidImageNamed();
    v33 = [v32 imageWithRenderingMode:2];

    v17 = [v33 imageFlippedForRightToLeftLayoutDirection];

    v34 = (UIView *)[objc_alloc((Class)UIImageView) initWithImage:v17];
    v35 = +[UIColor _labelColor];
    [(UIView *)v34 setTintColor:v35];

    v36 = [(AXHearingSliderValueCell *)self contentView];
    [v36 addSubview:v34];

    v37 = self->_leftView;
    self->_leftView = v34;
    v38 = v34;

    [(UIView *)v38 frame];
    CGFloat v40 = v39;
    CGFloat v42 = v41;
    CGFloat v44 = v43;
    CGFloat v46 = v45;

    v51.origin.x = v40;
    v51.origin.y = v42;
    v51.size.width = v44;
    v51.size.height = v46;
    self->_sliderMargin = CGRectGetWidth(v51) + 10.0 + 15.0;
LABEL_34:
  }
}

- (void)sliderValueDidChange:(id)a3
{
  [(HUIStepSlider *)self->_slider value];
  v5 = +[NSNumber numberWithDouble:v4];
  valueUpdateQueue = self->_valueUpdateQueue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1A740;
  v8[3] = &unk_3CA48;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(valueUpdateQueue, v8);
}

- (void)setValue:(id)a3
{
  id v14 = a3;
  float v4 = (id *)&self->PSTableCell_opaque[OBJC_IVAR___PSTableCell__specifier];
  id WeakRetained = objc_loadWeakRetained(v4);
  v6 = [WeakRetained userInfo];

  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v7 = objc_loadWeakRetained(v4);
    id v8 = [v7 propertyForKey:PSKeyNameKey];

    if (!v8)
    {
      id v9 = objc_loadWeakRetained(v4);
      id v8 = [v9 propertyForKey:PSIDKey];
    }
    if ([v8 isEqualToString:@"MasterVolume"])
    {
      [v14 doubleValue];
      objc_msgSend(v6, "setLeftMicrophoneVolume:");
LABEL_10:
      [v14 doubleValue];
      objc_msgSend(v6, "setRightMicrophoneVolume:");
      goto LABEL_11;
    }
    if ([v8 isEqualToString:@"LeftVolume"])
    {
      [v14 doubleValue];
      objc_msgSend(v6, "setLeftMicrophoneVolume:");
      goto LABEL_11;
    }
    if ([v8 isEqualToString:@"RightVolume"]) {
      goto LABEL_10;
    }
    if ([v8 isEqualToString:@"MasterStreamVolume"])
    {
      [v14 doubleValue];
      objc_msgSend(v6, "setLeftStreamVolume:");
    }
    else
    {
      if ([v8 isEqualToString:@"LeftStreamVolume"])
      {
        [v14 doubleValue];
        objc_msgSend(v6, "setLeftStreamVolume:");
        goto LABEL_11;
      }
      if (![v8 isEqualToString:@"RightStreamVolume"])
      {
        if ([v8 isEqualToString:@"MasterSensitivity"])
        {
          [v14 doubleValue];
          objc_msgSend(v6, "setLeftSensitivity:");
        }
        else
        {
          if ([v8 isEqualToString:@"LeftSensitivity"])
          {
            [v14 doubleValue];
            objc_msgSend(v6, "setLeftSensitivity:");
            goto LABEL_11;
          }
          if (![v8 isEqualToString:@"RightSensitivity"])
          {
            if ([v8 isEqualToString:@"Treble"])
            {
              [v14 doubleValue];
              uint64_t v11 = (int)((v10 + -0.5) * 255.0);
              [v6 setLeftTreble:v11];
              [v6 setRightTreble:v11];
            }
            else
            {
              if (![v8 isEqualToString:@"Bass"])
              {
                if ([v8 isEqualToString:@"MasterMixedVolume"])
                {
                  [v14 doubleValue];
                  objc_msgSend(v6, "setLeftMixedVolume:");
                }
                else
                {
                  if ([v8 isEqualToString:@"LeftMixedVolume"])
                  {
                    [v14 doubleValue];
                    objc_msgSend(v6, "setLeftMixedVolume:");
                    goto LABEL_11;
                  }
                  if (![v8 isEqualToString:@"RightMixedVolume"]) {
                    goto LABEL_11;
                  }
                }
                [v14 doubleValue];
                objc_msgSend(v6, "setRightMixedVolume:");
                goto LABEL_11;
              }
              [v14 doubleValue];
              uint64_t v13 = (int)((v12 + -0.5) * 255.0);
              [v6 setLeftBass:v13];
              [v6 setRightBass:v13];
            }
LABEL_11:

            goto LABEL_12;
          }
        }
        [v14 doubleValue];
        objc_msgSend(v6, "setRightSensitivity:");
        goto LABEL_11;
      }
    }
    [v14 doubleValue];
    objc_msgSend(v6, "setRightStreamVolume:");
    goto LABEL_11;
  }
LABEL_12:
}

- (id)value
{
  v2 = (id *)&self->PSTableCell_opaque[OBJC_IVAR___PSTableCell__specifier];
  id WeakRetained = objc_loadWeakRetained(v2);
  float v4 = [WeakRetained userInfo];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v8 = 0;
      goto LABEL_24;
    }
  }
  id v5 = objc_loadWeakRetained(v2);
  v6 = [v5 propertyForKey:PSKeyNameKey];

  if (!v6)
  {
    id v7 = objc_loadWeakRetained(v2);
    v6 = [v7 propertyForKey:PSIDKey];
  }
  if ([v6 isEqualToString:@"LeftVolume"])
  {
    [v4 leftMicrophoneVolume];
  }
  else if ([v6 isEqualToString:@"RightVolume"])
  {
    [v4 rightMicrophoneVolume];
  }
  else if ([v6 isEqualToString:@"LeftMixedVolume"])
  {
    [v4 leftMixedVolume];
  }
  else if ([v6 isEqualToString:@"RightMixedVolume"])
  {
    [v4 rightMixedVolume];
  }
  else if ([v6 isEqualToString:@"LeftStreamVolume"])
  {
    [v4 leftStreamVolume];
  }
  else if ([v6 isEqualToString:@"RightStreamVolume"])
  {
    [v4 rightStreamVolume];
  }
  else if ([v6 isEqualToString:@"LeftSensitivity"])
  {
    [v4 leftSensitivity];
  }
  else if ([v6 isEqualToString:@"RightSensitivity"])
  {
    [v4 rightSensitivity];
  }
  else
  {
    if ([v6 isEqualToString:@"MasterStreamVolume"])
    {
      double v10 = 0.0;
      double v11 = 0.0;
      if ([v4 leftAvailable])
      {
        [v4 leftStreamVolume];
        double v11 = v12 + 0.0;
        double v10 = 1.0;
      }
      if ([v4 rightAvailable])
      {
        double v10 = v10 + 1.0;
        [v4 rightStreamVolume];
        double v11 = v11 + v13;
      }
      double v14 = v11 / v10;
      id v8 = +[NSNumber numberWithDouble:v14];
      [v4 leftStreamVolume];
      if (v14 != v15) {
        [v4 setLeftStreamVolume:v14];
      }
      [v4 rightStreamVolume];
      if (v14 != v16) {
        [v4 setRightStreamVolume:v14];
      }
      goto LABEL_23;
    }
    if ([v6 isEqualToString:@"MasterVolume"])
    {
      double v17 = 0.0;
      double v18 = 0.0;
      if ([v4 leftAvailable])
      {
        [v4 leftMicrophoneVolume];
        double v18 = v19 + 0.0;
        double v17 = 1.0;
      }
      if ([v4 rightAvailable])
      {
        double v17 = v17 + 1.0;
        [v4 rightMicrophoneVolume];
        double v18 = v18 + v20;
      }
      double v21 = v18 / v17;
      id v8 = +[NSNumber numberWithDouble:v21];
      [v4 leftMicrophoneVolume];
      if (v21 != v22) {
        [v4 setLeftMicrophoneVolume:v21];
      }
      [v4 rightMicrophoneVolume];
      if (v21 != v23) {
        [v4 setRightMicrophoneVolume:v21];
      }
      goto LABEL_23;
    }
    if ([v6 isEqualToString:@"MasterMixedVolume"])
    {
      double v24 = 0.0;
      double v25 = 0.0;
      if ([v4 leftAvailable])
      {
        [v4 leftMixedVolume];
        double v25 = v26 + 0.0;
        double v24 = 1.0;
      }
      if ([v4 rightAvailable])
      {
        double v24 = v24 + 1.0;
        [v4 rightMixedVolume];
        double v25 = v25 + v27;
      }
      double v28 = v25 / v24;
      id v8 = +[NSNumber numberWithDouble:v28];
      [v4 leftMixedVolume];
      if (v28 != v29) {
        [v4 setLeftMixedVolume:v28];
      }
      [v4 rightMixedVolume];
      if (v28 != v30) {
        [v4 setRightMixedVolume:v28];
      }
      goto LABEL_23;
    }
    if ([v6 isEqualToString:@"MasterSensitivity"])
    {
      double v31 = 0.0;
      double v32 = 0.0;
      if ([v4 leftAvailable])
      {
        [v4 leftSensitivity];
        double v32 = v33 + 0.0;
        double v31 = 1.0;
      }
      if ([v4 rightAvailable])
      {
        double v31 = v31 + 1.0;
        [v4 rightSensitivity];
        double v32 = v32 + v34;
      }
      double v35 = v32 / v31;
      id v8 = +[NSNumber numberWithDouble:v35];
      [v4 leftSensitivity];
      if (v35 != v36) {
        [v4 setLeftSensitivity:v35];
      }
      [v4 rightSensitivity];
      if (v35 != v37) {
        [v4 setRightSensitivity:v35];
      }
      goto LABEL_23;
    }
    if ([v6 isEqualToString:@"Treble"])
    {
      [v4 leftTreble];
      unsigned int v38 = [v4 leftTreble];
      if (v38 != [v4 rightTreble] && !objc_msgSend(v4, "leftTreble")) {
        [v4 rightTreble];
      }
    }
    else
    {
      if (![v6 isEqualToString:@"Bass"])
      {
        id v8 = 0;
        goto LABEL_23;
      }
      [v4 leftBass];
      unsigned int v39 = [v4 leftBass];
      if (v39 != [v4 rightBass] && !objc_msgSend(v4, "leftBass")) {
        [v4 rightBass];
      }
    }
  }
  id v8 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
LABEL_23:

LABEL_24:

  return v8;
}

- (id)valueString
{
  objc_super v3 = [(AXHearingSliderValueCell *)self value];
  float v4 = [(NSNumberFormatter *)self->_numberFormatter stringFromNumber:v3];
  id v5 = (id *)&self->PSTableCell_opaque[OBJC_IVAR___PSTableCell__specifier];
  id WeakRetained = objc_loadWeakRetained(v5);
  id v7 = [WeakRetained propertyForKey:PSKeyNameKey];

  if (!v7)
  {
    id v8 = objc_loadWeakRetained(v5);
    id v7 = [v8 propertyForKey:PSIDKey];
  }
  if (([v7 isEqualToString:@"Treble"] & 1) != 0
    || [v7 isEqualToString:@"Bass"])
  {
    numberFormatter = self->_numberFormatter;
    [v3 doubleValue];
    double v11 = +[NSNumber numberWithDouble:v10 + -0.5 + v10 + -0.5];
    uint64_t v12 = [(NSNumberFormatter *)numberFormatter stringFromNumber:v11];

    float v4 = (void *)v12;
  }

  return v4;
}

- (void)updateValue
{
  id v10 = [(AXHearingSliderValueCell *)self value];
  if (v10)
  {
    [(HUIStepSlider *)self->_slider value];
    double v4 = v3;
    [v10 doubleValue];
    if (v5 != v4)
    {
      slider = self->_slider;
      [v10 doubleValue];
      *(float *)&double v7 = v7;
      [(HUIStepSlider *)slider setValue:v7];
      valueLabel = self->_valueLabel;
      id v9 = [(AXHearingSliderValueCell *)self valueString];
      [(UILabel *)valueLabel setText:v9];

      [(HUIStepSlider *)self->_slider setSegmentCount:[(AXHearingSliderValueCell *)self numberOfSteps]];
    }
  }
}

- (signed)numberOfSteps
{
  v2 = (id *)&self->PSTableCell_opaque[OBJC_IVAR___PSTableCell__specifier];
  id WeakRetained = objc_loadWeakRetained(v2);
  double v4 = [WeakRetained userInfo];

  id v5 = objc_loadWeakRetained(v2);
  v6 = [v5 propertyForKey:PSKeyNameKey];

  if (!v6)
  {
    id v7 = objc_loadWeakRetained(v2);
    v6 = [v7 propertyForKey:PSIDKey];
  }
  if ([v6 isEqualToString:@"MasterVolume"])
  {
    signed int v8 = [v4 leftMicrophoneVolumeSteps];
    signed int v9 = [v4 rightMicrophoneVolumeSteps];
    goto LABEL_5;
  }
  if ([v6 isEqualToString:@"LeftVolume"])
  {
    unsigned __int16 v10 = (unsigned __int16)[v4 leftMicrophoneVolumeSteps];
    goto LABEL_23;
  }
  if ([v6 isEqualToString:@"RightVolume"])
  {
    unsigned __int16 v10 = (unsigned __int16)[v4 rightMicrophoneVolumeSteps];
    goto LABEL_23;
  }
  if ([v6 isEqualToString:@"MasterStreamVolume"])
  {
    signed int v8 = [v4 leftStreamVolumeSteps];
    signed int v9 = [v4 rightStreamVolumeSteps];
  }
  else
  {
    if ([v6 isEqualToString:@"LeftStreamVolume"])
    {
      unsigned __int16 v10 = (unsigned __int16)[v4 leftStreamVolumeSteps];
      goto LABEL_23;
    }
    if ([v6 isEqualToString:@"RightStreamVolume"])
    {
      unsigned __int16 v10 = (unsigned __int16)[v4 rightStreamVolumeSteps];
      goto LABEL_23;
    }
    if (![v6 isEqualToString:@"MasterSensitivity"])
    {
      if ([v6 isEqualToString:@"LeftSensitivity"])
      {
        unsigned __int16 v10 = (unsigned __int16)[v4 leftSensitivitySteps];
      }
      else
      {
        if (![v6 isEqualToString:@"RightSensitivity"])
        {
          if (([v6 isEqualToString:@"Treble"] & 1) != 0
            || [v6 isEqualToString:@"Bass"])
          {
            LOWORD(v8) = 2;
          }
          else
          {
            LOWORD(v8) = 1;
          }
          goto LABEL_24;
        }
        unsigned __int16 v10 = (unsigned __int16)[v4 rightSensitivitySteps];
      }
LABEL_23:
      LOWORD(v8) = v10;
      goto LABEL_24;
    }
    signed int v8 = [v4 leftSensitivitySteps];
    signed int v9 = [v4 rightSensitivitySteps];
  }
LABEL_5:
  if (v8 <= v9) {
    LOWORD(v8) = v9;
  }
LABEL_24:
  if (![v6 isEqualToString:@"MasterMixedVolume"])
  {
    if ([v6 isEqualToString:@"LeftMixedVolume"])
    {
      unsigned __int16 v12 = (unsigned __int16)[v4 leftMixedVolumeSteps];
    }
    else
    {
      if (![v6 isEqualToString:@"RightMixedVolume"]) {
        goto LABEL_32;
      }
      unsigned __int16 v12 = (unsigned __int16)[v4 rightMixedVolumeSteps];
    }
    LOWORD(v8) = v12;
    goto LABEL_32;
  }
  signed int v8 = [v4 leftMixedVolumeSteps];
  signed int v11 = [v4 rightMixedVolumeSteps];
  if (v8 <= v11) {
    LOWORD(v8) = v11;
  }
LABEL_32:

  return v8;
}

- (void)layoutSubviews
{
  v79.receiver = self;
  v79.super_class = (Class)AXHearingSliderValueCell;
  [(AXHearingSliderValueCell *)&v79 layoutSubviews];
  float v3 = (id *)&self->PSTableCell_opaque[OBJC_IVAR___PSTableCell__specifier];
  id WeakRetained = objc_loadWeakRetained(v3);
  id v5 = [WeakRetained propertyForKey:PSKeyNameKey];

  if (!v5)
  {
    id v6 = objc_loadWeakRetained(v3);
    id v5 = [v6 propertyForKey:PSIDKey];
  }
  id v7 = [(AXHearingSliderValueCell *)self value];
  if (!v7)
  {
    id v8 = objc_loadWeakRetained(v3);
    id v7 = [v8 propertyForKey:PSDefaultValueKey];
  }
  leftView = self->_leftView;
  if (leftView)
  {
    [(UIView *)leftView frame];
    double v11 = v10;
    double v13 = v12;
    double v14 = [(AXHearingSliderValueCell *)self contentView];
    [v14 frame];
    float v16 = v15 * 0.5;
    float v17 = v13 * 0.5;
    double v18 = (float)((float)(floorf(v16) - floorf(v17)) + 2.0);

    if ([UIApp userInterfaceLayoutDirection])
    {
      double v19 = [(AXHearingSliderValueCell *)self contentView];
      [v19 bounds];
      double v21 = v20 - v11 + -15.0;
    }
    else
    {
      double v21 = 15.0;
    }
    -[UIView setFrame:](self->_leftView, "setFrame:", v21, v18, v11, v13);
  }
  valueLabel = self->_valueLabel;
  if (!valueLabel)
  {
    double v23 = (UILabel *)objc_alloc_init((Class)UILabel);
    double v24 = self->_valueLabel;
    self->_valueLabel = v23;

    double v25 = self->_valueLabel;
    double v26 = +[UIColor clearColor];
    [(UILabel *)v25 setBackgroundColor:v26];

    double v27 = self->_valueLabel;
    double v28 = +[UIFont systemFontOfSize:14.0];
    [(UILabel *)v27 setFont:v28];

    [(UILabel *)self->_valueLabel setTextAlignment:1];
    if (v7)
    {
      double v29 = self->_valueLabel;
      double v30 = [(AXHearingSliderValueCell *)self valueString];
      [(UILabel *)v29 setText:v30];
    }
    double v31 = [(AXHearingSliderValueCell *)self contentView];
    [v31 addSubview:self->_valueLabel];

    [(UILabel *)self->_valueLabel sizeToFit];
    numberFormatter = self->_numberFormatter;
    LODWORD(v33) = 1.0;
    double v34 = +[NSNumber numberWithFloat:v33];
    double v35 = [(NSNumberFormatter *)numberFormatter stringFromNumber:v34];
    double v36 = [(UILabel *)self->_valueLabel font];
    objc_msgSend(v35, "_legacy_sizeWithFont:", v36);
    self->_double valueWidth = v37 + 10.0;

    valueLabel = self->_valueLabel;
  }
  [(UILabel *)valueLabel frame];
  CGFloat v39 = v38;
  double v41 = v40;
  double valueWidth = self->_valueWidth;
  double v43 = [(AXHearingSliderValueCell *)self contentView];
  [v43 frame];
  float v45 = floor(v44 * 0.5);
  float v46 = floor(v41 * 0.5);
  double v47 = (float)((float)(v45 - v46) + 2.0);

  double v48 = 0.0;
  if (![UIApp userInterfaceLayoutDirection])
  {
    v49 = [(AXHearingSliderValueCell *)self contentView];
    [v49 frame];
    double Width = CGRectGetWidth(v80);
    v81.origin.x = v39;
    v81.origin.y = v47;
    v81.size.width = valueWidth;
    v81.size.height = v41;
    double v48 = Width - CGRectGetWidth(v81);
  }
  -[UILabel setFrame:](self->_valueLabel, "setFrame:", v48, v47, valueWidth, v41);
  slider = self->_slider;
  if (!slider)
  {
    v52 = (HUIStepSlider *)objc_alloc_init((Class)HUIStepSlider);
    v53 = self->_slider;
    self->_slider = v52;

    [(HUIStepSlider *)self->_slider setIsAccessibilityElement:0];
    v54 = self->_slider;
    id v55 = objc_loadWeakRetained(v3);
    v56 = [v55 propertyForKey:PSControlMinimumKey];
    [v56 floatValue];
    -[HUIStepSlider setMinimumValue:](v54, "setMinimumValue:");

    v57 = self->_slider;
    id v58 = objc_loadWeakRetained(v3);
    v59 = [v58 propertyForKey:PSControlMaximumKey];
    [v59 floatValue];
    -[HUIStepSlider setMaximumValue:](v57, "setMaximumValue:");

    v60 = self->_slider;
    [v7 doubleValue];
    *(float *)&double v61 = v61;
    [(HUIStepSlider *)v60 setValue:v61];
    [(HUIStepSlider *)self->_slider setContinuous:1];
    [(HUIStepSlider *)self->_slider setDrawsEndTicks:0];
    [(HUIStepSlider *)self->_slider addTarget:self action:"sliderValueDidChange:" forControlEvents:4096];
    v62 = [(AXHearingSliderValueCell *)self contentView];
    [v62 addSubview:self->_slider];

    slider = self->_slider;
  }
  if ([v5 isEqualToString:@"Treble"]) {
    uint64_t v63 = 0;
  }
  else {
    uint64_t v63 = [v5 isEqualToString:@"Bass"] ^ 1;
  }
  [(HUIStepSlider *)slider setRestrictsValuesToTicks:v63];
  v64 = [(AXHearingSliderValueCell *)self contentView];
  [v64 frame];
  double v65 = CGRectGetWidth(v82);
  double sliderMargin = self->_sliderMargin;
  v83.origin.x = v48;
  v83.origin.y = v47;
  v83.size.width = valueWidth;
  v83.size.height = v41;
  double v67 = CGRectGetWidth(v83);

  double v68 = self->_sliderMargin;
  if ([UIApp userInterfaceLayoutDirection] == (char *)&dword_0 + 1)
  {
    v69 = [(AXHearingSliderValueCell *)self contentView];
    [v69 frame];
    CGFloat v70 = CGRectGetWidth(v84) - self->_sliderMargin;
    v85.origin.x = v48;
    v85.origin.y = v47;
    v85.size.width = valueWidth;
    v85.size.height = v41;
    double v71 = v70 - CGRectGetWidth(v85);

    double v68 = valueWidth;
  }
  else
  {
    double v71 = v65 - sliderMargin - v67;
  }
  [(HUIStepSlider *)self->_slider frame];
  double v73 = v72;
  v74 = [(AXHearingSliderValueCell *)self contentView];
  [v74 frame];
  float v76 = v75 * 0.5;
  float v77 = v73 * 0.5;
  double v78 = (float)((float)(floorf(v76) - floorf(v77)) + 2.0);

  [(HUIStepSlider *)self->_slider setSegmentCount:[(AXHearingSliderValueCell *)self numberOfSteps]];
  -[HUIStepSlider setFrame:](self->_slider, "setFrame:", v68, v78, v71, v73);
}

- (unint64_t)accessibilityTraits
{
  return (unint64_t)[(HUIStepSlider *)self->_slider accessibilityTraits];
}

- (id)accessibilityValue
{
  return [(UILabel *)self->_valueLabel accessibilityLabel];
}

- (id)accessibilityHint
{
  return [(HUIStepSlider *)self->_slider accessibilityHint];
}

- (id)accessibilityLabel
{
  v2 = (id *)&self->PSTableCell_opaque[OBJC_IVAR___PSTableCell__specifier];
  id WeakRetained = objc_loadWeakRetained(v2);
  double v4 = [WeakRetained propertyForKey:PSKeyNameKey];

  id v5 = objc_loadWeakRetained(v2);
  id v6 = [v5 userInfo];

  if (!v4)
  {
    id v7 = objc_loadWeakRetained(v2);
    double v4 = [v7 propertyForKey:PSIDKey];
  }
  if ([v4 isEqualToString:@"MasterVolume"]
    || [v4 isEqualToString:@"LeftVolume"]
    || [v4 isEqualToString:@"RightVolume"])
  {
    goto LABEL_6;
  }
  if ([v4 isEqualToString:@"MasterStreamVolume"])
  {
    uint64_t v19 = 0;
    double v20 = &v19;
    uint64_t v21 = 0x3032000000;
    double v22 = sub_1C36C;
    double v23 = sub_1C37C;
    id v24 = [v6 rightSelectedStreamingProgram];
    if (([(id)v20[5] isStream] & 1) == 0)
    {
      double v10 = [v6 programs];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_1C384;
      v18[3] = &unk_3CD70;
      v18[4] = &v19;
      [v10 enumerateObjectsUsingBlock:v18];
    }
    double v11 = hearingLocString();
    if ([(id)v20[5] isStream]) {
      [(id)v20[5] name];
    }
    else {
    double v14 = hearingLocString();
    }
    uint64_t v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v14);
LABEL_35:
    id v8 = (void *)v15;

    _Block_object_dispose(&v19, 8);
    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"LeftStreamVolume"])
  {
    uint64_t v19 = 0;
    double v20 = &v19;
    uint64_t v21 = 0x3032000000;
    double v22 = sub_1C36C;
    double v23 = sub_1C37C;
    id v24 = [v6 leftSelectedStreamingProgram];
    if (([(id)v20[5] isStream] & 1) == 0)
    {
      double v12 = [v6 leftPrograms];
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_1C408;
      v17[3] = &unk_3CD70;
      v17[4] = &v19;
      [v12 enumerateObjectsUsingBlock:v17];
    }
    double v11 = hearingLocString();
    if ([(id)v20[5] isStream]) {
      [(id)v20[5] name];
    }
    else {
    double v14 = hearingLocString();
    }
    uint64_t v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v14);
    goto LABEL_35;
  }
  if ([v4 isEqualToString:@"RightStreamVolume"])
  {
    uint64_t v19 = 0;
    double v20 = &v19;
    uint64_t v21 = 0x3032000000;
    double v22 = sub_1C36C;
    double v23 = sub_1C37C;
    id v24 = [v6 rightSelectedStreamingProgram];
    if (([(id)v20[5] isStream] & 1) == 0)
    {
      double v13 = [v6 rightPrograms];
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_1C48C;
      v16[3] = &unk_3CD70;
      v16[4] = &v19;
      [v13 enumerateObjectsUsingBlock:v16];
    }
    double v11 = hearingLocString();
    if ([(id)v20[5] isStream]) {
      [(id)v20[5] name];
    }
    else {
    double v14 = hearingLocString();
    }
    uint64_t v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v14);
    goto LABEL_35;
  }
  if ([v4 isEqualToString:@"MasterSensitivity"]
    || [v4 isEqualToString:@"LeftSensitivity"]
    || [v4 isEqualToString:@"RightSensitivity"]
    || [v4 isEqualToString:@"Treble"]
    || [v4 isEqualToString:@"Bass"]
    || [v4 isEqualToString:@"MasterMixedVolume"]
    || [v4 isEqualToString:@"LeftMixedVolume"]
    || [v4 isEqualToString:@"RightMixedVolume"])
  {
LABEL_6:
    id v8 = hearingLocString();
    goto LABEL_7;
  }
  id v8 = 0;
LABEL_7:

  return v8;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (void)accessibilityIncrement
{
}

- (void)accessibilityDecrement
{
}

- (id)description
{
  float v3 = (id *)&self->PSTableCell_opaque[OBJC_IVAR___PSTableCell__specifier];
  id WeakRetained = objc_loadWeakRetained(v3);
  id v5 = [WeakRetained propertyForKey:PSKeyNameKey];

  if (!v5)
  {
    id v6 = objc_loadWeakRetained(v3);
    id v5 = [v6 propertyForKey:PSIDKey];
  }
  v12.receiver = self;
  v12.super_class = (Class)AXHearingSliderValueCell;
  id v7 = [(AXHearingSliderValueCell *)&v12 description];
  id v8 = objc_loadWeakRetained(v3);
  signed int v9 = [v8 userInfo];
  double v10 = +[NSString stringWithFormat:@"%@ (%@) - [%@]", v7, v5, v9];

  return v10;
}

- (OS_dispatch_queue)valueUpdateQueue
{
  return self->_valueUpdateQueue;
}

- (void)setValueUpdateQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueUpdateQueue, 0);
  objc_storeStrong((id *)&self->_numberFormatter, 0);
  objc_storeStrong((id *)&self->_valueLabel, 0);
  objc_storeStrong((id *)&self->_slider, 0);

  objc_storeStrong((id *)&self->_leftView, 0);
}

@end