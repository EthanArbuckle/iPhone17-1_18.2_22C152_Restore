@interface CAMZoomButton
+ (BOOL)_useOutline;
+ (BOOL)shouldUseLargeButtonSizeForContentSize:(id)a3;
+ (NSNumberFormatter)zoomFactorFormatter;
+ (double)circleDiameterForContentSize:(id)a3;
+ (double)fontSizeForContentSize:(id)a3;
+ (id)textForZoomFactor:(double)a3 showZoomFactorSymbol:(BOOL)a4;
+ (id)textForZoomFactor:(double)a3 showZoomFactorSymbol:(BOOL)a4 useLeadingZero:(BOOL)a5;
- (BOOL)abbreviateAndEnlargeText;
- (BOOL)isOverPlatter;
- (BOOL)shouldHideBackground;
- (BOOL)useLeadingZero;
- (CAMFocalLengthLabel)_focalLengthLabel;
- (CAMZoomButton)initWithCoder:(id)a3;
- (CAMZoomButton)initWithFrame:(CGRect)a3;
- (CAMZoomButtonDelegate)delegate;
- (CAMZoomFactorLabel)_zoomFactorLabel;
- (CGAffineTransform)_highlightingTransformForHighlighted:(SEL)a3;
- (CGAffineTransform)_transformForEnlargeText:(SEL)a3 orientation:(BOOL)a4;
- (CGAffineTransform)highlightingTransform;
- (CGRect)accessoryFrame;
- (CGSize)intrinsicContentSize;
- (UIEdgeInsets)tappableEdgeInsets;
- (UIImageView)_accessoryBackgroundView;
- (UIImageView)_accessoryImageView;
- (UIImageView)_backgroundImageView;
- (UIImageView)_circleImageView;
- (UIImageView)_zoomSymbolView;
- (UIView)_contentContainerView;
- (double)_backgroundImageDiameterForContentSize:(id)a3;
- (double)_circleLineWidthForContentSize:(id)a3;
- (double)zoomFactor;
- (id)_createBackgroundImageForContentSize:(id)a3;
- (id)_createBackgroundImageForContentSize:(id)a3 color:(id)a4;
- (id)_createCircleImageForContentSize:(id)a3;
- (id)_imageForZoomSymbol:(int64_t)a3;
- (int64_t)accessoryPosition;
- (int64_t)accessoryState;
- (int64_t)contentType;
- (int64_t)focalLength;
- (int64_t)orientation;
- (int64_t)zoomSymbol;
- (void)_commonCAMZoomButtonInitialization;
- (void)_createFocalLengthLabelIfNeeded;
- (void)_createZoomSymbolViewIfNecessary;
- (void)_performHighlightAnimation;
- (void)_setHighlightingTransform:(CGAffineTransform *)a3;
- (void)_updateAccessoryAlphas;
- (void)_updateAccessoryBackgroundView;
- (void)_updateBackgroundImageViewAlpha;
- (void)_updateForContentSize;
- (void)_updateZoomFactorLabelIfNeeded;
- (void)_updateZoomSymbolViewAnimated:(BOOL)a3;
- (void)layoutSubviews;
- (void)setAbbreviateAndEnlargeText:(BOOL)a3;
- (void)setAccessoryPosition:(int64_t)a3;
- (void)setAccessoryPosition:(int64_t)a3 animated:(BOOL)a4;
- (void)setAccessoryState:(int64_t)a3;
- (void)setAccessoryState:(int64_t)a3 animated:(BOOL)a4;
- (void)setContentType:(int64_t)a3;
- (void)setContentType:(int64_t)a3 animated:(BOOL)a4;
- (void)setDelegate:(id)a3;
- (void)setFocalLength:(int64_t)a3;
- (void)setFocalLength:(int64_t)a3 animated:(BOOL)a4;
- (void)setHighlighted:(BOOL)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4;
- (void)setOverPlatter:(BOOL)a3;
- (void)setShouldHideBackground:(BOOL)a3;
- (void)setShouldHideBackground:(BOOL)a3 animationDuration:(double)a4;
- (void)setTappableEdgeInsets:(UIEdgeInsets)a3;
- (void)setUseLeadingZero:(BOOL)a3;
- (void)setZoomFactor:(double)a3;
- (void)setZoomSymbol:(int64_t)a3;
- (void)setZoomSymbol:(int64_t)a3 animated:(BOOL)a4;
- (void)set_accessoryBackgroundView:(id)a3;
- (void)set_accessoryImageView:(id)a3;
- (void)set_focalLengthLabel:(id)a3;
- (void)tintColorDidChange;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CAMZoomButton

+ (double)circleDiameterForContentSize:(id)a3
{
  if ([a1 shouldUseLargeButtonSizeForContentSize:a3]) {
    return 50.0;
  }
  BOOL v4 = +[CAMZoomButton _useOutline];
  double result = 37.0;
  if (v4) {
    return 36.0;
  }
  return result;
}

+ (double)fontSizeForContentSize:(id)a3
{
  char v3 = [a1 shouldUseLargeButtonSizeForContentSize:a3];
  double result = 16.0;
  if ((v3 & 1) == 0)
  {
    BOOL v5 = +[CAMZoomButton _useOutline];
    double result = 13.0;
    if (!v5)
    {
      v6 = objc_msgSend(MEMORY[0x263F82B60], "mainScreen", 13.0);
      [v6 scale];
      double v8 = 1.0 / v7;

      return v8 + 13.0;
    }
  }
  return result;
}

+ (BOOL)_useOutline
{
  v2 = +[CAMCaptureCapabilities capabilities];
  BOOL v3 = [v2 zoomDialStyle] != 1;

  return v3;
}

