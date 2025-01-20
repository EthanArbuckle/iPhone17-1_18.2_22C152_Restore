@interface CNContactHeaderCollapsedView
+ (id)collapsedContactHeaderViewWithContact:(id)a3 showingNavBar:(BOOL)a4 monogramOnly:(BOOL)a5 delegate:(id)a6;
+ (id)makePhotoViewWithShouldAllowTakePhotoAction:(BOOL)a3 shouldAllowImageDrops:(BOOL)a4 monogramOnly:(BOOL)a5;
+ (id)sizeAttributesShowingNavBar:(BOOL)a3;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)usesBrandedCallFormat;
- (CAGradientLayer)backgroundGradientLayer;
- (CNContactActionsContainerView)actionsWrapperView;
- (CNContactFormatter)contactFormatter;
- (CNContactHeaderCollapsedView)initWithContact:(id)a3 frame:(CGRect)a4 showingNavBar:(BOOL)a5 monogramOnly:(BOOL)a6 delegate:(id)a7;
- (NSString)alternateName;
- (UIView)gradientLayerContainerView;
- (double)height;
- (double)labelsHeight;
- (id)_headerStringForContacts:(id)a3;
- (unint64_t)avatarStyle;
- (void)_updatePhotoView;
- (void)assignImageColorsToAvatarBackgroundView:(id)a3 horizontal:(BOOL)a4;
- (void)calculateLabelSizes;
- (void)calculateLabelSizesIfNeeded;
- (void)copy:(id)a3;
- (void)didFinishUsing;
- (void)disablePhotoTapGesture;
- (void)layoutSubviews;
- (void)reloadDataPreservingChanges:(BOOL)a3;
- (void)setActionsWrapperView:(id)a3;
- (void)setAlternateName:(id)a3;
- (void)setAvatarStyle:(unint64_t)a3;
- (void)setBackgroundGradientLayer:(id)a3;
- (void)setContactFormatter:(id)a3;
- (void)setDefaultLabelColors;
- (void)setGradientLayerContainerView:(id)a3;
- (void)setLabelsHeight:(double)a3;
- (void)setNameTextAttributes:(id)a3;
- (void)setUpNameLabel;
- (void)setUsesBrandedCallFormat:(BOOL)a3;
- (void)setupBackgroundGradientLayer;
- (void)showLabelAndAvatar:(BOOL)a3 animated:(BOOL)a4;
- (void)updateBackgroundWithGradientColors:(id)a3 horizontal:(BOOL)a4;
- (void)updateBackgroundWithPosterSnapshotImage:(id)a3;
- (void)updateConstraints;
- (void)updateFontSizes;
- (void)updateLabelColorsForImageColors:(id)a3;
- (void)updateSizeDependentAttributes;
@end

@implementation CNContactHeaderCollapsedView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundGradientLayer, 0);
  objc_storeStrong((id *)&self->_gradientLayerContainerView, 0);
  objc_storeStrong((id *)&self->_actionsWrapperView, 0);
  objc_storeStrong((id *)&self->_alternateName, 0);

  objc_storeStrong((id *)&self->_contactFormatter, 0);
}

- (void)setLabelsHeight:(double)a3
{
  self->_labelsHeight = a3;
}

- (double)labelsHeight
{
  return self->_labelsHeight;
}

- (void)setBackgroundGradientLayer:(id)a3
{
}

- (CAGradientLayer)backgroundGradientLayer
{
  return self->_backgroundGradientLayer;
}

- (void)setGradientLayerContainerView:(id)a3
{
}

- (UIView)gradientLayerContainerView
{
  return self->_gradientLayerContainerView;
}

- (CNContactActionsContainerView)actionsWrapperView
{
  return self->_actionsWrapperView;
}

- (void)setUsesBrandedCallFormat:(BOOL)a3
{
  self->_usesBrandedCallFormat = a3;
}

- (BOOL)usesBrandedCallFormat
{
  return self->_usesBrandedCallFormat;
}

- (void)setAlternateName:(id)a3
{
}

- (NSString)alternateName
{
  return self->_alternateName;
}

- (void)setContactFormatter:(id)a3
{
}

