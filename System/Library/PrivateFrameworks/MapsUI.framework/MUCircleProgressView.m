@interface MUCircleProgressView
- (BOOL)isIndeterminate;
- (CGSize)intrinsicContentSize;
- (MUCircleProgressView)initWithFrame:(CGRect)a3;
- (UIImage)image;
- (double)progress;
- (id)primaryAction;
- (void)_handleTap:(id)a3;
- (void)_startIndeterminateAnimation;
- (void)_updateBorderWidthForUpdatedDisplayScale;
- (void)_updateStrokeColorForUpdatedUserInterfaceStyle;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setImage:(id)a3;
- (void)setIndeterminate:(BOOL)a3;
- (void)setPrimaryAction:(id)a3;
- (void)setProgress:(double)a3;
- (void)setProgress:(double)a3 animated:(BOOL)a4;
- (void)tintColorDidChange;
@end

@implementation MUCircleProgressView

- (MUCircleProgressView)initWithFrame:(CGRect)a3
{
  double y = a3.origin.y;
  double x = a3.origin.x;
  v52[1] = *MEMORY[0x1E4F143B8];
  [(MUCircleProgressView *)self intrinsicContentSize];
  double v7 = v6;
  [(MUCircleProgressView *)self intrinsicContentSize];
  v50.receiver = self;
  v50.super_class = (Class)MUCircleProgressView;
  v9 = -[MUCircleProgressView initWithFrame:](&v50, sel_initWithFrame_, x, y, v7, v8);
  v10 = v9;
  if (v9)
  {
    v11 = [(MUCircleProgressView *)v9 traitCollection];
    [v11 displayScale];
    double v13 = v12;

    if (v13 >= 1.0) {
      double v14 = 1.0 / v13 + 2.0;
    }
    else {
      double v14 = 3.0;
    }
    uint64_t v15 = [MEMORY[0x1E4F39C88] layer];
    borderLayer = v10->_borderLayer;
    v10->_borderLayer = (CAShapeLayer *)v15;

    [(MUCircleProgressView *)v10 bounds];
    -[CAShapeLayer setFrame:](v10->_borderLayer, "setFrame:");
    id v17 = [MEMORY[0x1E4FB1618] clearColor];
    -[CAShapeLayer setFillColor:](v10->_borderLayer, "setFillColor:", [v17 CGColor]);

    id v18 = [MEMORY[0x1E4FB1618] systemFillColor];
    -[CAShapeLayer setStrokeColor:](v10->_borderLayer, "setStrokeColor:", [v18 CGColor]);

    [(CAShapeLayer *)v10->_borderLayer setLineWidth:v14];
    v19 = [(MUCircleProgressView *)v10 layer];
    [v19 addSublayer:v10->_borderLayer];

    uint64_t v20 = [MEMORY[0x1E4F39C88] layer];
    progressLayer = v10->_progressLayer;
    v10->_progressLayer = (CAShapeLayer *)v20;

    [(MUCircleProgressView *)v10 bounds];
    -[CAShapeLayer setFrame:](v10->_progressLayer, "setFrame:");
    id v22 = [MEMORY[0x1E4FB1618] clearColor];
    -[CAShapeLayer setFillColor:](v10->_progressLayer, "setFillColor:", [v22 CGColor]);

    id v23 = [(MUCircleProgressView *)v10 tintColor];
    -[CAShapeLayer setStrokeColor:](v10->_progressLayer, "setStrokeColor:", [v23 CGColor]);

    [(CAShapeLayer *)v10->_progressLayer setLineWidth:v14];
    uint64_t v24 = *MEMORY[0x1E4F3A458];
    [(CAShapeLayer *)v10->_progressLayer setLineCap:*MEMORY[0x1E4F3A458]];
    CATransform3DMakeRotation(&v49, -1.57079633, 0.0, 0.0, 1.0);
    v25 = v10->_progressLayer;
    CATransform3D v48 = v49;
    [(CAShapeLayer *)v25 setTransform:&v48];
    [(CAShapeLayer *)v10->_progressLayer setStrokeStart:0.0];
    [(CAShapeLayer *)v10->_progressLayer setStrokeEnd:0.0];
    v26 = [(MUCircleProgressView *)v10 layer];
    [v26 addSublayer:v10->_progressLayer];

    v27 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    imageView = v10->_imageView;
    v10->_imageView = v27;

    [(UIImageView *)v10->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(MUCircleProgressView *)v10 addSubview:v10->_imageView];
    v29 = [(UIImageView *)v10->_imageView centerXAnchor];
    v30 = [(MUCircleProgressView *)v10 centerXAnchor];
    v31 = [v29 constraintEqualToAnchor:v30];
    [v31 setActive:1];

    v32 = [(UIImageView *)v10->_imageView centerYAnchor];
    v33 = [(MUCircleProgressView *)v10 centerYAnchor];
    v34 = [v32 constraintEqualToAnchor:v33];
    [v34 setActive:1];

    uint64_t v35 = [MEMORY[0x1E4F39C88] layer];
    indeterminateLayer = v10->_indeterminateLayer;
    v10->_indeterminateLayer = (CAShapeLayer *)v35;

    [(MUCircleProgressView *)v10 bounds];
    -[CAShapeLayer setFrame:](v10->_indeterminateLayer, "setFrame:");
    id v37 = [MEMORY[0x1E4FB1618] clearColor];
    -[CAShapeLayer setFillColor:](v10->_indeterminateLayer, "setFillColor:", [v37 CGColor]);

    id v38 = [(MUCircleProgressView *)v10 tintColor];
    -[CAShapeLayer setStrokeColor:](v10->_indeterminateLayer, "setStrokeColor:", [v38 CGColor]);

    [(CAShapeLayer *)v10->_indeterminateLayer setLineWidth:v14];
    [(CAShapeLayer *)v10->_indeterminateLayer setLineCap:v24];
    [(CAShapeLayer *)v10->_indeterminateLayer setStrokeStart:0.166666672];
    [(CAShapeLayer *)v10->_indeterminateLayer setStrokeEnd:1.0];
    [(CAShapeLayer *)v10->_indeterminateLayer setHidden:1];
    v39 = [(MUCircleProgressView *)v10 layer];
    [v39 addSublayer:v10->_indeterminateLayer];

    v40 = self;
    v52[0] = v40;
    v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:1];
    id v42 = (id)[(MUCircleProgressView *)v10 registerForTraitChanges:v41 withAction:sel__updateBorderWidthForUpdatedDisplayScale];

    v43 = self;
    v51 = v43;
    v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v51 count:1];
    id v45 = (id)[(MUCircleProgressView *)v10 registerForTraitChanges:v44 withAction:sel__updateStrokeColorForUpdatedUserInterfaceStyle];

    v46 = v10;
  }

  return v10;
}