- (void)_commonCAMZoomButtonInitialization
{
  BOOL v3 = [MEMORY[0x263F825C8] whiteColor];
  [(CAMZoomButton *)self setTintColor:v3];

  id v4 = objc_alloc(MEMORY[0x263F82E00]);
  double v5 = *MEMORY[0x263F001A8];
  double v6 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v7 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v8 = *(double *)(MEMORY[0x263F001A8] + 24);
  v9 = (UIView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], v6, v7, v8);
  contentContainerView = self->__contentContainerView;
  self->__contentContainerView = v9;

  [(UIView *)self->__contentContainerView setUserInteractionEnabled:0];
  [(CAMZoomButton *)self addSubview:self->__contentContainerView];
  v11 = (UIImageView *)objc_alloc_init(MEMORY[0x263F82828]);
  backgroundImageView = self->__backgroundImageView;
  self->__backgroundImageView = v11;

  [(CAMZoomButton *)self _updateBackgroundImageViewAlpha];
  [(UIView *)self->__contentContainerView addSubview:self->__backgroundImageView];
  v13 = -[CAMZoomFactorLabel initWithFrame:]([CAMZoomFactorLabel alloc], "initWithFrame:", v5, v6, v7, v8);
  zoomFactorLabel = self->__zoomFactorLabel;
  self->__zoomFactorLabel = v13;

  [(CAMZoomFactorLabel *)self->__zoomFactorLabel setShowZoomFactorSymbol:1];
  [(CAMZoomFactorLabel *)self->__zoomFactorLabel setUseLeadingZero:1];
  v15 = [(CAMZoomButton *)self tintColor];
  [(CAMZoomFactorLabel *)self->__zoomFactorLabel setTintColor:v15];

  [(UIView *)self->__contentContainerView addSubview:self->__zoomFactorLabel];
  if (+[CAMZoomButton _useOutline])
  {
    v16 = (UIImageView *)objc_alloc_init(MEMORY[0x263F82828]);
    circleImageView = self->__circleImageView;
    self->__circleImageView = v16;

    [(UIView *)self->__contentContainerView addSubview:self->__circleImageView];
  }
  [(CAMZoomButton *)self _updateForContentSize];
  self->_zoomFactor = 1.0;
  [(CAMZoomButton *)self _updateZoomFactorLabelIfNeeded];
  uint64_t v18 = MEMORY[0x263F000D0];
  long long v19 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&self->_highlightingTransform.a = *MEMORY[0x263F000D0];
  *(_OWORD *)&self->_highlightingTransform.c = v19;
  *(_OWORD *)&self->_highlightingTransform.tx = *(_OWORD *)(v18 + 32);
}

- (void)_updateForContentSize
{
  BOOL v3 = [(CAMZoomButton *)self traitCollection];
  id v9 = [v3 preferredContentSizeCategory];

  id v4 = [(CAMZoomButton *)self _createBackgroundImageForContentSize:v9];
  double v5 = [(CAMZoomButton *)self _backgroundImageView];
  [v5 setImage:v4];

  if (self->__circleImageView)
  {
    double v6 = [(CAMZoomButton *)self _createCircleImageForContentSize:v9];
    double v7 = [(CAMZoomButton *)self _circleImageView];
    [v7 setImage:v6];
  }
  double v8 = [(CAMZoomButton *)self _accessoryBackgroundView];

  if (v8) {
    [(CAMZoomButton *)self _updateAccessoryBackgroundView];
  }
}

- (CAMZoomButton)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CAMZoomButton;
  BOOL v3 = -[CAMZoomButton initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3)
  {
    [(CAMZoomButton *)v3 _commonCAMZoomButtonInitialization];
    double v5 = v4;
  }

  return v4;
}

- (CAMZoomButton)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CAMZoomButton;
  BOOL v3 = [(CAMZoomButton *)&v7 initWithCoder:a3];
  id v4 = v3;
  if (v3)
  {
    [(CAMZoomButton *)v3 _commonCAMZoomButtonInitialization];
    double v5 = v4;
  }

  return v4;
}

- (void)setContentType:(int64_t)a3
{
}

- (void)setContentType:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_contentType != a3)
  {
    BOOL v4 = a4;
    self->_contentType = a3;
    if (a3 == 2)
    {
      [(CAMZoomButton *)self _createFocalLengthLabelIfNeeded];
      char v7 = 0;
      char v6 = 1;
    }
    else if (a3 == 1)
    {
      [(CAMZoomButton *)self _createZoomSymbolViewIfNecessary];
      [(CAMZoomButton *)self _updateZoomSymbolViewAnimated:v4];
      char v6 = 0;
      char v7 = 1;
    }
    else
    {
      if (!a3) {
        [(CAMZoomButton *)self _updateZoomFactorLabelIfNeeded];
      }
      char v6 = 0;
      char v7 = 0;
    }
    double v8 = 0.25;
    v9[1] = 3221225472;
    v9[0] = MEMORY[0x263EF8330];
    v9[2] = __41__CAMZoomButton_setContentType_animated___block_invoke;
    v9[3] = &unk_263FA3AD8;
    if (!v4) {
      double v8 = 0.0;
    }
    v9[4] = self;
    char v10 = v7;
    char v11 = (v6 | v7) ^ 1;
    char v12 = v6;
    +[CAMView animateIfNeededWithDuration:v9 animations:v8];
  }
}

void __41__CAMZoomButton_setContentType_animated___block_invoke(uint64_t a1, double a2)
{
  LOBYTE(a2) = *(unsigned char *)(a1 + 40);
  double v3 = (double)*(unint64_t *)&a2;
  BOOL v4 = [*(id *)(a1 + 32) _zoomSymbolView];
  [v4 setAlpha:v3];

  LOBYTE(v5) = *(unsigned char *)(a1 + 41);
  double v6 = (double)v5;
  char v7 = [*(id *)(a1 + 32) _zoomFactorLabel];
  [v7 setAlpha:v6];

  LOBYTE(v8) = *(unsigned char *)(a1 + 42);
  double v9 = (double)v8;
  id v10 = [*(id *)(a1 + 32) _focalLengthLabel];
  [v10 setAlpha:v9];
}

