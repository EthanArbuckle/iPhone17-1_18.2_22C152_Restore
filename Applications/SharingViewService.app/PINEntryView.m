@interface PINEntryView
- (BOOL)alphaNumeric;
- (BOOL)canBecomeFirstResponder;
- (BOOL)disabled;
- (BOOL)hasText;
- (NSArray)digits;
- (NSArray)wells;
- (NSString)text;
- (UIColor)wellFocusColor;
- (id)textChangedHandler;
- (int64_t)autocapitalizationType;
- (int64_t)autocorrectionType;
- (int64_t)keyboardAppearance;
- (int64_t)keyboardType;
- (int64_t)spellCheckingType;
- (void)_updateLabels;
- (void)deleteBackward;
- (void)insertText:(id)a3;
- (void)setAlphaNumeric:(BOOL)a3;
- (void)setDigits:(id)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setText:(id)a3;
- (void)setTextChangedHandler:(id)a3;
- (void)setWellFocusColor:(id)a3;
- (void)setWells:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
@end

@implementation PINEntryView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wellFocusColor, 0);
  objc_storeStrong((id *)&self->_wells, 0);
  objc_storeStrong(&self->_textChangedHandler, 0);
  objc_storeStrong((id *)&self->_digits, 0);

  objc_storeStrong((id *)&self->_text, 0);
}

- (void)setWellFocusColor:(id)a3
{
}

- (UIColor)wellFocusColor
{
  return self->_wellFocusColor;
}

- (void)setWells:(id)a3
{
}

- (NSArray)wells
{
  return self->_wells;
}

- (void)setTextChangedHandler:(id)a3
{
}

- (id)textChangedHandler
{
  return self->_textChangedHandler;
}

- (BOOL)disabled
{
  return self->_disabled;
}

- (void)setDigits:(id)a3
{
}

- (NSArray)digits
{
  return self->_digits;
}

- (void)setAlphaNumeric:(BOOL)a3
{
  self->_alphaNumeric = a3;
}

- (BOOL)alphaNumeric
{
  return self->_alphaNumeric;
}

- (int64_t)spellCheckingType
{
  return 1;
}

- (int64_t)keyboardType
{
  if (self->_alphaNumeric) {
    return 6;
  }
  else {
    return 11;
  }
}

- (int64_t)keyboardAppearance
{
  return 2;
}

- (BOOL)hasText
{
  return [(NSMutableString *)self->_text length] != 0;
}

- (void)insertText:(id)a3
{
  id v9 = a3;
  if (!self->_text)
  {
    v4 = (NSMutableString *)objc_alloc_init((Class)NSMutableString);
    text = self->_text;
    self->_text = v4;
  }
  id v6 = [(NSArray *)self->_digits count];
  if (v6 != [(NSMutableString *)self->_text length])
  {
    v7 = self->_text;
    v8 = [v9 uppercaseString];
    [(NSMutableString *)v7 appendString:v8];

    [(PINEntryView *)self _updateLabels];
  }
}

- (void)deleteBackward
{
  if ([(NSMutableString *)self->_text length])
  {
    text = self->_text;
    id v4 = [(NSMutableString *)text rangeOfComposedCharacterSequenceAtIndex:(char *)[(NSMutableString *)text length] - 1];
    -[NSMutableString deleteCharactersInRange:](text, "deleteCharactersInRange:", v4, v5);
    [(PINEntryView *)self _updateLabels];
  }
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (int64_t)autocorrectionType
{
  return 1;
}

- (int64_t)autocapitalizationType
{
  return 3;
}

- (void)_updateLabels
{
  NSUInteger v3 = [(NSArray *)self->_wells count];
  id v4 = @"-";
  if (v3) {
    id v4 = &stru_1001A1DC0;
  }
  v31 = v4;
  uint64_t v5 = (char *)[(NSMutableString *)self->_text length];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v6 = self->_digits;
  id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v37;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v37 != v10) {
          objc_enumerationMutation(v6);
        }
        v12 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        if ((char *)i + v9 >= v5)
        {
          [*(id *)(*((void *)&v36 + 1) + 8 * i) setText:v31];
        }
        else
        {
          v13 = -[NSMutableString substringWithRange:](self->_text, "substringWithRange:");
          [v12 setText:v13];
        }
      }
      v9 += (uint64_t)i;
      id v8 = [(NSArray *)v6 countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v8);
  }

  wellFocusColor = self->_wellFocusColor;
  if (wellFocusColor)
  {
    v15 = wellFocusColor;
  }
  else
  {
    v15 = +[UIColor grayColor];
  }
  v16 = v15;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v29 = self;
  v17 = self->_wells;
  v18 = (char *)[(NSArray *)v17 countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v18)
  {
    v19 = v18;
    v20 = 0;
    uint64_t v21 = *(void *)v33;
    do
    {
      v22 = 0;
      v30 = v20;
      v23 = (char *)(v5 - v20);
      do
      {
        if (*(void *)v33 != v21) {
          objc_enumerationMutation(v17);
        }
        v24 = *(void **)(*((void *)&v32 + 1) + 8 * (void)v22);
        if (v23 == v22)
        {
          [*(id *)(*((void *)&v32 + 1) + 8 * (void)v22) setBorderColor:v16];
          double v25 = 2.0;
        }
        else
        {
          v26 = +[UIColor colorWithWhite:0.800000012 alpha:1.0];
          [v24 setBorderColor:v26];

          double v25 = 1.5;
        }
        [v24 setBorderWidth:v25, v29];
        ++v22;
      }
      while (v19 != v22);
      v20 = &v19[(void)v30];
      v19 = (char *)[(NSArray *)v17 countByEnumeratingWithState:&v32 objects:v40 count:16];
    }
    while (v19);
  }

  textChangedHandler = (void (**)(id, const __CFString *))v29->_textChangedHandler;
  if (textChangedHandler)
  {
    if (v29->_text) {
      CFStringRef text = (const __CFString *)v29->_text;
    }
    else {
      CFStringRef text = &stru_1001A1DC0;
    }
    textChangedHandler[2](textChangedHandler, text);
  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PINEntryView;
  [(PINEntryView *)&v5 touchesBegan:a3 withEvent:a4];
  if (!self->_disabled) {
    [(PINEntryView *)self becomeFirstResponder];
  }
}

- (void)setText:(id)a3
{
  id v4 = [a3 uppercaseString];
  objc_super v5 = (NSMutableString *)[v4 mutableCopy];
  CFStringRef text = self->_text;
  self->_CFStringRef text = v5;

  [(PINEntryView *)self _updateLabels];
}

- (NSString)text
{
  CFStringRef text = self->_text;
  if (text) {
    NSUInteger v3 = (__CFString *)[(NSMutableString *)text copy];
  }
  else {
    NSUInteger v3 = &stru_1001A1DC0;
  }

  return (NSString *)v3;
}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
  if (a3) {
    [(PINEntryView *)self resignFirstResponder];
  }
  else {
    [(PINEntryView *)self becomeFirstResponder];
  }
}

@end