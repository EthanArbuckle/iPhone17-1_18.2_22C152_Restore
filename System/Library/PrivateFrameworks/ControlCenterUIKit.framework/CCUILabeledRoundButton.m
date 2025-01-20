@interface CCUILabeledRoundButton
- (BOOL)_shouldUseLargeTextLayout;
- (BOOL)isDynamicLayoutEnabled;
- (BOOL)isDynamicLayoutUnbounded;
- (BOOL)labelsVisible;
- (BOOL)useAlternateBackground;
- (BOOL)useAutomaticSymbolColors;
- (CCUICAPackageDescription)glyphPackageDescription;
- (CCUILabeledRoundButton)initWithGlyphImage:(id)a3 highlightColor:(id)a4;
- (CCUILabeledRoundButton)initWithGlyphImage:(id)a3 highlightColor:(id)a4 highlightTintColor:(id)a5;
- (CCUILabeledRoundButton)initWithGlyphImage:(id)a3 highlightColor:(id)a4 highlightTintColor:(id)a5 useLightStyle:(BOOL)a6;
- (CCUILabeledRoundButton)initWithGlyphImage:(id)a3 highlightColor:(id)a4 useLightStyle:(BOOL)a5;
- (CCUILabeledRoundButton)initWithGlyphPackageDescription:(id)a3 highlightColor:(id)a4;
- (CCUILabeledRoundButton)initWithGlyphPackageDescription:(id)a3 highlightColor:(id)a4 useLightStyle:(BOOL)a5;
- (CCUILabeledRoundButton)initWithHighlightColor:(id)a3 useLightStyle:(BOOL)a4;
- (CCUIRoundButton)buttonView;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)requiredVisualStyleCategories;
- (NSString)contentSizeCategoryThreshold;
- (NSString)glyphState;
- (NSString)subtitle;
- (NSString)title;
- (UIColor)highlightColor;
- (UIColor)highlightTintColor;
- (UIImage)glyphImage;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (double)glyphScale;
- (id)visualStylingProviderForCategory:(int64_t)a3;
- (void)_contentSizeCategoryDidChange;
- (void)_layoutLabels;
- (void)_setupLabelsBounds;
- (void)_updateFonts;
- (void)_visualStylingProvider:(id)a3 didChangeForCategory:(int64_t)a4 outgoingVisualStylingProvider:(id)a5;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setButtonView:(id)a3;
- (void)setContentSizeCategoryThreshold:(id)a3;
- (void)setDynamicLayoutEnabled:(BOOL)a3;
- (void)setDynamicLayoutUnbounded:(BOOL)a3;
- (void)setGlyphImage:(id)a3;
- (void)setGlyphPackageDescription:(id)a3;
- (void)setGlyphScale:(double)a3;
- (void)setGlyphState:(id)a3;
- (void)setHighlightColor:(id)a3;
- (void)setHighlightTintColor:(id)a3;
- (void)setLabelsVisible:(BOOL)a3;
- (void)setSubtitle:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setUseAlternateBackground:(BOOL)a3;
- (void)setUseAutomaticSymbolColors:(BOOL)a3;
- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4;
@end

@implementation CCUILabeledRoundButton

