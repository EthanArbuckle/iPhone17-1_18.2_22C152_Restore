@interface AKCodeEntryView
+ (id)generatorFieldFont;
- (AKCodeEntryView)initWithFrame:(CGRect)a3;
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)hasText;
- (BOOL)isSecureTextEntry;
- (NSArray)activeConstraints;
- (NSArray)generatorFields;
- (NSString)stringValue;
- (UILabel)firstGeneratorField;
- (id)viewForFirstBaselineLayout;
- (id)viewForLastBaselineLayout;
- (int64_t)keyboardAppearance;
- (int64_t)keyboardType;
- (void)_syncStringValueToLabels;
- (void)_updateFonts:(id)a3;
- (void)dealloc;
- (void)deleteBackward;
- (void)emitCodeEnteredNotification;
- (void)insertText:(id)a3;
- (void)passcodeFieldTapped:(id)a3;
- (void)setActiveConstraints:(id)a3;
- (void)setGeneratorFields:(id)a3;
- (void)setPasscodeFieldDisabled:(BOOL)a3;
- (void)setStringValue:(id)a3;
- (void)updateConstraints;
@end

@implementation AKCodeEntryView

- (AKCodeEntryView)initWithFrame:(CGRect)a3
{
  v25.receiver = self;
  v25.super_class = (Class)AKCodeEntryView;
  v3 = -[AKCodeEntryView initWithFrame:](&v25, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(AKCodeEntryView *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
    v5 = (NSMutableString *)objc_alloc_init((Class)NSMutableString);
    stringValue = v4->_stringValue;
    v4->_stringValue = v5;

    id v7 = objc_alloc_init((Class)NSMutableArray);
    v8 = [(id)objc_opt_class() generatorFieldFont];
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    uint64_t v12 = 6;
    do
    {
      id v13 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
      [v13 setTranslatesAutoresizingMaskIntoConstraints:0];
      [v13 setFont:v8];
      [v13 setText:@"–"];
      [v13 setTextAlignment:1];
      v14 = [v13 layer];
      objc_msgSend(v14, "setDisableUpdateMask:", objc_msgSend(v14, "disableUpdateMask") | 0x12);

      [(AKCodeEntryView *)v4 addSubview:v13];
      [v7 addObject:v13];

      --v12;
    }
    while (v12);
    v15 = (NSArray *)[v7 copy];
    generatorFields = v4->_generatorFields;
    v4->_generatorFields = v15;

    LODWORD(v17) = 1144750080;
    [(AKCodeEntryView *)v4 setContentCompressionResistancePriority:0 forAxis:v17];
    LODWORD(v18) = 1144750080;
    [(AKCodeEntryView *)v4 setContentHuggingPriority:0 forAxis:v18];
    LODWORD(v19) = 1144750080;
    [(AKCodeEntryView *)v4 setContentCompressionResistancePriority:1 forAxis:v19];
    LODWORD(v20) = 1132068864;
    [(AKCodeEntryView *)v4 setContentHuggingPriority:1 forAxis:v20];
    v21 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:v4 action:"passcodeFieldTapped:"];
    tapGestureRecognizer = v4->_tapGestureRecognizer;
    v4->_tapGestureRecognizer = v21;

    [(AKCodeEntryView *)v4 addGestureRecognizer:v4->_tapGestureRecognizer];
    v4->_passcodeFieldDisabled = 0;
    v23 = +[NSNotificationCenter defaultCenter];
    [v23 addObserver:v4 selector:"_updateFonts:" name:UIContentSizeCategoryDidChangeNotification object:0];
  }
  return v4;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:UIContentSizeCategoryDidChangeNotification object:0];

  v4.receiver = self;
  v4.super_class = (Class)AKCodeEntryView;
  [(AKCodeEntryView *)&v4 dealloc];
}

- (void)_updateFonts:(id)a3
{
  objc_super v4 = [(id)objc_opt_class() generatorFieldFont];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_generatorFields;
  id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
      id v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  [(AKCodeEntryView *)self setNeedsUpdateConstraints];
}

