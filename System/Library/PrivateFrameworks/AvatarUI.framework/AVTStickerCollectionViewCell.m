@interface AVTStickerCollectionViewCell
+ (CGPath)selectionPathInBounds:(CGRect)a3;
+ (double)imageInsetForWidth:(double)a3;
+ (id)cellIdentifier;
- (AVTMSStickerView)stickerView;
- (AVTStickerCollectionViewCell)initWithFrame:(CGRect)a3;
- (AVTStickerCollectionViewCellDelegate)delegate;
- (AVTStickerDisclosureValidationDelegate)disclosureValidationDelegate;
- (BOOL)allowsPeel;
- (BOOL)showPrereleaseSticker;
- (BOOL)showSelectionLayer;
- (BOOL)stickerViewIsAnimating;
- (CAShapeLayer)selectionLayer;
- (CGRect)clippingRect;
- (CGRect)stickerViewFrameForImageSize:(CGSize)a3 clippingRect:(CGRect)a4;
- (CGSize)fullImageSize;
- (CGSize)imageSizeFromURL:(id)a3;
- (NSUUID)displaySessionUUID;
- (UIImageView)imageView;
- (UILabel)prereleaseLabel;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)purgeImageContents;
- (void)setAllowsPeel:(BOOL)a3;
- (void)setClippingRect:(CGRect)a3;
- (void)setDelegate:(id)a3;
- (void)setDisclosureValidationDelegate:(id)a3;
- (void)setDisplaySessionUUID:(id)a3;
- (void)setFullImageSize:(CGSize)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSelectionLayer:(id)a3;
- (void)setShowPrereleaseSticker:(BOOL)a3;
- (void)setShowSelectionLayer:(BOOL)a3;
- (void)setStickerViewIsAnimating:(BOOL)a3;
- (void)setupPrereleaseLabelIfNeeded;
- (void)stickerViewDidBeginPeel:(id)a3;
- (void)stickerViewWasTapped:(id)a3;
- (void)updateWithImage:(id)a3 sticker:(id)a4 animated:(BOOL)a5;
@end

@implementation AVTStickerCollectionViewCell

+ (id)cellIdentifier
{
  return @"AVTStickerCollectionViewCell";
}

+ (double)imageInsetForWidth:(double)a3
{
  BOOL v3 = a3 <= 120.0;
  double result = 5.0;
  if (!v3) {
    return 20.0;
  }
  return result;
}

+ (CGPath)selectionPathInBounds:(CGRect)a3
{
  CGRect v6 = CGRectInset(a3, 6.0, 6.0);
  objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithRoundedRect:cornerRadius:", v6.origin.x, v6.origin.y, v6.size.width, v6.size.height, 16.0);
  id v3 = objc_claimAutoreleasedReturnValue();
  v4 = (CGPath *)[v3 CGPath];

  return v4;
}

