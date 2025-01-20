@interface MFComposeSMIMELockButton
- (BOOL)canEncrypt;
- (BOOL)wantsEncryption;
- (MFComposeSMIMELockButton)initWithFrame:(CGRect)a3;
- (UIEdgeInsets)touchInsets;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)_closeLock;
- (void)_openLock;
- (void)_updateButtonAppearance;
- (void)_updateButtonAppearanceAnimated:(BOOL)a3;
- (void)setCanEncrypt:(BOOL)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setEnabled:(BOOL)a3 animated:(BOOL)a4;
- (void)setTouchInsets:(UIEdgeInsets)a3;
- (void)setWantsEncryption:(BOOL)a3;
- (void)setWantsEncryption:(BOOL)a3 canEncrypt:(BOOL)a4 animated:(BOOL)a5;
@end

@implementation MFComposeSMIMELockButton

- (MFComposeSMIMELockButton)initWithFrame:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)MFComposeSMIMELockButton;
  v3 = -[MFComposeSMIMELockButton initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, 21.0, 22.0);
  v4 = v3;
  if (v3)
  {
    -[MFComposeSMIMELockButton setTouchInsets:](v3, "setTouchInsets:", -20.0, -20.0, 20.0, 10.0);
    id v5 = objc_alloc(MEMORY[0x1E4FB1838]);
    v6 = objc_msgSend(MEMORY[0x1E4FB1818], "mf_systemImageNamed:forView:", @"lock.slash.fill", 13);
    uint64_t v7 = [v5 initWithImage:v6];
    unlockedImageView = v4->_unlockedImageView;
    v4->_unlockedImageView = (UIImageView *)v7;

    [(MFComposeSMIMELockButton *)v4 bounds];
    -[UIImageView setFrame:](v4->_unlockedImageView, "setFrame:");
    [(UIImageView *)v4->_unlockedImageView setContentMode:4];
    [(MFComposeSMIMELockButton *)v4 addSubview:v4->_unlockedImageView];
    id v9 = objc_alloc(MEMORY[0x1E4FB1838]);
    v10 = objc_msgSend(MEMORY[0x1E4FB1818], "mf_systemImageNamed:forView:", @"lock.fill", 13);
    uint64_t v11 = [v9 initWithImage:v10];
    lockedImageView = v4->_lockedImageView;
    v4->_lockedImageView = (UIImageView *)v11;

    [(MFComposeSMIMELockButton *)v4 bounds];
    -[UIImageView setFrame:](v4->_lockedImageView, "setFrame:");
    [(UIImageView *)v4->_lockedImageView setContentMode:4];
    [(MFComposeSMIMELockButton *)v4 addSubview:v4->_lockedImageView];
    [(MFComposeSMIMELockButton *)v4 setWantsEncryption:0 canEncrypt:1 animated:0];
    [(MFComposeSMIMELockButton *)v4 setEnabled:0];
  }
  return v4;
}

- (void)setEnabled:(BOOL)a3
{
}

- (void)setEnabled:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3)
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4FB1618] lightGrayColor];
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__MFComposeSMIMELockButton_setEnabled_animated___block_invoke;
  aBlock[3] = &unk_1E5F79038;
  aBlock[4] = self;
  id v8 = v7;
  id v16 = v8;
  id v9 = (void (**)(void))_Block_copy(aBlock);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __48__MFComposeSMIMELockButton_setEnabled_animated___block_invoke_2;
  v13[3] = &unk_1E5F798C0;
  BOOL v14 = a3;
  v13[4] = self;
  v10 = (void (**)(void *, uint64_t))_Block_copy(v13);
  if (v4)
  {
    uint64_t v11 = (void *)MEMORY[0x1E4FB1EB0];
    UIAnimationDragCoefficient();
    [v11 animateWithDuration:v9 animations:v10 completion:v12 * 0.4];
  }
  else
  {
    v9[2](v9);
    v10[2](v10, 1);
  }
}

uint64_t __48__MFComposeSMIMELockButton_setEnabled_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setTintColor:*(void *)(a1 + 40)];
}

unsigned __int8 *__48__MFComposeSMIMELockButton_setEnabled_animated___block_invoke_2(unsigned __int8 *result, int a2)
{
  if (a2)
  {
    uint64_t v2 = result[40];
    v3.receiver = (id)*((void *)result + 4);
    v3.super_class = (Class)MFComposeSMIMELockButton;
    return (unsigned __int8 *)objc_msgSendSuper2(&v3, sel_setEnabled_, v2);
  }
  return result;
}

- (void)setWantsEncryption:(BOOL)a3
{
  if (self->_wantsEncryption != a3)
  {
    self->_wantsEncryption = a3;
    [(MFComposeSMIMELockButton *)self _updateButtonAppearance];
  }
}