- (void)setZoomFactor:(double)a3
{
  if (self->_zoomFactor != a3)
  {
    self->_zoomFactor = a3;
    [(CAMZoomButton *)self _updateZoomFactorLabelIfNeeded];
  }
}

- (void)setZoomSymbol:(int64_t)a3
{
}

- (void)setZoomSymbol:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_zoomSymbol != a3)
  {
    self->_zoomSymbol = a3;
    [(CAMZoomButton *)self _updateZoomSymbolViewAnimated:a4];
  }
}

- (void)_createZoomSymbolViewIfNecessary
{
  if (!self->__zoomSymbolView)
  {
    id v5 = [(CAMZoomButton *)self _imageForZoomSymbol:[(CAMZoomButton *)self zoomSymbol]];
    double v3 = (UIImageView *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v5];
    zoomSymbolView = self->__zoomSymbolView;
    self->__zoomSymbolView = v3;

    [(UIImageView *)self->__zoomSymbolView _setAnimatesContents:1];
    [(UIView *)self->__contentContainerView addSubview:self->__zoomSymbolView];
    [(CAMZoomButton *)self setNeedsLayout];
  }
}

- (id)_imageForZoomSymbol:(int64_t)a3
{
  double v3 = @"arrow.up.left.and.arrow.down.right";
  if (a3 != 1) {
    double v3 = 0;
  }
  if (a3) {
    BOOL v4 = v3;
  }
  else {
    BOOL v4 = @"arrow.down.right.and.arrow.up.left";
  }
  id v5 = (void *)MEMORY[0x263F827E8];
  double v6 = [MEMORY[0x263F82818] configurationWithPointSize:16.0];
  char v7 = [v5 systemImageNamed:v4 withConfiguration:v6];

  return v7;
}

- (void)_updateZoomSymbolViewAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  int64_t v5 = [(CAMZoomButton *)self contentType];
  if (v5 && v5 != 2)
  {
    if (v5 == 1)
    {
      double v6 = [(CAMZoomButton *)self _imageForZoomSymbol:[(CAMZoomButton *)self zoomSymbol]];
    }
    else
    {
      double v6 = 0;
    }
    v9[1] = 3221225472;
    v9[0] = MEMORY[0x263EF8330];
    v9[2] = __47__CAMZoomButton__updateZoomSymbolViewAnimated___block_invoke;
    v9[3] = &unk_263FA0408;
    if (v3) {
      double v7 = 0.2;
    }
    else {
      double v7 = 0.0;
    }
    v9[4] = self;
    id v10 = v6;
    id v8 = v6;
    +[CAMView animateIfNeededWithDuration:v9 animations:v7];
  }
}

void __47__CAMZoomButton__updateZoomSymbolViewAnimated___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) _zoomSymbolView];
  [v2 setImage:v1];
}

- (void)setFocalLength:(int64_t)a3
{
}

- (void)setFocalLength:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_focalLength != a3)
  {
    self->_focalLength = a3;
    id v5 = [(CAMZoomButton *)self _focalLengthLabel];
    [v5 setFocalLength:a3];
  }
}

- (void)_createFocalLengthLabelIfNeeded
{
  BOOL v3 = [(CAMZoomButton *)self _focalLengthLabel];
  if (!v3)
  {
    id v5 = objc_alloc_init(CAMFocalLengthLabel);
    [(CAMFocalLengthLabel *)v5 setFocalLength:[(CAMZoomButton *)self focalLength]];
    BOOL v4 = [(CAMZoomButton *)self _contentContainerView];
    [v4 addSubview:v5];

    [(CAMZoomButton *)self set_focalLengthLabel:v5];
    [(CAMZoomButton *)self setNeedsLayout];
    BOOL v3 = v5;
  }
}

- (void)setAccessoryState:(int64_t)a3
{
}

- (void)setAccessoryState:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_accessoryState == a3) {
    return;
  }
  BOOL v4 = a4;
  id v7 = [(CAMZoomButton *)self _accessoryBackgroundView];
  uint64_t v8 = [(CAMZoomButton *)self _accessoryImageView];
  id v9 = (id)v8;
  if (!v7)
  {
    id v7 = objc_alloc_init(MEMORY[0x263F82828]);
    v20 = [(CAMZoomButton *)self _contentContainerView];
    [v20 insertSubview:v7 atIndex:0];

    [(CAMZoomButton *)self set_accessoryBackgroundView:v7];
    [(CAMZoomButton *)self _updateAccessoryBackgroundView];
    [(CAMZoomButton *)self setNeedsLayout];
    if (v9) {
      goto LABEL_4;
    }
LABEL_11:
    id v9 = objc_alloc_init(MEMORY[0x263F82828]);
    v21 = [MEMORY[0x263F825C8] whiteColor];
    [v9 setTintColor:v21];

    v22 = [(CAMZoomButton *)self _contentContainerView];
    [v22 insertSubview:v9 atIndex:1];

    [(CAMZoomButton *)self set_accessoryImageView:v9];
    [(CAMZoomButton *)self _updateAccessoryAlphas];
    [(CAMZoomButton *)self setNeedsLayout];
    goto LABEL_4;
  }
  if (!v8) {
    goto LABEL_11;
  }