- (void)_syncStringValueToLabels
{
  for (unint64_t i = 0; i != 6; ++i)
  {
    if (i >= (unint64_t)[(NSMutableString *)self->_stringValue length])
    {
      objc_super v4 = [(NSArray *)self->_generatorFields objectAtIndexedSubscript:i];
      [v4 setText:@"–"];
    }
    else
    {
      objc_super v4 = -[NSMutableString substringWithRange:](self->_stringValue, "substringWithRange:", i, 1);
      v5 = [(NSArray *)self->_generatorFields objectAtIndexedSubscript:i];
      [v5 setText:v4];
    }
  }

  [(AKCodeEntryView *)self setNeedsUpdateConstraints];
}

- (void)updateConstraints
{
  if (self->_activeConstraints) {
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:");
  }
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  for (uint64_t i = 0; i != 6; ++i)
  {
    if (i)
    {
      id v6 = [(NSArray *)self->_generatorFields objectAtIndexedSubscript:i];
      id v7 = [(NSArray *)self->_generatorFields firstObject];
      uint64_t v8 = +[NSLayoutConstraint constraintWithItem:v6 attribute:11 relatedBy:0 toItem:v7 attribute:11 multiplier:1.0 constant:0.0];
      [v3 addObject:v8];
    }
    else
    {
      CFStringRef v19 = @"generatorLabel";
      id v6 = [(NSArray *)self->_generatorFields objectAtIndexedSubscript:0];
      double v20 = v6;
      id v7 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
      uint64_t v8 = +[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[generatorLabel]|" options:0 metrics:0 views:v7];
      [v3 addObjectsFromArray:v8];
    }

    v9 = [(NSArray *)self->_generatorFields objectAtIndexedSubscript:i];
    long long v10 = +[UIFontMetrics metricsForTextStyle:UIFontTextStyleTitle1];
    [v10 scaledValueForValue:14.5];
    long long v12 = +[NSLayoutConstraint constraintWithItem:v9 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:v11];
    [v3 addObject:v12];

    long long v13 = [(NSArray *)self->_generatorFields objectAtIndexedSubscript:i];
    v14 = +[NSString stringWithFormat:@"codeGeneratorLabel%d", i];
    [v4 setObject:v13 forKey:v14];
  }
  v15 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"|[codeGeneratorLabel0]-(DIGIT_SPACING)-[codeGeneratorLabel1]-(DIGIT_SPACING)-[codeGeneratorLabel2]-(GROUP_SEPARATOR_SPACING)-[codeGeneratorLabel3]-(DIGIT_SPACING)-[codeGeneratorLabel4]-(DIGIT_SPACING)-[codeGeneratorLabel5]|", 0x10000, &off_1000086F0, v4);
  [v3 addObjectsFromArray:v15];
  v16 = (NSArray *)[v3 copy];
  activeConstraints = self->_activeConstraints;
  self->_activeConstraints = v16;

  +[NSLayoutConstraint activateConstraints:self->_activeConstraints];
  v18.receiver = self;
  v18.super_class = (Class)AKCodeEntryView;
  [(AKCodeEntryView *)&v18 updateConstraints];
}

- (id)viewForFirstBaselineLayout
{
  return [(AKCodeEntryView *)self firstGeneratorField];
}

- (id)viewForLastBaselineLayout
{
  return [(AKCodeEntryView *)self firstGeneratorField];
}

- (UILabel)firstGeneratorField
{
  return (UILabel *)[(NSArray *)self->_generatorFields firstObject];
}

- (void)emitCodeEnteredNotification
{
  id v3 = +[NSNotificationCenter defaultCenter];
  CFStringRef v6 = @"generatedCode";
  id v4 = [(AKCodeEntryView *)self stringValue];
  id v7 = v4;
  v5 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  [v3 postNotificationName:@"AKSecondFactorCodeEntryContentViewControllerDidEnterCodeNotification" object:0 userInfo:v5];
}

- (NSString)stringValue
{
  id v2 = [(NSMutableString *)self->_stringValue copy];

  return (NSString *)v2;
}

