@interface NTKSimpleRichFaceView
+ (int64_t)uiSensitivity;
- (BOOL)_fadesComplicationSlot:(id)a3 inEditMode:(int64_t)a4;
- (CGRect)_keylineFrameForComplicationSlot:(id)a3 selected:(BOOL)a4;
- (NTKSimpleRichFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5;
- (void)_addDetailedMinutesToView:(id)a3;
- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7;
- (void)_configureComplicationView:(id)a3 forSlot:(id)a4;
- (void)_removeComplicationOverlapHiding;
- (void)_updateComplicationOverlapHiding;
@end

@implementation NTKSimpleRichFaceView

+ (int64_t)uiSensitivity
{
  return _NTKBlueRidgeUISensitivity(a1, a2);
}

- (NTKSimpleRichFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)NTKSimpleRichFaceView;
  v5 = [(NTKSimpleFaceView *)&v9 initWithFaceStyle:a3 forDevice:a4 clientIdentifier:a5];
  v6 = v5;
  if (v5)
  {
    v7 = [(NTKSimpleRichFaceView *)v5 complicationFactory];
    [v7 setGraphicCornerComplications:1];
  }
  return v6;
}

- (void)_configureComplicationView:(id)a3 forSlot:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NTKSimpleRichFaceView;
  [(NTKSimpleFaceView *)&v10 _configureComplicationView:v6 forSlot:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    v8 = [(NTKSimpleFaceView *)self accentColor];
    [(NTKSimpleRichFaceView *)self setComplicationColor:v8];

    objc_super v9 = [(NTKSimpleFaceView *)self accentColor];
    [(NTKSimpleRichFaceView *)self setInterpolatedComplicationColor:v9];

    [v7 transitionToMonochromeWithFraction:1.0];
    [v7 updateMonochromeColor];
  }
}

- (CGRect)_keylineFrameForComplicationSlot:(id)a3 selected:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([v6 isEqualToString:NTKComplicationSlotDate])
  {
    v24.receiver = self;
    v24.super_class = (Class)NTKSimpleRichFaceView;
    [(NTKSimpleRichFaceView *)&v24 _keylineFrameForComplicationSlot:v6 selected:v4];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
  }
  else
  {
    v15 = [(NTKSimpleRichFaceView *)self complicationFactory];
    [v15 keylineFrameForCornerComplicationSlot:v6 selected:v4 faceView:self];
    double v8 = v16;
    double v10 = v17;
    double v12 = v18;
    double v14 = v19;
  }
  double v20 = v8;
  double v21 = v10;
  double v22 = v12;
  double v23 = v14;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (BOOL)_fadesComplicationSlot:(id)a3 inEditMode:(int64_t)a4
{
  return a4 == 11;
}

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  v8.receiver = self;
  v8.super_class = (Class)NTKSimpleRichFaceView;
  [(NTKSimpleFaceView *)&v8 _applyOption:a3 forCustomEditMode:a4 slot:a5];
  if (a4 == 10)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_57FC;
    v7[3] = &unk_C3A0;
    v7[4] = self;
    [(NTKSimpleRichFaceView *)self enumerateComplicationDisplayWrappersWithBlock:v7];
  }
}

- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7
{
  v20.receiver = self;
  v20.super_class = (Class)NTKSimpleRichFaceView;
  -[NTKSimpleFaceView _applyTransitionFraction:fromOption:toOption:forCustomEditMode:slot:](&v20, "_applyTransitionFraction:fromOption:toOption:forCustomEditMode:slot:", a4, a5, a6, a7);
  if (a6 == 10)
  {
    double v10 = [(NTKSimpleRichFaceView *)self interpolatedColorPalette];
    double v11 = [v10 fromPalette];
    double v12 = [(NTKSimpleFaceView *)self _faceColorSchemeForFaceColorPalette:v11];
    double v13 = [(NTKSimpleRichFaceView *)self interpolatedColorPalette];
    double v14 = [v13 toPalette];
    v15 = [(NTKSimpleFaceView *)self _faceColorSchemeForFaceColorPalette:v14];
    double v16 = +[NTKFaceColorScheme interpolationFrom:v12 to:v15 fraction:a3];

    [v16 accentColor];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_5A50;
    v18[3] = &unk_C410;
    v18[4] = self;
    id v19 = (id)objc_claimAutoreleasedReturnValue();
    id v17 = v19;
    [(NTKSimpleRichFaceView *)self enumerateComplicationDisplayWrappersWithBlock:v18];
  }
}

