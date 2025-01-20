@interface AVTPoseCollectionViewCell
+ (CGPath)selectionPathInBounds:(CGRect)a3;
- (AVTPoseCollectionViewCell)initWithFrame:(CGRect)a3;
- (CAShapeLayer)selectionLayer;
- (NSUUID)contextIdentifier;
- (UIImage)image;
- (UIImageView)imageView;
- (UIImageView)transitionImageView;
- (UIViewPropertyAnimator)scaleDownTransformAnimator;
- (UIViewPropertyAnimator)scaleUpWithBounceTransformAnimator;
- (void)cancelAnimations;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setContextIdentifier:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageView:(id)a3;
- (void)setScaleDownTransformAnimator:(id)a3;
- (void)setScaleUpWithBounceTransformAnimator:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSelectionLayer:(id)a3;
- (void)setTransitionImageView:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateImage:(id)a3 animated:(BOOL)a4;
@end

@implementation AVTPoseCollectionViewCell

+ (CGPath)selectionPathInBounds:(CGRect)a3
{
  CGRect v6 = CGRectInset(a3, 6.0, 6.0);
  objc_msgSend(MEMORY[0x263F1C478], "bezierPathWithRoundedRect:cornerRadius:", v6.origin.x, v6.origin.y, v6.size.width, v6.size.height, 16.0);
  id v3 = objc_claimAutoreleasedReturnValue();
  v4 = (CGPath *)[v3 CGPath];

  return v4;
}

- (AVTPoseCollectionViewCell)initWithFrame:(CGRect)a3
{
  v16.receiver = self;
  v16.super_class = (Class)AVTPoseCollectionViewCell;
  id v3 = -[AVTPoseCollectionViewCell initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F1C6D0]);
    [(AVTPoseCollectionViewCell *)v3 bounds];
    CGRect v18 = CGRectInset(v17, 10.0, 10.0);
    uint64_t v5 = objc_msgSend(v4, "initWithFrame:", v18.origin.x, v18.origin.y, v18.size.width, v18.size.height);
    imageView = v3->_imageView;
    v3->_imageView = (UIImageView *)v5;

    [(UIImageView *)v3->_imageView setAutoresizingMask:18];
    [(UIImageView *)v3->_imageView setAccessibilityIgnoresInvertColors:1];
    v7 = [(AVTPoseCollectionViewCell *)v3 contentView];
    [v7 addSubview:v3->_imageView];

    v8 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x263F15880]);
    id v9 = [MEMORY[0x263F1C550] tertiaryLabelColor];
    -[CAShapeLayer setStrokeColor:](v8, "setStrokeColor:", [v9 CGColor]);

    [(CAShapeLayer *)v8 setLineWidth:3.0];
    id v10 = [MEMORY[0x263F1C550] clearColor];
    -[CAShapeLayer setFillColor:](v8, "setFillColor:", [v10 CGColor]);

    [(CAShapeLayer *)v8 setHidden:1];
    selectionLayer = v3->_selectionLayer;
    v3->_selectionLayer = v8;
    v12 = v8;

    v13 = [(AVTPoseCollectionViewCell *)v3 contentView];
    v14 = [v13 layer];
    [v14 addSublayer:v12];
  }
  return v3;
}