- (CCUILabeledRoundButton)initWithHighlightColor:(id)a3 useLightStyle:(BOOL)a4
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v25.receiver = self;
  v25.super_class = (Class)CCUILabeledRoundButton;
  v7 = -[CCUILabeledRoundButton initWithFrame:](&v25, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v8 = v7;
  if (v7)
  {
    v7->_glyphScale = 1.0;
    uint64_t v9 = [v6 copy];
    highlightColor = v8->_highlightColor;
    v8->_highlightColor = (UIColor *)v9;

    v11 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    titleLabel = v8->_titleLabel;
    v8->_titleLabel = v11;

    [(CCUILabeledRoundButton *)v8 addSubview:v8->_titleLabel];
    [(UILabel *)v8->_titleLabel setTextAlignment:1];
    v13 = v8->_titleLabel;
    v14 = [(CCUILabeledRoundButton *)v8 title];
    [(UILabel *)v13 setText:v14];

    [(UILabel *)v8->_titleLabel setClipsToBounds:0];
    LODWORD(v15) = 1055286886;
    [(UILabel *)v8->_titleLabel _setHyphenationFactor:v15];
    [(UILabel *)v8->_titleLabel setNumberOfLines:2];
    v16 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    subtitleLabel = v8->_subtitleLabel;
    v8->_subtitleLabel = v16;

    [(CCUILabeledRoundButton *)v8 addSubview:v8->_subtitleLabel];
    [(UILabel *)v8->_subtitleLabel setTextAlignment:1];
    v18 = v8->_subtitleLabel;
    v19 = [(CCUILabeledRoundButton *)v8 subtitle];
    [(UILabel *)v18 setText:v19];

    [(UILabel *)v8->_subtitleLabel setClipsToBounds:0];
    LODWORD(v20) = 1055286886;
    [(UILabel *)v8->_subtitleLabel _setHyphenationFactor:v20];
    [(UILabel *)v8->_subtitleLabel setNumberOfLines:2];
    if (!a4)
    {
      [(UILabel *)v8->_titleLabel controlCenterApplyPrimaryContentShadow];
      [(UILabel *)v8->_subtitleLabel controlCenterApplyPrimaryContentShadow];
    }
    v8->_contentSizeCategoryThreshold = (NSString *)*MEMORY[0x1E4FB27C0];
    v21 = self;
    v26[0] = v21;
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
    id v23 = (id)[(CCUILabeledRoundButton *)v8 registerForTraitChanges:v22 withAction:sel__contentSizeCategoryDidChange];

    [(CCUILabeledRoundButton *)v8 _contentSizeCategoryDidChange];
  }

  return v8;
}

- (CCUILabeledRoundButton)initWithGlyphImage:(id)a3 highlightColor:(id)a4
{
  return [(CCUILabeledRoundButton *)self initWithGlyphImage:a3 highlightColor:a4 useLightStyle:0];
}

- (CCUILabeledRoundButton)initWithGlyphImage:(id)a3 highlightColor:(id)a4 useLightStyle:(BOOL)a5
{
  return [(CCUILabeledRoundButton *)self initWithGlyphImage:a3 highlightColor:a4 highlightTintColor:0 useLightStyle:a5];
}

- (CCUILabeledRoundButton)initWithGlyphImage:(id)a3 highlightColor:(id)a4 highlightTintColor:(id)a5
{
  return [(CCUILabeledRoundButton *)self initWithGlyphImage:a3 highlightColor:a4 highlightTintColor:a5 useLightStyle:0];
}

- (CCUILabeledRoundButton)initWithGlyphImage:(id)a3 highlightColor:(id)a4 highlightTintColor:(id)a5 useLightStyle:(BOOL)a6
{
  BOOL v6 = a6;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v14 = [(CCUILabeledRoundButton *)self initWithHighlightColor:v12 useLightStyle:v6];
  double v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_glyphImage, a3);
    uint64_t v16 = [v13 copy];
    highlightTintColor = v15->_highlightTintColor;
    v15->_highlightTintColor = (UIColor *)v16;

    v18 = [[CCUIRoundButton alloc] initWithGlyphImage:v11 highlightColor:v12 highlightTintColor:v13 useLightStyle:v6];
    buttonView = v15->_buttonView;
    v15->_buttonView = v18;

    [(CCUIRoundButton *)v15->_buttonView addTarget:v15 action:sel_buttonTapped_ forControlEvents:64];
    [(CCUILabeledRoundButton *)v15 addSubview:v15->_buttonView];
  }

  return v15;
}

- (CCUILabeledRoundButton)initWithGlyphPackageDescription:(id)a3 highlightColor:(id)a4
{
  return [(CCUILabeledRoundButton *)self initWithGlyphPackageDescription:a3 highlightColor:a4 useLightStyle:0];
}

