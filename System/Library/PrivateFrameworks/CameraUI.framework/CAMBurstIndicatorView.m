@interface CAMBurstIndicatorView
- (CAMBurstIndicatorView)initWithCoder:(id)a3;
- (CAMBurstIndicatorView)initWithFrame:(CGRect)a3;
- (CAMBurstIndicatorView)initWithLayoutStyle:(int64_t)a3;
- (CGSize)intrinsicContentSize;
- (UILabel)_countLabel;
- (UIView)_backgroundView;
- (int64_t)_numberOfPhotos;
- (int64_t)incrementWithCaptureAnimation:(BOOL)a3;
- (int64_t)layoutStyle;
- (void)_commonCAMAvalancheIndicatorViewInitializationWithLayoutStyle:(int64_t)a3;
- (void)_performCaptureAnimation;
- (void)_updateAttributes;
- (void)_updateCountLabelWithNumberOfPhotos;
- (void)finishIncrementingWithCompletionHandler:(id)a3;
- (void)layoutSubviews;
- (void)reset;
- (void)setLayoutStyle:(int64_t)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CAMBurstIndicatorView

- (CAMBurstIndicatorView)initWithLayoutStyle:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CAMBurstIndicatorView;
  v4 = -[CAMBurstIndicatorView initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v5 = v4;
  if (v4)
  {
    [(CAMBurstIndicatorView *)v4 _commonCAMAvalancheIndicatorViewInitializationWithLayoutStyle:a3];
    v6 = v5;
  }

  return v5;
}

- (void)_commonCAMAvalancheIndicatorViewInitializationWithLayoutStyle:(int64_t)a3
{
  self->_layoutStyle = a3;
  id v4 = objc_alloc(MEMORY[0x263F82E00]);
  double v5 = *MEMORY[0x263F001A8];
  double v6 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v7 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v8 = *(double *)(MEMORY[0x263F001A8] + 24);
  v9 = (UIView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], v6, v7, v8);
  backgroundView = self->__backgroundView;
  self->__backgroundView = v9;

  v11 = self->__backgroundView;
  v12 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.300000012];
  [(UIView *)v11 setBackgroundColor:v12];

  [(CAMBurstIndicatorView *)self addSubview:self->__backgroundView];
  self->__numberOfPhotos = 0;
  v13 = (UILabel *)objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v5, v6, v7, v8);
  countLabel = self->__countLabel;
  self->__countLabel = v13;

  v15 = self->__countLabel;
  v16 = [MEMORY[0x263F825C8] whiteColor];
  [(UILabel *)v15 setTextColor:v16];

  [(UILabel *)self->__countLabel setTextAlignment:1];
  v17 = self->__countLabel;
  v18 = [MEMORY[0x263F825C8] clearColor];
  [(UILabel *)v17 setBackgroundColor:v18];

  [(CAMBurstIndicatorView *)self addSubview:self->__countLabel];
  [(CAMBurstIndicatorView *)self _updateCountLabelWithNumberOfPhotos];
  [(CAMBurstIndicatorView *)self _updateAttributes];
}

- (void)_updateCountLabelWithNumberOfPhotos
{
  objc_msgSend(NSString, "stringWithFormat:", @"%03ld", self->__numberOfPhotos);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(UILabel *)self->__countLabel setText:v3];
}

- (void)_updateAttributes
{
  [(CAMBurstIndicatorView *)self intrinsicContentSize];
  double v4 = v3;
  id v12 = [(UIView *)self->__backgroundView layer];
  [v12 setCornerRadius:floor(v4 * 0.5)];
  switch([(CAMBurstIndicatorView *)self layoutStyle])
  {
    case 0:
    case 2:
    case 4:
      double v5 = [(CAMBurstIndicatorView *)self traitCollection];
      double v6 = [v5 preferredContentSizeCategory];
      +[CAMZoomButton fontSizeForContentSize:v6];
      double v8 = v7;

      countLabel = self->__countLabel;
      double v10 = v8;
      goto LABEL_4;
    case 1:
      countLabel = self->__countLabel;
      double v10 = 14.0;
LABEL_4:
      v11 = +[CAMFont cameraMonospacedFontOfSize:v10];
      [(UILabel *)countLabel setFont:v11];

      break;
    default:
      break;
  }
}

- (CGSize)intrinsicContentSize
{
  double v4 = *MEMORY[0x263F001B0];
  uint64_t v3 = *(uint64_t *)(MEMORY[0x263F001B0] + 8);
  switch([(CAMBurstIndicatorView *)self layoutStyle])
  {
    case 0:
    case 2:
    case 4:
      double v5 = [(CAMBurstIndicatorView *)self traitCollection];
      double v6 = [v5 preferredContentSizeCategory];
      +[CAMZoomButton circleDiameterForContentSize:v6];
      uint64_t v3 = v7;

      goto LABEL_4;
    case 1:
      *(double *)&uint64_t v3 = 44.0;
LABEL_4:
      double v4 = *(double *)&v3;
      break;
    default:
      break;
  }
  double v8 = v4;
  double v9 = *(double *)&v3;
  result.height = v9;
  result.width = v8;
  return result;
}

