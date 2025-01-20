@interface AVTFunCamAvatarPickerCollectionViewCell
+ (CGPath)selectionPathInBounds:(CGRect)a3;
+ (id)cellIdentifier;
- (AVTFunCamAvatarPickerCollectionViewCell)initWithFrame:(CGRect)a3;
- (AVTUIAnimatingImageView)imageView;
- (BOOL)roundImageCorners;
- (BOOL)selectionVisible;
- (BOOL)showsTitle;
- (CAShapeLayer)selectionLayer;
- (CGSize)engagedSize;
- (NSUUID)displaySessionUUID;
- (UIButton)accessoryButton;
- (id)imageInsetProvider;
- (int64_t)imageContentMode;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAccessoryButton:(id)a3;
- (void)setDisplaySessionUUID:(id)a3;
- (void)setEngagedSize:(CGSize)a3;
- (void)setImageContentMode:(int64_t)a3;
- (void)setImageInsetProvider:(id)a3;
- (void)setImageZoomFactor:(double)a3;
- (void)setRoundImageCorners:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSelectionVisible:(BOOL)a3;
- (void)setShowsTitle:(BOOL)a3;
- (void)updateSelectionLayer;
- (void)updateWithImage:(id)a3 animated:(BOOL)a4;
- (void)updateWithTintColor:(id)a3;
@end

@implementation AVTFunCamAvatarPickerCollectionViewCell

+ (id)cellIdentifier
{
  return @"AVTFunCamAvatarPickerCollectionViewCell";
}

+ (CGPath)selectionPathInBounds:(CGRect)a3
{
  CGRect v6 = CGRectInset(a3, 1.5, 1.5);
  objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithRoundedRect:cornerRadius:", v6.origin.x, v6.origin.y, v6.size.width, v6.size.height, 12.0);
  id v3 = objc_claimAutoreleasedReturnValue();
  v4 = (CGPath *)[v3 CGPath];

  return v4;
}

- (AVTFunCamAvatarPickerCollectionViewCell)initWithFrame:(CGRect)a3
{
  v22.receiver = self;
  v22.super_class = (Class)AVTFunCamAvatarPickerCollectionViewCell;
  id v3 = -[AVTFunCamAvatarPickerCollectionViewCell initWithFrame:](&v22, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x263F15880]);
    v5 = objc_opt_class();
    CGRect v6 = [(AVTFunCamAvatarPickerCollectionViewCell *)v3 contentView];
    [v6 bounds];
    -[CAShapeLayer setPath:](v4, "setPath:", objc_msgSend(v5, "selectionPathInBounds:"));

    id v7 = [MEMORY[0x263F1C550] colorWithWhite:1.0 alpha:0.3];
    -[CAShapeLayer setStrokeColor:](v4, "setStrokeColor:", [v7 CGColor]);

    [(CAShapeLayer *)v4 setLineWidth:3.0];
    id v8 = [MEMORY[0x263F1C550] clearColor];
    -[CAShapeLayer setFillColor:](v4, "setFillColor:", [v8 CGColor]);

    selectionLayer = v3->_selectionLayer;
    v3->_selectionLayer = v4;
    v10 = v4;

    v11 = [(AVTFunCamAvatarPickerCollectionViewCell *)v3 contentView];
    v12 = [v11 layer];
    [v12 addSublayer:v10];

    v13 = [AVTUIAnimatingImageView alloc];
    v14 = [(AVTFunCamAvatarPickerCollectionViewCell *)v3 contentView];
    [v14 bounds];
    v15 = -[AVTUIAnimatingImageView initWithFrame:](v13, "initWithFrame:");

    v16 = [(AVTFunCamAvatarPickerCollectionViewCell *)v3 contentView];
    [v16 addSubview:v15];

    imageView = v3->_imageView;
    v3->_imageView = v15;
    v18 = v15;

    uint64_t v19 = +[AVTFunCamAvatarPickerStyle insetProviderForConstant:0.0];
    id imageInsetProvider = v3->_imageInsetProvider;
    v3->_id imageInsetProvider = (id)v19;
  }
  return v3;
}

