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
  v26.receiver = self;
  v26.super_class = (Class)AKCodeEntryView;
  v3 = -[AKCodeEntryView initWithFrame:](&v26, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(AKCodeEntryView *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
    v5 = (NSMutableString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
    stringValue = v4->_stringValue;
    v4->_stringValue = v5;

    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v8 = [(id)objc_opt_class() generatorFieldFont];
    double v9 = *MEMORY[0x1E4F1DB28];
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v13 = 6;
    do
    {
      v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42B38]), "initWithFrame:", v9, v10, v11, v12);
      [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
      [v14 setFont:v8];
      [v14 setText:@"–"];
      [v14 setTextAlignment:1];
      v15 = [v14 layer];
      objc_msgSend(v15, "setDisableUpdateMask:", objc_msgSend(v15, "disableUpdateMask") | 0x12);

      [(AKCodeEntryView *)v4 addSubview:v14];
      [v7 addObject:v14];

      --v13;
    }
    while (v13);
    uint64_t v16 = [v7 copy];
    generatorFields = v4->_generatorFields;
    v4->_generatorFields = (NSArray *)v16;

    LODWORD(v18) = 1144750080;
    [(AKCodeEntryView *)v4 setContentCompressionResistancePriority:0 forAxis:v18];
    LODWORD(v19) = 1144750080;
    [(AKCodeEntryView *)v4 setContentHuggingPriority:0 forAxis:v19];
    LODWORD(v20) = 1144750080;
    [(AKCodeEntryView *)v4 setContentCompressionResistancePriority:1 forAxis:v20];
    LODWORD(v21) = 1132068864;
    [(AKCodeEntryView *)v4 setContentHuggingPriority:1 forAxis:v21];
    uint64_t v22 = [objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:v4 action:sel_passcodeFieldTapped_];
    tapGestureRecognizer = v4->_tapGestureRecognizer;
    v4->_tapGestureRecognizer = (UITapGestureRecognizer *)v22;

    [(AKCodeEntryView *)v4 addGestureRecognizer:v4->_tapGestureRecognizer];
    v4->_passcodeFieldDisabled = 0;
    v24 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v24 addObserver:v4 selector:sel__updateFonts_ name:*MEMORY[0x1E4F43788] object:0];
  }
  return v4;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x1E4F43788] object:0];

  v4.receiver = self;
  v4.super_class = (Class)AKCodeEntryView;
  [(AKCodeEntryView *)&v4 dealloc];
}

- (void)_updateFonts:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  objc_super v4 = [(id)objc_opt_class() generatorFieldFont];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_generatorFields;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "setFont:", v4, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  [(AKCodeEntryView *)self setNeedsUpdateConstraints];
}

- (void)_syncStringValueToLabels
{
  for (unint64_t i = 0; i != 6; ++i)
  {
    if (i >= [(NSMutableString *)self->_stringValue length])
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
  v23[1] = *MEMORY[0x1E4F143B8];
  if (self->_activeConstraints) {
    objc_msgSend(MEMORY[0x1E4F28DC8], "deactivateConstraints:");
  }
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v5 = 0;
  uint64_t v6 = *MEMORY[0x1E4F438E8];
  do
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F28DC8];
    if (v5)
    {
      uint64_t v8 = [(NSArray *)self->_generatorFields objectAtIndexedSubscript:v5];
      uint64_t v9 = [(NSArray *)self->_generatorFields firstObject];
      long long v10 = [v7 constraintWithItem:v8 attribute:11 relatedBy:0 toItem:v9 attribute:11 multiplier:1.0 constant:0.0];
      [v3 addObject:v10];
    }
    else
    {
      uint64_t v22 = @"generatorLabel";
      uint64_t v8 = [(NSArray *)self->_generatorFields objectAtIndexedSubscript:0];
      v23[0] = v8;
      uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
      long long v10 = [v7 constraintsWithVisualFormat:@"V:|[generatorLabel]|" options:0 metrics:0 views:v9];
      [v3 addObjectsFromArray:v10];
    }

    long long v11 = (void *)MEMORY[0x1E4F28DC8];
    long long v12 = [(NSArray *)self->_generatorFields objectAtIndexedSubscript:v5];
    long long v13 = [MEMORY[0x1E4F42A40] metricsForTextStyle:v6];
    [v13 scaledValueForValue:14.5];
    uint64_t v15 = [v11 constraintWithItem:v12 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:v14];
    [v3 addObject:v15];

    uint64_t v16 = [(NSArray *)self->_generatorFields objectAtIndexedSubscript:v5];
    v17 = objc_msgSend(NSString, "stringWithFormat:", @"codeGeneratorLabel%d", v5);
    [v4 setObject:v16 forKey:v17];

    ++v5;
  }
  while (v5 != 6);
  double v18 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"|[codeGeneratorLabel0]-(DIGIT_SPACING)-[codeGeneratorLabel1]-(DIGIT_SPACING)-[codeGeneratorLabel2]-(GROUP_SEPARATOR_SPACING)-[codeGeneratorLabel3]-(DIGIT_SPACING)-[codeGeneratorLabel4]-(DIGIT_SPACING)-[codeGeneratorLabel5]|" options:0x10000 metrics:&unk_1F1F03840 views:v4];
  [v3 addObjectsFromArray:v18];
  double v19 = (NSArray *)[v3 copy];
  activeConstraints = self->_activeConstraints;
  self->_activeConstraints = v19;

  [MEMORY[0x1E4F28DC8] activateConstraints:self->_activeConstraints];
  v21.receiver = self;
  v21.super_class = (Class)AKCodeEntryView;
  [(AKCodeEntryView *)&v21 updateConstraints];
}

