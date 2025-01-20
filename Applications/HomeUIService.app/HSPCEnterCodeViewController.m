@interface HSPCEnterCodeViewController
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (HSPCEnterCodeViewController)initWithCoordinator:(id)a3 config:(id)a4;
- (id)commitConfiguration;
- (id)onCameraButton;
- (id)textField:(id)a3 editMenuForCharactersInRange:(_NSRange)a4 suggestedActions:(id)a5;
- (unint64_t)numberOfDigits;
- (void)configureNextViewController:(id)a3;
- (void)setNumberOfDigits:(unint64_t)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HSPCEnterCodeViewController

- (HSPCEnterCodeViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  id v6 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HSPCEnterCodeViewController;
  v7 = [(HSPCTextFieldViewController *)&v16 initWithCoordinator:a3 config:v6 withTextFieldMinimumHeight:100.0];
  if (v7)
  {
    v8 = HULocalizedString();
    [(HSPCEnterCodeViewController *)v7 setTitle:v8];

    v9 = HULocalizedString();
    [(HSPCEnterCodeViewController *)v7 setSubtitle:v9];

    v10 = [(HSPCTextFieldViewController *)v7 continueAction];
    [v10 setEnabled:1];

    objc_opt_class();
    id v11 = v6;
    if (objc_opt_isKindOfClass()) {
      v12 = v11;
    }
    else {
      v12 = 0;
    }
    id v13 = v12;

    if (!v13) {
      id v14 = [(HSPCEnterCodeViewController *)v7 addOptionalButtonWithTitleKey:@"HSSetupCodeActionButtonCamera" target:v7 futureSelector:"onCameraButton"];
    }
  }

  return v7;
}

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)HSPCEnterCodeViewController;
  [(HSPCTextFieldViewController *)&v11 viewDidLoad];
  v3 = [(HSPCTextFieldViewController *)self textField];
  [v3 setKeyboardType:11];

  v4 = [(HSPCTextFieldViewController *)self textField];
  [v4 setTextAlignment:1];

  v5 = +[UIFont monospacedDigitSystemFontOfSize:30.0 weight:UIFontWeightSemibold];
  id v6 = [(HSPCTextFieldViewController *)self textField];
  [v6 setFont:v5];

  v7 = [(HSPCTextFieldViewController *)self textField];
  [v7 setAdjustsFontSizeToFitWidth:1];

  v8 = [(HSPCTextFieldViewController *)self textField];
  [v8 setClearButtonMode:0];

  v9 = +[UIColor redColor];
  v10 = [(HSPCTextFieldViewController *)self footnoteLabel];
  [v10 setTextColor:v9];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HSPCEnterCodeViewController;
  [(HSPCTextFieldViewController *)&v5 viewWillAppear:a3];
  v4 = [(HSPCTextFieldViewController *)self textField];
  [v4 becomeFirstResponder];
}

- (id)commitConfiguration
{
  objc_initWeak(&location, self);
  v3 = [(HSPCTextFieldViewController *)self coordinator];
  v4 = [(HSPCTextFieldViewController *)self textFieldText];
  objc_super v5 = [v3 didReceiveSetupCode:v4 fromViewController:self];
  id v6 = [v5 flatMap:&stru_1000A9EE8];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100028C80;
  v9[3] = &unk_1000A9330;
  objc_copyWeak(&v10, &location);
  v7 = [v6 recover:v9];
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);

  return v7;
}

- (id)onCameraButton
{
  return +[NAFuture futureWithResult:&off_1000B01D8];
}

- (void)configureNextViewController:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  id v6 = v3;
  if (objc_opt_isKindOfClass()) {
    v4 = v6;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  [v5 setMode:0];
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  id v10 = a5;
  objc_super v11 = [(HSPCTextFieldViewController *)self footnoteLabel];
  [v11 setText:&stru_1000ABBA8];

  v12 = [v9 text];
  id v13 = [v10 stringByReplacingOccurrencesOfString:@"-" withString:&stru_1000ABBA8];
  id v14 = [v13 stringByReplacingOccurrencesOfString:@" " withString:&stru_1000ABBA8];

  v15 = +[NSCharacterSet decimalDigitCharacterSet];
  objc_super v16 = [v15 invertedSet];
  id v17 = [v14 rangeOfCharacterFromSet:v16];

  if (v17 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned __int8 v19 = 0;
    goto LABEL_26;
  }
  if (length == 1)
  {
    v18 = [v12 substringWithRange:location, 1];
    if ([v18 isEqualToString:@"-"])
    {

LABEL_7:
      --location;
      goto LABEL_8;
    }
    v20 = [v12 substringWithRange:location, 1];
    unsigned int v21 = [v20 isEqualToString:@" "];

    if (v21) {
      goto LABEL_7;
    }
  }
LABEL_8:
  v22 = [v12 stringByReplacingCharactersInRange:location length:length withString:v10];
  v23 = [v22 hf_extractDecimalDigits];
  id v24 = [v23 length];

  if ((unint64_t)v24 <= 0x15)
  {
    v25 = +[HUStringDisplayFormatter stringByApplyingCodeFormatToString:v22];
    unsigned __int8 v19 = [v22 isEqualToString:v25];
    if ((v19 & 1) == 0)
    {
      [v9 setText:v25];
      v26 = [v12 substringToIndex:location];
      v27 = [v26 hf_extractDecimalDigits];
      id v28 = [v27 length];
      uint64_t v29 = (uint64_t)v28 + (void)[v14 length];

      if (v29 <= 20)
      {
        if (v29 <= 18)
        {
          if (v29 <= 15)
          {
            if (v29 <= 11)
            {
              if (v29 < 8 || (unint64_t)[v25 length] <= 9) {
                uint64_t v30 = v29 > 4;
              }
              else {
                uint64_t v30 = 2;
              }
            }
            else
            {
              uint64_t v30 = 3;
            }
          }
          else
          {
            uint64_t v30 = 4;
          }
        }
        else
        {
          uint64_t v30 = 5;
        }
      }
      else
      {
        uint64_t v30 = 6;
      }
      uint64_t v31 = v29 + v30;
      v32 = [v9 beginningOfDocument];
      v33 = [v9 positionFromPosition:v32 offset:v31];

      v34 = [v9 textRangeFromPosition:v33 toPosition:v33];
      [v9 setSelectedTextRange:v34];
    }
  }
  else
  {
    unsigned __int8 v19 = 0;
  }

LABEL_26:
  return v19;
}

- (id)textField:(id)a3 editMenuForCharactersInRange:(_NSRange)a4 suggestedActions:(id)a5
{
  id v5 = a5;
  id v6 = +[NSPredicate predicateWithFormat:@"identifier == %@", @"com.apple.menu.standard-edit"];
  v7 = [v5 filteredArrayUsingPredicate:v6];

  v8 = +[UIMenu menuWithChildren:v7];

  return v8;
}

- (unint64_t)numberOfDigits
{
  return self->_numberOfDigits;
}

- (void)setNumberOfDigits:(unint64_t)a3
{
  self->_numberOfDigits = a3;
}

@end