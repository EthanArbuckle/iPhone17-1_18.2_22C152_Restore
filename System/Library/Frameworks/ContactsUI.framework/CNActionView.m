@interface CNActionView
+ (CGSize)minimumSizeForStyle:(int64_t)a3;
+ (UIFont)defaultTitleFont;
+ (double)minimumPillDimension;
+ (id)borderColorForDisabledBoldState;
+ (id)colorByIncreasingBrightnessComponentByPercentage:(double)a3 ofColor:(id)a4;
+ (id)contentColorForDisabledBoldState;
+ (id)contentColorForDisabledVibrantDarkState;
+ (id)titleFontForStyle:(int64_t)a3;
+ (void)fadeInView:(id)a3;
- (BOOL)disabled;
- (BOOL)shouldShowDisambiguation;
- (CGSize)intrinsicContentSize;
- (CGSize)platterViewMinimumLayoutSizeForStyle:(int64_t)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CNActionMenuHelper)actionMenuHelper;
- (CNActionView)init;
- (CNActionView)initWithFrame:(CGRect)a3;
- (CNActionViewDelegate)actionDelegate;
- (NSString)title;
- (NSString)type;
- (NUIContainerBoxView)platterBoxView;
- (NUIContainerStackView)containerView;
- (NUIContainerStackView)horizontalContentView;
- (TLKProminenceView)vibrantBackgroundView;
- (TLKProminenceView)vibrantPlatterView;
- (UIColor)posterTintColor;
- (UIFont)titleFont;
- (UIImage)image;
- (UIImageView)imageView;
- (UILabel)titleLabel;
- (UIView)platterView;
- (UIVisualEffectView)colorMatrixView;
- (_UIVisualEffectBackdropView)visualEffectViewCaptureView;
- (id)colorByAdjustingColorToHighlightState:(id)a3;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4;
- (id)sourceViewForContextMenuPreview;
- (int64_t)style;
- (void)applyDefaultLabelContainerMetrics;
- (void)applyRoundedRectMargins;
- (void)containerViewDidLayoutArrangedSubviews:(id)a3;
- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)didMoveToWindow;
- (void)handleTapGesture;
- (void)layoutSubviews;
- (void)setActionDelegate:(id)a3;
- (void)setActionMenuHelper:(id)a3;
- (void)setColorMatrixView:(id)a3;
- (void)setContainerView:(id)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setDisabled:(BOOL)a3 animated:(BOOL)a4;
- (void)setHighlighted:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)setHorizontalContentView:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageView:(id)a3;
- (void)setPlatterBoxView:(id)a3;
- (void)setPlatterView:(id)a3;
- (void)setPosterTintColor:(id)a3;
- (void)setStyle:(int64_t)a3;
- (void)setTitle:(id)a3;
- (void)setTitleFont:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setType:(id)a3;
- (void)setVibrantBackgroundView:(id)a3;
- (void)setVibrantPlatterView:(id)a3;
- (void)setVisualEffectViewCaptureView:(id)a3;
- (void)tintColorDidChange;
- (void)tlk_updateForAppearance:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateBackground;
- (void)updateBackgroundForVibrantRoundedRect;
- (void)updateImage;
- (void)updateImageViewStateAnimated:(BOOL)a3;
- (void)updateLabelArrangedSubviews;
- (void)updateLabelStateAnimated:(BOOL)a3;
- (void)updatePlatterViewStateAnimated:(BOOL)a3;
- (void)updateTitleLabelFont;
- (void)updateWithMenuItems:(id)a3;
@end

@implementation CNActionView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualEffectViewCaptureView, 0);
  objc_storeStrong((id *)&self->_posterTintColor, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_colorMatrixView, 0);
  objc_storeStrong((id *)&self->_vibrantBackgroundView, 0);
  objc_storeStrong((id *)&self->_vibrantPlatterView, 0);
  objc_storeStrong((id *)&self->_actionMenuHelper, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_horizontalContentView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_platterView, 0);
  objc_storeStrong((id *)&self->_platterBoxView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_image, 0);

  objc_destroyWeak((id *)&self->_actionDelegate);
}

- (_UIVisualEffectBackdropView)visualEffectViewCaptureView
{
  return self->_visualEffectViewCaptureView;
}

- (UIColor)posterTintColor
{
  return self->_posterTintColor;
}

- (void)setTitleFont:(id)a3
{
}

- (void)setColorMatrixView:(id)a3
{
}

- (UIVisualEffectView)colorMatrixView
{
  return self->_colorMatrixView;
}

- (void)setVibrantBackgroundView:(id)a3
{
}

- (TLKProminenceView)vibrantBackgroundView
{
  return self->_vibrantBackgroundView;
}

- (void)setVibrantPlatterView:(id)a3
{
}

- (TLKProminenceView)vibrantPlatterView
{
  return self->_vibrantPlatterView;
}

- (void)setActionMenuHelper:(id)a3
{
}

- (CNActionMenuHelper)actionMenuHelper
{
  return self->_actionMenuHelper;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setHorizontalContentView:(id)a3
{
}

- (NUIContainerStackView)horizontalContentView
{
  return self->_horizontalContentView;
}

- (void)setImageView:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setPlatterView:(id)a3
{
}

- (UIView)platterView
{
  return self->_platterView;
}

- (void)setPlatterBoxView:(id)a3
{
}

- (NUIContainerBoxView)platterBoxView
{
  return self->_platterBoxView;
}

- (void)setContainerView:(id)a3
{
}

- (NUIContainerStackView)containerView
{
  return self->_containerView;
}

- (BOOL)disabled
{
  return self->_disabled;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setType:(id)a3
{
}

- (NSString)type
{
  return self->_type;
}

- (NSString)title
{
  return self->_title;
}

- (UIImage)image
{
  return self->_image;
}

- (CNActionViewDelegate)actionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionDelegate);

  return (CNActionViewDelegate *)WeakRetained;
}

- (void)updateWithMenuItems:(id)a3
{
  id v4 = a3;
  id v6 = [(CNActionView *)self actionMenuHelper];
  v5 = [(CNActionView *)self contextMenuInteraction];
  [v6 updateWithMenuItems:v4 contextMenuInteraction:v5];
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  v7.receiver = self;
  v7.super_class = (Class)CNActionView;
  [(CNActionView *)&v7 contextMenuInteraction:a3 willEndForConfiguration:a4 animator:a5];
  id v6 = [(CNActionView *)self actionMenuHelper];
  [v6 willDismissMenu];
}

