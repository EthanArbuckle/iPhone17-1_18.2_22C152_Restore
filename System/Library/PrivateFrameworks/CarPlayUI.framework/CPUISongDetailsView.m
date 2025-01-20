@interface CPUISongDetailsView
+ (double)maximumHeightForTrackInfoFontStyle:(unint64_t)a3;
+ (double)minimumHeightForTrackInfoFontStyle:(unint64_t)a3;
- (CGSize)intrinsicContentSize;
- (CGSize)maximumTitleViewSize;
- (CPUIModernButton)albumArtistLabelButton;
- (CPUIModernButton)attributionButton;
- (CPUISongAttributionView)attributionView;
- (CPUISongDetailsView)initWithFrame:(CGRect)a3;
- (CPUITitleView)titleView;
- (NSString)albumTitle;
- (NSString)artistName;
- (NSString)attributionName;
- (NSString)trackTitle;
- (UIImage)attributionArtwork;
- (UILabel)artistLabel;
- (UIStackView)stackView;
- (_CPUIAlbumContainer)albumContainer;
- (id)_attributedTitle;
- (unint64_t)fontStyle;
- (void)_updateFont;
- (void)_updateNumberOfLines;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)setAlbumContainer:(id)a3;
- (void)setAlbumTitle:(id)a3;
- (void)setArtistLabel:(id)a3;
- (void)setArtistName:(id)a3;
- (void)setAttributionArtwork:(id)a3;
- (void)setAttributionName:(id)a3;
- (void)setAttributionView:(id)a3;
- (void)setFontStyle:(unint64_t)a3;
- (void)setMaximumTitleViewSize:(CGSize)a3;
- (void)setStackView:(id)a3;
- (void)setTrackTitle:(id)a3;
@end

@implementation CPUISongDetailsView

