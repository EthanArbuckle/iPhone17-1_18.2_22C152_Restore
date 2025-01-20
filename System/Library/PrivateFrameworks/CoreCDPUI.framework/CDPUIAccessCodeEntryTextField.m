@interface CDPUIAccessCodeEntryTextField
+ (unint64_t)accessKeyCharacterCount;
+ (unint64_t)wrappingKeyCharacterCount;
- (BOOL)enablesReturnKeyAutomatically;
- (BOOL)isComplete;
- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (CDPUIAccessCodeEntryTextField)initWithFrame:(CGRect)a3 textContainer:(id)a4;
- (CDPUIAccessCodeEntryTextFieldDelegate)accessCodeInputDelegate;
- (NSString)placeholder;
- (UITextView)placeholderTextView;
- (id)_sanitizeInputString:(id)a3;
- (id)viewForFirstBaselineLayout;
- (id)viewForLastBaselineLayout;
- (unint64_t)_numberOfSeparators;
- (unint64_t)_totalCharacterLimit;
- (void)_handleMultiCharacterStringInput:(id)a3 range:(_NSRange)a4;
- (void)layoutSubviews;
- (void)setAccessCodeInputDelegate:(id)a3;
- (void)setFont:(id)a3;
- (void)setPlaceholder:(id)a3;
- (void)setPlaceholderTextView:(id)a3;
- (void)setText:(id)a3;
- (void)setTextAlignment:(int64_t)a3;
- (void)setupSeparatorLocations;
- (void)setupUI;
- (void)textViewDidChange:(id)a3;
- (void)updatePlaceholderVisibility;
@end

@implementation CDPUIAccessCodeEntryTextField

- (CDPUIAccessCodeEntryTextField)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)CDPUIAccessCodeEntryTextField;
  v8 = -[CDPUIAccessCodeEntryTextField initWithFrame:textContainer:](&v11, sel_initWithFrame_textContainer_, a4);
  if (v8)
  {
    v9 = objc_msgSend(objc_alloc(MEMORY[0x263F82D60]), "initWithFrame:textContainer:", 0, x, y, width, height);
    [(CDPUIAccessCodeEntryTextField *)v8 setPlaceholderTextView:v9];

    [(CDPUIAccessCodeEntryTextField *)v8 setupUI];
    [(CDPUIAccessCodeEntryTextField *)v8 setupSeparatorLocations];
  }
  return v8;
}

- (void)setupUI
{
  [(CDPUIAccessCodeEntryTextField *)self setAutocorrectionType:1];
  [(CDPUIAccessCodeEntryTextField *)self setReturnKeyType:9];
  v3 = [MEMORY[0x263F825C8] labelColor];
  [(CDPUIAccessCodeEntryTextField *)self setTextColor:v3];

  [(CDPUIAccessCodeEntryTextField *)self setSpellCheckingType:1];
  [(CDPUIAccessCodeEntryTextField *)self setAutocapitalizationType:3];
  v4 = [(CDPUIAccessCodeEntryTextField *)self placeholderTextView];
  [v4 setAutoresizingMask:18];

  v5 = [MEMORY[0x263F825C8] systemGray2Color];
  v6 = [(CDPUIAccessCodeEntryTextField *)self placeholderTextView];
  [v6 setTextColor:v5];

  v7 = [MEMORY[0x263F825C8] clearColor];
  v8 = [(CDPUIAccessCodeEntryTextField *)self placeholderTextView];
  [v8 setBackgroundColor:v7];

  v9 = [(CDPUIAccessCodeEntryTextField *)self placeholderTextView];
  [v9 setText:0];

  [(CDPUIAccessCodeEntryTextField *)self setDelegate:self];
  [(CDPUIAccessCodeEntryTextField *)self bounds];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  v18 = [(CDPUIAccessCodeEntryTextField *)self placeholderTextView];
  objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);

  v19 = [(CDPUIAccessCodeEntryTextField *)self placeholderTextView];
  [v19 setEditable:0];

  id v20 = [(CDPUIAccessCodeEntryTextField *)self placeholderTextView];
  [(CDPUIAccessCodeEntryTextField *)self addSubview:v20];
}

- (void)setupSeparatorLocations
{
  id v12 = [MEMORY[0x263EFF9C0] set];
  v3 = [MEMORY[0x263EFF9C0] set];
  if ([(CDPUIAccessCodeEntryTextField *)self _numberOfSeparators])
  {
    unint64_t v4 = 0;
    uint64_t v5 = 4;
    do
    {
      v6 = [NSNumber numberWithUnsignedInteger:v5];
      [v12 addObject:v6];

      v7 = [NSNumber numberWithUnsignedInteger:v5 + 1];
      [v3 addObject:v7];

      ++v4;
      v5 += 5;
    }
    while ([(CDPUIAccessCodeEntryTextField *)self _numberOfSeparators] > v4);
  }
  v8 = (NSSet *)[v12 copy];
  separatorLocations = self->_separatorLocations;
  self->_separatorLocations = v8;

  double v10 = (NSSet *)[v3 copy];
  separatorDeleteLocations = self->_separatorDeleteLocations;
  self->_separatorDeleteLocations = v10;
}

