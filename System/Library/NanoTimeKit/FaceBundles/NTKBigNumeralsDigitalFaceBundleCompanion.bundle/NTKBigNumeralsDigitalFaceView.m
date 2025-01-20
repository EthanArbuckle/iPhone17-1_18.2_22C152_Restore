@interface NTKBigNumeralsDigitalFaceView
+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4;
- (NTKBigNumeralsDigitalFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5;
- (double)_verticalPaddingForStatusBar;
- (id)_renderTimeViewSwatchImageForStyle:(unint64_t)a3 typeface:(unint64_t)a4 colorOption:(id)a5;
- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5;
- (id)createFaceColorPalette;
- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7;
- (void)_cleanupAfterTransitionToOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5;
- (void)_createTimeView;
- (void)_loadSnapshotContentViews;
- (void)_prepareForStatusChange:(BOOL)a3;
- (void)_removeTimeView;
- (void)_unloadSnapshotContentViews;
- (void)layoutSubviews;
@end

@implementation NTKBigNumeralsDigitalFaceView

- (NTKBigNumeralsDigitalFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)NTKBigNumeralsDigitalFaceView;
  v5 = [(NTKBigNumeralsDigitalFaceView *)&v9 initWithFaceStyle:a3 forDevice:a4 clientIdentifier:a5];
  v6 = v5;
  if (v5) {
    v7 = v5;
  }

  return v6;
}

- (id)createFaceColorPalette
{
  v3 = [[NTKBigNumeralsDigitalColorPalette alloc] initWithFaceClass:objc_opt_class()];
  bigNumeralsColorPalette = self->_bigNumeralsColorPalette;
  self->_bigNumeralsColorPalette = v3;

  v5 = self->_bigNumeralsColorPalette;

  return v5;
}

- (void)_loadSnapshotContentViews
{
  v4.receiver = self;
  v4.super_class = (Class)NTKBigNumeralsDigitalFaceView;
  [(NTKBigNumeralsDigitalFaceView *)&v4 _loadSnapshotContentViews];
  [(NTKBigNumeralsDigitalFaceView *)self _createTimeView];
  v3 = [(NTKBigNumeralsDigitalFaceView *)self timeView];
  [v3 setDelegate:self];
}

- (void)_unloadSnapshotContentViews
{
  v4.receiver = self;
  v4.super_class = (Class)NTKBigNumeralsDigitalFaceView;
  [(NTKBigNumeralsDigitalFaceView *)&v4 _unloadSnapshotContentViews];
  v3 = [(NTKBigNumeralsDigitalFaceView *)self timeView];
  [v3 setDelegate:0];

  [(NTKBigNumeralsDigitalFaceView *)self _removeTimeView];
}

- (void)_createTimeView
{
  v3 = [(NTKBigNumeralsDigitalFaceView *)self timeView];

  if (!v3)
  {
    objc_super v4 = [NTKBigNumeralsDigitalTimeView alloc];
    v5 = [(NTKBigNumeralsDigitalFaceView *)self device];
    v7 = [(NTKBigNumeralsDigitalTimeView *)v4 initWithDevice:v5];

    [(NTKBigNumeralsDigitalFaceView *)self setTimeView:v7];
    v6 = [(NTKBigNumeralsDigitalFaceView *)self contentView];
    [v6 addSubview:v7];
  }
}

- (void)_removeTimeView
{
  v3 = [(NTKBigNumeralsDigitalFaceView *)self timeView];
  [v3 removeFromSuperview];

  [(NTKBigNumeralsDigitalFaceView *)self setTimeView:0];
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)NTKBigNumeralsDigitalFaceView;
  [(NTKBigNumeralsDigitalFaceView *)&v4 layoutSubviews];
  v3 = [(NTKBigNumeralsDigitalFaceView *)self timeView];
  [(NTKBigNumeralsDigitalFaceView *)self bounds];
  objc_msgSend(v3, "ntk_setBoundsAndPositionFromFrame:");
}

- (double)_verticalPaddingForStatusBar
{
  return 0.0;
}

- (void)_prepareForStatusChange:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(NTKBigNumeralsDigitalFaceView *)self timeView];
  [v4 setShowingStatus:v3];
}

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v10 = a3;
  v7 = [(NTKBigNumeralsDigitalFaceView *)self timeView];
  switch(a4)
  {
    case 10:
      unsigned int v8 = [(NTKBigNumeralsDigitalColorPalette *)self->_bigNumeralsColorPalette isRainbowColor];
      double v9 = 0.0;
      if (v8) {
        double v9 = 1.0;
      }
      [v7 applyRainbowColorTransitionWithFraction:self->_bigNumeralsColorPalette colorPalette:v9];
      [v7 applyColorPalette:self->_bigNumeralsColorPalette];
      break;
    case 15:
      objc_msgSend(v7, "applyStyle:", objc_msgSend(v10, "style"));
      break;
    case 13:
      objc_msgSend(v7, "applyTypeface:", objc_msgSend(v10, "typeface"));
      break;
  }
}

- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7
{
  id v20 = a4;
  id v11 = a5;
  v12 = [(NTKBigNumeralsDigitalFaceView *)self timeView];
  switch(a6)
  {
    case 10:
      v13 = [v20 pigmentEditOption];
      v14 = [v11 pigmentEditOption];
      if (([v13 isRainbowColor] & 1) != 0
        || [v14 isRainbowColor])
      {
        v15 = [(NTKBigNumeralsDigitalFaceView *)self interpolatedColorPalette];
        v16 = [v15 toPalette];

        if (([v13 isRainbowColor] & 1) != 0
          || ![v14 isRainbowColor])
        {
          a3 = 1.0 - a3;
        }
        else
        {
          v17 = [(NTKBigNumeralsDigitalFaceView *)self interpolatedColorPalette];
          uint64_t v18 = [v17 fromPalette];

          v16 = (void *)v18;
        }
        [v12 applyRainbowColorTransitionWithFraction:v16 colorPalette:a3];
      }
      else
      {
        v19 = [(NTKBigNumeralsDigitalFaceView *)self interpolatedColorPalette];
        [v12 applyRainbowColorTransitionWithFraction:v19 colorPalette:0.0];

        v16 = [(NTKBigNumeralsDigitalFaceView *)self interpolatedColorPalette];
        [v12 applyColorPalette:v16];
      }

      break;
    case 15:
      objc_msgSend(v12, "applyTransitionFraction:fromStyle:toStyle:", objc_msgSend(v20, "style"), objc_msgSend(v11, "style"), a3);
      break;
    case 13:
      objc_msgSend(v12, "applyTransitionFraction:fromTypeface:toTypeface:", objc_msgSend(v20, "typeface"), objc_msgSend(v11, "typeface"), a3);
      break;
  }
}

- (void)_cleanupAfterTransitionToOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  id v5 = [(NTKBigNumeralsDigitalFaceView *)self timeView];
  [v5 cleanupTransition];
}

- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  NTKLargeElementScaleForBreathingFraction();
  CGFloat v7 = v6;
  unsigned int v8 = [(NTKBigNumeralsDigitalFaceView *)self contentView];
  CGAffineTransformMakeScale(&v9, v7, v7);
  [v8 setTransform:&v9];
}

- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  NTKScaleForRubberBandingFraction();
  CGFloat v7 = v6;
  unsigned int v8 = [(NTKBigNumeralsDigitalFaceView *)self contentView];
  CGAffineTransformMakeScale(&v12, v7, v7);
  [v8 setTransform:&v12];

  NTKAlphaForRubberBandingFraction();
  double v10 = v9;
  id v11 = [(NTKBigNumeralsDigitalFaceView *)self contentView];
  [v11 setAlpha:v10];
}

+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4
{
  id v4 = &off_D4F0;
  if (a3 != 13) {
    id v4 = 0;
  }
  if (a3 == 15) {
    return &off_D4D8;
  }
  else {
    return v4;
  }
}

- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (!qword_11E30)
  {
    uint64_t v10 = objc_opt_new();
    id v11 = (void *)qword_11E30;
    qword_11E30 = v10;
  }
  CGAffineTransform v12 = [v9 objectForKeyedSubscript:&off_CEB8];
  id v13 = [v12 style];

  v14 = [v9 objectForKeyedSubscript:&off_CEA0];
  id v15 = [v14 typeface];

  v16 = [v9 objectForKeyedSubscript:&off_CE88];
  v17 = [v16 pigmentEditOption];

  if (a4 == 13)
  {
    v24 = self;
    id v15 = [v8 typeface];
  }
  else
  {
    if (a4 != 15)
    {
      v25.receiver = self;
      v25.super_class = (Class)NTKBigNumeralsDigitalFaceView;
      v22 = [(NTKBigNumeralsDigitalFaceView *)&v25 _swatchImageForEditOption:v8 mode:a4 withSelectedOptions:v9];
      goto LABEL_11;
    }
    v24 = self;
    id v13 = [v8 style];
  }
  uint64_t v18 = +[NSNumber numberWithUnsignedInteger:v13];
  v19 = +[NSNumber numberWithUnsignedInteger:v15];
  id v20 = [v17 JSONObjectRepresentation];
  v21 = +[NSString stringWithFormat:@"%@-%@-%@", v18, v19, v20];

  v22 = [(id)qword_11E30 objectForKey:v21];
  if (!v22)
  {
    v22 = [(NTKBigNumeralsDigitalFaceView *)v24 _renderTimeViewSwatchImageForStyle:v13 typeface:v15 colorOption:v17];
    [(id)qword_11E30 setObject:v22 forKey:v21];
  }

LABEL_11:

  return v22;
}

- (id)_renderTimeViewSwatchImageForStyle:(unint64_t)a3 typeface:(unint64_t)a4 colorOption:(id)a5
{
  id v8 = a5;
  id v9 = [(NTKBigNumeralsDigitalFaceView *)self timeView];

  if (!v9) {
    [(NTKBigNumeralsDigitalFaceView *)self _loadSnapshotContentViews];
  }
  uint64_t v10 = [(NTKBigNumeralsDigitalFaceView *)self timeView];
  id v11 = [v10 style];
  id v12 = [v10 typeface];
  id v13 = [(NTKBigNumeralsDigitalFaceView *)self faceColorPalette];
  id v14 = [v13 copy];

  [v14 setPigmentEditOption:v8];
  [v10 applyStyle:a3];
  [v10 applyTypeface:a4];
  [v10 applyColorPalette:v14];
  [(NTKBigNumeralsDigitalFaceView *)self layoutIfNeeded];
  [v10 bounds];
  id v19 = objc_msgSend(objc_alloc((Class)UIGraphicsImageRenderer), "initWithBounds:", v15, v16, v17, v18);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_4C04;
  v24[3] = &unk_C3B0;
  id v25 = v10;
  id v20 = v10;
  v21 = [v19 imageWithActions:v24];
  [v20 applyStyle:v11];
  [v20 applyTypeface:v12];
  v22 = [(NTKBigNumeralsDigitalFaceView *)self faceColorPalette];
  [v20 applyColorPalette:v22];

  return v21;
}

- (void).cxx_destruct
{
}

@end