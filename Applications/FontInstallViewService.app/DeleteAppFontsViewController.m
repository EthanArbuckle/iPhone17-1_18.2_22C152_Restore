@interface DeleteAppFontsViewController
- (DeleteAppFontsMainController)mainController;
- (UIButton)deleteButton;
- (UIButton)dontDeleteButton;
- (UILabel)deleteDescriptionLabel;
- (UILabel)deleteLabel;
- (UITableView)fontsTableView;
- (UIView)containerView;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)doDelete:(id)a3;
- (void)dontDelete:(id)a3;
- (void)setContainerView:(id)a3;
- (void)setDeleteButton:(id)a3;
- (void)setDeleteDescriptionLabel:(id)a3;
- (void)setDeleteLabel:(id)a3;
- (void)setDontDeleteButton:(id)a3;
- (void)setFontsTableView:(id)a3;
- (void)setMainController:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation DeleteAppFontsViewController

- (void)viewDidLoad
{
  v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)DeleteAppFontsViewController;
  [(DeleteAppFontsViewController *)&v2 viewDidLoad];
}

- (void)viewWillAppear:(BOOL)a3
{
  v48 = self;
  SEL v47 = a2;
  BOOL v46 = a3;
  NSLog(@"DeleteAppFonts viewWillAppear");
  v45.receiver = v48;
  v45.super_class = (Class)DeleteAppFontsViewController;
  [(DeleteAppFontsViewController *)&v45 viewWillAppear:v46];
  v16 = +[UIColor colorWithWhite:0.0 alpha:0.600000024];
  id v15 = [(DeleteAppFontsViewController *)v48 view];
  [v15 setBackgroundColor:v16];

  v18 = [(DeleteAppFontsViewController *)v48 containerView];
  v17 = [(UIView *)v18 layer];
  [(CALayer *)v17 setCornerRadius:8.0];

  v19 = +[NSBundle mainBundle];
  v44 = -[NSBundle localizedStringForKey:value:table:](v19, "localizedStringForKey:value:table:", @"DELETE_APP_MSG");

  v20 = v44;
  id WeakRetained = objc_loadWeakRetained((id *)&v48->_mainController);
  id v21 = [WeakRetained applicationName];
  v43 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v20, v21);

  v23 = v43;
  id v24 = objc_loadWeakRetained((id *)&v48->_deleteDescriptionLabel);
  [v24 setText:v23];

  v25 = +[NSBundle mainBundle];
  SEL v3 = [(NSBundle *)v25 localizedStringForKey:@"DELETE_APP_TITLE" value:&stru_100014650 table:0];
  v4 = v44;
  v44 = v3;

  v26 = v44;
  id v28 = objc_loadWeakRetained((id *)&v48->_mainController);
  id v27 = [v28 applicationName];
  v5 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v26, v27);
  v6 = v43;
  v43 = v5;

  v29 = v43;
  id v30 = objc_loadWeakRetained((id *)&v48->_deleteLabel);
  [v30 setText:v29];

  v31 = +[NSBundle mainBundle];
  v7 = [(NSBundle *)v31 localizedStringForKey:@"DO_DELETE_TITLE" value:&stru_100014650 table:0];
  v8 = v44;
  v44 = v7;

  v32 = v44;
  id v34 = objc_loadWeakRetained((id *)&v48->_mainController);
  id v33 = [v34 applicationName];
  v9 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v32, v33);
  v10 = v43;
  v43 = v9;

  id v35 = objc_loadWeakRetained((id *)&v48->_deleteButton);
  [v35 setTitle:v43 forState:];

  id v37 = +[UIColor _systemDestructiveTintColor];
  id v36 = objc_loadWeakRetained((id *)&v48->_deleteButton);
  [v36 setTintColor:v37];

  v38 = +[NSBundle mainBundle];
  v11 = [(NSBundle *)v38 localizedStringForKey:@"DONT_DELETE_TITLE" value:&stru_100014650 table:0];
  v12 = v44;
  v44 = v11;

  v39 = v44;
  id v41 = objc_loadWeakRetained((id *)&v48->_mainController);
  id v40 = [v41 applicationName];
  v13 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v39, v40);
  v14 = v43;
  v43 = v13;

  id v42 = objc_loadWeakRetained((id *)&v48->_dontDeleteButton);
  [v42 setTitle:v43 forState:0];

  objc_storeStrong((id *)&v43, 0);
  objc_storeStrong((id *)&v44, 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  v6 = self;
  SEL v5 = a2;
  BOOL v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)DeleteAppFontsViewController;
  [(DeleteAppFontsViewController *)&v3 viewDidAppear:a3];
}

- (void)doDelete:(id)a3
{
  SEL v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id WeakRetained = objc_loadWeakRetained((id *)&v5->_mainController);
  [WeakRetained doneWithDeleteAppFonts:1];

  objc_storeStrong(location, 0);
}

- (void)dontDelete:(id)a3
{
  SEL v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id WeakRetained = objc_loadWeakRetained((id *)&v5->_mainController);
  [WeakRetained doneWithDeleteAppFonts:0];

  objc_storeStrong(location, 0);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0);
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id WeakRetained = objc_loadWeakRetained((id *)&v9->_mainController);
  id v5 = [WeakRetained registeredFonts];
  id v7 = [v5 count];

  objc_storeStrong(location, 0);
  return (int64_t)v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v12 = 0;
  objc_storeStrong(&v12, a4);
  id v11 = [location[0] dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:v12];
  id WeakRetained = objc_loadWeakRetained((id *)&v14->_mainController);
  id v8 = [WeakRetained registeredFonts];
  id v7 = [v8 objectAtIndexedSubscript:[v12 row]];
  id v6 = [v11 textLabel];
  [v6 setText:v7];

  id v10 = v11;
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);

  return v10;
}

- (DeleteAppFontsMainController)mainController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mainController);

  return (DeleteAppFontsMainController *)WeakRetained;
}

- (void)setMainController:(id)a3
{
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
}

- (UILabel)deleteLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_deleteLabel);

  return (UILabel *)WeakRetained;
}

- (void)setDeleteLabel:(id)a3
{
}

- (UILabel)deleteDescriptionLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_deleteDescriptionLabel);

  return (UILabel *)WeakRetained;
}

- (void)setDeleteDescriptionLabel:(id)a3
{
}

- (UITableView)fontsTableView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fontsTableView);

  return (UITableView *)WeakRetained;
}

- (void)setFontsTableView:(id)a3
{
}

- (UIButton)deleteButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_deleteButton);

  return (UIButton *)WeakRetained;
}

- (void)setDeleteButton:(id)a3
{
}

- (UIButton)dontDeleteButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dontDeleteButton);

  return (UIButton *)WeakRetained;
}

- (void)setDontDeleteButton:(id)a3
{
}

- (void).cxx_destruct
{
}

@end