LABEL_4:
  if (a3 == 1)
  {
    id v10 = (void *)MEMORY[0x263F827E8];
    char v11 = [MEMORY[0x263F82818] configurationWithPointSize:16.0];
    char v12 = [v10 _systemImageNamed:@"camera.nightmode" withConfiguration:v11];
    v13 = [v12 imageWithRenderingMode:2];
    [v9 setImage:v13];
  }
  if (v4)
  {
    [(CAMZoomButton *)self layoutIfNeeded];
    self->_accessoryState = a3;
    [(CAMZoomButton *)self setNeedsLayout];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __44__CAMZoomButton_setAccessoryState_animated___block_invoke;
    v25[3] = &unk_263FA0208;
    v25[4] = self;
    [MEMORY[0x263F82E00] animateWithDuration:2 delay:v25 usingSpringWithDamping:0 initialSpringVelocity:0.4 options:0.0 animations:1.0 completion:1.0];
    if ([(CAMZoomButton *)self accessoryState])
    {
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __44__CAMZoomButton_setAccessoryState_animated___block_invoke_3;
      v23[3] = &unk_263FA0208;
      v23[4] = self;
      double v14 = 0.05;
      double v15 = 1.0;
      double v16 = 1.0;
      v17 = v23;
      double v18 = 0.4;
      uint64_t v19 = 2;
    }
    else
    {
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __44__CAMZoomButton_setAccessoryState_animated___block_invoke_2;
      v24[3] = &unk_263FA0208;
      v24[4] = self;
      double v18 = 0.25;
      double v14 = 0.0;
      double v15 = 1.0;
      v17 = v24;
      double v16 = 1.0;
      uint64_t v19 = 0;
    }
    [MEMORY[0x263F82E00] animateWithDuration:v19 delay:v17 usingSpringWithDamping:0 initialSpringVelocity:v18 options:v14 animations:v15 completion:v16];
  }
  else
  {
    self->_accessoryState = a3;
    [(CAMZoomButton *)self setNeedsLayout];
    [(CAMZoomButton *)self _updateAccessoryAlphas];
  }
}

uint64_t __44__CAMZoomButton_setAccessoryState_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

uint64_t __44__CAMZoomButton_setAccessoryState_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateAccessoryAlphas];
}

uint64_t __44__CAMZoomButton_setAccessoryState_animated___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateAccessoryAlphas];
}

- (void)setAccessoryPosition:(int64_t)a3
{
}

- (void)setAccessoryPosition:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_accessoryPosition != a3)
  {
    if (a4)
    {
      [(CAMZoomButton *)self layoutIfNeeded];
      self->_accessoryPosition = a3;
      [(CAMZoomButton *)self setNeedsLayout];
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = __47__CAMZoomButton_setAccessoryPosition_animated___block_invoke;
      v6[3] = &unk_263FA0208;
      v6[4] = self;
      [MEMORY[0x263F82E00] animateWithDuration:2 delay:v6 usingSpringWithDamping:0 initialSpringVelocity:0.4 options:0.0 animations:1.0 completion:1.0];
    }
    else
    {
      self->_accessoryPosition = a3;
      [(CAMZoomButton *)self setNeedsLayout];
    }
  }
}

uint64_t __47__CAMZoomButton_setAccessoryPosition_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (CGRect)accessoryFrame
{
  double v4 = *MEMORY[0x263F001A8];
  CGFloat v3 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v5 = *(double *)(MEMORY[0x263F001A8] + 16);
  CGFloat v6 = *(double *)(MEMORY[0x263F001A8] + 24);
  id v7 = [(CAMZoomButton *)self _accessoryBackgroundView];
  if (v7 && [(CAMZoomButton *)self accessoryState])
  {
    [v7 bounds];
    -[CAMZoomButton convertRect:fromView:](self, "convertRect:fromView:", v7);
    double v4 = v8;
    CGFloat v3 = v9;
    double v5 = v10;
    CGFloat v6 = v11;
    char v12 = [(CAMZoomButton *)self _backgroundImageView];
    [v12 bounds];
    -[CAMZoomButton convertRect:fromView:](self, "convertRect:fromView:", v12);
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    int64_t v21 = [(CAMZoomButton *)self accessoryPosition];
    if (v21 == 1)
    {
      v29.origin.x = v4;
      v29.origin.y = v3;
      v29.size.width = v5;
      v29.size.height = v6;
      double MaxX = CGRectGetMaxX(v29);
      v30.origin.x = v14;
      v30.origin.y = v16;
      v30.size.width = v18;
      v30.size.height = v20;
      double v5 = v5 - (MaxX - CGRectGetMinX(v30));
    }
    else if (!v21)
    {
      v28.origin.x = v14;
      v28.origin.y = v16;
      v28.size.width = v18;
      v28.size.height = v20;
      CGFloat v22 = CGRectGetMaxX(v28);
      double v5 = v5 - (v22 - v4);
      double v4 = v22;
    }
  }
  double v23 = v4;
  double v24 = v3;
  double v25 = v5;
  double v26 = v6;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (void)_updateAccessoryAlphas
{
  if ([(CAMZoomButton *)self accessoryState]) {
    double v3 = 1.0;
  }
  else {
    double v3 = 0.0;
  }
  double v4 = [(CAMZoomButton *)self _accessoryBackgroundView];
  [v4 setAlpha:v3];

  id v5 = [(CAMZoomButton *)self _accessoryImageView];
  [v5 setAlpha:v3];
}

- (void)_updateAccessoryBackgroundView
{
  double v3 = [(CAMZoomButton *)self _accessoryBackgroundView];

  if (v3)
  {
    double v4 = [(CAMZoomButton *)self traitCollection];
    id v5 = [v4 preferredContentSizeCategory];
    CGFloat v6 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.5];
    id v7 = [(CAMZoomButton *)self _createBackgroundImageForContentSize:v5 color:v6];

    [v7 size];
    objc_msgSend(v7, "resizableImageWithCapInsets:resizingMode:", 1, 0.0, v8 * 0.5, 0.0, v8 * 0.5);
    id v10 = (id)objc_claimAutoreleasedReturnValue();

    double v9 = [(CAMZoomButton *)self _accessoryBackgroundView];
    [v9 setImage:v10];
  }
}

- (void)setTappableEdgeInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_tappableEdgeInsets.left
    || a3.top != self->_tappableEdgeInsets.top
    || a3.right != self->_tappableEdgeInsets.right
    || a3.bottom != self->_tappableEdgeInsets.bottom)
  {
    self->_tappableEdgeInsets = a3;
    [(CAMZoomButton *)self setNeedsLayout];
  }
}