- (CPUISongDetailsView)initWithFrame:(CGRect)a3
{
  v51[3] = *MEMORY[0x263EF8340];
  v50.receiver = self;
  v50.super_class = (Class)CPUISongDetailsView;
  v3 = -[CPUISongDetailsView initWithFrame:](&v50, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F82BF8]);
    double v5 = *MEMORY[0x263F001A8];
    double v6 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v7 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v8 = *(double *)(MEMORY[0x263F001A8] + 24);
    uint64_t v9 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], v6, v7, v8);
    stackView = v3->_stackView;
    v3->_stackView = (UIStackView *)v9;

    [(UIStackView *)v3->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v3->_stackView setAxis:1];
    [(UIStackView *)v3->_stackView setAlignment:3];
    [(UIStackView *)v3->_stackView setSpacing:0.0];
    [(UIStackView *)v3->_stackView setAccessibilityIdentifier:@"CPNowPlayingSongDetailsView"];
    [(CPUISongDetailsView *)v3 addSubview:v3->_stackView];
    v11 = -[CPUISongAttributionView initWithFrame:]([CPUISongAttributionView alloc], "initWithFrame:", v5, v6, v7, v8);
    attributionView = v3->_attributionView;
    v3->_attributionView = v11;

    [(CPUISongAttributionView *)v3->_attributionView setHidden:1];
    LODWORD(v13) = 1144750080;
    [(CPUISongAttributionView *)v3->_attributionView setContentCompressionResistancePriority:1 forAxis:v13];
    LODWORD(v14) = 1148846080;
    [(CPUISongAttributionView *)v3->_attributionView setContentHuggingPriority:1 forAxis:v14];
    [(UIStackView *)v3->_stackView addArrangedSubview:v3->_attributionView];
    [(UIStackView *)v3->_stackView setCustomSpacing:v3->_attributionView afterView:3.0];
    v15 = -[CPUITitleView initWithFrame:]([CPUITitleView alloc], "initWithFrame:", v5, v6, v7, v8);
    titleView = v3->_titleView;
    v3->_titleView = v15;

    LODWORD(v17) = 1144750080;
    [(CPUITitleView *)v3->_titleView setContentCompressionResistancePriority:1 forAxis:v17];
    LODWORD(v18) = 1148846080;
    [(CPUITitleView *)v3->_titleView setContentHuggingPriority:1 forAxis:v18];
    [(CPUITitleView *)v3->_titleView setAccessibilityIdentifier:@"CPNowPlayingSongTitle"];
    [(UIStackView *)v3->_stackView addArrangedSubview:v3->_titleView];
    uint64_t v19 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v5, v6, v7, v8);
    artistLabel = v3->_artistLabel;
    v3->_artistLabel = (UILabel *)v19;

    v21 = [MEMORY[0x263F825C8] labelColor];
    [(UILabel *)v3->_artistLabel setTextColor:v21];

    LODWORD(v22) = 1144750080;
    [(UILabel *)v3->_artistLabel setContentCompressionResistancePriority:1 forAxis:v22];
    LODWORD(v23) = 1148846080;
    [(UILabel *)v3->_artistLabel setContentHuggingPriority:1 forAxis:v23];
    [(UILabel *)v3->_artistLabel setAccessibilityIdentifier:@"CPNowPlayingSongArtist"];
    [(UIStackView *)v3->_stackView addArrangedSubview:v3->_artistLabel];
    uint64_t v24 = objc_opt_new();
    albumArtistLabelButton = v3->_albumArtistLabelButton;
    v3->_albumArtistLabelButton = (CPUIModernButton *)v24;

    [(CPUIModernButton *)v3->_albumArtistLabelButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v26 = [(CPUIModernButton *)v3->_albumArtistLabelButton titleLabel];
    [v26 setLineBreakMode:4];

    [(CPUIModernButton *)v3->_albumArtistLabelButton setEnabled:0];
    [(CPUIModernButton *)v3->_albumArtistLabelButton setTintAdjustmentMode:1];
    -[CPUIModernButton setContentEdgeInsets:](v3->_albumArtistLabelButton, "setContentEdgeInsets:", 0.0, 5.0, 0.0, 4.0);
    [(CPUIModernButton *)v3->_albumArtistLabelButton _setContinuousCornerRadius:4.0];
    [(CPUIModernButton *)v3->_albumArtistLabelButton setAccessibilityIdentifier:@"CPNowPlayingSongAlbum"];
    v27 = [(CPUIModernButton *)v3->_albumArtistLabelButton layer];
    [v27 setCompositingFilter:0];

    v28 = [(CPUIModernButton *)v3->_albumArtistLabelButton layer];
    [v28 setAllowsGroupBlending:0];

    v29 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15D58]];
    v30 = [(CPUIModernButton *)v3->_albumArtistLabelButton _titleView];
    v31 = [v30 layer];
    [v31 setCompositingFilter:v29];

    v32 = [[_CPUIAlbumContainer alloc] initWithButton:v3->_albumArtistLabelButton];
    albumContainer = v3->_albumContainer;
    v3->_albumContainer = v32;

    [(UIStackView *)v3->_stackView addArrangedSubview:v3->_albumContainer];
    v48 = (void *)MEMORY[0x263F08938];
    v49 = [(UIStackView *)v3->_stackView leadingAnchor];
    v34 = [(CPUISongDetailsView *)v3 leadingAnchor];
    v35 = [v49 constraintEqualToAnchor:v34];
    v51[0] = v35;
    v36 = [(UIStackView *)v3->_stackView trailingAnchor];
    v37 = [(CPUISongDetailsView *)v3 trailingAnchor];
    v38 = [v36 constraintEqualToAnchor:v37];
    v51[1] = v38;
    v39 = [(UIStackView *)v3->_stackView centerYAnchor];
    v40 = [(CPUISongDetailsView *)v3 centerYAnchor];
    v41 = [v39 constraintEqualToAnchor:v40];
    v51[2] = v41;
    v42 = [MEMORY[0x263EFF8C0] arrayWithObjects:v51 count:3];
    [v48 activateConstraints:v42];

    [(CPUISongDetailsView *)v3 _updateFont];
    v43 = [(CPUISongDetailsView *)v3 layer];
    [v43 setAllowsGroupBlending:0];

    v44 = [(CPUISongDetailsView *)v3 stackView];
    v45 = [v44 layer];
    [v45 setAllowsGroupBlending:0];

    v46 = [MEMORY[0x263F08A00] defaultCenter];
    [v46 addObserver:v3 selector:sel__updateFont name:*MEMORY[0x263F8B160] object:0];
  }
  return v3;
}