- (CNContactFormatter)contactFormatter
{
  return self->_contactFormatter;
}

- (id)_headerStringForContacts:(id)a3
{
  id v4 = a3;
  if ([v4 count] == 1)
  {
    if ([(CNContactHeaderCollapsedView *)self usesBrandedCallFormat])
    {
      uint64_t v5 = *MEMORY[0x1E4F5A258];
      v6 = [v4 firstObject];
      v7 = [v6 phoneNumbers];
      LOBYTE(v5) = (*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v7);

      if ((v5 & 1) == 0)
      {
        v8 = [v4 firstObject];
        v9 = [v8 phoneNumbers];
        v10 = [v9 firstObject];

        v11 = [v10 value];
        v12 = [v11 formattedStringValue];

        if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A2A0] + 16))())
        {
          id v13 = v12;

          goto LABEL_12;
        }
      }
    }
    v15 = [(CNContactHeaderCollapsedView *)self contactFormatter];
    v16 = [v4 firstObject];
    v14 = [v15 stringFromContact:v16];
  }
  else
  {
    v14 = 0;
  }
  if (![v14 length])
  {
    uint64_t v17 = [(CNContactHeaderCollapsedView *)self alternateName];

    v14 = (void *)v17;
  }
  id v13 = v14;
LABEL_12:

  return v13;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  return sel_copy_ == a3;
}

- (void)copy:(id)a3
{
  v3 = [(CNContactHeaderView *)self nameLabel];
  id v4 = [v3 text];
  id v6 = (id)[v4 mutableCopy];

  uint64_t v5 = [MEMORY[0x1E4FB1A78] generalPasteboard];
  [v5 setString:v6];
}

- (void)reloadDataPreservingChanges:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CNContactHeaderCollapsedView;
  [(CNContactHeaderView *)&v9 reloadDataPreservingChanges:a3];
  id v4 = [(CNContactHeaderView *)self contacts];
  uint64_t v5 = [(CNContactHeaderCollapsedView *)self _headerStringForContacts:v4];

  if (v5)
  {
    id v6 = [(CNContactHeaderView *)self nameLabel];
    v7 = [v6 text];

    if (!v7) {
      [(CNContactHeaderCollapsedView *)self setNeedsUpdateConstraints];
    }
  }
  v8 = [(CNContactHeaderView *)self nameLabel];
  objc_msgSend(v8, "setAb_text:", v5);

  [(CNContactHeaderCollapsedView *)self _updatePhotoView];
  [(CNContactHeaderView *)self setNeedsLabelSizeCalculation:1];
  [(CNContactHeaderCollapsedView *)self calculateLabelSizes];
  [(CNContactHeaderCollapsedView *)self setNeedsLayout];
}

- (void)_updatePhotoView
{
  id v8 = [(CNContactHeaderView *)self photoView];
  int v3 = [v8 isHidden];
  id v4 = [(CNContactHeaderView *)self contacts];
  if ((unint64_t)[v4 count] > 1)
  {
    [v8 setHidden:0];
  }
  else
  {
    uint64_t v5 = [(CNContactHeaderView *)self contacts];
    id v6 = [v5 firstObject];
    if ([v6 imageDataAvailable]) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = [(CNContactHeaderView *)self alwaysShowsMonogram] ^ 1;
    }
    [v8 setHidden:v7];
  }
  if (v3 != [v8 isHidden]) {
    [(CNContactHeaderCollapsedView *)self setNeedsUpdateConstraints];
  }
}

- (void)setNameTextAttributes:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CNContactHeaderCollapsedView;
  id v4 = a3;
  [(CNContactHeaderView *)&v6 setNameTextAttributes:v4];
  uint64_t v5 = [(CNContactHeaderView *)self nameLabel];
  objc_msgSend(v5, "setAb_textAttributes:", v4);
}

