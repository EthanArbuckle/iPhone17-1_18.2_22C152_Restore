@interface HSPCTextFieldViewController
- (BOOL)textFieldShouldReturn:(id)a3;
- (HFNamedItemBuilder)builder;
- (HSPCTextFieldViewController)initWithCoordinator:(id)a3 config:(id)a4;
- (HSPCTextFieldViewController)initWithCoordinator:(id)a3 config:(id)a4 withTextFieldMinimumHeight:(double)a5;
- (HSProxCardCoordinator)coordinator;
- (HSSetupStateMachineConfiguration)config;
- (NSString)textFieldPlaceholderText;
- (NSString)textFieldText;
- (PRXAction)continueAction;
- (PRXLabel)footnoteLabel;
- (PRXTextField)textField;
- (double)textFieldMinimumHeight;
- (id)commitConfiguration;
- (void)endEditing;
- (void)setBuilder:(id)a3;
- (void)setConfig:(id)a3;
- (void)setContinueAction:(id)a3;
- (void)setCoordinator:(id)a3;
- (void)setFootnoteLabel:(id)a3;
- (void)setTextField:(id)a3;
- (void)setTextFieldMinimumHeight:(double)a3;
- (void)setTextFieldPlaceholderText:(id)a3;
- (void)setTextFieldText:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HSPCTextFieldViewController

- (HSPCTextFieldViewController)initWithCoordinator:(id)a3 config:(id)a4
{
  return [(HSPCTextFieldViewController *)self initWithCoordinator:a3 config:a4 withTextFieldMinimumHeight:0.0];
}

- (HSPCTextFieldViewController)initWithCoordinator:(id)a3 config:(id)a4 withTextFieldMinimumHeight:(double)a5
{
  id v9 = a3;
  id v10 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HSPCTextFieldViewController;
  v11 = [(HSPCTextFieldViewController *)&v18 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_config, a4);
    objc_storeStrong((id *)&v12->_coordinator, a3);
    v12->_textFieldMinimumHeight = a5;
    uint64_t v13 = [(HSPCTextFieldViewController *)v12 addProminentButtonWithTitleKey:@"HUContinueTitle" target:v12 futureSelector:"commitConfiguration"];
    continueAction = v12->_continueAction;
    v12->_continueAction = (PRXAction *)v13;

    uint64_t v15 = +[PRXLabel labelWithStyle:3];
    footnoteLabel = v12->_footnoteLabel;
    v12->_footnoteLabel = (PRXLabel *)v15;
  }
  return v12;
}

- (id)commitConfiguration
{
  v4 = +[NSAssertionHandler currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"HSPCTextFieldViewController.m" lineNumber:89 description:@"Subclass to override."];

  return +[NAFuture futureWithResult:&off_1000B03E8];
}

- (void)setTextFieldText:(id)a3
{
  id v4 = a3;
  id v5 = [(HSPCTextFieldViewController *)self textField];
  [v5 setText:v4];
}

- (NSString)textFieldText
{
  v2 = [(HSPCTextFieldViewController *)self textField];
  v3 = [v2 text];
  id v4 = v3;
  if (!v3) {
    v3 = &stru_1000ABBA8;
  }
  id v5 = v3;

  return v5;
}

- (void)setTextFieldPlaceholderText:(id)a3
{
  id v4 = a3;
  id v5 = [(HSPCTextFieldViewController *)self textField];
  [v5 setPlaceholder:v4];
}

- (NSString)textFieldPlaceholderText
{
  v2 = [(HSPCTextFieldViewController *)self textField];
  v3 = [v2 placeholder];

  return (NSString *)v3;
}

- (PRXTextField)textField
{
  textField = self->_textField;
  if (!textField)
  {
    id v4 = objc_alloc_init(HSPCTextField);
    [(HSPCTextField *)v4 setClearButtonMode:3];
    [(HSPCTextField *)v4 setAutocapitalizationType:1];
    [(HSPCTextField *)v4 setReturnKeyType:9];
    [(HSPCTextField *)v4 setDelegate:self];
    id v5 = self->_textField;
    self->_textField = (PRXTextField *)v4;

    textField = self->_textField;
  }

  return textField;
}

