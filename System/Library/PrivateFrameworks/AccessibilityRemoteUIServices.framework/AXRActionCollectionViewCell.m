@interface AXRActionCollectionViewCell
- (AXRActionCollectionViewCell)initWithFrame:(CGRect)a3;
- (BOOL)isAccessibilityElement;
- (BOOL)scalesLargeContentImage;
- (BOOL)showsLargeContentViewer;
- (UIEdgeInsets)largeContentImageInsets;
- (UIImage)largeContentImage;
- (unint64_t)accessibilityTraits;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setHighlighted:(BOOL)a3;
- (void)setImage:(id)a3 title:(id)a4;
@end

@implementation AXRActionCollectionViewCell

- (AXRActionCollectionViewCell)initWithFrame:(CGRect)a3
{
  v28[4] = *MEMORY[0x263EF8340];
  v27.receiver = self;
  v27.super_class = (Class)AXRActionCollectionViewCell;
  v3 = -[AXRActionCollectionViewCell initWithFrame:](&v27, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = objc_opt_new();
    imageView = v3->_imageView;
    v3->_imageView = (UIImageView *)v4;

    [(UIImageView *)v3->_imageView setContentMode:1];
    [(UIImageView *)v3->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
    v6 = [MEMORY[0x263F1C550] secondarySystemBackgroundColor];
    v7 = [(AXRActionCollectionViewCell *)v3 contentView];
    [v7 setBackgroundColor:v6];

    v8 = [MEMORY[0x263F1C550] secondaryLabelColor];
    [(UIImageView *)v3->_imageView setTintColor:v8];

    v9 = [(AXRActionCollectionViewCell *)v3 contentView];
    [v9 addSubview:v3->_imageView];

    v21 = (void *)MEMORY[0x263F08938];
    v25 = [(UIImageView *)v3->_imageView centerXAnchor];
    v26 = [(AXRActionCollectionViewCell *)v3 contentView];
    v24 = [v26 centerXAnchor];
    v23 = [v25 constraintEqualToAnchor:v24];
    v28[0] = v23;
    v22 = [(UIImageView *)v3->_imageView centerYAnchor];
    v10 = [(AXRActionCollectionViewCell *)v3 contentView];
    v11 = [v10 centerYAnchor];
    v12 = [v22 constraintEqualToAnchor:v11];
    v28[1] = v12;
    v13 = [(UIImageView *)v3->_imageView heightAnchor];
    v14 = [v13 constraintEqualToConstant:40.0];
    v28[2] = v14;
    v15 = [(UIImageView *)v3->_imageView widthAnchor];
    v16 = [(UIImageView *)v3->_imageView heightAnchor];
    v17 = [v15 constraintEqualToAnchor:v16];
    v28[3] = v17;
    v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:4];
    [v21 activateConstraints:v18];

    v19 = objc_opt_new();
    [(AXRActionCollectionViewCell *)v3 addInteraction:v19];
  }
  return v3;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)AXRActionCollectionViewCell;
  [(AXRActionCollectionViewCell *)&v3 prepareForReuse];
  [(UIImageView *)self->_imageView setImage:0];
  [(AXRActionCollectionViewCell *)self setAccessibilityLabel:0];
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)AXRActionCollectionViewCell;
  [(AXRActionCollectionViewCell *)&v6 layoutSubviews];
  objc_super v3 = [(AXRActionCollectionViewCell *)self contentView];
  [v3 bounds];
  CGFloat v4 = CGRectGetHeight(v7) * 0.5;
  v5 = [(AXRActionCollectionViewCell *)self contentView];
  [v5 _setCornerRadius:v4];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v20.receiver = self;
  v20.super_class = (Class)AXRActionCollectionViewCell;
  -[AXRActionCollectionViewCell setHighlighted:](&v20, sel_setHighlighted_);
  memset(&v19, 0, sizeof(v19));
  CGAffineTransformMakeScale(&v19, 1.0, 1.0);
  if (v3)
  {
    uint64_t v13 = MEMORY[0x263EF8330];
    uint64_t v14 = 3221225472;
    CGAffineTransform v18 = v19;
    v15 = __46__AXRActionCollectionViewCell_setHighlighted___block_invoke;
    v16 = &unk_264DA8CD0;
    v17 = self;
    double v5 = 0.165000007;
    objc_super v6 = &v13;
  }
  else
  {
    uint64_t v7 = MEMORY[0x263EF8330];
    uint64_t v8 = 3221225472;
    CGAffineTransform v12 = v19;
    v9 = __46__AXRActionCollectionViewCell_setHighlighted___block_invoke_2;
    v10 = &unk_264DA8CD0;
    v11 = self;
    double v5 = 0.25;
    objc_super v6 = &v7;
  }
  objc_msgSend(MEMORY[0x263F1CB60], "animateWithDuration:delay:options:animations:completion:", 6, v6, 0, v5, 0.0, v7, v8, v9, v10, v11, *(_OWORD *)&v12.a, *(_OWORD *)&v12.c, *(_OWORD *)&v12.tx, v13, v14, v15, v16,
    v17,
    *(_OWORD *)&v18.a,
    *(void *)&v18.c,
    *(_OWORD *)&v18.d,
    *(void *)&v18.ty);
}

uint64_t __46__AXRActionCollectionViewCell_setHighlighted___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  long long v3 = *(_OWORD *)(a1 + 56);
  *(_OWORD *)&v5.a = *(_OWORD *)(a1 + 40);
  *(_OWORD *)&v5.c = v3;
  *(_OWORD *)&v5.tx = *(_OWORD *)(a1 + 72);
  CGAffineTransformScale(&v6, &v5, 0.970000029, 0.970000029);
  [v2 setTransform:&v6];
  return [*(id *)(a1 + 32) setAlpha:0.5];
}

uint64_t __46__AXRActionCollectionViewCell_setHighlighted___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  long long v3 = *(_OWORD *)(a1 + 56);
  v5[0] = *(_OWORD *)(a1 + 40);
  v5[1] = v3;
  v5[2] = *(_OWORD *)(a1 + 72);
  [v2 setTransform:v5];
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

- (void)setImage:(id)a3 title:(id)a4
{
  imageView = self->_imageView;
  id v7 = a4;
  [(UIImageView *)imageView setImage:a3];
  [(AXRActionCollectionViewCell *)self setAccessibilityLabel:v7];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

- (BOOL)showsLargeContentViewer
{
  return 1;
}

- (UIImage)largeContentImage
{
  return [(UIImageView *)self->_imageView image];
}

- (BOOL)scalesLargeContentImage
{
  return 1;
}

- (UIEdgeInsets)largeContentImageInsets
{
  double v2 = *MEMORY[0x263F1D1C0];
  double v3 = *(double *)(MEMORY[0x263F1D1C0] + 8);
  double v4 = *(double *)(MEMORY[0x263F1D1C0] + 16);
  double v5 = *(double *)(MEMORY[0x263F1D1C0] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void).cxx_destruct
{
}

@end