- (void)updateSizeDependentAttributes
{
  [(CNContactHeaderCollapsedView *)self bounds];
  if (v3 > 0.0)
  {
    double v4 = 0.0;
    if ([(CNContactHeaderView *)self shouldShowBelowNavigationTitle])
    {
      uint64_t v5 = [(CNContactHeaderView *)self sizeAttributes];
      [v5 minNavbarTitleOffset];
      double v4 = v6;
    }
    [(CNContactHeaderView *)self safeAreaPhotoOffset];
    double v8 = v4 + v7;
    id v12 = [(CNContactHeaderView *)self sizeAttributes];
    [v12 photoMinTopMargin];
    double v10 = v8 + v9;
    v11 = [(CNContactHeaderView *)self photoTopConstraint];
    [v11 setConstant:v10];
  }
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)CNContactHeaderCollapsedView;
  [(CNContactHeaderView *)&v12 layoutSubviews];
  [(CNContactHeaderCollapsedView *)self calculateLabelSizes];
  [(CNContactHeaderCollapsedView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(CNContactHeaderCollapsedView *)self backgroundGradientLayer];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
}

- (void)calculateLabelSizes
{
  if ([(CNContactHeaderView *)self needsLabelSizeCalculation])
  {
    [(CNContactHeaderCollapsedView *)self frame];
    double v4 = v3;
    if (v3 == 0.0)
    {
      double v5 = [(CNContactHeaderCollapsedView *)self superview];

      if (v5)
      {
        double v6 = [(CNContactHeaderCollapsedView *)self superview];
        [v6 frame];
        double v4 = v7;
      }
    }
    if (v4 != 0.0)
    {
      [(CNContactHeaderView *)self setNeedsLabelSizeCalculation:0];
      [(CNContactHeaderCollapsedView *)self layoutMargins];
      double v9 = v8;
      [(CNContactHeaderCollapsedView *)self layoutMargins];
      double v11 = v4 - (v9 + v10);
      [(CNContactHeaderCollapsedView *)self updateFontSizes];
      objc_super v12 = [(CNContactHeaderView *)self nameLabel];
      objc_msgSend(v12, "sizeThatFits:", v11, 1000.0);
      double v14 = v13;

      v15 = [(CNContactHeaderCollapsedView *)self _screen];
      [v15 scale];
      if (v16 == 0.0)
      {
        if (RoundToScale_onceToken != -1) {
          dispatch_once(&RoundToScale_onceToken, &__block_literal_global_33);
        }
        double v16 = *(double *)&RoundToScale___s;
      }
      BOOL v17 = v16 == 1.0;
      double v18 = round(v16 * v14) / v16;
      double v19 = round(v14);
      if (v17) {
        double v20 = v19;
      }
      else {
        double v20 = v18;
      }

      [(CNContactHeaderCollapsedView *)self setLabelsHeight:v20];
      id v21 = [(CNContactHeaderView *)self delegate];
      [v21 headerViewDidUpdateLabelSizes];
    }
  }
}

- (void)calculateLabelSizesIfNeeded
{
  v3.receiver = self;
  v3.super_class = (Class)CNContactHeaderCollapsedView;
  [(CNContactHeaderView *)&v3 calculateLabelSizesIfNeeded];
  [(CNContactHeaderCollapsedView *)self calculateLabelSizes];
}

- (void)disablePhotoTapGesture
{
  id v2 = [(CNContactHeaderView *)self photoView];
  [v2 disablePhotoTapGesture];
}

- (void)showLabelAndAvatar:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__CNContactHeaderCollapsedView_showLabelAndAvatar_animated___block_invoke;
  aBlock[3] = &unk_1E5499510;
  BOOL v11 = a3;
  aBlock[4] = self;
  double v5 = (void (**)(void))_Block_copy(aBlock);
  double v6 = v5;
  if (v4)
  {
    double v7 = (void *)MEMORY[0x1E4FB1EB0];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __60__CNContactHeaderCollapsedView_showLabelAndAvatar_animated___block_invoke_2;
    v8[3] = &unk_1E549B8A0;
    double v9 = v5;
    [v7 animateWithDuration:v8 animations:0.3];
  }
  else
  {
    v5[2](v5);
  }
}

void __60__CNContactHeaderCollapsedView_showLabelAndAvatar_animated___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    double v2 = 1.0;
  }
  else {
    double v2 = 0.0;
  }
  objc_super v3 = [*(id *)(a1 + 32) photoView];
  [v3 setAlpha:v2];

  id v4 = [*(id *)(a1 + 32) nameLabel];
  [v4 setAlpha:v2];
}