- (void)updateImage:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  v7 = [(AVTPoseCollectionViewCell *)self contextIdentifier];
  id v8 = [(AVTPoseCollectionViewCell *)self image];

  if (v8 != v6)
  {
    if (v6)
    {
      if (a4)
      {
        id v9 = objc_alloc(MEMORY[0x263F1CB78]);
        v32[0] = MEMORY[0x263EF8330];
        v32[1] = 3221225472;
        v32[2] = __50__AVTPoseCollectionViewCell_updateImage_animated___block_invoke;
        v32[3] = &unk_263FF03D8;
        v32[4] = self;
        id v10 = (void *)[v9 initWithDuration:0 curve:v32 animations:0.15];
        [(AVTPoseCollectionViewCell *)self setScaleDownTransformAnimator:v10];

        id v11 = objc_alloc(MEMORY[0x263F1CB78]);
        v31[0] = MEMORY[0x263EF8330];
        v31[1] = 3221225472;
        v31[2] = __50__AVTPoseCollectionViewCell_updateImage_animated___block_invoke_2;
        v31[3] = &unk_263FF03D8;
        v31[4] = self;
        v12 = (void *)[v11 initWithDuration:v31 dampingRatio:0.5 animations:0.6];
        [(AVTPoseCollectionViewCell *)self setScaleUpWithBounceTransformAnimator:v12];

        objc_initWeak(&location, self);
        v13 = [(AVTPoseCollectionViewCell *)self scaleDownTransformAnimator];
        v26[0] = MEMORY[0x263EF8330];
        v26[1] = 3221225472;
        v26[2] = __50__AVTPoseCollectionViewCell_updateImage_animated___block_invoke_3;
        v26[3] = &unk_263FF15C0;
        objc_copyWeak(&v29, &location);
        id v14 = v7;
        id v27 = v14;
        id v28 = v6;
        [v13 addCompletion:v26];

        v15 = [(AVTPoseCollectionViewCell *)self scaleUpWithBounceTransformAnimator];
        uint64_t v20 = MEMORY[0x263EF8330];
        uint64_t v21 = 3221225472;
        v22 = __50__AVTPoseCollectionViewCell_updateImage_animated___block_invoke_4;
        v23 = &unk_263FF15E8;
        objc_copyWeak(&v25, &location);
        id v24 = v14;
        [v15 addCompletion:&v20];

        objc_super v16 = [(AVTPoseCollectionViewCell *)self scaleDownTransformAnimator];
        [v16 startAnimation];

        objc_destroyWeak(&v25);
        objc_destroyWeak(&v29);
        objc_destroyWeak(&location);
        goto LABEL_8;
      }
      CGRect v17 = [(AVTPoseCollectionViewCell *)self imageView];
      CGRect v18 = v17;
      id v19 = v6;
    }
    else
    {
      CGRect v17 = [(AVTPoseCollectionViewCell *)self imageView];
      CGRect v18 = v17;
      id v19 = 0;
    }
    [v17 setImage:v19];
  }
LABEL_8:
}

void __50__AVTPoseCollectionViewCell_updateImage_animated___block_invoke(uint64_t a1)
{
  CGAffineTransformMakeScale(&v4, 0.2, 0.2);
  v2 = [*(id *)(a1 + 32) imageView];
  CGAffineTransform v3 = v4;
  [v2 setTransform:&v3];
}

void __50__AVTPoseCollectionViewCell_updateImage_animated___block_invoke_2(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) imageView];
  long long v2 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v3[0] = *MEMORY[0x263F000D0];
  v3[1] = v2;
  v3[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [v1 setTransform:v3];
}

void __50__AVTPoseCollectionViewCell_updateImage_animated___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  CGAffineTransform v3 = *(void **)(a1 + 32);
  CGAffineTransform v4 = [WeakRetained contextIdentifier];

  if (v3 == v4)
  {
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = [WeakRetained imageView];
    [v6 setImage:v5];

    CGAffineTransformMakeScale(&v10, 0.2, 0.2);
    v7 = [WeakRetained imageView];
    CGAffineTransform v9 = v10;
    [v7 setTransform:&v9];

    id v8 = [WeakRetained scaleUpWithBounceTransformAnimator];
    [v8 startAnimation];
  }
  else
  {
    [WeakRetained cancelAnimations];
  }
}

