@interface ClarityUILayoutSetupController
- (ClarityUILayoutSetupController)initWithCompletion:(id)a3;
- (OBBoldTrayButton)nextButton;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (id)completionHandler;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_didTapLayoutSetupNextButton:(id)a3;
- (void)_setUpTableView;
- (void)setCompletionHandler:(id)a3;
- (void)viewDidLoad;
@end

@implementation ClarityUILayoutSetupController

- (ClarityUILayoutSetupController)initWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = settingsLocString(@"LIST_LAYOUT_TITLE", @"ClarityUISettings");
  v15.receiver = self;
  v15.super_class = (Class)ClarityUILayoutSetupController;
  v6 = [(ClarityUILayoutSetupController *)&v15 initWithTitle:v5 detailText:0 symbolName:0 adoptTableViewScrollView:1];

  if (v6)
  {
    id v7 = objc_retainBlock(v4);
    id completionHandler = v6->_completionHandler;
    v6->_id completionHandler = v7;

    v9 = +[OBBoldTrayButton boldButton];
    v10 = settingsLocString(@"CONTINUE", @"ClarityUISettings");
    [v9 setTitle:v10 forState:0];

    [v9 addTarget:v6 action:"_didTapLayoutSetupNextButton:" forControlEvents:0x2000];
    nextButton = v6->_nextButton;
    v6->_nextButton = (OBBoldTrayButton *)v9;
    id v12 = v9;

    v13 = [(ClarityUILayoutSetupController *)v6 buttonTray];
    [v13 addButton:v12];
  }
  return v6;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)ClarityUILayoutSetupController;
  [(ClarityUILayoutSetupController *)&v3 viewDidLoad];
  [(ClarityUILayoutSetupController *)self _setUpTableView];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v4 = +[ClarityUILayoutSetupTableCell visualLayoutPickerSpecifier];
  v5 = [[ClarityUILayoutSetupTableCell alloc] initWithStyle:0 reuseIdentifier:@"ClarityUILayoutCell" specifier:v4];
  v6 = +[UIColor secondarySystemBackgroundColor];
  [(ClarityUILayoutSetupTableCell *)v5 setBackgroundColor:v6];

  return v5;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  return settingsLocString(@"LIST_LAYOUT_FOOTNOTE", @"ClarityUISettings");
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return UITableViewAutomaticDimension;
}

- (void)_setUpTableView
{
  id v8 = objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:style:", 2, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [v8 registerClass:objc_opt_class() forCellReuseIdentifier:@"ClarityUILayoutCell"];
  [v8 setDelegate:self];
  [v8 setDataSource:self];
  [(ClarityUILayoutSetupController *)self setTableView:v8];
  objc_super v3 = +[UIColor systemBackgroundColor];
  id v4 = [(ClarityUILayoutSetupController *)self tableView];
  [v4 setBackgroundColor:v3];

  v5 = +[UIColor systemBackgroundColor];
  v6 = [(ClarityUILayoutSetupController *)self view];
  [v6 setBackgroundColor:v5];

  id v7 = [(ClarityUILayoutSetupController *)self tableView];
  [v7 setSeparatorStyle:0];
}

- (void)_didTapLayoutSetupNextButton:(id)a3
{
}

- (OBBoldTrayButton)nextButton
{
  return self->_nextButton;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);

  objc_storeStrong((id *)&self->_nextButton, 0);
}

@end