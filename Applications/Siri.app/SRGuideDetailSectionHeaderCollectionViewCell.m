@interface SRGuideDetailSectionHeaderCollectionViewCell
+ (CGSize)sizeThatFits:(CGSize)a3 text:(id)a4;
+ (double)_leadingHorizontalOffsetWithLayoutMargins:(UIEdgeInsets)a3;
+ (double)_trailingHorizontalOffsetWithLayoutMargins:(UIEdgeInsets)a3;
+ (id)_font;
- (NSString)text;
- (SRGuideDetailSectionHeaderCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setText:(id)a3;
@end

@implementation SRGuideDetailSectionHeaderCollectionViewCell

+ (CGSize)sizeThatFits:(CGSize)a3 text:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v8 = [a1 _font];
  v22[0] = xmmword_10016E570;
  v22[1] = unk_10016E580;
  v22[2] = xmmword_10016E590;
  uint64_t v23 = qword_10016E5A0;
  +[SiriUITextContainerView sizeThatFits:text:font:textContainerStyle:](SiriUITextContainerView, "sizeThatFits:text:font:textContainerStyle:", v7, v8, v22, width, height);
  double v10 = v9;
  double v12 = v11;

  double v13 = SiriUIPlatterStyle[31];
  double v14 = SiriUIPlatterStyle[32];
  double v15 = SiriUIPlatterStyle[33];
  double v16 = SiriUIPlatterStyle[34];
  [a1 _leadingHorizontalOffsetWithLayoutMargins:v13, v14, v15, v16];
  double v18 = v10 - v17;
  [a1 _trailingHorizontalOffsetWithLayoutMargins:v13, v14, v15, v16];
  double v20 = v18 - v19;
  double v21 = SiriUIPlatterStyle[26];
  if (v12 >= v21) {
    double v21 = v12;
  }
  result.double height = v21;
  result.double width = v20;
  return result;
}

- (SRGuideDetailSectionHeaderCollectionViewCell)initWithFrame:(CGRect)a3
{
  v17.receiver = self;
  v17.super_class = (Class)SRGuideDetailSectionHeaderCollectionViewCell;
  v3 = -[SRGuideDetailSectionHeaderCollectionViewCell initWithFrame:](&v17, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    long long v4 = *(_OWORD *)&UIEdgeInsetsZero.bottom;
    unk_10016E588 = *(_OWORD *)&UIEdgeInsetsZero.top;
    *(long long *)((char *)&xmmword_10016E590 + 8) = v4;
    v5 = (SiriUITextContainerView *)[objc_alloc((Class)SiriUITextContainerView) initWithText:0];
    textContainerView = v3->_textContainerView;
    v3->_textContainerView = v5;

    [(SiriUITextContainerView *)v3->_textContainerView setTextAlignment:SiriLanguageTextAlignmentLeft()];
    id v7 = v3->_textContainerView;
    v8 = [(id)objc_opt_class() _font];
    [(SiriUITextContainerView *)v7 setFont:v8];

    double v9 = v3->_textContainerView;
    v15[0] = xmmword_10016E570;
    v15[1] = unk_10016E580;
    v15[2] = xmmword_10016E590;
    uint64_t v16 = qword_10016E5A0;
    [(SiriUITextContainerView *)v9 setTextContainerStyle:v15];
    double v10 = v3->_textContainerView;
    double v11 = +[UIColor siriui_lightTextColor];
    [(SiriUITextContainerView *)v10 setTextColor:v11];

    double v12 = [(SRGuideDetailSectionHeaderCollectionViewCell *)v3 contentView];
    [v12 addSubview:v3->_textContainerView];

    [(SRGuideDetailSectionHeaderCollectionViewCell *)v3 setKeylineType:3];
    double v13 = +[UIColor siriui_lightKeylineColor];
    [(SRGuideDetailSectionHeaderCollectionViewCell *)v3 setKeylineCustomBackgroundColor:v13];
  }
  return v3;
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)SRGuideDetailSectionHeaderCollectionViewCell;
  [(SRGuideDetailSectionHeaderCollectionViewCell *)&v14 layoutSubviews];
  v3 = objc_opt_class();
  double v4 = SiriUIPlatterStyle[31];
  double v5 = SiriUIPlatterStyle[32];
  double v6 = SiriUIPlatterStyle[33];
  double v7 = SiriUIPlatterStyle[34];
  [v3 _leadingHorizontalOffsetWithLayoutMargins:v4, v5, v6, v7];
  double v9 = v8;
  [objc_opt_class() _trailingHorizontalOffsetWithLayoutMargins:v4, v5, v6, v7];
  double v11 = v10;
  textContainerView = self->_textContainerView;
  [(SRGuideDetailSectionHeaderCollectionViewCell *)self bounds];
  CGFloat v13 = CGRectGetWidth(v15) - v9 - v11;
  [(SRGuideDetailSectionHeaderCollectionViewCell *)self bounds];
  -[SiriUITextContainerView setFrame:](textContainerView, "setFrame:", v9, 0.0, v13, CGRectGetHeight(v16));
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)SRGuideDetailSectionHeaderCollectionViewCell;
  [(SRGuideDetailSectionHeaderCollectionViewCell *)&v3 prepareForReuse];
  [(SiriUITextContainerView *)self->_textContainerView setText:0];
}

- (void)setText:(id)a3
{
}

- (NSString)text
{
  return (NSString *)[(SiriUITextContainerView *)self->_textContainerView text];
}

+ (id)_font
{
  v2 = +[UIFont preferredFontForTextStyle:UIFontTextStyleTitle3];
  objc_super v3 = [v2 fontDescriptor];
  double v4 = [v3 fontDescriptorWithSymbolicTraits:2];

  double v5 = +[UIFont fontWithDescriptor:v4 size:0.0];

  return v5;
}

+ (double)_leadingHorizontalOffsetWithLayoutMargins:(UIEdgeInsets)a3
{
  double right = a3.right;
  double left = a3.left;
  if (SiriUISystemLanguageIsRTL()) {
    return left;
  }
  else {
    return right;
  }
}

+ (double)_trailingHorizontalOffsetWithLayoutMargins:(UIEdgeInsets)a3
{
  double right = a3.right;
  double left = a3.left;
  if (SiriUISystemLanguageIsRTL()) {
    return right;
  }
  else {
    return left;
  }
}

- (void).cxx_destruct
{
}

@end