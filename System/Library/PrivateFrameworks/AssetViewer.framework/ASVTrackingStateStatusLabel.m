@interface ASVTrackingStateStatusLabel
- (ASVBlurredBackgroundView)blurredBackgroundView;
- (ASVTrackingStateStatusLabel)initWithFrame:(CGRect)a3 controlStyle:(int64_t)a4;
- (NSLayoutConstraint)viewWidthConstraint;
- (NSString)text;
- (UILabel)label;
- (int64_t)controlStyle;
- (void)setBlurredBackgroundView:(id)a3;
- (void)setControlStyle:(int64_t)a3;
- (void)setLabel:(id)a3;
- (void)setText:(id)a3;
- (void)setViewWidthConstraint:(id)a3;
@end

@implementation ASVTrackingStateStatusLabel

- (ASVTrackingStateStatusLabel)initWithFrame:(CGRect)a3 controlStyle:(int64_t)a4
{
  v62[8] = *MEMORY[0x1E4F143B8];
  v61.receiver = self;
  v61.super_class = (Class)ASVTrackingStateStatusLabel;
  v5 = -[ASVTrackingStateStatusLabel initWithFrame:](&v61, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    [(ASVTrackingStateStatusLabel *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
    v7 = [ASVBlurredBackgroundView alloc];
    double v8 = *MEMORY[0x1E4F1DB28];
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v12 = -[ASVBlurredBackgroundView initWithFrame:backgroundStyle:controlStyle:](v7, "initWithFrame:backgroundStyle:controlStyle:", 0, a4, *MEMORY[0x1E4F1DB28], v9, v10, v11);
    blurredBackgroundView = v6->_blurredBackgroundView;
    v6->_blurredBackgroundView = (ASVBlurredBackgroundView *)v12;

    [(ASVBlurredBackgroundView *)v6->_blurredBackgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(ASVTrackingStateStatusLabel *)v6 addSubview:v6->_blurredBackgroundView];
    uint64_t v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v8, v9, v10, v11);
    label = v6->_label;
    v6->_label = (UILabel *)v14;

    [(UILabel *)v6->_label setContentMode:7];
    LODWORD(v16) = 1132134400;
    [(UILabel *)v6->_label setContentHuggingPriority:0 forAxis:v16];
    LODWORD(v17) = 1132134400;
    [(UILabel *)v6->_label setContentHuggingPriority:1 forAxis:v17];
    [(UILabel *)v6->_label setTextAlignment:1];
    [(UILabel *)v6->_label setLineBreakMode:4];
    [(UILabel *)v6->_label setNumberOfLines:1];
    v18 = (void *)MEMORY[0x1E4FB08E0];
    v19 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2950]];
    v20 = [v19 fontDescriptor];
    v21 = [v20 fontDescriptorWithSymbolicTraits:2];
    v22 = [v18 fontWithDescriptor:v21 size:0.0];
    [(UILabel *)v6->_label setFont:v22];

    [(UILabel *)v6->_label setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v6->_label setAdjustsFontForContentSizeCategory:1];
    [(UILabel *)v6->_label setAdjustsFontSizeToFitWidth:1];
    if (a4 == 2)
    {
      v23 = [MEMORY[0x1E4FB1618] colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.7];
      [(UILabel *)v6->_label setBackgroundColor:v23];

      [MEMORY[0x1E4FB1618] whiteColor];
    }
    else
    {
      v24 = [MEMORY[0x1E4FB1618] clearColor];
      [(UILabel *)v6->_label setBackgroundColor:v24];

      [MEMORY[0x1E4FB1618] blackColor];
    v25 = };
    [(UILabel *)v6->_label setTextColor:v25];

    [(ASVTrackingStateStatusLabel *)v6 addSubview:v6->_label];
    v26 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AssetViewer"];
    v27 = [v26 localizedStringForKey:@"LOW_DETAIL" value:&stru_1F3DDEEE8 table:0];
    v28 = [(ASVTrackingStateStatusLabel *)v6 label];
    [v28 setText:v27];

    v29 = [(ASVTrackingStateStatusLabel *)v6 widthAnchor];
    v30 = [(ASVTrackingStateStatusLabel *)v6 label];
    [v30 intrinsicContentSize];
    uint64_t v32 = [v29 constraintEqualToConstant:v31 + 36.0];
    viewWidthConstraint = v6->_viewWidthConstraint;
    v6->_viewWidthConstraint = (NSLayoutConstraint *)v32;

    [(NSLayoutConstraint *)v6->_viewWidthConstraint setActive:1];
    v51 = (void *)MEMORY[0x1E4F28DC8];
    v60 = [(ASVBlurredBackgroundView *)v6->_blurredBackgroundView leadingAnchor];
    v59 = [(ASVTrackingStateStatusLabel *)v6 leadingAnchor];
    v58 = [v60 constraintEqualToAnchor:v59];
    v62[0] = v58;
    v57 = [(ASVBlurredBackgroundView *)v6->_blurredBackgroundView trailingAnchor];
    v56 = [(ASVTrackingStateStatusLabel *)v6 trailingAnchor];
    v55 = [v57 constraintEqualToAnchor:v56];
    v62[1] = v55;
    v54 = [(ASVBlurredBackgroundView *)v6->_blurredBackgroundView topAnchor];
    v53 = [(ASVTrackingStateStatusLabel *)v6 topAnchor];
    v52 = [v54 constraintEqualToAnchor:v53];
    v62[2] = v52;
    v50 = [(ASVBlurredBackgroundView *)v6->_blurredBackgroundView bottomAnchor];
    v49 = [(ASVTrackingStateStatusLabel *)v6 bottomAnchor];
    v48 = [v50 constraintEqualToAnchor:v49];
    v62[3] = v48;
    v47 = [(UILabel *)v6->_label leadingAnchor];
    v46 = [(ASVTrackingStateStatusLabel *)v6 leadingAnchor];
    v45 = [v47 constraintEqualToAnchor:v46];
    v62[4] = v45;
    v44 = [(UILabel *)v6->_label trailingAnchor];
    v34 = [(ASVTrackingStateStatusLabel *)v6 trailingAnchor];
    v35 = [v44 constraintEqualToAnchor:v34];
    v62[5] = v35;
    v36 = [(UILabel *)v6->_label topAnchor];
    v37 = [(ASVTrackingStateStatusLabel *)v6 topAnchor];
    v38 = [v36 constraintEqualToAnchor:v37];
    v62[6] = v38;
    v39 = [(UILabel *)v6->_label bottomAnchor];
    v40 = [(ASVTrackingStateStatusLabel *)v6 bottomAnchor];
    v41 = [v39 constraintEqualToAnchor:v40];
    v62[7] = v41;
    v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:8];
    [v51 activateConstraints:v42];

    [(ASVTrackingStateStatusLabel *)v6 _setContinuousCornerRadius:15.0];
    [(ASVTrackingStateStatusLabel *)v6 setClipsToBounds:1];
  }
  return v6;
}

- (void)setText:(id)a3
{
  id v4 = a3;
  v5 = [(ASVTrackingStateStatusLabel *)self label];
  [v5 setText:v4];

  id v7 = [(ASVTrackingStateStatusLabel *)self label];
  [v7 intrinsicContentSize];
  [(NSLayoutConstraint *)self->_viewWidthConstraint setConstant:v6 + 36.0];
}

- (NSString)text
{
  v2 = [(ASVTrackingStateStatusLabel *)self label];
  v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setControlStyle:(int64_t)a3
{
  if (self->_controlStyle != a3)
  {
    self->_controlStyle = a3;
    id v4 = [(ASVTrackingStateStatusLabel *)self blurredBackgroundView];
    [v4 setControlStyle:a3];
  }
}

- (int64_t)controlStyle
{
  return self->_controlStyle;
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (ASVBlurredBackgroundView)blurredBackgroundView
{
  return self->_blurredBackgroundView;
}

- (void)setBlurredBackgroundView:(id)a3
{
}

- (NSLayoutConstraint)viewWidthConstraint
{
  return self->_viewWidthConstraint;
}

- (void)setViewWidthConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_blurredBackgroundView, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end