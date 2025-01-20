@interface LPBackgroundColorView
- (LPBackgroundColorView)initWithColor:(id)a3;
- (UIColor)color;
- (void)setColor:(id)a3;
- (void)updateColor;
@end

@implementation LPBackgroundColorView

- (LPBackgroundColorView)initWithColor:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LPBackgroundColorView;
  v6 = [(LPBackgroundColorView *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_color, a3);
    [(LPBackgroundColorView *)v7 updateColor];
    v8 = v7;
  }

  return v7;
}

- (void)updateColor
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __36__LPBackgroundColorView_updateColor__block_invoke;
  aBlock[3] = &unk_1E5B04DF0;
  aBlock[4] = self;
  v2 = (void (**)(void))_Block_copy(aBlock);
  v2[2]();
}

uint64_t __36__LPBackgroundColorView_updateColor__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setBackgroundColor:*(void *)(*(void *)(a1 + 32) + 408)];
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);

  [(LPBackgroundColorView *)self updateColor];
}

- (UIColor)color
{
  return self->_color;
}

- (void).cxx_destruct
{
}

@end