uint64_t __60__CNContactHeaderCollapsedView_showLabelAndAvatar_animated___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updateFontSizes
{
  v14[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2988]];
  id v4 = (void *)sCurrentNameFont;
  sCurrentNameFont = v3;

  uint64_t v5 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2948]];
  double v6 = (void *)sCurrentTaglineFont;
  sCurrentTaglineFont = v5;

  uint64_t v13 = *MEMORY[0x1E4FB06F8];
  double v7 = (void *)sCurrentNameFont;
  [(id)sCurrentNameFont _scaledValueForValue:16.0];
  double v8 = objc_msgSend(v7, "fontWithSize:");
  v14[0] = v8;
  double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  [self cn_updateDictionaryForKey:@"nameTextAttributes" withChanges:v9];

  LODWORD(v8) = [(CNContactHeaderView *)self isAXSize];
  double v10 = [(CNContactHeaderView *)self nameLabel];
  [v10 setAdjustsFontSizeToFitWidth:v8 ^ 1];

  if (v8) {
    double v11 = 0.0;
  }
  else {
    double v11 = 0.7;
  }
  objc_super v12 = [(CNContactHeaderView *)self nameLabel];
  [v12 setMinimumScaleFactor:v11];
}

- (unint64_t)avatarStyle
{
  double v2 = [(CNContactHeaderView *)self photoView];
  uint64_t v3 = [v2 avatarView];
  unint64_t v4 = [v3 style];

  return v4;
}

- (void)setAvatarStyle:(unint64_t)a3
{
  id v5 = [(CNContactHeaderView *)self photoView];
  unint64_t v4 = [v5 avatarView];
  [v4 setStyle:a3];
}

- (void)setActionsWrapperView:(id)a3
{
  id v5 = (CNContactActionsContainerView *)a3;
  if (self->_actionsWrapperView != v5)
  {
    objc_storeStrong((id *)&self->_actionsWrapperView, a3);
    [(CNContactHeaderCollapsedView *)self addSubview:v5];
    [(CNContactHeaderCollapsedView *)self setNeedsUpdateConstraints];
  }
}

- (void)updateConstraints
{
  v51.receiver = self;
  v51.super_class = (Class)CNContactHeaderCollapsedView;
  [(CNContactHeaderView *)&v51 updateConstraints];
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA48];
  unint64_t v4 = [(CNContactHeaderView *)self activatedConstraints];
  id v5 = [v3 arrayWithArray:v4];

  double v6 = [(CNContactHeaderView *)self photoView];
  double v7 = [v6 centerXAnchor];
  double v8 = [(CNContactHeaderCollapsedView *)self centerXAnchor];
  double v9 = [v7 constraintEqualToAnchor:v8];
  [v5 addObject:v9];

  double v10 = [(CNContactHeaderView *)self nameLabel];
  double v11 = [v10 topAnchor];
  objc_super v12 = [(CNContactHeaderView *)self photoView];
  uint64_t v13 = [v12 bottomAnchor];
  double v14 = [(CNContactHeaderView *)self sizeAttributes];
  [v14 photoMinBottomMargin];
  v15 = objc_msgSend(v11, "constraintEqualToAnchor:constant:", v13);
  [v5 addObject:v15];

  uint64_t v45 = MEMORY[0x1E4F143A8];
  uint64_t v46 = 3221225472;
  v47 = __49__CNContactHeaderCollapsedView_updateConstraints__block_invoke;
  v48 = &unk_1E54974A0;
  id v16 = v5;
  id v49 = v16;
  v50 = self;
  BOOL v17 = (void (**)(void *, void *))_Block_copy(&v45);
  double v18 = [(CNContactHeaderView *)self nameLabel];
  v17[2](v17, v18);

  double v19 = [(CNContactHeaderCollapsedView *)self actionsWrapperView];

  if (v19)
  {
    double v20 = [(CNContactHeaderCollapsedView *)self leadingAnchor];
    id v21 = [(CNContactHeaderCollapsedView *)self actionsWrapperView];
    v22 = [v21 leadingAnchor];
    v23 = [v20 constraintEqualToAnchor:v22];
    [v16 addObject:v23];

    v24 = [(CNContactHeaderCollapsedView *)self trailingAnchor];
    v25 = [(CNContactHeaderCollapsedView *)self actionsWrapperView];
    v26 = [v25 trailingAnchor];
    v27 = [v24 constraintEqualToAnchor:v26];
    [v16 addObject:v27];

    v28 = [(CNContactHeaderCollapsedView *)self bottomAnchor];
    v29 = [(CNContactHeaderCollapsedView *)self actionsWrapperView];
    v30 = [v29 bottomAnchor];
    v31 = [v28 constraintEqualToAnchor:v30];
    [v16 addObject:v31];

    v32 = [(CNContactHeaderCollapsedView *)self actionsWrapperView];
    v33 = [v32 topAnchor];
    v34 = [(CNContactHeaderView *)self nameLabel];
    v35 = [v34 bottomAnchor];
    v36 = [v33 constraintEqualToAnchor:v35];
    [v16 addObject:v36];

    v37 = [(CNContactHeaderCollapsedView *)self actionsWrapperView];
    LODWORD(v38) = 1148846080;
    [v37 setContentHuggingPriority:1 forAxis:v38];

    v39 = [(CNContactHeaderCollapsedView *)self actionsWrapperView];
    LODWORD(v40) = 1148846080;
    [v39 setContentCompressionResistancePriority:1 forAxis:v40];
  }
  else
  {
    v39 = [(CNContactHeaderCollapsedView *)self bottomAnchor];
    v41 = [(CNContactHeaderView *)self nameLabel];
    v42 = [v41 bottomAnchor];
    v43 = [(CNContactHeaderView *)self sizeAttributes];
    [v43 headerBottomMargin];
    v44 = objc_msgSend(v39, "constraintEqualToAnchor:constant:", v42);
    [v16 addObject:v44];
  }
  [MEMORY[0x1E4F28DC8] activateConstraints:v16];
  [(CNContactHeaderView *)self setActivatedConstraints:v16];
}

