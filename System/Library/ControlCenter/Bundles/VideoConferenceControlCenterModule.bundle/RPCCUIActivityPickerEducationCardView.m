@interface RPCCUIActivityPickerEducationCardView
+ (id)_preferredFont:(BOOL)a3 textStyle:(id)a4 weight:(double)a5 additionalTraits:(unsigned int)a6;
+ (id)defaultEducationCardViewActivityIdentifiers;
+ (id)defaultEducationCardViewWithDismissAction:(id)a3;
- (BOOL)_needsTextAttributesUpdate;
- (BOOL)adjustForContentSizeCategoryChange;
- (BOOL)adjustsFontForContentSizeCategory;
- (BOOL)shouldCreateVideoPreview;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)bodyText;
- (NSString)headlineText;
- (NSString)preferredContentSizeCategory;
- (RPCCUIActivityPickerEducationCardView)initWithHeadlineText:(id)a3 bodyText:(id)a4 dismissAction:(id)a5;
- (UIAction)defaultAction;
- (UIAction)dismissAction;
- (UIView)prominentView;
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
- (void)setFrame:(CGRect)a3;
- (void)setPreferredContentSizeCategory:(id)a3;
- (void)setShouldCreateVideoPreview:(BOOL)a3;
@end

@implementation RPCCUIActivityPickerEducationCardView

+ (id)defaultEducationCardViewActivityIdentifiers
{
  return &off_6B3A8;
}

+ (id)defaultEducationCardViewWithDismissAction:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  v6 = +[NSBundle bundleForClass:objc_opt_class()];
  v7 = [v6 localizedStringForKey:@"ACTIVITY_ONBOARDING_HEADLINE" value:&stru_69FF8 table:0];
  v8 = +[NSBundle bundleForClass:objc_opt_class()];
  v9 = [v8 localizedStringForKey:@"ACTIVITY_ONBOARDING_BODY" value:&stru_69FF8 table:0];
  id v10 = [v5 initWithHeadlineText:v7 bodyText:v9 dismissAction:v4];

  return v10;
}

- (RPCCUIActivityPickerEducationCardView)initWithHeadlineText:(id)a3 bodyText:(id)a4 dismissAction:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)RPCCUIActivityPickerEducationCardView;
  v11 = [(RPCCUIActivityPickerEducationCardView *)&v19 init];
  v12 = v11;
  if (v11)
  {
    [(RPCCUIActivityPickerEducationCardView *)v11 setAdjustsFontForContentSizeCategory:1];
    [(RPCCUIActivityPickerEducationCardView *)v12 _configureHeadlineLabelIfNecessary];
    [(UILabel *)v12->_headlineLabel setText:v8];
    [(RPCCUIActivityPickerEducationCardView *)v12 _configureBodyLabelIfNecessary];
    [(UILabel *)v12->_bodyLabel setText:v9];
    [(RPCCUIActivityPickerEducationCardView *)v12 _configureDismissControlIfNecessaryWithAction:v10];
    [(RPCCUIActivityPickerEducationCardView *)v12 setClipsToBounds:1];
    v13 = (void *)RPCCUILogModule;
    if (os_log_type_enabled((os_log_t)RPCCUILogModule, OS_LOG_TYPE_DEFAULT))
    {
      prominentView = v12->_prominentView;
      v15 = v13;
      [(UIView *)prominentView frame];
      v16 = NSStringFromCGRect(v24);
      [(RPCCUIActivityPickerEducationCardView *)v12 frame];
      v17 = NSStringFromCGRect(v25);
      *(_DWORD *)buf = 138412546;
      v21 = v16;
      __int16 v22 = 2112;
      v23 = v17;
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "ActivityPickerEducationCardView init prominentViewFrame=%@ self.frame=%@", buf, 0x16u);
    }
  }

  return v12;
}

- (void)setDefaultAction:(id)a3
{
  id v10 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    id v4 = (UIAction *)[v10 copy];
    defaultAction = self->_defaultAction;
    self->_defaultAction = v4;

    defaultTapGesture = self->_defaultTapGesture;
    if (self->_defaultAction)
    {
      if (!defaultTapGesture)
      {
        v7 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_handleDefaultTap:"];
        id v8 = self->_defaultTapGesture;
        self->_defaultTapGesture = v7;

        [(RPCCUIActivityPickerEducationCardView *)self addGestureRecognizer:self->_defaultTapGesture];
      }
    }
    else
    {
      [(RPCCUIActivityPickerEducationCardView *)self removeGestureRecognizer:defaultTapGesture];
      id v9 = self->_defaultTapGesture;
      self->_defaultTapGesture = 0;
    }
  }
}