- (void)layoutSubviews
{
  v36.receiver = self;
  v36.super_class = (Class)AVTFunCamAvatarPickerCollectionViewCell;
  [(AVTFunCamAvatarPickerCollectionViewCell *)&v36 layoutSubviews];
  id v3 = objc_opt_class();
  v4 = [(AVTFunCamAvatarPickerCollectionViewCell *)self contentView];
  [v4 bounds];
  uint64_t v5 = objc_msgSend(v3, "selectionPathInBounds:");
  CGRect v6 = [(AVTFunCamAvatarPickerCollectionViewCell *)self selectionLayer];
  [v6 setPath:v5];

  [(AVTFunCamAvatarPickerCollectionViewCell *)self updateSelectionLayer];
  id v7 = [(AVTFunCamAvatarPickerCollectionViewCell *)self contentView];
  [v7 bounds];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  double v15 = v14;

  if ([(AVTFunCamAvatarPickerCollectionViewCell *)self showsTitle]) {
    double v15 = v15 + -14.0;
  }
  v16 = [(AVTFunCamAvatarPickerCollectionViewCell *)self imageInsetProvider];
  uint64_t v17 = [(AVTFunCamAvatarPickerCollectionViewCell *)self contentView];
  [(id)v17 bounds];
  CGFloat Width = CGRectGetWidth(v37);
  CGFloat v19 = v16[2](v16, Width);

  v38.origin.x = v9;
  v38.origin.y = v11;
  v38.size.width = v13;
  v38.size.double height = v15;
  CGRect v39 = CGRectInset(v38, v19, v19);
  double v20 = v39.size.width;
  double height = v39.size.height;
  double v22 = *MEMORY[0x263F00148];
  double v23 = *(double *)(MEMORY[0x263F00148] + 8);
  UIRectGetCenter();
  double v25 = v24;
  double v27 = v26;
  v28 = [(AVTFunCamAvatarPickerCollectionViewCell *)self imageView];
  [v28 bounds];
  v41.origin.x = v22;
  v41.origin.y = v23;
  v41.size.width = v20;
  v41.size.double height = height;
  LOBYTE(v17) = CGRectEqualToRect(v40, v41);

  if ((v17 & 1) == 0)
  {
    v29 = [(AVTFunCamAvatarPickerCollectionViewCell *)self imageView];
    objc_msgSend(v29, "setBounds:", v22, v23, v20, height);
  }
  v30 = [(AVTFunCamAvatarPickerCollectionViewCell *)self imageView];
  [v30 center];
  double v32 = v31;
  double v34 = v33;

  if (v32 != v25 || v34 != v27)
  {
    v35 = [(AVTFunCamAvatarPickerCollectionViewCell *)self imageView];
    objc_msgSend(v35, "setCenter:", v25, v27);
  }
}

- (void)updateWithImage:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(AVTFunCamAvatarPickerCollectionViewCell *)self imageView];
  [v7 setImage:v6 animated:v4];
}

- (void)updateWithTintColor:(id)a3
{
  id v4 = a3;
  id v5 = [(AVTFunCamAvatarPickerCollectionViewCell *)self imageView];
  [v5 setTintColor:v4];
}

- (void)setSelectionVisible:(BOOL)a3
{
  if (self->_selectionVisible != a3)
  {
    self->_selectionVisible = a3;
    [(AVTFunCamAvatarPickerCollectionViewCell *)self updateSelectionLayer];
  }
}

- (void)setImageInsetProvider:(id)a3
{
  if (self->_imageInsetProvider != a3)
  {
    id v4 = (void *)[a3 copy];
    id imageInsetProvider = self->_imageInsetProvider;
    self->_id imageInsetProvider = v4;

    [(AVTFunCamAvatarPickerCollectionViewCell *)self setNeedsLayout];
  }
}

