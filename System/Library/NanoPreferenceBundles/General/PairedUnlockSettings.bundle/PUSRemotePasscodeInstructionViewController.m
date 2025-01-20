@interface PUSRemotePasscodeInstructionViewController
- (PUSRemotePasscodeInstructionViewController)initWithAction:(int64_t)a3;
- (PUSRemotePasscodeViewControllerDelegate)delegate;
- (UILabel)instructionLabel;
- (unint64_t)supportedInterfaceOrientations;
- (void)_cancel;
- (void)setDelegate:(id)a3;
- (void)setInstructionLabel:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation PUSRemotePasscodeInstructionViewController

- (PUSRemotePasscodeInstructionViewController)initWithAction:(int64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PUSRemotePasscodeInstructionViewController;
  v4 = [(PUSRemotePasscodeInstructionViewController *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_action = a3;
    id v6 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:v4 action:"_cancel"];
    v7 = [(PUSRemotePasscodeInstructionViewController *)v5 navigationItem];
    [v7 setLeftBarButtonItem:v6];
  }
  return v5;
}

- (void)viewDidLoad
{
  v17.receiver = self;
  v17.super_class = (Class)PUSRemotePasscodeInstructionViewController;
  [(PUSRemotePasscodeInstructionViewController *)&v17 viewDidLoad];
  unint64_t v3 = self->_action - 1;
  if (v3 > 5) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = (uint64_t)*(&off_10638 + v3);
  }
  v5 = +[NSString stringWithFormat:@"REMOTE_PASSCODE_%@_TITLE", v4];
  id v6 = +[NSBundle bundleForClass:objc_opt_class()];
  v7 = [v6 localizedStringForKey:v5 value:&stru_107E8 table:@"PasscodeSettings"];
  [(PUSRemotePasscodeInstructionViewController *)self setTitle:v7];

  v8 = [(PUSRemotePasscodeInstructionViewController *)self view];
  objc_super v9 = BPSBackgroundColor();
  [v8 setBackgroundColor:v9];

  v10 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  instructionLabel = self->_instructionLabel;
  self->_instructionLabel = v10;

  v12 = +[NSString stringWithFormat:@"REMOTE_PASSCODE_%@_TEXT", v4];
  v13 = +[NSBundle bundleForClass:objc_opt_class()];
  v14 = [v13 localizedStringForKey:v12 value:&stru_107E8 table:@"PasscodeSettings"];
  [(UILabel *)self->_instructionLabel setText:v14];

  v15 = BPSTextColor();
  [(UILabel *)self->_instructionLabel setTextColor:v15];

  v16 = +[UIFont systemFontOfSize:15.0];
  [(UILabel *)self->_instructionLabel setFont:v16];

  [(UILabel *)self->_instructionLabel setNumberOfLines:0];
  [(UILabel *)self->_instructionLabel setTextAlignment:1];
  [v8 addSubview:self->_instructionLabel];
  [(PUSRemotePasscodeInstructionViewController *)self setModalInPresentation:1];
}

- (void)viewWillLayoutSubviews
{
  id v8 = [(PUSRemotePasscodeInstructionViewController *)self view];
  [v8 bounds];
  -[UILabel sizeThatFits:](self->_instructionLabel, "sizeThatFits:", v3 + -80.0, v4 + -80.0);
  v5 = [(PUSRemotePasscodeInstructionViewController *)self navigationController];
  id v6 = [v5 navigationBar];
  [v6 bounds];
  CGRectGetHeight(v10);
  v7 = +[UIScreen mainScreen];
  [v7 scale];
  UIRectIntegralWithScale();
  -[UILabel setFrame:](self->_instructionLabel, "setFrame:");
}

- (void)_cancel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained remotePasscodeViewControllerDidCancel:self];
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (PUSRemotePasscodeViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PUSRemotePasscodeViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UILabel)instructionLabel
{
  return self->_instructionLabel;
}

- (void)setInstructionLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instructionLabel, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end