- (void)setProgress:(double)a3
{
}

- (void)setProgress:(double)a3 animated:(BOOL)a4
{
  double progress = self->_progress;
  if (progress != a3)
  {
    if (a3 > 1.0) {
      a3 = 1.0;
    }
    double v6 = fmax(a3, 0.0);
    self->_double progress = v6;
    if (a4)
    {
      double v7 = vabdd_f64(progress, v6);
      id v12 = [MEMORY[0x1E4F39B48] animationWithKeyPath:@"strokeEnd"];
      [v12 setDuration:v7 * 0.6];
      [v12 setFillMode:*MEMORY[0x1E4F39FA8]];
      [v12 setRemovedOnCompletion:0];
      double v8 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A488]];
      [v12 setTimingFunction:v8];

      v9 = [NSNumber numberWithDouble:self->_progress];
      [v12 setToValue:v9];

      [(CAShapeLayer *)self->_progressLayer addAnimation:v12 forKey:0];
    }
    else
    {
      [(CAShapeLayer *)self->_progressLayer removeAllAnimations];
      progressLayer = self->_progressLayer;
      double v11 = self->_progress;
      [(CAShapeLayer *)progressLayer setStrokeEnd:v11];
    }
  }
}

- (void)setPrimaryAction:(id)a3
{
  id v4 = a3;
  if (self->_primaryAction != v4)
  {
    id v11 = v4;
    v5 = (void *)[v4 copy];
    id primaryAction = self->_primaryAction;
    self->_id primaryAction = v5;

    tapRecognizer = self->_tapRecognizer;
    if (self->_primaryAction)
    {
      if (!tapRecognizer)
      {
        double v8 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__handleTap_];
        v9 = self->_tapRecognizer;
        self->_tapRecognizer = v8;

        [(MUCircleProgressView *)self addGestureRecognizer:self->_tapRecognizer];
        tapRecognizer = self->_tapRecognizer;
      }
      uint64_t v10 = 1;
    }
    else
    {
      uint64_t v10 = 0;
    }
    [(UITapGestureRecognizer *)tapRecognizer setEnabled:v10];
    id v4 = v11;
  }
}

