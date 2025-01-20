@interface MFMailComposeNavigationBarTitleView
+ (EFLazyCache)attributedStringsCache;
- (BOOL)_needsToLayoutTitleLabel;
- (MFMailComposeNavigationBarTitleView)initWithFrame:(CGRect)a3;
- (NSString)subtitle;
- (NSString)title;
- (UIEdgeInsets)_contentInsetsWithExclusionRects:(id)a3 wantsUniformHorizontalInsets:(BOOL)a4;
- (double)_subtitleFontSizeWhenMini:(BOOL)a3;
- (double)_titleFontSizeWhenMini:(BOOL)a3;
- (double)_topPaddingForTitleWhenMini:(BOOL)a3;
- (double)_verticalOffsetForSubtitleWhenMini:(BOOL)a3;
- (id)_subtitleTextColor;
- (void)_updateHeightForCurrentTraits;
- (void)_updateTrailingBarButtonItemsAlpha;
- (void)contentDidChange;
- (void)didMoveToWindow;
- (void)layoutMarginsDidChange;
- (void)layoutSubviews;
- (void)setSubtitle:(id)a3;
- (void)setSubtitle:(id)a3 withStyle:(unint64_t)a4;
- (void)setTitle:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation MFMailComposeNavigationBarTitleView

+ (EFLazyCache)attributedStringsCache
{
  if (attributedStringsCache_onceToken_0 != -1) {
    dispatch_once(&attributedStringsCache_onceToken_0, &__block_literal_global_22);
  }
  v2 = (void *)attributedStringsCache_sAttributedStringsCache_0;

  return (EFLazyCache *)v2;
}

void __61__MFMailComposeNavigationBarTitleView_attributedStringsCache__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F60D88]) initWithCountLimit:10];
  v1 = (void *)attributedStringsCache_sAttributedStringsCache_0;
  attributedStringsCache_sAttributedStringsCache_0 = v0;
}

- (MFMailComposeNavigationBarTitleView)initWithFrame:(CGRect)a3
{
  v19.receiver = self;
  v19.super_class = (Class)MFMailComposeNavigationBarTitleView;
  v3 = -[_UINavigationBarTitleView initWithFrame:](&v19, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(MFMailComposeNavigationBarTitleView *)v3 setAutoresizingMask:2];
    [(MFMailComposeNavigationBarTitleView *)v4 setInsetsLayoutMarginsFromSafeArea:0];
    [(_UINavigationBarTitleView *)v4 setPreferredContentAlignment:2];
    v4->_style = 0;
    id v5 = objc_alloc(MEMORY[0x1E4FB1930]);
    double v6 = *MEMORY[0x1E4F1DB28];
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v10 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], v7, v8, v9);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = (UILabel *)v10;

    v12 = [MEMORY[0x1E4FB1618] clearColor];
    [(UILabel *)v4->_titleLabel setBackgroundColor:v12];

    v13 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v4->_titleLabel setTextColor:v13];

    [(UILabel *)v4->_titleLabel setTextAlignment:1];
    [(MFMailComposeNavigationBarTitleView *)v4 addSubview:v4->_titleLabel];
    uint64_t v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v6, v7, v8, v9);
    subtitleLabel = v4->_subtitleLabel;
    v4->_subtitleLabel = (UILabel *)v14;

    v16 = [MEMORY[0x1E4FB1618] clearColor];
    [(UILabel *)v4->_subtitleLabel setBackgroundColor:v16];

    v17 = [(MFMailComposeNavigationBarTitleView *)v4 _subtitleTextColor];
    [(UILabel *)v4->_subtitleLabel setTextColor:v17];

    [(UILabel *)v4->_subtitleLabel setTextAlignment:1];
    [(MFMailComposeNavigationBarTitleView *)v4 addSubview:v4->_subtitleLabel];
  }
  return v4;
}

- (void)setTitle:(id)a3
{
  id v6 = a3;
  v4 = [(UILabel *)self->_titleLabel text];
  char v5 = [v4 isEqualToString:v6];

  if ((v5 & 1) == 0)
  {
    [(UILabel *)self->_titleLabel setText:v6];
    [(MFMailComposeNavigationBarTitleView *)self setNeedsLayout];
  }
}

