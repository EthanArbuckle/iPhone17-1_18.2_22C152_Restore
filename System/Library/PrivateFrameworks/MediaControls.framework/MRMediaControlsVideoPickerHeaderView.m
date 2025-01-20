@interface MRMediaControlsVideoPickerHeaderView
- (CGSize)sizeThatFits:(CGSize)a3;
- (MRMediaControlsVideoPickerHeaderView)initWithFrame:(CGRect)a3;
- (MTVisualStylingProvider)visualStylingProvider;
- (UIImageView)airPlayIconImageView;
- (UILabel)titleLabel;
- (void)_updateStyle;
- (void)layoutSubviews;
- (void)setAirPlayIconImageView:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setVisualStylingProvider:(id)a3;
@end

@implementation MRMediaControlsVideoPickerHeaderView

- (MRMediaControlsVideoPickerHeaderView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v17.receiver = self;
  v17.super_class = (Class)MRMediaControlsVideoPickerHeaderView;
  v7 = -[MRMediaControlsVideoPickerHeaderView initWithFrame:](&v17, sel_initWithFrame_);
  if (v7)
  {
    uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", x, y, width, height);
    titleLabel = v7->_titleLabel;
    v7->_titleLabel = (UILabel *)v8;

    [(UILabel *)v7->_titleLabel setTextAlignment:1];
    [(UILabel *)v7->_titleLabel setNumberOfLines:0];
    v10 = [MEMORY[0x1E4F28B50] mediaControlsBundle];
    v11 = [v10 localizedStringForKey:@"AIRPLAY_VIDEO_PICKER_TITLE" value:&stru_1F06524E0 table:@"MediaControls"];
    [(UILabel *)v7->_titleLabel setText:v11];

    uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1838]), "initWithFrame:", x, y, width, height);
    airPlayIconImageView = v7->_airPlayIconImageView;
    v7->_airPlayIconImageView = (UIImageView *)v12;

    v14 = +[MediaControlsTheme airplayVideoImage];
    [(UIImageView *)v7->_airPlayIconImageView setImage:v14];

    v15 = [MEMORY[0x1E4FB1830] configurationWithPointSize:4 weight:32.0];
    [(UIImageView *)v7->_airPlayIconImageView setPreferredSymbolConfiguration:v15];

    [(MRMediaControlsVideoPickerHeaderView *)v7 addSubview:v7->_titleLabel];
    [(MRMediaControlsVideoPickerHeaderView *)v7 addSubview:v7->_airPlayIconImageView];
  }
  return v7;
}

- (void)layoutSubviews
{
  v28.receiver = self;
  v28.super_class = (Class)MRMediaControlsVideoPickerHeaderView;
  [(MRMediaControlsVideoPickerHeaderView *)&v28 layoutSubviews];
  [(MRMediaControlsVideoPickerHeaderView *)self bounds];
  [(MRMediaControlsVideoPickerHeaderView *)self bounds];
  UIRectCenteredIntegralRect();
  -[UIImageView sizeThatFits:](self->_airPlayIconImageView, "sizeThatFits:", v3, v4);
  UIRectCenteredXInRect();
  double v26 = v6;
  double v27 = v5;
  double v8 = v7;
  double v10 = v9;
  UIRectInset();
  UIRectInset();
  double v12 = v11;
  double v14 = v13;
  v15 = [(MRMediaControlsVideoPickerHeaderView *)self titleLabel];
  objc_msgSend(v15, "sizeThatFits:", v12, v14);

  UIRectCenteredXInRect();
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  v24 = [(MRMediaControlsVideoPickerHeaderView *)self airPlayIconImageView];
  objc_msgSend(v24, "setFrame:", v27, v26, v8, v10);

  v25 = [(MRMediaControlsVideoPickerHeaderView *)self titleLabel];
  objc_msgSend(v25, "setFrame:", v17, v19, v21, v23);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v6 = [(MRMediaControlsVideoPickerHeaderView *)self traitCollection];
  [v6 displayScale];

  UIRoundToScale();
  double v8 = v7;
  -[UIImageView sizeThatFits:](self->_airPlayIconImageView, "sizeThatFits:", width, height);
  double v10 = v9 + 10.0;
  double v11 = [(MRMediaControlsVideoPickerHeaderView *)self titleLabel];
  objc_msgSend(v11, "sizeThatFits:", width, height);
  double v13 = v10 + v12 + 10.0;

  if (v8 >= v13) {
    double v14 = v8;
  }
  else {
    double v14 = v13;
  }
  double v15 = width;
  result.double height = v14;
  result.double width = v15;
  return result;
}

- (void)setVisualStylingProvider:(id)a3
{
  double v5 = (MTVisualStylingProvider *)a3;
  p_visualStylingProvider = &self->_visualStylingProvider;
  visualStylingProvider = self->_visualStylingProvider;
  if (visualStylingProvider != v5)
  {
    double v15 = v5;
    double v8 = [(MRMediaControlsVideoPickerHeaderView *)self titleLabel];
    [(MTVisualStylingProvider *)visualStylingProvider stopAutomaticallyUpdatingView:v8];

    double v9 = *p_visualStylingProvider;
    double v10 = [(MRMediaControlsVideoPickerHeaderView *)self airPlayIconImageView];
    [(MTVisualStylingProvider *)v9 stopAutomaticallyUpdatingView:v10];

    objc_storeStrong((id *)&self->_visualStylingProvider, a3);
    double v11 = *p_visualStylingProvider;
    double v12 = [(MRMediaControlsVideoPickerHeaderView *)self titleLabel];
    [(MTVisualStylingProvider *)v11 automaticallyUpdateView:v12 withStyle:0];

    double v13 = *p_visualStylingProvider;
    double v14 = [(MRMediaControlsVideoPickerHeaderView *)self airPlayIconImageView];
    [(MTVisualStylingProvider *)v13 automaticallyUpdateView:v14 withStyle:0];

    double v5 = v15;
  }
}

- (void)_updateStyle
{
  double v3 = (void *)MEMORY[0x1E4FB08E8];
  uint64_t v4 = *MEMORY[0x1E4FB28F0];
  double v5 = [(MRMediaControlsVideoPickerHeaderView *)self traitCollection];
  double v6 = [v3 preferredFontDescriptorWithTextStyle:v4 compatibleWithTraitCollection:v5];
  id v9 = [v6 fontDescriptorWithSymbolicTraits:2];

  double v7 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v9 size:0.0];
  double v8 = [(MRMediaControlsVideoPickerHeaderView *)self titleLabel];
  [v8 setFont:v7];

  [(MRMediaControlsVideoPickerHeaderView *)self setNeedsLayout];
}

- (MTVisualStylingProvider)visualStylingProvider
{
  return self->_visualStylingProvider;
}

- (UIImageView)airPlayIconImageView
{
  return self->_airPlayIconImageView;
}

- (void)setAirPlayIconImageView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_airPlayIconImageView, 0);

  objc_storeStrong((id *)&self->_visualStylingProvider, 0);
}

@end