- (AVTStickerCollectionViewCell)initWithFrame:(CGRect)a3
{
  double width = a3.size.width;
  v41.receiver = self;
  v41.super_class = (Class)AVTStickerCollectionViewCell;
  v4 = -[AVTStickerCollectionViewCell initWithFrame:](&v41, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  if (v4)
  {
    CGRect v6 = [(AVTStickerCollectionViewCell *)v4 contentView];
    v7 = [v6 layer];
    [v7 setCornerRadius:12.0];

    v8 = [(AVTStickerCollectionViewCell *)v5 contentView];
    [v8 setClipsToBounds:1];

    [(id)objc_opt_class() imageInsetForWidth:width];
    CGFloat v10 = v9;
    v11 = [(AVTStickerCollectionViewCell *)v5 contentView];
    [v11 bounds];
    CGRect v43 = CGRectInset(v42, v10, v10);
    double x = v43.origin.x;
    double y = v43.origin.y;
    double v14 = v43.size.width;
    double height = v43.size.height;

    v16 = objc_msgSend(objc_alloc(MEMORY[0x263F1C6D0]), "initWithFrame:", x, y, v14, height);
    [v16 setAlpha:0.0];
    [v16 setContentMode:1];
    [v16 setAutoresizingMask:18];
    v17 = +[AVTUIColorRepository stickerPlaceholderBackgroundColor];
    [v16 setTintColor:v17];

    v18 = [(AVTStickerCollectionViewCell *)v5 contentView];
    [v18 addSubview:v16];

    objc_storeStrong((id *)&v5->_imageView, v16);
    v19 = [AVTMSStickerView alloc];
    v20 = [(AVTStickerCollectionViewCell *)v5 contentView];
    [v20 bounds];
    v21 = -[AVTMSStickerView initWithFrame:](v19, "initWithFrame:");

    [(AVTMSStickerView *)v21 setDelegate:v5];
    [(AVTMSStickerView *)v21 setAlpha:0.0];
    v22 = [MEMORY[0x263F1C550] clearColor];
    [(AVTMSStickerView *)v21 setBackgroundColor:v22];

    [(AVTMSStickerView *)v21 setAutoresizingMask:18];
    if (objc_opt_respondsToSelector())
    {
      objc_initWeak(&location, v5);
      uint64_t v35 = MEMORY[0x263EF8330];
      uint64_t v36 = 3221225472;
      v37 = __46__AVTStickerCollectionViewCell_initWithFrame___block_invoke;
      v38 = &unk_263FF0BD8;
      objc_copyWeak(&v39, &location);
      [(MSStickerView *)v21 setDragPreviewLiftContainerProvider:&v35];
      objc_destroyWeak(&v39);
      objc_destroyWeak(&location);
    }
    v23 = [(AVTStickerCollectionViewCell *)v5 contentView];
    [v23 addSubview:v21];

    stickerView = v5->_stickerView;
    v5->_stickerView = v21;
    v25 = v21;

    CGSize v26 = *(CGSize *)(MEMORY[0x263F001A8] + 16);
    v5->_clippingRect.origin = (CGPoint)*MEMORY[0x263F001A8];
    v5->_clippingRect.size = v26;
    v27 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x263F15880]);
    id v28 = [MEMORY[0x263F1C550] systemGray3Color];
    -[CAShapeLayer setStrokeColor:](v27, "setStrokeColor:", [v28 CGColor]);

    [(CAShapeLayer *)v27 setLineWidth:3.0];
    id v29 = [MEMORY[0x263F1C550] clearColor];
    -[CAShapeLayer setFillColor:](v27, "setFillColor:", [v29 CGColor]);

    [(CAShapeLayer *)v27 setHidden:1];
    selectionLayer = v5->_selectionLayer;
    v5->_selectionLayer = v27;
    v31 = v27;

    v32 = [(AVTStickerCollectionViewCell *)v5 contentView];
    v33 = [v32 layer];
    [v33 addSublayer:v31];
  }
  return v5;
}

id __46__AVTStickerCollectionViewCell_initWithFrame___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained delegate];
  if (v2 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v3 = [v2 dragPreviewContainerForLiftingStickerInStickerCell:WeakRetained];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (BOOL)allowsPeel
{
  return [(AVTMSStickerView *)self->_stickerView allowsPeel];
}

- (void)setAllowsPeel:(BOOL)a3
{
}

- (void)setShowPrereleaseSticker:(BOOL)a3
{
  if (self->_showPrereleaseSticker != a3)
  {
    BOOL v3 = a3;
    self->_showPrereleaseSticker = a3;
    if (a3) {
      [(AVTStickerCollectionViewCell *)self setupPrereleaseLabelIfNeeded];
    }
    id v5 = [(AVTStickerCollectionViewCell *)self prereleaseLabel];
    [v5 setHidden:!v3];
  }
}

- (void)setupPrereleaseLabelIfNeeded
{
  BOOL v3 = [(AVTStickerCollectionViewCell *)self prereleaseLabel];

  if (!v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F1C768]);
    [(AVTStickerCollectionViewCell *)self bounds];
    double v6 = v5 + -15.0;
    [(AVTStickerCollectionViewCell *)self bounds];
    v7 = (UILabel *)objc_msgSend(v4, "initWithFrame:", 0.0, v6);
    [(UILabel *)v7 setAutoresizingMask:10];
    v8 = AVTAvatarUIBundle();
    double v9 = [v8 localizedStringForKey:@"STICKER_PRERELEASE" value:&stru_26BF058D0 table:@"Localized"];
    [(UILabel *)v7 setText:v9];

    [(UILabel *)v7 setUserInteractionEnabled:0];
    [(UILabel *)v7 setTextAlignment:1];
    [(UILabel *)v7 setAdjustsFontSizeToFitWidth:1];
    CGFloat v10 = [MEMORY[0x263F1C550] systemRedColor];
    [(UILabel *)v7 setTextColor:v10];

    v11 = [(AVTStickerCollectionViewCell *)self contentView];
    [v11 addSubview:v7];

    prereleaseLabel = self->_prereleaseLabel;
    self->_prereleaseLabel = v7;
  }
}

