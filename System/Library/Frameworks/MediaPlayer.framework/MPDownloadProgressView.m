@interface MPDownloadProgressView
- (MPDownloadProgressView)initWithFrame:(CGRect)a3;
- (UIColor)outerRingColor;
- (UIImage)centerImage;
- (double)downloadProgress;
- (void)layoutSubviews;
- (void)setCenterImage:(id)a3;
- (void)setDownloadProgress:(double)downloadProgress;
- (void)setOuterRingColor:(id)a3;
@end

@implementation MPDownloadProgressView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outerRingColor, 0);
  objc_storeStrong((id *)&self->_centerImage, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_outerRingView, 0);

  objc_storeStrong((id *)&self->_centerImageView, 0);
}

- (UIColor)outerRingColor
{
  return self->_outerRingColor;
}

- (UIImage)centerImage
{
  return self->_centerImage;
}

- (double)downloadProgress
{
  return self->_downloadProgress;
}

- (void)setOuterRingColor:(id)a3
{
  v5 = (UIColor *)a3;
  p_outerRingColor = &self->_outerRingColor;
  if (self->_outerRingColor != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_outerRingColor, a3);
    v7 = [(UIView *)self->_outerRingView layer];
    objc_msgSend(v7, "setBorderColor:", -[UIColor CGColor](*p_outerRingColor, "CGColor"));

    v5 = v8;
  }
}

- (void)setDownloadProgress:(double)downloadProgress
{
  if (vabdd_f64(downloadProgress, self->_downloadProgress) >= 0.00000011920929)
  {
    self->_downloadProgress = downloadProgress;
    double v4 = vabdd_f64(0.0, downloadProgress);
    progressView = self->_progressView;
    if (downloadProgress < 0.0 || v4 < 0.00000011920929)
    {
      [(_MPDownloadProgressRingView *)progressView removeFromSuperview];
      v7 = self->_progressView;
      self->_progressView = 0;
    }
    else
    {
      if (!progressView)
      {
        v8[0] = MEMORY[0x1E4F143A8];
        v8[1] = 3221225472;
        v8[2] = __46__MPDownloadProgressView_setDownloadProgress___block_invoke;
        v8[3] = &unk_1E57F9EA8;
        v8[4] = self;
        [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v8];
        progressView = self->_progressView;
        downloadProgress = self->_downloadProgress;
      }
      -[_MPDownloadProgressRingView setProgress:](progressView, "setProgress:", downloadProgress, v4);
    }
  }
}

uint64_t __46__MPDownloadProgressView_setDownloadProgress___block_invoke(uint64_t a1)
{
  v2 = [_MPDownloadProgressRingView alloc];
  [*(id *)(a1 + 32) bounds];
  uint64_t v3 = -[_MPDownloadProgressRingView initWithFrame:](v2, "initWithFrame:");
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 424);
  *(void *)(v4 + 424) = v3;

  [*(id *)(*(void *)(a1 + 32) + 424) setProgress:0.0];
  v6 = *(void **)(a1 + 32);
  uint64_t v7 = v6[53];

  return [v6 addSubview:v7];
}

- (void)setCenterImage:(id)a3
{
  v5 = (UIImage *)a3;
  p_centerImage = &self->_centerImage;
  if (self->_centerImage != v5)
  {
    v11 = v5;
    objc_storeStrong((id *)&self->_centerImage, a3);
    centerImageView = self->_centerImageView;
    if (*p_centerImage)
    {
      if (!centerImageView)
      {
        id v8 = objc_alloc(MEMORY[0x1E4FB1838]);
        v9 = (UIImageView *)objc_msgSend(v8, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
        v10 = self->_centerImageView;
        self->_centerImageView = v9;

        [(MPDownloadProgressView *)self addSubview:self->_centerImageView];
        centerImageView = self->_centerImageView;
      }
      [(UIImageView *)centerImageView setHidden:0];
      [(UIImageView *)self->_centerImageView setImage:*p_centerImage];
    }
    else
    {
      [(UIImageView *)centerImageView setHidden:1];
    }
    [(MPDownloadProgressView *)self setNeedsLayout];
    v5 = v11;
  }
}

- (void)layoutSubviews
{
  v28.receiver = self;
  v28.super_class = (Class)MPDownloadProgressView;
  [(MPDownloadProgressView *)&v28 layoutSubviews];
  uint64_t v3 = [(MPDownloadProgressView *)self traitCollection];
  [v3 displayScale];
  double SafeScaleForValue = MPFloatGetSafeScaleForValue(v4);
  double v26 = SafeScaleForValue;

  [(MPDownloadProgressView *)self bounds];
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
  -[_MPDownloadProgressRingView setFrame:](self->_progressView, "setFrame:", x, y, width, height);
  [(UIImageView *)self->_centerImageView frame];
  -[UIImageView sizeThatFits:](self->_centerImageView, "sizeThatFits:", width, height);
  double v25 = SafeScaleForValue;
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

- (MPDownloadProgressView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MPDownloadProgressView;
  uint64_t v3 = -[MPDownloadProgressView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    [(MPDownloadProgressView *)v3 bounds];
    uint64_t v5 = objc_msgSend(v4, "initWithFrame:");
    outerRingView = v3->_outerRingView;
    v3->_outerRingView = (UIView *)v5;

    [(UIView *)v3->_outerRingView setClipsToBounds:1];
    [(MPDownloadProgressView *)v3 addSubview:v3->_outerRingView];
  }
  return v3;
}

@end