- (void)contextMenuInteraction:(id)a3 willDisplayMenuForConfiguration:(id)a4 animator:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)CNActionView;
  id v8 = a3;
  [(CNActionView *)&v10 contextMenuInteraction:v8 willDisplayMenuForConfiguration:a4 animator:a5];
  v9 = [(CNActionView *)self actionMenuHelper];
  [v9 willDisplayMenuWithContextMenuInteraction:v8];
}

- (id)sourceViewForContextMenuPreview
{
  if ([(CNActionView *)self style] == 7
    || [(CNActionView *)self style] == 6
    || [(CNActionView *)self style] == 11
    || [(CNActionView *)self style] == 10)
  {
    v3 = self;
  }
  else
  {
    v3 = [(CNActionView *)self imageView];
  }

  return v3;
}

- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4
{
  v5 = [(CNActionView *)self sourceViewForContextMenuPreview];
  objc_super v10 = v5;
  if (v5)
  {
    v11 = [v5 window];

    if (v11)
    {
      v16 = [(CNActionView *)self actionMenuHelper];
      v17 = [v16 targetedPreviewForSourceView:v10];

      goto LABEL_7;
    }
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNActionView.m", 942, 3, @"Tried to initialize UITargetedPreview with a view that is not in a window: %@", v12, v13, v14, v15, (uint64_t)v10);
  }
  else
  {
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNActionView.m", 942, 3, @"Tried to initialize UITargetedPreview with a view that is not in a window: %@", v6, v7, v8, v9, 0);
  }
  v17 = 0;
LABEL_7:

  return v17;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  if ([(CNActionView *)self shouldShowDisambiguation])
  {
    v5 = [(CNActionView *)self actionMenuHelper];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __70__CNActionView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
    v11[3] = &unk_1E549B488;
    v11[4] = self;
    uint64_t v6 = [v5 configurationActionProviderWithActionBlock:v11];

    uint64_t v7 = (void *)MEMORY[0x1E4FB1678];
    uint64_t v8 = [(CNActionView *)self type];
    uint64_t v9 = [v7 configurationWithIdentifier:v8 previewProvider:0 actionProvider:v6];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

void __70__CNActionView_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) actionDelegate];
  [v2 didPressActionView:*(void *)(a1 + 32) longPress:1];
}

- (void)containerViewDidLayoutArrangedSubviews:(id)a3
{
  id v4 = [(CNActionView *)self platterView];
  [v4 frame];
  double v6 = v5 * 0.5;
  uint64_t v7 = [(CNActionView *)self platterView];
  uint64_t v8 = [v7 layer];
  [v8 setCornerRadius:v6];

  uint64_t v9 = *MEMORY[0x1E4F39EA8];
  objc_super v10 = [(CNActionView *)self platterView];
  v11 = [v10 layer];
  [v11 setCornerCurve:v9];

  uint64_t v12 = [(CNActionView *)self vibrantPlatterView];
  [v12 frame];
  double v14 = v13 * 0.5;
  uint64_t v15 = [(CNActionView *)self vibrantPlatterView];
  v16 = [v15 layer];
  [v16 setCornerRadius:v14];

  id v18 = [(CNActionView *)self vibrantPlatterView];
  v17 = [v18 layer];
  [v17 setCornerCurve:v9];
}

- (void)layoutSubviews
{
  v21.receiver = self;
  v21.super_class = (Class)CNActionView;
  [(CNActionView *)&v21 layoutSubviews];
  [(CNActionView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(CNActionView *)self vibrantBackgroundView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  [(CNActionView *)self bounds];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  v20 = [(CNActionView *)self colorMatrixView];
  objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);
}

- (void)handleTapGesture
{
  double v3 = [(CNActionView *)self actionDelegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(CNActionView *)self actionDelegate];
    [v5 didPressActionView:self longPress:0];
  }
}

- (void)updateTitleLabelFont
{
  double v3 = [(CNActionView *)self titleLabel];

  if (v3)
  {
    char v4 = objc_msgSend((id)objc_opt_class(), "titleFontForStyle:", -[CNActionView style](self, "style"));
    [(CNActionView *)self setTitleFont:v4];

    id v6 = [(CNActionView *)self titleFont];
    id v5 = [(CNActionView *)self titleLabel];
    [v5 setFont:v6];
  }
}

- (UIFont)titleFont
{
  titleFont = self->_titleFont;
  if (titleFont)
  {
    double v3 = titleFont;
  }
  else
  {
    double v3 = [(id)objc_opt_class() defaultTitleFont];
  }

  return v3;
}

- (void)setTitle:(id)a3
{
  id v5 = (NSString *)a3;
  if (self->_title != v5)
  {
    double v9 = v5;
    objc_storeStrong((id *)&self->_title, a3);
    id v6 = [(CNActionView *)self titleLabel];

    if (!v6)
    {
      double v7 = objc_opt_new();
      [v7 setNumberOfLines:1];
      if (objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory")) {
        uint64_t v8 = 4;
      }
      else {
        uint64_t v8 = 1;
      }
      [v7 setTextAlignment:v8];
      [(CNActionView *)self setTitleLabel:v7];
      [(CNActionView *)self updateTitleLabelFont];
    }
    [(CNActionView *)self updateLabelStateAnimated:0];
    id v5 = v9;
  }
}

- (void)updateImage
{
  int64_t v3 = [(CNActionView *)self style];
  if ((unint64_t)(v3 - 10) < 2)
  {
    id v11 = [(CNActionView *)self image];
    double v7 = (void *)MEMORY[0x1E4FB1830];
    id v5 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2998]];
    uint64_t v6 = [v7 configurationWithFont:v5];
    goto LABEL_5;
  }
  if ((unint64_t)(v3 - 8) <= 1)
  {
    id v11 = [(CNActionView *)self image];
    char v4 = (void *)MEMORY[0x1E4FB1830];
    id v5 = [(CNActionView *)self titleFont];
    [v5 pointSize];
    uint64_t v6 = objc_msgSend(v4, "configurationWithPointSize:");
LABEL_5:
    uint64_t v8 = (void *)v6;
    double v9 = [v11 imageWithConfiguration:v6];
    double v10 = [(CNActionView *)self imageView];
    [v10 setImage:v9];

    goto LABEL_7;
  }
  id v11 = [(CNActionView *)self image];
  id v5 = [(CNActionView *)self imageView];
  [v5 setImage:v11];
