@interface RestoreFromComputerController
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (ATConnection)airTrafficConnection;
- (NSLayoutConstraint)imageViewHeightConstraint;
- (NSLayoutConstraint)imageViewTopConstraint;
- (NSString)headerTitle;
- (RestoreFromComputerController)init;
- (void)_setHeaderTitle:(id)a3 animated:(BOOL)a4;
- (void)_updateHeaderForConnectedToComputer:(BOOL)a3 animated:(BOOL)a4;
- (void)_updateImageViewHeight;
- (void)_updateImageViewPadding;
- (void)connection:(id)a3 updatedProgress:(id)a4;
- (void)connectionWasInterrupted:(id)a3;
- (void)dealloc;
- (void)setAirTrafficConnection:(id)a3;
- (void)setHeaderTitle:(id)a3;
- (void)setImageViewHeightConstraint:(id)a3;
- (void)setImageViewTopConstraint:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation RestoreFromComputerController

- (RestoreFromComputerController)init
{
  SEL v10 = a2;
  v3 = +[NSBundle mainBundle];
  v4 = [(NSBundle *)v3 localizedStringForKey:@"CONNECT_TO_COMPUTER" value:&stru_1002B4E18 table:@"Localizable"];
  id location = 0;
  v9.receiver = self;
  v9.super_class = (Class)RestoreFromComputerController;
  id location = [(RestoreFromComputerController *)&v9 initWithTitle:v4 detailText:&stru_1002B4E18 icon:0];
  objc_storeStrong(&location, location);

  if (location)
  {
    id v5 = objc_alloc_init((Class)sub_1000D1278());
    v6 = (void *)*((void *)location + 3);
    *((void *)location + 3) = v5;

    [*((id *)location + 3) setDelegate:location];
    [*((id *)location + 3) registerForStatus];
  }
  v7 = (RestoreFromComputerController *)location;
  objc_storeStrong(&location, 0);
  return v7;
}

