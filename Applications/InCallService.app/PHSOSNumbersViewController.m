@interface PHSOSNumbersViewController
- (BOOL)_canShowWhileLocked;
- (NSArray)sosHandles;
- (PHSOSNumbersViewController)initWithSOSHandles:(id)a3;
- (PHSOSNumbersViewControllerDelegate)delegate;
- (UILabel)titleLabel;
- (UITableView)tableView;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)didReceiveMemoryWarning;
- (void)setDelegate:(id)a3;
- (void)setSosHandles:(id)a3;
- (void)setTableView:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setUpConstraints;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateSOSHandles:(id)a3;
- (void)viewDidLoad;
@end

@implementation PHSOSNumbersViewController

- (PHSOSNumbersViewController)initWithSOSHandles:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PHSOSNumbersViewController;
  v6 = [(PHSOSNumbersViewController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_sosHandles, a3);
  }

  return v7;
}

- (void)viewDidLoad
{
  v31.receiver = self;
  v31.super_class = (Class)PHSOSNumbersViewController;
  [(PHSOSNumbersViewController *)&v31 viewDidLoad];
  id v3 = [objc_alloc((Class)UITableView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  [(PHSOSNumbersViewController *)self setTableView:v3];

  v4 = +[UIColor clearColor];
  id v5 = [(PHSOSNumbersViewController *)self tableView];
  [v5 setBackgroundColor:v4];

  v6 = [(PHSOSNumbersViewController *)self tableView];
  [v6 setDelegate:self];

  v7 = [(PHSOSNumbersViewController *)self tableView];
  [v7 setDataSource:self];

  v8 = objc_opt_new();
  objc_super v9 = [(PHSOSNumbersViewController *)self tableView];
  [v9 setTableFooterView:v8];

  v10 = [(PHSOSNumbersViewController *)self tableView];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

  v11 = +[UIColor darkGrayColor];
  v12 = [(PHSOSNumbersViewController *)self tableView];
  [v12 setSeparatorColor:v11];

  v13 = [(PHSOSNumbersViewController *)self tableView];
  uint64_t v14 = objc_opt_class();
  v15 = (objc_class *)objc_opt_class();
  v16 = NSStringFromClass(v15);
  [v13 registerClass:v14 forCellReuseIdentifier:v16];

  v17 = [(PHSOSNumbersViewController *)self view];
  v18 = [(PHSOSNumbersViewController *)self tableView];
  [v17 addSubview:v18];

  id v19 = objc_alloc_init((Class)UILabel);
  [(PHSOSNumbersViewController *)self setTitleLabel:v19];

  v20 = +[NSBundle mainBundle];
  v21 = [v20 localizedStringForKey:@"EMERGENCY_SOS" value:&stru_1002D6110 table:@"InCallService"];
  v22 = [(PHSOSNumbersViewController *)self titleLabel];
  [v22 setText:v21];

  v23 = [(PHSOSNumbersViewController *)self titleLabel];
  [v23 setTextAlignment:1];

  v24 = [(PHSOSNumbersViewController *)self titleLabel];
  [v24 setTranslatesAutoresizingMaskIntoConstraints:0];

  v25 = +[UIFont _lightSystemFontOfSize:36.0];
  v26 = [(PHSOSNumbersViewController *)self titleLabel];
  [v26 setFont:v25];

  v27 = +[UIColor whiteColor];
  v28 = [(PHSOSNumbersViewController *)self titleLabel];
  [v28 setTextColor:v27];

  v29 = [(PHSOSNumbersViewController *)self titleLabel];
  [v29 setNumberOfLines:0];

  v30 = [(PHSOSNumbersViewController *)self view];
  [v30 addSubview:self->_titleLabel];

  [(PHSOSNumbersViewController *)self setUpConstraints];
}

- (void)didReceiveMemoryWarning
{
  v2.receiver = self;
  v2.super_class = (Class)PHSOSNumbersViewController;
  [(PHSOSNumbersViewController *)&v2 didReceiveMemoryWarning];
}

- (void)setUpConstraints
{
  id v3 = [(PHSOSNumbersViewController *)self titleLabel];
  v4 = [v3 leadingAnchor];
  id v5 = [(PHSOSNumbersViewController *)self view];
  v6 = [v5 leadingAnchor];
  v43 = [v4 constraintEqualToAnchor:v6];

  v7 = [(PHSOSNumbersViewController *)self titleLabel];
  v8 = [v7 trailingAnchor];
  objc_super v9 = [(PHSOSNumbersViewController *)self view];
  v10 = [v9 trailingAnchor];
  v42 = [v8 constraintEqualToAnchor:v10];

  v11 = [(PHSOSNumbersViewController *)self titleLabel];
  v12 = [v11 topAnchor];
  v13 = [(PHSOSNumbersViewController *)self view];
  uint64_t v14 = [v13 topAnchor];
  v15 = [v12 constraintEqualToAnchor:v14];

  v16 = [(PHSOSNumbersViewController *)self titleLabel];
  v17 = [v16 centerXAnchor];
  v18 = [(PHSOSNumbersViewController *)self view];
  id v19 = [v18 centerXAnchor];
  v20 = [v17 constraintEqualToAnchor:v19];

  v21 = [(PHSOSNumbersViewController *)self tableView];
  v22 = [v21 leadingAnchor];
  v23 = [(PHSOSNumbersViewController *)self view];
  v24 = [v23 leadingAnchor];
  v25 = [v22 constraintEqualToAnchor:v24];

  v26 = [(PHSOSNumbersViewController *)self tableView];
  v27 = [v26 trailingAnchor];
  v28 = [(PHSOSNumbersViewController *)self view];
  v29 = [v28 trailingAnchor];
  v30 = [v27 constraintEqualToAnchor:v29];

  objc_super v31 = [(PHSOSNumbersViewController *)self tableView];
  v32 = [v31 topAnchor];
  v33 = [(PHSOSNumbersViewController *)self titleLabel];
  v34 = [v33 lastBaselineAnchor];
  v35 = [v32 constraintEqualToAnchor:v34 constant:57.0];

  v36 = [(PHSOSNumbersViewController *)self tableView];
  v37 = [v36 bottomAnchor];
  v38 = [(PHSOSNumbersViewController *)self view];
  v39 = [v38 bottomAnchor];
  v40 = [v37 constraintEqualToAnchor:v39];

  v44[0] = v43;
  v44[1] = v42;
  v44[2] = v15;
  v44[3] = v20;
  v44[4] = v25;
  v44[5] = v30;
  v44[6] = v35;
  v44[7] = v40;
  v41 = +[NSArray arrayWithObjects:v44 count:8];
  +[NSLayoutConstraint activateConstraints:v41];
}

- (void)updateSOSHandles:(id)a3
{
  objc_storeStrong((id *)&self->_sosHandles, a3);
  id v4 = [(PHSOSNumbersViewController *)self tableView];
  [v4 reloadData];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4 = [(PHSOSNumbersViewController *)self sosHandles];
  id v5 = [v4 count];

  return (int64_t)v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (objc_class *)objc_opt_class();
  objc_super v9 = NSStringFromClass(v8);
  v10 = [v7 dequeueReusableCellWithIdentifier:v9 forIndexPath:v6];

  v11 = [(PHSOSNumbersViewController *)self sosHandles];
  id v12 = [v6 row];

  v13 = [v11 objectAtIndexedSubscript:v12];

  uint64_t v14 = [[PHSOSNumberViewModel alloc] initWithSOSHandle:v13];
  [v10 populate:v14];

  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [(PHSOSNumbersViewController *)self delegate];
  [v6 sosNumbersViewController:self didSelectRowAtIndexPath:v5];
}

- (PHSOSNumbersViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PHSOSNumbersViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (NSArray)sosHandles
{
  return self->_sosHandles;
}

- (void)setSosHandles:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sosHandles, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end