@interface ServiceErrorViewController
- (NSString)buttonTitle;
- (NSString)message;
- (NSString)title;
- (ServiceErrorViewController)initWithActionBlock:(id)a3;
- (ServiceErrorViewController)initWithTitle:(id)a3 message:(id)a4 buttonTitle:(id)a5 actionBlock:(id)a6;
- (_UIContentUnavailableView)errorView;
- (id)actionBlock;
- (void)loadView;
- (void)setActionBlock:(id)a3;
- (void)setButtonTitle:(id)a3;
- (void)setErrorView:(id)a3;
- (void)setMessage:(id)a3;
- (void)setTitle:(id)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation ServiceErrorViewController

- (ServiceErrorViewController)initWithTitle:(id)a3 message:(id)a4 buttonTitle:(id)a5 actionBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v27.receiver = self;
  v27.super_class = (Class)ServiceErrorViewController;
  v14 = [(ServiceErrorViewController *)&v27 initWithNibName:0 bundle:0];
  if (v14)
  {
    id v15 = objc_retainBlock(v13);
    id actionBlock = v14->_actionBlock;
    v14->_id actionBlock = v15;

    v17 = [_UIContentUnavailableView initWithFrame:&stru_10004DF18 title:0 style:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    errorView = v14->_errorView;
    v14->_errorView = v17;

    if (v10)
    {
      [(_UIContentUnavailableView *)v14->_errorView setTitle:v10];
    }
    else
    {
      v19 = +[NSBundle bundleForClass:objc_opt_class()];
      v20 = [v19 localizedStringForKey:@"CANNOT_CONNECT_TO_ITUNES_STORE" value:&stru_10004DF18 table:0];
      [(_UIContentUnavailableView *)v14->_errorView setTitle:v20];
    }
    [(_UIContentUnavailableView *)v14->_errorView setMessage:v11];
    if (v13)
    {
      if (v12)
      {
        [(_UIContentUnavailableView *)v14->_errorView setButtonTitle:v12];
      }
      else
      {
        v21 = +[NSBundle bundleForClass:objc_opt_class()];
        v22 = [v21 localizedStringForKey:@"NETWORK_ERROR_BUTTON_RETRY" value:&stru_10004DF18 table:0];
        [(_UIContentUnavailableView *)v14->_errorView setButtonTitle:v22];
      }
      v23 = v14->_errorView;
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_100009208;
      v25[3] = &unk_10004CDF0;
      id v26 = v13;
      [(_UIContentUnavailableView *)v23 setButtonAction:v25];
    }
  }

  return v14;
}

- (ServiceErrorViewController)initWithActionBlock:(id)a3
{
  return [(ServiceErrorViewController *)self initWithTitle:0 message:0 buttonTitle:0 actionBlock:a3];
}

- (void)loadView
{
  v5.receiver = self;
  v5.super_class = (Class)ServiceErrorViewController;
  [(ServiceErrorViewController *)&v5 loadView];
  v3 = [(ServiceErrorViewController *)self view];
  v4 = [(ServiceErrorViewController *)self errorView];
  [v3 addSubview:v4];
}

- (void)viewWillLayoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)ServiceErrorViewController;
  [(ServiceErrorViewController *)&v13 viewWillLayoutSubviews];
  v3 = [(ServiceErrorViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  id v12 = [(ServiceErrorViewController *)self errorView];
  [v12 setFrame:v5, v7, v9, v11];
}

- (NSString)buttonTitle
{
  v2 = [(ServiceErrorViewController *)self errorView];
  v3 = [v2 buttonTitle];

  return (NSString *)v3;
}

- (NSString)message
{
  v2 = [(ServiceErrorViewController *)self errorView];
  v3 = [v2 message];

  return (NSString *)v3;
}

- (NSString)title
{
  v2 = [(ServiceErrorViewController *)self errorView];
  v3 = [v2 title];

  return (NSString *)v3;
}

- (void)setButtonTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(ServiceErrorViewController *)self errorView];
  [v5 setButtonTitle:v4];
}

- (void)setMessage:(id)a3
{
  id v4 = a3;
  id v5 = [(ServiceErrorViewController *)self errorView];
  [v5 setMessage:v4];
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(ServiceErrorViewController *)self errorView];
  [v5 setTitle:v4];
}

- (id)actionBlock
{
  return self->_actionBlock;
}

- (void)setActionBlock:(id)a3
{
}

- (_UIContentUnavailableView)errorView
{
  return self->_errorView;
}

- (void)setErrorView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorView, 0);

  objc_storeStrong(&self->_actionBlock, 0);
}

@end