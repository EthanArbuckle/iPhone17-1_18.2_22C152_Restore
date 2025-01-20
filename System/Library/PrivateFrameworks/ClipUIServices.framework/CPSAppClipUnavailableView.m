@interface CPSAppClipUnavailableView
- (CPSAppClipUnavailableView)initWithFrame:(CGRect)a3;
- (NSString)reasonString;
- (void)_openButtonTapped:(id)a3;
- (void)_setUpViews;
- (void)enableURLFallbackWithAction:(id)a3;
- (void)setReasonString:(id)a3;
@end

@implementation CPSAppClipUnavailableView

- (CPSAppClipUnavailableView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CPSAppClipUnavailableView;
  v3 = -[CPSAppClipUnavailableView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(CPSAppClipUnavailableView *)v3 _setUpViews];
    v5 = v4;
  }

  return v4;
}

- (void)_setUpViews
{
  v20[4] = *MEMORY[0x1E4F143B8];
  v3 = [CPSVibrantLabel alloc];
  v4 = [(CPSVibrantLabel *)v3 initWithTextStyle:*MEMORY[0x1E4F43870] textVariant:0 vibrancyEffectStyle:1];
  reasonLabel = self->_reasonLabel;
  self->_reasonLabel = v4;

  [(CPSVibrantLabel *)self->_reasonLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CPSVibrantLabel *)self->_reasonLabel setNumberOfLines:3];
  [(CPSVibrantLabel *)self->_reasonLabel setAdjustsFontForContentSizeCategory:1];
  [(CPSVibrantLabel *)self->_reasonLabel setTextAlignment:1];
  [(CPSVibrantLabel *)self->_reasonLabel setLineBreakMode:5];
  [(CPSVibrantLabel *)self->_reasonLabel setAdjustsFontSizeToFitWidth:1];
  [(CPSAppClipUnavailableView *)self addSubview:self->_reasonLabel];
  v16 = (void *)MEMORY[0x1E4F28DC8];
  v19 = [(CPSVibrantLabel *)self->_reasonLabel centerXAnchor];
  v18 = [(CPSAppClipUnavailableView *)self centerXAnchor];
  v17 = [v19 constraintEqualToAnchor:v18];
  v20[0] = v17;
  v6 = [(CPSVibrantLabel *)self->_reasonLabel centerYAnchor];
  objc_super v7 = [(CPSAppClipUnavailableView *)self centerYAnchor];
  v8 = [v6 constraintEqualToAnchor:v7];
  v20[1] = v8;
  v9 = [(CPSAppClipUnavailableView *)self widthAnchor];
  v10 = [(CPSVibrantLabel *)self->_reasonLabel widthAnchor];
  v11 = [v9 constraintGreaterThanOrEqualToAnchor:v10 multiplier:1.0 constant:60.0];
  v20[2] = v11;
  v12 = [(CPSAppClipUnavailableView *)self heightAnchor];
  v13 = [(CPSVibrantLabel *)self->_reasonLabel heightAnchor];
  v14 = [v12 constraintGreaterThanOrEqualToAnchor:v13];
  v20[3] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:4];
  [v16 activateConstraints:v15];
}

- (NSString)reasonString
{
  return [(CPSVibrantLabel *)self->_reasonLabel text];
}

- (void)setReasonString:(id)a3
{
}

- (void)enableURLFallbackWithAction:(id)a3
{
  v28[3] = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  v4 = [CPSButton alloc];
  v5 = _CPSLocalizedString();
  v6 = [MEMORY[0x1E4F428B8] systemBlueColor];
  uint64_t v7 = *MEMORY[0x1E4F438A0];
  v8 = [(CPSButton *)v4 initWithTitle:v5 enabledTitleColor:v6 disabledTitleColor:0 backgroundColor:0 textStyle:*MEMORY[0x1E4F438A0] cornerRadius:1 animatesAlphaWhenHighlighted:0.0];
  fallbackOpenButton = self->_fallbackOpenButton;
  self->_fallbackOpenButton = v8;

  v10 = [MEMORY[0x1E4F42A30] _preferredFontForTextStyle:v7 variant:8];
  v11 = [(CPSButton *)self->_fallbackOpenButton titleLabel];
  [v11 setFont:v10];

  -[CPSButton setContentEdgeInsets:](self->_fallbackOpenButton, "setContentEdgeInsets:", 8.0, 27.0, 8.0, 27.0);
  [(CPSButton *)self->_fallbackOpenButton addTarget:self action:sel__openButtonTapped_ forControlEvents:64];
  [(CPSAppClipUnavailableView *)self addSubview:self->_fallbackOpenButton];
  [(CPSButton *)self->_fallbackOpenButton setTranslatesAutoresizingMaskIntoConstraints:0];
  LODWORD(v12) = 1144766464;
  [(CPSButton *)self->_fallbackOpenButton setContentCompressionResistancePriority:0 forAxis:v12];
  LODWORD(v13) = 1132134400;
  [(CPSButton *)self->_fallbackOpenButton setContentHuggingPriority:0 forAxis:v13];
  v25 = (void *)MEMORY[0x1E4F28DC8];
  v26 = [(CPSButton *)self->_fallbackOpenButton centerXAnchor];
  v14 = [(CPSAppClipUnavailableView *)self centerXAnchor];
  v15 = [v26 constraintEqualToAnchor:v14];
  v28[0] = v15;
  v16 = [(CPSButton *)self->_fallbackOpenButton topAnchor];
  v17 = [(CPSVibrantLabel *)self->_reasonLabel bottomAnchor];
  v18 = [v16 constraintEqualToAnchor:v17];
  v28[1] = v18;
  v19 = [(CPSAppClipUnavailableView *)self bottomAnchor];
  v20 = [(CPSButton *)self->_fallbackOpenButton bottomAnchor];
  v21 = [v19 constraintGreaterThanOrEqualToAnchor:v20 constant:16.0];
  v28[2] = v21;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:3];
  [v25 activateConstraints:v22];

  v23 = (void *)MEMORY[0x1D9487A30](v27);
  id fallbackURLAction = self->_fallbackURLAction;
  self->_id fallbackURLAction = v23;
}

- (void)_openButtonTapped:(id)a3
{
  id fallbackURLAction = (void (**)(id, SEL, id))self->_fallbackURLAction;
  if (fallbackURLAction)
  {
    fallbackURLAction[2](fallbackURLAction, a2, a3);
    id fallbackURLAction = (void (**)(id, SEL, id))self->_fallbackURLAction;
  }
  self->_id fallbackURLAction = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fallbackURLAction, 0);
  objc_storeStrong((id *)&self->_fallbackOpenButton, 0);

  objc_storeStrong((id *)&self->_reasonLabel, 0);
}

@end