void __49__CNContactHeaderCollapsedView_updateConstraints__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v4 centerXAnchor];
  double v6 = [*(id *)(a1 + 40) centerXAnchor];
  double v7 = [v5 constraintEqualToAnchor:v6];
  [v3 addObject:v7];

  double v8 = [v4 leadingAnchor];
  double v9 = [*(id *)(a1 + 40) layoutMarginsGuide];
  double v10 = [v9 leadingAnchor];
  id v18 = [v8 constraintEqualToAnchor:v10];

  LODWORD(v11) = 1148829696;
  [v18 setPriority:v11];
  [*(id *)(a1 + 32) addObject:v18];
  objc_super v12 = [v4 trailingAnchor];
  uint64_t v13 = [*(id *)(a1 + 40) layoutMarginsGuide];
  double v14 = [v13 trailingAnchor];
  v15 = [v12 constraintEqualToAnchor:v14];

  LODWORD(v16) = 1148829696;
  [v15 setPriority:v16];
  [*(id *)(a1 + 32) addObject:v15];
  LODWORD(v17) = 1148846080;
  [v4 setContentHuggingPriority:0 forAxis:v17];
}

- (double)height
{
  uint64_t v3 = [(CNContactHeaderCollapsedView *)self actionsWrapperView];
  double v4 = 0.0;
  double v5 = 0.0;
  if (v3)
  {
    double v6 = [(CNContactHeaderCollapsedView *)self actionsWrapperView];
    [v6 frame];
    double v5 = v7;
  }
  double v8 = [(CNContactHeaderCollapsedView *)self actionsWrapperView];
  if (!v8)
  {
    double v9 = [(CNContactHeaderView *)self sizeAttributes];
    [v9 headerBottomMargin];
    double v4 = v10;
  }
  v15.receiver = self;
  v15.super_class = (Class)CNContactHeaderCollapsedView;
  [(CNContactHeaderView *)&v15 minHeight];
  double v12 = v11;
  [(CNContactHeaderCollapsedView *)self labelsHeight];
  return v4 + v5 + v12 + v13;
}

- (void)didFinishUsing
{
  if ((CNContactHeaderCollapsedView *)sCollapsedContactHeaderView == self)
  {
    sCollapsedContactHeaderView = 0;
  }
}

