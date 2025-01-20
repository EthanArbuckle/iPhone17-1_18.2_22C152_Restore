@interface NTKSiderealAuxiliaryDialLabels
- (NSString)bottomText;
- (NSString)topText;
- (NTKSiderealAuxiliaryDialLabels)initWithFrame:(CGRect)a3 device:(id)a4;
- (id)_curvedLabel;
- (void)_layoutBottomLabel;
- (void)_layoutLabel:(id)a3 text:(id)a4 monospaced:(BOOL)a5 offset:(CGPoint)a6 useCache:(BOOL)a7;
- (void)_layoutTopLabel;
- (void)_setFontSize:(double)a3 monospaced:(BOOL)a4 offset:(CGPoint)a5 onLabel:(id)a6;
- (void)applyTransitionFraction:(double)a3;
- (void)didFinishTransition;
- (void)setBottomText:(id)a3;
- (void)setTopText:(id)a3;
- (void)setup;
- (void)traitCollectionDidChange:(id)a3;
- (void)willStartTransition;
@end

@implementation NTKSiderealAuxiliaryDialLabels

- (NTKSiderealAuxiliaryDialLabels)initWithFrame:(CGRect)a3 device:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)NTKSiderealAuxiliaryDialLabels;
  v11 = -[NTKSiderealAuxiliaryDialLabels initWithFrame:](&v16, "initWithFrame:", x, y, width, height);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_device, a4);
    uint64_t v13 = +[NSMutableDictionary dictionary];
    fontSizeCache = v12->_fontSizeCache;
    v12->_fontSizeCache = (NSMutableDictionary *)v13;

    [(NTKSiderealAuxiliaryDialLabels *)v12 setup];
  }

  return v12;
}

