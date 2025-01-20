@interface AAUISpinnerViewController
+ (id)newSignInProgressViewWithFullName:(id)a3;
+ (id)newSignInProgressViewWithFullName:(id)a3 forAccount:(id)a4;
- (AAUISpinnerViewController)initWithCoder:(id)a3;
- (AAUISpinnerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (BOOL)isSpinning;
- (UILabel)label;
- (void)_commonInit;
- (void)setLabel:(id)a3;
- (void)setSpinning:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation AAUISpinnerViewController

+ (id)newSignInProgressViewWithFullName:(id)a3
{
  return +[AAUISignInProgressViewShim newSignInProgressViewWithFullName:a3];
}

+ (id)newSignInProgressViewWithFullName:(id)a3 forAccount:(id)a4
{
  return +[AAUISignInProgressViewShim newSignInProgressViewWithFullName:a3 forAccount:a4];
}

- (AAUISpinnerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)AAUISpinnerViewController;
  v4 = [(AAUISpinnerViewController *)&v7 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4) {
    [(AAUISpinnerViewController *)v4 _commonInit];
  }
  return v5;
}

- (AAUISpinnerViewController)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AAUISpinnerViewController;
  v3 = [(AAUISpinnerViewController *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(AAUISpinnerViewController *)v3 _commonInit];
  }
  return v4;
}

- (void)_commonInit
{
  v3 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
  label = self->_label;
  self->_label = v3;

  [(UILabel *)self->_label setLineBreakMode:0];
  [(UILabel *)self->_label setNumberOfLines:0];
  [(UILabel *)self->_label setTextAlignment:1];
  [(UILabel *)self->_label setTranslatesAutoresizingMaskIntoConstraints:0];
  v5 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
  spinnerView = self->_spinnerView;
  self->_spinnerView = v5;

  [(UIActivityIndicatorView *)self->_spinnerView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(AAUISpinnerViewController *)self setSpinning:1];
}

- (void)viewDidLoad
{
  v31[5] = *MEMORY[0x263EF8340];
  v30.receiver = self;
  v30.super_class = (Class)AAUISpinnerViewController;
  [(AAUISpinnerViewController *)&v30 viewDidLoad];
  v3 = [(AAUISpinnerViewController *)self view];
  v4 = [MEMORY[0x263F825C8] systemBackgroundColor];
  [v3 setBackgroundColor:v4];

  v5 = [(AAUISpinnerViewController *)self view];
  [v5 addSubview:self->_label];

  objc_super v6 = [(AAUISpinnerViewController *)self view];
  [v6 addSubview:self->_spinnerView];

  v21 = (void *)MEMORY[0x263F08938];
  v29 = [(UILabel *)self->_label topAnchor];
  v28 = [(UIActivityIndicatorView *)self->_spinnerView bottomAnchor];
  v27 = [v29 constraintEqualToAnchor:v28 constant:8.0];
  v31[0] = v27;
  v25 = [(UILabel *)self->_label leadingAnchor];
  v26 = [(AAUISpinnerViewController *)self view];
  v24 = [v26 safeAreaLayoutGuide];
  v23 = [v24 leadingAnchor];
  v22 = [v25 constraintEqualToAnchor:v23 constant:8.0];
  v31[1] = v22;
  v18 = [(UILabel *)self->_label trailingAnchor];
  v20 = [(AAUISpinnerViewController *)self view];
  v19 = [v20 safeAreaLayoutGuide];
  v17 = [v19 trailingAnchor];
  objc_super v7 = [v18 constraintEqualToAnchor:v17 constant:-8.0];
  v31[2] = v7;
  v8 = [(UIActivityIndicatorView *)self->_spinnerView centerXAnchor];
  v9 = [(AAUISpinnerViewController *)self view];
  v10 = [v9 centerXAnchor];
  v11 = [v8 constraintEqualToAnchor:v10];
  v31[3] = v11;
  v12 = [(UIActivityIndicatorView *)self->_spinnerView centerYAnchor];
  v13 = [(AAUISpinnerViewController *)self view];
  v14 = [v13 centerYAnchor];
  v15 = [v12 constraintEqualToAnchor:v14];
  v31[4] = v15;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:5];
  [v21 activateConstraints:v16];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)AAUISpinnerViewController;
  -[AAUISpinnerViewController viewWillAppear:](&v6, sel_viewWillAppear_);
  v5 = [(AAUISpinnerViewController *)self navigationController];
  [v5 setNavigationBarHidden:1 animated:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)AAUISpinnerViewController;
  -[AAUISpinnerViewController viewWillDisappear:](&v6, sel_viewWillDisappear_);
  v5 = [(AAUISpinnerViewController *)self navigationController];
  [v5 setNavigationBarHidden:0 animated:v3];
}

- (BOOL)isSpinning
{
  return [(UIActivityIndicatorView *)self->_spinnerView isAnimating];
}

- (void)setSpinning:(BOOL)a3
{
  spinnerView = self->_spinnerView;
  if (a3) {
    [(UIActivityIndicatorView *)spinnerView startAnimating];
  }
  else {
    [(UIActivityIndicatorView *)spinnerView stopAnimating];
  }
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_spinnerView, 0);
}

@end