- (void)setUpNameLabel
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1930]);
  double v4 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(CNContactHeaderView *)self setNameLabel:v4];

  double v5 = [(CNContactHeaderView *)self nameLabel];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  double v6 = [(CNContactHeaderView *)self nameLabel];
  [v6 setTextAlignment:1];

  double v7 = [(CNContactHeaderView *)self nameLabel];
  [v7 setNumberOfLines:2];

  double v8 = [(CNContactHeaderView *)self nameLabel];
  objc_msgSend(v8, "_cnui_applyContactStyle");

  id v9 = [(CNContactHeaderView *)self nameLabel];
  [(CNContactHeaderCollapsedView *)self addSubview:v9];
}

- (void)updateLabelColorsForImageColors:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (+[CNImageDerivedColorBackgroundUtilities backgroundColorsPreferWhiteForegroundText:a3])
  {
    +[CNUIColorRepository contactCardStaticAvatarHeaderDefaultTextColor];
  }
  else
  {
    +[CNUIColorRepository contactCardStaticAvatarHeaderDefaultDarkTextColor];
  double v4 = };
  uint64_t v9 = *MEMORY[0x1E4FB0700];
  v10[0] = v4;
  double v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  [self cn_updateDictionaryForKey:@"nameTextAttributes" withChanges:v5];

  double v6 = [(CNContactHeaderView *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    double v8 = [(CNContactHeaderView *)self delegate];
    [v8 headerView:self didSetNameLabelColor:v4];
  }
}

- (void)updateBackgroundWithGradientColors:(id)a3 horizontal:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(CNContactHeaderCollapsedView *)self assignImageColorsToAvatarBackgroundView:v6 horizontal:v4];
  [(CNContactHeaderCollapsedView *)self updateLabelColorsForImageColors:v6];
}

- (void)updateBackgroundWithPosterSnapshotImage:(id)a3
{
  id v4 = a3;
  double v5 = [(CNContactHeaderView *)self contacts];
  id v6 = [v5 firstObject];
  char v7 = [v6 backgroundColors];
  double v8 = [v7 contactPoster];

  if ((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A258] + 16))())
  {
    uint64_t v9 = (CGImage *)objc_msgSend(v4, "cnui_CGImageSnapshot");
    CGFloat Width = (double)CGImageGetWidth(v9);
    CGFloat v11 = (double)CGImageGetHeight(v9) * 0.5;
    v23.origin.x = 0.0;
    v23.origin.y = 0.0;
    v23.size.width = Width;
    v23.size.height = v11;
    double v12 = CGImageCreateWithImageInRect(v9, v23);
    CGImageGetBitsPerComponent(v9);
    MmappedBitmapContext = (CGContext *)CNImageUtilsCreateMmappedBitmapContext();
    v24.origin.x = 0.0;
    v24.origin.y = 0.0;
    v24.size.width = Width;
    v24.size.height = v11;
    CGContextDrawImage(MmappedBitmapContext, v24, v12);
    double v14 = (void *)[objc_alloc(MEMORY[0x1E4F1BA10]) initWithBitmapContext:MmappedBitmapContext];
    Data = CGBitmapContextGetData(MmappedBitmapContext);
    size_t BytesPerRow = CGBitmapContextGetBytesPerRow(MmappedBitmapContext);
    size_t v17 = CGBitmapContextGetHeight(MmappedBitmapContext) * BytesPerRow;
    id v18 = dispatch_get_global_queue(0, 0);
    dispatch_data_t v19 = dispatch_data_create(Data, v17, v18, (dispatch_block_t)*MEMORY[0x1E4F143F8]);

    double v20 = [(CNContactHeaderView *)self contacts];
    id v21 = [v20 firstObject];

    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __72__CNContactHeaderCollapsedView_updateBackgroundWithPosterSnapshotImage___block_invoke;
    v22[3] = &unk_1E5499068;
    v22[4] = self;
    [(CNContactHeaderView *)self fetchColorsForContactImageData:v19 bitmapFormat:v14 isPoster:1 forContact:v21 cacheResult:1 withCompletionHandler:v22];
    if (MmappedBitmapContext) {
      CFRelease(MmappedBitmapContext);
    }
    CGImageRelease(v12);
  }
  else
  {
    [(CNContactHeaderCollapsedView *)self assignImageColorsToAvatarBackgroundView:v8 horizontal:0];
    [(CNContactHeaderCollapsedView *)self updateLabelColorsForImageColors:v8];
  }
}

