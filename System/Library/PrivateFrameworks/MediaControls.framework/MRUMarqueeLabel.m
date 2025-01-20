@interface MRUMarqueeLabel
- (BOOL)isMarqueeEnabled;
- (BOOL)wantsContentAwareTypesettingLanguage;
- (BSUIEmojiLabelView)label;
- (CGSize)contentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MPUMarqueeView)marqueeView;
- (MRUMarqueeLabel)initWithFrame:(CGRect)a3;
- (NSString)text;
- (UIColor)textColor;
- (UIEdgeInsets)fadeEdgeInsets;
- (UIFont)font;
- (UIView)animationReferenceView;
- (double)contentGap;
- (id)viewForFirstBaselineLayout;
- (int64_t)numberOfLines;
- (int64_t)sizingRule;
- (int64_t)textAlignment;
- (void)addCoordinatedMarqueeView:(id)a3;
- (void)layoutSubviews;
- (void)mru_applyVisualStylingWithColor:(id)a3 alpha:(double)a4 blendMode:(int64_t)a5;
- (void)mt_applyVisualStyling:(id)a3;
- (void)setAnimationReferenceView:(id)a3;
- (void)setContentGap:(double)a3;
- (void)setContentSize:(CGSize)a3;
- (void)setFadeEdgeInsets:(UIEdgeInsets)a3;
- (void)setFont:(id)a3;
- (void)setMarqueeEnabled:(BOOL)a3;
- (void)setMarqueeView:(id)a3;
- (void)setNumberOfLines:(int64_t)a3;
- (void)setSizingRule:(int64_t)a3;
- (void)setText:(id)a3;
- (void)setTextAlignment:(int64_t)a3;
- (void)setTextColor:(id)a3;
- (void)setWantsContentAwareTypesettingLanguage:(BOOL)a3;
@end

@implementation MRUMarqueeLabel

- (void)mt_applyVisualStyling:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __76__MRUMarqueeLabel_MRUVisualStylingProviderAdditions__mt_applyVisualStyling___block_invoke;
  v3[3] = &unk_1E5F0E7C0;
  v3[4] = self;
  [a3 applyToView:self withColorBlock:v3];
}

uint64_t __76__MRUMarqueeLabel_MRUVisualStylingProviderAdditions__mt_applyVisualStyling___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setTextColor:a2];
}

- (void)mru_applyVisualStylingWithColor:(id)a3 alpha:(double)a4 blendMode:(int64_t)a5
{
  id v8 = a3;
  [(MRUMarqueeLabel *)self setAlpha:a4];
  [(MRUMarqueeLabel *)self _setDrawsAsBackdropOverlayWithBlendMode:a5];
  [(MRUMarqueeLabel *)self setTextColor:v8];
}

- (MRUMarqueeLabel)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)MRUMarqueeLabel;
  v3 = -[MRUMarqueeLabel initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (BSUIEmojiLabelView *)objc_alloc_init(MEMORY[0x1E4F4F8B0]);
    label = v3->_label;
    v3->_label = v4;

    [(BSUIEmojiLabelView *)v3->_label setNumberOfLines:1];
    v6 = (MPUMarqueeView *)objc_alloc_init(MEMORY[0x1E4F76EE0]);
    marqueeView = v3->_marqueeView;
    v3->_marqueeView = v6;

    id v8 = [(MPUMarqueeView *)v3->_marqueeView contentView];
    [v8 addSubview:v3->_label];

    [(MPUMarqueeView *)v3->_marqueeView setViewForContentSize:v3->_label];
    [(MRUMarqueeLabel *)v3 addSubview:v3->_marqueeView];
  }
  return v3;
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)MRUMarqueeLabel;
  [(MRUMarqueeLabel *)&v13 layoutSubviews];
  [(MRUMarqueeLabel *)self bounds];
  CGFloat x = v14.origin.x;
  CGFloat y = v14.origin.y;
  CGFloat width = v14.size.width;
  CGFloat height = v14.size.height;
  CGFloat v7 = CGRectGetMinX(v14) - self->_fadeEdgeInsets.left;
  v15.origin.CGFloat x = x;
  v15.origin.CGFloat y = y;
  v15.size.CGFloat width = width;
  v15.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v15);
  v16.origin.CGFloat x = x;
  v16.origin.CGFloat y = y;
  v16.size.CGFloat width = width;
  v16.size.CGFloat height = height;
  CGFloat v9 = CGRectGetWidth(v16) + self->_fadeEdgeInsets.left;
  v17.origin.CGFloat x = x;
  v17.origin.CGFloat y = y;
  v17.size.CGFloat width = width;
  v17.size.CGFloat height = height;
  -[MPUMarqueeView setFrame:](self->_marqueeView, "setFrame:", v7, MinY, v9, CGRectGetHeight(v17));
  if (self->_textAlignment == 1
    && (v18.origin.CGFloat x = x,
        v18.origin.CGFloat y = y,
        v18.size.CGFloat width = width,
        v18.size.CGFloat height = height,
        double v10 = self->_contentSize.width,
        v10 < CGRectGetWidth(v18)))
  {
    UIRectCenteredXInRect();
  }
  else if (([(NSString *)self->_text _isNaturallyRTL] & 1) != 0 {
         || (double v12 = self->_contentSize.width,
  }
             v19.origin.CGFloat x = x,
             v19.origin.CGFloat y = y,
             v19.size.CGFloat width = width,
             v19.size.CGFloat height = height,
             v12 < CGRectGetWidth(v19)))
  {
    [(MRUMarqueeLabel *)self bounds];
    MPRectByApplyingUserInterfaceLayoutDirectionInRect();
  }
  else
  {
    double v11 = 0.0;
  }
  [(BSUIEmojiLabelView *)self->_label setFrame:v11];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[BSUIEmojiLabelView sizeThatFits:](self->_label, "sizeThatFits:", a3.width, a3.height);
  result.CGFloat height = v4;
  result.CGFloat width = v3;
  return result;
}