- (CCUILabeledRoundButton)initWithGlyphPackageDescription:(id)a3 highlightColor:(id)a4 useLightStyle:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a3;
  id v10 = a4;
  id v11 = [(CCUILabeledRoundButton *)self initWithHighlightColor:v10 useLightStyle:v5];
  id v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_glyphPackageDescription, a3);
    id v13 = [[CCUIRoundButton alloc] initWithGlyphPackageDescription:v9 highlightColor:v10 useLightStyle:v5];
    buttonView = v12->_buttonView;
    v12->_buttonView = v13;

    [(CCUIRoundButton *)v12->_buttonView addTarget:v12 action:sel_buttonTapped_ forControlEvents:64];
    double v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", v12->_buttonView, 0);
    [(CCUILabeledRoundButton *)v12 setAutomationElements:v15];

    [(CCUILabeledRoundButton *)v12 addSubview:v12->_buttonView];
  }

  return v12;
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)CCUILabeledRoundButton;
  [(CCUILabeledRoundButton *)&v14 layoutSubviews];
  [(CCUILabeledRoundButton *)self _updateFonts];
  [(CCUILabeledRoundButton *)self bounds];
  double v4 = v3;
  double v6 = v5;
  BOOL v7 = [(CCUILabeledRoundButton *)self labelsVisible];
  BOOL v8 = v7;
  if (self->_dynamicLayoutEnabled && v7)
  {
    -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v4, v6);
    double v10 = v9;
    -[UILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", v4, v6);
    double v12 = v6 - (v10 + v11 + 8.0);
  }
  else
  {
    double v12 = v6;
  }
  -[CCUIRoundButton sizeThatFits:](self->_buttonView, "sizeThatFits:", v4, v12);
  BSRectWithSize();
  UIRectCenteredXInRectScale();
  [(CCUIRoundButton *)self->_buttonView setFrame:0];
  double v13 = 0.0;
  if (v8)
  {
    [(CCUILabeledRoundButton *)self _setupLabelsBounds];
    double v13 = 1.0;
  }
  [(UILabel *)self->_titleLabel setAlpha:v13];
  [(UILabel *)self->_subtitleLabel setAlpha:v13];
  [(CCUILabeledRoundButton *)self _layoutLabels];
}

