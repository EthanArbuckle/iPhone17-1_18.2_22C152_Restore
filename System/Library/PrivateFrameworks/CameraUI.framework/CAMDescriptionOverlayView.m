@interface CAMDescriptionOverlayView
- (BOOL)_isVisible;
- (BOOL)detailTextShouldHaveVibrancyEffect;
- (BOOL)isAcknowledgmentButtonHighlighted;
- (BOOL)isBlackoutFrameVisible;
- (BOOL)isDetailButtonHighlighted;
- (BOOL)isTitleMultiline;
- (CAMDescriptionOverlayView)initWithFrame:(CGRect)a3;
- (CAMDescriptionOverlayViewDelegate)delegate;
- (CAMPortraitModeDescriptionOverlayPrimaryVibrancyEffectView)_primaryVibrancyEffectView;
- (CAShapeLayer)_blackoutMask;
- (CGRect)viewportFrame;
- (UIButton)_acknowledgmentButton;
- (UIButton)_detailButton;
- (UILabel)_descriptionLabel;
- (UILabel)_descriptionTitleLabel;
- (UILabel)_infoLabel;
- (UILabel)_infoTitleLabel;
- (UILabel)_titleLabel;
- (UIView)_blackoutView;
- (UIVisualEffectView)_blurEffectView;
- (double)_additionalSpacingForContentSize:(id)a3;
- (double)_descriptionFontSizeMultiplier;
- (double)_infoFontSizeMultiplier;
- (double)additionalSpacing;
- (double)maxDescriptionTextWidthForNarrowWidth:(BOOL)a3 isLandscape:(BOOL)a4 usingFontSizeMultiplier:(double)a5;
- (double)maxInfoTextWidthForNarrowWidth:(BOOL)a3 isLandscape:(BOOL)a4 usingFontSizeMultiplier:(double)a5;
- (double)maxTitleTextWidthForNarrowWidth:(BOOL)a3 isLandscape:(BOOL)a4;
- (id)_buttonTitleTransformerForTextStyle:(id)a3;
- (id)acknowledgmentTextUsingNarrowWidth:(BOOL)a3;
- (id)attributedDescriptionTextUsingNarrowWidth:(BOOL)a3;
- (id)currentContentSize;
- (id)descriptionTextUsingNarrowWidth:(BOOL)a3;
- (id)descriptionTitleTextUsingNarrowWidth:(BOOL)a3;
- (id)detailTextUsingNarrowWidth:(BOOL)a3;
- (id)infoTextStyleUsingNarrowWidth:(BOOL)a3;
- (id)infoTextUsingNarrowWidth:(BOOL)a3;
- (id)infoTitleTextUsingNarrowWidth:(BOOL)a3;
- (id)titleTextUsingNarrowWidth:(BOOL)a3;
- (int64_t)buttonStyle;
- (int64_t)orientation;
- (void)_handleAcknowledgmentButtonTapped:(id)a3;
- (void)_handleDetailButtonTapped:(id)a3;
- (void)_layoutBlackoutMaskForFrame:(CGRect)a3 inFrame:(CGRect)a4;
- (void)_setDescriptionFontSizeMultiplier:(double)a3;
- (void)_setInfoFontSizeMultiplier:(double)a3;
- (void)_updateFontsUsingNarrowWidth:(BOOL)a3;
- (void)_updateTextUsingNarrowWidth:(BOOL)a3;
- (void)layoutSubviews;
- (void)setAcknowledgmentButtonHighlighted:(BOOL)a3;
- (void)setBlackoutFrameVisible:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDetailButtonHighlighted:(BOOL)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4;
- (void)setViewportFrame:(CGRect)a3;
- (void)setVisible:(BOOL)a3 animationDuration:(double)a4 completion:(id)a5;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CAMDescriptionOverlayView

