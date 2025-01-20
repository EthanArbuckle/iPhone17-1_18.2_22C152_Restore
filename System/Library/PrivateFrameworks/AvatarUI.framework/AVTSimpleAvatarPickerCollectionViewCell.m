@interface AVTSimpleAvatarPickerCollectionViewCell
+ (CGPath)selectionPathInBounds:(CGRect)a3;
+ (double)imageInsetForInsetSize:(unint64_t)a3;
+ (id)cellIdentifier;
- (AVTSimpleAvatarPickerCollectionViewCell)initWithFrame:(CGRect)a3;
- (AVTUIAnimatingImageView)imageView;
- (BOOL)shouldShowSelectionLayer;
- (BOOL)showSelectedState;
- (NSUUID)displaySessionUUID;
- (UIView)selectionLayer;
- (unint64_t)imageInsetSize;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setDisplaySessionUUID:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setImageInsetSize:(unint64_t)a3;
- (void)setSelected:(BOOL)a3;
- (void)setShowSelectedState:(BOOL)a3;
- (void)updateHighlightedState:(BOOL)a3 animated:(BOOL)a4;
- (void)updateSelectionLayerOpacityAnimated:(BOOL)a3;
- (void)updateWithImage:(id)a3 animated:(BOOL)a4;
@end

@implementation AVTSimpleAvatarPickerCollectionViewCell

+ (id)cellIdentifier
{
  return @"AVTSimpleAvatarPickerCollectionViewCell";
}

+ (CGPath)selectionPathInBounds:(CGRect)a3
{
  objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithRoundedRect:cornerRadius:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, 12.0);
  id v3 = objc_claimAutoreleasedReturnValue();
  v4 = (CGPath *)[v3 CGPath];

  return v4;
}

+ (double)imageInsetForInsetSize:(unint64_t)a3
{
  double result = 0.0;
  if (a3 == 2) {
    double result = 6.0;
  }
  if (a3 == 1) {
    return 4.0;
  }
  return result;
}

- (AVTSimpleAvatarPickerCollectionViewCell)initWithFrame:(CGRect)a3
{
  v23.receiver = self;
  v23.super_class = (Class)AVTSimpleAvatarPickerCollectionViewCell;
  id v3 = -[AVTSimpleAvatarPickerCollectionViewCell initWithFrame:](&v23, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F1CB60]);
    v5 = [(AVTSimpleAvatarPickerCollectionViewCell *)v3 contentView];
    [v5 bounds];
    v6 = (UIView *)objc_msgSend(v4, "initWithFrame:");

    uint64_t v7 = *MEMORY[0x263F15A20];
    v8 = [(UIView *)v6 layer];
    [v8 setCornerCurve:v7];

    v9 = [(UIView *)v6 layer];
    [v9 setCornerRadius:12.0];

    v10 = +[AVTUIColorRepository simplePickerSelectedBackground];
    [(UIView *)v6 setBackgroundColor:v10];

    [(UIView *)v6 setAutoresizingMask:18];
    [(UIView *)v6 setAlpha:0.0];
    v11 = [(AVTSimpleAvatarPickerCollectionViewCell *)v3 contentView];
    [v11 addSubview:v6];

    selectionLayer = v3->_selectionLayer;
    v3->_selectionLayer = v6;
    v13 = v6;

    v14 = [AVTUIAnimatingImageView alloc];
    v15 = [(AVTSimpleAvatarPickerCollectionViewCell *)v3 contentView];
    [v15 bounds];
    v16 = -[AVTUIAnimatingImageView initWithFrame:](v14, "initWithFrame:");

    [(AVTUIAnimatingImageView *)v16 setContentMode:1];
    v17 = [(AVTUIAnimatingImageView *)v16 layer];
    [v17 setCornerCurve:v7];

    v18 = [(AVTUIAnimatingImageView *)v16 layer];
    [v18 setCornerRadius:10.0];

    v19 = [(AVTUIAnimatingImageView *)v16 layer];
    [v19 setMasksToBounds:1];

    v20 = [(AVTSimpleAvatarPickerCollectionViewCell *)v3 contentView];
    [v20 addSubview:v16];

    imageView = v3->_imageView;
    v3->_imageView = v16;
  }
  return v3;
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)AVTSimpleAvatarPickerCollectionViewCell;
  [(AVTSimpleAvatarPickerCollectionViewCell *)&v11 layoutSubviews];
  [(AVTSimpleAvatarPickerCollectionViewCell *)self updateSelectionLayerOpacityAnimated:1];
  objc_msgSend((id)objc_opt_class(), "imageInsetForInsetSize:", -[AVTSimpleAvatarPickerCollectionViewCell imageInsetSize](self, "imageInsetSize"));
  CGFloat v4 = v3;
  v5 = [(AVTSimpleAvatarPickerCollectionViewCell *)self contentView];
  [v5 bounds];
  CGRect v13 = CGRectInset(v12, v4, v4);
  double x = v13.origin.x;
  double y = v13.origin.y;
  double width = v13.size.width;
  double height = v13.size.height;

  v10 = [(AVTSimpleAvatarPickerCollectionViewCell *)self imageView];
  objc_msgSend(v10, "setFrame:", x, y, width, height);
}