- (void)_layoutSubviewInBounds:(CGRect)a3 measuringOnly:(CGSize *)a4
{
  if (a4)
  {
    CGFloat height = a3.size.height;
    CGFloat width = a3.size.width;
    CGFloat y = a3.origin.y;
    CGFloat x = a3.origin.x;
    CGRectGetWidth(a3);
    v19.origin.CGFloat x = x;
    v19.origin.CGFloat y = y;
    v19.size.CGFloat width = width;
    v19.size.CGFloat height = height;
    CGRectGetWidth(v19);
    UISizeRoundToScale();
    a4->CGFloat width = v9;
    a4->CGFloat height = v10;
    v11 = (void *)RPCCUILogModule;
    if (os_log_type_enabled((os_log_t)RPCCUILogModule, OS_LOG_TYPE_DEFAULT))
    {
      CGFloat v12 = a4->width;
      CGFloat v13 = a4->height;
      v14 = v11;
      v18.CGFloat width = v12;
      v18.CGFloat height = v13;
      v15 = NSStringFromCGSize(v18);
      int v16 = 138412290;
      v17 = v15;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "educationCardView _layoutSubviewInBounds %@", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  v6 = (void *)RPCCUILogModule;
  if (os_log_type_enabled((os_log_t)RPCCUILogModule, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    v14.CGFloat width = width;
    v14.CGFloat height = height;
    id v8 = NSStringFromCGSize(v14);
    *(_DWORD *)buf = 138412290;
    CGFloat v13 = v8;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "educationCardView sizeThatFits %@", buf, 0xCu);
  }
  CGSize v11 = CGSizeZero;
  BSRectWithSize();
  -[RPCCUIActivityPickerEducationCardView _layoutSubviewInBounds:measuringOnly:](self, "_layoutSubviewInBounds:measuringOnly:", &v11);
  double v10 = v11.height;
  double v9 = v11.width;
  result.CGFloat height = v10;
  result.CGFloat width = v9;
  return result;
}

- (void)layoutSubviews
{
  v3 = (void *)RPCCUILogModule;
  if (os_log_type_enabled((os_log_t)RPCCUILogModule, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    [(RPCCUIActivityPickerEducationCardView *)self frame];
    id v5 = NSStringFromCGRect(v9);
    *(_DWORD *)buf = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "educationCardView layoutSubviews self frame=%@", buf, 0xCu);
  }
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_2D398;
  v6[3] = &unk_68F10;
  v6[4] = self;
  +[UIView performWithoutAnimation:v6];
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = (void *)RPCCUILogModule;
  if (os_log_type_enabled((os_log_t)RPCCUILogModule, OS_LOG_TYPE_DEFAULT))
  {
    CGRect v9 = v8;
    [(RPCCUIActivityPickerEducationCardView *)self frame];
    double v10 = NSStringFromCGRect(v17);
    v18.origin.double x = x;
    v18.origin.double y = y;
    v18.size.double width = width;
    v18.size.double height = height;
    CGSize v11 = NSStringFromCGRect(v18);
    *(_DWORD *)buf = 138412546;
    CGSize v14 = v10;
    __int16 v15 = 2112;
    int v16 = v11;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "educationCardView setFrame previous=%@ new=%@", buf, 0x16u);
  }
  v12.receiver = self;
  v12.super_class = (Class)RPCCUIActivityPickerEducationCardView;
  -[RPCCUIActivityPickerEducationCardView setFrame:](&v12, "setFrame:", x, y, width, height);
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  if (self->_adjustsFontForContentSizeCategory != a3)
  {
    self->_adjustsFontForContentSizeCategordouble y = a3;
    -[_RPCCUIActivityPickerOnboardingDismissControl setAdjustsFontForContentSizeCategory:](self->_dismissControl, "setAdjustsFontForContentSizeCategory:");
    [(RPCCUIActivityPickerEducationCardView *)self _setNeedsTextAttributesUpdate];
  }
}

- (BOOL)adjustForContentSizeCategoryChange
{
  v3 = [(RPCCUIActivityPickerEducationCardView *)self traitCollection];
  id v4 = [v3 preferredContentSizeCategory];

  NSComparisonResult v5 = UIContentSizeCategoryCompareToCategory(v4, self->_preferredContentSizeCategory);
  if (v5)
  {
    objc_storeStrong((id *)&self->_preferredContentSizeCategory, v4);
    [(RPCCUIActivityPickerEducationCardView *)self _setNeedsTextAttributesUpdate];
    [(_RPCCUIActivityPickerOnboardingDismissControl *)self->_dismissControl adjustForContentSizeCategoryChange];
  }

  return v5 != NSOrderedSame;
}

+ (id)_preferredFont:(BOOL)a3 textStyle:(id)a4 weight:(double)a5 additionalTraits:(unsigned int)a6
{
  if (a3) {
    +[UIFontDescriptor preferredFontDescriptorWithTextStyle:a4 addingSymbolicTraits:*(void *)&a6 options:0];
  }
  else {
  v7 = +[UIFontDescriptor defaultFontDescriptorWithTextStyle:a4 addingSymbolicTraits:*(void *)&a6 options:0];
  }
  UIFontDescriptorAttributeName v16 = UIFontDescriptorTraitsAttribute;
  UIFontDescriptorTraitKey v14 = UIFontWeightTrait;
  id v8 = +[NSNumber numberWithDouble:a5];
  __int16 v15 = v8;
  CGRect v9 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  CGRect v17 = v9;
  double v10 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  CGSize v11 = [v7 fontDescriptorByAddingAttributes:v10];

  objc_super v12 = +[UIFont fontWithDescriptor:v11 size:0.0];

  return v12;
}

- (void)_updateTextAttributesForHeadlineLabel
{
  headlineLabel = self->_headlineLabel;
  if (headlineLabel)
  {
    id v4 = [(id)objc_opt_class() _preferredFont:1 textStyle:UIFontTextStyleTitle3 weight:0x8000 additionalTraits:UIFontWeightBold];
    [(UILabel *)headlineLabel setFont:v4];

    [(RPCCUIActivityPickerEducationCardView *)self setNeedsLayout];
  }
}

- (void)_updateTextAttributesForBodyLabel
{
  bodyLabel = self->_bodyLabel;
  if (bodyLabel)
  {
    id v4 = [(id)objc_opt_class() _preferredFont:1 textStyle:UIFontTextStyleSubheadline weight:0x8000 additionalTraits:UIFontWeightRegular];
    [(UILabel *)bodyLabel setFont:v4];

    [(RPCCUIActivityPickerEducationCardView *)self setNeedsLayout];
  }
}

- (BOOL)_needsTextAttributesUpdate
{
  return !self->_textAttributesValid;
}

- (void)_setNeedsTextAttributesUpdate
{
  self->_textAttributesValid = 0;
  [(RPCCUIActivityPickerEducationCardView *)self setNeedsLayout];
}

- (void)_updateTextAttributes
{
  self->_textAttributesValid = 1;
  [(RPCCUIActivityPickerEducationCardView *)self _updateTextAttributesForHeadlineLabel];

  [(RPCCUIActivityPickerEducationCardView *)self _updateTextAttributesForBodyLabel];
}

- (void)_updateTextAttributesIfNecessary
{
  if ([(RPCCUIActivityPickerEducationCardView *)self _needsTextAttributesUpdate])
  {
    [(RPCCUIActivityPickerEducationCardView *)self _updateTextAttributes];
  }
}

- (void)_configureHeadlineLabelIfNecessary
{
  if (!self->_headlineLabel)
  {
    v3 = (UILabel *)objc_alloc_init((Class)UILabel);
    headlineLabel = self->_headlineLabel;
    self->_headlineLabel = v3;

    [(UILabel *)self->_headlineLabel setNumberOfLines:0];
    [(UILabel *)self->_headlineLabel setTextAlignment:1];
    [(UILabel *)self->_headlineLabel setLineBreakMode:4];
    NSComparisonResult v5 = self->_headlineLabel;
    v6 = +[UIColor labelColor];
    [(UILabel *)v5 setTextColor:v6];

    [(RPCCUIActivityPickerEducationCardView *)self addSubview:self->_headlineLabel];
    [(RPCCUIActivityPickerEducationCardView *)self _updateTextAttributesForHeadlineLabel];
  }
}

- (void)_configureBodyLabelIfNecessary
{
  if (!self->_bodyLabel)
  {
    v3 = (UILabel *)objc_alloc_init((Class)UILabel);
    bodyLabel = self->_bodyLabel;
    self->_bodyLabel = v3;

    [(UILabel *)self->_bodyLabel setNumberOfLines:0];
    [(UILabel *)self->_bodyLabel setTextAlignment:1];
    [(UILabel *)self->_bodyLabel setLineBreakMode:4];
    NSComparisonResult v5 = self->_bodyLabel;
    v6 = +[UIColor secondaryLabelColor];
    [(UILabel *)v5 setTextColor:v6];

    [(RPCCUIActivityPickerEducationCardView *)self addSubview:self->_bodyLabel];
    [(RPCCUIActivityPickerEducationCardView *)self _updateTextAttributesForBodyLabel];
  }
}

- (void)_configureDismissControlIfNecessaryWithAction:(id)a3
{
  if (!self->_dismissControl)
  {
    id v4 = a3;
    NSComparisonResult v5 = [[_RPCCUIActivityPickerOnboardingDismissControl alloc] initWithAction:v4];

    dismissControl = self->_dismissControl;
    self->_dismissControl = v5;

    v7 = self->_dismissControl;
    [(RPCCUIActivityPickerEducationCardView *)self addSubview:v7];
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

- (BOOL)shouldCreateVideoPreview
{
  return self->_shouldCreateVideoPreview;
}

- (void)setShouldCreateVideoPreview:(BOOL)a3
{
  self->_shouldCreateVideoPreview = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissAction, 0);
  objc_storeStrong((id *)&self->_defaultAction, 0);
  objc_storeStrong((id *)&self->_bodyText, 0);
  objc_storeStrong((id *)&self->_headlineText, 0);
  objc_storeStrong((id *)&self->_prominentView, 0);
  objc_storeStrong((id *)&self->_preferredContentSizeCategory, 0);
  objc_storeStrong((id *)&self->_drawingContext, 0);
  objc_storeStrong((id *)&self->_dismissControl, 0);
  objc_storeStrong((id *)&self->_defaultTapGesture, 0);
  objc_storeStrong((id *)&self->_bodyLabel, 0);

  objc_storeStrong((id *)&self->_headlineLabel, 0);
}

@end