LABEL_7:
}

- (void)setImage:(id)a3
{
  id v5 = (UIImage *)a3;
  if (self->_image != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_image, a3);
    [(CNActionView *)self updateImage];
    [(CNActionView *)self updateImageViewStateAnimated:0];
    id v5 = v6;
  }
}

- (void)updateLabelArrangedSubviews
{
  if (([(CNActionView *)self style] & 0xFFFFFFFFFFFFFFFELL) == 8)
  {
    int64_t v3 = [(CNActionView *)self containerView];
    char v4 = [(CNActionView *)self titleLabel];
    [v3 removeArrangedSubview:v4];

    [(CNActionView *)self horizontalContentView];
  }
  else
  {
    id v5 = [(CNActionView *)self horizontalContentView];
    uint64_t v6 = [(CNActionView *)self titleLabel];
    [v5 removeArrangedSubview:v6];

    [(CNActionView *)self containerView];
  }
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  double v7 = [(CNActionView *)self titleLabel];
  [v8 addArrangedSubview:v7];
}

- (void)applyDefaultLabelContainerMetrics
{
  double v3 = *MEMORY[0x1E4FB2848];
  double v4 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v5 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v6 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  double v7 = [(CNActionView *)self horizontalContentView];
  objc_msgSend(v7, "setLayoutMargins:", v3, v4, v5, v6);

  id v8 = [(CNActionView *)self title];
  double v9 = [(CNActionView *)self titleLabel];
  [v9 setText:v8];

  double v10 = [(CNActionView *)self containerView];
  [v10 setAlignment:3];

  id v11 = [(CNActionView *)self titleLabel];
  [v11 setHidden:0];

  if ((objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory") & 1) == 0)
  {
    double v12 = *MEMORY[0x1E4F4BEC8];
    id v13 = [(CNActionView *)self titleLabel];
    objc_msgSend(v13, "setMaximumLayoutSize:", 66.0, v12);
  }
}

- (void)updateLabelStateAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(CNActionView *)self titleLabel];

  if (v5)
  {
    double v6 = [(CNActionView *)self titleLabel];
    double v7 = [(CNActionView *)self title];
    [v6 setText:v7];

    switch([(CNActionView *)self style])
    {
      case 1:
        if (![(CNActionView *)self disabled]) {
          goto LABEL_15;
        }
        uint64_t v12 = [(id)objc_opt_class() contentColorForDisabledVibrantDarkState];
        goto LABEL_16;
      case 2:
      case 3:
      case 6:
      case 11:
      case 12:
        id v8 = [MEMORY[0x1E4FAE060] bestAppearanceForView:self];
        if ([(CNActionView *)self disabled]) {
          uint64_t v9 = 2;
        }
        else {
          uint64_t v9 = 1;
        }
        goto LABEL_6;
      case 4:
      case 7:
        if (![(CNActionView *)self disabled]) {
          goto LABEL_15;
        }
        uint64_t v12 = [(id)objc_opt_class() contentColorForDisabledBoldState];
        goto LABEL_16;
      case 8:
        if (![(CNActionView *)self disabled]) {
          goto LABEL_15;
        }
        uint64_t v12 = +[CNUIColorRepository quickActionContentColorDisabledPill];
        goto LABEL_16;
      case 9:
        id v8 = [MEMORY[0x1E4FAE060] bestAppearanceForView:self];
        if ([(CNActionView *)self disabled]) {
          uint64_t v9 = 2;
        }
        else {
          uint64_t v9 = 0;
        }
LABEL_6:
        id v30 = [v8 colorForProminence:v9];

        double v10 = [MEMORY[0x1E4FAE060] bestAppearanceForView:self];
        id v11 = [(CNActionView *)self titleLabel];
        [v10 enableAppearanceForView:v11];

        goto LABEL_7;
      case 10:
        double v10 = [(CNActionView *)self posterTintColor];
        if ([(CNActionView *)self disabled]) {
          [v10 colorWithAlphaComponent:0.2];
        }
        else {
        id v30 = [(CNActionView *)self posterTintColor];
        }
LABEL_7:

        break;
      default:
LABEL_15:
        uint64_t v12 = [(UIView *)self tintColorOverride];
LABEL_16:
        id v30 = (id)v12;
        break;
    }
    id v13 = [(CNActionView *)self titleLabel];
    [v13 setTextColor:v30];

    [(CNActionView *)self updateLabelArrangedSubviews];
    double v14 = [(CNActionView *)self title];
    if (v14)
    {
      double v15 = [(CNActionView *)self title];
      BOOL v16 = [v15 length] == 0;
    }
    else
    {
      BOOL v16 = 1;
    }

    if (([(CNActionView *)self style] & 0xFFFFFFFFFFFFFFFELL) == 8)
    {
      if (v16)
      {
        [(CNActionView *)self applyDefaultLabelContainerMetrics];
      }
      else
      {
        double v17 = [(CNActionView *)self horizontalContentView];
        objc_msgSend(v17, "setLayoutMargins:", 0.0, 14.0, 0.0, 14.0);

        double v18 = [(CNActionView *)self title];
        double v19 = [v18 localizedCapitalizedString];
        v20 = [(CNActionView *)self titleLabel];
        [v20 setText:v19];

        double v21 = *MEMORY[0x1E4F4BED0];
        double v22 = *(double *)(MEMORY[0x1E4F4BED0] + 8);
        v23 = [(CNActionView *)self titleLabel];
        objc_msgSend(v23, "setMaximumLayoutSize:", v21, v22);
      }
      v24 = [(CNActionView *)self titleLabel];
      [v24 setHidden:v16];

      v25 = [(CNActionView *)self containerView];
      [v25 setAlignment:0];
    }
    else
    {
      [(CNActionView *)self applyDefaultLabelContainerMetrics];
    }
    v26 = [(CNActionView *)self titleFont];
    v27 = [(CNActionView *)self titleLabel];
    [v27 setFont:v26];

    if (v3)
    {
      v28 = objc_opt_class();
      v29 = [(CNActionView *)self titleLabel];
      [v28 fadeInView:v29];
    }
  }
}