- (void)setCanEncrypt:(BOOL)a3
{
  if (self->_canEncrypt != a3)
  {
    self->_canEncrypt = a3;
    [(MFComposeSMIMELockButton *)self _updateButtonAppearance];
  }
}

- (void)setWantsEncryption:(BOOL)a3 canEncrypt:(BOOL)a4 animated:(BOOL)a5
{
  self->_wantsEncryption = a3;
  self->_canEncrypt = a4;
  [(MFComposeSMIMELockButton *)self _updateButtonAppearanceAnimated:a5];
}

- (void)_updateButtonAppearance
{
}

- (void)_updateButtonAppearanceAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__MFComposeSMIMELockButton__updateButtonAppearanceAnimated___block_invoke;
  aBlock[3] = &unk_1E5F79088;
  aBlock[4] = self;
  BOOL v4 = _Block_copy(aBlock);
  id v5 = v4;
  if (v3)
  {
    v6 = (void *)MEMORY[0x1E4FB1EB0];
    UIAnimationDragCoefficient();
    [v6 animateWithDuration:512 delay:v5 usingSpringWithDamping:0 initialSpringVelocity:v7 * 0.3 options:0.0 animations:0.5 completion:0.0];
  }
  else
  {
    (*((void (**)(void *))v4 + 2))(v4);
  }
}

void __60__MFComposeSMIMELockButton__updateButtonAppearanceAnimated___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) wantsEncryption]
    && [*(id *)(a1 + 32) canEncrypt])
  {
    id v4 = 0;
    [*(id *)(a1 + 32) _closeLock];
    [*(id *)(a1 + 32) setTintColor:0];
  }
  else
  {
    int v2 = [*(id *)(a1 + 32) wantsEncryption];
    BOOL v3 = *(void **)(a1 + 32);
    if (v2)
    {
      [v3 _openLock];
      id v4 = [MEMORY[0x1E4FB1618] systemRedColor];
      [*(id *)(a1 + 32) setTintColor:v4];
    }
    else
    {
      id v4 = 0;
      [v3 _openLock];
      [*(id *)(a1 + 32) setTintColor:0];
    }
  }
}

- (void)_openLock
{
  [(UIImageView *)self->_unlockedImageView setAlpha:1.0];
  lockedImageView = self->_lockedImageView;

  [(UIImageView *)lockedImageView setAlpha:0.0];
}

- (void)_closeLock
{
  [(UIImageView *)self->_unlockedImageView setAlpha:0.0];
  lockedImageView = self->_lockedImageView;

  [(UIImageView *)lockedImageView setAlpha:1.0];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  [(MFComposeSMIMELockButton *)self alpha];
  if (v8 <= 0.0) {
    goto LABEL_4;
  }
  [(MFComposeSMIMELockButton *)self bounds];
  double v28 = v9;
  double v29 = v10;
  double v30 = v11;
  double v13 = v12;
  [(MFComposeSMIMELockButton *)self touchInsets];
  double v15 = v14;
  [(MFComposeSMIMELockButton *)self touchInsets];
  double v17 = v16;
  [(MFComposeSMIMELockButton *)self touchInsets];
  double v19 = v18;
  [(MFComposeSMIMELockButton *)self touchInsets];
  double v21 = v20;
  [(MFComposeSMIMELockButton *)self touchInsets];
  double v23 = v22;
  [(MFComposeSMIMELockButton *)self touchInsets];
  v34.origin.double x = v28 + v15;
  v34.origin.double y = v13 + v17;
  v34.size.height = v30 + v24 - v23;
  v34.size.width = v29 + v21 - v19;
  v33.double x = x;
  v33.double y = y;
  if (CGRectContainsPoint(v34, v33))
  {
    v25 = self;
  }
  else
  {
LABEL_4:
    v31.receiver = self;
    v31.super_class = (Class)MFComposeSMIMELockButton;
    -[MFComposeSMIMELockButton hitTest:withEvent:](&v31, sel_hitTest_withEvent_, v7, x, y);
    v25 = (MFComposeSMIMELockButton *)objc_claimAutoreleasedReturnValue();
  }
  v26 = v25;

  return v26;
}

- (UIEdgeInsets)touchInsets
{
  double top = self->touchInsets.top;
  double left = self->touchInsets.left;
  double bottom = self->touchInsets.bottom;
  double right = self->touchInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setTouchInsets:(UIEdgeInsets)a3
{
  self->touchInsets = a3;
}

- (BOOL)wantsEncryption
{
  return self->_wantsEncryption;
}

- (BOOL)canEncrypt
{
  return self->_canEncrypt;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unlockedImageView, 0);

  objc_storeStrong((id *)&self->_lockedImageView, 0);
}

@end