- (void)_removeComplicationOverlapHiding
{
  for (uint64_t i = 0; i != 4; ++i)
  {
    BOOL v4 = [(NTKSimpleFaceView *)self _ticksViewAtIndex:i];
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v5 = objc_msgSend(v4, "outerDigits", 0);
    id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        double v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) setHidden:0];
          double v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }
  }
}

- (void)_addDetailedMinutesToView:(id)a3
{
  id v4 = a3;
  v5 = [(NTKSimpleRichFaceView *)self device];
  uint64_t v37 = 0;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  memset(v32, 0, sizeof(v32));
  sub_3E94(v5, (uint64_t)v32);
  +[NTKAnalogUtilities dialDiameterForDevice:v5];
  double v7 = v6 * 0.5;
  double v8 = *((double *)&v33 + 1);
  double v9 = +[CLKFont systemFontOfSize:*(double *)&v34];
  [v4 center];
  double v26 = v11;
  double v27 = v10;
  long long v12 = [v4 outerDigits];

  if (v12)
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v13 = [v4 outerDigits];
    id v14 = [v13 countByEnumeratingWithState:&v28 objects:v38 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v16 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v15; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v29 != v16) {
            objc_enumerationMutation(v13);
          }
          [*(id *)(*((void *)&v28 + 1) + 8 * i) removeFromSuperview];
        }
        id v15 = [v13 countByEnumeratingWithState:&v28 objects:v38 count:16];
      }
      while (v15);
    }
  }
  double v18 = objc_opt_new();
  uint64_t v19 = 0;
  double height = CGSizeZero.height;
  do
  {
    v19 += 5;
    if (v19 != 15 && v19 != 45)
    {
      double v21 = objc_opt_new();
      double v22 = +[NSString localizedStringWithFormat:@"%02ld", v19];
      [v21 setText:v22];

      [v21 setFont:v9];
      double v23 = +[UIColor whiteColor];
      [v21 setTextColor:v23];

      [v21 setTag:v19];
      objc_msgSend(v21, "sizeThatFits:", CGSizeZero.width, height);
      [v9 lineHeight];
      CLKPixelAlignRectForDevice();
      objc_msgSend(v21, "setBounds:");
      __double2 v24 = __sincos_stret((double)v19 * -6.28318531 / 60.0 + 1.57079633);
      objc_msgSend(v21, "setCenter:", v27 + round((v7 + v8) * v24.__cosval), v26 - round((v7 + v8) * v24.__sinval));
      [v4 addSubview:v21];
      [v18 addObject:v21];
    }
  }
  while ((unint64_t)v19 < 0x38);
  v25 = +[NSArray arrayWithArray:v18];
  [v4 setOuterDigits:v25];
}

- (void)_updateComplicationOverlapHiding
{
  v3 = [(NTKSimpleRichFaceView *)self delegate];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v26[0] = NTKComplicationSlotTopLeft;
  v26[1] = NTKComplicationSlotTopRight;
  v26[2] = NTKComplicationSlotBottomLeft;
  v26[3] = NTKComplicationSlotBottomRight;
  id v4 = +[NSArray arrayWithObjects:v26 count:4];
  id v5 = [v4 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v5; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(v4);
        }
        if (![v3 faceViewComplicationIsEmptyForSlot:*(void *)(*((void *)&v21 + 1) + 8 * i)])
        {
          id v5 = &dword_0 + 1;
          goto LABEL_11;
        }
      }
      id v5 = [v4 countByEnumeratingWithState:&v21 objects:v27 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  for (uint64_t j = 0; j != 4; ++j)
  {
    double v9 = [(NTKSimpleFaceView *)self _ticksViewAtIndex:j];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    double v10 = objc_msgSend(v9, "outerDigits", 0);
    id v11 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        for (k = 0; k != v12; k = (char *)k + 1)
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          [*(id *)(*((void *)&v17 + 1) + 8 * (void)k) setHidden:v5];
        }
        id v12 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v12);
    }

    id v15 = [v9 outerDigits];
    uint64_t v16 = [v15 lastObject];

    objc_msgSend(v16, "setHidden:", v5 | -[NTKSimpleFaceView _isShowingStatus](self, "_isShowingStatus"));
  }
}

@end