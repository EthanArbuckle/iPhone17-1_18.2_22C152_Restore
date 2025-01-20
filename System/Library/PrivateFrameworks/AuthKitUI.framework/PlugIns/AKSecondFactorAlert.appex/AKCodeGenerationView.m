@interface AKCodeGenerationView
+ (id)_generatorLabelFont;
- (AKCodeGenerationView)initWithGeneratedCode:(id)a3;
- (NSString)generatedCode;
- (id)viewForFirstBaselineLayout;
- (id)viewForLastBaselineLayout;
- (void)_updateFonts:(id)a3;
- (void)dealloc;
@end

@implementation AKCodeGenerationView

- (AKCodeGenerationView)initWithGeneratedCode:(id)a3
{
  id v5 = a3;
  v28.receiver = self;
  v28.super_class = (Class)AKCodeGenerationView;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v9 = -[AKCodeGenerationView initWithFrame:](&v28, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  if (v9)
  {
    id v27 = v5;
    v10 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    generatorLabels = v9->_generatorLabels;
    v9->_generatorLabels = v10;

    objc_storeStrong((id *)&v9->_generatedCode, a3);
    [(AKCodeGenerationView *)v9 setTranslatesAutoresizingMaskIntoConstraints:0];
    v12 = [(id)objc_opt_class() _generatorLabelFont];
    id v13 = objc_alloc_init((Class)NSMutableDictionary);
    for (uint64_t i = 0; i != 6; ++i)
    {
      id v15 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
      [v15 setTranslatesAutoresizingMaskIntoConstraints:0];
      [v15 setFont:v12];
      v16 = -[NSString substringWithRange:](v9->_generatedCode, "substringWithRange:", i, 1);
      [v15 setText:v16];

      [(AKCodeGenerationView *)v9 addSubview:v15];
      if (i)
      {
        v17 = [(NSMutableArray *)v9->_generatorLabels firstObject];
        v18 = +[NSLayoutConstraint constraintWithItem:v15 attribute:11 relatedBy:0 toItem:v17 attribute:11 multiplier:1.0 constant:0.0];
        [v18 setActive:1];
      }
      else
      {
        CFStringRef v29 = @"generatorLabel";
        id v30 = v15;
        v17 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
        v18 = +[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[generatorLabel]|" options:0 metrics:0 views:v17];
        +[NSLayoutConstraint activateConstraints:v18];
      }

      v19 = +[NSString stringWithFormat:@"codeGeneratorLabel%d", i];
      [v13 setObject:v15 forKey:v19];

      [(NSMutableArray *)v9->_generatorLabels addObject:v15];
    }
    v20 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"|[codeGeneratorLabel0]-(DIGIT_SPACING)-[codeGeneratorLabel1]-(DIGIT_SPACING)-[codeGeneratorLabel2]-(GROUP_SEPARATOR_SPACING)-[codeGeneratorLabel3]-(DIGIT_SPACING)-[codeGeneratorLabel4]-(DIGIT_SPACING)-[codeGeneratorLabel5]|", 0x10000, &off_100004380, v13);
    +[NSLayoutConstraint activateConstraints:v20];
    LODWORD(v21) = 1144750080;
    [(AKCodeGenerationView *)v9 setContentCompressionResistancePriority:0 forAxis:v21];
    LODWORD(v22) = 1144750080;
    [(AKCodeGenerationView *)v9 setContentHuggingPriority:0 forAxis:v22];
    LODWORD(v23) = 1144750080;
    [(AKCodeGenerationView *)v9 setContentCompressionResistancePriority:1 forAxis:v23];
    LODWORD(v24) = 1132068864;
    [(AKCodeGenerationView *)v9 setContentHuggingPriority:1 forAxis:v24];
    v25 = +[NSNotificationCenter defaultCenter];
    [v25 addObserver:v9 selector:"_updateFonts:" name:UIContentSizeCategoryDidChangeNotification object:0];

    id v5 = v27;
  }

  return v9;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:UIContentSizeCategoryDidChangeNotification object:0];

  v4.receiver = self;
  v4.super_class = (Class)AKCodeGenerationView;
  [(AKCodeGenerationView *)&v4 dealloc];
}

- (void)_updateFonts:(id)a3
{
  objc_super v4 = [(id)objc_opt_class() _generatorLabelFont];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_generatorLabels;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * (void)v9), "setFont:", v4, (void)v10);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  [(AKCodeGenerationView *)self setNeedsLayout];
}

- (id)viewForFirstBaselineLayout
{
  return [(NSMutableArray *)self->_generatorLabels firstObject];
}

- (id)viewForLastBaselineLayout
{
  return [(NSMutableArray *)self->_generatorLabels firstObject];
}

+ (id)_generatorLabelFont
{
  v2 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  v3 = [UIApp preferredContentSizeCategory];
  uint64_t v4 = _UIContentSizeCategoryCompareToContentSizeCategory();

  if (v4 != -1)
  {
    id v5 = +[UITraitCollection traitCollectionWithPreferredContentSizeCategory:UIContentSizeCategoryAccessibilityExtraLarge];
    uint64_t v6 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody compatibleWithTraitCollection:v5];

    v2 = (void *)v6;
  }
  id v7 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleTitle1 addingSymbolicTraits:0 options:2];
  [v2 _scaledValueForValue:24.0];
  uint64_t v8 = +[UIScreen mainScreen];
  UIRoundToScreenScale();
  v9 = +[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v7);

  return v9;
}

- (NSString)generatedCode
{
  return self->_generatedCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generatedCode, 0);

  objc_storeStrong((id *)&self->_generatorLabels, 0);
}

@end