- (void)updateImageViewStateAnimated:(BOOL)a3
{
  double v4 = [(CNActionView *)self window];

  if (v4)
  {
    switch([(CNActionView *)self style])
    {
      case 1:
      case 5:
        if (![(CNActionView *)self disabled]) {
          goto LABEL_16;
        }
        uint64_t v9 = [(id)objc_opt_class() contentColorForDisabledVibrantDarkState];
        goto LABEL_25;
      case 2:
      case 3:
      case 6:
      case 9:
      case 11:
      case 12:
        double v5 = [MEMORY[0x1E4FAE060] bestAppearanceForView:self];
        double v6 = [v5 primaryButtonColor];
        if ([(CNActionView *)self disabled])
        {
          id v7 = [v6 colorWithAlphaComponent:0.3];
        }
        else
        {
          id v7 = v6;
        }
        id v13 = v7;
        id v8 = [(CNActionView *)self imageView];
        [v5 enableAppearanceForView:v8];

        goto LABEL_23;
      case 4:
        if ([(CNActionView *)self disabled]) {
          goto LABEL_20;
        }
        uint64_t v9 = +[CNUIColorRepository quickActionContentColorEnabled];
        goto LABEL_25;
      case 7:
        if ([(CNActionView *)self disabled]) {
          goto LABEL_20;
        }
        goto LABEL_16;
      case 8:
        if ([(CNActionView *)self disabled])
        {
          uint64_t v9 = +[CNUIColorRepository quickActionContentColorDisabledPill];
LABEL_25:
          id v13 = (id)v9;
        }
        else
        {
LABEL_16:
          double v5 = [(UIView *)self tintColorOverride];
          id v10 = [(CNActionView *)self colorByAdjustingColorToHighlightState:v5];
LABEL_22:
          id v13 = v10;
LABEL_23:
        }
        uint64_t v12 = [(CNActionView *)self imageView];
        [v12 setTintColor:v13];

        break;
      case 10:
        id v11 = [(CNActionView *)self posterTintColor];
        double v5 = [(CNActionView *)self colorByAdjustingColorToHighlightState:v11];

        if ([(CNActionView *)self disabled])
        {
          id v10 = [v5 colorWithAlphaComponent:0.2];
        }
        else
        {
          id v10 = v5;
        }
        goto LABEL_22;
      default:
        if ([(CNActionView *)self disabled])
        {
LABEL_20:
          uint64_t v9 = [(id)objc_opt_class() contentColorForDisabledBoldState];
        }
        else
        {
          uint64_t v9 = +[CNUIColorRepository quickActionContentColor];
        }
        goto LABEL_25;
    }
  }
}

- (void)updatePlatterViewStateAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(CNActionView *)self window];

  if (v5
    && [(CNActionView *)self style] != 6
    && [(CNActionView *)self style] != 11
    && [(CNActionView *)self style] != 10)
  {
    BOOL v6 = [(CNActionView *)self style] == 3
      || [(CNActionView *)self style] == 2
      || [(CNActionView *)self style] == 9
      || [(CNActionView *)self style] == 12;
    id v7 = [(CNActionView *)self platterView];
    [v7 setHidden:v6];

    id v8 = [(CNActionView *)self vibrantPlatterView];
    [v8 setHidden:v6 ^ 1];

    switch([(CNActionView *)self style])
    {
      case 0:
      case 5:
        id v23 = [MEMORY[0x1E4FB1618] clearColor];
        v24 = [(CNActionView *)self platterView];
        [v24 setBackgroundColor:v23];
        goto LABEL_28;
      case 2:
      case 3:
      case 9:
      case 12:
        uint64_t v9 = [(CNActionView *)self vibrantPlatterView];

        if (!v9)
        {
          id v10 = objc_opt_new();
          [(CNActionView *)self setVibrantPlatterView:v10];

          [(CNActionView *)self platterViewMinimumLayoutSizeForStyle:[(CNActionView *)self style]];
          double v12 = v11;
          double v14 = v13;
          double v15 = [(CNActionView *)self vibrantPlatterView];
          objc_msgSend(v15, "setMinimumLayoutSize:", v12, v14);

          BOOL v16 = [(CNActionView *)self platterBoxView];
          double v17 = [(CNActionView *)self vibrantPlatterView];
          [v16 insertArrangedSubview:v17 atIndex:0];
        }
        if ([(CNActionView *)self isHighlighted]) {
          uint64_t v18 = 2;
        }
        else {
          uint64_t v18 = 3;
        }
        double v19 = [(CNActionView *)self vibrantPlatterView];
        [v19 setProminence:v18];

        v20 = [(CNActionView *)self layer];
        double v21 = v20;
        uint64_t v22 = 0;
        goto LABEL_16;
      case 4:
        if ([(CNActionView *)self disabled])
        {
          v39 = [MEMORY[0x1E4FB1618] clearColor];
          v40 = [(CNActionView *)self platterView];
          [v40 setBackgroundColor:v39];

          v41 = [(CNActionView *)self platterView];
          v42 = [v41 layer];
          [v42 setBorderWidth:1.0];

          id v23 = [(id)objc_opt_class() borderColorForDisabledBoldState];
          uint64_t v43 = [v23 CGColor];
          v24 = [(CNActionView *)self platterView];
          v44 = [v24 layer];
          v45 = v44;
          uint64_t v46 = v43;
        }
        else
        {
          v52 = +[CNContactStyle currentStyle];
          v53 = [v52 transportBoldBackgroundColor];
          v54 = v53;
          if (v53)
          {
            id v55 = v53;
          }
          else
          {
            id v55 = [(UIView *)self tintColorOverride];
          }
          id v23 = v55;

          v56 = [(CNActionView *)self platterView];
          [v56 setBackgroundColor:v23];

          v57 = [(CNActionView *)self platterView];
          v58 = [v57 layer];
          [v58 setBorderWidth:0.0];

          v24 = [(CNActionView *)self platterView];
          v44 = [v24 layer];
          v45 = v44;
          uint64_t v46 = 0;
        }
        [v44 setBorderColor:v46];

LABEL_28:
        if ([(CNActionView *)self isHighlighted]) {
          double v59 = 0.3;
        }
        else {
          double v59 = 1.0;
        }
        double v21 = [(CNActionView *)self platterView];
        [v21 setAlpha:v59];
        goto LABEL_32;
      case 7:
        v47 = [MEMORY[0x1E4FB1618] clearColor];
        v48 = [(CNActionView *)self platterView];
        [v48 setBackgroundColor:v47];

        v49 = [(CNActionView *)self platterView];
        v50 = [v49 layer];
        [v50 setBorderWidth:0.0];

        double v21 = [(CNActionView *)self platterView];
        v51 = [v21 layer];
        [v51 setCompositingFilter:0];

        goto LABEL_32;
      default:
        v25 = [(CNActionView *)self platterView];
        v26 = [v25 layer];
        [v26 setBorderWidth:1.0];

        v27 = +[CNContactStyle currentStyle];
        v28 = [v27 transportBackgroundColor];
        v29 = [(CNActionView *)self colorByAdjustingColorToHighlightState:v28];
        id v30 = [(CNActionView *)self platterView];
        [v30 setBackgroundColor:v29];

        v31 = +[CNContactStyle currentStyle];
        v32 = [v31 transportBorderColor];
        id v33 = [(CNActionView *)self colorByAdjustingColorToHighlightState:v32];
        uint64_t v34 = [v33 CGColor];
        v35 = [(CNActionView *)self platterView];
        v36 = [v35 layer];
        [v36 setBorderColor:v34];

        v37 = [(CNActionView *)self platterView];
        v38 = [v37 layer];
        [v38 setCompositingFilter:0];

        v20 = [(CNActionView *)self layer];
        double v21 = v20;
        uint64_t v22 = 1;
LABEL_16:
        [v20 setAllowsGroupBlending:v22];
LABEL_32:

        if (v3)
        {
          v60 = objc_opt_class();
          id v61 = [(CNActionView *)self platterView];
          [v60 fadeInView:v61];
        }
        break;
    }
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v6 = [(CNActionView *)self title];
  if (v6)
  {
    id v7 = (void *)v6;
    id v8 = [(CNActionView *)self titleLabel];
    uint64_t v9 = [v8 text];

    if (!v9)
    {
      id v10 = [(CNActionView *)self titleLabel];
      double v11 = [(CNActionView *)self title];
      [v10 setText:v11];
    }
  }
  double v12 = [(CNActionView *)self containerView];
  objc_msgSend(v12, "sizeThatFits:", width, height);
  double v14 = v13;
  double v16 = v15;

  double v17 = v14;
  double v18 = v16;
  result.double height = v18;
  result.double width = v17;
  return result;
}