- (CAMDescriptionOverlayView)initWithFrame:(CGRect)a3
{
  v57.receiver = self;
  v57.super_class = (Class)CAMDescriptionOverlayView;
  v3 = -[CAMDescriptionOverlayView initWithFrame:](&v57, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (!v3) {
    goto LABEL_19;
  }
  v4 = [MEMORY[0x263F825C8] colorWithWhite:1.0 alpha:0.6];
  uint64_t v5 = [MEMORY[0x263F825C8] whiteColor];
  id v6 = v4;
  v56 = CAMYellowColor();
  v55 = [v56 colorWithAlphaComponent:0.4];
  v52 = [MEMORY[0x263F824D8] effectWithStyle:2];
  uint64_t v7 = [objc_alloc(MEMORY[0x263F82E50]) initWithEffect:v52];
  blurEffectView = v3->__blurEffectView;
  v3->__blurEffectView = (UIVisualEffectView *)v7;

  [(CAMDescriptionOverlayView *)v3 addSubview:v3->__blurEffectView];
  v9 = [CAMPortraitModeDescriptionOverlayPrimaryVibrancyEffectView alloc];
  double v10 = *MEMORY[0x263F001A8];
  double v11 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v12 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v13 = *(double *)(MEMORY[0x263F001A8] + 24);
  uint64_t v14 = -[CAMPortraitModeDescriptionOverlayPrimaryVibrancyEffectView initWithFrame:](v9, "initWithFrame:", *MEMORY[0x263F001A8], v11, v12, v13);
  primaryVibrancyEffectView = v3->__primaryVibrancyEffectView;
  v3->__primaryVibrancyEffectView = (CAMPortraitModeDescriptionOverlayPrimaryVibrancyEffectView *)v14;

  [(CAMDescriptionOverlayView *)v3 addSubview:v3->__primaryVibrancyEffectView];
  BOOL v16 = [(CAMDescriptionOverlayView *)v3 isTitleMultiline];
  uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v10, v11, v12, v13);
  titleLabel = v3->__titleLabel;
  v3->__titleLabel = (UILabel *)v17;

  [(UILabel *)v3->__titleLabel setTextColor:v6];
  [(UILabel *)v3->__titleLabel setTextAlignment:1];
  [(UILabel *)v3->__titleLabel setNumberOfLines:!v16];
  if (v16) {
    uint64_t v19 = 0;
  }
  else {
    uint64_t v19 = 4;
  }
  [(UILabel *)v3->__titleLabel setLineBreakMode:v19];
  [(UILabel *)v3->__titleLabel setAdjustsFontSizeToFitWidth:!v16];
  uint64_t v20 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v10, v11, v12, v13);
  descriptionTitleLabel = v3->__descriptionTitleLabel;
  v3->__descriptionTitleLabel = (UILabel *)v20;

  [(UILabel *)v3->__descriptionTitleLabel setTextColor:v5];
  [(UILabel *)v3->__descriptionTitleLabel setTextAlignment:1];
  [(UILabel *)v3->__descriptionTitleLabel setAdjustsFontSizeToFitWidth:1];
  uint64_t v22 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v10, v11, v12, v13);
  descriptionLabel = v3->__descriptionLabel;
  v3->__descriptionLabel = (UILabel *)v22;

  [(UILabel *)v3->__descriptionLabel setNumberOfLines:0];
  [(UILabel *)v3->__descriptionLabel setLineBreakMode:0];
  [(UILabel *)v3->__descriptionLabel setTextColor:v6];
  [(UILabel *)v3->__descriptionLabel setTextAlignment:1];
  [(UILabel *)v3->__descriptionLabel setUserInteractionEnabled:1];
  v24 = v3->__descriptionLabel;
  v25 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:v3 action:sel_handleDescriptionLabelTapped_];
  [(UILabel *)v24 addGestureRecognizer:v25];

  uint64_t v26 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v10, v11, v12, v13);
  infoTitleLabel = v3->__infoTitleLabel;
  v3->__infoTitleLabel = (UILabel *)v26;

  v54 = (void *)v5;
  [(UILabel *)v3->__infoTitleLabel setTextColor:v5];
  [(UILabel *)v3->__infoTitleLabel setTextAlignment:1];
  [(UILabel *)v3->__infoTitleLabel setAdjustsFontSizeToFitWidth:1];
  uint64_t v28 = objc_msgSend(objc_alloc(MEMORY[0x263F828E0]), "initWithFrame:", v10, v11, v12, v13);
  infoLabel = v3->__infoLabel;
  v3->__infoLabel = (UILabel *)v28;

  [(UILabel *)v3->__infoLabel setNumberOfLines:0];
  [(UILabel *)v3->__infoLabel setLineBreakMode:0];
  v53 = v6;
  [(UILabel *)v3->__infoLabel setTextColor:v6];
  [(UILabel *)v3->__infoLabel setTextAlignment:1];
  uint64_t v30 = [(CAMDescriptionOverlayView *)v3 buttonStyle];
  if (v30 == 1)
  {
    v34 = (void *)*MEMORY[0x263F83570];
    v35 = (void *)*MEMORY[0x263F83570];
LABEL_11:
    id v32 = v34;
    id v31 = v35;
    goto LABEL_12;
  }
  id v31 = 0;
  id v32 = 0;
  if (!v30)
  {
    v33 = [(CAMDescriptionOverlayView *)v3 detailTextUsingNarrowWidth:0];

    v34 = (void *)*MEMORY[0x263F83570];
    v35 = (void *)*MEMORY[0x263F835D0];
    if (!v33) {
      v34 = (void *)*MEMORY[0x263F835D0];
    }
    goto LABEL_11;
  }
LABEL_12:
  v36 = [MEMORY[0x263F824F0] tintedButtonConfiguration];
  objc_msgSend(v36, "setContentInsets:", 4.0, 12.0, 4.0, 12.0);
  [v36 setCornerStyle:4];
  v37 = [(CAMDescriptionOverlayView *)v3 _buttonTitleTransformerForTextStyle:v31];
  [v36 setTitleTextAttributesTransformer:v37];

  uint64_t v38 = [MEMORY[0x263F824E8] buttonWithConfiguration:v36 primaryAction:0];
  detailButton = v3->__detailButton;
  v3->__detailButton = (UIButton *)v38;

  [(UIButton *)v3->__detailButton setTintColor:v56];
  [(UIButton *)v3->__detailButton setTitleColor:v56 forState:0];
  [(UIButton *)v3->__detailButton setTitleColor:v55 forState:1];
  [(UIButton *)v3->__detailButton addTarget:v3 action:sel__handleDetailButtonTapped_ forControlEvents:64];
  uint64_t v40 = [(CAMDescriptionOverlayView *)v3 buttonStyle];
  if (v40)
  {
    if (v40 == 1)
    {
      uint64_t v41 = [MEMORY[0x263F824E8] buttonWithConfiguration:v36 primaryAction:0];
      acknowledgmentButton = v3->__acknowledgmentButton;
      v3->__acknowledgmentButton = (UIButton *)v41;

      [(UIButton *)v3->__acknowledgmentButton setTintColor:v56];
    }
  }
  else
  {
    v43 = [MEMORY[0x263F824F0] plainButtonConfiguration];
    objc_msgSend(v43, "setContentInsets:", 4.0, 4.0, 4.0, 4.0);
    v44 = [(CAMDescriptionOverlayView *)v3 _buttonTitleTransformerForTextStyle:v32];
    [v43 setTitleTextAttributesTransformer:v44];

    uint64_t v45 = [MEMORY[0x263F824E8] buttonWithConfiguration:v43 primaryAction:0];
    v46 = v3->__acknowledgmentButton;
    v3->__acknowledgmentButton = (UIButton *)v45;
  }
  [(UIButton *)v3->__acknowledgmentButton setTitleColor:v56 forState:0];
  [(UIButton *)v3->__acknowledgmentButton setTitleColor:v55 forState:1];
  [(UIButton *)v3->__acknowledgmentButton addTarget:v3 action:sel__handleAcknowledgmentButtonTapped_ forControlEvents:64];
  v47 = [(CAMPortraitModeDescriptionOverlayPrimaryVibrancyEffectView *)v3->__primaryVibrancyEffectView contentView];
  [(CAMPortraitModeDescriptionOverlayPrimaryVibrancyEffectView *)v47 addSubview:v3->__titleLabel];
  [(CAMPortraitModeDescriptionOverlayPrimaryVibrancyEffectView *)v47 addSubview:v3->__descriptionTitleLabel];
  [(CAMPortraitModeDescriptionOverlayPrimaryVibrancyEffectView *)v47 addSubview:v3->__infoTitleLabel];
  [(CAMPortraitModeDescriptionOverlayPrimaryVibrancyEffectView *)v47 addSubview:v3->__infoLabel];
  [(CAMPortraitModeDescriptionOverlayPrimaryVibrancyEffectView *)v3->__primaryVibrancyEffectView addSubview:v3->__detailButton];
  [(CAMPortraitModeDescriptionOverlayPrimaryVibrancyEffectView *)v3->__primaryVibrancyEffectView addSubview:v3->__acknowledgmentButton];
  BOOL v48 = [(CAMDescriptionOverlayView *)v3 detailTextShouldHaveVibrancyEffect];
  v49 = v47;
  if (!v48) {
    v49 = v3->__primaryVibrancyEffectView;
  }
  [(CAMPortraitModeDescriptionOverlayPrimaryVibrancyEffectView *)v49 addSubview:v3->__descriptionLabel];
  v50 = v3;

