@interface NameDetectorController
- (AXSDKeyboardReturnDelegate)delegate;
- (BOOL)textFieldShouldReturn:(id)a3;
- (NSString)detectorName;
- (UITextField)detectorNameTextField;
- (void)_constrainContentView;
- (void)_constrainNameSoundTextField;
- (void)_setUpNameSoundTextField;
- (void)_updateTextField;
- (void)setDelegate:(id)a3;
- (void)setDetectorName:(id)a3;
- (void)setDetectorNameTextField:(id)a3;
- (void)viewDidLoad;
@end

@implementation NameDetectorController

- (void)viewDidLoad
{
  v10.receiver = self;
  v10.super_class = (Class)NameDetectorController;
  [(NameDetectorController *)&v10 viewDidLoad];
  [(NameDetectorController *)self _setUpNameSoundTextField];
  id v3 = objc_alloc((Class)UIBarButtonItem);
  v4 = settingsLocString(@"NAME_SOUND_TITLE", @"SoundDetection");
  v5 = [(NameDetectorController *)self navigationItem];
  v6 = [v5 backBarButtonItem];
  id v7 = objc_msgSend(v3, "initWithTitle:style:target:action:", v4, objc_msgSend(v6, "style"), 0, 0);
  v8 = [(NameDetectorController *)self navigationItem];
  [v8 setBackBarButtonItem:v7];

  v9 = +[NSNotificationCenter defaultCenter];
  [v9 addObserver:self selector:"_fontSizeChange:" name:UIContentSizeCategoryDidChangeNotification object:0];
}

- (void)_setUpNameSoundTextField
{
  id v3 = objc_alloc_init((Class)UITextField);
  [(NameDetectorController *)self setDetectorNameTextField:v3];

  v4 = settingsLocString(@"CUSTOM_SOUND_PLACEHOLDER", @"SoundDetection");
  v5 = [(NameDetectorController *)self detectorNameTextField];
  [v5 setPlaceholder:v4];

  v6 = [(NameDetectorController *)self detectorName];

  if (v6)
  {
    id v7 = [(NameDetectorController *)self detectorName];
    v8 = [(NameDetectorController *)self detectorNameTextField];
    [v8 setText:v7];
  }
  v9 = [(NameDetectorController *)self detectorNameTextField];
  [v9 setDelegate:self];

  objc_super v10 = [(NameDetectorController *)self detectorNameTextField];
  [v10 setBorderStyle:0];

  v11 = +[UIColor tertiarySystemFillColor];
  v12 = [(NameDetectorController *)self detectorNameTextField];
  [v12 setBackgroundColor:v11];

  v13 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  v14 = [(NameDetectorController *)self detectorNameTextField];
  [v14 setFont:v13];

  v15 = [(NameDetectorController *)self detectorNameTextField];
  [v15 setAdjustsFontForContentSizeCategory:1];

  v16 = [(NameDetectorController *)self detectorNameTextField];
  [v16 _setCornerRadius:15.0];

  v17 = [(NameDetectorController *)self detectorNameTextField];
  [v17 setReturnKeyType:11];

  v18 = [(NameDetectorController *)self detectorNameTextField];
  [v18 setEnablesReturnKeyOnNonWhiteSpaceContent:1];

  v19 = [(NameDetectorController *)self detectorNameTextField];
  [v19 setAutocapitalizationType:1];

  v20 = [(NameDetectorController *)self detectorNameTextField];
  [v20 setClearButtonMode:1];

  v21 = [(NameDetectorController *)self contentView];
  v22 = [(NameDetectorController *)self detectorNameTextField];
  [v21 addSubview:v22];

  [(NameDetectorController *)self _constrainNameSoundTextField];
  [(NameDetectorController *)self _constrainContentView];
  id v25 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, 15.0, 20.0);
  v23 = [(NameDetectorController *)self detectorNameTextField];
  [v23 setLeftView:v25];

  v24 = [(NameDetectorController *)self detectorNameTextField];
  [v24 setLeftViewMode:3];
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v3 = [(NameDetectorController *)self delegate];
  [v3 keyboardReturnPressed];

  return 1;
}

- (void)_constrainNameSoundTextField
{
  id v3 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  [v3 _scaledValueForValue:45.0];
  double v5 = v4;

  v6 = [(NameDetectorController *)self detectorNameTextField];
  id v7 = [v6 heightAnchor];
  v8 = [v7 constraintEqualToConstant:v5];
  heightConstraint = self->_heightConstraint;
  self->_heightConstraint = v8;

  objc_super v10 = [(NameDetectorController *)self detectorNameTextField];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

  v11 = [(NameDetectorController *)self detectorNameTextField];
  v12 = [v11 leftAnchor];
  v13 = [(NameDetectorController *)self contentView];
  v14 = [v13 leftAnchor];
  v15 = [v12 constraintEqualToAnchor:v14];
  [v15 setActive:1];

  v16 = [(NameDetectorController *)self detectorNameTextField];
  v17 = [v16 rightAnchor];
  v18 = [(NameDetectorController *)self contentView];
  v19 = [v18 rightAnchor];
  v20 = [v17 constraintEqualToAnchor:v19];
  [v20 setActive:1];

  v21 = [(NameDetectorController *)self detectorNameTextField];
  v22 = [v21 topAnchor];
  v23 = [(NameDetectorController *)self contentView];
  v24 = [v23 topAnchor];
  id v25 = [v22 constraintEqualToAnchor:v24 constant:10.0];
  [v25 setActive:1];

  v26 = self->_heightConstraint;

  [(NSLayoutConstraint *)v26 setActive:1];
}

- (void)_constrainContentView
{
  id v3 = [(NameDetectorController *)self contentView];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v8 = [(NameDetectorController *)self contentView];
  double v4 = [v8 bottomAnchor];
  double v5 = [(NameDetectorController *)self detectorNameTextField];
  v6 = [v5 bottomAnchor];
  id v7 = [v4 constraintEqualToAnchor:v6 constant:10.0];
  [v7 setActive:1];
}

- (void)_updateTextField
{
  id v3 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  [v3 _scaledValueForValue:45.0];
  double v5 = v4;

  [(NSLayoutConstraint *)self->_heightConstraint setActive:0];
  v6 = [(NameDetectorController *)self detectorNameTextField];
  id v7 = [v6 heightAnchor];
  id v8 = [v7 constraintEqualToConstant:v5];
  heightConstraint = self->_heightConstraint;
  self->_heightConstraint = v8;

  objc_super v10 = self->_heightConstraint;

  [(NSLayoutConstraint *)v10 setActive:1];
}

- (UITextField)detectorNameTextField
{
  return self->_detectorNameTextField;
}

- (void)setDetectorNameTextField:(id)a3
{
}

- (NSString)detectorName
{
  return self->_detectorName;
}

- (void)setDetectorName:(id)a3
{
}

- (AXSDKeyboardReturnDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AXSDKeyboardReturnDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_detectorName, 0);
  objc_storeStrong((id *)&self->_detectorNameTextField, 0);

  objc_storeStrong((id *)&self->_heightConstraint, 0);
}

@end