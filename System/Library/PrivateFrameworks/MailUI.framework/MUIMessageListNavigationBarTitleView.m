@interface MUIMessageListNavigationBarTitleView
- (BOOL)isSubtitleHidden;
- (MUIMessageListNavigationBarTitleView)initWithNavigationBar:(id)a3;
- (UILabel)subtitleLabel;
- (UINavigationBar)navigationBar;
- (void)_updateSubtitleLayout;
- (void)configureWithTitle:(id)a3 bucket:(int64_t)a4;
- (void)layoutSubviews;
- (void)setIsSubtitleHidden:(BOOL)a3;
- (void)setNavigationBar:(id)a3;
- (void)setSubtitleHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)setSubtitleLabel:(id)a3;
@end

@implementation MUIMessageListNavigationBarTitleView

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)MUIMessageListNavigationBarTitleView;
  [(MUIMessageListNavigationBarTitleView *)&v3 layoutSubviews];
  -[MUIMessageListNavigationBarTitleView _updateSubtitleLayout](self);
}

- (void)_updateSubtitleLayout
{
  if (a1)
  {
    v2 = [a1 overlays];
    [v2 titleRect];
    CGFloat v4 = v3;
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;

    v22.origin.CGFloat x = v4;
    v22.origin.CGFloat y = v6;
    v22.size.CGFloat width = v8;
    v22.size.CGFloat height = v10;
    if (!CGRectIsNull(v22))
    {
      v23.origin.CGFloat x = v4;
      v23.origin.CGFloat y = v6;
      v23.size.CGFloat width = v8;
      v23.size.CGFloat height = v10;
      double MidX = CGRectGetMidX(v23);
      id v20 = [a1 subtitleLabel];
      [v20 frame];
      CGFloat x = v24.origin.x;
      CGFloat y = v24.origin.y;
      CGFloat width = v24.size.width;
      CGFloat height = v24.size.height;
      double v18 = MidX - CGRectGetMidX(v24);
      v25.origin.CGFloat x = x;
      v25.origin.CGFloat y = y;
      v25.size.CGFloat width = width;
      v25.size.CGFloat height = height;
      CGFloat v19 = CGRectGetMinX(v25) + v18;
      v26.origin.CGFloat x = v4;
      v26.origin.CGFloat y = v6;
      v26.size.CGFloat width = v8;
      v26.size.CGFloat height = v10;
      double MaxY = CGRectGetMaxY(v26);
      v27.origin.CGFloat x = x;
      v27.origin.CGFloat y = y;
      v27.size.CGFloat width = width;
      v27.size.CGFloat height = height;
      double v16 = CGRectGetWidth(v27);
      v28.origin.CGFloat x = x;
      v28.origin.CGFloat y = y;
      v28.size.CGFloat width = width;
      v28.size.CGFloat height = height;
      objc_msgSend(v20, "setFrame:", v19, MaxY, v16, CGRectGetHeight(v28));
    }
  }
}

- (void)configureWithTitle:(id)a3 bucket:(int64_t)a4
{
  id v8 = [(MUIMessageListNavigationBarTitleView *)self subtitleLabel];
  double v5 = MUILocalizedStringFromBucket((void *)a4);
  CGFloat v6 = [v5 localizedUppercaseString];
  [v8 setText:v6];

  double v7 = MUIPlatformTextColorForBucket(a4);
  [v8 setTextColor:v7];

  [v8 sizeToFit];
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (MUIMessageListNavigationBarTitleView)initWithNavigationBar:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MUIMessageListNavigationBarTitleView;
  double v5 = -[_UINavigationBarTitleView initWithFrame:](&v12, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  CGFloat v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_navigationBar, v4);
    v6->_isSubtitleHidden = 1;
    double v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    subtitleLabel = v6->_subtitleLabel;
    v6->_subtitleLabel = v7;

    double v9 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v6->_subtitleLabel setTextColor:v9];

    [(UILabel *)v6->_subtitleLabel setTextAlignment:1];
    CGFloat v10 = [MEMORY[0x1E4FB08E0] _preferredFontForTextStyle:*MEMORY[0x1E4FB28E0] design:*MEMORY[0x1E4FB0928] variant:1280 weight:*MEMORY[0x1E4FB27B8] maximumContentSizeCategory:0 compatibleWithTraitCollection:*MEMORY[0x1E4FB09D0]];
    [(UILabel *)v6->_subtitleLabel setFont:v10];

    [(UILabel *)v6->_subtitleLabel setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)v6->_subtitleLabel setNumberOfLines:1];
    [(UILabel *)v6->_subtitleLabel setHidden:1];
    [(UILabel *)v6->_subtitleLabel setAlpha:0.0];
    [(UILabel *)v6->_subtitleLabel setAccessibilityIdentifier:*MEMORY[0x1E4F73C60]];
    [(UILabel *)v6->_subtitleLabel setAccessibilityTraits:*MEMORY[0x1E4FB2550]];
    [(MUIMessageListNavigationBarTitleView *)v6 addSubview:v6->_subtitleLabel];
  }

  return v6;
}

