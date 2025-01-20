@interface BYODBaseViewController
+ (id)log;
- (ACAccount)userAccount;
- (BYODBaseViewController)initWithACAccount:(id)a3;
- (void)createViewControllerWithTitle:(id)a3 attributedDetail:(id)a4 detailTextAlignment:(int64_t)a5 detailTextFontSize:(double)a6 icon:(id)a7;
- (void)createViewControllerWithTitle:(id)a3 detail:(id)a4 icon:(id)a5;
- (void)setUserAccount:(id)a3;
- (void)viewDidLoad;
@end

@implementation BYODBaseViewController

+ (id)log
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_29FDC;
  block[3] = &unk_B8D50;
  block[4] = a1;
  if (qword_D7388 != -1) {
    dispatch_once(&qword_D7388, block);
  }
  v2 = (void *)qword_D7380;

  return v2;
}

- (BYODBaseViewController)initWithACAccount:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BYODBaseViewController;
  v5 = [(BYODBaseViewController *)&v8 init];
  v6 = v5;
  if (v5) {
    [(BYODBaseViewController *)v5 setUserAccount:v4];
  }

  return v6;
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)BYODBaseViewController;
  [(BYODBaseViewController *)&v2 viewDidLoad];
}

- (void)createViewControllerWithTitle:(id)a3 detail:(id)a4 icon:(id)a5
{
  id v24 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [objc_alloc((Class)OBWelcomeController) initWithTitle:v24 detailText:v8 icon:v9 contentLayout:2];
  [(BYODBaseViewController *)self _addDataCardsView:v10];
  [(BYODBaseViewController *)self _addContentView:v10];
  [(BYODBaseViewController *)self _addButtonTrayButtons:v10];
  [(BYODBaseViewController *)self addChildViewController:v10];
  v11 = [(BYODBaseViewController *)self view];
  v12 = [v10 view];
  [v11 addSubview:v12];

  v13 = [(BYODBaseViewController *)self view];
  [v13 frame];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  v22 = [v10 view];
  objc_msgSend(v22, "setFrame:", v15, v17, v19, v21);

  v23 = [v10 view];
  [v23 setAutoresizingMask:18];

  [v10 didMoveToParentViewController:self];
}

- (void)createViewControllerWithTitle:(id)a3 attributedDetail:(id)a4 detailTextAlignment:(int64_t)a5 detailTextFontSize:(double)a6 icon:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  id v15 = [objc_alloc((Class)OBWelcomeController) initWithTitle:v12 detailText:0 icon:v14 contentLayout:2];
  id v16 = objc_alloc_init((Class)UITextView);
  [v16 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v16 setAttributedText:v13];
  [v16 setTextAlignment:a5];
  double v17 = +[UIFont systemFontOfSize:a6];
  [v16 setFont:v17];

  [v16 setSelectable:1];
  [v16 setEditable:0];
  [(BYODBaseViewController *)self _addDataCardsView:v15];
  [(BYODBaseViewController *)self _addContentView:v15];
  [(BYODBaseViewController *)self _addButtonTrayButtons:v15];
  [(BYODBaseViewController *)self addChildViewController:v15];
  double v18 = [(BYODBaseViewController *)self view];
  double v19 = [v15 view];
  [v18 addSubview:v19];

  double v20 = [v15 view];
  [v20 addSubview:v16];

  double v21 = +[BYODBaseViewController log];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v47 = 0;
    _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, "Added attributed text view to open a web link", v47, 2u);
  }

  v22 = [v16 heightAnchor];
  v23 = [v22 constraintEqualToConstant:400.0];
  [v23 setActive:1];

  id v24 = [v16 topAnchor];
  v25 = [v15 contentView];
  v26 = [v25 topAnchor];
  v27 = [v24 constraintEqualToAnchor:v26 constant:0.0];
  [v27 setActive:1];

  v28 = [v16 leadingAnchor];
  v29 = [v15 contentView];
  v30 = [v29 leadingAnchor];
  v31 = [v28 constraintEqualToAnchor:v30 constant:0.0];
  [v31 setActive:1];

  v32 = [v16 trailingAnchor];
  v33 = [v15 contentView];
  v34 = [v33 trailingAnchor];
  v35 = [v32 constraintEqualToAnchor:v34 constant:0.0];
  [v35 setActive:1];

  v36 = [(BYODBaseViewController *)self view];
  [v36 frame];
  double v38 = v37;
  double v40 = v39;
  double v42 = v41;
  double v44 = v43;
  v45 = [v15 view];
  objc_msgSend(v45, "setFrame:", v38, v40, v42, v44);

  v46 = [v15 view];
  [v46 setAutoresizingMask:18];

  [v15 didMoveToParentViewController:self];
}

- (ACAccount)userAccount
{
  return (ACAccount *)objc_getProperty(self, a2, 8, 1);
}

- (void)setUserAccount:(id)a3
{
}

- (void).cxx_destruct
{
}

@end