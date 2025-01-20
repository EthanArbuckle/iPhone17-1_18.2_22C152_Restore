@interface NTKCrosswindAnalogHandsView
+ (double)outerCircleRadiusForDevice:(id)a3;
- (double)innerCircleRadius;
- (double)middleCircleRadius;
- (double)outerCircleRadius;
- (id)hourHandConfiguration;
- (id)minuteHandConfiguration;
- (void)_applyDesiredHandExtent:(double)a3 toConfiguration:(id)a4;
@end

@implementation NTKCrosswindAnalogHandsView

- (double)innerCircleRadius
{
  v2 = [(NTKCrosswindAnalogHandsView *)self device];
  double v3 = sub_6754(v2);

  return v3;
}

- (double)middleCircleRadius
{
  v2 = [(NTKCrosswindAnalogHandsView *)self device];
  sub_6754(v2);
  double v4 = v3;

  return v4;
}

- (double)outerCircleRadius
{
  double v3 = objc_opt_class();
  double v4 = [(NTKCrosswindAnalogHandsView *)self device];
  [v3 outerCircleRadiusForDevice:v4];
  double v6 = v5;

  return v6;
}

+ (double)outerCircleRadiusForDevice:(id)a3
{
  sub_6754(a3);
  return v3;
}

- (id)hourHandConfiguration
{
  v5.receiver = self;
  v5.super_class = (Class)NTKCrosswindAnalogHandsView;
  double v3 = [(NTKCrosswindAnalogHandsView *)&v5 hourHandConfiguration];
  [(NTKCrosswindAnalogHandsView *)self middleCircleRadius];
  -[NTKCrosswindAnalogHandsView _applyDesiredHandExtent:toConfiguration:](self, "_applyDesiredHandExtent:toConfiguration:", v3);
  [v3 setDropShadowOpacity:0.0];
  [v3 setRadialShadowOpacity:0.0];

  return v3;
}

- (id)minuteHandConfiguration
{
  v5.receiver = self;
  v5.super_class = (Class)NTKCrosswindAnalogHandsView;
  double v3 = [(NTKCrosswindAnalogHandsView *)&v5 minuteHandConfiguration];
  [(NTKCrosswindAnalogHandsView *)self outerCircleRadius];
  -[NTKCrosswindAnalogHandsView _applyDesiredHandExtent:toConfiguration:](self, "_applyDesiredHandExtent:toConfiguration:", v3);
  [v3 setDropShadowOpacity:0.0];
  [v3 setRadialShadowOpacity:0.0];

  return v3;
}

- (void)_applyDesiredHandExtent:(double)a3 toConfiguration:(id)a4
{
  id v12 = a4;
  [v12 handLength];
  double v6 = v5;
  [v12 armLength];
  double v8 = v6 + v7;
  [v12 pegRadius];
  double v10 = v8 + v9;
  [v12 pegStrokeWidth];
  [v12 setHandLength:v6 + a3 - (v10 + v11)];
}

@end