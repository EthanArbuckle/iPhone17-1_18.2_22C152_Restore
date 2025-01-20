@interface NTKSeltzerAnalogHandsView
- (id)initForDevice:(id)a3;
- (id)secondHandConfiguration;
@end

@implementation NTKSeltzerAnalogHandsView

- (id)initForDevice:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NTKSeltzerAnalogHandsView;
  id v5 = [(NTKSeltzerAnalogHandsView *)&v8 initForDevice:v4];
  if (v5)
  {
    sub_5E40(v4);
    [v5 setMinuteHandDotDiameter:v6];
  }

  return v5;
}

- (id)secondHandConfiguration
{
  v6.receiver = self;
  v6.super_class = (Class)NTKSeltzerAnalogHandsView;
  v3 = [(NTKSeltzerAnalogHandsView *)&v6 secondHandConfiguration];
  id v4 = [(NTKSeltzerAnalogHandsView *)self device];
  [v3 setHandLength:sub_5E40(v4)];

  return v3;
}

@end