- (CGSize)intrinsicContentSize
{
  id v2 = [(CNActionView *)self containerView];
  objc_msgSend(v2, "effectiveLayoutSizeFittingSize:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (void)tlk_updateForAppearance:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CNActionView;
  [(CNActionView *)&v4 tlk_updateForAppearance:a3];
  [(CNActionView *)self updateLabelStateAnimated:0];
  [(CNActionView *)self updateImageViewStateAnimated:0];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNActionView;
  [(CNActionView *)&v9 traitCollectionDidChange:v4];
  double v5 = [(CNActionView *)self traitCollection];
  if ([v5 hasDifferentColorAppearanceComparedToTraitCollection:v4])
  {

LABEL_4:
    [(CNActionView *)self tlk_updateWithCurrentAppearance];
    goto LABEL_5;
  }
  double v6 = [(CNActionView *)self traitCollection];
  uint64_t v7 = [v6 _vibrancy];
  uint64_t v8 = [v4 _vibrancy];

  if (v7 != v8) {
    goto LABEL_4;
  }
LABEL_5:
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)CNActionView;
  [(CNActionView *)&v3 tintColorDidChange];
  [(CNActionView *)self tlk_updateWithCurrentAppearance];
  [(CNActionView *)self updatePlatterViewStateAnimated:0];
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)CNActionView;
  [(CNActionView *)&v3 didMoveToWindow];
  [(CNActionView *)self tlk_updateWithCurrentAppearance];
  [(CNActionView *)self updatePlatterViewStateAnimated:0];
  [(CNActionView *)self invalidateIntrinsicContentSize];
}

- (CGSize)platterViewMinimumLayoutSizeForStyle:(int64_t)a3
{
  double v3 = 37.0;
  if ((unint64_t)a3 <= 0xB)
  {
    if (((1 << a3) & 0xCC0) != 0)
    {
      double v3 = 24.0;
      if (objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory")) {
        -[UIImageView setMinimumLayoutSize:](self->_imageView, "setMinimumLayoutSize:", 28.0, 28.0);
      }
    }
    else if (((1 << a3) & 0x300) != 0)
    {
      [(id)objc_opt_class() minimumPillDimension];
      double v3 = v5;
    }
  }
  double v6 = v3;
  double v7 = v3;
  result.double height = v7;
  result.double width = v6;
  return result;
}