- (void)setImageZoomFactor:(double)a3
{
  if (a3 == 1.0)
  {
    id v4 = [(AVTFunCamAvatarPickerCollectionViewCell *)self imageView];
    id v5 = v4;
    long long v6 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    v10[0] = *MEMORY[0x263F000D0];
    v10[1] = v6;
    v10[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    id v7 = (CGAffineTransform *)v10;
  }
  else
  {
    CGAffineTransformMakeScale(&v9, a3, a3);
    id v4 = [(AVTFunCamAvatarPickerCollectionViewCell *)self imageView];
    id v5 = v4;
    CGAffineTransform v8 = v9;
    id v7 = &v8;
  }
  objc_msgSend(v4, "setTransform:", v7, *(_OWORD *)&v8.a, *(_OWORD *)&v8.c, *(_OWORD *)&v8.tx);
}

- (void)setImageContentMode:(int64_t)a3
{
  if (self->_imageContentMode != a3)
  {
    self->_imageContentMode = a3;
    id v4 = [(AVTFunCamAvatarPickerCollectionViewCell *)self imageView];
    [v4 setContentMode:a3];
  }
}

- (void)setRoundImageCorners:(BOOL)a3
{
  if (self->_roundImageCorners != a3)
  {
    self->_roundImageCorners = a3;
    id v4 = [(AVTFunCamAvatarPickerCollectionViewCell *)self imageView];
    id v6 = v4;
    double v5 = 6.0;
    if (!self->_roundImageCorners) {
      double v5 = 0.0;
    }
    [v4 setContinuousCornerRadius:v5];
  }
}

- (void)setSelected:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AVTFunCamAvatarPickerCollectionViewCell;
  [(AVTFunCamAvatarPickerCollectionViewCell *)&v4 setSelected:a3];
  [(AVTFunCamAvatarPickerCollectionViewCell *)self updateSelectionLayer];
}

- (void)updateSelectionLayer
{
  float v3 = 0.0;
  if ([(AVTFunCamAvatarPickerCollectionViewCell *)self selectionVisible])
  {
    if ([(AVTFunCamAvatarPickerCollectionViewCell *)self isSelected]) {
      float v3 = 1.0;
    }
    else {
      float v3 = 0.0;
    }
  }
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  objc_super v4 = [(AVTFunCamAvatarPickerCollectionViewCell *)self selectionLayer];
  *(float *)&double v5 = v3;
  [v4 setOpacity:v5];

  id v6 = (void *)MEMORY[0x263F158F8];
  [v6 commit];
}

- (void)prepareForReuse
{
  v8.receiver = self;
  v8.super_class = (Class)AVTFunCamAvatarPickerCollectionViewCell;
  [(AVTFunCamAvatarPickerCollectionViewCell *)&v8 prepareForReuse];
  [(AVTFunCamAvatarPickerCollectionViewCell *)self setImageZoomFactor:1.0];
  float v3 = [(AVTFunCamAvatarPickerCollectionViewCell *)self imageView];
  [v3 setImage:0];

  objc_super v4 = +[AVTFunCamAvatarPickerStyle insetProviderForConstant:0.0];
  [(AVTFunCamAvatarPickerCollectionViewCell *)self setImageInsetProvider:v4];

  double v5 = [(AVTFunCamAvatarPickerCollectionViewCell *)self imageView];
  id v6 = [v5 tintColor];

  if (v6)
  {
    id v7 = [(AVTFunCamAvatarPickerCollectionViewCell *)self imageView];
    [v7 setTintColor:0];
  }
}

- (NSUUID)displaySessionUUID
{
  return self->_displaySessionUUID;
}

- (void)setDisplaySessionUUID:(id)a3
{
}

- (id)imageInsetProvider
{
  return self->_imageInsetProvider;
}

- (int64_t)imageContentMode
{
  return self->_imageContentMode;
}

- (BOOL)selectionVisible
{
  return self->_selectionVisible;
}

- (BOOL)roundImageCorners
{
  return self->_roundImageCorners;
}

- (BOOL)showsTitle
{
  return self->_showsTitle;
}

- (void)setShowsTitle:(BOOL)a3
{
  self->_showsTitle = a3;
}

- (CGSize)engagedSize
{
  double width = self->_engagedSize.width;
  double height = self->_engagedSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setEngagedSize:(CGSize)a3
{
  self->_engagedSize = a3;
}

- (AVTUIAnimatingImageView)imageView
{
  return self->_imageView;
}

- (UIButton)accessoryButton
{
  return self->_accessoryButton;
}

- (void)setAccessoryButton:(id)a3
{
}

- (CAShapeLayer)selectionLayer
{
  return self->_selectionLayer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionLayer, 0);
  objc_storeStrong((id *)&self->_accessoryButton, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong(&self->_imageInsetProvider, 0);
  objc_storeStrong((id *)&self->_displaySessionUUID, 0);
}

@end