- (void)setup
{
  [(NTKSiderealAuxiliaryDialLabels *)self bounds];
  CLKRectGetCenter();
  [(NTKSiderealAuxiliaryDialLabels *)self bounds];
  v3 = NTKCircleSectorPath();
  id v4 = objc_alloc((Class)UIView);
  [(NTKSiderealAuxiliaryDialLabels *)self bounds];
  v5 = (UIView *)objc_msgSend(v4, "initWithFrame:");
  topLabelContainerView = self->_topLabelContainerView;
  self->_topLabelContainerView = v5;

  [(NTKSiderealAuxiliaryDialLabels *)self addSubview:self->_topLabelContainerView];
  v7 = [(NTKSiderealAuxiliaryDialLabels *)self _curvedLabel];
  topLabel = self->_topLabel;
  self->_topLabel = v7;

  [(CLKUICurvedColoringLabel *)self->_topLabel setAlpha:1.0];
  sub_E424(self->_device, (uint64_t)v43);
  [(CLKUICurvedColoringLabel *)self->_topLabel setCircleRadius:v44 * 0.5];
  [(UIView *)self->_topLabelContainerView addSubview:self->_topLabel];
  v9 = +[CAShapeLayer layer];
  topLabelMask = self->_topLabelMask;
  self->_topLabelMask = v9;

  v11 = self->_topLabelMask;
  [(NTKSiderealAuxiliaryDialLabels *)self bounds];
  -[CAShapeLayer setBounds:](v11, "setBounds:");
  v12 = self->_topLabelMask;
  id v13 = +[UIColor whiteColor];
  -[CAShapeLayer setFillColor:](v12, "setFillColor:", [v13 CGColor]);

  v14 = self->_topLabelMask;
  [(NTKSiderealAuxiliaryDialLabels *)self bounds];
  CLKRectGetCenter();
  -[CAShapeLayer setPosition:](v14, "setPosition:");
  v15 = self->_topLabelMask;
  id v16 = v3;
  -[CAShapeLayer setPath:](v15, "setPath:", [v16 CGPath]);
  [(CAShapeLayer *)self->_topLabelMask setShadowRadius:7.0];
  LODWORD(v17) = 1.0;
  [(CAShapeLayer *)self->_topLabelMask setShadowOpacity:v17];
  double height = CGSizeZero.height;
  -[CAShapeLayer setShadowOffset:](self->_topLabelMask, "setShadowOffset:", CGSizeZero.width, height);
  v19 = self->_topLabelMask;
  id v20 = +[UIColor whiteColor];
  -[CAShapeLayer setShadowColor:](v19, "setShadowColor:", [v20 CGColor]);

  v21 = [(UIView *)self->_topLabelContainerView layer];
  [v21 setMask:self->_topLabelMask];

  id v22 = objc_alloc((Class)UIView);
  [(NTKSiderealAuxiliaryDialLabels *)self bounds];
  v23 = (UIView *)objc_msgSend(v22, "initWithFrame:");
  bottomLabelContainerView = self->_bottomLabelContainerView;
  self->_bottomLabelContainerView = v23;

  [(NTKSiderealAuxiliaryDialLabels *)self addSubview:self->_bottomLabelContainerView];
  v25 = [(NTKSiderealAuxiliaryDialLabels *)self _curvedLabel];
  bottomLabel = self->_bottomLabel;
  self->_bottomLabel = v25;

  [(CLKUICurvedColoringLabel *)self->_bottomLabel setAlpha:1.0];
  sub_E424(self->_device, (uint64_t)v41);
  [(CLKUICurvedColoringLabel *)self->_bottomLabel setCircleRadius:v42 * 0.5];
  [(CLKUICurvedColoringLabel *)self->_bottomLabel setInterior:1];
  v27 = [(CLKUICurvedColoringLabel *)self->_bottomLabel font];
  v28 = [v27 CLKFontWithMonospacedNumbers];
  [(CLKUICurvedColoringLabel *)self->_bottomLabel setFont:v28];

  [(UIView *)self->_bottomLabelContainerView addSubview:self->_bottomLabel];
  v29 = +[CAShapeLayer layer];
  bottomLabelMask = self->_bottomLabelMask;
  self->_bottomLabelMask = v29;

  v31 = self->_bottomLabelMask;
  [(NTKSiderealAuxiliaryDialLabels *)self bounds];
  -[CAShapeLayer setBounds:](v31, "setBounds:");
  v32 = self->_bottomLabelMask;
  id v33 = +[UIColor whiteColor];
  -[CAShapeLayer setFillColor:](v32, "setFillColor:", [v33 CGColor]);

  v34 = self->_bottomLabelMask;
  [(NTKSiderealAuxiliaryDialLabels *)self bounds];
  CLKRectGetCenter();
  -[CAShapeLayer setPosition:](v34, "setPosition:");
  v35 = self->_bottomLabelMask;
  id v40 = v16;
  -[CAShapeLayer setPath:](v35, "setPath:", [v40 CGPath]);
  [(CAShapeLayer *)self->_bottomLabelMask setShadowRadius:7.0];
  LODWORD(v36) = 1.0;
  [(CAShapeLayer *)self->_bottomLabelMask setShadowOpacity:v36];
  -[CAShapeLayer setShadowOffset:](self->_bottomLabelMask, "setShadowOffset:", CGSizeZero.width, height);
  v37 = self->_bottomLabelMask;
  id v38 = +[UIColor whiteColor];
  -[CAShapeLayer setShadowColor:](v37, "setShadowColor:", [v38 CGColor]);

  v39 = [(UIView *)self->_bottomLabelContainerView layer];
  [v39 setMask:self->_bottomLabelMask];

  [(NTKSiderealAuxiliaryDialLabels *)self applyTransitionFraction:0.0];
}

- (void)setTopText:(id)a3
{
  id v5 = a3;
  if (!-[NSString isEqualToString:](self->_topText, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_topText, a3);
    [(NTKSiderealAuxiliaryDialLabels *)self _layoutTopLabel];
  }
}