LABEL_19:
  return v3;
}

- (id)_buttonTitleTransformerForTextStyle:(id)a3
{
  v3 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:a3 addingSymbolicTraits:0 options:3];
  v4 = [MEMORY[0x263F81708] fontWithDescriptor:v3 size:0.0];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__CAMDescriptionOverlayView__buttonTitleTransformerForTextStyle___block_invoke;
  aBlock[3] = &unk_263FA4168;
  id v10 = v4;
  id v5 = v4;
  id v6 = _Block_copy(aBlock);
  uint64_t v7 = _Block_copy(v6);

  return v7;
}

id __65__CAMDescriptionOverlayView__buttonTitleTransformerForTextStyle___block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)[a2 mutableCopy];
  [v3 setObject:*(void *)(a1 + 32) forKeyedSubscript:*MEMORY[0x263F814F0]];
  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v6 = [a3 preferredContentSizeCategory];
  v4 = [(CAMDescriptionOverlayView *)self traitCollection];
  id v5 = [v4 preferredContentSizeCategory];

  if (v5 != v6 && ([v5 isEqualToString:v6] & 1) == 0) {
    [(CAMDescriptionOverlayView *)self setNeedsLayout];
  }
}

- (void)_updateFontsUsingNarrowWidth:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(CAMDescriptionOverlayView *)self isTitleMultiline];
  id v6 = (void **)MEMORY[0x263F83610];
  if (!v3 || !v5) {
    id v6 = (void **)MEMORY[0x263F83608];
  }
  uint64_t v7 = *v6;
  v8 = (id *)MEMORY[0x263F83570];
  if (v3) {
    v8 = (id *)MEMORY[0x263F835E8];
  }
  id v9 = *v8;
  id v10 = v7;
  id v42 = [(CAMDescriptionOverlayView *)self infoTextStyleUsingNarrowWidth:v3];
  uint64_t v11 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:v10 addingSymbolicTraits:32770 options:3];
  double v12 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:v9 addingSymbolicTraits:0 options:3];
  double v13 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:v42 addingSymbolicTraits:0 options:3];
  uint64_t v14 = [v12 fontDescriptorWithSymbolicTraits:2];
  uint64_t v41 = [v13 fontDescriptorWithSymbolicTraits:2];
  v15 = [MEMORY[0x263F81720] defaultFontDescriptorWithTextStyle:v10 addingSymbolicTraits:0 options:3];

  BOOL v16 = [MEMORY[0x263F81720] defaultFontDescriptorWithTextStyle:v9 addingSymbolicTraits:0 options:3];

  uint64_t v17 = [MEMORY[0x263F81720] defaultFontDescriptorWithTextStyle:v42 addingSymbolicTraits:0 options:3];
  double v18 = 1.0;
  double v19 = 1.0;
  if (v16)
  {
    objc_msgSend(v12, "pointSize", 1.0);
    double v21 = v20;
    [v16 pointSize];
    double v19 = v21 / v22;
  }
  uint64_t v40 = v16;
  [(CAMDescriptionOverlayView *)self _setDescriptionFontSizeMultiplier:v19];
  if (v17)
  {
    [v13 pointSize];
    double v24 = v23;
    [v17 pointSize];
    double v18 = v24 / v25;
  }
  [(CAMDescriptionOverlayView *)self _setInfoFontSizeMultiplier:v18];
  v39 = v17;
  uint64_t v26 = (void *)MEMORY[0x263F81708];
  [v15 pointSize];
  v27 = objc_msgSend(v26, "fontWithDescriptor:size:", v11);
  uint64_t v28 = [MEMORY[0x263F81708] fontWithDescriptor:v14 size:0.0];
  v29 = [MEMORY[0x263F81708] fontWithDescriptor:v12 size:0.0];
  [MEMORY[0x263F81708] fontWithDescriptor:v41 size:0.0];
  uint64_t v30 = v38 = (void *)v11;
  [MEMORY[0x263F81708] fontWithDescriptor:v13 size:0.0];
  id v31 = v37 = v12;
  id v32 = [(CAMDescriptionOverlayView *)self _titleLabel];
  [v32 setFont:v27];

  v33 = [(CAMDescriptionOverlayView *)self _descriptionTitleLabel];
  [v33 setFont:v28];

  v34 = [(CAMDescriptionOverlayView *)self _descriptionLabel];
  [v34 setFont:v29];

  v35 = [(CAMDescriptionOverlayView *)self _infoTitleLabel];
  [v35 setFont:v30];

  v36 = [(CAMDescriptionOverlayView *)self _infoLabel];
  [v36 setFont:v31];
}

- (void)_updateTextUsingNarrowWidth:(BOOL)a3
{
  BOOL v3 = a3;
  -[CAMDescriptionOverlayView descriptionTitleTextUsingNarrowWidth:](self, "descriptionTitleTextUsingNarrowWidth:");
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  BOOL v5 = [(CAMDescriptionOverlayView *)self attributedDescriptionTextUsingNarrowWidth:v3];
  id v6 = [(CAMDescriptionOverlayView *)self infoTitleTextUsingNarrowWidth:v3];
  uint64_t v7 = [(CAMDescriptionOverlayView *)self infoTextUsingNarrowWidth:v3];
  v8 = [(CAMDescriptionOverlayView *)self titleTextUsingNarrowWidth:v3];
  id v9 = [(CAMDescriptionOverlayView *)self detailTextUsingNarrowWidth:v3];
  id v10 = [(CAMDescriptionOverlayView *)self acknowledgmentTextUsingNarrowWidth:v3];
  uint64_t v11 = [(CAMDescriptionOverlayView *)self _titleLabel];
  [v11 setText:v8];

  double v12 = [(CAMDescriptionOverlayView *)self _detailButton];
  [v12 setTitle:v9 forState:0];

  double v13 = [(CAMDescriptionOverlayView *)self _acknowledgmentButton];
  [v13 setTitle:v10 forState:0];

  uint64_t v14 = [(CAMDescriptionOverlayView *)self _descriptionTitleLabel];
  [v14 setText:v18];

  v15 = [(CAMDescriptionOverlayView *)self _descriptionLabel];
  [v15 setAttributedText:v5];

  BOOL v16 = [(CAMDescriptionOverlayView *)self _infoTitleLabel];
  [v16 setText:v6];

  uint64_t v17 = [(CAMDescriptionOverlayView *)self _infoLabel];
  [v17 setText:v7];
}