- (int64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)CAMBurstIndicatorView;
  [(CAMBurstIndicatorView *)&v11 layoutSubviews];
  [(CAMBurstIndicatorView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  -[UIView setFrame:](self->__backgroundView, "setFrame:");
  v12.origin.x = v4;
  v12.origin.y = v6;
  v12.size.width = v8;
  v12.size.height = v10;
  CGRectGetWidth(v12);
  v13.origin.x = v4;
  v13.origin.y = v6;
  v13.size.width = v8;
  v13.size.height = v10;
  CGRectGetHeight(v13);
  UIRectCenteredIntegralRectScale();
  [(UILabel *)self->__countLabel setFrame:0];
}

- (CAMBurstIndicatorView)initWithFrame:(CGRect)a3
{
  CGFloat v4 = objc_msgSend(MEMORY[0x263F82670], "currentDevice", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  uint64_t v5 = objc_msgSend(v4, "cam_initialLayoutStyle");

  return [(CAMBurstIndicatorView *)self initWithLayoutStyle:v5];
}

- (CAMBurstIndicatorView)initWithCoder:(id)a3
{
  CGFloat v4 = objc_msgSend(MEMORY[0x263F82670], "currentDevice", a3);
  uint64_t v5 = objc_msgSend(v4, "cam_initialLayoutStyle");

  return [(CAMBurstIndicatorView *)self initWithLayoutStyle:v5];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v6 = [a3 preferredContentSizeCategory];
  CGFloat v4 = [(CAMBurstIndicatorView *)self traitCollection];
  id v5 = [v4 preferredContentSizeCategory];

  if (v5 != v6 && ([v5 isEqualToString:v6] & 1) == 0)
  {
    [(CAMBurstIndicatorView *)self _updateAttributes];
    [(CAMBurstIndicatorView *)self setNeedsLayout];
  }
}

- (void)finishIncrementingWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(UIView *)self->__backgroundView layer];
  id v6 = [v5 presentationLayer];
  [v6 opacity];
  double v8 = v7;

  double v9 = [MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
  CGFloat v10 = [NSNumber numberWithDouble:v8];
  [v9 setFromValue:v10];

  objc_super v11 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EA0]];
  [v9 setTimingFunction:v11];

  [v9 setDuration:0.19];
  CGRect v12 = objc_alloc_init(CAMAnimationDelegate);
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __65__CAMBurstIndicatorView_finishIncrementingWithCompletionHandler___block_invoke;
  v14[3] = &unk_263FA1EE0;
  id v15 = v4;
  id v13 = v4;
  [(CAMAnimationDelegate *)v12 setCompletion:v14];
  [v9 setDelegate:v12];
  +[CAMAnimationHelper configurePowerSensitiveAnimation:v9];
  [v5 addAnimation:v9 forKey:@"opacity"];
}

uint64_t __65__CAMBurstIndicatorView_finishIncrementingWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (int64_t)incrementWithCaptureAnimation:(BOOL)a3
{
  int64_t numberOfPhotos = self->__numberOfPhotos;
  int64_t v5 = 998;
  if (numberOfPhotos < 998) {
    int64_t v5 = self->__numberOfPhotos;
  }
  int64_t v6 = v5 + 1;
  self->__int64_t numberOfPhotos = v6;
  if (numberOfPhotos != v6)
  {
    BOOL v7 = a3;
    [(CAMBurstIndicatorView *)self _updateCountLabelWithNumberOfPhotos];
    if (v7) {
      [(CAMBurstIndicatorView *)self _performCaptureAnimation];
    }
  }
  return self->__numberOfPhotos;
}

- (void)reset
{
  id v4 = [(UIView *)self->__backgroundView layer];
  double v3 = [(UILabel *)self->__countLabel layer];
  [v4 removeAllAnimations];
  [v3 removeAllAnimations];
  self->__int64_t numberOfPhotos = 0;
  [(CAMBurstIndicatorView *)self _updateCountLabelWithNumberOfPhotos];
}

- (void)_performCaptureAnimation
{
  id v4 = [(UIView *)self->__backgroundView layer];
  v2 = [MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
  [v2 setToValue:&unk_26BDDF578];
  double v3 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EB8]];
  [v2 setTimingFunction:v3];

  [v2 setDuration:0.05];
  [v2 setAutoreverses:1];
  +[CAMAnimationHelper configurePowerSensitiveAnimation:v2];
  [v4 addAnimation:v2 forKey:@"opacity"];
}

- (void)setLayoutStyle:(int64_t)a3
{
  if (self->_layoutStyle != a3)
  {
    self->_layoutStyle = a3;
    [(CAMBurstIndicatorView *)self _updateAttributes];
    [(CAMBurstIndicatorView *)self setNeedsLayout];
  }
}

- (UIView)_backgroundView
{
  return self->__backgroundView;
}

- (UILabel)_countLabel
{
  return self->__countLabel;
}

- (int64_t)_numberOfPhotos
{
  return self->__numberOfPhotos;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__countLabel, 0);
  objc_storeStrong((id *)&self->__backgroundView, 0);
}

@end