- (void)setBottomText:(id)a3
{
  id v5 = a3;
  if (!-[NSString isEqualToString:](self->_bottomText, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_bottomText, a3);
    [(NTKSiderealAuxiliaryDialLabels *)self _layoutBottomLabel];
  }
}

- (void)_layoutTopLabel
{
  topLabel = self->_topLabel;
  topText = self->_topText;
  sub_E424(self->_device, (uint64_t)v7);
  double v5 = v8;
  double v6 = v9;

  -[NTKSiderealAuxiliaryDialLabels _layoutLabel:text:monospaced:offset:useCache:](self, "_layoutLabel:text:monospaced:offset:useCache:", topLabel, topText, 0, 1, v5, v6);
}

- (void)_layoutBottomLabel
{
}

- (void)_layoutLabel:(id)a3 text:(id)a4 monospaced:(BOOL)a5 offset:(CGPoint)a6 useCache:(BOOL)a7
{
  BOOL v7 = a7;
  double y = a6.y;
  double x = a6.x;
  BOOL v10 = a5;
  id v26 = a3;
  id v13 = a4;
  v14 = +[CLKSimpleTextProvider textProviderWithText:v13];
  [v26 setTextProvider:v14];

  v15 = [(NSMutableDictionary *)self->_fontSizeCache objectForKey:v13];
  id v16 = v15;
  if (v7 && v15)
  {
    [v15 floatValue];
    -[NTKSiderealAuxiliaryDialLabels _setFontSize:monospaced:offset:onLabel:](self, "_setFontSize:monospaced:offset:onLabel:", v10, v26, v17, x, y);
  }
  else
  {
    sub_E424(self->_device, (uint64_t)v29);
    double v18 = v30;
    sub_E424(self->_device, (uint64_t)v27);
    double v19 = v28;
    -[NTKSiderealAuxiliaryDialLabels _setFontSize:monospaced:offset:onLabel:](self, "_setFontSize:monospaced:offset:onLabel:", v10, v26, v18, x, y);
    if ([v26 isTextTruncated])
    {
      id v20 = v26;
      while (v18 - v19 > 1.0)
      {
        double v21 = (v18 + v19) * 0.5;
        -[NTKSiderealAuxiliaryDialLabels _setFontSize:monospaced:offset:onLabel:](self, "_setFontSize:monospaced:offset:onLabel:", v10, v26, v21, x, y);
        unsigned int v22 = [v26 isTextTruncated];
        id v20 = v26;
        if (v22) {
          double v18 = (v18 + v19) * 0.5;
        }
        else {
          double v19 = v21;
        }
      }
      float v23 = v19;
      -[NTKSiderealAuxiliaryDialLabels _setFontSize:monospaced:offset:onLabel:](self, "_setFontSize:monospaced:offset:onLabel:", v10, v20, ceilf(v23), x, y);
      if ([v26 isTextTruncated]) {
        -[NTKSiderealAuxiliaryDialLabels _setFontSize:monospaced:offset:onLabel:](self, "_setFontSize:monospaced:offset:onLabel:", v10, v26, floorf(v23), x, y);
      }
    }
    else
    {
      double v19 = v18;
    }
    if (v7)
    {
      fontSizeCache = self->_fontSizeCache;
      v25 = +[NSNumber numberWithDouble:v19];
      [(NSMutableDictionary *)fontSizeCache setValue:v25 forKey:v13];
    }
  }
}

- (void)_setFontSize:(double)a3 monospaced:(BOOL)a4 offset:(CGPoint)a5 onLabel:(id)a6
{
  double y = a5.y;
  double x = a5.x;
  BOOL v8 = a4;
  uint64_t v11 = CLKRoundedFontDesignName;
  id v12 = a6;
  id v13 = +[CLKFont systemFontOfSize:v11 weight:a3 design:UIFontWeightRegular];
  v14 = [v13 CLKFontWithAlternativePunctuation];

  if (v8)
  {
    uint64_t v15 = [v14 CLKFontWithMonospacedNumbers];

    v14 = (void *)v15;
  }
  [v12 setFont:v14];
  [v12 sizeToFit];
  double v20 = 0.0;
  double v21 = 0.0;
  [v12 getTextCenter:&v20 startAngle:0 endAngle:0];
  [(NTKSiderealAuxiliaryDialLabels *)self bounds];
  CLKRectGetCenter();
  double v17 = x + v16 - v20;
  double v19 = y + v18 - v21;
  [v12 frame];
  objc_msgSend(v12, "setFrame:", v17, v19);
}