- (BOOL)shouldShowSelectionLayer
{
  int v3 = [(AVTSimpleAvatarPickerCollectionViewCell *)self showSelectedState];
  if (v3)
  {
    if ([(AVTSimpleAvatarPickerCollectionViewCell *)self isSelected])
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      LOBYTE(v3) = [(AVTSimpleAvatarPickerCollectionViewCell *)self isHighlighted];
    }
  }
  return v3;
}

- (void)updateSelectionLayerOpacityAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(AVTSimpleAvatarPickerCollectionViewCell *)self shouldShowSelectionLayer];
  double v6 = 0.0;
  double v7 = 1.0;
  if (!v5) {
    double v7 = 0.0;
  }
  v8[1] = 3221225472;
  v8[0] = MEMORY[0x263EF8330];
  v8[2] = __79__AVTSimpleAvatarPickerCollectionViewCell_updateSelectionLayerOpacityAnimated___block_invoke;
  v8[3] = &unk_263FF1CE8;
  if (v3) {
    double v6 = 0.3;
  }
  v8[4] = self;
  *(double *)&v8[5] = v7;
  [MEMORY[0x263F1CB60] animateWithDuration:4 delay:v8 usingSpringWithDamping:0 initialSpringVelocity:v6 options:0.0 animations:0.95 completion:0.0];
}

void __79__AVTSimpleAvatarPickerCollectionViewCell_updateSelectionLayerOpacityAnimated___block_invoke(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) selectionLayer];
  [v2 setAlpha:v1];
}

- (void)updateWithImage:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(AVTSimpleAvatarPickerCollectionViewCell *)self imageView];
  [v7 setImage:v6 animated:v4];
}

- (void)setSelected:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AVTSimpleAvatarPickerCollectionViewCell;
  [(AVTSimpleAvatarPickerCollectionViewCell *)&v5 setSelected:a3];
  [MEMORY[0x263F1CB60] inheritedAnimationDuration];
  [(AVTSimpleAvatarPickerCollectionViewCell *)self updateSelectionLayerOpacityAnimated:v4 > 0.0];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)AVTSimpleAvatarPickerCollectionViewCell;
  -[AVTSimpleAvatarPickerCollectionViewCell setHighlighted:](&v5, sel_setHighlighted_);
  [(AVTSimpleAvatarPickerCollectionViewCell *)self updateHighlightedState:v3 animated:1];
}

