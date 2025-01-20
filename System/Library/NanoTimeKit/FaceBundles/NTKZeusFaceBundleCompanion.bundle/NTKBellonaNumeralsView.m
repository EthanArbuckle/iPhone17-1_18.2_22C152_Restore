@interface NTKBellonaNumeralsView
- (BOOL)dateIsOn;
- (NTKBellonaNumeralsDelegate)backgroundView;
- (NTKBellonaNumeralsView)initWithDevice:(id)a3;
- (double)_rotationAngleForDigitIndex:(unint64_t)a3;
- (id)_filledDigitLayers;
- (id)_outlinedDigitLayers;
- (id)createLabel:(BOOL)a3;
- (id)textForDigit:(unint64_t)a3;
- (int64_t)updatedIndexForHour:(unint64_t)a3 currentIndex:(unint64_t)a4;
- (void)_createDigits;
- (void)hourChangeAnimationFromNow:(unint64_t)a3 withFraction:(double)a4 timeChanged:(BOOL)a5 overrideDate:(BOOL)a6;
- (void)setBackgroundView:(id)a3;
- (void)setDateIsOn:(BOOL)a3;
- (void)updateBackgroundWithPalette:(id)a3;
- (void)updateDigitsWithPalette:(id)a3;
@end

@implementation NTKBellonaNumeralsView

- (NTKBellonaNumeralsView)initWithDevice:(id)a3
{
  id v5 = a3;
  [v5 screenBounds];
  v9.receiver = self;
  v9.super_class = (Class)NTKBellonaNumeralsView;
  v6 = -[NTKBellonaNumeralsView initWithFrame:](&v9, "initWithFrame:");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    [(NTKBellonaNumeralsView *)v7 _createDigits];
  }

  return v7;
}

- (void)setDateIsOn:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_dateIsOn != a3)
  {
    id v5 = [(NSArray *)self->_filledHourMarkers objectAtIndexedSubscript:2];
    v6 = v5;
    if (v3)
    {
      [v5 setHidden:1];

      v7 = [(NSArray *)self->_outlinedHourMarkers objectAtIndexedSubscript:2];
      v8 = v7;
      uint64_t v9 = 1;
    }
    else
    {
      [v5 setHidden:0];

      v7 = [(NSArray *)self->_outlinedHourMarkers objectAtIndexedSubscript:2];
      v8 = v7;
      uint64_t v9 = 0;
    }
    [v7 setHidden:v9];
  }
  self->_dateIsOn = v3;
}

- (void)_createDigits
{
  sub_3240(self->_device, __src);
  memcpy(&unk_4C480, __src, 0x230uLL);
  BOOL v3 = [(NTKBellonaNumeralsView *)self _filledDigitLayers];
  filledHourMarkers = self->_filledHourMarkers;
  self->_filledHourMarkers = v3;

  id v5 = self->_filledHourMarkers;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_3354;
  v10[3] = &unk_3C8D8;
  v10[4] = self;
  [(NSArray *)v5 enumerateObjectsUsingBlock:v10];
  v6 = [(NTKBellonaNumeralsView *)self _outlinedDigitLayers];
  outlinedHourMarkers = self->_outlinedHourMarkers;
  self->_outlinedHourMarkers = v6;

  v8 = self->_outlinedHourMarkers;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_3360;
  v9[3] = &unk_3C8D8;
  v9[4] = self;
  [(NSArray *)v8 enumerateObjectsUsingBlock:v9];
  [(NSArray *)self->_filledHourMarkers enumerateObjectsUsingBlock:&stru_3C918];
  [(NSArray *)self->_outlinedHourMarkers enumerateObjectsUsingBlock:&stru_3C938];
}

- (id)createLabel:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc_init((Class)UILabel);
  sub_3240(self->_device, v13);
  double v6 = v14;
  if (v3)
  {
    sub_3240(self->_device, v12);
    uint64_t v7 = +[NTKZeusFontLoader capeCodInlineFontDescriptorWithInlineWidth:v12[61]];
  }
  else
  {
    uint64_t v7 = +[NTKZeusFontLoader capeCodFontDescriptor];
  }
  v8 = (void *)v7;
  uint64_t v9 = +[CLKFont fontWithDescriptor:v7 size:v6];
  [v5 setFont:v9];

  v10 = +[UIColor colorWithRed:0.803921569 green:0.745098039 blue:0.694117647 alpha:1.0];
  [v5 setTextColor:v10];

  return v5;
}