- (void)didMoveToWindow
{
  v8.receiver = self;
  v8.super_class = (Class)CCUILabeledRoundButton;
  [(CCUILabeledRoundButton *)&v8 didMoveToWindow];
  double v3 = [(CCUILabeledRoundButton *)self window];

  if (v3)
  {
    double v4 = [(CCUILabeledRoundButton *)self visualStylingProviderForCategory:1];
    categoriesToVisualStylingProviders = self->_categoriesToVisualStylingProviders;
    double v6 = [NSNumber numberWithInteger:1];
    BOOL v7 = [(NSMutableDictionary *)categoriesToVisualStylingProviders objectForKey:v6];
    [(CCUILabeledRoundButton *)self _visualStylingProvider:v4 didChangeForCategory:1 outgoingVisualStylingProvider:v7];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  -[CCUIRoundButton sizeThatFits:](self->_buttonView, "sizeThatFits:");
  double v7 = v6;
  double v9 = v8;
  if ([(CCUILabeledRoundButton *)self labelsVisible])
  {
    -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", width, height);
    double v11 = v10;
    double v13 = v12;
    -[UILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", width, height);
    double v9 = v9 + v13 + v15 + 8.0;
    if (v11 >= v14) {
      double v14 = v11;
    }
    if (v7 >= v14) {
      double v7 = v14;
    }
  }
  double v16 = v7;
  double v17 = v9;
  result.double height = v17;
  result.double width = v16;
  return result;
}

- (CGSize)intrinsicContentSize
{
  -[CCUILabeledRoundButton sizeThatFits:](self, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (void)setHighlightColor:(id)a3
{
  objc_storeStrong((id *)&self->_highlightColor, a3);
  id v5 = a3;
  [(CCUIRoundButton *)self->_buttonView setHighlightColor:v5];
}

- (void)setGlyphImage:(id)a3
{
  objc_storeStrong((id *)&self->_glyphImage, a3);
  id v5 = a3;
  [(CCUIRoundButton *)self->_buttonView setGlyphImage:v5];
}

- (void)setGlyphPackageDescription:(id)a3
{
  objc_storeStrong((id *)&self->_glyphPackageDescription, a3);
  id v5 = a3;
  [(CCUIRoundButton *)self->_buttonView setGlyphPackageDescription:v5];
}

- (void)setGlyphScale:(double)a3
{
  self->_glyphScale = a3;
  -[CCUIRoundButton setGlyphScale:](self->_buttonView, "setGlyphScale:");
}

- (void)setGlyphState:(id)a3
{
  objc_storeStrong((id *)&self->_glyphState, a3);
  id v5 = a3;
  [(CCUIRoundButton *)self->_buttonView setGlyphState:v5];
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  id v5 = (NSString *)[v4 copy];
  title = self->_title;
  self->_title = v5;

  [(UILabel *)self->_titleLabel setText:v4];
  [(CCUILabeledRoundButton *)self setNeedsLayout];
}

- (void)setSubtitle:(id)a3
{
  id v4 = a3;
  id v5 = (NSString *)[v4 copy];
  subtitle = self->_subtitle;
  self->_subtitle = v5;

  [(UILabel *)self->_subtitleLabel setText:v4];
  [(CCUILabeledRoundButton *)self setNeedsLayout];
}

- (void)setLabelsVisible:(BOOL)a3
{
  if (self->_labelsVisible != a3)
  {
    self->_labelsVisible = a3;
    [(CCUILabeledRoundButton *)self setNeedsLayout];
  }
}

- (void)setUseAlternateBackground:(BOOL)a3
{
  if (self->_useAlternateBackground != a3)
  {
    self->_useAlternateBackground = a3;
    -[CCUIRoundButton setUseAlternateBackground:](self->_buttonView, "setUseAlternateBackground:");
  }
}

- (void)setUseAutomaticSymbolColors:(BOOL)a3
{
  if (self->_useAutomaticSymbolColors != a3)
  {
    self->_useAutomaticSymbolColors = a3;
    -[CCUIRoundButton setUseAutomaticSymbolColors:](self->_buttonView, "setUseAutomaticSymbolColors:");
  }
}

- (void)setContentSizeCategoryThreshold:(id)a3
{
  if (self->_contentSizeCategoryThreshold != a3)
  {
    self->_contentSizeCategoryThreshold = (NSString *)a3;
    [(CCUILabeledRoundButton *)self _contentSizeCategoryDidChange];
  }
}

- (void)setDynamicLayoutEnabled:(BOOL)a3
{
  if (self->_dynamicLayoutEnabled != a3)
  {
    self->_dynamicLayoutEnabled = a3;
    [(CCUIRoundButton *)self->_buttonView setDynamicLayoutEnabled:"setDynamicLayoutEnabled:"];
    [(CCUILabeledRoundButton *)self setNeedsLayout];
  }
}

- (void)setDynamicLayoutUnbounded:(BOOL)a3
{
  if (self->_dynamicLayoutUnbounded != a3)
  {
    self->_dynamicLayoutUnbounded = a3;
    [(CCUIRoundButton *)self->_buttonView setDynamicLayoutUnbounded:"setDynamicLayoutUnbounded:"];
    [(CCUILabeledRoundButton *)self setNeedsLayout];
  }
}

- (id)visualStylingProviderForCategory:(int64_t)a3
{
  id v5 = [(CCUILabeledRoundButton *)self requiredVisualStyleCategories];
  double v6 = [NSNumber numberWithInteger:a3];
  int v7 = [v5 containsObject:v6];

  if (v7)
  {
    categoriesToVisualStylingProviders = self->_categoriesToVisualStylingProviders;
    double v9 = [NSNumber numberWithInteger:a3];
    double v10 = [(NSMutableDictionary *)categoriesToVisualStylingProviders objectForKey:v9];
    double v11 = v10;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      v15.receiver = self;
      v15.super_class = (Class)CCUILabeledRoundButton;
      id v12 = [(CCUILabeledRoundButton *)&v15 visualStylingProviderForCategory:a3];
    }
    double v13 = v12;
  }
  else
  {
    double v13 = 0;
  }
  return v13;
}

- (NSArray)requiredVisualStyleCategories
{
  double v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithObjects:", &unk_1F301EEB8, 0);
  id v4 = [(CCUIRoundButton *)self->_buttonView requiredVisualStyleCategories];
  [v3 addObjectsFromArray:v4];

  id v5 = [v3 allObjects];

  return (NSArray *)v5;
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  id v17 = a3;
  double v6 = [(CCUILabeledRoundButton *)self requiredVisualStyleCategories];
  int v7 = [NSNumber numberWithInteger:a4];
  int v8 = [v6 containsObject:v7];

  if (v8)
  {
    categoriesToVisualStylingProviders = self->_categoriesToVisualStylingProviders;
    double v10 = [NSNumber numberWithInteger:a4];
    id v11 = [(NSMutableDictionary *)categoriesToVisualStylingProviders objectForKey:v10];

    if (v11 == v17)
    {
LABEL_10:

      goto LABEL_11;
    }
    id v12 = self->_categoriesToVisualStylingProviders;
    if (v17)
    {
      if (!v12)
      {
        double v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        double v14 = self->_categoriesToVisualStylingProviders;
        self->_categoriesToVisualStylingProviders = v13;

        id v12 = self->_categoriesToVisualStylingProviders;
      }
      objc_super v15 = [NSNumber numberWithInteger:a4];
      [(NSMutableDictionary *)v12 setObject:v17 forKey:v15];
    }
    else
    {
      double v16 = [NSNumber numberWithInteger:a4];
      [(NSMutableDictionary *)v12 removeObjectForKey:v16];

      if ([(NSMutableDictionary *)self->_categoriesToVisualStylingProviders count]) {
        goto LABEL_9;
      }
      objc_super v15 = self->_categoriesToVisualStylingProviders;
      self->_categoriesToVisualStylingProviders = 0;
    }

LABEL_9:
    [(CCUILabeledRoundButton *)self _visualStylingProvider:v17 didChangeForCategory:a4 outgoingVisualStylingProvider:v11];
    goto LABEL_10;
  }
LABEL_11:
}

- (void)_setupLabelsBounds
{
  [(CCUILabeledRoundButton *)self bounds];
  CGFloat x = v19.origin.x;
  CGFloat y = v19.origin.y;
  double width = v19.size.width;
  double height = v19.size.height;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", CGRectGetWidth(v19), 0.0);
  double v8 = v7;
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.double width = width;
  v20.size.double height = height;
  CGFloat v17 = CGRectGetWidth(v20);
  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.double width = width;
  v21.size.double height = height;
  -[UILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", CGRectGetWidth(v21), 0.0);
  uint64_t v10 = v9;
  v22.origin.CGFloat x = x;
  v22.origin.CGFloat y = y;
  v22.size.double width = width;
  v22.size.double height = height;
  CGFloat v11 = CGRectGetWidth(v22);
  id v12 = [(UILabel *)self->_titleLabel font];
  [v12 _bodyLeading];
  double v14 = v13;

  if (v14 == 0.0 || (uint64_t)vcvtmd_s64_f64(v8 / v14) < 2)
  {
    if ([(UILabel *)self->_subtitleLabel numberOfLines] == 1)
    {
      [(UILabel *)self->_subtitleLabel setNumberOfLines:2];
      v23.origin.CGFloat x = x;
      v23.origin.CGFloat y = y;
      v23.size.double width = width;
      v23.size.double height = height;
      -[UILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", CGRectGetWidth(v23), 0.0);
      uint64_t v10 = v16;
      v24.origin.CGFloat x = x;
      v24.origin.CGFloat y = y;
      v24.size.double width = width;
      v24.size.double height = height;
      CGFloat v11 = CGRectGetWidth(v24);
    }
  }
  else
  {
    [(UILabel *)self->_subtitleLabel setNumberOfLines:1];
    -[UILabel sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", width, height);
    uint64_t v10 = v15;
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __44__CCUILabeledRoundButton__setupLabelsBounds__block_invoke;
  v18[3] = &unk_1E6AD4660;
  v18[4] = self;
  *(CGFloat *)&v18[5] = v17;
  *(double *)&v18[6] = v8;
  *(CGFloat *)&v18[7] = v11;
  v18[8] = v10;
  objc_msgSend(MEMORY[0x1E4FB1EB0], "performWithoutAnimation:", v18, *(void *)&v17);
}

uint64_t __44__CCUILabeledRoundButton__setupLabelsBounds__block_invoke(uint64_t a1)
{
  double v2 = *MEMORY[0x1E4F1DAD8];
  double v3 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 504), "setBounds:", *MEMORY[0x1E4F1DAD8], v3, *(double *)(a1 + 40), *(double *)(a1 + 48));
  id v4 = *(void **)(*(void *)(a1 + 32) + 512);
  double v5 = *(double *)(a1 + 56);
  double v6 = *(double *)(a1 + 64);
  return objc_msgSend(v4, "setBounds:", v2, v3, v5, v6);
}

- (void)_layoutLabels
{
  double v3 = [(CCUILabeledRoundButton *)self buttonView];
  [v3 frame];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  [(UILabel *)self->_titleLabel bounds];
  v16.origin.CGFloat x = v5;
  v16.origin.CGFloat y = v7;
  v16.size.double width = v9;
  v16.size.double height = v11;
  CGRectGetMidX(v16);
  v17.origin.CGFloat x = v5;
  v17.origin.CGFloat y = v7;
  v17.size.double width = v9;
  v17.size.double height = v11;
  CGRectGetMaxY(v17);
  titleLabel = self->_titleLabel;
  [(UILabel *)titleLabel bounds];
  UIRectCenteredAboutPointScale();
  -[UILabel setFrame:](titleLabel, "setFrame:");
  [(UILabel *)self->_subtitleLabel bounds];
  v18.origin.CGFloat x = v5;
  v18.origin.CGFloat y = v7;
  v18.size.double width = v9;
  v18.size.double height = v11;
  CGRectGetMidX(v18);
  [(UILabel *)self->_titleLabel frame];
  CGRectGetMaxY(v19);
  double v13 = [(UILabel *)self->_subtitleLabel font];
  [v13 _leading];

  subtitleLabel = self->_subtitleLabel;
  [(UILabel *)subtitleLabel bounds];
  UIRectCenteredAboutPointScale();
  -[UILabel setFrame:](subtitleLabel, "setFrame:");
}

- (void)_contentSizeCategoryDidChange
{
  [(CCUILabeledRoundButton *)self _updateFonts];
  [(CCUILabeledRoundButton *)self setNeedsLayout];
}

- (void)_updateFonts
{
  id v18 = [(CCUILabeledRoundButton *)self traitCollection];
  double v3 = [v18 preferredContentSizeCategory];
  NSComparisonResult v4 = UIContentSizeCategoryCompareToCategory(v3, self->_contentSizeCategoryThreshold);
  if (v4 == NSOrderedDescending)
  {
    uint64_t v5 = [MEMORY[0x1E4FB1E20] traitCollectionWithPreferredContentSizeCategory:self->_contentSizeCategoryThreshold];

    id v6 = (id)v5;
  }
  else
  {
    id v6 = v18;
  }
  id v19 = v6;
  CGFloat v7 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28D8] compatibleWithTraitCollection:v6];
  double v8 = (void *)MEMORY[0x1E4FB08E0];
  [v7 pointSize];
  CGFloat v9 = objc_msgSend(v8, "boldSystemFontOfSize:");
  IsAccessibilityCategorCGFloat y = UIContentSizeCategoryIsAccessibilityCategory(v3);
  if (v4 == NSOrderedDescending && IsAccessibilityCategory)
  {
    id v12 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB2988] compatibleWithTraitCollection:v19];
    double v13 = (void *)MEMORY[0x1E4FB08E0];
    [v12 pointSize];
    uint64_t v14 = objc_msgSend(v13, "boldSystemFontOfSize:");

    uint64_t v15 = (void *)MEMORY[0x1E4FB08E0];
    [v12 pointSize];
    uint64_t v17 = [v15 systemFontOfSize:v16 + -2.0];

    CGFloat v7 = (void *)v17;
    CGFloat v9 = (void *)v14;
  }
  [(UILabel *)self->_titleLabel setFont:v9];
  [(UILabel *)self->_subtitleLabel setFont:v7];
}

- (BOOL)_shouldUseLargeTextLayout
{
  double v2 = [(CCUILabeledRoundButton *)self traitCollection];
  double v3 = [v2 preferredContentSizeCategory];
  IsAccessibilityCategorCGFloat y = UIContentSizeCategoryIsAccessibilityCategory(v3);

  return IsAccessibilityCategory;
}

- (void)_visualStylingProvider:(id)a3 didChangeForCategory:(int64_t)a4 outgoingVisualStylingProvider:(id)a5
{
  id v13 = a3;
  id v8 = a5;
  CGFloat v9 = v8;
  if (a4 == 1)
  {
    [v8 stopAutomaticallyUpdatingView:self->_titleLabel];
    [v9 stopAutomaticallyUpdatingView:self->_subtitleLabel];
    [v13 automaticallyUpdateView:self->_titleLabel withStyle:0];
    [v13 automaticallyUpdateView:self->_subtitleLabel withStyle:0];
  }
  double v10 = [(CCUIRoundButton *)self->_buttonView requiredVisualStyleCategories];
  CGFloat v11 = [NSNumber numberWithInteger:a4];
  int v12 = [v10 containsObject:v11];

  if (v12) {
    [(CCUIRoundButton *)self->_buttonView setVisualStylingProvider:v13 forCategory:a4];
  }
  [(CCUILabeledRoundButton *)self setNeedsLayout];
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (UIImage)glyphImage
{
  return self->_glyphImage;
}

- (CCUICAPackageDescription)glyphPackageDescription
{
  return self->_glyphPackageDescription;
}

- (double)glyphScale
{
  return self->_glyphScale;
}

- (NSString)glyphState
{
  return self->_glyphState;
}

- (UIColor)highlightColor
{
  return self->_highlightColor;
}

- (BOOL)labelsVisible
{
  return self->_labelsVisible;
}

- (BOOL)useAlternateBackground
{
  return self->_useAlternateBackground;
}

- (BOOL)useAutomaticSymbolColors
{
  return self->_useAutomaticSymbolColors;
}

- (CCUIRoundButton)buttonView
{
  return self->_buttonView;
}

- (void)setButtonView:(id)a3
{
}

- (NSString)contentSizeCategoryThreshold
{
  return self->_contentSizeCategoryThreshold;
}

- (BOOL)isDynamicLayoutEnabled
{
  return self->_dynamicLayoutEnabled;
}

- (BOOL)isDynamicLayoutUnbounded
{
  return self->_dynamicLayoutUnbounded;
}

- (UIColor)highlightTintColor
{
  return self->_highlightTintColor;
}

- (void)setHighlightTintColor:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_highlightTintColor, 0);
  objc_storeStrong((id *)&self->_buttonView, 0);
  objc_storeStrong((id *)&self->_highlightColor, 0);
  objc_storeStrong((id *)&self->_glyphState, 0);
  objc_storeStrong((id *)&self->_glyphPackageDescription, 0);
  objc_storeStrong((id *)&self->_glyphImage, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_categoriesToVisualStylingProviders, 0);
}

@end