- (void)layoutSubviews
{
  v209.receiver = self;
  v209.super_class = (Class)CAMDescriptionOverlayView;
  [(CAMDescriptionOverlayView *)&v209 layoutSubviews];
  [(CAMDescriptionOverlayView *)self bounds];
  double v178 = v4;
  double v179 = v3;
  double v176 = v6;
  double v177 = v5;
  [(CAMDescriptionOverlayView *)self viewportFrame];
  double v8 = v7;
  double v10 = v9;
  double v137 = v12;
  double v138 = v11;
  UIRectGetCenter();
  double v173 = v14;
  double v174 = v13;
  BOOL v201 = v8 < 414.0;
  [(CAMDescriptionOverlayView *)self _updateFontsUsingNarrowWidth:v8 < 414.0];
  [(CAMDescriptionOverlayView *)self _updateTextUsingNarrowWidth:v8 < 414.0];
  v147 = [(CAMDescriptionOverlayView *)self _blurEffectView];
  v146 = [(CAMDescriptionOverlayView *)self _primaryVibrancyEffectView];
  v203 = [(CAMDescriptionOverlayView *)self _titleLabel];
  v157 = [(CAMDescriptionOverlayView *)self _descriptionTitleLabel];
  v156 = [(CAMDescriptionOverlayView *)self _descriptionLabel];
  v155 = [(CAMDescriptionOverlayView *)self _infoTitleLabel];
  v154 = [(CAMDescriptionOverlayView *)self _infoLabel];
  v151 = [(CAMDescriptionOverlayView *)self _detailButton];
  v150 = [(CAMDescriptionOverlayView *)self _acknowledgmentButton];
  v15 = [v203 font];
  BOOL v16 = [v157 font];
  uint64_t v17 = [v156 font];
  id v18 = [v155 font];
  double v19 = [v154 font];
  double v20 = [v151 titleLabel];
  double v21 = [v20 font];

  double v22 = [v150 titleLabel];
  double v23 = [v22 font];

  [v15 descender];
  UIFloorToViewScale();
  double v25 = v24;
  [v16 descender];
  UIFloorToViewScale();
  double v152 = v26;
  [v17 descender];
  UIFloorToViewScale();
  double v28 = v27;
  [v18 descender];
  UIFloorToViewScale();
  double v148 = v29;
  [v19 descender];
  UIFloorToViewScale();
  double v185 = v30;
  [v21 descender];
  UIFloorToViewScale();
  double v135 = v31;
  [v23 descender];
  UIFloorToViewScale();
  double v143 = v32;
  v175 = v15;
  [v15 lineHeight];
  UICeilToViewScale();
  double v34 = v33;
  double v183 = v33;
  [v16 lineHeight];
  UICeilToViewScale();
  double v139 = v35;
  [v17 lineHeight];
  UICeilToViewScale();
  double v37 = v36;
  [v18 lineHeight];
  UICeilToViewScale();
  double v140 = v38;
  [v19 lineHeight];
  UICeilToViewScale();
  double v158 = v39;
  [v21 lineHeight];
  UICeilToViewScale();
  double v134 = v40;
  [v23 lineHeight];
  UICeilToViewScale();
  double v142 = v41;
  double v181 = v25 + v34;
  double v160 = v28;
  double v166 = v28 + v37;
  uint64_t v42 = [(CAMDescriptionOverlayView *)self orientation];
  long long v207 = 0u;
  long long v208 = 0u;
  unint64_t v43 = v42 - 3;
  long long v206 = 0u;
  CAMOrientationTransform(v42, (uint64_t)&v206);
  BOOL v44 = v43 >= 2;
  BOOL v45 = v43 < 2;
  uint64_t v46 = MEMORY[0x263F001A8];
  CGFloat v204 = *MEMORY[0x263F001A8];
  if (v44) {
    double v47 = v10;
  }
  else {
    double v47 = v8;
  }
  double v180 = v8;
  double v136 = v10;
  if (!v44) {
    double v8 = v10;
  }
  double v198 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v199 = v8;
  [(CAMDescriptionOverlayView *)self maxTitleTextWidthForNarrowWidth:v201 isLandscape:v45];
  double v49 = v48;
  [(CAMDescriptionOverlayView *)self _descriptionFontSizeMultiplier];
  -[CAMDescriptionOverlayView maxDescriptionTextWidthForNarrowWidth:isLandscape:usingFontSizeMultiplier:](self, "maxDescriptionTextWidthForNarrowWidth:isLandscape:usingFontSizeMultiplier:", v201, v45);
  double v51 = v50;
  [(CAMDescriptionOverlayView *)self _infoFontSizeMultiplier];
  -[CAMDescriptionOverlayView maxInfoTextWidthForNarrowWidth:isLandscape:usingFontSizeMultiplier:](self, "maxInfoTextWidthForNarrowWidth:isLandscape:usingFontSizeMultiplier:", v201, v45);
  double v53 = v8 + -20.0;
  if (v49 <= 0.0 || v49 > v53) {
    double v49 = v8 + -20.0;
  }
  if (v51 > v53) {
    double v51 = v8 + -20.0;
  }
  if (v52 <= v53) {
    double v55 = v52;
  }
  else {
    double v55 = v8 + -20.0;
  }
  BOOL v56 = [(CAMDescriptionOverlayView *)self isTitleMultiline];
  double v57 = *MEMORY[0x263F00148];
  double v58 = *(double *)(MEMORY[0x263F00148] + 8);
  objc_msgSend(v203, "textRectForBounds:limitedToNumberOfLines:", !v56, *MEMORY[0x263F00148], v58, v49, v47);
  objc_msgSend(v156, "textRectForBounds:limitedToNumberOfLines:", 0, v57, v58, v51, v47);
  double v141 = v57;
  double v170 = v58;
  objc_msgSend(v154, "textRectForBounds:limitedToNumberOfLines:", 0, v57, v58, v55, v47);
  [v157 intrinsicContentSize];
  [v155 intrinsicContentSize];
  [v151 intrinsicContentSize];
  [v150 intrinsicContentSize];
  UICeilToViewScale();
  double v60 = v59;
  UICeilToViewScale();
  double rect = v61;
  UICeilToViewScale();
  double v190 = v62;
  UICeilToViewScale();
  double v189 = v63;
  UICeilToViewScale();
  double v193 = v64;
  UICeilToViewScale();
  double v191 = v65;
  UICeilToViewScale();
  double v194 = v66;
  UICeilToViewScale();
  double v192 = v67;
  UICeilToViewScale();
  double v196 = v68;
  UICeilToViewScale();
  double v195 = v69;
  UICeilToViewScale();
  double v71 = v70;
  UICeilToViewScale();
  double v73 = v72;
  UICeilToViewScale();
  double v75 = v74;
  UICeilToViewScale();
  double v77 = v76;
  int64_t v78 = [(CAMDescriptionOverlayView *)self buttonStyle];
  if (v71 >= v75) {
    double v79 = v71;
  }
  else {
    double v79 = v75;
  }
  if (v73 >= v77) {
    double v80 = v73;
  }
  else {
    double v80 = v77;
  }
  if (v78 == 1) {
    double v81 = v80;
  }
  else {
    double v81 = v77;
  }
  if (v78 == 1) {
    double v82 = v79;
  }
  else {
    double v82 = v75;
  }
  double v200 = v82;
  double v202 = v81;
  if (v78 != 1)
  {
    double v80 = v73;
    double v79 = v71;
  }
  double v163 = v79;
  double v164 = v80;
  [(CAMDescriptionOverlayView *)self additionalSpacing];
  double v84 = v83;
  double v197 = v47;
  UIFloorToViewScale();
  CGFloat v86 = v85 - v181;
  v210.origin.double x = (v199 - v60) * 0.5;
  v210.origin.double y = v86;
  double v172 = v60;
  v210.size.width = v60;
  v210.size.height = rect;
  double v87 = v84 + CGRectGetMaxY(v210) - (v183 - v181) + 37.0;
  double v88 = *(double *)(v46 + 16);
  double v89 = *(double *)(v46 + 24);
  v90 = [v157 text];
  double v182 = v89;
  double v168 = v86;
  double v169 = (v199 - v60) * 0.5;
  if (v90)
  {

    CGFloat v91 = v204;
    double v92 = v160;
LABEL_33:
    v211.size.width = v190;
    v211.origin.double x = (v199 - v190) * 0.5;
    v211.origin.double y = v87 - (v152 + v139);
    double x = v211.origin.x;
    double y = v211.origin.y;
    v211.size.height = v189;
    double v87 = v84 + v139 + v152 + CGRectGetMaxY(v211) + 2.0;
    goto LABEL_35;
  }
  v93 = [v157 text];
  int v94 = [v93 isEqualToString:&stru_26BD78BA0];

  CGFloat v91 = v204;
  double v92 = v160;
  if (v94) {
    goto LABEL_33;
  }
  double v189 = v89;
  double v190 = v88;
  double y = v198;
  double x = v204;
LABEL_35:
  v212.size.width = v193;
  v212.origin.double x = (v199 - v193) * 0.5;
  double v95 = v87 - v166;
  v212.origin.double y = v87 - v166;
  v212.size.height = v191;
  double v96 = v92 + CGRectGetMaxY(v212);
  v97 = [v157 text];
  double v184 = v88;
  if ([v97 length])
  {

    double v98 = v158;
  }
  else
  {
    v99 = [v156 text];
    uint64_t v100 = [v99 length];

    double v98 = v158;
    if (!v100) {
      goto LABEL_39;
    }
  }
  double v87 = v84 + v96 + 39.0;
LABEL_39:
  double v101 = v185 + v98;
  v102 = objc_msgSend(v155, "text", 0x4042800000000000);
  double v161 = v95;
  if (v102)
  {

LABEL_42:
    double v105 = v199;
    v213.size.width = v194;
    v213.origin.double x = (v199 - v194) * 0.5;
    v213.origin.double y = v87 - (v148 + v140);
    double v159 = v213.origin.x;
    double v153 = v213.origin.y;
    v213.size.height = v192;
    double v87 = v84 + v140 + v148 + CGRectGetMaxY(v213) + 2.0;
    goto LABEL_44;
  }
  v103 = [v155 text];
  int v104 = [v103 isEqualToString:&stru_26BD78BA0];

  if (v104) {
    goto LABEL_42;
  }
  double v159 = v91;
  double v153 = v198;
  double v194 = v88;
  double v192 = v182;
  double v105 = v199;
LABEL_44:
  double v106 = v164;
  v214.size.height = v195;
  v214.size.width = v196;
  double v107 = v87 - v101;
  v214.origin.double x = (v105 - v196) * 0.5;
  v214.origin.double y = v107;
  double MaxY = CGRectGetMaxY(v214);
  v109 = [v155 text];
  double v165 = (v105 - v196) * 0.5;
  if ([v109 length])
  {

    double v110 = v143;
    double v112 = v141;
    double v111 = v142;
  }
  else
  {
    v113 = [v154 text];
    uint64_t v114 = [v113 length];

    double v110 = v143;
    double v112 = v141;
    double v111 = v142;
    if (!v114) {
      goto LABEL_48;
    }
  }
  double v96 = v185 + MaxY;
LABEL_48:
  double v186 = v110 + v111;
  double v115 = v96 + 41.0;
  double v116 = v84;
  double v117 = v84 + v115;
  objc_msgSend(v151, "contentRectForBounds:", v112, v170, v163, v106);
  objc_msgSend(v151, "titleRectForContentRect:");
  double v119 = v118;
  objc_msgSend(v150, "contentRectForBounds:", v112, v170, v200, v202);
  objc_msgSend(v150, "titleRectForContentRect:");
  double v121 = v120;
  v122 = [(CAMDescriptionOverlayView *)self detailTextUsingNarrowWidth:v180 < 414.0];

  double v149 = v107;
  if (v122)
  {
    v215.origin.double x = (v199 - v163) * 0.5;
    v215.origin.double y = v117 - v119 - (v135 + v134);
    double v144 = v215.origin.y;
    double v145 = v215.origin.x;
    v215.size.width = v163;
    v215.size.height = v106;
    double v117 = v116 + v135 + CGRectGetMaxY(v215) + v133;
    double v182 = v106;
    double v184 = v163;
  }
  else
  {
    double v144 = v198;
    double v145 = v204;
  }
  double v123 = v186;
  [v151 setHidden:v122 == 0];
  CGFloat v187 = (v199 - v200) * 0.5;
  CGFloat v124 = v117 - v121 - v123;
  v216.origin.double x = v169;
  v216.origin.double y = v168;
  v216.size.width = v172;
  v216.size.height = rect;
  CGRectGetMinY(v216);
  v217.origin.double x = v187;
  v217.origin.double y = v124;
  v217.size.width = v200;
  v217.size.height = v202;
  CGRectGetMaxY(v217);
  [v150 contentEdgeInsets];
  v218.origin.double x = v204;
  v218.size.height = v197;
  v218.origin.double y = v198;
  v218.size.width = v199;
  CGRectGetHeight(v218);
  UIRoundToViewScale();
  double v126 = y + v125;
  double v127 = v161 + v125;
  double v128 = v153 + v125;
  double v129 = v149 + v125;
  double v171 = v144 + v125;
  CGFloat v130 = v124 + v125;
  objc_msgSend(v203, "frameForAlignmentRect:", v169, v168 + v125, v172, rect);
  objc_msgSend(v203, "setFrame:");
  objc_msgSend(v157, "frameForAlignmentRect:", x, v126, v190, v189);
  objc_msgSend(v157, "setFrame:");
  objc_msgSend(v156, "frameForAlignmentRect:", (v199 - v193) * 0.5, v127, v193, v191);
  objc_msgSend(v156, "setFrame:");
  objc_msgSend(v155, "frameForAlignmentRect:", v159, v128, v194, v192);
  objc_msgSend(v155, "setFrame:");
  objc_msgSend(v154, "frameForAlignmentRect:", v165, v129, v196, v195);
  objc_msgSend(v154, "setFrame:");
  objc_msgSend(v151, "frameForAlignmentRect:", v145, v171, v184, v182);
  objc_msgSend(v151, "setFrame:");
  objc_msgSend(v150, "frameForAlignmentRect:", v187, v130, v200, v202);
  objc_msgSend(v150, "setFrame:");
  objc_msgSend(v147, "setFrame:", v179, v178, v177, v176);
  v205[0] = v206;
  v205[1] = v207;
  v205[2] = v208;
  [v146 setTransform:v205];
  objc_msgSend(v146, "setCenter:", v174, v173);
  objc_msgSend(v146, "setBounds:", v204, v198, v199, v197);
  v131 = [(CAMDescriptionOverlayView *)self _blackoutView];
  objc_msgSend(v131, "setFrame:", v179, v178, v177, v176);

  v132 = [(CAMDescriptionOverlayView *)self _blackoutMask];

  if (v132) {
    -[CAMDescriptionOverlayView _layoutBlackoutMaskForFrame:inFrame:](self, "_layoutBlackoutMaskForFrame:inFrame:", v138, v137, v180, v136, v179, v178, v177, v176);
  }
}

