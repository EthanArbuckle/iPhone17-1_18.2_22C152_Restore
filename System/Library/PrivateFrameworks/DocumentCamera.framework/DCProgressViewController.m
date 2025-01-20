@interface DCProgressViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)showsCancel;
- (DCCircularProgressView)circularProgressView;
- (DCProgressViewController)initWithDelegate:(id)a3;
- (DCProgressViewControllerDelegate)progressDelegate;
- (NSProgress)observedProgress;
- (UIActivityIndicatorView)activityIndicator;
- (UILabel)label;
- (void)setActivityIndicator:(id)a3;
- (void)setCircularProgressView:(id)a3;
- (void)setLabel:(id)a3;
- (void)setObservedProgress:(id)a3;
- (void)setProgressDelegate:(id)a3;
- (void)setShowsCancel:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation DCProgressViewController

- (DCProgressViewController)initWithDelegate:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v8.receiver = self;
  v8.super_class = (Class)DCProgressViewController;
  v6 = [(DCProgressViewController *)&v8 initWithNibName:@"DCProgressViewController" bundle:v5];

  if (v6) {
    [(DCProgressViewController *)v6 setProgressDelegate:v4];
  }

  return v6;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)DCProgressViewController;
  [(DCProgressViewController *)&v7 viewDidLoad];
  v3 = [MEMORY[0x263F1C550] clearColor];
  id v4 = [(DCProgressViewController *)self view];
  [v4 setBackgroundColor:v3];

  v5 = [(DCProgressViewController *)self label];
  [v5 setText:@" "];

  v6 = [(DCProgressViewController *)self circularProgressView];
  [v6 setHidden:1];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)DCProgressViewController;
  [(DCProgressViewController *)&v5 viewWillAppear:a3];
  id v4 = [(DCProgressViewController *)self activityIndicator];
  [v4 startAnimating];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DCProgressViewController;
  [(DCProgressViewController *)&v6 viewWillDisappear:a3];
  id v4 = [(DCProgressViewController *)self activityIndicator];
  [v4 stopAnimating];

  objc_super v5 = [(DCProgressViewController *)self progressDelegate];
  [v5 willDismissProgressViewController:self];
}

- (void)setObservedProgress:(id)a3
{
  objc_super v5 = (NSProgress *)a3;
  if (self->_observedProgress != v5)
  {
    v13 = v5;
    objc_storeStrong((id *)&self->_observedProgress, a3);
    objc_super v6 = [(DCProgressViewController *)self circularProgressView];
    [v6 setObservedProgress:v13];

    observedProgress = self->_observedProgress;
    objc_super v8 = [(DCProgressViewController *)self activityIndicator];
    v9 = v8;
    if (observedProgress)
    {
      [v8 setHidden:1];

      v10 = [(DCProgressViewController *)self circularProgressView];
      v11 = v10;
      uint64_t v12 = 0;
    }
    else
    {
      [v8 setHidden:0];

      v10 = [(DCProgressViewController *)self circularProgressView];
      v11 = v10;
      uint64_t v12 = 1;
    }
    [v10 setHidden:v12];

    objc_super v5 = v13;
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (NSProgress)observedProgress
{
  return self->_observedProgress;
}

- (BOOL)showsCancel
{
  return self->_showsCancel;
}

- (void)setShowsCancel:(BOOL)a3
{
  self->_showsCancel = a3;
}

- (DCProgressViewControllerDelegate)progressDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_progressDelegate);

  return (DCProgressViewControllerDelegate *)WeakRetained;
}

- (void)setProgressDelegate:(id)a3
{
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
}

- (DCCircularProgressView)circularProgressView
{
  return self->_circularProgressView;
}

- (void)setCircularProgressView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_circularProgressView, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_destroyWeak((id *)&self->_progressDelegate);

  objc_storeStrong((id *)&self->_observedProgress, 0);
}

@end