- (NSString)title
{
  return [(UILabel *)self->_titleLabel text];
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)subtitle
{
  return [(UILabel *)self->_subtitleLabel text];
}

- (void)setSubtitle:(id)a3 withStyle:(unint64_t)a4
{
  id v6 = a3;
  double v7 = [(UILabel *)self->_subtitleLabel text];
  char v8 = [v7 isEqualToString:v6];

  if ((v8 & 1) == 0)
  {
    if (_os_feature_enabled_impl())
    {
      double v9 = [(id)objc_opt_class() attributedStringsCache];
      uint64_t v13 = MEMORY[0x1E4F143A8];
      uint64_t v14 = 3221225472;
      v15 = __61__MFMailComposeNavigationBarTitleView_setSubtitle_withStyle___block_invoke;
      v16 = &unk_1E5F7C248;
      unint64_t v18 = a4;
      id v10 = v6;
      id v17 = v10;
      v11 = [v9 objectForKey:v10 generator:&v13];

      subtitleLabel = self->_subtitleLabel;
      if (v11)
      {
        -[UILabel setAttributedText:](subtitleLabel, "setAttributedText:", v11, v13, v14, v15, v16);
      }
      else
      {
        -[UILabel setAttributedText:](subtitleLabel, "setAttributedText:", 0, v13, v14, v15, v16);
        [(UILabel *)self->_subtitleLabel setText:v10];
      }
    }
    else
    {
      [(UILabel *)self->_subtitleLabel setText:v6];
    }
    [(_UINavigationBarTitleView *)self setHideStandardTitle:[(MFMailComposeNavigationBarTitleView *)self _needsToLayoutTitleLabel]];
    [(MFMailComposeNavigationBarTitleView *)self setNeedsLayout];
  }
  if (self->_style != a4)
  {
    self->_style = a4;
    [(MFMailComposeNavigationBarTitleView *)self setNeedsLayout];
  }
}

id __61__MFMailComposeNavigationBarTitleView_setSubtitle_withStyle___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2 == 1)
  {
    v3 = MFImageGlyphLock;
  }
  else
  {
    if (v2 != 3) {
      goto LABEL_7;
    }
    v3 = MFImageGlyphSigned;
  }
  v4 = *v3;
  if (v4)
  {
    char v5 = v4;
    id v6 = (void *)MEMORY[0x1E4FB0870];
    double v7 = objc_msgSend(MEMORY[0x1E4FB1818], "mf_systemImageNamed:forView:", v4, 13);
    char v8 = [v6 textAttachmentWithImage:v7];

    double v9 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:*(void *)(a1 + 32)];
    id v10 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" "];
    [v9 insertAttributedString:v10 atIndex:0];

    v11 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v8];
    [v9 insertAttributedString:v11 atIndex:0];

    goto LABEL_8;
  }
LABEL_7:
  double v9 = 0;
LABEL_8:

  return v9;
}

- (void)layoutMarginsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)MFMailComposeNavigationBarTitleView;
  [(MFMailComposeNavigationBarTitleView *)&v3 layoutMarginsDidChange];
  [(MFMailComposeNavigationBarTitleView *)self setNeedsLayout];
}

- (void)contentDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)MFMailComposeNavigationBarTitleView;
  [(_UINavigationBarTitleView *)&v3 contentDidChange];
  [(_UINavigationBarTitleView *)self setHideStandardTitle:[(MFMailComposeNavigationBarTitleView *)self _needsToLayoutTitleLabel]];
  [(MFMailComposeNavigationBarTitleView *)self _updateTrailingBarButtonItemsAlpha];
  [(MFMailComposeNavigationBarTitleView *)self setNeedsLayout];
}

