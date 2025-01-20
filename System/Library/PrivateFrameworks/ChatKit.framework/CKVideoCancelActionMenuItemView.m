@interface CKVideoCancelActionMenuItemView
- (BOOL)isHighlighted;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CKVideoCancelActionMenuItemView)initWithFrame:(CGRect)a3;
- (UIImageView)maskView;
- (UIImageView)xView;
- (UIVisualEffectView)blurView;
- (void)layoutSubviews;
- (void)setBlurView:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)setMaskView:(id)a3;
- (void)setXView:(id)a3;
@end

@implementation CKVideoCancelActionMenuItemView

- (CKVideoCancelActionMenuItemView)initWithFrame:(CGRect)a3
{
  v16.receiver = self;
  v16.super_class = (Class)CKVideoCancelActionMenuItemView;
  v3 = -[CKVideoCancelActionMenuItemView initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F43028]);
    v5 = [MEMORY[0x1E4F427D8] effectWithStyle:1];
    v6 = (void *)[v4 initWithEffect:v5];

    [(CKVideoCancelActionMenuItemView *)v3 setBlurView:v6];
    [(CKVideoCancelActionMenuItemView *)v3 addSubview:v6];
    id v7 = objc_alloc(MEMORY[0x1E4F42AA0]);
    if (CKVideoCancelActionMenuItemViewMask_once != -1) {
      dispatch_once(&CKVideoCancelActionMenuItemViewMask_once, &__block_literal_global_217);
    }
    v8 = (void *)[v7 initWithImage:CKVideoCancelActionMenuItemViewMask_sMask];
    [(CKVideoCancelActionMenuItemView *)v3 setMaskView:v8];
    v9 = [v6 layer];
    v10 = [v8 layer];
    [v9 setMask:v10];

    v11 = [MEMORY[0x1E4F42A80] ckImageNamed:@"ActionMenuCancelGlyph"];
    v12 = [v11 imageWithRenderingMode:2];

    v13 = (void *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v12];
    v14 = [MEMORY[0x1E4F428B8] whiteColor];
    [v13 setTintColor:v14];

    [(CKVideoCancelActionMenuItemView *)v3 setXView:v13];
    [(CKVideoCancelActionMenuItemView *)v3 addSubview:v13];
  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = 36.0;
  double v4 = 36.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)CKVideoCancelActionMenuItemView;
  [(CKVideoCancelActionMenuItemView *)&v15 layoutSubviews];
  [(CKVideoCancelActionMenuItemView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(CKVideoCancelActionMenuItemView *)self blurView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  v12 = [(CKVideoCancelActionMenuItemView *)self maskView];
  objc_msgSend(v12, "setFrame:", v4, v6, v8, v10);

  v13 = [(CKVideoCancelActionMenuItemView *)self xView];
  v16.origin.x = v4;
  v16.origin.y = v6;
  v16.size.width = v8;
  v16.size.height = v10;
  double MidX = CGRectGetMidX(v16);
  v17.origin.x = v4;
  v17.origin.y = v6;
  v17.size.width = v8;
  v17.size.height = v10;
  objc_msgSend(v13, "setCenter:", MidX, CGRectGetMidY(v17));
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_highlighted != a3)
  {
    BOOL v4 = a4;
    self->_highlighted = a3;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __59__CKVideoCancelActionMenuItemView_setHighlighted_animated___block_invoke;
    v7[3] = &unk_1E5622A18;
    BOOL v8 = a3;
    v7[4] = self;
    double v5 = _Block_copy(v7);
    double v6 = v5;
    if (v4) {
      +[CKActionMenuItem animate:v5 completion:0];
    }
    else {
      (*((void (**)(void *))v5 + 2))(v5);
    }
  }
}

void __59__CKVideoCancelActionMenuItemView_setHighlighted_animated___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    double v2 = 0.4;
  }
  else {
    double v2 = 1.0;
  }
  double v3 = [*(id *)(a1 + 32) blurView];
  [v3 setAlpha:v2];

  id v4 = [*(id *)(a1 + 32) xView];
  [v4 setAlpha:v2];
}

- (UIVisualEffectView)blurView
{
  return self->_blurView;
}

- (void)setBlurView:(id)a3
{
}

- (UIImageView)maskView
{
  return self->_maskView;
}

- (void)setMaskView:(id)a3
{
}

- (UIImageView)xView
{
  return self->_xView;
}

- (void)setXView:(id)a3
{
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (void)setHighlighted:(BOOL)a3
{
  self->_highlighted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xView, 0);
  objc_storeStrong((id *)&self->_maskView, 0);

  objc_storeStrong((id *)&self->_blurView, 0);
}

@end