- (void)applyRoundedRectMargins
{
  double v3 = [(CNActionView *)self containerView];
  [v3 setLayoutMarginsRelativeArrangement:1];

  if (objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory"))
  {
    id v10 = [(UIView *)self _cnui_contactStyle];
    [v10 sectionContentInset];
    double v5 = v4;
    double v6 = [(UIView *)self _cnui_contactStyle];
    [v6 sectionContentInset];
    double v8 = v7;
    objc_super v9 = [(CNActionView *)self containerView];
    objc_msgSend(v9, "setLayoutMargins:", 9.5, v5, 9.5, v8);
  }
  else
  {
    id v10 = [(CNActionView *)self containerView];
    objc_msgSend(v10, "setLayoutMargins:", 9.5, 4.0, 9.5, 4.0);
  }
}

- (void)updateBackgroundForVibrantRoundedRect
{
  [(CNActionView *)self applyRoundedRectMargins];
  [(CNActionView *)self setBackgroundColor:0];
  double v3 = [(CNActionView *)self layer];
  [v3 setCornerRadius:0.0];

  double v4 = [(CNActionView *)self layer];
  [v4 setBorderWidth:0.0];

  double v5 = [(CNActionView *)self layer];
  [v5 setBorderColor:0];

  double v6 = [(CNActionView *)self vibrantBackgroundView];

  if (!v6)
  {
    double v7 = (void *)[objc_alloc(MEMORY[0x1E4FAE120]) initWithProminence:3];
    [(CNActionView *)self setVibrantBackgroundView:v7];

    double v8 = [(CNActionView *)self vibrantBackgroundView];
    [v8 setUserInteractionEnabled:0];

    objc_super v9 = [(CNActionView *)self vibrantBackgroundView];
    id v10 = [v9 layer];
    [v10 setCornerRadius:10.0];

    uint64_t v11 = *MEMORY[0x1E4F39EA8];
    double v12 = [(CNActionView *)self vibrantBackgroundView];
    double v13 = [v12 layer];
    [v13 setCornerCurve:v11];

    double v14 = [(CNActionView *)self vibrantBackgroundView];
    double v15 = [(CNActionView *)self containerView];
    [(CNActionView *)self insertSubview:v14 belowSubview:v15];

    [(CNActionView *)self setNeedsLayout];
  }
  if ([(CNActionView *)self isHighlighted]) {
    uint64_t v16 = 2;
  }
  else {
    uint64_t v16 = 3;
  }
  double v17 = [(CNActionView *)self vibrantBackgroundView];
  [v17 setProminence:v16];

  double v18 = [(CNActionView *)self vibrantBackgroundView];
  [v18 setHidden:0];

  id v19 = [(CNActionView *)self vibrantPlatterView];
  [v19 setHidden:1];
}

- (void)updateBackground
{
  v35[2] = *MEMORY[0x1E4F143B8];
  switch([(CNActionView *)self style])
  {
    case 6:
    case 11:
      [(CNActionView *)self updateBackgroundForVibrantRoundedRect];
      break;
    case 7:
      [(CNActionView *)self applyRoundedRectMargins];
      double v3 = [(CNActionView *)self layer];
      [v3 setCornerRadius:10.0];

      uint64_t v4 = *MEMORY[0x1E4F39EA8];
      double v5 = [(CNActionView *)self layer];
      [v5 setCornerCurve:v4];

      double v6 = [(CNActionView *)self layer];
      [v6 setBorderWidth:0.5];

      id v7 = +[CNUIColorRepository quickActionViewRoundedRectBorderColor];
      uint64_t v8 = [v7 CGColor];
      objc_super v9 = [(CNActionView *)self layer];
      [v9 setBorderColor:v8];

      id v10 = +[CNUIColorRepository quickActionViewRoundedRectBackgroundColor];
      [(CNActionView *)self setBackgroundColor:v10];
      goto LABEL_7;
    case 10:
      [(CNActionView *)self applyRoundedRectMargins];
      double v14 = [(CNActionView *)self colorMatrixView];

      if (!v14)
      {
        double v15 = (void *)[objc_alloc(MEMORY[0x1E4FB1F00]) initWithEffect:0];
        uint64_t v16 = [v15 layer];
        [v16 setCornerRadius:10.0];

        uint64_t v17 = *MEMORY[0x1E4F39EA8];
        double v18 = [v15 layer];
        [v18 setCornerCurve:v17];

        [v15 setClipsToBounds:1];
        [v15 setUserInteractionEnabled:0];
        [v15 _setGroupName:@"CNQuickActionsCaptureGroup"];
        id v19 = [(CNActionView *)self containerView];
        [(CNActionView *)self insertSubview:v15 belowSubview:v19];

        [(CNActionView *)self setColorMatrixView:v15];
      }
      v34[2] = xmmword_18B9C37C8;
      v34[3] = unk_18B9C37D8;
      v34[4] = xmmword_18B9C37E8;
      v34[0] = xmmword_18B9C37A8;
      v34[1] = unk_18B9C37B8;
      v20 = [MEMORY[0x1E4FB1620] _colorEffectCAMatrix:v34];
      double v21 = [MEMORY[0x1E4FB14C8] effectWithBlurRadius:30.0];
      v35[0] = v20;
      v35[1] = v21;
      uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];
      id v23 = [(CNActionView *)self colorMatrixView];
      [v23 setBackgroundEffects:v22];

      [(CNActionView *)self bounds];
      double v25 = v24;
      double v27 = v26;
      double v29 = v28;
      double v31 = v30;
      v32 = [(CNActionView *)self colorMatrixView];
      objc_msgSend(v32, "setFrame:", v25, v27, v29, v31);

      break;
    case 12:
      return;
    default:
      uint64_t v11 = [(CNActionView *)self containerView];
      [v11 setLayoutMarginsRelativeArrangement:0];

      [(CNActionView *)self setBackgroundColor:0];
      double v12 = [(CNActionView *)self layer];
      [v12 setCornerRadius:0.0];

      double v13 = [(CNActionView *)self layer];
      [v13 setBorderWidth:0.0];

      id v10 = [(CNActionView *)self layer];
      [v10 setBorderColor:0];
LABEL_7:

      id v33 = [(CNActionView *)self vibrantBackgroundView];
      [v33 setHidden:1];

      break;
  }
}

- (void)setVisualEffectViewCaptureView:(id)a3
{
  if (self->_visualEffectViewCaptureView != a3)
  {
    id v4 = a3;
    double v5 = [(CNActionView *)self colorMatrixView];
    [v5 _setCaptureView:v4];

    id v6 = [(CNActionView *)self colorMatrixView];
    [v6 _setGroupName:@"CNQuickActionsCaptureGroup"];
  }
}

- (void)setPosterTintColor:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (v4)
  {
    double v5 = (UIColor *)v4;
  }
  else
  {
    double v5 = +[CNUIColorRepository quickActionViewDefaultPosterTintColor];
  }
  id v6 = v5;
  if (self->_posterTintColor != v5)
  {
    objc_storeStrong((id *)&self->_posterTintColor, v5);
    if ([(CNActionView *)self style] == 10) {
      [(CNActionView *)self tlk_updateWithCurrentAppearance];
    }
  }
}

