@interface CBWindowRootViewController
- (CBWindowLike)window;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)setWindow:(id)a3;
- (void)viewDidLoad;
@end

@implementation CBWindowRootViewController

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)CBWindowRootViewController;
  [(CBWindowRootViewController *)&v5 viewDidLoad];
  v3 = +[UIColor clearColor];
  v4 = [(CBWindowRootViewController *)self view];
  [v4 setBackgroundColor:v3];
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000271FC;
  v9[3] = &unk_10007A010;
  objc_copyWeak(&v11, &location);
  id v7 = v6;
  id v10 = v7;
  v8.receiver = self;
  v8.super_class = (Class)CBWindowRootViewController;
  [(CBWindowRootViewController *)&v8 dismissViewControllerAnimated:v4 completion:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (CBWindowLike)window
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_window);

  return (CBWindowLike *)WeakRetained;
}

- (void)setWindow:(id)a3
{
}

- (void).cxx_destruct
{
}

@end