- (void)dealloc
{
  v6 = self;
  SEL v5 = a2;
  v2 = [(RestoreFromComputerController *)self airTrafficConnection];
  [(ATConnection *)v2 unregisterForStatus];

  v3 = [(RestoreFromComputerController *)v6 airTrafficConnection];
  [(ATConnection *)v3 setDelegate:0];

  v4.receiver = v6;
  v4.super_class = (Class)RestoreFromComputerController;
  [(RestoreFromComputerController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v31 = self;
  SEL v30 = a2;
  v29.receiver = self;
  v29.super_class = (Class)RestoreFromComputerController;
  [(RestoreFromComputerController *)&v29 viewDidLoad];
  id v2 = objc_alloc((Class)UIImageView);
  v3 = +[UIImage imageNamed:@"ConnectToComputer"];
  id location = [v2 initWithImage:v3];

  [location setContentMode:1];
  [location setTranslatesAutoresizingMaskIntoConstraints:0];
  id v4 = [(RestoreFromComputerController *)v31 contentView];
  [v4 addSubview:location];

  id v5 = [location topAnchor];
  id v6 = [(RestoreFromComputerController *)v31 contentView];
  id v7 = [v6 topAnchor];
  id v8 = [v5 constraintEqualToAnchor:v7];
  [(RestoreFromComputerController *)v31 setImageViewTopConstraint:v8];

  id v9 = [location heightAnchor];
  id v10 = [v9 constraintEqualToConstant:0.0];
  [(RestoreFromComputerController *)v31 setImageViewHeightConstraint:v10];

  id v27 = [(RestoreFromComputerController *)v31 contentView];
  id v26 = [v27 trailingAnchor];
  id v25 = [location trailingAnchor];
  id v24 = [v26 constraintEqualToAnchor:];
  v32[0] = v24;
  id v23 = [(RestoreFromComputerController *)v31 contentView];
  id v11 = [v23 bottomAnchor];
  id v12 = [location bottomAnchor];
  id v13 = [v11 constraintEqualToAnchor:v12];
  v32[1] = v13;
  id v14 = [(RestoreFromComputerController *)v31 contentView];
  id v15 = [v14 leadingAnchor];
  id v16 = [location leadingAnchor];
  id v17 = [v15 constraintEqualToAnchor:v16];
  v32[2] = v17;
  v18 = [(RestoreFromComputerController *)v31 imageViewTopConstraint];
  v32[3] = v18;
  v19 = [(RestoreFromComputerController *)v31 imageViewHeightConstraint];
  v32[4] = v19;
  v20 = +[NSArray arrayWithObjects:v32 count:5];
  +[NSLayoutConstraint activateConstraints:v20];

  [(RestoreFromComputerController *)v31 _updateImageViewHeight];
  [(RestoreFromComputerController *)v31 _updateImageViewPadding];
  [(RestoreFromComputerController *)v31 _updateHeaderForConnectedToComputer:0 animated:0];
  id v21 = [(RestoreFromComputerController *)v31 headerView];
  [v21 setAlpha:0.0];

  id v22 = [(RestoreFromComputerController *)v31 contentView];
  [v22 setAlpha:0.0];

  objc_storeStrong(&location, 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  v18 = self;
  SEL v17 = a2;
  BOOL v16 = a3;
  id v10 = _NSConcreteStackBlock;
  int v11 = -1073741824;
  int v12 = 0;
  id v13 = sub_1000D1A10;
  id v14 = &unk_1002B0D20;
  id v15 = self;
  id v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = sub_1000D1A3C;
  id v8 = &unk_1002B0EC0;
  id v9 = v18;
  +[UIView animateWithDuration:&v10 animations:&v4 completion:0.5];
  v3.receiver = v18;
  v3.super_class = (Class)RestoreFromComputerController;
  [(RestoreFromComputerController *)&v3 viewDidAppear:v16];
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong((id *)&v15, 0);
}

- (void)viewWillDisappear:(BOOL)a3
{
  int v12 = self;
  SEL v11 = a2;
  BOOL v10 = a3;
  id v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = sub_1000D1C70;
  id v8 = &unk_1002B0D20;
  id v9 = self;
  +[UIView animateWithDuration:&v4 animations:0.25];
  v3.receiver = v12;
  v3.super_class = (Class)RestoreFromComputerController;
  [(RestoreFromComputerController *)&v3 viewWillDisappear:v10];
  objc_storeStrong((id *)&v9, 0);
}

- (void)viewDidLayoutSubviews
{
  id v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)RestoreFromComputerController;
  [(RestoreFromComputerController *)&v2 viewDidLayoutSubviews];
  [(RestoreFromComputerController *)v4 _updateImageViewHeight];
  [(RestoreFromComputerController *)v4 _updateImageViewPadding];
}

- (void)traitCollectionDidChange:(id)a3
{
  int v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)RestoreFromComputerController;
  [(RestoreFromComputerController *)&v3 traitCollectionDidChange:location[0]];
  [(RestoreFromComputerController *)v5 _updateImageViewPadding];
  objc_storeStrong(location, 0);
}

- (void)_updateImageViewHeight
{
  id v2 = [(RestoreFromComputerController *)self navigationController];
  id v3 = [v2 view];
  [v3 frame];
  CGFloat v4 = CGRectGetHeight(v7) * 0.55;

  int v5 = [(RestoreFromComputerController *)self imageViewHeightConstraint];
  [(NSLayoutConstraint *)v5 setConstant:v4];
}

- (void)_updateImageViewPadding
{
  id v2 = [(RestoreFromComputerController *)self view];
  id v3 = [(RestoreFromComputerController *)self contentView];
  [v3 frame];
  double v24 = v4;
  double v23 = v5;
  double v26 = v6;
  double v25 = v7;
  id v8 = [(RestoreFromComputerController *)self scrollView];
  [v2 convertRect:v8 fromView:v23, v24, v25, v26];
  v27.origin.y = v9;
  v27.origin.x = v10;
  v27.size.height = v11;
  v27.size.width = v12;

  id v13 = [(RestoreFromComputerController *)self imageViewHeightConstraint];
  [(NSLayoutConstraint *)v13 constant];
  double v15 = v14;

  double v22 = v15;
  id v16 = [(RestoreFromComputerController *)self view];
  [v16 frame];
  CGRect rect = v29;
  double MaxY = CGRectGetMaxY(v29);
  double v18 = MaxY - CGRectGetMinY(v27) - v22;

  id v19 = [(RestoreFromComputerController *)self scrollView];
  [v19 setScrollEnabled:v18 < 0.0];

  v20 = [(RestoreFromComputerController *)self imageViewTopConstraint];
  if (v18 <= 0.0) {
    [(NSLayoutConstraint *)v20 setConstant:0.0];
  }
  else {
    [(NSLayoutConstraint *)v20 setConstant:v18];
  }
}

- (void)_updateHeaderForConnectedToComputer:(BOOL)a3 animated:(BOOL)a4
{
  if (a3)
  {
    double v4 = +[NSBundle mainBundle];
    double v5 = [(NSBundle *)v4 localizedStringForKey:@"CONNECTED_TO_COMPUTER" value:&stru_1002B4E18 table:@"Localizable"];
  }
  else
  {
    double v4 = +[NSBundle mainBundle];
    double v5 = [(NSBundle *)v4 localizedStringForKey:@"CONNECT_TO_COMPUTER" value:&stru_1002B4E18 table:@"Localizable"];
  }
  [(RestoreFromComputerController *)self _setHeaderTitle:v5 animated:a4];
}

- (void)_setHeaderTitle:(id)a3 animated:(BOOL)a4
{
  double v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v22 = a4;
  double v5 = [(RestoreFromComputerController *)v24 headerTitle];
  unsigned __int8 v6 = [(NSString *)v5 isEqualToString:location[0]];

  if (v6)
  {
    int v21 = 1;
  }
  else
  {
    if (v22)
    {
      double v15 = _NSConcreteStackBlock;
      int v16 = -1073741824;
      int v17 = 0;
      double v18 = sub_1000D23D4;
      id v19 = &unk_1002B0D20;
      v20 = v24;
      id v8 = _NSConcreteStackBlock;
      int v9 = -1073741824;
      int v10 = 0;
      CGFloat v11 = sub_1000D2428;
      CGFloat v12 = &unk_1002B20E8;
      id v13 = v24;
      id v14 = location[0];
      +[UIView animateWithDuration:&v15 animations:&v8 completion:0.5];
      objc_storeStrong(&v14, 0);
      objc_storeStrong((id *)&v13, 0);
      objc_storeStrong((id *)&v20, 0);
    }
    else
    {
      id v7 = [(RestoreFromComputerController *)v24 headerView];
      [v7 setTitle:location[0]];
    }
    [(RestoreFromComputerController *)v24 setHeaderTitle:location[0]];
    int v21 = 0;
  }
  objc_storeStrong(location, 0);
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 20;
}

- (void)connection:(id)a3 updatedProgress:(id)a4
{
  int v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = 0;
  objc_storeStrong(&v14, a4);
  id v5 = [v14 objectForKey:@"ConnectedLibraries"];
  id v6 = [v5 count];

  v13[2] = v6;
  id v7 = &_dispatch_main_q;
  block = _NSConcreteStackBlock;
  int v9 = -1073741824;
  int v10 = 0;
  CGFloat v11 = sub_1000D26F4;
  CGFloat v12 = &unk_1002B1198;
  v13[0] = v16;
  v13[1] = v6;
  dispatch_async((dispatch_queue_t)v7, &block);

  objc_storeStrong(v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

- (void)connectionWasInterrupted:(id)a3
{
  CGFloat v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = &_dispatch_main_q;
  double v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = sub_1000D2824;
  id v8 = &unk_1002B0D20;
  int v9 = v11;
  dispatch_async((dispatch_queue_t)v3, &v4);

  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (NSString)headerTitle
{
  return self->_headerTitle;
}

- (void)setHeaderTitle:(id)a3
{
}

- (ATConnection)airTrafficConnection
{
  return self->_airTrafficConnection;
}

- (void)setAirTrafficConnection:(id)a3
{
}

- (NSLayoutConstraint)imageViewTopConstraint
{
  return self->_imageViewTopConstraint;
}

- (void)setImageViewTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)imageViewHeightConstraint
{
  return self->_imageViewHeightConstraint;
}

- (void)setImageViewHeightConstraint:(id)a3
{
}

- (void).cxx_destruct
{
}

@end