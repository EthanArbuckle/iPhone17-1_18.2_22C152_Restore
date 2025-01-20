@interface _SFDownloadsIconView
- (BOOL)suppressesPixelAlignment;
- (CGSize)intrinsicContentSize;
- (UIImage)arrowImage;
- (UIImage)circleImage;
- (_SFDownloadsIconView)initWithFrame:(CGRect)a3;
- (double)iconScale;
- (id)_makeSpringAnimationWithDelay:(double)a3 offset:(double)a4;
- (void)_finishedPulsing;
- (void)_setPulsing:(BOOL)a3;
- (void)_setUp;
- (void)_updateSuppressesPixelAlignment;
- (void)layoutSubviews;
- (void)pulse;
- (void)setArrowImage:(id)a3;
- (void)setCircleImage:(id)a3;
- (void)setIconScale:(double)a3;
- (void)setSuppressesPixelAlignment:(BOOL)a3;
@end

@implementation _SFDownloadsIconView

- (_SFDownloadsIconView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_SFDownloadsIconView;
  v3 = -[_SFDownloadsIconView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(_SFDownloadsIconView *)v3 _setUp];
    v5 = v4;
  }

  return v4;
}

- (void)_setUp
{
  self->_iconScale = 1.0;
  v3 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  circleContainerView = self->_circleContainerView;
  self->_circleContainerView = v3;

  [(_SFDownloadsIconView *)self addSubview:self->_circleContainerView];
  v5 = (UIImageView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:0];
  circleImageView = self->_circleImageView;
  self->_circleImageView = v5;

  [(UIImageView *)self->_circleImageView setContentMode:4];
  [(UIView *)self->_circleContainerView addSubview:self->_circleImageView];
  objc_super v7 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  arrowContainerView = self->_arrowContainerView;
  self->_arrowContainerView = v7;

  [(_SFDownloadsIconView *)self addSubview:self->_arrowContainerView];
  v9 = (UIImageView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:0];
  arrowImageView = self->_arrowImageView;
  self->_arrowImageView = v9;

  [(UIImageView *)self->_arrowImageView setContentMode:4];
  v11 = self->_arrowContainerView;
  v12 = self->_arrowImageView;

  [(UIView *)v11 addSubview:v12];
}

- (void)layoutSubviews
{
  v20.receiver = self;
  v20.super_class = (Class)_SFDownloadsIconView;
  [(_SFDownloadsIconView *)&v20 layoutSubviews];
  v3 = [(UIImageView *)self->_circleImageView image];
  double v4 = *MEMORY[0x1E4F1DB30];
  double v5 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  -[UIImageView sizeThatFits:](self->_circleImageView, "sizeThatFits:", *MEMORY[0x1E4F1DB30], v5);
  double v7 = v6;
  double v9 = v8;
  -[UIView setFrame:](self->_circleContainerView, "setFrame:", 0.0, 0.0, v6, v8);
  -[UIImageView setFrame:](self->_circleImageView, "setFrame:", 0.0, 0.0, v7, v9);
  v10 = [(UIImageView *)self->_arrowImageView image];
  -[UIImageView sizeThatFits:](self->_arrowImageView, "sizeThatFits:", v4, v5);
  double v12 = v11;
  double v14 = v13;
  _SFRoundFloatToPixels();
  double v16 = v15;
  [v3 baselineOffsetFromBottom];
  double v18 = v9 - v17;
  [v10 baselineOffsetFromBottom];
  -[UIView setFrame:](self->_arrowContainerView, "setFrame:", v16, v18 + v19 - v14, v12, v14);
  -[UIImageView setFrame:](self->_arrowImageView, "setFrame:", 0.0, 0.0, v12, v14);
}

