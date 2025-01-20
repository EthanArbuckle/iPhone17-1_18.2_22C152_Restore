@interface PHViewController
- (BOOL)contentUnavailable;
- (NSString)contentUnavailableViewTitle;
- (PHContentUnavailable)contentUnavailableView;
- (PHViewController)init;
- (PHViewController)initWithCoder:(id)a3;
- (PHViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (int64_t)whitePointAdaptivityStyle;
- (void)commonInit;
- (void)dealloc;
- (void)didReceiveMemoryWarning;
- (void)makeUIForDefaultPNG;
- (void)setContentUnavailable:(BOOL)a3;
- (void)setContentUnavailable:(BOOL)a3 animated:(BOOL)a4;
- (void)setContentUnavailableView:(id)a3;
- (void)setContentUnavailableViewTitle:(id)a3;
- (void)setWhitePointAdaptivityStyle:(int64_t)a3;
@end

@implementation PHViewController

- (PHViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)PHViewController;
  v2 = [(PHViewController *)&v5 init];
  v3 = v2;
  if (v2) {
    [(PHViewController *)v2 commonInit];
  }
  return v3;
}

- (PHViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PHViewController;
  v4 = [(PHViewController *)&v7 initWithNibName:a3 bundle:a4];
  objc_super v5 = v4;
  if (v4) {
    [(PHViewController *)v4 commonInit];
  }
  return v5;
}

- (PHViewController)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PHViewController;
  v3 = [(PHViewController *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(PHViewController *)v3 commonInit];
  }
  return v4;
}

- (void)commonInit
{
  self->_whitePointAdaptivityStyle = 0;
  if ([(PHViewController *)self conformsToProtocol:&OBJC_PROTOCOL___PHTabBarItemProtocol])
  {
    v3 = self;
    id v4 = objc_alloc((Class)UITabBarItem);
    objc_super v5 = [(PHViewController *)v3 tabBarItemTitle];
    objc_super v6 = [(PHViewController *)v3 tabBarItemImage];
    objc_super v7 = [(PHViewController *)v3 tabBarItemSelectedImage];

    id v9 = [v4 initWithTitle:v5 image:v6 selectedImage:v7];
    goto LABEL_6;
  }
  if ([(PHViewController *)self conformsToProtocol:&OBJC_PROTOCOL___PHTabBarSystemItemProtocol])
  {
    objc_super v5 = self;
    id v9 = [objc_alloc((Class)UITabBarItem) initWithTabBarSystemItem:-[PHViewController tabBarSystemItem](v5, "tabBarSystemItem") tag:-[PHViewController tabBarSystemItemTag](v5, "tabBarSystemItemTag")];
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
LABEL_7:

      id v8 = v9;
      goto LABEL_9;
    }
    objc_super v6 = [(PHViewController *)v5 tabBarSystemItemTitle];
    [v9 _setInternalTitle:v6];
LABEL_6:

    goto LABEL_7;
  }
  id v8 = 0;
LABEL_9:
  id v10 = v8;
  [(PHViewController *)self setTabBarItem:v8];
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PHViewController;
  [(PHViewController *)&v4 dealloc];
}

- (void)didReceiveMemoryWarning
{
  v3 = PHDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v7 = (id)objc_opt_class();
    id v4 = v7;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ received memory warning, purging variables that can be dynamically restored.", buf, 0xCu);
  }
  v5.receiver = self;
  v5.super_class = (Class)PHViewController;
  [(PHViewController *)&v5 didReceiveMemoryWarning];
}

- (void)setContentUnavailable:(BOOL)a3
{
}

