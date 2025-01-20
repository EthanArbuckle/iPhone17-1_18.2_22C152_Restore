@interface HUDownloadProgressView
- (HUDownloadProgressView)initWithFrame:(CGRect)a3;
- (UIColor)outerRingColor;
- (UIImage)centerImage;
- (double)downloadProgress;
- (void)layoutSubviews;
- (void)setCenterImage:(id)a3;
- (void)setDownloadProgress:(double)a3;
- (void)setOuterRingColor:(id)a3;
@end

@implementation HUDownloadProgressView

- (HUDownloadProgressView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HUDownloadProgressView;
  v3 = -[HUDownloadProgressView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42FF0]);
    [(HUDownloadProgressView *)v3 bounds];
    uint64_t v5 = objc_msgSend(v4, "initWithFrame:");
    outerRingView = v3->_outerRingView;
    v3->_outerRingView = (UIView *)v5;

    [(UIView *)v3->_outerRingView setClipsToBounds:1];
    [(HUDownloadProgressView *)v3 addSubview:v3->_outerRingView];
  }
  return v3;
}

- (void)layoutSubviews
{
  v28.receiver = self;
  v28.super_class = (Class)HUDownloadProgressView;
  [(HUDownloadProgressView *)&v28 layoutSubviews];
  v3 = [(HUDownloadProgressView *)self traitCollection];
  [v3 displayScale];
  double v5 = HUGetSafeScaleForValue(v4);
  double v26 = v5;

  [(HUDownloadProgressView *)self bounds];
  double x = v29.origin.x;
  double y = v29.origin.y;
  double width = v29.size.width;
  double height = v29.size.height;
  double v10 = CGRectGetWidth(v29);
  v30.origin.double x = x;
  v30.origin.double y = y;
  v30.size.double width = width;
  v30.size.double height = height;
  double v11 = CGRectGetHeight(v30);
  if (v10 < v11) {
    double v11 = v10;
  }
  double v27 = v11 * 0.5;
  -[_HUDownloadProgressRingView setFrame:](self->_progressView, "setFrame:", x, y, width, height);
  [(UIImageView *)self->_centerImageView frame];
  -[UIImageView sizeThatFits:](self->_centerImageView, "sizeThatFits:", width, height);
  double v25 = v5;
  UIRectCenteredIntegralRectScale();
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  [(UIImage *)self->_centerImage alignmentRectInsets];
  -[UIImageView setFrame:](self->_centerImageView, "setFrame:", v13 + v23, v15 + v20, v17 - (v23 + v21), v19 - (v20 + v22));
  -[UIView setFrame:](self->_outerRingView, "setFrame:", x, y, width, height);
  v24 = [(UIView *)self->_outerRingView layer];
  [v24 setCornerRadius:v27];
  [v24 setBorderWidth:1.0 / v26 + 2.0];
}

- (void)setCenterImage:(id)a3
{
  double v5 = (UIImage *)a3;
  p_centerImage = &self->_centerImage;
  if (self->_centerImage != v5)
  {
    double v11 = v5;
    objc_storeStrong((id *)&self->_centerImage, a3);
    centerImageView = self->_centerImageView;
    if (*p_centerImage)
    {
      if (!centerImageView)
      {
        id v8 = objc_alloc(MEMORY[0x1E4F42AA0]);
        v9 = (UIImageView *)objc_msgSend(v8, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        double v10 = self->_centerImageView;
        self->_centerImageView = v9;

        [(HUDownloadProgressView *)self addSubview:self->_centerImageView];
        centerImageView = self->_centerImageView;
      }
      [(UIImageView *)centerImageView setHidden:0];
      [(UIImageView *)self->_centerImageView setImage:*p_centerImage];
    }
    else
    {
      [(UIImageView *)centerImageView setHidden:1];
    }
    [(HUDownloadProgressView *)self setNeedsLayout];
    double v5 = v11;
  }
}

- (void)setDownloadProgress:(double)a3
{
  float downloadProgress = self->_downloadProgress;
  float v5 = a3;
  if (vabds_f32(downloadProgress, v5) >= 0.00000011921)
  {
    self->_float downloadProgress = a3;
    *(float *)&double v3 = fabsf(v5);
    progressView = self->_progressView;
    BOOL v9 = v5 < 0.0;
    double v8 = 3.18618444e-58;
    BOOL v9 = v9 || *(float *)&v3 < 0.00000011921;
    if (v9)
    {
      [(_HUDownloadProgressRingView *)progressView removeFromSuperview];
      double v10 = self->_progressView;
      self->_progressView = 0;
    }
    else
    {
      if (!progressView)
      {
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __46__HUDownloadProgressView_setDownloadProgress___block_invoke;
        v11[3] = &unk_1E6386018;
        v11[4] = self;
        [MEMORY[0x1E4F42FF0] performWithoutAnimation:v11];
        progressView = self->_progressView;
        a3 = self->_downloadProgress;
      }
      -[_HUDownloadProgressRingView setProgress:](progressView, "setProgress:", a3, v8, v3);
    }
  }
}

uint64_t __46__HUDownloadProgressView_setDownloadProgress___block_invoke(uint64_t a1)
{
  v2 = [_HUDownloadProgressRingView alloc];
  [*(id *)(a1 + 32) bounds];
  uint64_t v3 = -[_HUDownloadProgressRingView initWithFrame:](v2, "initWithFrame:");
  uint64_t v4 = *(void *)(a1 + 32);
  float v5 = *(void **)(v4 + 424);
  *(void *)(v4 + 424) = v3;

  [*(id *)(*(void *)(a1 + 32) + 424) setProgress:0.0];
  v6 = *(void **)(a1 + 32);
  uint64_t v7 = v6[53];

  return [v6 addSubview:v7];
}

- (void)setOuterRingColor:(id)a3
{
  float v5 = (UIColor *)a3;
  p_outerRingColor = &self->_outerRingColor;
  if (self->_outerRingColor != v5)
  {
    double v8 = v5;
    objc_storeStrong((id *)&self->_outerRingColor, a3);
    uint64_t v7 = [(UIView *)self->_outerRingView layer];
    objc_msgSend(v7, "setBorderColor:", -[UIColor CGColor](*p_outerRingColor, "CGColor"));

    float v5 = v8;
  }
}

- (double)downloadProgress
{
  return self->_downloadProgress;
}

- (UIImage)centerImage
{
  return self->_centerImage;
}

- (UIColor)outerRingColor
{
  return self->_outerRingColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outerRingColor, 0);
  objc_storeStrong((id *)&self->_centerImage, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_outerRingView, 0);

  objc_storeStrong((id *)&self->_centerImageView, 0);
}

@end