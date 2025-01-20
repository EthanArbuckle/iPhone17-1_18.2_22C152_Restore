@interface ASReportAConcernReasonViewController
- (ASReportAConcernConfiguration)configuration;
- (ASReportAConcernReasonDataSource)dataSource;
- (ASReportAConcernReasonViewController)initWithCoder:(id)a3;
- (ASReportAConcernReasonViewController)initWithConfiguration:(id)a3;
- (ASReportAConcernReasonViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UITableView)tableView;
- (id)completion;
- (void)cancelPressed:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setTableView:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation ASReportAConcernReasonViewController

- (ASReportAConcernReasonViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5 = objc_alloc_init(ASReportAConcernConfiguration);
  v6 = [(ASReportAConcernReasonViewController *)self initWithConfiguration:v5];

  return v6;
}

- (ASReportAConcernReasonViewController)initWithCoder:(id)a3
{
  v4 = objc_alloc_init(ASReportAConcernConfiguration);
  v5 = [(ASReportAConcernReasonViewController *)self initWithConfiguration:v4];

  return v5;
}

- (ASReportAConcernReasonViewController)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASReportAConcernReasonViewController;
  v6 = [(ASReportAConcernReasonViewController *)&v9 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_configuration, a3);
  }

  return v7;
}

- (void)viewDidLoad
{
  v24.receiver = self;
  v24.super_class = (Class)ASReportAConcernReasonViewController;
  [(ASReportAConcernReasonViewController *)&v24 viewDidLoad];
  v3 = [(ASReportAConcernReasonViewController *)self configuration];
  v4 = [v3 title];
  [(ASReportAConcernReasonViewController *)self setTitle:v4];

  id v5 = objc_alloc((Class)UIBarButtonItem);
  v6 = [(ASReportAConcernReasonViewController *)self configuration];
  v7 = [v6 backTitle];
  id v8 = [v5 initWithTitle:v7 style:0 target:0 action:0];
  objc_super v9 = [(ASReportAConcernReasonViewController *)self navigationItem];
  [v9 setBackBarButtonItem:v8];

  id v10 = objc_alloc((Class)UIBarButtonItem);
  v11 = [(ASReportAConcernReasonViewController *)self configuration];
  v12 = [v11 cancelTitle];
  id v13 = [v10 initWithTitle:v12 style:0 target:self action:"cancelPressed:"];
  v14 = [(ASReportAConcernReasonViewController *)self navigationItem];
  [v14 setLeftBarButtonItem:v13];

  id v15 = objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:style:", 1, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [v15 setDelegate:self];
  v16 = [[ASReportAConcernReasonDataSource alloc] initWithTableView:v15];
  v17 = [(ASReportAConcernReasonViewController *)self configuration];
  v18 = [v17 reasons];
  [(ASReportAConcernReasonDataSource *)v16 setReasons:v18];

  v19 = [(ASReportAConcernReasonViewController *)self configuration];
  v20 = [v19 selectReasonTitle];
  [(ASReportAConcernReasonDataSource *)v16 setSelectReasonTitle:v20];

  v21 = [(ASReportAConcernReasonViewController *)self configuration];
  v22 = [v21 selectReasonSubtitle];
  [(ASReportAConcernReasonDataSource *)v16 setSelectReasonSubtitle:v22];

  [v15 setDataSource:v16];
  [(ASReportAConcernReasonViewController *)self setDataSource:v16];
  v23 = [(ASReportAConcernReasonViewController *)self view];
  [v23 addSubview:v15];

  [(ASReportAConcernReasonViewController *)self setTableView:v15];
}

- (void)viewWillLayoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)ASReportAConcernReasonViewController;
  [(ASReportAConcernReasonViewController *)&v13 viewWillLayoutSubviews];
  v3 = [(ASReportAConcernReasonViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [(ASReportAConcernReasonViewController *)self tableView];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
}

- (void)cancelPressed:(id)a3
{
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  [a3 deselectRowAtIndexPath:v6 animated:1];
  double v7 = [(ASReportAConcernReasonViewController *)self configuration];
  double v8 = [v7 reasons];
  id v9 = [v6 row];

  id v15 = [v8 objectAtIndexedSubscript:v9];

  double v10 = [(ASReportAConcernReasonViewController *)self configuration];
  id v11 = [v10 copy];

  v12 = [[ASReportAConcernDetailsViewController alloc] initWithConfiguration:v11];
  [(ASReportAConcernDetailsViewController *)v12 setSelectedReason:v15];
  objc_super v13 = [(ASReportAConcernReasonViewController *)self completion];
  [(ASReportAConcernDetailsViewController *)v12 setCompletion:v13];

  v14 = [(ASReportAConcernReasonViewController *)self navigationController];
  [v14 pushViewController:v12 animated:1];
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (ASReportAConcernConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (ASReportAConcernReasonDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_storeStrong(&self->_completion, 0);
}

@end