- (AVTStickerDisclosureValidationDelegate)disclosureValidationDelegate
{
  v2 = [(AVTStickerCollectionViewCell *)self stickerView];
  BOOL v3 = [v2 disclosureValidationDelegate];

  return (AVTStickerDisclosureValidationDelegate *)v3;
}

- (void)setDisclosureValidationDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(AVTStickerCollectionViewCell *)self stickerView];
  [v5 setDisclosureValidationDelegate:v4];
}

- (void)setClippingRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_clippingRect = &self->_clippingRect;
  if (!CGRectEqualToRect(a3, self->_clippingRect))
  {
    p_clippingRect->origin.CGFloat x = x;
    p_clippingRect->origin.CGFloat y = y;
    p_clippingRect->size.CGFloat width = width;
    p_clippingRect->size.CGFloat height = height;
    [(AVTStickerCollectionViewCell *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  v36.receiver = self;
  v36.super_class = (Class)AVTStickerCollectionViewCell;
  [(AVTStickerCollectionViewCell *)&v36 layoutSubviews];
  BOOL v3 = [(AVTStickerCollectionViewCell *)self stickerView];

  if (v3)
  {
    [(AVTStickerCollectionViewCell *)self fullImageSize];
    double v5 = v4;
    double v7 = v6;
    [(AVTStickerCollectionViewCell *)self clippingRect];
    -[AVTStickerCollectionViewCell stickerViewFrameForImageSize:clippingRect:](self, "stickerViewFrameForImageSize:clippingRect:", v5, v7, v8, v9, v10, v11);
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    v20 = [(AVTStickerCollectionViewCell *)self stickerView];
    objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);

    id v21 = [MEMORY[0x263F1C550] systemGray3Color];
    uint64_t v22 = [v21 CGColor];
    v23 = [(AVTStickerCollectionViewCell *)self selectionLayer];
    [v23 setStrokeColor:v22];

    v24 = objc_opt_class();
    v25 = [(AVTStickerCollectionViewCell *)self contentView];
    [v25 bounds];
    uint64_t v26 = objc_msgSend(v24, "selectionPathInBounds:");
    v27 = [(AVTStickerCollectionViewCell *)self selectionLayer];
    [v27 setPath:v26];

    if ([(AVTStickerCollectionViewCell *)self showSelectionLayer])
    {
      [(AVTStickerCollectionViewCell *)self frame];
      if (v28 <= 120.0) {
        double v29 = 10.0;
      }
      else {
        double v29 = 20.0;
      }
      v30 = [(AVTStickerCollectionViewCell *)self contentView];
      [v30 bounds];
      CGRect v38 = CGRectInset(v37, v29, v29);
      double x = v38.origin.x;
      double y = v38.origin.y;
      double width = v38.size.width;
      double height = v38.size.height;

      uint64_t v35 = [(AVTStickerCollectionViewCell *)self imageView];
      objc_msgSend(v35, "setFrame:", x, y, width, height);
    }
  }
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)AVTStickerCollectionViewCell;
  -[AVTStickerCollectionViewCell setSelected:](&v6, sel_setSelected_);
  if ([(AVTStickerCollectionViewCell *)self showSelectionLayer])
  {
    double v5 = [(AVTStickerCollectionViewCell *)self selectionLayer];
    [v5 setHidden:!v3];
  }
}

- (CGRect)stickerViewFrameForImageSize:(CGSize)a3 clippingRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v9 = [(AVTStickerCollectionViewCell *)self contentView];
  [v9 frame];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  v27.origin.double x = x;
  v27.origin.double y = y;
  v27.size.double width = width;
  v27.size.double height = height;
  if (!CGRectIsEmpty(v27))
  {
    [(AVTStickerCollectionViewCell *)self fullImageSize];
    if (v19 != *MEMORY[0x263F001B0] || v18 != *(double *)(MEMORY[0x263F001B0] + 8))
    {
      [(AVTStickerCollectionViewCell *)self fullImageSize];
      double v11 = -(x * (v15 / width));
      double v13 = -(y * (v17 / height));
      double v15 = v15 / width * v21;
      double v17 = v17 / height * v22;
    }
  }
  double v23 = v11;
  double v24 = v13;
  double v25 = v15;
  double v26 = v17;
  result.size.double height = v26;
  result.size.double width = v25;
  result.origin.double y = v24;
  result.origin.double x = v23;
  return result;
}