- (CGSize)intrinsicContentSize
{
  -[UIImageView sizeThatFits:](self->_circleImageView, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)pulse
{
  if (!self->_pulsing)
  {
    objc_initWeak(&location, self);
    [(_SFDownloadsIconView *)self _setPulsing:1];
    [MEMORY[0x1E4F39CF8] begin];
    double v3 = (void *)MEMORY[0x1E4F39CF8];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    double v14 = __29___SFDownloadsIconView_pulse__block_invoke;
    double v15 = &unk_1E5C725B8;
    objc_copyWeak(&v16, &location);
    [v3 setCompletionBlock:&v12];
    double v4 = [(UIView *)self->_circleContainerView layer];
    double v5 = [(_SFDownloadsIconView *)self _makeSpringAnimationWithDelay:0.135 offset:3.0];
    [v4 addAnimation:v5 forKey:@"pulse"];

    double v6 = [(UIImageView *)self->_circleImageView layer];
    double v7 = [(_SFDownloadsIconView *)self _makeSpringAnimationWithDelay:0.345 offset:-3.0];
    [v6 addAnimation:v7 forKey:@"pulse"];

    double v8 = [(UIView *)self->_arrowContainerView layer];
    double v9 = [(_SFDownloadsIconView *)self _makeSpringAnimationWithDelay:0.0 offset:5.0];
    [v8 addAnimation:v9 forKey:@"pulse"];

    v10 = [(UIImageView *)self->_arrowImageView layer];
    double v11 = [(_SFDownloadsIconView *)self _makeSpringAnimationWithDelay:0.215 offset:-5.0];
    [v10 addAnimation:v11 forKey:@"pulse"];

    [MEMORY[0x1E4F39CF8] commit];
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

- (void)_finishedPulsing
{
  [(_SFDownloadsIconView *)self _setPulsing:0];
  double v3 = [(UIView *)self->_circleContainerView layer];
  [v3 removeAnimationForKey:@"pulse"];

  double v4 = [(UIImageView *)self->_circleImageView layer];
  [v4 removeAnimationForKey:@"pulse"];

  double v5 = [(UIView *)self->_arrowContainerView layer];
  [v5 removeAnimationForKey:@"pulse"];

  id v6 = [(UIImageView *)self->_arrowImageView layer];
  [v6 removeAnimationForKey:@"pulse"];
}

- (id)_makeSpringAnimationWithDelay:(double)a3 offset:(double)a4
{
  double v5 = [MEMORY[0x1E4F39C90] animation];
  [v5 setKeyPath:@"position.y"];
  [v5 setFromValue:&unk_1EFBDECE0];
  id v6 = NSNumber;
  _SFRoundFloatToPixels();
  double v7 = objc_msgSend(v6, "numberWithDouble:");
  [v5 setToValue:v7];

  [v5 setAdditive:1];
  [v5 setMass:2.0];
  [v5 setStiffness:350.0];
  [v5 setDamping:25.0];
  [v5 setDuration:0.8];
  [v5 setBeginTime:CACurrentMediaTime() + a3];
  [v5 setFillMode:*MEMORY[0x1E4F39FA0]];
  [v5 setRemovedOnCompletion:0];

  return v5;
}

- (UIImage)arrowImage
{
  return [(UIImageView *)self->_arrowImageView image];
}

- (void)setArrowImage:(id)a3
{
}

- (UIImage)circleImage
{
  return [(UIImageView *)self->_circleImageView image];
}

- (void)setCircleImage:(id)a3
{
  [(UIImageView *)self->_circleImageView setImage:a3];

  [(_SFDownloadsIconView *)self setNeedsLayout];
}

- (BOOL)suppressesPixelAlignment
{
  return self->_suppressesPixelAlignment;
}

- (void)setSuppressesPixelAlignment:(BOOL)a3
{
  self->_suppressesPixelAlignment = a3;
  [(_SFDownloadsIconView *)self _updateSuppressesPixelAlignment];
}

- (void)_updateSuppressesPixelAlignment
{
  BOOL v3 = self->_suppressesPixelAlignment || self->_pulsing;
  double v4 = [(UIImageView *)self->_circleImageView layer];
  [v4 setContentsAlignsToPixels:v3 ^ 1];

  double v5 = [(UIImageView *)self->_circleImageView layer];
  [v5 setAllowsEdgeAntialiasing:v3];

  id v6 = [(UIImageView *)self->_arrowImageView layer];
  [v6 setContentsAlignsToPixels:v3 ^ 1];

  id v7 = [(UIImageView *)self->_arrowImageView layer];
  [v7 setAllowsEdgeAntialiasing:v3];
}

- (void)_setPulsing:(BOOL)a3
{
  self->_pulsing = a3;
  [(_SFDownloadsIconView *)self _updateSuppressesPixelAlignment];
}

- (double)iconScale
{
  return self->_iconScale;
}

- (void)setIconScale:(double)a3
{
  self->_iconScale = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arrowImageView, 0);
  objc_storeStrong((id *)&self->_arrowContainerView, 0);
  objc_storeStrong((id *)&self->_circleImageView, 0);

  objc_storeStrong((id *)&self->_circleContainerView, 0);
}

@end