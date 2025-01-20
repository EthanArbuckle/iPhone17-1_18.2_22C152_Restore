@interface MRMediaControlsVideoPickerFooterView
- (CGSize)sizeThatFits:(CGSize)a3;
- (MRMediaControlsVideoPickerFooterView)initWithFrame:(CGRect)a3;
- (MTVisualStylingProvider)visualStylingProvider;
- (UILabel)customTitleLabel;
- (id)titleLabelText;
- (void)_updateStyle;
- (void)layoutSubviews;
- (void)setCustomTitleLabel:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setVisualStylingProvider:(id)a3;
@end

@implementation MRMediaControlsVideoPickerFooterView

- (MRMediaControlsVideoPickerFooterView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v16.receiver = self;
  v16.super_class = (Class)MRMediaControlsVideoPickerFooterView;
  v7 = -[MPButton initWithFrame:](&v16, sel_initWithFrame_);
  if (v7)
  {
    uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", x, y, width, height);
    customTitleLabel = v7->_customTitleLabel;
    v7->_customTitleLabel = (UILabel *)v8;

    v10 = [(MRMediaControlsVideoPickerFooterView *)v7 customTitleLabel];
    [v10 setTextAlignment:1];

    v11 = [(MRMediaControlsVideoPickerFooterView *)v7 customTitleLabel];
    [v11 setNumberOfLines:1];

    v12 = [(MRMediaControlsVideoPickerFooterView *)v7 titleLabelText];
    v13 = [(MRMediaControlsVideoPickerFooterView *)v7 customTitleLabel];
    [v13 setText:v12];

    v14 = [(MRMediaControlsVideoPickerFooterView *)v7 customTitleLabel];
    [(MRMediaControlsVideoPickerFooterView *)v7 addSubview:v14];
  }
  return v7;
}

- (void)layoutSubviews
{
  v17.receiver = self;
  v17.super_class = (Class)MRMediaControlsVideoPickerFooterView;
  [(MPButton *)&v17 layoutSubviews];
  [(MRMediaControlsVideoPickerFooterView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  v7 = [(MRMediaControlsVideoPickerFooterView *)self customTitleLabel];
  objc_msgSend(v7, "sizeThatFits:", v4, v6);

  UIRectCenteredIntegralRect();
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  objc_super v16 = [(MRMediaControlsVideoPickerFooterView *)self customTitleLabel];
  objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  CGFloat width = a3.width;
  double v5 = [(MRMediaControlsVideoPickerFooterView *)self traitCollection];
  [v5 displayScale];

  UIRoundToScale();
  if (v6 >= height) {
    double v7 = height;
  }
  else {
    double v7 = v6;
  }
  double v8 = width;
  result.double height = v7;
  result.CGFloat width = v8;
  return result;
}

- (id)titleLabelText
{
  int v2 = MGGetSInt32Answer();
  if (v2 == 3)
  {
    double v3 = [MEMORY[0x1E4F28B50] mediaControlsBundle];
    double v4 = v3;
    double v5 = @"AIRPLAY_VIDEO_PICKER_BUTTON_TITLE_IPAD";
  }
  else if (v2 == 2)
  {
    double v3 = [MEMORY[0x1E4F28B50] mediaControlsBundle];
    double v4 = v3;
    double v5 = @"AIRPLAY_VIDEO_PICKER_BUTTON_TITLE_IPOD";
  }
  else
  {
    double v3 = [MEMORY[0x1E4F28B50] mediaControlsBundle];
    double v4 = v3;
    double v5 = @"AIRPLAY_VIDEO_PICKER_BUTTON_TITLE_IPHONE";
  }
  double v6 = [v3 localizedStringForKey:v5 value:&stru_1F06524E0 table:@"MediaControls"];

  return v6;
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MRMediaControlsVideoPickerFooterView;
  -[MRMediaControlsVideoPickerFooterView setHighlighted:](&v11, sel_setHighlighted_);
  if (v3) {
    double v5 = 0.0;
  }
  else {
    double v5 = 0.47;
  }
  double v6 = [(MTVisualStylingProvider *)self->_visualStylingProvider _visualStylingForStyle:0];
  [v6 alpha];
  uint64_t v8 = v7;

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __55__MRMediaControlsVideoPickerFooterView_setHighlighted___block_invoke;
  v9[3] = &unk_1E5F0F628;
  v9[4] = self;
  BOOL v10 = v3;
  v9[5] = v8;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:327684 delay:v9 options:0 animations:v5 completion:0.0];
}

void __55__MRMediaControlsVideoPickerFooterView_setHighlighted___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)) {
    double v1 = *(double *)(a1 + 40) * 0.2;
  }
  else {
    double v1 = *(double *)(a1 + 40);
  }
  id v2 = [*(id *)(a1 + 32) customTitleLabel];
  [v2 setAlpha:v1];
}

- (void)setVisualStylingProvider:(id)a3
{
  double v5 = (MTVisualStylingProvider *)a3;
  visualStylingProvider = self->_visualStylingProvider;
  if (visualStylingProvider != v5)
  {
    BOOL v10 = v5;
    uint64_t v7 = [(MRMediaControlsVideoPickerFooterView *)self customTitleLabel];
    [(MTVisualStylingProvider *)visualStylingProvider stopAutomaticallyUpdatingView:v7];

    objc_storeStrong((id *)&self->_visualStylingProvider, a3);
    uint64_t v8 = self->_visualStylingProvider;
    double v9 = [(MRMediaControlsVideoPickerFooterView *)self customTitleLabel];
    [(MTVisualStylingProvider *)v8 automaticallyUpdateView:v9 withStyle:0];

    double v5 = v10;
  }
}

- (void)_updateStyle
{
  BOOL v3 = (void *)MEMORY[0x1E4FB08E8];
  uint64_t v4 = *MEMORY[0x1E4FB28C8];
  double v5 = [(MRMediaControlsVideoPickerFooterView *)self traitCollection];
  double v6 = [v3 preferredFontDescriptorWithTextStyle:v4 compatibleWithTraitCollection:v5];
  id v11 = [v6 fontDescriptorWithSymbolicTraits:2];

  uint64_t v7 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v11 size:0.0];
  uint64_t v8 = [(MRMediaControlsVideoPickerFooterView *)self customTitleLabel];
  [v8 setFont:v7];

  double v9 = [MEMORY[0x1E4FB1618] whiteColor];
  BOOL v10 = [(MRMediaControlsVideoPickerFooterView *)self customTitleLabel];
  [v10 setTintColor:v9];

  [(MRMediaControlsVideoPickerFooterView *)self setNeedsLayout];
}

- (MTVisualStylingProvider)visualStylingProvider
{
  return self->_visualStylingProvider;
}

- (UILabel)customTitleLabel
{
  return self->_customTitleLabel;
}

- (void)setCustomTitleLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customTitleLabel, 0);

  objc_storeStrong((id *)&self->_visualStylingProvider, 0);
}

@end