- (void)setContentUnavailable:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_contentUnavailable != a3)
  {
    BOOL v4 = a4;
    self->_contentUnavailable = a3;
    if (a3
      || ([(PHContentUnavailable *)self->_contentUnavailableView superview],
          id v7 = objc_claimAutoreleasedReturnValue(),
          v7,
          v7))
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = __51__PHViewController_setContentUnavailable_animated___block_invoke;
      v13[3] = &unk_10027CC10;
      BOOL v14 = a3;
      v13[4] = self;
      id v8 = objc_retainBlock(v13);
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = __51__PHViewController_setContentUnavailable_animated___block_invoke_2;
      v11[3] = &unk_10027C838;
      v11[4] = self;
      BOOL v12 = a3;
      id v9 = objc_retainBlock(v11);
      id v10 = v9;
      if (v4)
      {
        +[UIView animateWithDuration:4 delay:v9 options:v8 animations:0.300000012 completion:0.0];
      }
      else
      {
        ((void (*)(void *))v9[2])(v9);
        ((void (*)(void *, uint64_t))v8[2])(v8, 1);
      }
    }
  }
}

void __51__PHViewController_setContentUnavailable_animated___block_invoke(uint64_t a1, int a2)
{
  if (a2 && !*(unsigned char *)(a1 + 40))
  {
    id v2 = [*(id *)(a1 + 32) contentUnavailableView];
    [v2 setHidden:1];
    [v2 removeFromSuperview];
  }
}

void __51__PHViewController_setContentUnavailable_animated___block_invoke_2(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) contentUnavailableView];
  if (*(unsigned char *)(a1 + 40))
  {
    id v2 = [*(id *)(a1 + 32) view];
    [v2 addSubview:v4];

    v3 = [*(id *)(a1 + 32) view];
    [v3 bringSubviewToFront:v4];

    [v4 setAlpha:1.0];
    [v4 setHidden:0];
  }
  else
  {
    [v4 setAlpha:0.0];
  }
}

- (PHContentUnavailable)contentUnavailableView
{
  contentUnavailableView = self->_contentUnavailableView;
  if (!contentUnavailableView)
  {
    id v4 = objc_alloc((Class)_UIContentUnavailableView);
    objc_super v5 = [(PHViewController *)self view];
    [v5 bounds];
    objc_super v6 = (PHContentUnavailable *)[v4 initWithFrame:self->_contentUnavailableViewTitle];
    id v7 = self->_contentUnavailableView;
    self->_contentUnavailableView = v6;

    [(PHContentUnavailable *)self->_contentUnavailableView setAlpha:0.0];
    [(PHContentUnavailable *)self->_contentUnavailableView setAutoresizingMask:18];
    id v8 = [(PHViewController *)self view];
    id v9 = [v8 backgroundColor];
    [(PHContentUnavailable *)self->_contentUnavailableView setBackgroundColor:v9];

    [(PHContentUnavailable *)self->_contentUnavailableView setHidden:1];
    contentUnavailableView = self->_contentUnavailableView;
  }

  return contentUnavailableView;
}

- (void)setContentUnavailableViewTitle:(id)a3
{
  objc_super v5 = (NSString *)a3;
  if (self->_contentUnavailableViewTitle != v5)
  {
    objc_super v6 = v5;
    objc_storeStrong((id *)&self->_contentUnavailableViewTitle, a3);
    [(PHContentUnavailable *)self->_contentUnavailableView setTitle:self->_contentUnavailableViewTitle];
    objc_super v5 = v6;
  }
}

- (void)makeUIForDefaultPNG
{
  if (+[UIApplication shouldMakeUIForDefaultPNG])
  {
    id v3 = [(PHViewController *)self navigationItem];
    [v3 setLeftBarButtonItem:0];
    [v3 setRightBarButtonItem:0];
    [(PHViewController *)self setTabBarItem:0];
    [(PHViewController *)self setTitle:0];
  }
}

- (void)setWhitePointAdaptivityStyle:(int64_t)a3
{
  if (self->_whitePointAdaptivityStyle != a3)
  {
    self->_whitePointAdaptivityStyle = a3;
    [(PHViewController *)self setNeedsWhitePointAdaptivityStyleUpdate];
  }
}

- (BOOL)contentUnavailable
{
  return self->_contentUnavailable;
}

- (void)setContentUnavailableView:(id)a3
{
}

- (NSString)contentUnavailableViewTitle
{
  return self->_contentUnavailableViewTitle;
}

- (int64_t)whitePointAdaptivityStyle
{
  return self->_whitePointAdaptivityStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentUnavailableViewTitle, 0);

  objc_storeStrong((id *)&self->_contentUnavailableView, 0);
}

@end