- (UIEdgeInsets)_contentInsetsWithExclusionRects:(id)a3 wantsUniformHorizontalInsets:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(MFMailComposeNavigationBarTitleView *)self bounds];
  CGFloat MaxX = CGRectGetMaxX(v44);
  [(MFMailComposeNavigationBarTitleView *)self bounds];
  double MidX = CGRectGetMidX(v45);
  CGFloat v37 = MaxX;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v38 objects:v42 count:16];
  CGFloat v10 = *MEMORY[0x1E4F1DB28];
  CGFloat v11 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  CGFloat v13 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  CGFloat v12 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  if (v9)
  {
    uint64_t v14 = *(void *)v39;
    CGFloat v35 = 0.0;
    CGFloat v36 = 0.0;
    CGFloat v34 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v39 != v14) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v38 + 1) + 8 * i) CGRectValue];
        CGFloat x = v46.origin.x;
        CGFloat y = v46.origin.y;
        CGFloat width = v46.size.width;
        CGFloat height = v46.size.height;
        if (CGRectGetMaxX(v46) >= MidX)
        {
          v49.origin.CGFloat y = v36;
          v49.origin.CGFloat x = v37;
          v49.size.CGFloat height = v34;
          v49.size.CGFloat width = v35;
          v56.origin.CGFloat x = x;
          v56.origin.CGFloat y = y;
          v56.size.CGFloat width = width;
          v56.size.CGFloat height = height;
          CGRect v50 = CGRectUnion(v49, v56);
          CGFloat v36 = v50.origin.y;
          CGFloat v37 = v50.origin.x;
          CGFloat v34 = v50.size.height;
          CGFloat v35 = v50.size.width;
        }
        else
        {
          v47.origin.CGFloat x = v10;
          v47.origin.CGFloat y = v11;
          v47.size.CGFloat width = v13;
          v47.size.CGFloat height = v12;
          v55.origin.CGFloat x = x;
          v55.origin.CGFloat y = y;
          v55.size.CGFloat width = width;
          v55.size.CGFloat height = height;
          CGRect v48 = CGRectUnion(v47, v55);
          CGFloat v10 = v48.origin.x;
          CGFloat v11 = v48.origin.y;
          CGFloat v13 = v48.size.width;
          CGFloat v12 = v48.size.height;
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v9);
  }
  else
  {
    CGFloat v35 = 0.0;
    CGFloat v36 = 0.0;
    CGFloat v34 = 0.0;
  }

  v51.origin.CGFloat x = v10;
  v51.origin.CGFloat y = v11;
  v51.size.CGFloat width = v13;
  v51.size.CGFloat height = v12;
  double v20 = CGRectGetMaxX(v51);
  [(MFMailComposeNavigationBarTitleView *)self bounds];
  double v21 = CGRectGetWidth(v52);
  v53.origin.CGFloat y = v36;
  v53.origin.CGFloat x = v37;
  v53.size.CGFloat height = v34;
  v53.size.CGFloat width = v35;
  double MinX = CGRectGetMinX(v53);
  v23 = (double *)MEMORY[0x1E4FB2848];
  double v24 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  if (v24 < v20) {
    double v24 = v20;
  }
  double v25 = v21 - MinX;
  if (*(double *)(MEMORY[0x1E4FB2848] + 24) >= v25) {
    double v25 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  }
  if (v24 >= v25) {
    double v26 = v24;
  }
  else {
    double v26 = v25;
  }
  if (v4) {
    double v27 = v26;
  }
  else {
    double v27 = v24;
  }
  if (v4) {
    double v28 = v26;
  }
  else {
    double v28 = v25;
  }

  double v29 = *v23;
  double v30 = v23[2];
  double v31 = v27;
  double v32 = v28;
  result.right = v32;
  result.bottom = v30;
  result.left = v31;
  result.top = v29;
  return result;
}

