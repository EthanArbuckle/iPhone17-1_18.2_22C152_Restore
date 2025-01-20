@interface FCUIActivityPickerEducationCardView
+ (id)_defaultPromimentViewWithBaubleDescriptions:(id)a3;
+ (id)_preferredFont:(BOOL)a3 textStyle:(id)a4 weight:(double)a5 additionalTraits:(unsigned int)a6;
+ (id)defaultEducationCardViewActivityIdentifiers;
+ (id)defaultEducationCardViewFallbackBaubleDescriptions;
+ (id)defaultEducationCardViewWithProminentViewBaubleDescriptions:(id)a3 dismissAction:(id)a4;
- (BOOL)_needsTextAttributesUpdate;
- (BOOL)adjustForContentSizeCategoryChange;
- (BOOL)adjustsFontForContentSizeCategory;
- (CGSize)sizeThatFits:(CGSize)a3;
- (FCUIActivityPickerEducationCardView)initWithProminentView:(id)a3 headlineText:(id)a4 bodyText:(id)a5 dismissAction:(id)a6;
- (NSString)bodyText;
- (NSString)headlineText;
- (NSString)preferredContentSizeCategory;
- (UIAction)defaultAction;
- (UIAction)dismissAction;
- (UIView)prominentView;
- (void)_configureBackgroundMaterialViewIfNecessary;
- (void)_configureBodyLabelIfNecessary;
- (void)_configureDismissControlIfNecessaryWithAction:(id)a3;
- (void)_configureHeadlineLabelIfNecessary;
- (void)_handleDefaultTap:(id)a3;
- (void)_layoutSubviewInBounds:(CGRect)a3 measuringOnly:(CGSize *)a4;
- (void)_setNeedsTextAttributesUpdate;
- (void)_updateTextAttributes;
- (void)_updateTextAttributesForBodyLabel;
- (void)_updateTextAttributesForHeadlineLabel;
- (void)_updateTextAttributesIfNecessary;
- (void)layoutSubviews;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3;
- (void)setDefaultAction:(id)a3;
- (void)setPreferredContentSizeCategory:(id)a3;
@end

@implementation FCUIActivityPickerEducationCardView

+ (id)_defaultPromimentViewWithBaubleDescriptions:(id)a3
{
  id v3 = a3;
  v4 = [[FCUIActivityBaubleGroupView alloc] initWithBaubleDescriptions:v3 baubleGroupType:1];

  return v4;
}

+ (id)defaultEducationCardViewActivityIdentifiers
{
  return &unk_26D1C02F0;
}

+ (id)defaultEducationCardViewFallbackBaubleDescriptions
{
  v16[4] = *MEMORY[0x263EF8340];
  v2 = [FCUIActivityBaubleDescription alloc];
  id v3 = [MEMORY[0x263F825C8] systemIndigoColor];
  v4 = [(FCUIActivityBaubleDescription *)v2 initWithSystemImageName:@"moon.fill" tintColor:v3];
  v16[0] = v4;
  v5 = [FCUIActivityBaubleDescription alloc];
  v6 = [MEMORY[0x263F825C8] systemOrangeColor];
  v7 = [(FCUIActivityBaubleDescription *)v5 initWithSystemImageName:@"book.closed.fill" tintColor:v6];
  v16[1] = v7;
  v8 = [FCUIActivityBaubleDescription alloc];
  v9 = [MEMORY[0x263F825C8] systemGreenColor];
  v10 = [(FCUIActivityBaubleDescription *)v8 initWithSystemImageName:@"figure.run" tintColor:v9];
  v16[2] = v10;
  v11 = [FCUIActivityBaubleDescription alloc];
  v12 = [MEMORY[0x263F825C8] systemMintColor];
  v13 = [(FCUIActivityBaubleDescription *)v11 initWithSystemImageName:@"bed.double.fill" tintColor:v12];
  v16[3] = v13;
  v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:4];

  return v14;
}

+ (id)defaultEducationCardViewWithProminentViewBaubleDescriptions:(id)a3 dismissAction:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_alloc((Class)a1);
  v9 = [a1 _defaultPromimentViewWithBaubleDescriptions:v7];

  v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v11 = [v10 localizedStringForKey:@"ACTIVITY_ONBOARDING_HEADLINE" value:&stru_26D1B4698 table:0];
  v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v13 = [v12 localizedStringForKey:@"ACTIVITY_ONBOARDING_BODY" value:&stru_26D1B4698 table:0];
  v14 = (void *)[v8 initWithProminentView:v9 headlineText:v11 bodyText:v13 dismissAction:v6];

  return v14;
}

