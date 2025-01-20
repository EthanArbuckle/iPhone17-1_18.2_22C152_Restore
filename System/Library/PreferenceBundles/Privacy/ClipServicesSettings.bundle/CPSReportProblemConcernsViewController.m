@interface CPSReportProblemConcernsViewController
- (NSArray)problemTypes;
- (id)cancelAction;
- (id)selectAction;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)cancelTapped;
- (void)setCancelAction:(id)a3;
- (void)setProblemTypes:(id)a3;
- (void)setSelectAction:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation CPSReportProblemConcernsViewController

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)CPSReportProblemConcernsViewController;
  [(CPSReportProblemConcernsViewController *)&v7 viewDidLoad];
  v3 = _CPSLocalizedString();
  [(CPSReportProblemConcernsViewController *)self setTitle:v3];

  id v4 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:self action:"cancelTapped"];
  v5 = [(CPSReportProblemConcernsViewController *)self navigationItem];
  [v5 setLeftBarButtonItem:v4];

  v6 = [(CPSReportProblemConcernsViewController *)self tableView];
  [v6 registerClass:objc_opt_class() forCellReuseIdentifier:@"basicStyle"];
}

- (void)setProblemTypes:(id)a3
{
  objc_storeStrong((id *)&self->_problemTypes, a3);
  id v4 = [(CPSReportProblemConcernsViewController *)self tableView];
  [v4 reloadData];
}

- (void)cancelTapped
{
  cancelAction = (void (**)(void))self->_cancelAction;
  if (cancelAction) {
    cancelAction[2]();
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  selectAction = (void (**)(id, id))self->_selectAction;
  if (selectAction)
  {
    -[NSArray objectAtIndexedSubscript:](self->_problemTypes, "objectAtIndexedSubscript:", objc_msgSend(a4, "row", a3));
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    selectAction[2](selectAction, v5);
  }
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return (id)_CPSLocalizedString();
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  return (id)_CPSLocalizedString();
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSArray *)self->_problemTypes count];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  objc_super v7 = [a3 dequeueReusableCellWithIdentifier:@"basicStyle" forIndexPath:v6];
  [v7 setAccessoryType:1];
  problemTypes = self->_problemTypes;
  id v9 = [v6 row];

  v10 = [(NSArray *)problemTypes objectAtIndexedSubscript:v9];
  v11 = [v10 localizedTitle];
  v12 = [v7 textLabel];
  [v12 setText:v11];

  return v7;
}

- (NSArray)problemTypes
{
  return self->_problemTypes;
}

- (id)selectAction
{
  return self->_selectAction;
}

- (void)setSelectAction:(id)a3
{
}

- (id)cancelAction
{
  return self->_cancelAction;
}

- (void)setCancelAction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cancelAction, 0);
  objc_storeStrong(&self->_selectAction, 0);

  objc_storeStrong((id *)&self->_problemTypes, 0);
}

@end