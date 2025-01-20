@interface SCATXYAxisLineLayer
- (BOOL)isActive;
- (id)_backgroundColorForTheme:(int)a3;
- (id)_foregroundColorForTheme:(int)a3;
- (void)updateTheme:(int)a3 animated:(BOOL)a4;
@end

@implementation SCATXYAxisLineLayer

- (void)updateTheme:(int)a3 animated:(BOOL)a4
{
  uint64_t v5 = *(void *)&a3;
  v17.receiver = self;
  v17.super_class = (Class)SCATXYAxisLineLayer;
  -[SCATAxisLayer updateTheme:animated:](&v17, "updateTheme:animated:");
  if (!a4)
  {
    +[CATransaction begin];
    +[CATransaction setDisableActions:1];
  }
  id v7 = [(SCATXYAxisLineLayer *)self _foregroundColorForTheme:v5];
  -[SCATAxisLayer setBackgroundColor:](self, "setBackgroundColor:", [v7 CGColor]);

  v8 = +[CAFilter filterWithType:kCAFilterPlusL];
  [(SCATXYAxisLineLayer *)self setCompositingFilter:v8];

  id v9 = [(SCATXYAxisLineLayer *)self _backgroundColorForTheme:v5];
  id v10 = [v9 CGColor];
  v11 = [(SCATAxisLayer *)self foregroundLayer];
  [v11 setBackgroundColor:v10];

  v12 = [(SCATAxisLayer *)self foregroundLayer];
  uint64_t v13 = kCAFilterPlusD;
  v14 = +[CAFilter filterWithType:kCAFilterPlusD];
  [v12 setCompositingFilter:v14];

  v15 = [(SCATAxisLayer *)self compositingLayer];
  v16 = +[CAFilter filterWithType:v13];
  [v15 setCompositingFilter:v16];

  if (!a4) {
    +[CATransaction commit];
  }
}

- (id)_backgroundColorForTheme:(int)a3
{
  if (a3)
  {
    v3 = +[AXSettings sharedInstance];
    [v3 assistiveTouchCursorColor];

    +[UIColor colorWithCGColor:AXSAssistiveTouchCursorColor()];
  }
  else
  {
    +[UIColor clearColor];
  v4 = };

  return v4;
}

- (id)_foregroundColorForTheme:(int)a3
{
  if (a3)
  {
    v3 = +[AXSettings sharedInstance];
    [v3 assistiveTouchCursorColor];

    +[UIColor colorWithCGColor:AXSAssistiveTouchCursorColor()];
  }
  else
  {
    +[UIColor clearColor];
  v4 = };

  return v4;
}

- (BOOL)isActive
{
  return ([(SCATAxisLayer *)self theme] & 0xFFFFFFFD) != 0;
}

@end