- (void)willStartTransition
{
  v3 = [(UIView *)self->_topLabelContainerView layer];
  [v3 setMask:self->_topLabelMask];

  id v4 = [(UIView *)self->_bottomLabelContainerView layer];
  [v4 setMask:self->_bottomLabelMask];
}

- (void)applyTransitionFraction:(double)a3
{
  CLKInterpolateBetweenFloatsUnclipped();
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  topLabelMask = self->_topLabelMask;
  CLKDegreesToRadians();
  CATransform3DMakeRotation(&v9, v5, 0.0, 0.0, 1.0);
  [(CAShapeLayer *)topLabelMask setTransform:&v9];
  bottomLabelMask = self->_bottomLabelMask;
  CLKDegreesToRadians();
  CATransform3DMakeRotation(&v8, v7, 0.0, 0.0, 1.0);
  [(CAShapeLayer *)bottomLabelMask setTransform:&v8];
  +[CATransaction commit];
}

- (void)didFinishTransition
{
  v3 = [(UIView *)self->_topLabelContainerView layer];
  [v3 setMask:0];

  id v4 = [(UIView *)self->_bottomLabelContainerView layer];
  [v4 setMask:0];
}

- (id)_curvedLabel
{
  v2 = objc_opt_new();
  v3 = +[CLKFont systemFontOfSize:CLKRoundedFontDesignName weight:16.0 design:UIFontWeightRegular];
  id v4 = [v3 CLKFontWithAlternativePunctuation];

  [v2 setFont:v4];
  CGFloat v5 = +[UIColor whiteColor];
  [v2 setColor:v5];

  [v2 setUsesLegibility:0];
  [v2 setUppercase:1];
  [v2 setInterior:0];
  [v2 setCenterAngle:0.0];
  CLKDegreesToRadians();
  objc_msgSend(v2, "setMaxAngularWidth:");
  [v2 setTracking:100.0];

  return v2;
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NTKSiderealAuxiliaryDialLabels;
  id v4 = a3;
  [(NTKSiderealAuxiliaryDialLabels *)&v8 traitCollectionDidChange:v4];
  CGFloat v5 = [(NTKSiderealAuxiliaryDialLabels *)self traitCollection];
  id v6 = [v5 legibilityWeight];
  id v7 = [v4 legibilityWeight];

  if (v6 != v7)
  {
    [(NSMutableDictionary *)self->_fontSizeCache removeAllObjects];
    [(NTKSiderealAuxiliaryDialLabels *)self setNeedsLayout];
    [(NTKSiderealAuxiliaryDialLabels *)self _layoutTopLabel];
    [(NTKSiderealAuxiliaryDialLabels *)self _layoutBottomLabel];
  }
}

- (NSString)topText
{
  return self->_topText;
}

- (NSString)bottomText
{
  return self->_bottomText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomText, 0);
  objc_storeStrong((id *)&self->_topText, 0);
  objc_storeStrong((id *)&self->_fontSizeCache, 0);
  objc_storeStrong((id *)&self->_bottomLabel, 0);
  objc_storeStrong((id *)&self->_bottomLabelMask, 0);
  objc_storeStrong((id *)&self->_bottomLabelContainerView, 0);
  objc_storeStrong((id *)&self->_topLabel, 0);
  objc_storeStrong((id *)&self->_topLabelMask, 0);
  objc_storeStrong((id *)&self->_topLabelContainerView, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end