- (void)setStyle:(int64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    [(CNActionView *)self updatePlatterViewStateAnimated:0];
    [(CNActionView *)self updateTitleLabelFont];
    [(CNActionView *)self tlk_updateWithCurrentAppearance];
    [(CNActionView *)self updateImage];
    [(CNActionView *)self platterViewMinimumLayoutSizeForStyle:a3];
    double v6 = v5;
    double v8 = v7;
    objc_super v9 = [(CNActionView *)self platterView];
    objc_msgSend(v9, "setMinimumLayoutSize:", v6, v8);

    [(CNActionView *)self platterViewMinimumLayoutSizeForStyle:a3];
    double v11 = v10;
    double v13 = v12;
    double v14 = [(CNActionView *)self vibrantPlatterView];
    objc_msgSend(v14, "setMinimumLayoutSize:", v11, v13);

    double v15 = [(CNActionView *)self platterView];
    [v15 minimumLayoutSize];
    double v17 = v16;
    double v18 = [(CNActionView *)self platterView];
    [v18 minimumLayoutSize];
    double v20 = v19;
    double v21 = [(CNActionView *)self horizontalContentView];
    objc_msgSend(v21, "setFrame:", 0.0, 0.0, v17, v20);

    [(CNActionView *)self updateBackground];
  }
}

- (void)setHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v7.receiver = self;
  v7.super_class = (Class)CNActionView;
  -[CNActionView setHighlighted:](&v7, sel_setHighlighted_);
  if (![(CNActionView *)self disabled] || !a3)
  {
    [(CNActionView *)self updatePlatterViewStateAnimated:v4];
    [(CNActionView *)self updateImageViewStateAnimated:v4];
  }
}

- (void)setHighlighted:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CNActionView;
  [(CNActionView *)&v4 setHighlighted:a3];
  [(CNActionView *)self updatePlatterViewStateAnimated:0];
  [(CNActionView *)self updateImageViewStateAnimated:0];
  [(CNActionView *)self updateBackground];
}

- (void)setDisabled:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  if (self->_disabled != a3)
  {
    BOOL v6 = a4;
    self->_disabled = a3;
    [(CNActionView *)self setUserInteractionEnabled:!a3];
    [(CNActionView *)self setHighlighted:0 animated:v6];
    [(CNActionView *)self updatePlatterViewStateAnimated:v6];
    [(CNActionView *)self tlk_updateWithCurrentAppearance];
  }
  if (v4)
  {
    if (([(CNActionView *)self isContextMenuInteractionEnabled] & 1) == 0) {
      return;
    }
    BOOL v7 = 0;
  }
  else
  {
    BOOL v7 = [(CNActionView *)self shouldShowDisambiguation];
    if (v7 == [(CNActionView *)self isContextMenuInteractionEnabled]) {
      return;
    }
  }
  if ([(CNActionView *)self isContextMenuInteractionEnabled])
  {
    double v8 = [(CNActionView *)self contextMenuInteraction];
    [v8 dismissMenu];
  }

  [(CNActionView *)self setContextMenuInteractionEnabled:v7];
}

- (void)setDisabled:(BOOL)a3
{
}

- (void)setActionDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionDelegate);

  double v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_actionDelegate, obj);
    if ([(CNActionView *)self isContextMenuInteractionEnabled]) {
      BOOL v6 = [(CNActionView *)self shouldShowDisambiguation];
    }
    else {
      BOOL v6 = 0;
    }
    [(CNActionView *)self setContextMenuInteractionEnabled:v6];
    double v5 = obj;
  }
}

- (BOOL)shouldShowDisambiguation
{
  double v3 = [(CNActionView *)self actionDelegate];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 1;
  }
  double v5 = [(CNActionView *)self actionDelegate];
  char v6 = [v5 actionViewShouldPresentDisambiguationUI:self];

  return v6;
}