- (void)setOverPlatter:(BOOL)a3
{
  if (self->_overPlatter != a3)
  {
    self->_overPlatter = a3;
    [(CAMZoomButton *)self _updateBackgroundImageViewAlpha];
  }
}

- (void)setShouldHideBackground:(BOOL)a3
{
}

- (void)setShouldHideBackground:(BOOL)a3 animationDuration:(double)a4
{
  if (self->_shouldHideBackground != a3)
  {
    self->_shouldHideBackground = a3;
    double v4 = 2.0;
    if (!a3) {
      double v4 = 0.0;
    }
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __59__CAMZoomButton_setShouldHideBackground_animationDuration___block_invoke;
    v5[3] = &unk_263FA0208;
    v5[4] = self;
    +[CAMView animateIfNeededWithDuration:4 usingSpringWithDamping:v5 initialSpringVelocity:0 options:a4 animations:1.0 completion:v4];
  }
}

uint64_t __59__CAMZoomButton_setShouldHideBackground_animationDuration___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateBackgroundImageViewAlpha];
}

- (void)_setHighlightingTransform:(CGAffineTransform *)a3
{
  p_highlightingTransform = &self->_highlightingTransform;
  long long v6 = *(_OWORD *)&self->_highlightingTransform.c;
  *(_OWORD *)&t1.a = *(_OWORD *)&self->_highlightingTransform.a;
  *(_OWORD *)&t1.c = v6;
  *(_OWORD *)&t1.tx = *(_OWORD *)&self->_highlightingTransform.tx;
  long long v7 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v10.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v10.c = v7;
  *(_OWORD *)&v10.tx = *(_OWORD *)&a3->tx;
  if (!CGAffineTransformEqualToTransform(&t1, &v10))
  {
    long long v8 = *(_OWORD *)&a3->a;
    long long v9 = *(_OWORD *)&a3->tx;
    *(_OWORD *)&p_highlightingTransform->c = *(_OWORD *)&a3->c;
    *(_OWORD *)&p_highlightingTransform->tx = v9;
    *(_OWORD *)&p_highlightingTransform->a = v8;
    [(CAMZoomButton *)self setNeedsLayout];
  }
}