- (BOOL)isDetailButtonHighlighted
{
  v2 = [(CAMDescriptionOverlayView *)self _detailButton];
  char v3 = [v2 isHighlighted];

  return v3;
}

- (void)setDetailButtonHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CAMDescriptionOverlayView *)self _detailButton];
  [v4 setHighlighted:v3];
}

- (void)_handleDetailButtonTapped:(id)a3
{
  [(CAMDescriptionOverlayView *)self detailButtonTapped];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained descriptionOverlayViewDidSelectDetail:self];
}

- (BOOL)isAcknowledgmentButtonHighlighted
{
  v2 = [(CAMDescriptionOverlayView *)self _acknowledgmentButton];
  char v3 = [v2 isHighlighted];

  return v3;
}

- (void)setAcknowledgmentButtonHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CAMDescriptionOverlayView *)self _acknowledgmentButton];
  [v4 setHighlighted:v3];
}

- (void)_handleAcknowledgmentButtonTapped:(id)a3
{
  [(CAMDescriptionOverlayView *)self acknowledgementButtonTapped];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained descriptionOverlayViewDidAcknowledge:self];
}

- (void)setOrientation:(int64_t)a3
{
}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_orientation != a3)
  {
    if (a4)
    {
      [(CAMDescriptionOverlayView *)self layoutIfNeeded];
      self->_orientation = a3;
      [(CAMDescriptionOverlayView *)self setNeedsLayout];
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = __53__CAMDescriptionOverlayView_setOrientation_animated___block_invoke;
      v6[3] = &unk_263FA0208;
      v6[4] = self;
      [MEMORY[0x263F82E00] animateWithDuration:6 delay:v6 options:0 animations:0.25 completion:0.0];
    }
    else
    {
      self->_orientation = a3;
      [(CAMDescriptionOverlayView *)self setNeedsLayout];
    }
  }
}