- (CGSize)intrinsicContentSize
{
  v2 = [(CPUISongDetailsView *)self stackView];
  [v2 intrinsicContentSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  double v5 = [a3 nextFocusedItem];
  albumArtistLabelButton = self->_albumArtistLabelButton;

  if (v5 == albumArtistLabelButton)
  {
    v10 = [(CPUIModernButton *)self->_albumArtistLabelButton _titleView];
    v11 = [v10 layer];
    [v11 setCompositingFilter:0];

    id v13 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15D58]];
    v12 = [(_CPUIAlbumContainer *)self->_albumContainer layer];
    [v12 setCompositingFilter:v13];
  }
  else
  {
    double v7 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15D58]];
    double v8 = [(CPUIModernButton *)self->_albumArtistLabelButton _titleView];
    uint64_t v9 = [v8 layer];
    [v9 setCompositingFilter:v7];

    id v13 = [(_CPUIAlbumContainer *)self->_albumContainer layer];
    [v13 setCompositingFilter:0];
  }
}

- (id)_attributedTitle
{
  v14[2] = *MEMORY[0x263EF8340];
  if ([(NSString *)self->_trackTitle length])
  {
    double v3 = objc_opt_new();
    [v3 setAlignment:1];
    [v3 setLineBreakMode:4];
    id v4 = objc_alloc(MEMORY[0x263F086A0]);
    trackTitle = self->_trackTitle;
    uint64_t v6 = *MEMORY[0x263F81540];
    v14[0] = v3;
    uint64_t v7 = *MEMORY[0x263F814F0];
    v13[0] = v6;
    v13[1] = v7;
    double v8 = [(CPUISongDetailsView *)self titleView];
    uint64_t v9 = [v8 font];
    v14[1] = v9;
    v10 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
    v11 = (void *)[v4 initWithString:trackTitle attributes:v10];
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (void)setTrackTitle:(id)a3
{
  objc_storeStrong((id *)&self->_trackTitle, a3);
  id v4 = [(CPUISongDetailsView *)self _attributedTitle];
  double v5 = [(CPUISongDetailsView *)self titleView];
  uint64_t v6 = [v5 titleLabel];
  [v6 setAttributedText:v4];

  [(CPUISongDetailsView *)self _updateNumberOfLines];
}

- (void)setAlbumTitle:(id)a3
{
  objc_storeStrong((id *)&self->_albumTitle, a3);
  id v5 = a3;
  uint64_t v6 = [(CPUISongDetailsView *)self albumArtistLabelButton];
  [v6 setTitle:v5 forState:0];

  [(CPUISongDetailsView *)self _updateNumberOfLines];
}

- (void)setArtistName:(id)a3
{
  objc_storeStrong((id *)&self->_artistName, a3);
  id v5 = a3;
  [(UILabel *)self->_artistLabel setText:v5];

  [(CPUISongDetailsView *)self _updateNumberOfLines];
}

- (void)setFontStyle:(unint64_t)a3
{
  self->_fontStyle = a3;
  [(CPUISongDetailsView *)self _updateFont];
}

- (void)setMaximumTitleViewSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(CPUISongDetailsView *)self maximumTitleViewSize];
  if (v7 != width || v6 != height)
  {
    self->_maximumTitleViewSize.double width = width;
    self->_maximumTitleViewSize.double height = height;
    uint64_t v9 = [(CPUISongDetailsView *)self titleView];
    v10 = [v9 titleLabel];
    [(CPUISongDetailsView *)self maximumTitleViewSize];
    objc_msgSend(v10, "setPreferredMaxLayoutWidth:");
  }
  [(CPUISongDetailsView *)self _updateNumberOfLines];
}

- (CPUIModernButton)attributionButton
{
  v2 = [(CPUISongDetailsView *)self attributionView];
  double v3 = [v2 button];

  return (CPUIModernButton *)v3;
}

- (NSString)attributionName
{
  v2 = [(CPUISongDetailsView *)self attributionView];
  double v3 = [v2 name];

  return (NSString *)v3;
}

- (void)setAttributionName:(id)a3
{
  id v4 = a3;
  id v5 = [(CPUISongDetailsView *)self attributionView];
  [v5 setName:v4];

  [(CPUISongDetailsView *)self _updateNumberOfLines];
}

- (UIImage)attributionArtwork
{
  v2 = [(CPUISongDetailsView *)self attributionView];
  double v3 = [v2 artwork];

  return (UIImage *)v3;
}

- (void)setAttributionArtwork:(id)a3
{
  id v4 = a3;
  id v5 = [(CPUISongDetailsView *)self attributionView];
  [v5 setArtwork:v4];
}

