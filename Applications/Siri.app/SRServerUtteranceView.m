@interface SRServerUtteranceView
+ (double)insertionAnimatedZPosition;
- (BOOL)chevronHasBeenShown;
- (BOOL)isBlendEffectEnabled;
- (CGSize)sizeThatFits:(CGSize)a3;
- (SRServerUtteranceView)initWithFrame:(CGRect)a3;
- (UIFont)font;
- (double)_scaledSiriCorrectionViewLeading;
- (double)baselineOffsetFromBottom;
- (double)firstLineBaselineOffsetFromTop;
- (void)layoutSubviews;
- (void)setAttributedText:(id)a3;
- (void)setBlendEffectEnabled:(BOOL)a3;
- (void)setChevronHidden:(BOOL)a3;
- (void)setFont:(id)a3;
- (void)setText:(id)a3;
@end

@implementation SRServerUtteranceView

- (SRServerUtteranceView)initWithFrame:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)SRServerUtteranceView;
  v3 = -[SRServerUtteranceView initWithFrame:](&v14, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = +[SiriSharedUIContentLabel label];
    label = v3->_label;
    v3->_label = (SiriSharedUIContentLabel *)v4;

    v6 = v3->_label;
    v7 = +[UIColor siriui_lightTextColor];
    [(SiriSharedUIContentLabel *)v6 setTextColor:v7];

    v8 = v3->_label;
    v9 = +[UIFont siriui_serverUtteranceFont];
    [(SiriSharedUIContentLabel *)v8 setFont:v9];

    [(SiriSharedUIContentLabel *)v3->_label setNumberOfLines:0];
    v10 = v3->_label;
    SiriUITextHyphenationFactor();
    *(float *)&double v11 = v11;
    [(SiriSharedUIContentLabel *)v10 _setHyphenationFactor:v11];
    [(SRServerUtteranceView *)v3 addSubview:v3->_label];
    [(SRServerUtteranceView *)v3 setChevronHidden:1];
    CGFloat v12 = SiriUIDefaultEdgePadding;
    v3->_edgeInsets.top = 0.0;
    v3->_edgeInsets.leading = v12;
    v3->_edgeInsets.bottom = 0.0;
    v3->_edgeInsets.trailing = v12;
  }
  return v3;
}

- (void)setChevronHidden:(BOOL)a3
{
  if (!a3) {
    self->_chevronHasBeenShown = 1;
  }
  [(SRServerUtteranceView *)self setNeedsLayout];
}

- (BOOL)chevronHasBeenShown
{
  return self->_chevronHasBeenShown;
}

+ (double)insertionAnimatedZPosition
{
  return -100.0;
}

- (double)firstLineBaselineOffsetFromTop
{
  v2 = [(SiriSharedUIContentLabel *)self->_label font];
  [v2 ascender];
  double v4 = v3;

  return v4;
}

- (double)baselineOffsetFromBottom
{
  v2 = [(SiriSharedUIContentLabel *)self->_label font];
  [v2 descender];
  double v4 = -v3;

  return v4;
}

- (void)setText:(id)a3
{
  CFStringRef v4 = (const __CFString *)a3;
  if (v4) {
    CFStringRef v5 = v4;
  }
  else {
    CFStringRef v5 = &stru_1001463E0;
  }
  v6 = (__CFString *)v5;
  -[SiriSharedUIContentLabel setText:](self->_label, "setText:");
  [(SRServerUtteranceView *)self setNeedsLayout];
}

- (void)setAttributedText:(id)a3
{
  if (a3)
  {
    -[SiriSharedUIContentLabel setAttributedText:](self->_label, "setAttributedText:");
    [(SRServerUtteranceView *)self setNeedsLayout];
  }
  else
  {
    -[SRServerUtteranceView setText:](self, "setText:");
  }
}

- (void)setFont:(id)a3
{
}

- (UIFont)font
{
  return (UIFont *)[(SiriSharedUIContentLabel *)self->_label font];
}

- (BOOL)isBlendEffectEnabled
{
  return self->_blendEffectEnabled;
}

- (void)setBlendEffectEnabled:(BOOL)a3
{
  if (self->_blendEffectEnabled != a3)
  {
    BOOL v3 = a3;
    self->_blendEffectEnabled = a3;
    label = self->_label;
    if (a3) {
      +[UIColor siriui_blendEffectColor];
    }
    else {
    v6 = +[UIColor siriui_lightTextColor];
    }
    [(SiriSharedUIContentLabel *)label setTextColor:v6];

    [(SiriSharedUIContentLabel *)self->_label siriui_setBlendEffectEnabled:v3];
    [(SRServerUtteranceView *)self setNeedsLayout];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  SiriUIUtteranceWidthForAvailableWidthAndInsets();
  -[SiriSharedUIContentLabel sizeThatFits:](self->_label, "sizeThatFits:");
  double v6 = width;
  result.height = v5;
  result.CGFloat width = v6;
  return result;
}

- (void)layoutSubviews
{
  [(SRServerUtteranceView *)self recursive_setSemanticContentAttribute:SiriLanguageSemanticContentAttribute()];
  v12.receiver = self;
  v12.super_class = (Class)SRServerUtteranceView;
  [(SRServerUtteranceView *)&v12 layoutSubviews];
  [(SRServerUtteranceView *)self bounds];
  CGFloat x = v13.origin.x;
  double y = v13.origin.y;
  CGFloat width = v13.size.width;
  CGFloat height = v13.size.height;
  CGRectGetWidth(v13);
  SiriUIUtteranceWidthForAvailableWidthAndInsets();
  double v8 = v7;
  if (SiriLanguageIsRTL())
  {
    v14.origin.CGFloat x = x;
    v14.origin.double y = y;
    v14.size.CGFloat width = width;
    v14.size.CGFloat height = height;
    double leading = CGRectGetWidth(v14) - v8 - self->_edgeInsets.leading;
    uint64_t v10 = 2;
  }
  else
  {
    uint64_t v10 = 0;
    double leading = self->_edgeInsets.leading;
  }
  [(SiriSharedUIContentLabel *)self->_label setTextAlignment:v10];
  -[SiriSharedUIContentLabel sizeThatFits:](self->_label, "sizeThatFits:", v8, 1.79769313e308);
  -[SiriSharedUIContentLabel setFrame:](self->_label, "setFrame:", leading, y, v8, v11);
}

- (double)_scaledSiriCorrectionViewLeading
{
  v2 = +[UIFont siriui_serverUtteranceCorrectionPromptFont];
  [v2 _scaledValueForValue:28.0];
  double v4 = v3;

  return v4;
}

- (void).cxx_destruct
{
}

@end