- (FCUIActivityPickerEducationCardView)initWithProminentView:(id)a3 headlineText:(id)a4 bodyText:(id)a5 dismissAction:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)FCUIActivityPickerEducationCardView;
  v15 = [(FCUIActivityPickerEducationCardView *)&v18 init];
  v16 = v15;
  if (v15)
  {
    [(FCUIActivityPickerEducationCardView *)v15 setAdjustsFontForContentSizeCategory:1];
    objc_storeStrong((id *)&v16->_prominentView, a3);
    [(FCUIActivityPickerEducationCardView *)v16 addSubview:v16->_prominentView];
    [(FCUIActivityPickerEducationCardView *)v16 _configureHeadlineLabelIfNecessary];
    [(UILabel *)v16->_headlineLabel setText:v12];
    [(FCUIActivityPickerEducationCardView *)v16 _configureBodyLabelIfNecessary];
    [(UILabel *)v16->_bodyLabel setText:v13];
    [(FCUIActivityPickerEducationCardView *)v16 _configureDismissControlIfNecessaryWithAction:v14];
    [(FCUIActivityPickerEducationCardView *)v16 setClipsToBounds:1];
  }

  return v16;
}

- (void)setDefaultAction:(id)a3
{
  id v10 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    v4 = (UIAction *)[v10 copy];
    defaultAction = self->_defaultAction;
    self->_defaultAction = v4;

    defaultTapGesture = self->_defaultTapGesture;
    if (self->_defaultAction)
    {
      if (!defaultTapGesture)
      {
        id v7 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel__handleDefaultTap_];
        id v8 = self->_defaultTapGesture;
        self->_defaultTapGesture = v7;

        [(FCUIActivityPickerEducationCardView *)self addGestureRecognizer:self->_defaultTapGesture];
      }
    }
    else
    {
      [(FCUIActivityPickerEducationCardView *)self removeGestureRecognizer:defaultTapGesture];
      v9 = self->_defaultTapGesture;
      self->_defaultTapGesture = 0;
    }
  }
}

