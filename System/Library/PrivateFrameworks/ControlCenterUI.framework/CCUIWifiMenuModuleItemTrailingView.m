@interface CCUIWifiMenuModuleItemTrailingView
- (CGSize)_subview:(id)a3 sizeThatFits:(CGSize)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (void)layoutSubviews;
@end

@implementation CCUIWifiMenuModuleItemTrailingView

- (CGSize)_subview:(id)a3 sizeThatFits:(CGSize)a4
{
  objc_msgSend(a3, "sizeThatFits:", a4.width, a4.height);
  CGAffineTransformMakeScale(&v6, 0.5, 0.5);
  UISizeRoundToScale();
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  CGAffineTransform v6 = [(CCUIWifiMenuModuleItemTrailingView *)self subviews];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    double v10 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        -[CCUIWifiMenuModuleItemTrailingView _subview:sizeThatFits:](self, "_subview:sizeThatFits:", *(void *)(*((void *)&v15 + 1) + 8 * i), width, height);
        double v10 = v10 + v12;
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
  else
  {
    double v10 = 0.0;
  }
  if ((unint64_t)[v6 count] >= 2) {
    double v10 = v10 + (double)(unint64_t)([v6 count] - 1) * 7.0;
  }

  double v13 = v10;
  double v14 = height;
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (void)layoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)CCUIWifiMenuModuleItemTrailingView;
  [(CCUIWifiMenuModuleItemTrailingView *)&v18 layoutSubviews];
  v3 = [(CCUIWifiMenuModuleItemTrailingView *)self subviews];
  if ([v3 count])
  {
    int v4 = [(CCUIWifiMenuModuleItemTrailingView *)self _shouldReverseLayoutDirection];
    [(CCUIWifiMenuModuleItemTrailingView *)self bounds];
    double v9 = v7;
    double v10 = v8;
    double MaxX = 0.0;
    if ((v4 & 1) == 0) {
      double MaxX = CGRectGetMaxX(*(CGRect *)&v5);
    }
    uint64_t v12 = [v3 count];
    if (v12)
    {
      uint64_t v13 = v12 - 1;
      do
      {
        double v14 = [v3 objectAtIndex:v13];
        -[CCUIWifiMenuModuleItemTrailingView _subview:sizeThatFits:](self, "_subview:sizeThatFits:", v14, v9, v10);
        double v16 = v15;
        if (v4) {
          double v15 = 0.0;
        }
        double v17 = MaxX - v15;
        if (v4) {
          double MaxX = v16 + v17 + 7.0;
        }
        else {
          double MaxX = v17 + -7.0;
        }
        UIRectCenteredYInRectScale();
        [v14 setFrame:0];

        --v13;
      }
      while (v13 != -1);
    }
  }
}

@end