@interface NTKChronoRichFaceView
+ (int64_t)uiSensitivity;
- ($F24F406B2B787EFB06265DBA3D28CBD5)_startButtonLayoutConstants;
- (NTKChronoRichFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5;
- (void)_configureComplicationView:(id)a3 forSlot:(id)a4;
@end

@implementation NTKChronoRichFaceView

+ (int64_t)uiSensitivity
{
  return _NTKBlueRidgeUISensitivity(a1, a2);
}

- (NTKChronoRichFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)NTKChronoRichFaceView;
  v5 = [(NTKChronoFaceView *)&v9 initWithFaceStyle:a3 forDevice:a4 clientIdentifier:a5];
  v6 = v5;
  if (v5)
  {
    v7 = [(NTKChronoRichFaceView *)v5 complicationFactory];
    [v7 setGraphicCornerComplications:1];
  }
  return v6;
}

- (void)_configureComplicationView:(id)a3 forSlot:(id)a4
{
  id v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NTKChronoRichFaceView;
  [(NTKChronoFaceView *)&v9 _configureComplicationView:v6 forSlot:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;
    v8 = +[UIColor colorWithRed:0.701960784 green:0.701960784 blue:0.701960784 alpha:1.0];
    [(NTKChronoRichFaceView *)self setComplicationColor:v8];
    [(NTKChronoRichFaceView *)self setInterpolatedComplicationColor:v8];
    [v7 transitionToMonochromeWithFraction:1.0];
    [v7 updateMonochromeColor];
  }
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_startButtonLayoutConstants
{
  v2 = [(NTKChronoRichFaceView *)self device];
  double v3 = sub_E094(v2, 1);
  double v5 = v4;

  double v6 = v3;
  double v7 = v5;
  result.var1 = v7;
  result.var0 = v6;
  return result;
}

@end