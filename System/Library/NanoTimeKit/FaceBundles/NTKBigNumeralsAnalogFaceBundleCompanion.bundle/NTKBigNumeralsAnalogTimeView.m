@interface NTKBigNumeralsAnalogTimeView
- (double)_largeHandAlpha;
- (id)createHourHandView;
- (id)createMinuteHandView;
- (id)createSecondHandView;
- (id)hourHandConfiguration;
- (id)initForDevice:(id)a3;
- (id)minuteHandConfiguration;
- (id)secondHandConfiguration;
- (void)layoutSubviews;
@end

@implementation NTKBigNumeralsAnalogTimeView

- (id)initForDevice:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NTKBigNumeralsAnalogTimeView;
  id v3 = [(NTKBigNumeralsAnalogTimeView *)&v6 initForDevice:a3];
  v4 = v3;
  if (v3) {
    [v3 setMinuteHandDotDiameter:5.0];
  }
  return v4;
}

- (id)hourHandConfiguration
{
  uint64_t v13 = 0;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  id v3 = [(NTKBigNumeralsAnalogTimeView *)self device];
  sub_5AE4(v3, (uint64_t)&v7);

  v4 = [(NTKBigNumeralsAnalogTimeView *)self device];
  v5 = +[CLKUIAnalogHandConfiguration defaultHourConfigurationForDevice:v4];

  [v5 setHandWidth:*((double *)&v7 + 1)];
  [v5 setArmWidth:*(double *)&v8];
  [v5 setArmLength:*((double *)&v8 + 1)];
  [v5 setPegRadius:*(double *)&v9];
  [v5 setPegStrokeWidth:*((double *)&v9 + 1)];
  [v5 setHandLength:*(double *)&v10];
  [v5 setRadialShadowOpacity:0.35];
  [v5 setDropShadowRadius:9.0];
  [v5 setInlayInsetRadius:*(double *)&v7];
  [v5 setExcludePeg:1];

  return v5;
}

- (id)minuteHandConfiguration
{
  uint64_t v13 = 0;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  id v3 = [(NTKBigNumeralsAnalogTimeView *)self device];
  sub_5AE4(v3, (uint64_t)&v7);

  v4 = [(NTKBigNumeralsAnalogTimeView *)self device];
  v5 = +[CLKUIAnalogHandConfiguration defaultMinuteConfigurationForDevice:v4];

  [v5 setHandWidth:*((double *)&v7 + 1)];
  [v5 setArmWidth:*(double *)&v8];
  [v5 setArmLength:*((double *)&v8 + 1)];
  [v5 setPegRadius:*(double *)&v9];
  [v5 setPegStrokeWidth:*((double *)&v9 + 1)];
  [v5 setHandLength:*((double *)&v10 + 1)];
  [v5 setRadialShadowOpacity:0.35];
  [v5 setDropShadowRadius:9.0];
  [v5 setInlayInsetRadius:*(double *)&v7];

  return v5;
}

- (id)secondHandConfiguration
{
  double v10 = 0.0;
  long long v8 = 0u;
  long long v9 = 0u;
  id v3 = [(NTKBigNumeralsAnalogTimeView *)self device];
  sub_5AE4(v3, (uint64_t)&v7);

  v4 = [(NTKBigNumeralsAnalogTimeView *)self device];
  v5 = +[CLKUIAnalogHandConfiguration defaultSecondConfigurationForDevice:v4];

  [v5 setHandWidth:*(double *)&v8];
  [v5 setHandLength:*((double *)&v8 + 1)];
  [v5 setTailLength:*(double *)&v9];
  [v5 setPegRadius:*((double *)&v9 + 1)];
  [v5 setPegStrokeWidth:v10];
  [v5 setRadialShadowOpacity:0.5];
  [v5 setRoundedSecondHand:1];

  return v5;
}

- (id)createHourHandView
{
  v5.receiver = self;
  v5.super_class = (Class)NTKBigNumeralsAnalogTimeView;
  id v3 = [(NTKBigNumeralsAnalogTimeView *)&v5 createHourHandView];
  [(NTKBigNumeralsAnalogTimeView *)self _largeHandAlpha];
  objc_msgSend(v3, "setAlpha:");

  return v3;
}

- (id)createMinuteHandView
{
  v5.receiver = self;
  v5.super_class = (Class)NTKBigNumeralsAnalogTimeView;
  id v3 = [(NTKBigNumeralsAnalogTimeView *)&v5 createMinuteHandView];
  [(NTKBigNumeralsAnalogTimeView *)self _largeHandAlpha];
  objc_msgSend(v3, "setAlpha:");

  return v3;
}

- (id)createSecondHandView
{
  v5.receiver = self;
  v5.super_class = (Class)NTKBigNumeralsAnalogTimeView;
  v2 = [(NTKBigNumeralsAnalogTimeView *)&v5 createSecondHandView];
  id v3 = +[UIColor systemOrangeColor];
  [v2 setColor:v3];

  return v2;
}

- (void)layoutSubviews
{
  [(NTKBigNumeralsAnalogTimeView *)self bounds];
  double v4 = v3 * 0.5;
  [(NTKBigNumeralsAnalogTimeView *)self bounds];
  double v6 = v5 * 0.5;
  long long v7 = [(NTKBigNumeralsAnalogTimeView *)self minuteHandView];
  objc_msgSend(v7, "setCenter:", v4, v6);

  long long v8 = [(NTKBigNumeralsAnalogTimeView *)self hourHandView];
  objc_msgSend(v8, "setCenter:", v4, v6);

  long long v9 = [(NTKBigNumeralsAnalogTimeView *)self secondHandView];
  objc_msgSend(v9, "setCenter:", v4, v6);

  [(NTKBigNumeralsAnalogTimeView *)self layoutShadowViews];
}

- (double)_largeHandAlpha
{
  return 0.8;
}

@end