- (void)_layoutSubviewInBounds:(CGRect)a3 measuringOnly:(CGSize *)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  int v10 = [(FCUIActivityPickerEducationCardView *)self _shouldReverseLayoutDirection];
  -[_FCUIActivityPickerOnboardingDismissControl sizeThatFits:](self->_dismissControl, "sizeThatFits:", width, height);
  BSRectWithSize();
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  -[_FCUIActivityPickerOnboardingDismissControl contentInsetsWithBounds:](self->_dismissControl, "contentInsetsWithBounds:");
  double v19 = v18;
  double v21 = 24.0 - v20;
  CGFloat v49 = y;
  double v50 = width;
  CGFloat v48 = x;
  if (v10)
  {
    double v22 = 24.0 - v17;
  }
  else
  {
    v52.origin.CGFloat x = x;
    v52.origin.CGFloat y = y;
    double v23 = v19;
    v52.size.double width = width;
    v52.size.double height = height;
    double MaxX = CGRectGetMaxX(v52);
    v53.origin.CGFloat x = v12;
    v53.origin.CGFloat y = v21;
    v53.size.double width = v14;
    v53.size.double height = v16;
    double v22 = v23 + MaxX - CGRectGetWidth(v53) + -24.0;
  }
  CGFloat v25 = v21;
  CGFloat v26 = v14;
  CGFloat v27 = v16;
  if (!a4)
  {
    dismissControl = self->_dismissControl;
    UIRectIntegralWithScale();
    -[_FCUIActivityPickerOnboardingDismissControl setFrame:](dismissControl, "setFrame:");
  }
  CGFloat v29 = v22;
  -[UIView sizeThatFits:](self->_prominentView, "sizeThatFits:", v50, height, v19);
  BSRectWithSize();
  CGFloat rect = height;
  UIRectCenteredXInRectScale();
  double v30 = v54.origin.x;
  double v31 = v54.origin.y;
  double v32 = v54.size.width;
  double v33 = v54.size.height;
  v65.origin.CGFloat x = v29;
  v65.origin.CGFloat y = v25;
  v65.size.double width = v26;
  v65.size.double height = v27;
  if (CGRectIntersectsRect(v54, v65))
  {
    v55.origin.CGFloat x = v29;
    v55.origin.CGFloat y = v25;
    v55.size.double width = v26;
    v55.size.double height = v27;
    double v31 = CGRectGetMaxY(v55) + 8.0;
  }
  if (!a4) {
    -[UIView setFrame:](self->_prominentView, "setFrame:", v30, v31, v32, v33, 0);
  }
  v56.origin.CGFloat x = v30;
  v56.origin.CGFloat y = v31;
  v56.size.double width = v32;
  v56.size.double height = v33;
  double v46 = CGRectGetMaxY(v56) + 14.0;
  v57.origin.CGFloat x = v48;
  v57.origin.CGFloat y = v49;
  v57.size.double width = v50;
  v57.size.double height = rect;
  CGFloat v34 = CGRectGetWidth(v57) + -48.0;
  v58.origin.CGFloat x = v48;
  double v35 = v34;
  v58.origin.CGFloat y = v49;
  v58.size.double width = v50;
  v58.size.double height = rect;
  CGRectGetMaxY(v58);
  v59.origin.CGFloat x = v30;
  v59.origin.CGFloat y = v31;
  v59.size.double width = v32;
  v59.size.double height = v33;
  CGRectGetMaxY(v59);
  unint64_t v36 = -[UILabel fcui_numberOfLinesInFrame:maximum:drawingContext:](self->_headlineLabel, "fcui_numberOfLinesInFrame:maximum:drawingContext:", 0, self->_drawingContext, 24.0, v46, v35, 1.79769313e308);
  [(UILabel *)self->_headlineLabel fcui_measuringHeightWithNumberOfLines:v36];
  CGFloat v38 = v37;
  if (!a4)
  {
    v60.origin.CGFloat x = 24.0;
    v60.origin.CGFloat y = v46;
    v60.size.double width = v35;
    v60.size.double height = v38;
    CGRectGetWidth(v60);
    [(UILabel *)self->_headlineLabel fcui_drawingHeightWithNumberOfLines:v36];
    BSRectWithSize();
    UIRectCenteredIntegralRectScale();
    [(UILabel *)self->_headlineLabel setFrame:0];
  }
  v61.origin.CGFloat x = 24.0;
  v61.origin.CGFloat y = v46;
  v61.size.double width = v35;
  v61.size.double height = v38;
  double v39 = CGRectGetMaxY(v61) + 8.0;
  unint64_t v40 = -[UILabel fcui_numberOfLinesInFrame:maximum:drawingContext:](self->_bodyLabel, "fcui_numberOfLinesInFrame:maximum:drawingContext:", 0, self->_drawingContext, 24.0, v46, v35, 1.79769313e308);
  [(UILabel *)self->_bodyLabel fcui_measuringHeightWithNumberOfLines:v40];
  CGFloat v42 = v41;
  if (a4)
  {
    v62.origin.CGFloat x = v48;
    v62.origin.CGFloat y = v49;
    v62.size.double width = v50;
    v62.size.double height = rect;
    CGRectGetWidth(v62);
    v63.origin.CGFloat x = 24.0;
    v63.origin.CGFloat y = v39;
    v63.size.double width = v35;
    v63.size.double height = v42;
    CGRectGetMaxY(v63);
    UISizeRoundToScale();
    a4->double width = v43;
    a4->double height = v44;
  }
  else
  {
    v64.origin.CGFloat x = 24.0;
    v64.origin.CGFloat y = v39;
    v64.size.double width = v35;
    v64.size.double height = v42;
    CGRectGetWidth(v64);
    [(UILabel *)self->_bodyLabel fcui_drawingHeightWithNumberOfLines:v40];
    BSRectWithSize();
    UIRectCenteredIntegralRectScale();
    bodyLabel = self->_bodyLabel;
    -[UILabel setFrame:](bodyLabel, "setFrame:");
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  long long v6 = *MEMORY[0x263F001B0];
  BSRectWithSize();
  -[FCUIActivityPickerEducationCardView _layoutSubviewInBounds:measuringOnly:](self, "_layoutSubviewInBounds:measuringOnly:", &v6);
  double v5 = *((double *)&v6 + 1);
  double v4 = *(double *)&v6;
  result.double height = v5;
  result.double width = v4;
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)FCUIActivityPickerEducationCardView;
  [(FCUIActivityPickerEducationCardView *)&v3 layoutSubviews];
  [(FCUIActivityPickerEducationCardView *)self _configureBackgroundMaterialViewIfNecessary];
  [(FCUIActivityPickerEducationCardView *)self _updateTextAttributesIfNecessary];
  [(FCUIActivityPickerEducationCardView *)self bounds];
  -[FCUIActivityPickerEducationCardView _layoutSubviewInBounds:measuringOnly:](self, "_layoutSubviewInBounds:measuringOnly:", 0);
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  if (self->_adjustsFontForContentSizeCategory != a3)
  {
    self->_adjustsFontForContentSizeCategorCGFloat y = a3;
    -[_FCUIActivityPickerOnboardingDismissControl setAdjustsFontForContentSizeCategory:](self->_dismissControl, "setAdjustsFontForContentSizeCategory:");
    if (objc_opt_respondsToSelector()) {
      [(UIView *)self->_prominentView setAdjustsFontForContentSizeCategory:self->_adjustsFontForContentSizeCategory];
    }
    [(FCUIActivityPickerEducationCardView *)self _setNeedsTextAttributesUpdate];
  }
}

