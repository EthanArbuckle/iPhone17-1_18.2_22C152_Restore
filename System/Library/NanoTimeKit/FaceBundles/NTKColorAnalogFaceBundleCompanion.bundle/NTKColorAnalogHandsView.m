@interface NTKColorAnalogHandsView
- (id)hourHandConfiguration;
- (id)minuteHandConfiguration;
- (id)secondHandConfiguration;
@end

@implementation NTKColorAnalogHandsView

- (id)hourHandConfiguration
{
  v2 = [(NTKColorAnalogHandsView *)self device];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  long long v5 = 0u;
  sub_B284(v2, &v5);
  v3 = +[CLKUIAnalogHandConfiguration defaultHourConfigurationForDevice:v2];
  [v3 setDropShadowRadius:*(double *)&v5];
  [v3 setDropShadowOpacity:*((double *)&v5 + 1)];
  [v3 setRadialShadowRadius:*(double *)&v6];
  [v3 setRadialShadowOpacity:*((double *)&v6 + 1)];
  [v3 setDirectionalShadowOffset:v7];

  return v3;
}

- (id)minuteHandConfiguration
{
  v2 = [(NTKColorAnalogHandsView *)self device];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  memset(v5, 0, sizeof(v5));
  sub_B284(v2, v5);
  v3 = +[CLKUIAnalogHandConfiguration defaultMinuteConfigurationForDevice:v2];
  [v3 setDropShadowRadius:*(double *)&v6];
  [v3 setDropShadowOpacity:*((double *)&v6 + 1)];
  [v3 setRadialShadowRadius:*(double *)&v7];
  [v3 setRadialShadowOpacity:*((double *)&v7 + 1)];
  [v3 setDirectionalShadowOffset:v8];

  return v3;
}

- (id)secondHandConfiguration
{
  v2 = [(NTKColorAnalogHandsView *)self device];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v6 = 0u;
  memset(v5, 0, sizeof(v5));
  sub_B284(v2, v5);
  v3 = +[CLKUIAnalogHandConfiguration defaultSecondConfigurationForDevice:v2];
  [v3 setDropShadowRadius:*(double *)&v6];
  [v3 setDropShadowOpacity:*((double *)&v6 + 1)];
  [v3 setRadialShadowRadius:*(double *)&v7];
  [v3 setRadialShadowOpacity:*((double *)&v7 + 1)];
  [v3 setDirectionalShadowOffset:v8];

  return v3;
}

@end