uint64_t __53__CAMDescriptionOverlayView_setOrientation_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)setViewportFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_viewportFrame = &self->_viewportFrame;
  if (!CGRectEqualToRect(a3, self->_viewportFrame))
  {
    p_viewportFrame->origin.CGFloat x = x;
    p_viewportFrame->origin.CGFloat y = y;
    p_viewportFrame->size.CGFloat width = width;
    p_viewportFrame->size.CGFloat height = height;
    [(CAMDescriptionOverlayView *)self setNeedsLayout];
  }
}

- (void)_layoutBlackoutMaskForFrame:(CGRect)a3 inFrame:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat v8 = a3.size.height;
  CGFloat v9 = a3.size.width;
  CGFloat v10 = a3.origin.y;
  CGFloat v11 = a3.origin.x;
  Mutable = CGPathCreateMutable();
  v16.origin.CGFloat x = x;
  v16.origin.CGFloat y = y;
  v16.size.CGFloat width = width;
  v16.size.CGFloat height = height;
  CGPathAddRect(Mutable, 0, v16);
  v17.origin.CGFloat x = v11;
  v17.origin.CGFloat y = v10;
  v17.size.CGFloat width = v9;
  v17.size.CGFloat height = v8;
  CGPathAddRect(Mutable, 0, v17);
  double v14 = [(CAMDescriptionOverlayView *)self _blackoutMask];
  [v14 setPath:Mutable];

  CGPathRelease(Mutable);
}