- (void)_handleTap:(id)a3
{
  id primaryAction = (void (**)(void))self->_primaryAction;
  if (primaryAction) {
    primaryAction[2]();
  }
}

- (UIImage)image
{
  return [(UIImageView *)self->_imageView image];
}

- (void)setImage:(id)a3
{
}

- (void)setIndeterminate:(BOOL)a3
{
  if (self->_indeterminate != a3)
  {
    BOOL v3 = a3;
    self->_indeterminate = a3;
    -[CAShapeLayer setHidden:](self->_borderLayer, "setHidden:");
    [(CAShapeLayer *)self->_progressLayer setHidden:v3];
    [(UIImageView *)self->_imageView setHidden:v3];
    uint64_t v5 = v3 ^ 1;
    [(CAShapeLayer *)self->_indeterminateLayer setHidden:v5];
    if (v5)
    {
      indeterminateLayer = self->_indeterminateLayer;
      [(CAShapeLayer *)indeterminateLayer removeAllAnimations];
    }
    else
    {
      [(MUCircleProgressView *)self _startIndeterminateAnimation];
    }
  }
}

- (void)_startIndeterminateAnimation
{
  BOOL v3 = [(MUCircleProgressView *)self window];

  if (v3)
  {
    id v6 = [MEMORY[0x1E4F39BD8] animationWithKeyPath:@"transform.rotation.z"];
    [v6 setValues:&unk_1EE405108];
    [v6 setDuration:1.0];
    id v4 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A4A0]];
    [v6 setTimingFunction:v4];

    LODWORD(v5) = 2139095040;
    [v6 setRepeatCount:v5];
    [(CAShapeLayer *)self->_indeterminateLayer addAnimation:v6 forKey:@"spin"];
  }
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)MUCircleProgressView;
  [(MUCircleProgressView *)&v3 didMoveToWindow];
  if (self->_indeterminate) {
    [(MUCircleProgressView *)self _startIndeterminateAnimation];
  }
  else {
    [(CAShapeLayer *)self->_indeterminateLayer removeAllAnimations];
  }
}