- (BOOL)adjustForContentSizeCategoryChange
{
  objc_super v3 = [(FCUIActivityPickerEducationCardView *)self traitCollection];
  double v4 = [v3 preferredContentSizeCategory];

  NSComparisonResult v5 = UIContentSizeCategoryCompareToCategory(v4, self->_preferredContentSizeCategory);
  if (v5)
  {
    objc_storeStrong((id *)&self->_preferredContentSizeCategory, v4);
    [(FCUIActivityPickerEducationCardView *)self _setNeedsTextAttributesUpdate];
    [(_FCUIActivityPickerOnboardingDismissControl *)self->_dismissControl adjustForContentSizeCategoryChange];
    if (objc_opt_respondsToSelector()) {
      [(UIView *)self->_prominentView adjustForContentSizeCategoryChange];
    }
  }

  return v5 != NSOrderedSame;
}

+ (id)_preferredFont:(BOOL)a3 textStyle:(id)a4 weight:(double)a5 additionalTraits:(unsigned int)a6
{
  v17[1] = *MEMORY[0x263EF8340];
  if (a3) {
    [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:a4 addingSymbolicTraits:*(void *)&a6 options:0];
  }
  else {
  id v7 = [MEMORY[0x263F81720] defaultFontDescriptorWithTextStyle:a4 addingSymbolicTraits:*(void *)&a6 options:0];
  }
  uint64_t v16 = *MEMORY[0x263F817A0];
  uint64_t v14 = *MEMORY[0x263F81850];
  id v8 = [NSNumber numberWithDouble:a5];
  double v15 = v8;
  v9 = [NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  v17[0] = v9;
  int v10 = [NSDictionary dictionaryWithObjects:v17 forKeys:&v16 count:1];
  double v11 = [v7 fontDescriptorByAddingAttributes:v10];

  CGFloat v12 = [MEMORY[0x263F81708] fontWithDescriptor:v11 size:0.0];

  return v12;
}

- (void)_updateTextAttributesForHeadlineLabel
{
  headlineLabel = self->_headlineLabel;
  if (headlineLabel)
  {
    double v4 = [(id)objc_opt_class() _preferredFont:1 textStyle:*MEMORY[0x263F83628] weight:0x8000 additionalTraits:*MEMORY[0x263F81800]];
    [(UILabel *)headlineLabel setFont:v4];

    [(FCUIActivityPickerEducationCardView *)self setNeedsLayout];
  }
}

- (void)_updateTextAttributesForBodyLabel
{
  bodyLabel = self->_bodyLabel;
  if (bodyLabel)
  {
    double v4 = [(id)objc_opt_class() _preferredFont:1 textStyle:*MEMORY[0x263F835F0] weight:0x8000 additionalTraits:*MEMORY[0x263F81838]];
    [(UILabel *)bodyLabel setFont:v4];

    [(FCUIActivityPickerEducationCardView *)self setNeedsLayout];
  }
}

- (BOOL)_needsTextAttributesUpdate
{
  return !self->_textAttributesValid;
}

- (void)_setNeedsTextAttributesUpdate
{
  self->_textAttributesValid = 0;
  [(FCUIActivityPickerEducationCardView *)self setNeedsLayout];
}

- (void)_updateTextAttributes
{
  self->_textAttributesValid = 1;
  [(FCUIActivityPickerEducationCardView *)self _updateTextAttributesForHeadlineLabel];
  [(FCUIActivityPickerEducationCardView *)self _updateTextAttributesForBodyLabel];
}

- (void)_updateTextAttributesIfNecessary
{
  if ([(FCUIActivityPickerEducationCardView *)self _needsTextAttributesUpdate])
  {
    [(FCUIActivityPickerEducationCardView *)self _updateTextAttributes];
  }
}

- (void)_configureBackgroundMaterialViewIfNecessary
{
  if (!self->_backgroundMaterialView)
  {
    objc_super v3 = [MEMORY[0x263F53FE8] materialViewWithRecipe:53 options:1];
    backgroundMaterialView = self->_backgroundMaterialView;
    self->_backgroundMaterialView = v3;

    NSComparisonResult v5 = self->_backgroundMaterialView;
    [(FCUIActivityPickerEducationCardView *)self bounds];
    -[MTMaterialView setFrame:](v5, "setFrame:");
    [(FCUIActivityPickerEducationCardView *)self insertSubview:self->_backgroundMaterialView atIndex:0];
    [(MTMaterialView *)self->_backgroundMaterialView setAutoresizingMask:18];
    long long v6 = self->_backgroundMaterialView;
    [(MTMaterialView *)v6 _setContinuousCornerRadius:37.0];
  }
}

- (void)_configureHeadlineLabelIfNecessary
{
  if (!self->_headlineLabel)
  {
    objc_super v3 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    headlineLabel = self->_headlineLabel;
    self->_headlineLabel = v3;

    [(UILabel *)self->_headlineLabel setNumberOfLines:0];
    [(UILabel *)self->_headlineLabel setTextAlignment:1];
    [(UILabel *)self->_headlineLabel setLineBreakMode:4];
    NSComparisonResult v5 = self->_headlineLabel;
    long long v6 = [MEMORY[0x263F825C8] labelColor];
    [(UILabel *)v5 setTextColor:v6];

    [(FCUIActivityPickerEducationCardView *)self addSubview:self->_headlineLabel];
    [(FCUIActivityPickerEducationCardView *)self _updateTextAttributesForHeadlineLabel];
  }
}

- (void)_configureBodyLabelIfNecessary
{
  if (!self->_bodyLabel)
  {
    objc_super v3 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    bodyLabel = self->_bodyLabel;
    self->_bodyLabel = v3;

    [(UILabel *)self->_bodyLabel setNumberOfLines:0];
    [(UILabel *)self->_bodyLabel setTextAlignment:1];
    [(UILabel *)self->_bodyLabel setLineBreakMode:4];
    NSComparisonResult v5 = self->_bodyLabel;
    long long v6 = [MEMORY[0x263F825C8] secondaryLabelColor];
    [(UILabel *)v5 setTextColor:v6];

    [(FCUIActivityPickerEducationCardView *)self addSubview:self->_bodyLabel];
    [(FCUIActivityPickerEducationCardView *)self _updateTextAttributesForBodyLabel];
  }
}

- (void)_configureDismissControlIfNecessaryWithAction:(id)a3
{
  if (!self->_dismissControl)
  {
    id v4 = a3;
    NSComparisonResult v5 = [[_FCUIActivityPickerOnboardingDismissControl alloc] initWithAction:v4];

    dismissControl = self->_dismissControl;
    self->_dismissControl = v5;

    id v7 = self->_dismissControl;
    [(FCUIActivityPickerEducationCardView *)self addSubview:v7];
  }
}

- (void)_handleDefaultTap:(id)a3
{
  defaultAction = self->_defaultAction;
  if (defaultAction) {
    [(UIAction *)defaultAction performWithSender:self target:0];
  }
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (NSString)preferredContentSizeCategory
{
  return self->_preferredContentSizeCategory;
}

- (void)setPreferredContentSizeCategory:(id)a3
{
}

- (UIView)prominentView
{
  return self->_prominentView;
}

- (NSString)headlineText
{
  return self->_headlineText;
}

- (NSString)bodyText
{
  return self->_bodyText;
}

- (UIAction)defaultAction
{
  return self->_defaultAction;
}

- (UIAction)dismissAction
{
  return self->_dismissAction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissAction, 0);
  objc_storeStrong((id *)&self->_defaultAction, 0);
  objc_storeStrong((id *)&self->_bodyText, 0);
  objc_storeStrong((id *)&self->_headlineText, 0);
  objc_storeStrong((id *)&self->_preferredContentSizeCategory, 0);
  objc_storeStrong((id *)&self->_drawingContext, 0);
  objc_storeStrong((id *)&self->_dismissControl, 0);
  objc_storeStrong((id *)&self->_defaultTapGesture, 0);
  objc_storeStrong((id *)&self->_bodyLabel, 0);
  objc_storeStrong((id *)&self->_headlineLabel, 0);
  objc_storeStrong((id *)&self->_prominentView, 0);
  objc_storeStrong((id *)&self->_backgroundMaterialView, 0);
}

@end