- (BOOL)_isVisible
{
  v2 = [(CAMDescriptionOverlayView *)self _titleLabel];
  [v2 alpha];
  double v4 = v3;

  return v4 == 1.0;
}

- (void)setVisible:(BOOL)a3 animationDuration:(double)a4 completion:(id)a5
{
  BOOL v6 = a3;
  CGFloat v8 = (void (**)(void))a5;
  if ([(CAMDescriptionOverlayView *)self _isVisible] != v6)
  {
    CGFloat v9 = [(CAMDescriptionOverlayView *)self delegate];
    [v9 descriptionOverlayView:self willBecomeVisible:v6];
  }
  if (v6) {
    double v10 = 1.0;
  }
  else {
    double v10 = 0.0;
  }
  if (v6)
  {
    CGFloat v11 = [MEMORY[0x263F824D8] effectWithStyle:2];
  }
  else
  {
    CGFloat v11 = 0;
  }
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __69__CAMDescriptionOverlayView_setVisible_animationDuration_completion___block_invoke;
  aBlock[3] = &unk_263FA1F30;
  void aBlock[4] = self;
  id v12 = v11;
  id v19 = v12;
  double v20 = v10;
  BOOL v21 = v6;
  BOOL v22 = v6;
  double v13 = _Block_copy(aBlock);
  double v14 = v13;
  if (a4 <= 0.0)
  {
    (*((void (**)(void *))v13 + 2))(v13);
    if (v8) {
      v8[2](v8);
    }
  }
  else
  {
    v15 = (void *)MEMORY[0x263F82E00];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __69__CAMDescriptionOverlayView_setVisible_animationDuration_completion___block_invoke_2;
    v16[3] = &unk_263FA1EE0;
    CGRect v17 = v8;
    [v15 animateWithDuration:6 delay:v14 options:v16 animations:a4 completion:0.0];
  }
}

uint64_t __69__CAMDescriptionOverlayView_setVisible_animationDuration_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  double v3 = [*(id *)(a1 + 32) _blurEffectView];
  [v3 setEffect:v2];

  double v4 = *(double *)(a1 + 48);
  double v5 = [*(id *)(a1 + 32) _titleLabel];
  [v5 setAlpha:v4];

  double v6 = *(double *)(a1 + 48);
  double v7 = [*(id *)(a1 + 32) _descriptionTitleLabel];
  [v7 setAlpha:v6];

  double v8 = *(double *)(a1 + 48);
  CGFloat v9 = [*(id *)(a1 + 32) _descriptionLabel];
  [v9 setAlpha:v8];

  double v10 = *(double *)(a1 + 48);
  CGFloat v11 = [*(id *)(a1 + 32) _infoTitleLabel];
  [v11 setAlpha:v10];

  double v12 = *(double *)(a1 + 48);
  double v13 = [*(id *)(a1 + 32) _infoLabel];
  [v13 setAlpha:v12];

  double v14 = *(double *)(a1 + 48);
  v15 = [*(id *)(a1 + 32) _detailButton];
  [v15 setAlpha:v14];

  double v16 = *(double *)(a1 + 48);
  CGRect v17 = [*(id *)(a1 + 32) _acknowledgmentButton];
  [v17 setAlpha:v16];

  double v18 = *(double *)(a1 + 48);
  id v19 = [*(id *)(a1 + 32) _blackoutView];
  [v19 setAlpha:v18];

  [*(id *)(a1 + 32) setCustomSubviewsVisible:*(unsigned __int8 *)(a1 + 56)];
  uint64_t v20 = *(unsigned __int8 *)(a1 + 57);
  BOOL v21 = *(void **)(a1 + 32);
  return [v21 setUserInteractionEnabled:v20];
}

uint64_t __69__CAMDescriptionOverlayView_setVisible_animationDuration_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)setBlackoutFrameVisible:(BOOL)a3
{
  if (self->_blackoutFrameVisible != a3)
  {
    self->_blackoutFrameVisible = a3;
    if (a3)
    {
      double v4 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x263F15880]);
      blackoutMask = self->__blackoutMask;
      self->__blackoutMask = v4;

      [(CAShapeLayer *)self->__blackoutMask setFillRule:*MEMORY[0x263F15AC0]];
      id v6 = objc_alloc(MEMORY[0x263F82E00]);
      double v7 = (UIView *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
      blackoutView = self->__blackoutView;
      self->__blackoutView = v7;

      CGFloat v9 = [MEMORY[0x263F825C8] blackColor];
      [(UIView *)self->__blackoutView setBackgroundColor:v9];

      [(UIView *)self->__blackoutView setUserInteractionEnabled:0];
      double v10 = self->__blackoutMask;
      CGFloat v11 = [(UIView *)self->__blackoutView layer];
      [v11 setMask:v10];

      double v12 = self->__blackoutView;
      [(CAMDescriptionOverlayView *)self addSubview:v12];
    }
    else
    {
      double v13 = self->__blackoutView;
      if (v13)
      {
        [(UIView *)v13 removeFromSuperview];
        double v14 = self->__blackoutView;
        self->__blackoutView = 0;

        v15 = self->__blackoutMask;
        self->__blackoutMask = 0;
      }
    }
  }
}

- (id)titleTextUsingNarrowWidth:(BOOL)a3
{
  return &stru_26BD78BA0;
}

- (id)infoTextStyleUsingNarrowWidth:(BOOL)a3
{
  double v3 = (id *)MEMORY[0x263F835E8];
  if (!a3) {
    double v3 = (id *)MEMORY[0x263F83570];
  }
  return *v3;
}

- (BOOL)isTitleMultiline
{
  return 0;
}