- (CGSize)intrinsicContentSize
{
  id v2 = [(CAMZoomButton *)self traitCollection];
  double v3 = [v2 preferredContentSizeCategory];

  [(id)objc_opt_class() circleDiameterForContentSize:v3];
  double v5 = v4;

  double v6 = v5;
  double v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v6 = [a3 preferredContentSizeCategory];
  double v4 = [(CAMZoomButton *)self traitCollection];
  id v5 = [v4 preferredContentSizeCategory];

  if (v5 != v6 && ([v5 isEqualToString:v6] & 1) == 0)
  {
    [(CAMZoomButton *)self _updateForContentSize];
    [(CAMZoomButton *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  v66.receiver = self;
  v66.super_class = (Class)CAMZoomButton;
  [(CAMZoomButton *)&v66 layoutSubviews];
  [(CAMZoomButton *)self bounds];
  -[CAMZoomButton alignmentRectForFrame:](self, "alignmentRectForFrame:");
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(CAMZoomButton *)self _contentContainerView];
  char v12 = [(CAMZoomButton *)self _zoomFactorLabel];
  double v13 = [(CAMZoomButton *)self _zoomSymbolView];
  CGFloat v14 = [(CAMZoomButton *)self _circleImageView];
  double v15 = [(CAMZoomButton *)self _backgroundImageView];
  CGFloat v16 = [v15 image];
  v67.origin.x = v4;
  v67.origin.y = v6;
  v67.size.width = v8;
  v67.size.height = v10;
  double MidX = CGRectGetMidX(v67);
  v68.origin.x = v4;
  v68.origin.y = v6;
  v68.size.width = v8;
  v68.size.height = v10;
  double MidY = CGRectGetMidY(v68);
  long long v64 = 0u;
  long long v65 = 0u;
  long long v63 = 0u;
  [(CAMZoomButton *)self _highlightingTransformForHighlighted:[(CAMZoomButton *)self isHighlighted]];
  objc_msgSend(v11, "setBounds:", 0.0, 0.0, v8, v10);
  objc_msgSend(v11, "setCenter:", MidX, MidY);
  long long v60 = v63;
  long long v61 = v64;
  long long v62 = v65;
  [v11 setTransform:&v60];
  v69.origin.x = 0.0;
  v69.origin.y = 0.0;
  v69.size.width = v8;
  v69.size.height = v10;
  CGRectGetMidX(v69);
  v70.origin.x = 0.0;
  v70.origin.y = 0.0;
  v70.size.width = v8;
  v70.size.height = v10;
  CGRectGetMidY(v70);
  [v16 size];
  double v19 = (double *)MEMORY[0x263F001A8];
  long long v20 = *(_OWORD *)(MEMORY[0x263F001A8] + 16);
  long long v58 = *MEMORY[0x263F001A8];
  long long v59 = v20;
  long long v57 = *MEMORY[0x263F00148];
  long long v61 = 0u;
  long long v62 = 0u;
  long long v60 = 0u;
  [(CAMZoomButton *)self _transformForEnlargeText:[(CAMZoomButton *)self abbreviateAndEnlargeText] orientation:[(CAMZoomButton *)self orientation]];
  +[CAMView convertRect:toCeiledBounds:andRoundedCenter:toViewScale:](CAMView, "convertRect:toCeiledBounds:andRoundedCenter:toViewScale:", &v58, &v57, self, 0.0, 0.0, v8, v10);
  objc_msgSend(v12, "setBounds:", v58, v59);
  [v12 setCenter:v57];
  v56[0] = v60;
  v56[1] = v61;
  v56[2] = v62;
  [v12 setTransform:v56];
  int64_t v21 = [(CAMZoomButton *)self traitCollection];
  [v21 displayScale];
  uint64_t v23 = v22;
  uint64_t v52 = v22;

  double v24 = *v19;
  double v25 = v19[1];
  double v26 = [v13 image];
  [v26 size];
  double v28 = v27;
  double v30 = v29;

  UIRectCenteredIntegralRectScale();
  UIRectGetCenter();
  double v32 = v31;
  double v34 = v33;
  double v51 = v25;
  objc_msgSend(v13, "setBounds:", v24, v25, v28, v30, v23);
  objc_msgSend(v13, "setCenter:", v32, v34);
  v55[0] = v60;
  v55[1] = v61;
  v55[2] = v62;
  [v13 setTransform:v55];
  UIRectCenteredAboutPointScale();
  objc_msgSend(v14, "setFrame:");
  UIRectCenteredAboutPointScale();
  objc_msgSend(v15, "setFrame:");
  v35 = [(CAMZoomButton *)self _focalLengthLabel];
  v36 = v35;
  if (v35)
  {
    [v35 intrinsicContentSize];
    CEKRectWithSize();
    double v38 = v37;
    double v40 = v39;
    double v42 = v41;
    double v44 = v43;
    UIRectCenteredIntegralRectScale();
    objc_msgSend(v36, "setBounds:", v38, v40, v42, v44, v52);
    UIRectGetCenter();
    objc_msgSend(v36, "setCenter:");
    v54[0] = v60;
    v54[1] = v61;
    v54[2] = v62;
    [v36 setTransform:v54];
  }
  uint64_t v45 = [(CAMZoomButton *)self _accessoryBackgroundView];
  uint64_t v46 = [(CAMZoomButton *)self _accessoryImageView];
  if (v46 | v45)
  {
    [(id)v45 intrinsicContentSize];
    UIRectCenteredAboutPoint();
    double v47 = CAMViewAlignmentSize((void *)v46);
    double v49 = v48;
    if ([(CAMZoomButton *)self accessoryState]) {
      [(CAMZoomButton *)self accessoryPosition];
    }
    UIRectCenteredAboutPointScale();
    UIRectGetCenter();
    objc_msgSend((id)v46, "setCenter:");
    objc_msgSend((id)v46, "setBounds:", v24, v51, v47, v49);
    v53[0] = v60;
    v53[1] = v61;
    v53[2] = v62;
    [(id)v46 setTransform:v53];
    UIRectIntegralWithScale();
    objc_msgSend((id)v45, "setFrame:");
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained zoomButtonDidLayout];
}

- (void)tintColorDidChange
{
  zoomFactorLabel = self->__zoomFactorLabel;
  id v3 = [(CAMZoomButton *)self tintColor];
  [(CAMZoomFactorLabel *)zoomFactorLabel setTextColor:v3];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(CAMZoomButton *)self isHighlighted];
  v7.receiver = self;
  v7.super_class = (Class)CAMZoomButton;
  [(CAMZoomButton *)&v7 setHighlighted:v3];
  if (v5 != v3)
  {
    [(CAMZoomButton *)self _highlightingTransformForHighlighted:v3];
    v6[0] = v6[3];
    v6[1] = v6[4];
    v6[2] = v6[5];
    [(CAMZoomButton *)self _setHighlightingTransform:v6];
    [(CAMZoomButton *)self _performHighlightAnimation];
  }
}

- (CGAffineTransform)_highlightingTransformForHighlighted:(SEL)a3
{
  double v5 = 1.0;
  if (a4)
  {
    BOOL v6 = +[CAMZoomButton _useOutline];
    double v5 = 0.85;
    if (v6) {
      double v5 = 0.92;
    }
  }
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  return CGAffineTransformMakeScale(retstr, v5, v5);
}

- (CGAffineTransform)_transformForEnlargeText:(SEL)a3 orientation:(BOOL)a4
{
  double v7 = 1.3;
  memset(&v12.c, 0, 32);
  if (!a4) {
    double v7 = 1.0;
  }
  *(_OWORD *)&v12.a = 0uLL;
  CGAffineTransformMakeScale(&v12, v7, v7);
  memset(&v11, 0, sizeof(v11));
  CAMOrientationTransform([(CAMZoomButton *)self orientation], (uint64_t)&v11);
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  CGAffineTransform t1 = v11;
  CGAffineTransform v9 = v12;
  return CGAffineTransformConcat(retstr, &t1, &v9);
}

- (void)_updateBackgroundImageViewAlpha
{
  double v3 = 0.0;
  if (![(CAMZoomButton *)self shouldHideBackground])
  {
    if (+[CAMZoomButton _useOutline])
    {
      if ([(CAMZoomButton *)self isHighlighted]) {
        double v3 = 0.5;
      }
      else {
        double v3 = 0.1;
      }
    }
    else
    {
      BOOL v4 = [(CAMZoomButton *)self isOverPlatter];
      int v5 = [(CAMZoomButton *)self isHighlighted];
      if (v4)
      {
        if (v5) {
          double v3 = 0.7;
        }
        else {
          double v3 = -0.5 / (1.0 - 0.15) + 1.0;
        }
      }
      else if (v5)
      {
        double v3 = 0.6;
      }
      else
      {
        double v3 = 0.5;
      }
    }
  }
  id v6 = [(CAMZoomButton *)self _backgroundImageView];
  [v6 setAlpha:v3];
}

- (void)_performHighlightAnimation
{
  uint64_t v3 = [(CAMZoomButton *)self isHighlighted];
  double v4 = 0.1;
  if (v3)
  {
    uint64_t v5 = 131078;
  }
  else
  {
    double v4 = 0.25;
    uint64_t v5 = 6;
  }
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __43__CAMZoomButton__performHighlightAnimation__block_invoke;
  v27[3] = &unk_263FA0208;
  v27[4] = self;
  [MEMORY[0x263F82E00] animateWithDuration:v5 delay:v27 options:0 animations:v4 completion:0.0];
  UIAnimationDragCoefficient();
  float v7 = v6;
  double v8 = [MEMORY[0x263F15890] animationWithKeyPath:@"transform"];
  [v8 setMass:0.8];
  [v8 setDamping:12.0 / v7];
  [v8 setStiffness:300.0 / (float)(v7 * v7)];
  [v8 durationForEpsilon:0.01];
  objc_msgSend(v8, "setDuration:");
  LODWORD(v9) = 1041865114;
  LODWORD(v10) = 0.5;
  LODWORD(v11) = 1.0;
  CGAffineTransform v12 = [MEMORY[0x263F15808] functionWithControlPoints:v9 :0.0 :v10 :v11];
  [v8 setTimingFunction:v12];

  double v13 = [(CAMZoomButton *)self _contentContainerView];
  CGFloat v14 = [v13 layer];
  double v15 = [v14 presentationLayer];
  CGFloat v16 = [v15 valueForKeyPath:@"transform"];
  [v8 setFromValue:v16];

  memset(&v26, 0, sizeof(v26));
  [(CAMZoomButton *)self _highlightingTransformForHighlighted:v3];
  memset(&v25, 0, sizeof(v25));
  CGAffineTransform m = v26;
  CATransform3DMakeAffineTransform(&v25, &m);
  long long v21 = *(_OWORD *)&v25.m31;
  long long v22 = *(_OWORD *)&v25.m33;
  long long v23 = *(_OWORD *)&v25.m41;
  long long v24 = *(_OWORD *)&v25.m43;
  *(_OWORD *)&m.a = *(_OWORD *)&v25.m11;
  *(_OWORD *)&m.c = *(_OWORD *)&v25.m13;
  *(_OWORD *)&m.tx = *(_OWORD *)&v25.m21;
  long long v20 = *(_OWORD *)&v25.m23;
  double v17 = [MEMORY[0x263F08D40] valueWithCATransform3D:&m];
  [v8 setToValue:v17];

  [v14 addAnimation:v8 forKey:@"highlightAnimation"];
  CATransform3D v18 = v25;
  [v14 setTransform:&v18];
}

uint64_t __43__CAMZoomButton__performHighlightAnimation__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateBackgroundImageViewAlpha];
}