- (void)setStringValue:(id)a3
{
  stringValue = self->_stringValue;
  id v5 = [a3 copy];
  [(NSMutableString *)stringValue setString:v5];

  [(AKCodeEntryView *)self _syncStringValueToLabels];
  if ([(NSMutableString *)self->_stringValue length] == (id)6)
  {
    [(id)objc_opt_class() cancelPreviousPerformRequestsWithTarget:self selector:"emitCodeEnteredNotification" object:0];
    [(AKCodeEntryView *)self performSelector:"emitCodeEnteredNotification" withObject:0 afterDelay:1.0];
  }
}

- (BOOL)canBecomeFirstResponder
{
  return !self->_passcodeFieldDisabled;
}

- (BOOL)becomeFirstResponder
{
  v5.receiver = self;
  v5.super_class = (Class)AKCodeEntryView;
  BOOL v2 = [(AKCodeEntryView *)&v5 becomeFirstResponder];
  if (v2)
  {
    id v3 = +[UIKeyboard activeKeyboard];
    [v3 setReturnKeyEnabled:0];
  }
  return v2;
}

- (int64_t)keyboardType
{
  return 4;
}

- (int64_t)keyboardAppearance
{
  return 1;
}

- (void)insertText:(id)a3
{
  id v6 = a3;
  if ([(NSMutableString *)self->_stringValue length] != (id)6
    && ([v6 isEqualToString:@"\n"] & 1) == 0)
  {
    id v4 = +[NSCharacterSet decimalDigitCharacterSet];
    objc_super v5 = [v4 invertedSet];

    if ([v6 rangeOfCharacterFromSet:v5] == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      if ([v6 length])
      {
        [(NSMutableString *)self->_stringValue appendString:v6];
        [(AKCodeEntryView *)self _syncStringValueToLabels];
        if ([(NSMutableString *)self->_stringValue length] == (id)6)
        {
          [(id)objc_opt_class() cancelPreviousPerformRequestsWithTarget:self selector:"emitCodeEnteredNotification" object:0];
          [(AKCodeEntryView *)self performSelector:"emitCodeEnteredNotification" withObject:0 afterDelay:1.0];
        }
      }
    }
  }
}

- (BOOL)hasText
{
  return [(NSMutableString *)self->_stringValue length] != 0;
}

- (void)deleteBackward
{
  if ([(NSMutableString *)self->_stringValue length])
  {
    -[NSMutableString deleteCharactersInRange:](self->_stringValue, "deleteCharactersInRange:", (char *)[(NSMutableString *)self->_stringValue length] - 1, 1);
    [(id)objc_opt_class() cancelPreviousPerformRequestsWithTarget:self selector:"emitCodeEnteredNotification" object:0];
    [(AKCodeEntryView *)self _syncStringValueToLabels];
  }
}

- (void)passcodeFieldTapped:(id)a3
{
  if ([(AKCodeEntryView *)self canBecomeFirstResponder])
  {
    [(AKCodeEntryView *)self becomeFirstResponder];
  }
}

- (void)setPasscodeFieldDisabled:(BOOL)a3
{
  self->_passcodeFieldDisabled = a3;
}

- (BOOL)isSecureTextEntry
{
  return 1;
}

+ (id)generatorFieldFont
{
  BOOL v2 = +[UIFontMetrics metricsForTextStyle:UIFontTextStyleTitle1];
  [v2 scaledValueForValue:24.0];
  double v4 = v3;

  objc_super v5 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleTitle1 addingSymbolicTraits:0 options:2];
  id v6 = +[UIFont fontWithDescriptor:v5 size:v4];

  return v6;
}

- (NSArray)generatorFields
{
  return self->_generatorFields;
}

- (void)setGeneratorFields:(id)a3
{
}

- (NSArray)activeConstraints
{
  return self->_activeConstraints;
}

- (void)setActiveConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeConstraints, 0);
  objc_storeStrong((id *)&self->_generatorFields, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);

  objc_storeStrong((id *)&self->_stringValue, 0);
}

@end