- (CGSize)imageSizeFromURL:(id)a3
{
  BOOL v3 = CGImageSourceCreateWithURL((CFURLRef)a3, 0);
  if (v3 && (v4 = v3, CFDictionaryRef v5 = CGImageSourceCopyPropertiesAtIndex(v3, 0, 0), CFRelease(v4), v5))
  {
    uint64_t v6 = *MEMORY[0x263F0F4F0];
    CFDictionaryRef v7 = v5;
    double v8 = [(__CFDictionary *)v7 valueForKey:v6];
    [v8 floatValue];
    double v10 = v9;

    double v11 = [(__CFDictionary *)v7 valueForKey:*MEMORY[0x263F0F4F8]];
    [v11 floatValue];
    double v13 = v12;

    CFRelease(v7);
  }
  else
  {
    double v13 = *MEMORY[0x263F001B0];
    double v10 = *(double *)(MEMORY[0x263F001B0] + 8);
  }
  double v14 = v13;
  double v15 = v10;
  result.double height = v15;
  result.double width = v14;
  return result;
}

- (void)updateWithImage:(id)a3 sticker:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    double v10 = [(AVTStickerCollectionViewCell *)self stickerView];
    id v11 = [v10 sticker];

    if (v11 == v9) {
      goto LABEL_12;
    }
    float v12 = [(AVTStickerCollectionViewCell *)self layer];
    [v12 removeAllAnimations];

    if (v8)
    {
      [v8 size];
      double v14 = v13;
      [v8 scale];
      double v16 = v14 * v15;
      [v8 size];
      double v18 = v17;
      [v8 scale];
      -[AVTStickerCollectionViewCell setFullImageSize:](self, "setFullImageSize:", v16, v18 * v19);
    }
    else
    {
      double v22 = [v9 imageFileURL];
      [(AVTStickerCollectionViewCell *)self imageSizeFromURL:v22];
      -[AVTStickerCollectionViewCell setFullImageSize:](self, "setFullImageSize:");
    }
    double v23 = [(AVTStickerCollectionViewCell *)self stickerView];
    [v23 setHidden:0];

    double v24 = [(AVTStickerCollectionViewCell *)self stickerView];
    [v24 setSticker:v9];

    [(AVTStickerCollectionViewCell *)self setNeedsLayout];
  }
  else
  {
    v20 = [(AVTStickerCollectionViewCell *)self layer];
    [v20 removeAllAnimations];

    if (v8)
    {
      double v21 = [(AVTStickerCollectionViewCell *)self imageView];
      [v21 setImage:v8];
    }
  }
  uint64_t v25 = [(AVTStickerCollectionViewCell *)self stickerViewIsAnimating] | v5;
  [(AVTStickerCollectionViewCell *)self setStickerViewIsAnimating:v25];
  double v26 = 0.3;
  if (!v25) {
    double v26 = 0.0;
  }
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __65__AVTStickerCollectionViewCell_updateWithImage_sticker_animated___block_invoke;
  v28[3] = &unk_263FF0C00;
  v28[4] = self;
  BOOL v29 = v9 != 0;
  BOOL v30 = v8 != 0;
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __65__AVTStickerCollectionViewCell_updateWithImage_sticker_animated___block_invoke_2;
  v27[3] = &unk_263FF04A0;
  v27[4] = self;
  [MEMORY[0x263F1CB60] animateWithDuration:v28 animations:v27 completion:v26];
LABEL_12:
}

void __65__AVTStickerCollectionViewCell_updateWithImage_sticker_animated___block_invoke(uint64_t a1)
{
  double v2 = 0.0;
  if (*(unsigned char *)(a1 + 40)) {
    double v3 = 1.0;
  }
  else {
    double v3 = 0.0;
  }
  double v4 = [*(id *)(a1 + 32) stickerView];
  [v4 setAlpha:v3];

  if (!*(unsigned char *)(a1 + 40))
  {
    if (*(unsigned char *)(a1 + 41)) {
      double v2 = 1.0;
    }
    else {
      double v2 = 0.0;
    }
  }
  id v5 = [*(id *)(a1 + 32) imageView];
  [v5 setAlpha:v2];
}

