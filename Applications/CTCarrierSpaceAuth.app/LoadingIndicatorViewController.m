@interface LoadingIndicatorViewController
- (LoadingIndicatorViewController)init;
- (LoadingIndicatorViewController)initWithTitle:(id)a3 message:(id)a4;
- (NSString)messageText;
- (NSString)titleText;
- (UIActivityIndicatorView)spinnerView;
- (UILabel)messageLabel;
- (UILabel)titleLabel;
- (void)dealloc;
- (void)setMessageLabel:(id)a3;
- (void)setMessageText:(id)a3;
- (void)setSpinnerView:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTitleText:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation LoadingIndicatorViewController

- (LoadingIndicatorViewController)init
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = +[NSBundle bundleForClass:objc_opt_class()];
  v8.receiver = self;
  v8.super_class = (Class)LoadingIndicatorViewController;
  v6 = [(LoadingIndicatorViewController *)&v8 initWithNibName:v4 bundle:v5];

  return v6;
}

- (LoadingIndicatorViewController)initWithTitle:(id)a3 message:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(LoadingIndicatorViewController *)self init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_titleText, a3);
    objc_storeStrong((id *)&v10->_messageText, a4);
  }

  return v10;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)LoadingIndicatorViewController;
  [(LoadingIndicatorViewController *)&v7 viewDidLoad];
  titleText = self->_titleText;
  v4 = [(LoadingIndicatorViewController *)self titleLabel];
  [v4 setText:titleText];

  messageText = self->_messageText;
  v6 = [(LoadingIndicatorViewController *)self messageLabel];
  [v6 setText:messageText];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)LoadingIndicatorViewController;
  [(LoadingIndicatorViewController *)&v5 viewDidAppear:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_spinnerView);
  [WeakRetained startAnimating];
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_spinnerView);
  [WeakRetained stopAnimating];

  v4.receiver = self;
  v4.super_class = (Class)LoadingIndicatorViewController;
  [(LoadingIndicatorViewController *)&v4 dealloc];
}

- (UILabel)titleLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_titleLabel);

  return (UILabel *)WeakRetained;
}

- (void)setTitleLabel:(id)a3
{
}

- (UILabel)messageLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_messageLabel);

  return (UILabel *)WeakRetained;
}

- (void)setMessageLabel:(id)a3
{
}

- (UIActivityIndicatorView)spinnerView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_spinnerView);

  return (UIActivityIndicatorView *)WeakRetained;
}

- (void)setSpinnerView:(id)a3
{
}

- (NSString)titleText
{
  return self->_titleText;
}

- (void)setTitleText:(id)a3
{
}

- (NSString)messageText
{
  return self->_messageText;
}

- (void)setMessageText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageText, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_destroyWeak((id *)&self->_spinnerView);
  objc_destroyWeak((id *)&self->_messageLabel);

  objc_destroyWeak((id *)&self->_titleLabel);
}

@end