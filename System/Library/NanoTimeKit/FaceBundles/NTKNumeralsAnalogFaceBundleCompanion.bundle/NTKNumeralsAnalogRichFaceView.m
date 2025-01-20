@interface NTKNumeralsAnalogRichFaceView
+ (int64_t)uiSensitivity;
- (int64_t)_keylineStyleForComplicationSlot:(id)a3;
- (void)_applyFaceColorPalette:(id)a3 toComplicationView:(id)a4;
- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7;
- (void)_configureComplicationFactory:(id)a3;
- (void)_configureComplicationView:(id)a3 forSlot:(id)a4;
- (void)_loadLayoutRules;
@end

@implementation NTKNumeralsAnalogRichFaceView

+ (int64_t)uiSensitivity
{
  return _NTKBlueRidgeUISensitivity(a1, a2);
}

- (void)_applyFaceColorPalette:(id)a3 toComplicationView:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = [(NTKNumeralsAnalogRichFaceView *)self device];
    v8 = +[NTKFaceColorScheme colorSchemeForDevice:v7 withFaceColorPalette:v13 units:25];

    id v9 = v6;
    v10 = [v8 foregroundColor];
    [(NTKNumeralsAnalogRichFaceView *)self setComplicationColor:v10];

    v11 = [v8 foregroundColor];
    [(NTKNumeralsAnalogRichFaceView *)self setInterpolatedComplicationColor:v11];

    v12 = +[UIColor whiteColor];
    [(NTKNumeralsAnalogRichFaceView *)self setAlternateComplicationColor:v12];

    [v9 updateMonochromeColor];
    [v9 transitionToMonochromeWithFraction:1.0];
  }
}

- (void)_configureComplicationView:(id)a3 forSlot:(id)a4
{
  id v5 = a3;
  id v6 = [(NTKNumeralsAnalogRichFaceView *)self faceColorPalette];
  [(NTKNumeralsAnalogRichFaceView *)self _applyFaceColorPalette:v6 toComplicationView:v5];
}

- (void)_loadLayoutRules
{
  v22.receiver = self;
  v22.super_class = (Class)NTKNumeralsAnalogRichFaceView;
  [(NTKNumeralsAnalogFaceView *)&v22 _loadLayoutRules];
  [(NTKNumeralsAnalogRichFaceView *)self bounds];
  id v3 = NTKComplicationSlot1;
  v4 = [(NTKNumeralsAnalogRichFaceView *)self complicationLayoutforSlot:v3];
  id v5 = [(NTKNumeralsAnalogRichFaceView *)self device];
  os_unfair_lock_lock((os_unfair_lock_t)&unk_16BE8);
  id WeakRetained = objc_loadWeakRetained(&qword_16BF0);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v7 = WeakRetained;
  id v8 = objc_loadWeakRetained(&qword_16BF0);
  if (v8 != v5)
  {

LABEL_5:
    id v11 = objc_storeWeak(&qword_16BF0, v5);
    qword_16BF8 = (uint64_t)[v5 version];

    sub_93B0(v12, (uint64_t)v5);
    goto LABEL_6;
  }
  id v9 = [v5 version];
  uint64_t v10 = qword_16BF8;

  if (v9 != (id)v10) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_16BE8);

  NTKGraphicCircularScaledComplicationDiameter();
  double v14 = v13;
  NTKWhistlerSubdialComplicationDiameter();
  NTKWhistlerSubdialComplicationContentDiameter();
  memset(&v21, 0, sizeof(v21));
  CGAffineTransformMakeScale(&v21, v14 / v15, v14 / v15);
  v16 = [(NTKNumeralsAnalogFaceView *)self _faceConfiguration];
  [v16 utilitySlot];

  v19 = v5;
  v20 = v4;
  id v17 = v4;
  id v18 = v5;
  NTKEnumerateComplicationStates();
}

- (int64_t)_keylineStyleForComplicationSlot:(id)a3
{
  v4 = [(NTKNumeralsAnalogRichFaceView *)self delegate];
  id v5 = [v4 faceViewComplicationForSlot:NTKComplicationSlot1];

  id v6 = [(NTKNumeralsAnalogRichFaceView *)self device];
  LODWORD(v4) = [v5 supportsComplicationFamily:10 forDevice:v6];

  return v4;
}

- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7
{
  v22.receiver = self;
  v22.super_class = (Class)NTKNumeralsAnalogRichFaceView;
  -[NTKNumeralsAnalogFaceView _applyTransitionFraction:fromOption:toOption:forCustomEditMode:slot:](&v22, "_applyTransitionFraction:fromOption:toOption:forCustomEditMode:slot:", a4, a5, a6, a7);
  if (a6 == 10)
  {
    uint64_t v10 = [(NTKNumeralsAnalogRichFaceView *)self device];
    id v11 = [(NTKNumeralsAnalogRichFaceView *)self interpolatedColorPalette];
    uint64_t v12 = [v11 fromPalette];
    double v13 = +[NTKFaceColorScheme colorSchemeForDevice:v10 withFaceColorPalette:v12 units:25];
    double v14 = [(NTKNumeralsAnalogRichFaceView *)self device];
    double v15 = [(NTKNumeralsAnalogRichFaceView *)self interpolatedColorPalette];
    v16 = [v15 toPalette];
    id v17 = +[NTKFaceColorScheme colorSchemeForDevice:v14 withFaceColorPalette:v16 units:25];
    id v18 = +[NTKFaceColorScheme interpolationFrom:v13 to:v17 fraction:a3];

    v19 = [v18 foregroundColor];
    [(NTKNumeralsAnalogRichFaceView *)self setComplicationColor:v19];

    v20 = [v18 foregroundColor];
    [(NTKNumeralsAnalogRichFaceView *)self setInterpolatedComplicationColor:v20];

    CGAffineTransform v21 = +[UIColor whiteColor];
    [(NTKNumeralsAnalogRichFaceView *)self setAlternateComplicationColor:v21];

    [(NTKNumeralsAnalogFaceView *)self _enumerateComplicationViewsWithBlock:&stru_10740];
  }
}

- (void)_configureComplicationFactory:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NTKNumeralsAnalogRichFaceView;
  id v3 = a3;
  [(NTKNumeralsAnalogFaceView *)&v4 _configureComplicationFactory:v3];
  objc_msgSend(v3, "setGraphicCornerComplications:", 1, v4.receiver, v4.super_class);
}

@end