- (void)layoutSubviews
{
  v54.receiver = self;
  v54.super_class = (Class)MFMailComposeNavigationBarTitleView;
  [(MFMailComposeNavigationBarTitleView *)&v54 layoutSubviews];
  BOOL v3 = [(MFMailComposeNavigationBarTitleView *)self _needsToLayoutTitleLabel];
  BOOL v4 = [(_UINavigationBarTitleView *)self contentOverlayRects];
  [(MFMailComposeNavigationBarTitleView *)self _contentInsetsWithExclusionRects:v4 wantsUniformHorizontalInsets:0];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  -[UILabel setLayoutMargins:](self->_titleLabel, "setLayoutMargins:", v6, v8, v10, v12);
  -[UILabel setLayoutMargins:](self->_subtitleLabel, "setLayoutMargins:", v6, v8, v10, v12);
  [(MFMailComposeNavigationBarTitleView *)self bounds];
  double v15 = v14;
  double v16 = v13;
  if (v3)
  {
    id v17 = (void *)MEMORY[0x1E4FB08E0];
    [(MFMailComposeNavigationBarTitleView *)self _titleFontSizeWhenMini:v13 <= 32.0];
    unint64_t v18 = objc_msgSend(v17, "boldSystemFontOfSize:");
    [(UILabel *)self->_titleLabel setFont:v18];

    [(UILabel *)self->_titleLabel sizeToFit];
  }
  objc_super v19 = objc_msgSend(MEMORY[0x1E4FB08E0], "preferredFontForTextStyle:", *MEMORY[0x1E4FB28D8], 32.0);
  [(MFMailComposeNavigationBarTitleView *)self _subtitleFontSizeWhenMini:v16 <= 32.0];
  double v20 = objc_msgSend(v19, "fontWithSize:");
  [(UILabel *)self->_subtitleLabel setFont:v20];

  double v21 = [(MFMailComposeNavigationBarTitleView *)self _subtitleTextColor];
  [(UILabel *)self->_subtitleLabel setTextColor:v21];

  [(UILabel *)self->_subtitleLabel sizeToFit];
  [(UILabel *)self->_titleLabel layoutMargins];
  double v23 = v22;
  [(UILabel *)self->_titleLabel layoutMargins];
  if (v3)
  {
    double v25 = v15 - (v23 + v24 + 5.0 + 6.0);
    [(UILabel *)self->_titleLabel frame];
    double v27 = v26;
    [(MFMailComposeNavigationBarTitleView *)self _verticalOffsetForSubtitleWhenMini:v16 <= 32.0];
    double v29 = v28 + v27;
    [(UILabel *)self->_subtitleLabel frame];
    double v31 = v29 + v30;
    [(UILabel *)self->_titleLabel frame];
    double v34 = v33;
    if (v32 >= v25)
    {
      [(UILabel *)self->_titleLabel layoutMargins];
      double v36 = v44 + 5.0;
    }
    else
    {
      float v35 = (v15 - v32) * 0.5;
      double v36 = floorf(v35);
      double v25 = v32;
    }
    BOOL v45 = v16 <= 32.0;
    float v46 = (v16 - v31) * 0.5;
    double v47 = floorf(v46);
    [(MFMailComposeNavigationBarTitleView *)self _topPaddingForTitleWhenMini:v45];
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", v36, v48 + v47, v25, v34);
    [(UILabel *)self->_subtitleLabel frame];
    double v38 = v49;
    double v40 = v50;
    [(UILabel *)self->_titleLabel frame];
    double MaxY = CGRectGetMaxY(v55);
    [(MFMailComposeNavigationBarTitleView *)self _verticalOffsetForSubtitleWhenMini:v45];
    double v43 = MaxY + v52;
  }
  else
  {
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(UILabel *)self->_subtitleLabel frame];
    double v38 = v37;
    double v40 = v39;
    [(UILabel *)self->_subtitleLabel frame];
    float v42 = (v16 - v41) * 0.5;
    double v43 = floorf(v42);
  }
  float v53 = (v15 - v38) * 0.5;
  -[UILabel setFrame:](self->_subtitleLabel, "setFrame:", floorf(v53), v43, v38, v40);
}

- (void)_updateTrailingBarButtonItemsAlpha
{
  [(_UINavigationBarTitleView *)self largeTitleHeight];
  if (v3 <= 16.0 && ([(_UINavigationBarTitleView *)self trailingBarAlpha], v4 == 0.0))
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __73__MFMailComposeNavigationBarTitleView__updateTrailingBarButtonItemsAlpha__block_invoke;
    v8[3] = &unk_1E5F79088;
    v8[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:4 delay:v8 options:0 animations:0.2 completion:0.0];
  }
  else
  {
    [(_UINavigationBarTitleView *)self largeTitleHeight];
    if (v5 > 16.0)
    {
      [(_UINavigationBarTitleView *)self trailingBarAlpha];
      if (v6 == 1.0)
      {
        v7[0] = MEMORY[0x1E4F143A8];
        v7[1] = 3221225472;
        v7[2] = __73__MFMailComposeNavigationBarTitleView__updateTrailingBarButtonItemsAlpha__block_invoke_2;
        v7[3] = &unk_1E5F79088;
        v7[4] = self;
        [MEMORY[0x1E4FB1EB0] animateWithDuration:4 delay:v7 options:0 animations:0.2 completion:0.0];
      }
    }
  }
}