- (void)layoutSubviews
{
  [(MUCircleProgressView *)self bounds];
  -[CAShapeLayer setFrame:](self->_borderLayer, "setFrame:");
  [(MUCircleProgressView *)self bounds];
  -[CAShapeLayer setFrame:](self->_progressLayer, "setFrame:");
  [(MUCircleProgressView *)self bounds];
  -[CAShapeLayer setFrame:](self->_indeterminateLayer, "setFrame:");
  [(CAShapeLayer *)self->_borderLayer lineWidth];
  CGFloat v4 = v3 * 0.5;
  double v5 = (void *)MEMORY[0x1E4FB14C0];
  [(CAShapeLayer *)self->_borderLayer bounds];
  CGRect v17 = CGRectInset(v16, v4, v4);
  objc_msgSend(v5, "bezierPathWithOvalInRect:", v17.origin.x, v17.origin.y, v17.size.width, v17.size.height);
  id v6 = objc_claimAutoreleasedReturnValue();
  -[CAShapeLayer setPath:](self->_borderLayer, "setPath:", [v6 CGPath]);

  [(CAShapeLayer *)self->_progressLayer lineWidth];
  CGFloat v8 = v7 * 0.5;
  v9 = (void *)MEMORY[0x1E4FB14C0];
  [(CAShapeLayer *)self->_progressLayer bounds];
  CGRect v19 = CGRectInset(v18, v8, v8);
  objc_msgSend(v9, "bezierPathWithOvalInRect:", v19.origin.x, v19.origin.y, v19.size.width, v19.size.height);
  id v10 = objc_claimAutoreleasedReturnValue();
  -[CAShapeLayer setPath:](self->_progressLayer, "setPath:", [v10 CGPath]);

  [(CAShapeLayer *)self->_indeterminateLayer lineWidth];
  CGFloat v12 = v11 * 0.5;
  double v13 = (void *)MEMORY[0x1E4FB14C0];
  [(CAShapeLayer *)self->_indeterminateLayer bounds];
  CGRect v21 = CGRectInset(v20, v12, v12);
  objc_msgSend(v13, "bezierPathWithOvalInRect:", v21.origin.x, v21.origin.y, v21.size.width, v21.size.height);
  id v14 = objc_claimAutoreleasedReturnValue();
  -[CAShapeLayer setPath:](self->_indeterminateLayer, "setPath:", [v14 CGPath]);
}

- (CGSize)intrinsicContentSize
{
  double v2 = 28.0;
  double v3 = 28.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)tintColorDidChange
{
  id v3 = [(MUCircleProgressView *)self tintColor];
  -[CAShapeLayer setStrokeColor:](self->_progressLayer, "setStrokeColor:", [v3 CGColor]);

  id v4 = [(MUCircleProgressView *)self tintColor];
  -[CAShapeLayer setStrokeColor:](self->_indeterminateLayer, "setStrokeColor:", [v4 CGColor]);

  v5.receiver = self;
  v5.super_class = (Class)MUCircleProgressView;
  [(MUCircleProgressView *)&v5 tintColorDidChange];
}

- (void)_updateStrokeColorForUpdatedUserInterfaceStyle
{
  id v3 = [MEMORY[0x1E4FB1618] systemFillColor];
  -[CAShapeLayer setStrokeColor:](self->_borderLayer, "setStrokeColor:", [v3 CGColor]);
}

- (void)_updateBorderWidthForUpdatedDisplayScale
{
  id v3 = [(MUCircleProgressView *)self traitCollection];
  [v3 displayScale];
  double v5 = v4;

  double v6 = 3.0;
  if (v5 >= 1.0) {
    double v6 = 1.0 / v5 + 2.0;
  }
  [(CAShapeLayer *)self->_borderLayer setLineWidth:v6];
  [(CAShapeLayer *)self->_borderLayer lineWidth];
  -[CAShapeLayer setLineWidth:](self->_progressLayer, "setLineWidth:");
  [(CAShapeLayer *)self->_borderLayer lineWidth];
  indeterminateLayer = self->_indeterminateLayer;
  -[CAShapeLayer setLineWidth:](indeterminateLayer, "setLineWidth:");
}

- (id)primaryAction
{
  return self->_primaryAction;
}

- (double)progress
{
  return self->_progress;
}

- (BOOL)isIndeterminate
{
  return self->_indeterminate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
  objc_storeStrong(&self->_primaryAction, 0);
  objc_storeStrong((id *)&self->_indeterminateLayer, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_progressLayer, 0);
  objc_storeStrong((id *)&self->_borderLayer, 0);
}

@end