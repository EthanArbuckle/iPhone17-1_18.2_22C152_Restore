@interface CPSReportProblemConcernDetailViewController
- (CPSReportProblemConcernDetailViewController)initWithProblemType:(id)a3;
- (id)sendAction;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)didTapSend;
- (void)setSendAction:(id)a3;
- (void)viewDidLoad;
@end

@implementation CPSReportProblemConcernDetailViewController

- (CPSReportProblemConcernDetailViewController)initWithProblemType:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CPSReportProblemConcernDetailViewController;
  v6 = [(CPSReportProblemConcernDetailViewController *)&v10 initWithStyle:1];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_problemType, a3);
    v8 = v7;
  }

  return v7;
}

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)CPSReportProblemConcernDetailViewController;
  [(CPSReportProblemConcernDetailViewController *)&v11 viewDidLoad];
  v3 = _CPSLocalizedString();
  [(CPSReportProblemConcernDetailViewController *)self setTitle:v3];

  v4 = _CPSLocalizedString();
  id v5 = [objc_alloc((Class)UIBarButtonItem) initWithTitle:v4 style:2 target:self action:"didTapSend"];
  v6 = [(CPSReportProblemConcernDetailViewController *)self navigationItem];
  [v6 setRightBarButtonItem:v5];

  v7 = [(CPSReportProblemConcernDetailViewController *)self tableView];
  [v7 registerClass:objc_opt_class() forCellReuseIdentifier:@"CPSRAPDetailTextViewCellReuseIdentifier"];

  v8 = [(CPSReportProblemConcernDetailViewController *)self tableView];
  [v8 setAllowsSelection:0];

  v9 = [(CPSReportProblemConcernDetailViewController *)self tableView];
  [v9 setEstimatedRowHeight:UITableViewAutomaticDimension];

  objc_super v10 = [(CPSReportProblemConcernDetailViewController *)self tableView];
  [v10 setRowHeight:UITableViewAutomaticDimension];
}

- (void)didTapSend
{
  if (self->_sendAction)
  {
    v3 = [(CPSReportProblemConcernDetailViewController *)self tableView];
    v4 = +[NSIndexPath indexPathForRow:0 inSection:0];
    id v6 = [v3 cellForRowAtIndexPath:v4];

    id v5 = [v6 customerInput];
    (*((void (**)(void))self->_sendAction + 2))();
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  return [a3 dequeueReusableCellWithIdentifier:@"CPSRAPDetailTextViewCellReuseIdentifier" forIndexPath:a4];
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return [(CPSReportProblemProblemType *)self->_problemType localizedUpperCaseTitle];
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  return (id)_CPSLocalizedString();
}

- (id)sendAction
{
  return self->_sendAction;
}

- (void)setSendAction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sendAction, 0);

  objc_storeStrong((id *)&self->_problemType, 0);
}

@end