+ (unint64_t)accessKeyCharacterCount
{
  if (accessKeyCharacterCount_onceToken != -1) {
    dispatch_once(&accessKeyCharacterCount_onceToken, &__block_literal_global_3);
  }
  return accessKeyCharacterCount_textInputLength;
}

void __56__CDPUIAccessCodeEntryTextField_accessKeyCharacterCount__block_invoke()
{
  CDPLocalizedString();
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  v0 = [v1 stringByReplacingOccurrencesOfString:@"-" withString:&stru_26C9EBCA0];
  accessKeyCharacterCount_textInputLength = [v0 length];
}

+ (unint64_t)wrappingKeyCharacterCount
{
  return 69;
}

- (BOOL)isComplete
{
  v2 = self;
  v3 = [(CDPUIAccessCodeEntryTextField *)self text];
  uint64_t v4 = [v3 length];
  LOBYTE(v2) = v4 == [(CDPUIAccessCodeEntryTextField *)v2 _totalCharacterLimit];

  return (char)v2;
}

- (BOOL)enablesReturnKeyAutomatically
{
  return 1;
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)CDPUIAccessCodeEntryTextField;
  [(CDPUIAccessCodeEntryTextField *)&v13 layoutSubviews];
  [(CDPUIAccessCodeEntryTextField *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(CDPUIAccessCodeEntryTextField *)self placeholderTextView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  id v12 = [(CDPUIAccessCodeEntryTextField *)self placeholderTextView];
  [v12 setAutoresizingMask:18];
}

- (void)setFont:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CDPUIAccessCodeEntryTextField;
  [(CDPUIAccessCodeEntryTextField *)&v6 setFont:a3];
  double v4 = [(CDPUIAccessCodeEntryTextField *)self font];
  double v5 = [(CDPUIAccessCodeEntryTextField *)self placeholderTextView];
  [v5 setFont:v4];
}

- (void)setTextAlignment:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CDPUIAccessCodeEntryTextField;
  [(CDPUIAccessCodeEntryTextField *)&v6 setTextAlignment:a3];
  uint64_t v4 = [(CDPUIAccessCodeEntryTextField *)self textAlignment];
  double v5 = [(CDPUIAccessCodeEntryTextField *)self placeholderTextView];
  [v5 setTextAlignment:v4];
}

- (void)setText:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CDPUIAccessCodeEntryTextField;
  [(CDPUIAccessCodeEntryTextField *)&v4 setText:a3];
  [(CDPUIAccessCodeEntryTextField *)self updatePlaceholderVisibility];
}

- (void)setPlaceholder:(id)a3
{
  id v4 = a3;
  double v5 = (NSString *)[v4 copy];
  placeholder = self->_placeholder;
  self->_placeholder = v5;

  id v7 = [(CDPUIAccessCodeEntryTextField *)self placeholderTextView];
  [v7 setText:v4];
}

- (void)updatePlaceholderVisibility
{
  id v5 = [(CDPUIAccessCodeEntryTextField *)self text];
  BOOL v3 = [v5 length] != 0;
  id v4 = [(CDPUIAccessCodeEntryTextField *)self placeholderTextView];
  [v4 setHidden:v3];
}

- (id)viewForFirstBaselineLayout
{
  v2 = [(CDPUIAccessCodeEntryTextField *)self placeholderTextView];
  BOOL v3 = [v2 viewForFirstBaselineLayout];

  return v3;
}

- (id)viewForLastBaselineLayout
{
  v2 = [(CDPUIAccessCodeEntryTextField *)self placeholderTextView];
  BOOL v3 = [v2 viewForLastBaselineLayout];

  return v3;
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v8 = a5;
  if (![v8 isEqualToString:@"\n"]
    || ([(CDPUIAccessCodeEntryTextField *)self accessCodeInputDelegate],
        double v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = objc_opt_respondsToSelector(),
        v9,
        (v10 & 1) == 0))
  {
    if (location >= [(CDPUIAccessCodeEntryTextField *)self _totalCharacterLimit]) {
      goto LABEL_7;
    }
    id v12 = [(CDPUIAccessCodeEntryTextField *)self _sanitizeInputString:v8];

    objc_super v13 = [(CDPUIAccessCodeEntryTextField *)self text];
    BOOL v14 = location < [v13 length] && objc_msgSend(v12, "length") != 0;

    if ((unint64_t)[v12 length] > 1 || v14)
    {
      -[CDPUIAccessCodeEntryTextField _handleMultiCharacterStringInput:range:](self, "_handleMultiCharacterStringInput:range:", v12, location, length);
LABEL_19:
      BOOL v15 = 0;
      goto LABEL_21;
    }
    if (length == 1)
    {
      separatorDeleteLocations = self->_separatorDeleteLocations;
      v23 = [NSNumber numberWithUnsignedInteger:location];
      LODWORD(separatorDeleteLocations) = [(NSSet *)separatorDeleteLocations containsObject:v23];

      if (separatorDeleteLocations)
      {
        v19 = [(CDPUIAccessCodeEntryTextField *)self text];
        v24 = objc_msgSend(v19, "stringByReplacingCharactersInRange:withString:", location - 1, 2, &stru_26C9EBCA0);
        [(CDPUIAccessCodeEntryTextField *)self setText:v24];

        goto LABEL_18;
      }
    }
    else if (!length)
    {
      separatorLocations = self->_separatorLocations;
      double v17 = [NSNumber numberWithUnsignedInteger:location];
      LODWORD(separatorLocations) = [(NSSet *)separatorLocations containsObject:v17];

      if (separatorLocations)
      {
        v18 = NSString;
        v19 = [(CDPUIAccessCodeEntryTextField *)self text];
        id v20 = [v12 uppercaseString];
        v21 = [v18 stringWithFormat:@"%@%@%@", v19, @"-", v20];
        [(CDPUIAccessCodeEntryTextField *)self setText:v21];

LABEL_18:
        goto LABEL_19;
      }
    }
    BOOL v15 = 1;
    goto LABEL_21;
  }
  double v11 = [(CDPUIAccessCodeEntryTextField *)self accessCodeInputDelegate];
  [v11 accessCodeEntryTextFieldDidReturn:self];

LABEL_7:
  BOOL v15 = 0;
  id v12 = v8;
LABEL_21:

  return v15;
}