- (id)textForDigit:(unint64_t)a3
{
  BOOL v3 = +[NSNumber numberWithUnsignedInteger:a3];
  v4 = [v3 stringValue];

  return v4;
}

- (double)_rotationAngleForDigitIndex:(unint64_t)a3
{
  return ((double)((a3 + 6) % 0xC) / 12.0 + (double)((a3 + 6) % 0xC) / 12.0) * 3.14159265;
}

- (id)_filledDigitLayers
{
  memset(v32, 0, sizeof(v32));
  sub_3240(self->_device, v32);
  CLKClockTimerDateForNow();
  BOOL v3 = v30;
  self->_unint64_t hour = v31;

  v4 = +[NSMutableArray array];
  unint64_t v5 = 0;
  double v6 = v35;
  double v7 = v34;
  double v8 = v33;
  do
  {
    unint64_t hour = self->_hour;
    if (hour >= 0xC)
    {
      self->_unint64_t hour = hour - 12;
      hour -= 12;
    }
    unint64_t v10 = v5 + 12;
    if (hour <= v5) {
      unint64_t v10 = v5;
    }
    uint64_t v11 = v10 - hour;
    if (v11 <= 11) {
      uint64_t v12 = v11;
    }
    else {
      uint64_t v12 = v11 - 12;
    }
    v13 = [(NTKBellonaNumeralsView *)self createLabel:0];
    double v14 = [(NTKBellonaNumeralsView *)self textForDigit:v5 + 1];
    [v13 setText:v14];

    [v13 sizeToFit];
    if (v13) {
      [v13 transform];
    }
    else {
      memset(&v28, 0, sizeof(v28));
    }
    [(NTKBellonaNumeralsView *)self _rotationAngleForDigitIndex:v5 + 1];
    CGAffineTransformRotate(&v29, &v28, v15);
    CGAffineTransform v27 = v29;
    [v13 setTransform:&v27];
    if ((v5 - 8) <= 0xFFFFFFFA)
    {
      if (v13) {
        [v13 transform];
      }
      else {
        memset(&v25, 0, sizeof(v25));
      }
      CLKDegreesToRadians();
      CGAffineTransformRotate(&v26, &v25, v16);
      CGAffineTransform v24 = v26;
      [v13 setTransform:&v24];
    }
    [v13 setAlpha:*((double *)&v32[24] + v12)];
    double v17 = v8;
    if (v5 == 9
      || (double v17 = v6, v5 == 11)
      || (double v17 = v7, v5 == 10)
      || (double v17 = 0.0, ((v5 + 1) & 0x7FFFFFFE) == 0xA))
    {
      NSAttributedStringKey v36 = NSKernAttributeName;
      v18 = +[NSNumber numberWithDouble:v17];
      v37 = v18;
      v19 = +[NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];

      id v20 = objc_alloc((Class)NSAttributedString);
      v21 = [v13 text];
      id v22 = [v20 initWithString:v21 attributes:v19];
      [v13 setAttributedText:v22];

      if (v5 != 10) {
        [v13 sizeToFit];
      }
    }
    objc_msgSend(v4, "addObject:", v13, v17);

    ++v5;
  }
  while (v5 != 12);

  return v4;
}

