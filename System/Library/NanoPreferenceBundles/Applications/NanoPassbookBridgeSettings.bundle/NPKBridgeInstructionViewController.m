@interface NPKBridgeInstructionViewController
- (BOOL)hidesBackButton;
- (BOOL)showingSpinner;
- (NPKBridgeInstructionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UIActivityIndicatorView)activityIndicatorView;
- (UIBarButtonItem)hiddenRightBarButtonItem;
- (UIBarButtonItem)spinnerItem;
- (UIColor)instructionLabelTextColor;
- (UILabel)instructionLabel;
- (id)_instructionMessage;
- (id)_instructionTitle;
- (id)cancellationHandler;
- (void)_cancel;
- (void)_setNavigationBarEnabled:(BOOL)a3;
- (void)handleErrorWithTitle:(id)a3 message:(id)a4 acknowledgeButtonTitle:(id)a5;
- (void)setActivityIndicatorView:(id)a3;
- (void)setCancellationHandler:(id)a3;
- (void)setHiddenRightBarButtonItem:(id)a3;
- (void)setHidesBackButton:(BOOL)a3;
- (void)setInstructionLabel:(id)a3;
- (void)setInstructionLabelTextColor:(id)a3;
- (void)setShowingSpinner:(BOOL)a3;
- (void)setSpinnerItem:(id)a3;
- (void)showNavigationBarSpinner:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation NPKBridgeInstructionViewController

- (NPKBridgeInstructionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)NPKBridgeInstructionViewController;
  v4 = [(NPKBridgeInstructionViewController *)&v8 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    id v5 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:v4 action:"_cancel"];
    v6 = [(NPKBridgeInstructionViewController *)v4 navigationItem];
    [v6 setLeftBarButtonItem:v5];
  }
  return v4;
}

- (UIActivityIndicatorView)activityIndicatorView
{
  activityIndicatorView = self->_activityIndicatorView;
  if (!activityIndicatorView)
  {
    v4 = (UIActivityIndicatorView *)[objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
    id v5 = self->_activityIndicatorView;
    self->_activityIndicatorView = v4;

    activityIndicatorView = self->_activityIndicatorView;
  }

  return activityIndicatorView;
}

- (UIBarButtonItem)spinnerItem
{
  spinnerItem = self->_spinnerItem;
  if (!spinnerItem)
  {
    id v4 = objc_alloc((Class)UIBarButtonItem);
    id v5 = [(NPKBridgeInstructionViewController *)self activityIndicatorView];
    v6 = (UIBarButtonItem *)[v4 initWithCustomView:v5];
    v7 = self->_spinnerItem;
    self->_spinnerItem = v6;

    spinnerItem = self->_spinnerItem;
  }

  return spinnerItem;
}

- (void)viewDidLoad
{
  v13.receiver = self;
  v13.super_class = (Class)NPKBridgeInstructionViewController;
  [(NPKBridgeInstructionViewController *)&v13 viewDidLoad];
  v3 = [(NPKBridgeInstructionViewController *)self _instructionTitle];
  [(NPKBridgeInstructionViewController *)self setTitle:v3];

  id v4 = [(NPKBridgeInstructionViewController *)self _instructionMessage];
  id v5 = [(NPKBridgeInstructionViewController *)self instructionLabel];
  [v5 setText:v4];

  id v6 = objc_alloc_init((Class)UILabel);
  v7 = [(NPKBridgeInstructionViewController *)self _instructionMessage];
  [v6 setText:v7];

  objc_super v8 = [(NPKBridgeInstructionViewController *)self instructionLabelTextColor];
  if (v8)
  {
    [v6 setTextColor:v8];
  }
  else
  {
    v9 = BPSTextColor();
    [v6 setTextColor:v9];
  }
  v10 = +[UIFont systemFontOfSize:15.0];
  [v6 setFont:v10];

  [v6 setNumberOfLines:0];
  [v6 setTextAlignment:1];
  [(NPKBridgeInstructionViewController *)self setInstructionLabel:v6];
  v11 = [(NPKBridgeInstructionViewController *)self view];
  [v11 addSubview:v6];
  v12 = BPSSetupBackgroundColor();
  [v11 setBackgroundColor:v12];
}

- (void)viewWillLayoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)NPKBridgeInstructionViewController;
  [(NPKBridgeInstructionViewController *)&v12 viewWillLayoutSubviews];
  v3 = [(NPKBridgeInstructionViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  objc_super v8 = [(NPKBridgeInstructionViewController *)self instructionLabel];
  objc_msgSend(v8, "sizeThatFits:", v5 + -80.0, v7 + -80.0);

  v9 = [(NPKBridgeInstructionViewController *)self navigationController];
  v10 = [v9 navigationBar];
  [v10 bounds];
  CGRectGetHeight(v13);
  v11 = +[UIScreen mainScreen];
  [v11 scale];
  UIRectIntegralWithScale();
  -[UILabel setFrame:](self->_instructionLabel, "setFrame:");
}

- (void)showNavigationBarSpinner:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(NPKBridgeInstructionViewController *)self showingSpinner] != a3)
  {
    [(NPKBridgeInstructionViewController *)self setShowingSpinner:v3];
    uint64_t v5 = [(NPKBridgeInstructionViewController *)self showingSpinner] ^ 1;
    double v6 = [(NPKBridgeInstructionViewController *)self navigationController];
    double v7 = [v6 view];
    objc_super v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      id v9 = [(NPKBridgeInstructionViewController *)self view];
    }
    id v17 = v9;

    [(NPKBridgeInstructionViewController *)self _setNavigationBarEnabled:v5];
    v10 = [(NPKBridgeInstructionViewController *)self navigationItem];
    if ([(NPKBridgeInstructionViewController *)self showingSpinner])
    {
      v11 = [v10 rightBarButtonItem];
      [(NPKBridgeInstructionViewController *)self setHiddenRightBarButtonItem:v11];

      -[NPKBridgeInstructionViewController setHidesBackButton:](self, "setHidesBackButton:", [v10 hidesBackButton]);
      objc_super v12 = [(NPKBridgeInstructionViewController *)self activityIndicatorView];
      [v12 startAnimating];

      CGRect v13 = [(NPKBridgeInstructionViewController *)self spinnerItem];
      [v10 setRightBarButtonItem:v13];

      BOOL v14 = 1;
    }
    else
    {
      v15 = [(NPKBridgeInstructionViewController *)self activityIndicatorView];
      [v15 stopAnimating];

      v16 = [(NPKBridgeInstructionViewController *)self hiddenRightBarButtonItem];
      [v10 setRightBarButtonItem:v16];

      BOOL v14 = [(NPKBridgeInstructionViewController *)self hidesBackButton];
    }
    [v10 setHidesBackButton:v14];
    [v17 setNeedsLayout];
  }
}