uint64_t __73__MFMailComposeNavigationBarTitleView__updateTrailingBarButtonItemsAlpha__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setTrailingBarAlpha:1.0];
}

uint64_t __73__MFMailComposeNavigationBarTitleView__updateTrailingBarButtonItemsAlpha__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setTrailingBarAlpha:0.0];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)MFMailComposeNavigationBarTitleView;
  [(MFMailComposeNavigationBarTitleView *)&v5 traitCollectionDidChange:v4];
  [(MFMailComposeNavigationBarTitleView *)self _updateHeightForCurrentTraits];
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)MFMailComposeNavigationBarTitleView;
  [(MFMailComposeNavigationBarTitleView *)&v4 didMoveToWindow];
  double v3 = [(MFMailComposeNavigationBarTitleView *)self window];

  if (v3) {
    [(MFMailComposeNavigationBarTitleView *)self _updateHeightForCurrentTraits];
  }
}

- (void)_updateHeightForCurrentTraits
{
  id v5 = [(MFMailComposeNavigationBarTitleView *)self traitCollection];
  if ([v5 verticalSizeClass] == 1)
  {
    uint64_t v3 = [v5 horizontalSizeClass];
    double v4 = 56.0;
    if (v3 == 1) {
      double v4 = 32.0;
    }
  }
  else
  {
    double v4 = 56.0;
  }
  [(_UINavigationBarTitleView *)self setHeight:v4];
}

- (double)_verticalOffsetForSubtitleWhenMini:(BOOL)a3
{
  BOOL v3 = a3;
  double v4 = [(MFMailComposeNavigationBarTitleView *)self subtitle];
  uint64_t v5 = [v4 length];

  double result = 2.0;
  if (v3) {
    double result = 1.0;
  }
  if (!v5) {
    return 0.0;
  }
  return result;
}

- (double)_topPaddingForTitleWhenMini:(BOOL)a3
{
  double v3 = 1.0;
  if (a3)
  {
    double v4 = [(MFMailComposeNavigationBarTitleView *)self subtitle];
    if ([v4 length]) {
      double v3 = -1.0;
    }
    else {
      double v3 = 0.0;
    }
  }
  return v3;
}

- (double)_titleFontSizeWhenMini:(BOOL)a3
{
  double v3 = 17.0;
  if (a3)
  {
    double v4 = [(MFMailComposeNavigationBarTitleView *)self subtitle];
    if ([v4 length]) {
      double v3 = 14.0;
    }
    else {
      double v3 = 17.0;
    }
  }
  return v3;
}

- (double)_subtitleFontSizeWhenMini:(BOOL)a3
{
  double result = 12.0;
  if (a3) {
    return 9.0;
  }
  return result;
}

- (id)_subtitleTextColor
{
  unint64_t style = self->_style;
  if (style > 4)
  {
    double v3 = 0;
  }
  else
  {
    if (((1 << style) & 0xB) != 0) {
      [(MFMailComposeNavigationBarTitleView *)self tintColor];
    }
    else {
    double v3 = [MEMORY[0x1E4FB1618] colorWithRed:0.81 green:0.0 blue:0.06 alpha:1.0];
    }
  }

  return v3;
}

- (BOOL)_needsToLayoutTitleLabel
{
  [(_UINavigationBarTitleView *)self largeTitleHeight];
  if (v3 > 16.0) {
    return 0;
  }
  uint64_t v5 = [(MFMailComposeNavigationBarTitleView *)self subtitle];
  BOOL v4 = [v5 length] != 0;

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleLabel, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end