- (UILabel)firstGeneratorField
{
  return (UILabel *)[(NSArray *)self->_generatorFields firstObject];
}

- (void)emitCodeEnteredNotification
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v6 = @"generatedCode";
  id v4 = [(AKCodeEntryView *)self stringValue];
  v7[0] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [v3 postNotificationName:@"AKSecondFactorCodeEntryContentViewControllerDidEnterCodeNotification" object:0 userInfo:v5];
}

- (NSString)stringValue
{
  v2 = (void *)[(NSMutableString *)self->_stringValue copy];

  return (NSString *)v2;
}

- (void)setStringValue:(id)a3
{
  stringValue = self->_stringValue;
  uint64_t v5 = (void *)[a3 copy];
  [(NSMutableString *)stringValue setString:v5];

  [(AKCodeEntryView *)self _syncStringValueToLabels];
  if ([(NSMutableString *)self->_stringValue length] == 6)
  {
    [(id)objc_opt_class() cancelPreviousPerformRequestsWithTarget:self selector:sel_emitCodeEnteredNotification object:0];
    [(AKCodeEntryView *)self performSelector:sel_emitCodeEnteredNotification withObject:0 afterDelay:1.0];
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
    id v3 = [MEMORY[0x1E4F42B08] activeKeyboard];
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
  if ([(NSMutableString *)self->_stringValue length] != 6
    && ([v6 isEqualToString:@"\n"] & 1) == 0)
  {
    id v4 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
    objc_super v5 = [v4 invertedSet];

    if ([v6 rangeOfCharacterFromSet:v5] == 0x7FFFFFFFFFFFFFFFLL)
    {
      if ([v6 length])
      {
        [(NSMutableString *)self->_stringValue appendString:v6];
        [(AKCodeEntryView *)self _syncStringValueToLabels];
        if ([(NSMutableString *)self->_stringValue length] == 6)
        {
          [(id)objc_opt_class() cancelPreviousPerformRequestsWithTarget:self selector:sel_emitCodeEnteredNotification object:0];
          [(AKCodeEntryView *)self performSelector:sel_emitCodeEnteredNotification withObject:0 afterDelay:1.0];
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
    -[NSMutableString deleteCharactersInRange:](self->_stringValue, "deleteCharactersInRange:", [(NSMutableString *)self->_stringValue length] - 1, 1);
    [(id)objc_opt_class() cancelPreviousPerformRequestsWithTarget:self selector:sel_emitCodeEnteredNotification object:0];
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
  uint64_t v2 = *MEMORY[0x1E4F438E8];
  id v3 = [MEMORY[0x1E4F42A40] metricsForTextStyle:*MEMORY[0x1E4F438E8]];
  [v3 scaledValueForValue:24.0];
  double v5 = v4;

  id v6 = [MEMORY[0x1E4F42A38] preferredFontDescriptorWithTextStyle:v2 addingSymbolicTraits:0 options:2];
  uint64_t v7 = [MEMORY[0x1E4F42A30] fontWithDescriptor:v6 size:v5];

  return v7;
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