- (void)_updateNumberOfLines
{
  double v3 = [(CPUISongDetailsView *)self attributionName];

  uint64_t v4 = 424;
  id v5 = [(UILabel *)self->_artistLabel text];
  BOOL v6 = [v5 length] == 0;

  [(UILabel *)self->_artistLabel setHidden:v6];
  if (v3)
  {
    BOOL v7 = 1;
  }
  else
  {
    double v8 = [(CPUIModernButton *)self->_albumArtistLabelButton titleForState:0];
    BOOL v7 = [v8 length] == 0;
  }
  [(_CPUIAlbumContainer *)self->_albumContainer setHidden:v7];
  [(CPUISongAttributionView *)self->_attributionView setHidden:v3 == 0];
  uint64_t v9 = [(CPUITitleView *)self->_titleView titleLabel];
  [v9 setNumberOfLines:1];

  if (![(NSString *)self->_trackTitle length]) {
    goto LABEL_28;
  }
  [(CPUISongDetailsView *)self maximumTitleViewSize];
  if (v11 == *MEMORY[0x263F001B0] && v10 == *(double *)(MEMORY[0x263F001B0] + 8)) {
    goto LABEL_28;
  }
  id v13 = [(CPUISongDetailsView *)self _attributedTitle];
  double v14 = [v13 attribute:*MEMORY[0x263F814F0] atIndex:0 effectiveRange:0];
  v15 = [v13 attribute:*MEMORY[0x263F81540] atIndex:0 effectiveRange:0];
  [(CPUISongDetailsView *)self maximumTitleViewSize];
  double v17 = v16;
  double v19 = v18;
  if ([(CPUITitleView *)self->_titleView isExplicitTrack]) {
    double v20 = v17 + -20.0;
  }
  else {
    double v20 = v17;
  }
  [v14 lineHeight];
  double v22 = v21;
  objc_msgSend(v13, "boundingRectWithSize:options:context:", 1, 0, v20, v19);
  CGRect v44 = CGRectIntegral(v43);
  double v23 = CGRectGetHeight(v44) / v22;
  uint64_t v24 = [(CPUISongDetailsView *)self stackView];
  [v24 spacing];
  double v26 = v19 - v25 - v22;
  NSUInteger v27 = [(NSString *)self->_artistName length];
  if (v27)
  {
    uint64_t v4 = [(UILabel *)self->_artistLabel font];
    [(id)v4 lineHeight];
  }
  else
  {
    double v28 = 0.0;
  }
  float v29 = v23;
  double v30 = v26 - v28;
  if (![(NSString *)self->_albumTitle length])
  {
    if (!v3)
    {
      double v34 = 0.0;
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  if (v3)
  {
LABEL_19:
    [(CPUISongAttributionView *)self->_attributionView frame];
    double Height = CGRectGetHeight(v45);
    [(UIStackView *)self->_stackView customSpacingAfterView:self->_attributionView];
    double v34 = Height + v36;
    goto LABEL_20;
  }
  v31 = [(CPUIModernButton *)self->_albumArtistLabelButton titleLabel];
  v32 = [v31 font];
  [v32 lineHeight];
  double v34 = v33;

LABEL_20:
  unint64_t v37 = vcvtps_u32_f32(v29);
  double v38 = v30 - v34;
  if (v27) {

  }
  if (v37 >= 2 && v38 >= v22 + v22)
  {
    v40 = [(CPUITitleView *)self->_titleView titleLabel];
    [v40 setNumberOfLines:2];
  }
LABEL_28:
  v41 = [(CPUISongDetailsView *)self titleView];
  [v41 invalidateIntrinsicContentSize];

  [(CPUISongDetailsView *)self setNeedsLayout];
}

- (void)_updateFont
{
  v48[1] = *MEMORY[0x263EF8340];
  unint64_t fontStyle = self->_fontStyle;
  BOOL v4 = fontStyle == 1;
  if (fontStyle == 1) {
    id v5 = (void *)*MEMORY[0x263F83628];
  }
  else {
    id v5 = (void *)*MEMORY[0x263F83580];
  }
  if (v4) {
    BOOL v6 = (void *)*MEMORY[0x263F83580];
  }
  else {
    BOOL v6 = (void *)*MEMORY[0x263F83588];
  }
  id v42 = v5;
  id v7 = v6;
  double v8 = (void *)MEMORY[0x263F81720];
  uint64_t v9 = [(CPUISongDetailsView *)self traitCollection];
  double v10 = [v8 preferredFontDescriptorWithTextStyle:v42 compatibleWithTraitCollection:v9];

  double v11 = (void *)MEMORY[0x263F81708];
  v12 = [(CPUISongDetailsView *)self traitCollection];
  v41 = v7;
  id v13 = [v11 preferredFontForTextStyle:v7 compatibleWithTraitCollection:v12];
  double v14 = [v13 fontDescriptor];

  v15 = (void *)MEMORY[0x263F81708];
  double v16 = [(CPUISongDetailsView *)self traitCollection];
  double v17 = [v15 preferredFontForTextStyle:v7 compatibleWithTraitCollection:v16];
  double v18 = [v17 fontDescriptor];

  double v19 = objc_msgSend(v10, "fontDescriptorWithSymbolicTraits:", objc_msgSend(v10, "symbolicTraits") | 0x8002);

  int v20 = _AXSCarPlayEnhanceTextLegibilityEnabled();
  double v21 = (double *)MEMORY[0x263F81800];
  if (!v20) {
    double v21 = (double *)MEMORY[0x263F81838];
  }
  double v22 = *v21;
  uint64_t v47 = *MEMORY[0x263F81850];
  double v23 = [NSNumber numberWithDouble:v22];
  v48[0] = v23;
  uint64_t v24 = [NSDictionary dictionaryWithObjects:v48 forKeys:&v47 count:1];

  uint64_t v45 = *MEMORY[0x263F817A0];
  uint64_t v25 = v45;
  v46 = v24;
  double v26 = [NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];
  NSUInteger v27 = [v14 fontDescriptorByAddingAttributes:v26];

  uint64_t v43 = v25;
  CGRect v44 = v24;
  double v28 = [NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];
  float v29 = [v18 fontDescriptorByAddingAttributes:v28];

  double v30 = [MEMORY[0x263F81708] fontWithDescriptor:v19 size:0.0];
  v31 = [(CPUISongDetailsView *)self titleView];
  [v31 setFont:v30];

  v32 = [MEMORY[0x263F81708] fontWithDescriptor:v29 size:0.0];
  double v33 = [(CPUISongDetailsView *)self albumArtistLabelButton];
  double v34 = [v33 titleLabel];
  [v34 setFont:v32];

  v35 = [MEMORY[0x263F81708] fontWithDescriptor:v29 size:0.0];
  double v36 = [(CPUISongDetailsView *)self attributionView];
  unint64_t v37 = [v36 button];
  double v38 = [v37 titleLabel];
  [v38 setFont:v35];

  v39 = [MEMORY[0x263F81708] fontWithDescriptor:v27 size:0.0];
  v40 = [(CPUISongDetailsView *)self artistLabel];
  [v40 setFont:v39];

  [(CPUISongDetailsView *)self _updateNumberOfLines];
}

+ (double)minimumHeightForTrackInfoFontStyle:(unint64_t)a3
{
  double result = 44.0;
  if (a3 == 1) {
    return 66.0;
  }
  return result;
}

+ (double)maximumHeightForTrackInfoFontStyle:(unint64_t)a3
{
  double result = 72.0;
  if (a3 == 1) {
    return 106.0;
  }
  return result;
}

- (unint64_t)fontStyle
{
  return self->_fontStyle;
}

- (CPUITitleView)titleView
{
  return self->_titleView;
}

- (UILabel)artistLabel
{
  return self->_artistLabel;
}

- (void)setArtistLabel:(id)a3
{
}

- (CPUIModernButton)albumArtistLabelButton
{
  return self->_albumArtistLabelButton;
}

- (NSString)trackTitle
{
  return self->_trackTitle;
}

- (NSString)albumTitle
{
  return self->_albumTitle;
}

- (NSString)artistName
{
  return self->_artistName;
}

- (CGSize)maximumTitleViewSize
{
  double width = self->_maximumTitleViewSize.width;
  double height = self->_maximumTitleViewSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (_CPUIAlbumContainer)albumContainer
{
  return self->_albumContainer;
}

- (void)setAlbumContainer:(id)a3
{
}

- (CPUISongAttributionView)attributionView
{
  return self->_attributionView;
}

- (void)setAttributionView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributionView, 0);
  objc_storeStrong((id *)&self->_albumContainer, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_artistName, 0);
  objc_storeStrong((id *)&self->_albumTitle, 0);
  objc_storeStrong((id *)&self->_trackTitle, 0);
  objc_storeStrong((id *)&self->_albumArtistLabelButton, 0);
  objc_storeStrong((id *)&self->_artistLabel, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
}

@end