@interface FBAPINEntryView
- (BOOL)alphaNumeric;
- (BOOL)canBecomeFirstResponder;
- (BOOL)disabled;
- (BOOL)hasText;
- (NSArray)digits;
- (NSString)text;
- (UILabel)pinLabel1;
- (UILabel)pinLabel2;
- (UILabel)pinLabel3;
- (UILabel)pinLabel4;
- (UILabel)pinLabel5;
- (UILabel)pinLabel6;
- (id)textChangedHandler;
- (int64_t)autocapitalizationType;
- (int64_t)autocorrectionType;
- (int64_t)keyboardAppearance;
- (int64_t)keyboardType;
- (int64_t)spellCheckingType;
- (void)_updateLabels;
- (void)awakeFromNib;
- (void)deleteBackward;
- (void)insertText:(id)a3;
- (void)setAlphaNumeric:(BOOL)a3;
- (void)setDigits:(id)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setPinLabel1:(id)a3;
- (void)setPinLabel2:(id)a3;
- (void)setPinLabel3:(id)a3;
- (void)setPinLabel4:(id)a3;
- (void)setPinLabel5:(id)a3;
- (void)setPinLabel6:(id)a3;
- (void)setText:(id)a3;
- (void)setTextChangedHandler:(id)a3;
@end

@implementation FBAPINEntryView

- (void)awakeFromNib
{
  v24.receiver = self;
  v24.super_class = (Class)FBAPINEntryView;
  [(FBAPINEntryView *)&v24 awakeFromNib];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pinLabel1);
  v26[0] = WeakRetained;
  id v4 = objc_loadWeakRetained((id *)&self->_pinLabel2);
  v26[1] = v4;
  id v5 = objc_loadWeakRetained((id *)&self->_pinLabel3);
  v26[2] = v5;
  id v6 = objc_loadWeakRetained((id *)&self->_pinLabel4);
  v26[3] = v6;
  id v7 = objc_loadWeakRetained((id *)&self->_pinLabel5);
  v26[4] = v7;
  id v8 = objc_loadWeakRetained((id *)&self->_pinLabel6);
  v26[5] = v8;
  v9 = +[NSArray arrayWithObjects:v26 count:6];
  [(FBAPINEntryView *)self setDigits:v9];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v10 = [(FBAPINEntryView *)self digits];
  id v11 = [v10 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v21;
    do
    {
      v14 = 0;
      do
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v20 + 1) + 8 * (void)v14);
        v16 = +[UIColor labelColor];
        [v15 setTextColor:v16];

        v17 = [v15 superview];
        v18 = +[UIColor secondarySystemBackgroundColor];
        [v17 setBackgroundColor:v18];

        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v12);
  }

  v19 = +[UIColor clearColor];
  [(FBAPINEntryView *)self setBackgroundColor:v19];
}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
  if (a3) {
    [(FBAPINEntryView *)self resignFirstResponder];
  }
  else {
    [(FBAPINEntryView *)self becomeFirstResponder];
  }
}

- (NSString)text
{
  text = self->_text;
  if (text) {
    v3 = (__CFString *)[(NSMutableString *)text copy];
  }
  else {
    v3 = &stru_1000F6658;
  }

  return (NSString *)v3;
}

- (void)setText:(id)a3
{
  id v4 = [a3 uppercaseString];
  id v5 = (NSMutableString *)[v4 mutableCopy];
  text = self->_text;
  self->_text = v5;

  [(FBAPINEntryView *)self _updateLabels];
}

- (void)_updateLabels
{
  v3 = (char *)[(NSMutableString *)self->_text length];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = self->_digits;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ((char *)i + v7 >= v3)
        {
          [*(id *)(*((void *)&v14 + 1) + 8 * i) setText:&stru_1000F6658 v14];
        }
        else
        {
          id v11 = -[NSMutableString substringWithRange:](self->_text, "substringWithRange:");
          [v10 setText:v11];
        }
      }
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      v7 += (uint64_t)i;
    }
    while (v6);
  }

  textChangedHandler = (void (**)(id, NSMutableString *))self->_textChangedHandler;
  if (textChangedHandler)
  {
    if (self->_text) {
      text = self->_text;
    }
    else {
      text = (NSMutableString *)&stru_1000F6658;
    }
    textChangedHandler[2](textChangedHandler, text);
  }
}

- (int64_t)autocapitalizationType
{
  return 3;
}

- (int64_t)autocorrectionType
{
  return 1;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)deleteBackward
{
  if ([(NSMutableString *)self->_text length])
  {
    text = self->_text;
    id v4 = [(NSMutableString *)text rangeOfComposedCharacterSequenceAtIndex:(char *)[(NSMutableString *)text length] - 1];
    -[NSMutableString deleteCharactersInRange:](text, "deleteCharactersInRange:", v4, v5);
    [(FBAPINEntryView *)self _updateLabels];
  }
}

- (void)insertText:(id)a3
{
  id v9 = a3;
  if (!self->_text)
  {
    id v4 = (NSMutableString *)objc_alloc_init((Class)NSMutableString);
    text = self->_text;
    self->_text = v4;
  }
  id v6 = [(NSArray *)self->_digits count];
  if (v6 != [(NSMutableString *)self->_text length])
  {
    uint64_t v7 = self->_text;
    uint64_t v8 = [v9 uppercaseString];
    [(NSMutableString *)v7 appendString:v8];

    [(FBAPINEntryView *)self _updateLabels];
  }
}

- (BOOL)hasText
{
  return [(NSMutableString *)self->_text length] != 0;
}

- (int64_t)keyboardAppearance
{
  return 2;
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

- (int64_t)spellCheckingType
{
  return 1;
}

- (BOOL)alphaNumeric
{
  return self->_alphaNumeric;
}

- (void)setAlphaNumeric:(BOOL)a3
{
  self->_alphaNumeric = a3;
}

- (BOOL)disabled
{
  return self->_disabled;
}

- (id)textChangedHandler
{
  return self->_textChangedHandler;
}

- (void)setTextChangedHandler:(id)a3
{
}

- (UILabel)pinLabel1
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pinLabel1);

  return (UILabel *)WeakRetained;
}

- (void)setPinLabel1:(id)a3
{
}

- (UILabel)pinLabel2
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pinLabel2);

  return (UILabel *)WeakRetained;
}

- (void)setPinLabel2:(id)a3
{
}

- (UILabel)pinLabel3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pinLabel3);

  return (UILabel *)WeakRetained;
}

- (void)setPinLabel3:(id)a3
{
}

- (UILabel)pinLabel4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pinLabel4);

  return (UILabel *)WeakRetained;
}

- (void)setPinLabel4:(id)a3
{
}

- (UILabel)pinLabel5
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pinLabel5);

  return (UILabel *)WeakRetained;
}

- (void)setPinLabel5:(id)a3
{
}

- (UILabel)pinLabel6
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pinLabel6);

  return (UILabel *)WeakRetained;
}

- (void)setPinLabel6:(id)a3
{
}

- (NSArray)digits
{
  return self->_digits;
}

- (void)setDigits:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_digits, 0);
  objc_destroyWeak((id *)&self->_pinLabel6);
  objc_destroyWeak((id *)&self->_pinLabel5);
  objc_destroyWeak((id *)&self->_pinLabel4);
  objc_destroyWeak((id *)&self->_pinLabel3);
  objc_destroyWeak((id *)&self->_pinLabel2);
  objc_destroyWeak((id *)&self->_pinLabel1);
  objc_storeStrong(&self->_textChangedHandler, 0);

  objc_storeStrong((id *)&self->_text, 0);
}

@end