- (void)setText:(id)a3
{
  id v4 = a3;
  v5 = (NSString *)[v4 copy];
  text = self->_text;
  self->_text = v5;

  [(BSUIEmojiLabelView *)self->_label setText:v4];
  unsigned int v7 = [v4 _isNaturallyRTL];

  [(MPUMarqueeView *)self->_marqueeView setAnimationDirection:v7];
  if (v7) {
    uint64_t v8 = 4;
  }
  else {
    uint64_t v8 = 3;
  }
  [(MPUMarqueeView *)self->_marqueeView setSemanticContentAttribute:v8];

  [(MRUMarqueeLabel *)self setNeedsLayout];
}

- (void)setTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_textColor, a3);
  id v5 = a3;
  [(BSUIEmojiLabelView *)self->_label setTextColor:v5];
}

- (void)setAnimationReferenceView:(id)a3
{
  p_animationReferenceView = &self->_animationReferenceView;
  id v5 = a3;
  objc_storeWeak((id *)p_animationReferenceView, v5);
  [(MPUMarqueeView *)self->_marqueeView setAnimationReferenceView:v5];
}

- (void)setFont:(id)a3
{
  objc_storeStrong((id *)&self->_font, a3);
  id v5 = a3;
  [(BSUIEmojiLabelView *)self->_label setFont:v5];
}

- (void)setNumberOfLines:(int64_t)a3
{
  self->_numberOfLines = a3;
  -[BSUIEmojiLabelView setNumberOfLines:](self->_label, "setNumberOfLines:");
}

- (void)setTextAlignment:(int64_t)a3
{
  self->_textAlignment = a3;
  -[BSUIEmojiLabelView setTextAlignment:](self->_label, "setTextAlignment:");
}

- (void)setMarqueeEnabled:(BOOL)a3
{
  self->_marqueeEnabled = a3;
  -[MPUMarqueeView setMarqueeEnabled:](self->_marqueeView, "setMarqueeEnabled:");
  if (!a3)
  {
    [(MPUMarqueeView *)self->_marqueeView resetMarqueePosition];
    marqueeView = self->_marqueeView;
    [(MPUMarqueeView *)marqueeView _removeAllAnimations:1];
  }
}

- (void)setFadeEdgeInsets:(UIEdgeInsets)a3
{
  self->_fadeEdgeInsets = a3;
  -[MPUMarqueeView setFadeEdgeInsets:](self->_marqueeView, "setFadeEdgeInsets:");

  [(MRUMarqueeLabel *)self setNeedsLayout];
}

- (void)setContentGap:(double)a3
{
  self->_contentGap = a3;
  -[MPUMarqueeView setContentGap:](self->_marqueeView, "setContentGap:");
}

- (void)setContentSize:(CGSize)a3
{
  self->_contentSize = a3;
  -[MPUMarqueeView setContentSize:](self->_marqueeView, "setContentSize:");

  [(MRUMarqueeLabel *)self setNeedsLayout];
}

- (id)viewForFirstBaselineLayout
{
  return (id)[(BSUIEmojiLabelView *)self->_label contentLabel];
}

- (BOOL)wantsContentAwareTypesettingLanguage
{
  v2 = [(BSUIEmojiLabelView *)self->_label contentLabel];
  char v3 = [v2 _wantsContentAwareTypesettingLanguage];

  return v3;
}

- (void)setWantsContentAwareTypesettingLanguage:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(BSUIEmojiLabelView *)self->_label contentLabel];
  [v4 _setWantsContentAwareTypesettingLanguage:v3];
}

- (int64_t)sizingRule
{
  v2 = [(BSUIEmojiLabelView *)self->_label contentLabel];
  int64_t v3 = [v2 sizingRule];

  return v3;
}

- (void)setSizingRule:(int64_t)a3
{
  id v4 = [(BSUIEmojiLabelView *)self->_label contentLabel];
  [v4 setSizingRule:a3];
}

- (void)addCoordinatedMarqueeView:(id)a3
{
  marqueeView = self->_marqueeView;
  id v4 = [a3 marqueeView];
  [(MPUMarqueeView *)marqueeView addCoordinatedMarqueeView:v4];
}

- (NSString)text
{
  return self->_text;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (UIView)animationReferenceView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_animationReferenceView);

  return (UIView *)WeakRetained;
}

- (UIFont)font
{
  return self->_font;
}

- (int64_t)numberOfLines
{
  return self->_numberOfLines;
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (BOOL)isMarqueeEnabled
{
  return self->_marqueeEnabled;
}

- (UIEdgeInsets)fadeEdgeInsets
{
  double top = self->_fadeEdgeInsets.top;
  double left = self->_fadeEdgeInsets.left;
  double bottom = self->_fadeEdgeInsets.bottom;
  double right = self->_fadeEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (double)contentGap
{
  return self->_contentGap;
}

- (CGSize)contentSize
{
  double width = self->_contentSize.width;
  double height = self->_contentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BSUIEmojiLabelView)label
{
  return self->_label;
}

- (MPUMarqueeView)marqueeView
{
  return self->_marqueeView;
}

- (void)setMarqueeView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_marqueeView, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_destroyWeak((id *)&self->_animationReferenceView);
  objc_storeStrong((id *)&self->_textColor, 0);

  objc_storeStrong((id *)&self->_text, 0);
}

@end