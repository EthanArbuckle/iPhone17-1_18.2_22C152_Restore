@interface CKActionMenuItemImageView
- (CKActionMenuItemImageView)initWithImage:(id)a3 tintColor:(id)a4 highlightedTintColor:(id)a5;
- (void)setEnabled:(BOOL)a3 animated:(BOOL)a4;
- (void)setHighlighted:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)updateTintColor;
@end

@implementation CKActionMenuItemImageView

- (CKActionMenuItemImageView)initWithImage:(id)a3 tintColor:(id)a4 highlightedTintColor:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CKActionMenuItemImageView;
  v11 = [(CKActionMenuItemImageView *)&v14 initWithImage:a3];
  v12 = v11;
  if (v11)
  {
    v11->_enabled = 1;
    objc_storeStrong((id *)&v11->_unhighlightedTintColor, a4);
    objc_storeStrong((id *)&v12->_highlightedTintColor, a5);
    [(CKActionMenuItemImageView *)v12 updateTintColor];
  }

  return v12;
}

- (void)setHighlighted:(BOOL)a3
{
}

- (void)setEnabled:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_enabled != a3)
  {
    BOOL v4 = a4;
    self->_enabled = a3;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __49__CKActionMenuItemImageView_setEnabled_animated___block_invoke;
    aBlock[3] = &unk_1E5620C40;
    aBlock[4] = self;
    v5 = _Block_copy(aBlock);
    v6 = v5;
    if (v4) {
      +[CKActionMenuItem animate:v5 completion:0];
    }
    else {
      (*((void (**)(void *))v5 + 2))(v5);
    }
  }
}

uint64_t __49__CKActionMenuItemImageView_setEnabled_animated___block_invoke(uint64_t a1)
{
  v1 = *(unsigned char **)(a1 + 32);
  double v2 = 0.4;
  if (v1[520]) {
    double v2 = 1.0;
  }
  return [v1 setAlpha:v2];
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if ([(CKActionMenuItemImageView *)self isHighlighted] != a3)
  {
    v10.receiver = self;
    v10.super_class = (Class)CKActionMenuItemImageView;
    [(CKActionMenuItemImageView *)&v10 setHighlighted:v5];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __53__CKActionMenuItemImageView_setHighlighted_animated___block_invoke;
    aBlock[3] = &unk_1E5620C40;
    aBlock[4] = self;
    v7 = _Block_copy(aBlock);
    v8 = v7;
    if (v4) {
      +[CKActionMenuItem animate:v7 completion:0];
    }
    else {
      (*((void (**)(void *))v7 + 2))(v7);
    }
  }
}

uint64_t __53__CKActionMenuItemImageView_setHighlighted_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateTintColor];
}

- (void)updateTintColor
{
  int v3 = [(CKActionMenuItemImageView *)self isHighlighted];
  BOOL v4 = &OBJC_IVAR___CKActionMenuItemImageView__unhighlightedTintColor;
  if (v3) {
    BOOL v4 = &OBJC_IVAR___CKActionMenuItemImageView__highlightedTintColor;
  }
  uint64_t v5 = *(uint64_t *)((char *)&self->super.super.super.super.isa + *v4);

  [(CKActionMenuItemImageView *)self setTintColor:v5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightedTintColor, 0);

  objc_storeStrong((id *)&self->_unhighlightedTintColor, 0);
}

@end