+ (NSNumberFormatter)zoomFactorFormatter
{
  if (zoomFactorFormatter_onceToken != -1) {
    dispatch_once(&zoomFactorFormatter_onceToken, &__block_literal_global_29);
  }
  id v2 = (void *)zoomFactorFormatter_sharedFormatter;
  return (NSNumberFormatter *)v2;
}

uint64_t __36__CAMZoomButton_zoomFactorFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08A30]);
  uint64_t v1 = (void *)zoomFactorFormatter_sharedFormatter;
  zoomFactorFormatter_sharedFormatter = (uint64_t)v0;

  [(id)zoomFactorFormatter_sharedFormatter setGeneratesDecimalNumbers:1];
  [(id)zoomFactorFormatter_sharedFormatter setNumberStyle:1];
  [(id)zoomFactorFormatter_sharedFormatter setMinimumFractionDigits:0];
  [(id)zoomFactorFormatter_sharedFormatter setMaximumFractionDigits:1];
  [(id)zoomFactorFormatter_sharedFormatter setRoundingIncrement:&unk_26BDDF418];
  id v2 = (void *)zoomFactorFormatter_sharedFormatter;
  return [v2 setRoundingMode:2];
}

- (void)_updateZoomFactorLabelIfNeeded
{
  if (![(CAMZoomButton *)self contentType])
  {
    BOOL v3 = [(CAMZoomButton *)self abbreviateAndEnlargeText];
    id v4 = [(CAMZoomButton *)self _zoomFactorLabel];
    [(CAMZoomButton *)self zoomFactor];
    objc_msgSend(v4, "setZoomFactor:");
    [v4 setShowZoomFactorSymbol:!v3];
  }
}

+ (id)textForZoomFactor:(double)a3 showZoomFactorSymbol:(BOOL)a4
{
  return (id)[a1 textForZoomFactor:a4 showZoomFactorSymbol:1 useLeadingZero:a3];
}

+ (id)textForZoomFactor:(double)a3 showZoomFactorSymbol:(BOOL)a4 useLeadingZero:(BOOL)a5
{
  BOOL v5 = a5;
  double v8 = +[CAMZoomButton zoomFactorFormatter];
  double v9 = v8;
  uint64_t v10 = a3 >= 1.0 || v5;
  [v8 setMinimumIntegerDigits:v10];
  double v11 = [NSNumber numberWithDouble:a3];
  CGAffineTransform v12 = [v9 stringFromNumber:v11];

  if (a4)
  {
    double v13 = CAMLocalizedFrameworkString(@"ZOOM_FACTOR_SYMBOL", @"The multiplication symbol used for indicating zoom factor.");
    CGFloat v14 = CAMLocalizedFrameworkString(@"ZOOM_FACTOR_TEXT", 0);
    id v15 = [NSString stringWithValidatedFormat:v14, @"%@%@", 0, v12, v13 validFormatSpecifiers error];
  }
  else
  {
    id v15 = v12;
  }

  return v15;
}

- (void)setAbbreviateAndEnlargeText:(BOOL)a3
{
  if (self->_abbreviateAndEnlargeText != a3)
  {
    self->_abbreviateAndEnlargeText = a3;
    [(CAMZoomButton *)self _updateZoomFactorLabelIfNeeded];
    [(CAMZoomButton *)self setNeedsLayout];
  }
}

- (void)setUseLeadingZero:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CAMZoomButton *)self _zoomFactorLabel];
  [v4 setUseLeadingZero:v3];
}

- (BOOL)useLeadingZero
{
  id v2 = [(CAMZoomButton *)self _zoomFactorLabel];
  char v3 = [v2 useLeadingZero];

  return v3;
}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_orientation != a3)
  {
    BOOL v4 = a4;
    self->_orientation = a3;
    [(CAMZoomButton *)self setNeedsLayout];
    if (v4)
    {
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = __41__CAMZoomButton_setOrientation_animated___block_invoke;
      v6[3] = &unk_263FA0208;
      v6[4] = self;
      [MEMORY[0x263F82E00] animateWithDuration:2 delay:v6 options:0 animations:0.3 completion:0.0];
    }
  }
}