void __50__AVTPoseCollectionViewCell_updateImage_animated___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  CGAffineTransform v3 = *(void **)(a1 + 32);
  id v5 = WeakRetained;
  CGAffineTransform v4 = [WeakRetained contextIdentifier];

  if (v3 == v4)
  {
    [v5 setScaleDownTransformAnimator:0];
    [v5 setScaleUpWithBounceTransformAnimator:0];
  }
  else
  {
    [v5 cancelAnimations];
  }
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)AVTPoseCollectionViewCell;
  [(AVTPoseCollectionViewCell *)&v7 layoutSubviews];
  CGAffineTransform v3 = objc_opt_class();
  CGAffineTransform v4 = [(AVTPoseCollectionViewCell *)self contentView];
  [v4 bounds];
  uint64_t v5 = objc_msgSend(v3, "selectionPathInBounds:");
  id v6 = [(AVTPoseCollectionViewCell *)self selectionLayer];
  [v6 setPath:v5];
}

- (void)traitCollectionDidChange:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)AVTPoseCollectionViewCell;
  id v4 = a3;
  [(AVTPoseCollectionViewCell *)&v11 traitCollectionDidChange:v4];
  uint64_t v5 = objc_msgSend(v4, "userInterfaceStyle", v11.receiver, v11.super_class);

  id v6 = [(AVTPoseCollectionViewCell *)self traitCollection];
  uint64_t v7 = [v6 userInterfaceStyle];

  if (v5 != v7)
  {
    id v8 = [MEMORY[0x263F1C550] tertiaryLabelColor];
    uint64_t v9 = [v8 CGColor];
    CGAffineTransform v10 = [(AVTPoseCollectionViewCell *)self selectionLayer];
    [v10 setStrokeColor:v9];
  }
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)AVTPoseCollectionViewCell;
  -[AVTPoseCollectionViewCell setSelected:](&v6, sel_setSelected_);
  uint64_t v5 = [(AVTPoseCollectionViewCell *)self selectionLayer];
  [v5 setHidden:!v3];
}

- (void)cancelAnimations
{
  BOOL v3 = [(AVTPoseCollectionViewCell *)self scaleDownTransformAnimator];
  [v3 stopAnimation:1];

  id v4 = [(AVTPoseCollectionViewCell *)self scaleUpWithBounceTransformAnimator];
  [v4 stopAnimation:1];

  [(AVTPoseCollectionViewCell *)self setScaleDownTransformAnimator:0];
  [(AVTPoseCollectionViewCell *)self setScaleUpWithBounceTransformAnimator:0];
  uint64_t v5 = [(AVTPoseCollectionViewCell *)self imageView];
  long long v6 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v8[0] = *MEMORY[0x263F000D0];
  v8[1] = v6;
  v8[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [v5 setTransform:v8];

  uint64_t v7 = [(AVTPoseCollectionViewCell *)self imageView];
  [v7 setImage:0];
}

- (void)prepareForReuse
{
  [(AVTPoseCollectionViewCell *)self cancelAnimations];
  v3.receiver = self;
  v3.super_class = (Class)AVTPoseCollectionViewCell;
  [(AVTPoseCollectionViewCell *)&v3 prepareForReuse];
  [(AVTPoseCollectionViewCell *)self setContextIdentifier:0];
}

- (NSUUID)contextIdentifier
{
  return self->_contextIdentifier;
}

- (void)setContextIdentifier:(id)a3
{
}

- (CAShapeLayer)selectionLayer
{
  return self->_selectionLayer;
}

- (void)setSelectionLayer:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (UIImageView)transitionImageView
{
  return self->_transitionImageView;
}

- (void)setTransitionImageView:(id)a3
{
}

- (UIViewPropertyAnimator)scaleDownTransformAnimator
{
  return self->_scaleDownTransformAnimator;
}

- (void)setScaleDownTransformAnimator:(id)a3
{
}

- (UIViewPropertyAnimator)scaleUpWithBounceTransformAnimator
{
  return self->_scaleUpWithBounceTransformAnimator;
}

- (void)setScaleUpWithBounceTransformAnimator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scaleUpWithBounceTransformAnimator, 0);
  objc_storeStrong((id *)&self->_scaleDownTransformAnimator, 0);
  objc_storeStrong((id *)&self->_transitionImageView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_selectionLayer, 0);
  objc_storeStrong((id *)&self->_contextIdentifier, 0);
}

@end