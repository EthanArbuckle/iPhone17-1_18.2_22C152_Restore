@interface NTKAlaskanChronoButton
- (void)setHighlighted:(BOOL)a3;
@end

@implementation NTKAlaskanChronoButton

- (void)setHighlighted:(BOOL)a3
{
  v18.receiver = self;
  v18.super_class = (Class)NTKAlaskanChronoButton;
  -[NTKAlaskanChronoButton setHighlighted:](&v18, "setHighlighted:");
  v5 = [(NTKAlaskanChronoButton *)self imageView];
  v6 = [v5 layer];
  v7 = [v6 animationForKey:@"NTKAlaskanChronoButtonAnimation"];

  if (a3)
  {
    if (v7)
    {
      v8 = [(NTKAlaskanChronoButton *)self imageView];
      v9 = [v8 layer];
      [v9 removeAnimationForKey:@"NTKAlaskanChronoButtonAnimation"];
    }
    v10 = +[CABasicAnimation animationWithKeyPath:@"transform.scale"];
    v11 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    [v10 setTimingFunction:v11];

    [v10 setRemovedOnCompletion:0];
    [v10 setFillMode:kCAFillModeForwards];
    [v10 setFromValue:&off_3AD58];
    [v10 setToValue:&off_3AD48];
    double v12 = 0.3;
  }
  else
  {
    if (v7)
    {
      v13 = [(NTKAlaskanChronoButton *)self imageView];
      v14 = [v13 layer];
      [v14 removeAnimationForKey:@"NTKAlaskanChronoButtonAnimation"];
    }
    v10 = +[CABasicAnimation animationWithKeyPath:@"transform.scale"];
    v15 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    [v10 setTimingFunction:v15];

    [v10 setRemovedOnCompletion:1];
    [v10 setFillMode:kCAFillModeForwards];
    [v10 setFromValue:&off_3AD48];
    [v10 setToValue:&off_3AD58];
    double v12 = 0.2;
  }
  [v10 setDuration:v12];
  v16 = [(NTKAlaskanChronoButton *)self imageView];
  v17 = [v16 layer];
  [v17 addAnimation:v10 forKey:@"NTKAlaskanChronoButtonAnimation"];
}

@end