- (void)handleErrorWithTitle:(id)a3 message:(id)a4 acknowledgeButtonTitle:(id)a5
{
  id v8 = a5;
  id v9 = +[UIAlertController alertControllerWithTitle:a3 message:a4 preferredStyle:1];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_4E64;
  v11[3] = &unk_2C680;
  v11[4] = self;
  v10 = +[UIAlertAction actionWithTitle:v8 style:1 handler:v11];

  [v9 addAction:v10];
  [(NPKBridgeInstructionViewController *)self presentViewController:v9 animated:1 completion:0];
}

- (void)_cancel
{
  uint64_t v4 = [(NPKBridgeInstructionViewController *)self cancellationHandler];
  [(NPKBridgeInstructionViewController *)self setCancellationHandler:0];
  BOOL v3 = (void *)v4;
  if (v4)
  {
    (*(void (**)(uint64_t))(v4 + 16))(v4);
    BOOL v3 = (void *)v4;
  }
}

- (void)_setNavigationBarEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v11 = [(NPKBridgeInstructionViewController *)self navigationController];
  if (v11)
  {
    uint64_t v5 = [v11 navigationBar];
    [v5 setUserInteractionEnabled:v3];

    double v6 = [v11 interactivePopGestureRecognizer];
    [v6 setEnabled:v3];
  }
  double v7 = [(NPKBridgeInstructionViewController *)self navigationItem];
  id v8 = v7;
  if (v7)
  {
    id v9 = [v7 leftBarButtonItem];
    [v9 setEnabled:v3];

    v10 = [v8 rightBarButtonItem];
    [v10 setEnabled:v3];
  }
}

- (id)_instructionTitle
{
  return 0;
}

- (id)_instructionMessage
{
  return 0;
}

- (id)cancellationHandler
{
  return self->_cancellationHandler;
}

- (void)setCancellationHandler:(id)a3
{
}

- (UIColor)instructionLabelTextColor
{
  return self->_instructionLabelTextColor;
}

- (void)setInstructionLabelTextColor:(id)a3
{
}

- (UILabel)instructionLabel
{
  return self->_instructionLabel;
}

- (void)setInstructionLabel:(id)a3
{
}

- (void)setActivityIndicatorView:(id)a3
{
}

- (void)setSpinnerItem:(id)a3
{
}

- (UIBarButtonItem)hiddenRightBarButtonItem
{
  return self->_hiddenRightBarButtonItem;
}

- (void)setHiddenRightBarButtonItem:(id)a3
{
}

- (BOOL)hidesBackButton
{
  return self->_hidesBackButton;
}

- (void)setHidesBackButton:(BOOL)a3
{
  self->_hidesBackButton = a3;
}

- (BOOL)showingSpinner
{
  return self->_showingSpinner;
}

- (void)setShowingSpinner:(BOOL)a3
{
  self->_showingSpinner = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hiddenRightBarButtonItem, 0);
  objc_storeStrong((id *)&self->_spinnerItem, 0);
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_storeStrong((id *)&self->_instructionLabel, 0);
  objc_storeStrong((id *)&self->_instructionLabelTextColor, 0);

  objc_storeStrong(&self->_cancellationHandler, 0);
}

@end