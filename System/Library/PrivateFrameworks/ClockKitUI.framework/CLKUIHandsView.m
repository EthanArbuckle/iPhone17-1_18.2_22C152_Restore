@interface CLKUIHandsView
- (CLKUIHandsView)initWithDiameter:(double)a3 forDevice:(id)a4;
- (id)hourHandConfiguration;
- (id)minuteHandConfiguration;
- (id)secondHandConfiguration;
- (void)setOverrideDate:(id)a3;
@end

@implementation CLKUIHandsView

- (CLKUIHandsView)initWithDiameter:(double)a3 forDevice:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CLKUIHandsView;
  v5 = [(CLKUIAnalogHandsView *)&v8 initForDevice:a4];
  v6 = v5;
  if (v5)
  {
    -[CLKUIHandsView setFrame:](v5, "setFrame:", 0.0, 0.0, a3, a3);
    [(CLKUIAnalogHandsView *)v6 setMinuteHandDotDiameter:1.0];
  }
  return v6;
}

- (id)hourHandConfiguration
{
  double v16 = 0.0;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v9 = 0u;
  v3 = [(CLKUIAnalogHandsView *)self device];
  _LayoutConstants_2(v3, (uint64_t)&v9);

  v8.receiver = self;
  v8.super_class = (Class)CLKUIHandsView;
  v4 = [(CLKUIAnalogHandsView *)&v8 hourHandConfiguration];
  double v5 = *(double *)&v9;
  double v6 = *((double *)&v10 + 1);
  [v4 setHandLength:*((double *)&v11 + 1)];
  [v4 setHandWidth:v5];
  [v4 setArmLength:*(double *)&v10];
  [v4 setArmWidth:*((double *)&v9 + 1)];
  [v4 setSmoothingRadius:0.5];
  [v4 setPegRadius:v6 * 0.5];
  [v4 setPegStrokeWidth:(v5 - v6) * 0.5];
  [v4 setRadialShadowRadius:*(double *)&v11];
  [v4 setRadialShadowOpacity:*((double *)&v15 + 1)];
  [v4 setInlayInsetRadius:v16];
  return v4;
}

- (id)minuteHandConfiguration
{
  double v16 = 0.0;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v9 = 0u;
  v3 = [(CLKUIAnalogHandsView *)self device];
  _LayoutConstants_2(v3, (uint64_t)&v9);

  v8.receiver = self;
  v8.super_class = (Class)CLKUIHandsView;
  v4 = [(CLKUIAnalogHandsView *)&v8 minuteHandConfiguration];
  double v5 = *(double *)&v9;
  double v6 = *((double *)&v10 + 1);
  [v4 setHandLength:*(double *)&v12];
  [v4 setHandWidth:v5];
  [v4 setArmLength:*(double *)&v10];
  [v4 setArmWidth:*((double *)&v9 + 1)];
  [v4 setSmoothingRadius:0.5];
  [v4 setPegRadius:v6 * 0.5];
  [v4 setPegStrokeWidth:(v5 - v6) * 0.5];
  [v4 setRadialShadowRadius:*(double *)&v11];
  [v4 setRadialShadowOpacity:*((double *)&v15 + 1)];
  [v4 setInlayInsetRadius:v16];
  return v4;
}

- (id)secondHandConfiguration
{
  uint64_t v14 = 0;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  memset(v9, 0, sizeof(v9));
  v3 = [(CLKUIAnalogHandsView *)self device];
  _LayoutConstants_2(v3, (uint64_t)v9);

  v8.receiver = self;
  v8.super_class = (Class)CLKUIHandsView;
  v4 = [(CLKUIAnalogHandsView *)&v8 secondHandConfiguration];
  long long v5 = v12;
  double v6 = *(double *)&v12 * 0.5;
  [v4 setHandLength:*(double *)&v12 * 0.5 + *((double *)&v10 + 1)];
  [v4 setHandWidth:*((double *)&v11 + 1)];
  [v4 setTailLength:v6 + *(double *)&v11];
  [v4 setPegRadius:*((double *)&v5 + 1) * 0.5];
  [v4 setPegStrokeWidth:(*(double *)&v5 - *((double *)&v5 + 1)) * 0.5];
  return v4;
}

- (void)setOverrideDate:(id)a3
{
  id v5 = a3;
  if ((CLKEqualObjects() & 1) == 0)
  {
    [(CLKUIAnalogHandsView *)self _stopTimeAnimation];
    objc_storeStrong((id *)&self->_overrideDate, a3);
    if (v5)
    {
      id v6 = v5;
    }
    else
    {
      id v6 = [(CLKUIAnalogHandsView *)self displayTime];
    }
    v7 = v6;
    objc_super v8 = [(CLKUIAnalogHandsView *)self calendar];
    CLKHourMinuteSecondAnglesForTime();

    long long v9 = [(CLKUIAnalogHandsView *)self hourHandView];
    [v9 setZRotation:0.0];

    long long v10 = [(CLKUIAnalogHandsView *)self minuteHandView];
    [v10 setZRotation:0.0];

    long long v11 = [(CLKUIAnalogHandsView *)self secondHandView];
    [v11 setZRotation:0.0];

    if (!v5) {
      [(CLKUIAnalogHandsView *)self _startNewTimeAnimation];
    }
  }
}

- (void).cxx_destruct
{
}

@end