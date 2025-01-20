@interface MFRoundedCornersStackView
- (MFRoundedCornersStackView)initWithCoder:(id)a3;
- (MFRoundedCornersStackView)initWithFrame:(CGRect)a3;
- (double)cornerRadius;
- (void)mf_addArrangedSubviews:(id)a3;
- (void)setCornerRadius:(double)a3;
- (void)updateRoundedCorners;
@end

@implementation MFRoundedCornersStackView

- (MFRoundedCornersStackView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MFRoundedCornersStackView;
  v3 = -[MFRoundedCornersStackView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(MFRoundedCornersStackView *)v3 setCornerRadius:0.0];
  }
  return v4;
}

- (MFRoundedCornersStackView)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MFRoundedCornersStackView;
  v5 = [(MFRoundedCornersStackView *)&v8 initWithCoder:v4];
  objc_super v6 = v5;
  if (v5) {
    [(MFRoundedCornersStackView *)v5 setCornerRadius:0.0];
  }

  return v6;
}

- (void)mf_addArrangedSubviews:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        -[MFRoundedCornersStackView addArrangedSubview:](self, "addArrangedSubview:", *(void *)(*((void *)&v8 + 1) + 8 * v7++), (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(MFRoundedCornersStackView *)self updateRoundedCorners];
}

- (void)updateRoundedCorners
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v3 = [(MFRoundedCornersStackView *)self arrangedSubviews];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v5 = [(MFRoundedCornersStackView *)self arrangedSubviews];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v23 != v7) {
            objc_enumerationMutation(v5);
          }
          long long v9 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          long long v10 = [v9 layer];
          [v10 setCornerRadius:0.0];

          long long v11 = [v9 layer];
          [v11 setMaskedCorners:0];
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v6);
    }

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __49__MFRoundedCornersStackView_updateRoundedCorners__block_invoke;
    aBlock[3] = &unk_1E5F7D1B8;
    aBlock[4] = self;
    v12 = (void (**)(void *, void *, uint64_t))_Block_copy(aBlock);
    [(MFRoundedCornersStackView *)self cornerRadius];
    if (v13 > 0.0)
    {
      uint64_t v14 = [(MFRoundedCornersStackView *)self effectiveUserInterfaceLayoutDirection];
      if (v14 == 1) {
        uint64_t v15 = 10;
      }
      else {
        uint64_t v15 = 5;
      }
      if (v14 == 1) {
        uint64_t v16 = 5;
      }
      else {
        uint64_t v16 = 10;
      }
      v17 = [(MFRoundedCornersStackView *)self arrangedSubviews];
      v18 = [v17 firstObject];
      v12[2](v12, v18, v15);

      v19 = [(MFRoundedCornersStackView *)self arrangedSubviews];
      v20 = [v19 lastObject];
      v12[2](v12, v20, v16);
    }
  }
}

void __49__MFRoundedCornersStackView_updateRoundedCorners__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v10 = a2;
  uint64_t v5 = [v10 layer];
  objc_msgSend(v5, "setMaskedCorners:", objc_msgSend(v5, "maskedCorners") | a3);

  [*(id *)(a1 + 32) cornerRadius];
  double v7 = v6;
  long long v8 = [v10 layer];
  [v8 setCornerRadius:v7];

  long long v9 = [v10 layer];
  [v9 setMasksToBounds:1];
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

@end