- (void)viewDidLoad
{
  v47.receiver = self;
  v47.super_class = (Class)HSPCTextFieldViewController;
  [(HSPCTextFieldViewController *)&v47 viewDidLoad];
  v3 = [(HSPCTextFieldViewController *)self contentView];
  id v4 = [(HSPCTextFieldViewController *)self textField];
  [v3 addSubview:v4];

  id v5 = [(HSPCTextFieldViewController *)self contentView];
  v6 = [v5 mainContentGuide];

  v7 = [(HSPCTextFieldViewController *)self textField];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

  v8 = objc_opt_new();
  id v9 = [(HSPCTextFieldViewController *)self textField];
  id v10 = [v9 topAnchor];
  v11 = [v6 topAnchor];
  v12 = [v10 constraintEqualToAnchor:v11];
  [v8 na_safeAddObject:v12];

  uint64_t v13 = [(HSPCTextFieldViewController *)self textField];
  v14 = [v13 leadingAnchor];
  uint64_t v15 = [v6 leadingAnchor];
  v16 = [v14 constraintEqualToAnchor:v15];
  [v8 na_safeAddObject:v16];

  v17 = [(HSPCTextFieldViewController *)self textField];
  objc_super v18 = [v17 trailingAnchor];
  v19 = [v6 trailingAnchor];
  v20 = [v18 constraintEqualToAnchor:v19];
  [v8 na_safeAddObject:v20];

  [(HSPCTextFieldViewController *)self textFieldMinimumHeight];
  if (NACGFloatGreaterThanFloat())
  {
    v21 = [(HSPCTextFieldViewController *)self textField];
    v22 = [v21 heightAnchor];
    [(HSPCTextFieldViewController *)self textFieldMinimumHeight];
    v23 = [v22 constraintGreaterThanOrEqualToConstant:];

    [v8 na_safeAddObject:v23];
  }
  v24 = [(HSPCTextFieldViewController *)self footnoteLabel];
  [v24 setTranslatesAutoresizingMaskIntoConstraints:0];

  v25 = [(HSPCTextFieldViewController *)self contentView];
  v26 = [(HSPCTextFieldViewController *)self footnoteLabel];
  [v25 addSubview:v26];

  v27 = [(HSPCTextFieldViewController *)self footnoteLabel];
  v28 = [v27 leadingAnchor];
  v29 = [v6 leadingAnchor];
  v30 = [v28 constraintEqualToAnchor:v29];
  [v8 na_safeAddObject:v30];

  v31 = [(HSPCTextFieldViewController *)self footnoteLabel];
  v32 = [v31 trailingAnchor];
  v33 = [v6 trailingAnchor];
  v34 = [v32 constraintEqualToAnchor:v33];
  [v8 na_safeAddObject:v34];

  v35 = [(HSPCTextFieldViewController *)self footnoteLabel];
  v36 = [v35 topAnchor];
  v37 = [(HSPCTextFieldViewController *)self textField];
  v38 = [v37 bottomAnchor];
  v39 = [v36 constraintEqualToAnchor:v38 constant:10.0];
  [v8 na_safeAddObject:v39];

  v40 = [v6 bottomAnchor];
  v41 = [(HSPCTextFieldViewController *)self footnoteLabel];
  v42 = [v41 bottomAnchor];
  v43 = [v40 constraintGreaterThanOrEqualToAnchor:v42 constant:10.0];
  [v8 na_safeAddObject:v43];

  v44 = [(HSPCTextFieldViewController *)self footnoteLabel];
  v45 = [v44 heightAnchor];
  v46 = [v45 constraintGreaterThanOrEqualToConstant:40.0];
  [v8 na_safeAddObject:v46];

  +[NSLayoutConstraint activateConstraints:v8];
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HSPCTextFieldViewController;
  [(HSPCTextFieldViewController *)&v8 viewWillAppear:a3];
  id v4 = [(HSPCTextFieldViewController *)self textField];
  id v5 = [v4 text];
  id v6 = [v5 length];

  if (!v6)
  {
    v7 = [(HSPCTextFieldViewController *)self textField];
    [v7 becomeFirstResponder];
  }
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v6 = [a3 text];
  id v4 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
  id v5 = [v6 stringByTrimmingCharactersInSet:v4];
  [(HSPCTextFieldViewController *)self setTextFieldText:v5];
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  return 1;
}

- (void)endEditing
{
  id v2 = [(HSPCTextFieldViewController *)self contentView];
  [v2 endEditing:1];
}

- (HSSetupStateMachineConfiguration)config
{
  return (HSSetupStateMachineConfiguration *)objc_getProperty(self, a2, 8, 1);
}

- (void)setConfig:(id)a3
{
}

- (HSProxCardCoordinator)coordinator
{
  return (HSProxCardCoordinator *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCoordinator:(id)a3
{
}

- (HFNamedItemBuilder)builder
{
  return (HFNamedItemBuilder *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBuilder:(id)a3
{
}

- (double)textFieldMinimumHeight
{
  return self->_textFieldMinimumHeight;
}

- (void)setTextFieldMinimumHeight:(double)a3
{
  self->_textFieldMinimumHeight = a3;
}

- (void)setTextField:(id)a3
{
}

- (PRXAction)continueAction
{
  return self->_continueAction;
}

- (void)setContinueAction:(id)a3
{
}

- (PRXLabel)footnoteLabel
{
  return self->_footnoteLabel;
}

- (void)setFootnoteLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footnoteLabel, 0);
  objc_storeStrong((id *)&self->_continueAction, 0);
  objc_storeStrong((id *)&self->_textField, 0);
  objc_storeStrong((id *)&self->_builder, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);

  objc_storeStrong((id *)&self->_config, 0);
}

@end