- (id)_outlinedDigitLayers
{
  sub_3240(self->_device, v25);
  BOOL v3 = +[NSMutableArray array];
  uint64_t v4 = 0;
  double v5 = v28;
  double v6 = v27;
  double v7 = v26;
  do
  {
    double v8 = [(NTKBellonaNumeralsView *)self createLabel:1];
    uint64_t v9 = [(NTKBellonaNumeralsView *)self textForDigit:v4 + 1];
    [v8 setText:v9];

    [v8 sizeToFit];
    if (v8) {
      [v8 transform];
    }
    else {
      memset(&v23, 0, sizeof(v23));
    }
    [(NTKBellonaNumeralsView *)self _rotationAngleForDigitIndex:v4 + 1];
    CGAffineTransformRotate(&v24, &v23, v10);
    CGAffineTransform v22 = v24;
    [v8 setTransform:&v22];
    if ((v4 - 8) <= 0xFFFFFFFA)
    {
      if (v8) {
        [v8 transform];
      }
      else {
        memset(&v20, 0, sizeof(v20));
      }
      CLKDegreesToRadians();
      CGAffineTransformRotate(&v21, &v20, v11);
      CGAffineTransform v19 = v21;
      [v8 setTransform:&v19];
    }
    double v12 = v7;
    if (v4 == 9
      || (double v12 = v5, v4 == 11)
      || (double v12 = v6, v4 == 10)
      || (double v12 = 0.0, ((v4 + 1) & 0x7FFFFFFE) == 0xA))
    {
      NSAttributedStringKey v29 = NSKernAttributeName;
      v13 = +[NSNumber numberWithDouble:v12];
      v30 = v13;
      double v14 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];

      id v15 = objc_alloc((Class)NSAttributedString);
      CGFloat v16 = [v8 text];
      id v17 = [v15 initWithString:v16 attributes:v14];
      [v8 setAttributedText:v17];

      if (v4 != 10) {
        [v8 sizeToFit];
      }
    }
    objc_msgSend(v3, "addObject:", v8, v12);

    ++v4;
  }
  while (v4 != 12);

  return v3;
}

- (void)updateDigitsWithPalette:(id)a3
{
  id v4 = a3;
  filledHourMarkers = self->_filledHourMarkers;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_3CB0;
  v11[3] = &unk_3C8D8;
  id v6 = v4;
  id v12 = v6;
  [(NSArray *)filledHourMarkers enumerateObjectsUsingBlock:v11];
  outlinedHourMarkers = self->_outlinedHourMarkers;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_3D30;
  v9[3] = &unk_3C8D8;
  id v10 = v6;
  id v8 = v6;
  [(NSArray *)outlinedHourMarkers enumerateObjectsUsingBlock:v9];
}

- (void)updateBackgroundWithPalette:(id)a3
{
  id v4 = [a3 background];
  [(NTKBellonaNumeralsView *)self setBackgroundColor:v4];
}

- (void)hourChangeAnimationFromNow:(unint64_t)a3 withFraction:(double)a4 timeChanged:(BOOL)a5 overrideDate:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  memset(v19, 0, 512);
  sub_3240(self->_device, v19);
  uint64_t v11 = 0;
  int v12 = v7 || v6;
  do
  {
    v13 = [(NSArray *)self->_filledHourMarkers objectAtIndexedSubscript:[(NTKBellonaNumeralsView *)self updatedIndexForHour:a3 currentIndex:v11]];
    BOOL v15 = v11 == 2 && self->_dateIsOn;
    if (v12)
    {
      if (v15)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_backgroundView);
        [WeakRetained hourChangeAnimationFromCurrentHour:a3 withFraction:1 timeChanged:a4];
      }
      double v17 = *((double *)&v19[24] + v11);
    }
    else
    {
      if (v15)
      {
        id v18 = objc_loadWeakRetained((id *)&self->_backgroundView);
        [v18 hourChangeAnimationFromCurrentHour:a3 withFraction:0 timeChanged:a4];

        goto LABEL_16;
      }
      CLKInterpolateBetweenFloatsClipped();
    }
    [v13 setAlpha:v17];
LABEL_16:

    ++v11;
  }
  while (v11 != 12);
}

- (int64_t)updatedIndexForHour:(unint64_t)a3 currentIndex:(unint64_t)a4
{
  unint64_t v4 = a3 - 12;
  if (a3 <= 0xB) {
    unint64_t v4 = a3;
  }
  int64_t v5 = v4 + a4;
  if (v5 <= 11) {
    return v5;
  }
  else {
    return v5 - 12;
  }
}

- (BOOL)dateIsOn
{
  return self->_dateIsOn;
}

- (NTKBellonaNumeralsDelegate)backgroundView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_backgroundView);

  return (NTKBellonaNumeralsDelegate *)WeakRetained;
}

- (void)setBackgroundView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_backgroundView);
  objc_storeStrong((id *)&self->_outlinedHourMarkers, 0);
  objc_storeStrong((id *)&self->_filledHourMarkers, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end