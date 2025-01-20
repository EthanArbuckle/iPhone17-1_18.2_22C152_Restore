@interface VOTUISonificationPlayheadView
- (BOOL)largeCursorEnabled;
- (VOTUISonificationPlayheadView)initWithFrame:(CGRect)a3;
- (double)lineWidth;
- (void)layoutSubviews;
- (void)updateStyling;
@end

@implementation VOTUISonificationPlayheadView

- (VOTUISonificationPlayheadView)initWithFrame:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)VOTUISonificationPlayheadView;
  v3 = -[VOTUISonificationPlayheadView initWithFrame:](&v14, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(VOTUISonificationPlayheadView *)v3 setClipsToBounds:1];
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x3032000000;
    v12[3] = sub_51D8;
    v12[4] = sub_51E8;
    v5 = v4;
    v13 = v5;
    v6 = +[AXSettings sharedInstance];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_51F0;
    v11[3] = &unk_3D238;
    v11[4] = v12;
    [v6 registerUpdateBlock:v11 forRetrieveSelector:"voiceOverLargeCursorEnabled" withListener:v5];

    [(VOTUISonificationPlayheadView *)v5 updateStyling];
    [(VOTUISonificationPlayheadView *)v5 setAlpha:0.8];
    v15[0] = objc_opt_class();
    v15[1] = objc_opt_class();
    v7 = +[NSArray arrayWithObjects:v15 count:2];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_5200;
    v10[3] = &unk_3D260;
    v10[4] = v12;
    id v8 = [(VOTUISonificationPlayheadView *)v5 registerForTraitChanges:v7 withHandler:v10];

    _Block_object_dispose(v12, 8);
  }
  return v4;
}

- (double)lineWidth
{
  unsigned int v2 = [(VOTUISonificationPlayheadView *)self largeCursorEnabled];
  double result = 4.0;
  if (v2) {
    return 8.0;
  }
  return result;
}

- (BOOL)largeCursorEnabled
{
  unsigned int v2 = +[AXSettings sharedInstance];
  [v2 voiceOverLargeCursorEnabled];

  return 1;
}

- (void)updateStyling
{
  v3 = [(VOTUISonificationPlayheadView *)self traitCollection];
  v4 = (char *)[v3 userInterfaceStyle];

  if (v4 == (unsigned char *)&dword_0 + 1)
  {
    v5 = +[UIColor blackColor];
    +[UIColor whiteColor];
  }
  else
  {
    v5 = +[UIColor whiteColor];
    +[UIColor blackColor];
  v6 = };
  v7 = [(VOTUISonificationPlayheadView *)self layer];
  id v8 = [v7 sublayers];
  id v9 = [v8 count];

  if ((unint64_t)v9 <= 1)
  {
    do
    {
      id v10 = objc_alloc_init((Class)CAShapeLayer);
      v11 = [(VOTUISonificationPlayheadView *)self layer];
      [v11 addSublayer:v10];

      v12 = [(VOTUISonificationPlayheadView *)self layer];
      v13 = [v12 sublayers];
      id v14 = [v13 count];
    }
    while ((unint64_t)v14 < 2);
  }
  v15 = [(VOTUISonificationPlayheadView *)self layer];
  v16 = [v15 sublayers];
  v17 = [v16 objectAtIndexedSubscript:1];

  v18 = [(VOTUISonificationPlayheadView *)self layer];
  v19 = [v18 sublayers];
  v20 = [v19 objectAtIndexedSubscript:0];

  [(VOTUISonificationPlayheadView *)self lineWidth];
  [v17 setCornerRadius:v21 * 0.5];
  id v24 = v5;
  objc_msgSend(v17, "setBackgroundColor:", objc_msgSend(v24, "CGColor"));
  [(VOTUISonificationPlayheadView *)self lineWidth];
  [v20 setCornerRadius:v22 * 0.5];
  id v23 = v6;
  objc_msgSend(v20, "setBackgroundColor:", objc_msgSend(v23, "CGColor"));
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)VOTUISonificationPlayheadView;
  [(VOTUISonificationPlayheadView *)&v11 layoutSubviews];
  v3 = [(VOTUISonificationPlayheadView *)self layer];
  v4 = [v3 sublayers];
  v5 = [v4 objectAtIndexedSubscript:1];

  v6 = [(VOTUISonificationPlayheadView *)self layer];
  v7 = [v6 sublayers];
  id v8 = [v7 objectAtIndexedSubscript:0];

  [(VOTUISonificationPlayheadView *)self lineWidth];
  CGFloat v10 = v9 * 0.25;
  +[CATransaction begin];
  +[CATransaction setValue:kCFBooleanTrue forKey:kCATransactionDisableActions];
  [(VOTUISonificationPlayheadView *)self bounds];
  CGRect v13 = CGRectInset(v12, v10, v10);
  objc_msgSend(v5, "setFrame:", v13.origin.x, v13.origin.y, v13.size.width, v13.size.height);
  [(VOTUISonificationPlayheadView *)self bounds];
  objc_msgSend(v8, "setFrame:");
  +[CATransaction commit];
}

@end