void __72__CNContactHeaderCollapsedView_updateBackgroundWithPosterSnapshotImage___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A258] + 16))())
  {
    double v5 = CNUILogContactCard();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v6 = 0;
      _os_log_error_impl(&dword_18B625000, v5, OS_LOG_TYPE_ERROR, "No background colors returned for collapsed header view", v6, 2u);
    }

    id v4 = [*(id *)(a1 + 32) backgroundGradientDefaultGrayColors];
  }
  [*(id *)(a1 + 32) assignImageColorsToAvatarBackgroundView:v3 horizontal:0];
  [*(id *)(a1 + 32) updateLabelColorsForImageColors:v3];
}

- (void)assignImageColorsToAvatarBackgroundView:(id)a3 horizontal:(BOOL)a4
{
  BOOL v4 = a4;
  id v25 = a3;
  if ([v25 count] == 1)
  {
    id v6 = [v25 firstObject];
    [(CNContactHeaderCollapsedView *)self setBackgroundColor:v6];

    char v7 = [(CNContactHeaderCollapsedView *)self backgroundGradientLayer];
    [v7 setColors:0];
  }
  else
  {
    [(CNContactHeaderCollapsedView *)self setBackgroundColor:0];
    [(CNContactHeaderCollapsedView *)self bounds];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v16 = [(CNContactHeaderCollapsedView *)self backgroundGradientLayer];
    objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);

    size_t v17 = objc_msgSend(v25, "_cn_map:", &__block_literal_global_794);
    id v18 = objc_msgSend(v17, "_cn_reversed");
    dispatch_data_t v19 = [(CNContactHeaderCollapsedView *)self backgroundGradientLayer];
    [v19 setColors:v18];

    double v20 = [(CNContactHeaderCollapsedView *)self backgroundGradientLayer];
    id v21 = v20;
    if (v4)
    {
      objc_msgSend(v20, "setStartPoint:", 0.0, 0.5);

      v22 = [(CNContactHeaderCollapsedView *)self backgroundGradientLayer];
      char v7 = v22;
      double v23 = 1.0;
      double v24 = 0.5;
    }
    else
    {
      objc_msgSend(v20, "setStartPoint:", 0.5, 0.0);

      v22 = [(CNContactHeaderCollapsedView *)self backgroundGradientLayer];
      char v7 = v22;
      double v23 = 0.5;
      double v24 = 1.0;
    }
    objc_msgSend(v22, "setEndPoint:", v23, v24);
  }
}

uint64_t __83__CNContactHeaderCollapsedView_assignImageColorsToAvatarBackgroundView_horizontal___block_invoke(int a1, id a2)
{
  id v2 = a2;

  return [v2 CGColor];
}

- (void)setupBackgroundGradientLayer
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  BOOL v4 = (UIView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  gradientLayerContainerView = self->_gradientLayerContainerView;
  self->_gradientLayerContainerView = v4;

  [(UIView *)self->_gradientLayerContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CNContactHeaderCollapsedView *)self insertSubview:self->_gradientLayerContainerView atIndex:0];
  id v8 = [MEMORY[0x1E4F39BD0] layer];
  id v6 = [(UIView *)self->_gradientLayerContainerView layer];
  [v6 addSublayer:v8];

  [(CNContactHeaderCollapsedView *)self setBackgroundGradientLayer:v8];
  char v7 = [(CNContactHeaderView *)self backgroundGradientDefaultGrayColors];
  [(CNContactHeaderCollapsedView *)self assignImageColorsToAvatarBackgroundView:v7 horizontal:0];
  [(CNContactHeaderCollapsedView *)self updateLabelColorsForImageColors:v7];
}

