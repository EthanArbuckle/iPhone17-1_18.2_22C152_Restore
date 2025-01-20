@interface CalendarSpinner
- (CalendarSpinner)initWithViewController:(id)a3;
- (UIActivityIndicatorView)spinner;
- (void)startSpinner;
- (void)stopSpinner;
@end

@implementation CalendarSpinner

- (CalendarSpinner)initWithViewController:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CalendarSpinner;
  v5 = [(CalendarSpinner *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_viewController, v4);
    v7 = (UIActivityIndicatorView *)[objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
    spinner = v6->_spinner;
    v6->_spinner = v7;
  }
  return v6;
}

- (void)startSpinner
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  id v3 = [objc_alloc((Class)UIBarButtonItem) initWithCustomView:self->_spinner];
  id v4 = [WeakRetained navigationItem];
  v5 = [v4 rightBarButtonItem];
  prevButtonItem = self->_prevButtonItem;
  self->_prevButtonItem = v5;

  v7 = [WeakRetained navigationItem];
  [v7 setRightBarButtonItem:v3 animated:1];

  [(UIActivityIndicatorView *)self->_spinner startAnimating];
}

- (void)stopSpinner
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  spinner = self->_spinner;
  if (spinner) {
    [(UIActivityIndicatorView *)spinner stopAnimating];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewController);
  id v4 = [WeakRetained navigationItem];
  [v4 setRightBarButtonItem:self->_prevButtonItem animated:1];
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_destroyWeak((id *)&self->_viewController);

  objc_storeStrong((id *)&self->_prevButtonItem, 0);
}

@end