- (void)textViewDidChange:(id)a3
{
  [(CDPUIAccessCodeEntryTextField *)self updatePlaceholderVisibility];
  id v4 = [(CDPUIAccessCodeEntryTextField *)self text];
  id v5 = [v4 uppercaseString];
  [(CDPUIAccessCodeEntryTextField *)self setText:v5];

  id v6 = [(CDPUIAccessCodeEntryTextField *)self accessCodeInputDelegate];
  [v6 accessCodeEntryTextFieldDidUpdate:self];
}

- (unint64_t)_totalCharacterLimit
{
  uint64_t v3 = [(id)objc_opt_class() accessKeyCharacterCount];
  return [(CDPUIAccessCodeEntryTextField *)self _numberOfSeparators] + v3;
}

- (unint64_t)_numberOfSeparators
{
  return ((unint64_t)[(id)objc_opt_class() accessKeyCharacterCount] >> 2) - 1;
}

- (void)_handleMultiCharacterStringInput:(id)a3 range:(_NSRange)a4
{
  NSUInteger location = a4.location;
  id v16 = a3;
  id v6 = [(CDPUIAccessCodeEntryTextField *)self text];
  if ([v6 length] >= location)
  {
    id v7 = [v6 substringToIndex:location];
  }
  else
  {
    id v7 = &stru_26C9EBCA0;
  }
  if ([v6 length] >= location)
  {
    double v9 = [v6 substringFromIndex:location];
    id v8 = [v9 stringByReplacingOccurrencesOfString:@"-" withString:&stru_26C9EBCA0];
  }
  else
  {
    id v8 = &stru_26C9EBCA0;
  }
  char v10 = [v16 stringByAppendingString:v8];

  [(CDPUIAccessCodeEntryTextField *)self setText:v7];
  if ([v10 length])
  {
    unint64_t v11 = 0;
    do
    {
      id v12 = objc_msgSend(v10, "substringWithRange:", v11, 1);
      if (-[CDPUIAccessCodeEntryTextField textView:shouldChangeTextInRange:replacementText:](self, "textView:shouldChangeTextInRange:replacementText:", self, location, 0, v12))
      {
        objc_super v13 = [(CDPUIAccessCodeEntryTextField *)self text];
        BOOL v14 = [v12 uppercaseString];
        BOOL v15 = [v13 stringByAppendingString:v14];
        [(CDPUIAccessCodeEntryTextField *)self setText:v15];
      }
      else
      {
        ++location;
      }
      ++location;

      ++v11;
    }
    while (v11 < [v10 length]);
  }
  -[CDPUIAccessCodeEntryTextField setSelectedRange:](self, "setSelectedRange:", location, 0);
}

- (id)_sanitizeInputString:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x263F08708];
  id v4 = a3;
  id v5 = [v3 alphanumericCharacterSet];
  id v6 = [v5 invertedSet];

  id v7 = [v4 componentsSeparatedByCharactersInSet:v6];

  id v8 = [v7 componentsJoinedByString:&stru_26C9EBCA0];

  return v8;
}

- (NSString)placeholder
{
  return self->_placeholder;
}

- (CDPUIAccessCodeEntryTextFieldDelegate)accessCodeInputDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_accessCodeInputDelegate);

  return (CDPUIAccessCodeEntryTextFieldDelegate *)WeakRetained;
}

- (void)setAccessCodeInputDelegate:(id)a3
{
}

- (UITextView)placeholderTextView
{
  return self->_placeholderTextView;
}

- (void)setPlaceholderTextView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderTextView, 0);
  objc_destroyWeak((id *)&self->_accessCodeInputDelegate);
  objc_storeStrong((id *)&self->_placeholder, 0);
  objc_storeStrong((id *)&self->_separatorDeleteLocations, 0);

  objc_storeStrong((id *)&self->_separatorLocations, 0);
}

@end