- (CNActionView)initWithFrame:(CGRect)a3
{
  v32[1] = *MEMORY[0x1E4F143B8];
  v30.receiver = self;
  v30.super_class = (Class)CNActionView;
  double v3 = -[CNActionView initWithFrame:](&v30, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  char v4 = v3;
  if (v3)
  {
    [(CNActionView *)v3 setContextMenuInteractionEnabled:1];
    uint64_t v5 = objc_opt_new();
    platterView = v4->_platterView;
    v4->_platterView = (UIView *)v5;

    uint64_t v7 = objc_opt_new();
    imageView = v4->_imageView;
    v4->_imageView = (UIImageView *)v7;

    [(UIImageView *)v4->_imageView setContentMode:4];
    LODWORD(v9) = 1148846080;
    [(UIImageView *)v4->_imageView setContentHuggingPriority:0 forAxis:v9];
    id v10 = objc_alloc(MEMORY[0x1E4F4BF00]);
    v32[0] = v4->_imageView;
    double v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
    uint64_t v12 = [v10 initWithArrangedSubviews:v11];
    horizontalContentView = v4->_horizontalContentView;
    v4->_horizontalContentView = (NUIContainerStackView *)v12;

    [(NUIContainerStackView *)v4->_horizontalContentView setAlignment:3];
    [(NUIContainerStackView *)v4->_horizontalContentView setSpacing:4.0];
    [(NUIContainerStackView *)v4->_horizontalContentView setLayoutMarginsRelativeArrangement:1];
    -[NUIContainerStackView setLayoutMargins:](v4->_horizontalContentView, "setLayoutMargins:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
    [(NUIContainerStackView *)v4->_horizontalContentView setInsetsLayoutMarginsFromSafeArea:0];
    [(CNActionView *)v4 updatePlatterViewStateAnimated:0];
    [(CNActionView *)v4 updateImageViewStateAnimated:0];
    LODWORD(v10) = objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory");
    id v14 = objc_alloc(MEMORY[0x1E4F4BF00]);
    [(CNActionView *)v4 bounds];
    uint64_t v15 = objc_msgSend(v14, "initWithFrame:");
    containerView = v4->_containerView;
    v4->_containerView = (NUIContainerStackView *)v15;

    [(NUIContainerStackView *)v4->_containerView setUserInteractionEnabled:0];
    [(NUIContainerStackView *)v4->_containerView setAutoresizingMask:18];
    [(NUIContainerStackView *)v4->_containerView setAlignment:3];
    [(NUIContainerStackView *)v4->_containerView setAxis:v10 ^ 1];
    double v17 = 2.0;
    if (v10) {
      double v17 = 12.0;
    }
    [(NUIContainerStackView *)v4->_containerView setSpacing:v17];
    [(NUIContainerStackView *)v4->_containerView setInvalidatingIntrinsicContentSizeAlsoInvalidatesSuperview:1];
    [(NUIContainerStackView *)v4->_containerView setInsetsLayoutMarginsFromSafeArea:0];
    id v18 = objc_alloc(MEMORY[0x1E4F4BEE8]);
    v31[0] = v4->_platterView;
    v31[1] = v4->_horizontalContentView;
    double v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
    uint64_t v20 = [v18 initWithArrangedSubviews:v19];
    platterBoxView = v4->_platterBoxView;
    v4->_platterBoxView = (NUIContainerBoxView *)v20;

    [(NUIContainerBoxView *)v4->_platterBoxView setDelegate:v4];
    [(NUIContainerBoxView *)v4->_platterBoxView setAlignment:3 forView:v4->_horizontalContentView inAxis:1];
    [(NUIContainerBoxView *)v4->_platterBoxView setAlignment:3 forView:v4->_horizontalContentView inAxis:0];
    LODWORD(v22) = 1148846080;
    [(NUIContainerBoxView *)v4->_platterBoxView setContentHuggingPriority:0 forAxis:v22];
    LODWORD(v23) = 1148846080;
    [(NUIContainerBoxView *)v4->_platterBoxView setContentCompressionResistancePriority:0 forAxis:v23];
    LODWORD(v24) = 1148846080;
    [(NUIContainerBoxView *)v4->_platterBoxView setContentCompressionResistancePriority:1 forAxis:v24];
    [(NUIContainerStackView *)v4->_containerView addArrangedSubview:v4->_platterBoxView];
    [(CNActionView *)v4 addSubview:v4->_containerView];
    [(CNActionView *)v4 addTarget:v4 action:sel_handleTapGesture forControlEvents:64];
    double v25 = objc_alloc_init(CNActionMenuHelper);
    actionMenuHelper = v4->_actionMenuHelper;
    v4->_actionMenuHelper = v25;

    uint64_t v27 = +[CNUIColorRepository quickActionViewDefaultPosterTintColor];
    posterTintColor = v4->_posterTintColor;
    v4->_posterTintColor = (UIColor *)v27;
  }
  return v4;
}

- (CNActionView)init
{
  return -[CNActionView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

- (id)colorByAdjustingColorToHighlightState:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(CNActionView *)self style];
  if ([(CNActionView *)self isHighlighted])
  {
    if (v5 == 1) {
      double v6 = -0.100000001;
    }
    else {
      double v6 = 0.0;
    }
    id v7 = [(id)objc_opt_class() colorByIncreasingBrightnessComponentByPercentage:v4 ofColor:v6];
  }
  else
  {
    id v7 = v4;
  }
  double v8 = v7;

  return v8;
}

+ (CGSize)minimumSizeForStyle:(int64_t)a3
{
  double v3 = *MEMORY[0x1E4F4BEC8];
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 8)
  {
    [a1 minimumPillDimension];
    double v5 = v4;
  }
  else
  {
    double v5 = 37.0;
  }
  double v6 = v3;
  result.double height = v5;
  result.double width = v6;
  return result;
}

+ (id)titleFontForStyle:(int64_t)a3
{
  if ((unint64_t)(a3 - 8) > 3) {
    double v3 = (id *)MEMORY[0x1E4FB28E0];
  }
  else {
    double v3 = (id *)qword_1E5497B68[a3 - 8];
  }
  id v4 = *v3;
  double v5 = (void *)MEMORY[0x1E4FB08E0];
  double v6 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:v4];
  id v7 = [v5 fontWithDescriptor:v6 size:0.0];

  return v7;
}

+ (UIFont)defaultTitleFont
{
  return (UIFont *)[a1 titleFontForStyle:1];
}

+ (double)minimumPillDimension
{
  id v2 = [(id)objc_opt_class() titleFontForStyle:8];
  [v2 _scaledValueForValue:31.0];
  double v4 = v3;

  if (v4 >= 31.0) {
    return v4;
  }
  else {
    return 31.0;
  }
}

+ (void)fadeInView:(id)a3
{
  double v3 = (void *)MEMORY[0x1E4F39D18];
  id v4 = a3;
  id v6 = [v3 animation];
  [v6 setDuration:0.2];
  double v5 = [v4 layer];

  [v5 addAnimation:v6 forKey:0];
}

+ (id)colorByIncreasingBrightnessComponentByPercentage:(double)a3 ofColor:(id)a4
{
  id v5 = a4;
  if (v5)
  {
    id v6 = [MEMORY[0x1E4FB1618] clearColor];
    int v7 = [v5 isEqual:v6];

    if (v7
      || (a3 >= -1.0 ? (BOOL v8 = a3 > 1.0) : (BOOL v8 = 1),
          v8
       || (double v14 = 0.0,
           double v15 = 0.0,
           double v12 = 0.0,
           double v13 = 0.0,
           ([v5 getHue:&v15 saturation:&v14 brightness:&v13 alpha:&v12] & 1) == 0)))
    {
      id v9 = v5;
    }
    else
    {
      double v13 = fmin((a3 + 1.0) * v13, 1.0);
      if (v12 < 0.1) {
        double v12 = v12 + 0.100000001;
      }
      id v9 = [MEMORY[0x1E4FB1618] colorWithHue:v15 saturation:v14 brightness:*(void *)&v12 alpha:*(void *)&v13];
    }
    id v10 = v9;
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

+ (id)contentColorForDisabledVibrantDarkState
{
  return +[CNUIColorRepository quickActionContentColorDisabledVibrant];
}

+ (id)contentColorForDisabledBoldState
{
  return +[CNUIColorRepository quickActionContentColorDisabled];
}

+ (id)borderColorForDisabledBoldState
{
  return +[CNUIColorRepository quickActionBorderColorDisabled];
}

@end