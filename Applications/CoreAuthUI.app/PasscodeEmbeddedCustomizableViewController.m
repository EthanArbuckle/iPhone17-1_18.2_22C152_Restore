@interface PasscodeEmbeddedCustomizableViewController
- (BOOL)hasAlphaNumericPasscode;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldReturn:(id)a3;
- (BOOL)verifyPasscode:(id)a3;
- (NSString)placeholderText;
- (PasscodeEmbeddedCustomizableViewController)initWithPasscodeLength:(int64_t)a3 alphanumeric:(BOOL)a4;
- (PasscodeEmbeddedViewControllerDelegate)delegate;
- (id)alphanumericFieldPlaceholder;
- (int64_t)alphanumericFieldTextAlignment;
- (unint64_t)passcodeLength;
- (void)_verifyTextField:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPasscodeFocused:(BOOL)a3;
- (void)setPlaceholderText:(id)a3;
@end

@implementation PasscodeEmbeddedCustomizableViewController

- (PasscodeEmbeddedCustomizableViewController)initWithPasscodeLength:(int64_t)a3 alphanumeric:(BOOL)a4
{
  BOOL v4 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PasscodeEmbeddedCustomizableViewController;
  v6 = [(PasscodeEmbeddedCustomizableViewController *)&v11 init];
  v7 = v6;
  if (v6)
  {
    if (a3 < 1) {
      int64_t v8 = -1;
    }
    else {
      int64_t v8 = a3;
    }
    v6->_passcodeLength = v8;
    if (v4)
    {
      v6->_hasAlphanumericPasscode = 1;
    }
    else if (a3 <= 0)
    {
      v9 = +[UIDevice currentDevice];
      v7->_hasAlphanumericPasscode = [v9 userInterfaceIdiom] != (id)1 || v7->_passcodeLength > 6;
    }
    else
    {
      v6->_hasAlphanumericPasscode = (unint64_t)a3 > 6;
    }
  }
  return v7;
}

- (unint64_t)passcodeLength
{
  return self->_passcodeLength;
}

- (BOOL)hasAlphaNumericPasscode
{
  return self->_hasAlphanumericPasscode;
}

- (void)setPasscodeFocused:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PasscodeEmbeddedCustomizableViewController;
  [(PasscodeEmbeddedViewController *)&v3 setPasscodeFocused:a3];
}

- (id)alphanumericFieldPlaceholder
{
  id v4 = objc_alloc((Class)NSAttributedString);
  placeholderText = self->_placeholderText;
  v6 = placeholderText;
  if (!placeholderText)
  {
    v12.receiver = self;
    v12.super_class = (Class)PasscodeEmbeddedCustomizableViewController;
    v2 = [(PasscodeEmbeddedViewController *)&v12 alphanumericFieldPlaceholder];
    v6 = [v2 string];
  }
  v13[0] = NSParagraphStyleAttributeName;
  id v7 = objc_alloc_init((Class)NSMutableParagraphStyle);
  [v7 setAlignment:1];
  v14[0] = v7;
  v13[1] = NSFontAttributeName;
  int64_t v8 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  v14[1] = v8;
  v9 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
  id v10 = [v4 initWithString:v6 attributes:v9];

  if (!placeholderText)
  {
  }

  return v10;
}

- (int64_t)alphanumericFieldTextAlignment
{
  return 1;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  id v10 = a5;
  id v11 = [(PasscodeEmbeddedViewController *)self passcodeField];

  if (v11 != v9)
  {
    +[NSException raise:NSInvalidArgumentException, @"Received delegate message for invalid text field (%@)", v9 format];
    goto LABEL_10;
  }
  if ([(PasscodeEmbeddedViewController *)self animating]) {
    goto LABEL_10;
  }
  objc_super v12 = [v9 text];
  id v13 = [v12 length];
  if (v13 >= (id)[(PasscodeEmbeddedCustomizableViewController *)self passcodeLength])
  {
    unint64_t v14 = [(PasscodeEmbeddedCustomizableViewController *)self passcodeLength];

    if (v14) {
      goto LABEL_8;
    }
  }
  else
  {
  }
  v15 = [v9 text];
  v16 = [v15 stringByReplacingCharactersInRange:location length:length withString:v10];
  [v9 setText:v16];

LABEL_8:
  v17 = [v9 text];
  id v18 = [v17 length];
  unint64_t v19 = [(PasscodeEmbeddedCustomizableViewController *)self passcodeLength];

  if ((unint64_t)v18 >= v19) {
    [(PasscodeEmbeddedCustomizableViewController *)self _verifyTextField:v9];
  }
LABEL_10:

  return 0;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4 = a3;
  id v5 = [(PasscodeEmbeddedViewController *)self passcodeField];

  if (v5 == v4) {
    [(PasscodeEmbeddedCustomizableViewController *)self _verifyTextField:v4];
  }
  else {
    +[NSException raise:NSInvalidArgumentException, @"Received delegate message for invalid text field (%@)", v4 format];
  }

  return 0;
}

- (BOOL)verifyPasscode:(id)a3
{
  return 1;
}

- (void)_verifyTextField:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = [v4 text];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100025640;
  v8[3] = &unk_100086B90;
  objc_copyWeak(&v10, &location);
  id v7 = v4;
  id v9 = v7;
  [WeakRetained verifyPasscode:v6 reply:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (PasscodeEmbeddedViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PasscodeEmbeddedViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)placeholderText
{
  return self->_placeholderText;
}

- (void)setPlaceholderText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderText, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end