- (id)detailTextUsingNarrowWidth:(BOOL)a3
{
  return 0;
}

- (id)acknowledgmentTextUsingNarrowWidth:(BOOL)a3
{
  return &stru_26BD78BA0;
}

- (id)descriptionTitleTextUsingNarrowWidth:(BOOL)a3
{
  return 0;
}

- (id)attributedDescriptionTextUsingNarrowWidth:(BOOL)a3
{
  double v3 = [(CAMDescriptionOverlayView *)self descriptionTextUsingNarrowWidth:a3];
  if (v3) {
    double v4 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v3];
  }
  else {
    double v4 = 0;
  }

  return v4;
}

- (id)descriptionTextUsingNarrowWidth:(BOOL)a3
{
  return &stru_26BD78BA0;
}

- (id)infoTitleTextUsingNarrowWidth:(BOOL)a3
{
  return 0;
}

- (id)infoTextUsingNarrowWidth:(BOOL)a3
{
  return &stru_26BD78BA0;
}

- (double)maxTitleTextWidthForNarrowWidth:(BOOL)a3 isLandscape:(BOOL)a4
{
  return 0.0;
}

- (double)maxDescriptionTextWidthForNarrowWidth:(BOOL)a3 isLandscape:(BOOL)a4 usingFontSizeMultiplier:(double)a5
{
  return 0.0;
}

- (double)maxInfoTextWidthForNarrowWidth:(BOOL)a3 isLandscape:(BOOL)a4 usingFontSizeMultiplier:(double)a5
{
  return 0.0;
}

- (id)currentContentSize
{
  uint64_t v2 = [(CAMDescriptionOverlayView *)self traitCollection];
  double v3 = [v2 preferredContentSizeCategory];

  return v3;
}

- (double)additionalSpacing
{
  double v3 = [(CAMDescriptionOverlayView *)self currentContentSize];
  [(CAMDescriptionOverlayView *)self _additionalSpacingForContentSize:v3];
  double v5 = v4;

  return v5;
}

- (double)_additionalSpacingForContentSize:(id)a3
{
  id v3 = a3;
  double v4 = 0.0;
  if (([v3 isEqualToString:*MEMORY[0x263F83458]] & 1) == 0
    && ([v3 isEqualToString:*MEMORY[0x263F83488]] & 1) == 0
    && ([v3 isEqualToString:*MEMORY[0x263F83470]] & 1) == 0)
  {
    uint64_t v5 = *MEMORY[0x263F83468];
    if (([v3 isEqualToString:*MEMORY[0x263F83468]] & 1) == 0)
    {
      double v4 = 5.0;
      if (([v3 isEqualToString:v5] & 1) == 0)
      {
        double v4 = 10.0;
        if (([v3 isEqualToString:*MEMORY[0x263F83450]] & 1) == 0)
        {
          if (([v3 isEqualToString:*MEMORY[0x263F83440]] & 1) != 0
            || ([v3 isEqualToString:*MEMORY[0x263F83430]] & 1) != 0
            || ([v3 isEqualToString:*MEMORY[0x263F83420]] & 1) != 0
            || ([v3 isEqualToString:*MEMORY[0x263F83418]] & 1) != 0
            || ([v3 isEqualToString:*MEMORY[0x263F83410]] & 1) != 0
            || ([v3 isEqualToString:*MEMORY[0x263F83408]] & 1) != 0
            || (double v4 = 0.0, [v3 isEqualToString:*MEMORY[0x263F83400]]))
          {
            double v4 = 15.0;
          }
        }
      }
    }
  }

  return v4;
}

- (BOOL)detailTextShouldHaveVibrancyEffect
{
  return 1;
}

- (int64_t)buttonStyle
{
  return 0;
}

- (CAMDescriptionOverlayViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CAMDescriptionOverlayViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (CGRect)viewportFrame
{
  double x = self->_viewportFrame.origin.x;
  double y = self->_viewportFrame.origin.y;
  double width = self->_viewportFrame.size.width;
  double height = self->_viewportFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)isBlackoutFrameVisible
{
  return self->_blackoutFrameVisible;
}

- (UIVisualEffectView)_blurEffectView
{
  return self->__blurEffectView;
}

- (UIView)_blackoutView
{
  return self->__blackoutView;
}

- (CAShapeLayer)_blackoutMask
{
  return self->__blackoutMask;
}

- (CAMPortraitModeDescriptionOverlayPrimaryVibrancyEffectView)_primaryVibrancyEffectView
{
  return self->__primaryVibrancyEffectView;
}

- (UILabel)_titleLabel
{
  return self->__titleLabel;
}

- (UILabel)_descriptionTitleLabel
{
  return self->__descriptionTitleLabel;
}

- (UILabel)_descriptionLabel
{
  return self->__descriptionLabel;
}

- (UILabel)_infoTitleLabel
{
  return self->__infoTitleLabel;
}

- (UILabel)_infoLabel
{
  return self->__infoLabel;
}

- (UIButton)_detailButton
{
  return self->__detailButton;
}

- (UIButton)_acknowledgmentButton
{
  return self->__acknowledgmentButton;
}

- (double)_descriptionFontSizeMultiplier
{
  return self->__descriptionFontSizeMultiplier;
}

- (void)_setDescriptionFontSizeMultiplier:(double)a3
{
  self->__descriptionFontSizeMultiplier = a3;
}

- (double)_infoFontSizeMultiplier
{
  return self->__infoFontSizeMultiplier;
}

- (void)_setInfoFontSizeMultiplier:(double)a3
{
  self->__infoFontSizeMultiplier = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__acknowledgmentButton, 0);
  objc_storeStrong((id *)&self->__detailButton, 0);
  objc_storeStrong((id *)&self->__infoLabel, 0);
  objc_storeStrong((id *)&self->__infoTitleLabel, 0);
  objc_storeStrong((id *)&self->__descriptionLabel, 0);
  objc_storeStrong((id *)&self->__descriptionTitleLabel, 0);
  objc_storeStrong((id *)&self->__titleLabel, 0);
  objc_storeStrong((id *)&self->__primaryVibrancyEffectView, 0);
  objc_storeStrong((id *)&self->__blackoutMask, 0);
  objc_storeStrong((id *)&self->__blackoutView, 0);
  objc_storeStrong((id *)&self->__blurEffectView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end