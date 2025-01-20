@interface SCATAxisLayer
+ (double)lineLayerMaxWidth;
+ (double)rangeLayerBorderWidth;
+ (double)rangeLayerMaxWidth;
- (BOOL)isAnimatingForwards;
- (CALayer)compositingLayer;
- (CALayer)foregroundLayer;
- (SCATAxisLayer)initWithAxis:(int)a3;
- (id)description;
- (int)axis;
- (int)theme;
- (void)setAxis:(int)a3;
- (void)setBackgroundColor:(CGColor *)a3;
- (void)setCompositingLayer:(id)a3;
- (void)setForegroundLayer:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setTheme:(int)a3;
- (void)updateLayerTreePosition:(CGPoint)a3;
@end

@implementation SCATAxisLayer

+ (double)rangeLayerMaxWidth
{
  return 100.0;
}

+ (double)rangeLayerBorderWidth
{
  v2 = +[AXSettings sharedInstance];
  if ([v2 assistiveTouchScannerCursorHighVisibilityEnabled]) {
    double v3 = 4.0;
  }
  else {
    double v3 = 2.0;
  }

  return v3;
}

+ (double)lineLayerMaxWidth
{
  return 3.0;
}

- (SCATAxisLayer)initWithAxis:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v9.receiver = self;
  v9.super_class = (Class)SCATAxisLayer;
  v4 = [(SCATAxisLayer *)&v9 init];
  v5 = v4;
  if (v4)
  {
    [(SCATAxisLayer *)v4 setAxis:v3];
    v6 = +[CALayer layer];
    [(SCATAxisLayer *)v5 addSublayer:v6];
    [(SCATAxisLayer *)v5 setForegroundLayer:v6];
    v7 = +[CALayer layer];
    [(SCATAxisLayer *)v5 setCompositingLayer:v7];
    [(SCATAxisLayer *)v5 addSublayer:v7];
  }
  return v5;
}

- (id)description
{
  uint64_t v3 = (objc_class *)objc_opt_class();
  v21 = NSStringFromClass(v3);
  v19 = +[NSNumber numberWithUnsignedInt:[(SCATAxisLayer *)self axis]];
  v17 = +[NSNumber numberWithUnsignedInt:[(SCATAxisLayer *)self theme]];
  [(SCATAxisLayer *)self position];
  v15 = NSStringFromCGPoint(v24);
  v20 = [(SCATAxisLayer *)self presentationLayer];
  [v20 position];
  v13 = NSStringFromCGPoint(v25);
  v18 = [(SCATAxisLayer *)self animationKeys];
  v16 = [v18 description];
  v14 = [v16 stringByReplacingOccurrencesOfString:@"\n" withString:@" "];
  id v4 = [(SCATAxisLayer *)self backgroundColor];
  id v5 = [(SCATAxisLayer *)self borderColor];
  v6 = [(SCATAxisLayer *)self foregroundLayer];
  v7 = [(SCATAxisLayer *)self foregroundLayer];
  [v7 frame];
  v8 = NSStringFromCGRect(v26);
  objc_super v9 = [(SCATAxisLayer *)self foregroundLayer];
  id v10 = [v9 backgroundColor];
  v11 = [(SCATAxisLayer *)self foregroundLayer];
  v22 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@<%p>. axis:%@ theme:%@ position:%@ presentationPosition:%@ animations:%@ bgColor:%@ borderColor:%@ (fg-layer:%p frame:%@ bgColor:%@ borderColor:%@)", v21, self, v19, v17, v15, v13, v14, v4, v5, v6, v8, v10, [v11 borderColor]);

  return v22;
}

- (void)updateLayerTreePosition:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  -[SCATAxisLayer setPosition:](self, "setPosition:", x, y);

  +[CATransaction commit];
}

- (BOOL)isAnimatingForwards
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v3 = [(SCATAxisLayer *)self animationKeys];
  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
    unsigned __int8 v7 = 1;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_super v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 rangeOfString:@"SCATRangeAnimationID"] != (id)0x7FFFFFFFFFFFFFFFLL
          || [v9 rangeOfString:@"SCATLineAnimationID"] != (id)0x7FFFFFFFFFFFFFFFLL)
        {
          id v10 = [(SCATAxisLayer *)self animationForKey:v9];
          unsigned __int8 v7 = [v10 forwardDirection];
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  else
  {
    unsigned __int8 v7 = 1;
  }

  return v7 & 1;
}

- (void)setBackgroundColor:(CGColor *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SCATAxisLayer;
  -[SCATAxisLayer setBackgroundColor:](&v6, "setBackgroundColor:");
  id v5 = [(SCATAxisLayer *)self compositingLayer];
  [v5 setBackgroundColor:a3];
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  v8.receiver = self;
  v8.super_class = (Class)SCATAxisLayer;
  -[SCATAxisLayer setFrame:](&v8, "setFrame:", a3.origin.x, a3.origin.y);
  double y = CGPointZero.y;
  unsigned __int8 v7 = [(SCATAxisLayer *)self compositingLayer];
  objc_msgSend(v7, "setFrame:", CGPointZero.x, y, width, height);
}

- (int)axis
{
  return self->_axis;
}

- (void)setAxis:(int)a3
{
  self->_axis = a3;
}

- (int)theme
{
  return self->_theme;
}

- (void)setTheme:(int)a3
{
  self->_theme = a3;
}

- (CALayer)foregroundLayer
{
  return self->_foregroundLayer;
}

- (void)setForegroundLayer:(id)a3
{
}

- (CALayer)compositingLayer
{
  return self->_compositingLayer;
}

- (void)setCompositingLayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compositingLayer, 0);

  objc_storeStrong((id *)&self->_foregroundLayer, 0);
}

@end