void __65__AVTStickerCollectionViewCell_updateWithImage_sticker_animated___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) setStickerViewIsAnimating:0];
    double v3 = [*(id *)(a1 + 32) stickerView];
    [v3 alpha];
    BOOL v5 = v4 == 0.0;
    uint64_t v6 = [*(id *)(a1 + 32) stickerView];
    [v6 setHidden:v5];

    CFDictionaryRef v7 = [*(id *)(a1 + 32) imageView];
    [v7 alpha];
    double v9 = v8;

    if (v9 == 0.0)
    {
      double v10 = [*(id *)(a1 + 32) imageView];
      [v10 setHidden:1];

      id v11 = [*(id *)(a1 + 32) imageView];
      [v11 setImage:0];
    }
  }
}

- (void)purgeImageContents
{
  double v3 = [(AVTStickerCollectionViewCell *)self imageView];
  [v3 setImage:0];

  id v4 = [(AVTStickerCollectionViewCell *)self stickerView];
  [v4 setSticker:0];
}

- (void)prepareForReuse
{
  v9.receiver = self;
  v9.super_class = (Class)AVTStickerCollectionViewCell;
  [(AVTStickerCollectionViewCell *)&v9 prepareForReuse];
  double v3 = [(AVTStickerCollectionViewCell *)self imageView];
  [v3 setHidden:0];

  id v4 = [(AVTStickerCollectionViewCell *)self imageView];
  [v4 setImage:0];

  BOOL v5 = [(AVTStickerCollectionViewCell *)self imageView];
  [v5 setAlpha:0.0];

  -[AVTStickerCollectionViewCell setClippingRect:](self, "setClippingRect:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  -[AVTStickerCollectionViewCell setFullImageSize:](self, "setFullImageSize:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
  uint64_t v6 = [(AVTStickerCollectionViewCell *)self stickerView];
  [v6 setSticker:0];

  CFDictionaryRef v7 = [(AVTStickerCollectionViewCell *)self stickerView];
  [v7 setHidden:1];

  double v8 = [(AVTStickerCollectionViewCell *)self stickerView];
  [v8 setAlpha:0.0];
}

- (void)stickerViewDidBeginPeel:(id)a3
{
  id v4 = [(AVTStickerCollectionViewCell *)self delegate];

  if (v4)
  {
    id v5 = [(AVTStickerCollectionViewCell *)self delegate];
    [v5 stickerCellDidPeelSticker:self];
  }
}

- (void)stickerViewWasTapped:(id)a3
{
  id v4 = [(AVTStickerCollectionViewCell *)self delegate];

  if (v4)
  {
    id v5 = [(AVTStickerCollectionViewCell *)self delegate];
    [v5 stickerCellDidTapSticker:self];
  }
}

- (NSUUID)displaySessionUUID
{
  return self->_displaySessionUUID;
}

- (void)setDisplaySessionUUID:(id)a3
{
}

- (CGRect)clippingRect
{
  double x = self->_clippingRect.origin.x;
  double y = self->_clippingRect.origin.y;
  double width = self->_clippingRect.size.width;
  double height = self->_clippingRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)showPrereleaseSticker
{
  return self->_showPrereleaseSticker;
}

- (BOOL)showSelectionLayer
{
  return self->_showSelectionLayer;
}

- (void)setShowSelectionLayer:(BOOL)a3
{
  self->_showSelectionLayer = a3;
}

- (AVTStickerCollectionViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AVTStickerCollectionViewCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (AVTMSStickerView)stickerView
{
  return self->_stickerView;
}

- (UILabel)prereleaseLabel
{
  return self->_prereleaseLabel;
}

- (BOOL)stickerViewIsAnimating
{
  return self->_stickerViewIsAnimating;
}

- (void)setStickerViewIsAnimating:(BOOL)a3
{
  self->_stickerViewIsAnimating = a3;
}

- (CGSize)fullImageSize
{
  double width = self->_fullImageSize.width;
  double height = self->_fullImageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setFullImageSize:(CGSize)a3
{
  self->_fullImageSize = a3;
}

- (CAShapeLayer)selectionLayer
{
  return self->_selectionLayer;
}

- (void)setSelectionLayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionLayer, 0);
  objc_storeStrong((id *)&self->_prereleaseLabel, 0);
  objc_storeStrong((id *)&self->_stickerView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_displaySessionUUID, 0);
}

@end