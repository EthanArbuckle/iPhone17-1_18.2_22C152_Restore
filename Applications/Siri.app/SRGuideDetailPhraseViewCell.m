@interface SRGuideDetailPhraseViewCell
+ (CGSize)sizeThatFits:(CGSize)a3 text:(id)a4;
+ (id)_font;
- (NSString)text;
- (SRGuideDetailPhraseViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setText:(id)a3;
@end

@implementation SRGuideDetailPhraseViewCell

+ (CGSize)sizeThatFits:(CGSize)a3 text:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v8 = [a1 _font];
  v15[0] = xmmword_1000DC620;
  v15[1] = unk_1000DC630;
  v15[2] = xmmword_1000DC640;
  uint64_t v16 = 0x4040000000000000;
  +[SiriUITextContainerView sizeThatFits:text:font:textContainerStyle:](SiriUITextContainerView, "sizeThatFits:text:font:textContainerStyle:", v7, v8, v15, width, height);
  double v10 = v9;
  double v12 = v11;

  if (v12 >= SiriUIPlatterStyle[26]) {
    double v13 = v12;
  }
  else {
    double v13 = SiriUIPlatterStyle[26];
  }
  double v14 = v10;
  result.double height = v13;
  result.double width = v14;
  return result;
}

- (SRGuideDetailPhraseViewCell)initWithFrame:(CGRect)a3
{
  v15.receiver = self;
  v15.super_class = (Class)SRGuideDetailPhraseViewCell;
  v3 = -[SRGuideDetailPhraseViewCell initWithFrame:](&v15, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (SiriUITextContainerView *)[objc_alloc((Class)SiriUITextContainerView) initWithText:0 visualEffect:0];
    textContainerView = v3->_textContainerView;
    v3->_textContainerView = v4;

    [(SiriUITextContainerView *)v3->_textContainerView setTextAlignment:SiriLanguageTextAlignmentLeft()];
    v6 = v3->_textContainerView;
    id v7 = [(id)objc_opt_class() _font];
    [(SiriUITextContainerView *)v6 setFont:v7];

    v8 = v3->_textContainerView;
    v13[0] = xmmword_1000DC620;
    v13[1] = unk_1000DC630;
    v13[2] = xmmword_1000DC640;
    uint64_t v14 = 0x4040000000000000;
    [(SiriUITextContainerView *)v8 setTextContainerStyle:v13];
    double v9 = v3->_textContainerView;
    double v10 = +[UIColor siriui_blendEffectColor];
    [(SiriUITextContainerView *)v9 setTextColor:v10];

    double v11 = [(SRGuideDetailPhraseViewCell *)v3 contentView];
    [v11 addSubview:v3->_textContainerView];

    [(SiriUITextContainerView *)v3->_textContainerView siriui_setBlendEffectEnabled:1];
    [(SRGuideDetailPhraseViewCell *)v3 setKeylineType:0];
  }
  return v3;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)SRGuideDetailPhraseViewCell;
  [(SRGuideDetailPhraseViewCell *)&v5 layoutSubviews];
  textContainerView = self->_textContainerView;
  v4 = [(SRGuideDetailPhraseViewCell *)self contentView];
  [v4 bounds];
  -[SiriUITextContainerView setFrame:](textContainerView, "setFrame:");
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)SRGuideDetailPhraseViewCell;
  [(SRGuideDetailPhraseViewCell *)&v3 prepareForReuse];
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
  return +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
}

- (void).cxx_destruct
{
}

@end