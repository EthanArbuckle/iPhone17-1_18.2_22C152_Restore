@interface MCProfileTitlePageWarningSectionController
- (MCProfileTitlePageWarningSectionController)initWithWarning:(id)a3;
- (MCProfileWarning)warning;
- (UITableView)tableView;
- (double)heightForHeader;
- (double)heightForRowAtIndex:(unint64_t)a3;
- (id)cellForRowAtIndex:(unint64_t)a3;
- (id)titleForHeader;
- (unint64_t)numberOfRows;
- (void)registerCellClassWithTableView:(id)a3;
- (void)setTableView:(id)a3;
- (void)setWarning:(id)a3;
@end

@implementation MCProfileTitlePageWarningSectionController

- (MCProfileTitlePageWarningSectionController)initWithWarning:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MCProfileTitlePageWarningSectionController;
  v6 = [(MCProfileTitlePageWarningSectionController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_warning, a3);
  }

  return v7;
}

- (void)registerCellClassWithTableView:(id)a3
{
  id v4 = a3;
  [(MCProfileTitlePageWarningSectionController *)self setTableView:v4];
  [v4 registerClass:objc_opt_class() forCellReuseIdentifier:@"warningCell"];
}

- (id)cellForRowAtIndex:(unint64_t)a3
{
  id v4 = [(MCProfileTitlePageWarningSectionController *)self tableView];

  if (v4)
  {
    id v5 = [(MCProfileTitlePageWarningSectionController *)self tableView];
    v6 = [v5 dequeueReusableCellWithIdentifier:@"warningCell"];

    v7 = [(MCProfileTitlePageWarningSectionController *)self warning];
    v8 = [v7 localizedBody];
    objc_super v9 = [v6 label];
    [v9 setText:v8];
  }
  else
  {
    v6 = objc_opt_new();
  }
  return v6;
}

- (unint64_t)numberOfRows
{
  return 1;
}

- (id)titleForHeader
{
  v2 = [(MCProfileTitlePageWarningSectionController *)self warning];
  v3 = [v2 localizedTitle];

  return v3;
}

- (double)heightForRowAtIndex:(unint64_t)a3
{
  return *MEMORY[0x1E4F43D18];
}

- (double)heightForHeader
{
  int v2 = MCUIIsiPhone();
  double result = 50.0;
  if (v2) {
    return 40.0;
  }
  return result;
}

- (UITableView)tableView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);
  return (UITableView *)WeakRetained;
}

- (void)setTableView:(id)a3
{
}

- (MCProfileWarning)warning
{
  return self->_warning;
}

- (void)setWarning:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_warning, 0);
  objc_destroyWeak((id *)&self->_tableView);
}

@end