- (void)setImageInsetSize:(unint64_t)a3
{
  if (self->_imageInsetSize != a3)
  {
    self->_imageInsetSize = a3;
    [(AVTSimpleAvatarPickerCollectionViewCell *)self setNeedsLayout];
  }
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)AVTSimpleAvatarPickerCollectionViewCell;
  [(AVTSimpleAvatarPickerCollectionViewCell *)&v4 prepareForReuse];
  BOOL v3 = [(AVTSimpleAvatarPickerCollectionViewCell *)self imageView];
  [v3 setImage:0];

  [(AVTSimpleAvatarPickerCollectionViewCell *)self setImageInsetSize:0];
  [(AVTSimpleAvatarPickerCollectionViewCell *)self updateHighlightedState:0 animated:0];
  [(AVTSimpleAvatarPickerCollectionViewCell *)self updateSelectionLayerOpacityAnimated:0];
}

- (void)updateHighlightedState:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75__AVTSimpleAvatarPickerCollectionViewCell_updateHighlightedState_animated___block_invoke;
  block[3] = &unk_263FF1318;
  block[4] = self;
  BOOL v16 = a4;
  dispatch_async(MEMORY[0x263EF83A0], block);
  memset(&v14, 0, sizeof(v14));
  if (v5)
  {
    CGAffineTransformMakeScale(&v14, 0.93, 0.93);
    memset(&v13, 0, sizeof(v13));
    CGAffineTransformMakeScale(&v13, 1.03, 1.03);
  }
  else
  {
    long long v7 = *MEMORY[0x263F000D0];
    long long v8 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    *(_OWORD *)&v14.c = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    *(_OWORD *)&v14.tdouble x = v8;
    *(_OWORD *)&v13.a = v7;
    *(_OWORD *)&v13.c = *(_OWORD *)&v14.c;
    *(_OWORD *)&v13.tdouble x = v8;
    *(_OWORD *)&v14.a = v7;
  }
  double v9 = 0.3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  if (!v4) {
    double v9 = 0.0;
  }
  CGAffineTransform v11 = v14;
  CGAffineTransform v12 = v13;
  v10[2] = __75__AVTSimpleAvatarPickerCollectionViewCell_updateHighlightedState_animated___block_invoke_2;
  v10[3] = &unk_263FF1D10;
  v10[4] = self;
  [MEMORY[0x263F1CB60] animateWithDuration:4 delay:v10 usingSpringWithDamping:0 initialSpringVelocity:v9 options:0.0 animations:0.95 completion:0.0];
}

uint64_t __75__AVTSimpleAvatarPickerCollectionViewCell_updateHighlightedState_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateSelectionLayerOpacityAnimated:*(unsigned __int8 *)(a1 + 40)];
}

void __75__AVTSimpleAvatarPickerCollectionViewCell_updateHighlightedState_animated___block_invoke_2(uint64_t a1)
{
  long long v2 = *(_OWORD *)(a1 + 56);
  v10[0] = *(_OWORD *)(a1 + 40);
  v10[1] = v2;
  v10[2] = *(_OWORD *)(a1 + 72);
  BOOL v3 = [*(id *)(a1 + 32) imageView];
  [v3 setTransform:v10];

  long long v4 = *(_OWORD *)(a1 + 104);
  long long v7 = *(_OWORD *)(a1 + 88);
  long long v8 = v4;
  long long v9 = *(_OWORD *)(a1 + 120);
  BOOL v5 = [*(id *)(a1 + 32) selectionLayer];
  v6[0] = v7;
  v6[1] = v8;
  v6[2] = v9;
  [v5 setTransform:v6];
}

- (NSUUID)displaySessionUUID
{
  return self->_displaySessionUUID;
}

- (void)setDisplaySessionUUID:(id)a3
{
}

- (unint64_t)imageInsetSize
{
  return self->_imageInsetSize;
}

- (BOOL)showSelectedState
{
  return self->_showSelectedState;
}

- (void)setShowSelectedState:(BOOL)a3
{
  self->_showSelectedState = a3;
}

- (UIView)selectionLayer
{
  return self->_selectionLayer;
}

- (AVTUIAnimatingImageView)imageView
{
  return self->_imageView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_selectionLayer, 0);
  objc_storeStrong((id *)&self->_displaySessionUUID, 0);
}

@end