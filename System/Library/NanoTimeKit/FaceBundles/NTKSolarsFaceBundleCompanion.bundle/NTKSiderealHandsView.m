@interface NTKSiderealHandsView
- (id)hourHandConfiguration;
- (id)initForDevice:(id)a3;
- (id)minuteHandConfiguration;
- (id)secondHandConfiguration;
- (void)layoutSubviews;
@end

@implementation NTKSiderealHandsView

- (id)initForDevice:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NTKSiderealHandsView;
  id v3 = [(NTKSiderealHandsView *)&v6 initForDevice:a3];
  v4 = v3;
  if (v3) {
    [v3 setMinuteHandDotDiameter:2.0];
  }
  return v4;
}

- (id)hourHandConfiguration
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  id v3 = [(NTKSiderealHandsView *)self device];
  sub_18BCC(v3, &v7);

  v4 = [(NTKSiderealHandsView *)self device];
  v5 = +[CLKUIAnalogHandConfiguration defaultHourConfigurationForDevice:v4];

  [v5 setHandWidth:*(double *)&v7];
  [v5 setArmWidth:*((double *)&v7 + 1)];
  [v5 setArmLength:*(double *)&v8];
  [v5 setPegRadius:*((double *)&v8 + 1)];
  [v5 setPegStrokeWidth:*(double *)&v9];
  [v5 setHandLength:*((double *)&v9 + 1)];
  [v5 setRadialShadowOpacity:0.25];

  return v5;
}

- (id)minuteHandConfiguration
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  id v3 = [(NTKSiderealHandsView *)self device];
  sub_18BCC(v3, &v7);

  v4 = [(NTKSiderealHandsView *)self device];
  v5 = +[CLKUIAnalogHandConfiguration defaultMinuteConfigurationForDevice:v4];

  [v5 setHandWidth:*(double *)&v7];
  [v5 setArmWidth:*((double *)&v7 + 1)];
  [v5 setArmLength:*(double *)&v8];
  [v5 setPegRadius:*((double *)&v8 + 1)];
  [v5 setPegStrokeWidth:*(double *)&v9];
  [v5 setHandLength:*(double *)&v10];
  [v5 setRadialShadowOpacity:0.25];

  return v5;
}

- (id)secondHandConfiguration
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v8 = 0u;
  id v3 = [(NTKSiderealHandsView *)self device];
  sub_18BCC(v3, &v7);

  v4 = [(NTKSiderealHandsView *)self device];
  v5 = +[CLKUIAnalogHandConfiguration defaultSecondConfigurationForDevice:v4];

  [v5 setHandWidth:*((double *)&v8 + 1)];
  [v5 setHandLength:*(double *)&v9];
  [v5 setTailLength:*((double *)&v9 + 1)];
  [v5 setPegRadius:*(double *)&v10];
  [v5 setPegStrokeWidth:*((double *)&v10 + 1)];
  [v5 setRadialShadowOpacity:0.25];

  return v5;
}

- (void)layoutSubviews
{
  [(NTKSiderealHandsView *)self bounds];
  double v4 = v3 * 0.5;
  [(NTKSiderealHandsView *)self bounds];
  double v6 = v5 * 0.5;
  long long v7 = [(NTKSiderealHandsView *)self minuteHandView];
  objc_msgSend(v7, "setCenter:", v4, v6);

  long long v8 = [(NTKSiderealHandsView *)self hourHandView];
  objc_msgSend(v8, "setCenter:", v4, v6);

  id v9 = [(NTKSiderealHandsView *)self secondHandView];
  objc_msgSend(v9, "setCenter:", v4, v6);
}

@end