- (void)setSubtitleHidden:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if ([(MUIMessageListNavigationBarTitleView *)self isSubtitleHidden] != a3)
  {
    [(MUIMessageListNavigationBarTitleView *)self setIsSubtitleHidden:v5];
    if (!v5) {
      -[MUIMessageListNavigationBarTitleView _updateSubtitleLayout](self);
    }
    double v7 = [(MUIMessageListNavigationBarTitleView *)self subtitleLabel];
    [v7 frame];
    double Height = CGRectGetHeight(v42);
    double v9 = [(_UINavigationBarTitleView *)self navigationItem];
    CGFloat v10 = [v9 standardAppearance];
    v11 = v10;
    if (v10) {
      id v12 = v10;
    }
    else {
      id v12 = (id)objc_opt_new();
    }
    v13 = v12;

    double v14 = Height * -0.5;
    double v15 = *MEMORY[0x1E4FB2E10];
    if (v5) {
      double v14 = *(double *)(MEMORY[0x1E4FB2E10] + 8);
    }
    else {
      double v15 = 0.0;
    }
    objc_msgSend(v13, "setTitlePositionAdjustment:", v15, v14, *(double *)(MEMORY[0x1E4FB2E10] + 8));
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __67__MUIMessageListNavigationBarTitleView_setSubtitleHidden_animated___block_invoke;
    aBlock[3] = &unk_1E6D11F80;
    id v16 = v9;
    id v39 = v16;
    id v17 = v13;
    id v40 = v17;
    v41 = self;
    double v18 = _Block_copy(aBlock);
    if (v4)
    {
      id v19 = objc_alloc(MEMORY[0x1E4FB1ED8]);
      if (v5)
      {
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __67__MUIMessageListNavigationBarTitleView_setSubtitleHidden_animated___block_invoke_2;
        v35[3] = &unk_1E6D13150;
        id v20 = &v36;
        id v21 = v7;
        id v36 = v21;
        CGRect v22 = &v37;
        id v37 = v18;
        CGRect v23 = (void *)[v19 initWithDuration:0 curve:v35 animations:0.25];
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __67__MUIMessageListNavigationBarTitleView_setSubtitleHidden_animated___block_invoke_3;
        v33[3] = &unk_1E6D13178;
        id v34 = v21;
        [v23 addCompletion:v33];
        [v23 startAnimation];
      }
      else
      {
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __67__MUIMessageListNavigationBarTitleView_setSubtitleHidden_animated___block_invoke_4;
        v30[3] = &unk_1E6D13150;
        id v20 = &v31;
        id v31 = v7;
        CGRect v22 = &v32;
        id v32 = v18;
        CGRect v25 = (void *)[v19 initWithDuration:0 curve:v30 animations:0.25];
        [v25 startAnimation];
      }
    }
    else
    {
      CGRect v24 = (void *)MEMORY[0x1E4FB1EB0];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __67__MUIMessageListNavigationBarTitleView_setSubtitleHidden_animated___block_invoke_5;
      v26[3] = &unk_1E6D131A0;
      id v20 = &v27;
      id v27 = v7;
      BOOL v29 = v5;
      CGRect v22 = &v28;
      id v28 = v18;
      [v24 performWithoutAnimation:v26];
    }
  }
}

void __67__MUIMessageListNavigationBarTitleView_setSubtitleHidden_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setStandardAppearance:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 48) navigationBar];
  [v2 layoutIfNeeded];
}

uint64_t __67__MUIMessageListNavigationBarTitleView_setSubtitleHidden_animated___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:0.0];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

uint64_t __67__MUIMessageListNavigationBarTitleView_setSubtitleHidden_animated___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setHidden:1];
}

uint64_t __67__MUIMessageListNavigationBarTitleView_setSubtitleHidden_animated___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) setHidden:0];
  [*(id *)(a1 + 32) setAlpha:1.0];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

uint64_t __67__MUIMessageListNavigationBarTitleView_setSubtitleHidden_animated___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) setHidden:*(unsigned __int8 *)(a1 + 48)];
  double v2 = 0.0;
  if (!*(unsigned char *)(a1 + 48)) {
    double v2 = 1.0;
  }
  [*(id *)(a1 + 32) setAlpha:v2];
  double v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

- (UINavigationBar)navigationBar
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationBar);
  return (UINavigationBar *)WeakRetained;
}

- (void)setNavigationBar:(id)a3
{
}

- (void)setSubtitleLabel:(id)a3
{
}

- (BOOL)isSubtitleHidden
{
  return self->_isSubtitleHidden;
}

- (void)setIsSubtitleHidden:(BOOL)a3
{
  self->_isSubtitleHidden = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_destroyWeak((id *)&self->_navigationBar);
}

@end