- (void)setDefaultLabelColors
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v3 = +[CNUIColorRepository contactCardStaticAvatarHeaderDefaultTextColor];
  uint64_t v5 = *MEMORY[0x1E4FB0700];
  v6[0] = v3;
  BOOL v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  [self cn_updateDictionaryForKey:@"nameTextAttributes" withChanges:v4];
}

- (CNContactHeaderCollapsedView)initWithContact:(id)a3 frame:(CGRect)a4 showingNavBar:(BOOL)a5 monogramOnly:(BOOL)a6 delegate:(id)a7
{
  v11.receiver = self;
  v11.super_class = (Class)CNContactHeaderCollapsedView;
  char v7 = -[CNContactHeaderView initWithContact:frame:shouldAllowTakePhotoAction:shouldAllowImageDrops:showingNavBar:monogramOnly:delegate:](&v11, sel_initWithContact_frame_shouldAllowTakePhotoAction_shouldAllowImageDrops_showingNavBar_monogramOnly_delegate_, a3, 0, 0, a5, a6, a7, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  id v8 = v7;
  if (v7)
  {
    [(CNContactHeaderCollapsedView *)v7 setUpNameLabel];
    [(CNContactHeaderCollapsedView *)v8 updateFontSizes];
    [(CNContactHeaderCollapsedView *)v8 setupBackgroundGradientLayer];
    [(CNContactHeaderCollapsedView *)v8 setDefaultLabelColors];
    double v9 = v8;
  }

  return v8;
}

+ (id)collapsedContactHeaderViewWithContact:(id)a3 showingNavBar:(BOOL)a4 monogramOnly:(BOOL)a5 delegate:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a6;
  double v12 = [(id)sCollapsedContactHeaderView delegate];
  if (v12)
  {

LABEL_4:
    id v13 = objc_alloc((Class)a1);
    id v14 = (id)objc_msgSend(v13, "initWithContact:frame:showingNavBar:monogramOnly:delegate:", v10, v8, v7, v11, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
LABEL_5:
    id v15 = v14;
    goto LABEL_6;
  }
  if ([(id)sCollapsedContactHeaderView showMonogramsOnly] != v7) {
    goto LABEL_4;
  }
  if (!sCollapsedContactHeaderView)
  {
    id v17 = objc_alloc((Class)a1);
    uint64_t v18 = objc_msgSend(v17, "initWithContact:frame:showingNavBar:monogramOnly:delegate:", v10, v8, v7, v11, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    dispatch_data_t v19 = (void *)sCollapsedContactHeaderView;
    sCollapsedContactHeaderView = v18;

    id v14 = (id)sCollapsedContactHeaderView;
    goto LABEL_5;
  }
  id v15 = (id)sCollapsedContactHeaderView;
  [v15 setDelegate:v11];
  [v15 prepareForReuse];
  [v15 updateForShowingNavBar:v8];
  [v15 updateWithNewContact:v10];
LABEL_6:

  return v15;
}

+ (id)makePhotoViewWithShouldAllowTakePhotoAction:(BOOL)a3 shouldAllowImageDrops:(BOOL)a4 monogramOnly:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  BOOL v7 = a3;
  BOOL v8 = +[CNUIContactsEnvironment currentEnvironment];
  double v9 = [v8 inProcessContactStore];

  id v10 = +[CNUIContactsEnvironment currentEnvironment];
  id v11 = v10;
  if (v5) {
    [v10 cachingMonogramRenderer];
  }
  else {
  double v12 = [v10 cachingLikenessRenderer];
  }

  id v13 = [CNContactPhotoView alloc];
  id v14 = -[CNContactPhotoView initWithFrame:shouldAllowTakePhotoAction:threeDTouchEnabled:contactStore:allowsImageDrops:imageRenderer:](v13, "initWithFrame:shouldAllowTakePhotoAction:threeDTouchEnabled:contactStore:allowsImageDrops:imageRenderer:", v7, 1, v9, v6, v12, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));

  return v14;
}

+ (id)sizeAttributesShowingNavBar:(BOOL)a3
{
  if (a3) {
    +[CNContactHeaderViewSizeAttributes staticCollapsedDisplayAttributesWithNavBar];
  }
  else {
  id v3 = +[CNContactHeaderViewSizeAttributes staticCollapsedDisplayAttributes];
  }

  return v3;
}

@end