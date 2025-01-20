@interface ARUICountdownPreAnimation
+ (id)identifier;
- (BOOL)cancelable;
- (double)delay;
- (double)duration;
- (id)identifier;
- (void)applyToCountdownView:(id)a3 completion:(id)a4;
@end

@implementation ARUICountdownPreAnimation

- (double)delay
{
  return 0.0;
}

- (double)duration
{
  return 0.0;
}

- (BOOL)cancelable
{
  return 1;
}

+ (id)identifier
{
  return @"Pre Animation";
}

- (id)identifier
{
  v2 = objc_opt_class();

  return (id)[v2 identifier];
}

- (void)applyToCountdownView:(id)a3 completion:(id)a4
{
  v14 = (void (**)(void))a4;
  id v5 = a3;
  v6 = [v5 ringGroup];
  [v6 setEmptyOpacity:0.0];
  [v6 setPercentage:0 ofRingAtIndex:0.0];
  [v6 setTrackOpacity:0.0];
  LODWORD(v7) = 1.0;
  [v6 setOpacity:v7];
  v8 = [v5 backingTrackRingGroup];

  if (v8)
  {
    [v6 setZRotation:0.0];
    [v6 groupDiameter];
    double v11 = v10 * 0.5 + -3.0;
    *(float *)&double v11 = v11;
    [v8 setThickness:v11];
    LODWORD(v12) = 1.0;
    [v8 setOpacity:v12];
    LODWORD(v13) = 1058306785;
    [v8 setEmptyOpacity:v13];
    [v8 setTrackOpacity:0.0];
  }
  else
  {
    LODWORD(v9) = 1078530011;
    [v6 setZRotation:v9];
  }
  if (v14) {
    v14[2]();
  }
}

@end