uint64_t __41__CAMZoomButton_setOrientation_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (id)_createBackgroundImageForContentSize:(id)a3
{
  BOOL v4 = (void *)MEMORY[0x263F825C8];
  id v5 = a3;
  float v6 = [v4 blackColor];
  float v7 = [(CAMZoomButton *)self _createBackgroundImageForContentSize:v5 color:v6];

  return v7;
}

- (id)_createBackgroundImageForContentSize:(id)a3 color:(id)a4
{
  id v6 = a4;
  [(CAMZoomButton *)self _backgroundImageDiameterForContentSize:a3];
  double width = v12.width;
  v12.height = v12.width;
  UIGraphicsBeginImageContextWithOptions(v12, 0, 0.0);
  double v8 = objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithOvalInRect:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), width, width);
  [v6 set];

  [v8 fill];
  double v9 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v9;
}

- (id)_createCircleImageForContentSize:(id)a3
{
  id v4 = a3;
  [(id)objc_opt_class() circleDiameterForContentSize:v4];
  CGFloat v6 = v5;
  [(CAMZoomButton *)self _circleLineWidthForContentSize:v4];
  double v8 = v7;

  v14.double width = v6;
  v14.height = v6;
  UIGraphicsBeginImageContextWithOptions(v14, 0, 0.0);
  double v9 = [MEMORY[0x263F825C8] whiteColor];
  [v9 set];
  v15.origin.x = *(CGFloat *)MEMORY[0x263F00148];
  v15.origin.y = *(CGFloat *)(MEMORY[0x263F00148] + 8);
  v15.size.double width = v6;
  v15.size.height = v6;
  CGRect v16 = CGRectInset(v15, v8 * 0.5, v8 * 0.5);
  uint64_t v10 = objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithOvalInRect:", v16.origin.x, v16.origin.y, v16.size.width, v16.size.height);
  [v10 setLineWidth:v8];
  [v10 stroke];
  double v11 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v11;
}

+ (BOOL)shouldUseLargeButtonSizeForContentSize:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:*MEMORY[0x263F83458]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x263F83488]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x263F83470]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x263F83468]] & 1) != 0)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    int v4 = [v3 isEqualToString:*MEMORY[0x263F83450]] ^ 1;
  }

  return v4;
}

- (double)_circleLineWidthForContentSize:(id)a3
{
  id v3 = [(CAMZoomButton *)self _circleImageView];
  if (v3) {
    double v4 = 1.0;
  }
  else {
    double v4 = 0.0;
  }

  return v4;
}

- (double)_backgroundImageDiameterForContentSize:(id)a3
{
  id v4 = a3;
  [(id)objc_opt_class() circleDiameterForContentSize:v4];
  double v6 = v5;
  [(CAMZoomButton *)self _circleLineWidthForContentSize:v4];
  double v8 = v7;

  return v6 + (v8 - CAMPixelWidthForView(self)) * -2.0;
}

- (CAMZoomButtonDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CAMZoomButtonDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)contentType
{
  return self->_contentType;
}

- (double)zoomFactor
{
  return self->_zoomFactor;
}

- (int64_t)zoomSymbol
{
  return self->_zoomSymbol;
}

- (int64_t)focalLength
{
  return self->_focalLength;
}

- (int64_t)accessoryState
{
  return self->_accessoryState;
}

- (int64_t)accessoryPosition
{
  return self->_accessoryPosition;
}

- (UIEdgeInsets)tappableEdgeInsets
{
  double top = self->_tappableEdgeInsets.top;
  double left = self->_tappableEdgeInsets.left;
  bottoCGAffineTransform m = self->_tappableEdgeInsets.bottom;
  double right = self->_tappableEdgeInsets.right;
  result.double right = right;
  result.bottoCGAffineTransform m = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

- (BOOL)shouldHideBackground
{
  return self->_shouldHideBackground;
}

- (BOOL)isOverPlatter
{
  return self->_overPlatter;
}

- (CGAffineTransform)highlightingTransform
{
  long long v3 = *(_OWORD *)&self[13].c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[13].a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[13].tx;
  return self;
}

- (BOOL)abbreviateAndEnlargeText
{
  return self->_abbreviateAndEnlargeText;
}

- (UIView)_contentContainerView
{
  return self->__contentContainerView;
}

- (CAMZoomFactorLabel)_zoomFactorLabel
{
  return self->__zoomFactorLabel;
}

- (UIImageView)_zoomSymbolView
{
  return self->__zoomSymbolView;
}

- (CAMFocalLengthLabel)_focalLengthLabel
{
  return self->__focalLengthLabel;
}

- (void)set_focalLengthLabel:(id)a3
{
}

- (UIImageView)_circleImageView
{
  return self->__circleImageView;
}

- (UIImageView)_backgroundImageView
{
  return self->__backgroundImageView;
}

- (UIImageView)_accessoryBackgroundView
{
  return self->__accessoryBackgroundView;
}

- (void)set_accessoryBackgroundView:(id)a3
{
}

- (UIImageView)_accessoryImageView
{
  return self->__accessoryImageView;
}

- (void)set_accessoryImageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__accessoryImageView, 0);
  objc_storeStrong((id *)&self->__accessoryBackgroundView, 0);
  objc_storeStrong((id *)&self->__backgroundImageView, 0);
  objc_storeStrong((id *)&self->__circleImageView, 0);
  objc_storeStrong((id *)&self->__focalLengthLabel, 0);
  objc_storeStrong((id *)&self->__zoomSymbolView, 0);
  objc_storeStrong((id *)&self->__zoomFactorLabel, 0);
  objc_storeStrong((id *)&self->__contentContainerView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end