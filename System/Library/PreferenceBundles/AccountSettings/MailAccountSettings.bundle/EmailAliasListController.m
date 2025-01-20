@interface EmailAliasListController
- (BOOL)disableEmailAliasListChanges;
- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (BOOL)textFieldShouldReturn:(id)a3;
- (EmailAliasListController)init;
- (EmailAliasListControllerDataSource)dataSource;
- (id)specifier;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)setDataSource:(id)a3;
- (void)setDisableEmailAliasListChanges:(BOOL)a3;
- (void)setSpecifier:(id)a3;
- (void)startAddingEmailAlias;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation EmailAliasListController

- (EmailAliasListController)init
{
  v3.receiver = self;
  v3.super_class = (Class)EmailAliasListController;
  return [(EmailAliasListController *)&v3 initWithStyle:1];
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)EmailAliasListController;
  [(EmailAliasListController *)&v8 viewDidLoad];
  objc_super v3 = [(EmailAliasListController *)self tableView];
  [v3 setAllowsSelectionDuringEditing:1];

  v4 = +[NSBundle bundleForClass:objc_opt_class()];
  v5 = [v4 localizedStringForKey:@"EMAIL_ALIAS_LIST_TITLE" value:&stru_B9F70 table:@"AccountPreferences"];
  [(EmailAliasListController *)self setTitle:v5];

  if (![(EmailAliasListController *)self disableEmailAliasListChanges])
  {
    v6 = [(EmailAliasListController *)self editButtonItem];
    v7 = [(EmailAliasListController *)self navigationItem];
    [v7 setRightBarButtonItem:v6];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v15.receiver = self;
  v15.super_class = (Class)EmailAliasListController;
  [(EmailAliasListController *)&v15 viewWillAppear:a3];
  if (!self->_emailAliases)
  {
    v4 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    emailAliases = self->_emailAliases;
    self->_emailAliases = v4;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v7 = self->_emailAliases;
  objc_super v8 = [(EmailAliasListController *)self specifier];
  v9 = [WeakRetained emailAliasListController:self emailAliasListForSpecifier:v8];
  [(NSMutableArray *)v7 setArray:v9];

  v10 = [(EmailAliasListController *)self specifier];
  v11 = [WeakRetained emailAliasListController:self defaultEmailAliasForSpecifier:v10];

  id v12 = [(NSMutableArray *)self->_emailAliases indexOfObject:v11];
  if (v12 == (id)0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v13 = 0;
  }
  else {
    unint64_t v13 = (unint64_t)v12;
  }
  self->_indexOfDefaultEmailAlias = v13;
  self->_addingEmailAlias = 0;
  [(EmailAliasListController *)self setEditing:0 animated:0];
  v14 = [(EmailAliasListController *)self tableView];
  [v14 reloadData];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)EmailAliasListController;
  [(EmailAliasListController *)&v9 viewWillDisappear:a3];
  if ([(NSMutableArray *)self->_emailAliases count])
  {
    unint64_t indexOfDefaultEmailAlias = self->_indexOfDefaultEmailAlias;
    if (indexOfDefaultEmailAlias >= (unint64_t)[(NSMutableArray *)self->_emailAliases count])
    {
      v5 = 0;
    }
    else
    {
      v5 = [(NSMutableArray *)self->_emailAliases objectAtIndex:self->_indexOfDefaultEmailAlias];
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    emailAliases = self->_emailAliases;
    objc_super v8 = [(EmailAliasListController *)self specifier];
    [WeakRetained emailAliasListController:self setEmailAliasList:emailAliases defaultEmailAlias:v5 forSpecifier:v8];
  }
}

- (void)startAddingEmailAlias
{
  self->_addingEmailAlias = 1;
  objc_super v3 = [(EmailAliasListController *)self tableView];
  [v3 reloadData];

  v4 = [(EmailAliasListController *)self tableView];
  v5 = +[NSIndexPath indexPathForRow:[(NSMutableArray *)self->_emailAliases count] inSection:0];
  id v8 = [v4 cellForRowAtIndexPath:v5];

  v6 = [v8 editableTextField];
  [v6 setText:&stru_B9F70];

  v7 = [v8 editableTextField];
  [v7 becomeFirstResponder];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5 = [(NSMutableArray *)self->_emailAliases count];
  return (int64_t)v5
       + ([(EmailAliasListController *)self disableEmailAliasListChanges] ^ 1);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 row];
  if (v8 >= [(NSMutableArray *)self->_emailAliases count])
  {
    if (self->_addingEmailAlias)
    {
      id v9 = [v6 dequeueReusableCellWithIdentifier:@"Editing"];
      if (!v9)
      {
        id v9 = [objc_alloc((Class)UITableViewCell) initWithStyle:1000 reuseIdentifier:@"Editing"];
        unint64_t v13 = [v9 editableTextField];
        [v13 setDelegate:self];

        v14 = [v9 editableTextField];
        [v14 setAutocapitalizationType:0];

        objc_super v15 = [v9 editableTextField];
        [v15 setAutocorrectionType:1];

        v16 = [v9 editableTextField];
        [v16 setClearButtonMode:1];

        v17 = +[UIFont boldSystemFontOfSize:17.0];
        v18 = [v9 editableTextField];
        [v18 setFont:v17];

        v19 = +[UIColor labelColor];
        v20 = [v9 editableTextField];
        [v20 setTextColor:v19];

        [v9 setTextFieldOffset:0.0];
      }
    }
    else
    {
      id v9 = [v6 dequeueReusableCellWithIdentifier:@"Add"];
      if (!v9)
      {
        id v9 = [objc_alloc(NSClassFromString(@"MFTableViewCell")) initWithStyle:0 reuseIdentifier:@"Add"];
        [v9 setShouldDisableWhileEditing:1];
        v21 = +[NSBundle bundleForClass:objc_opt_class()];
        v22 = [v21 localizedStringForKey:@"EMAIL_ALIAS_ADD" value:&stru_B9F70 table:@"AccountPreferences"];
        v23 = [v9 textLabel];
        [v23 setText:v22];
      }
    }
  }
  else
  {
    id v9 = [v6 dequeueReusableCellWithIdentifier:@"Email"];
    if (!v9) {
      id v9 = [objc_alloc((Class)UITableViewCell) initWithStyle:0 reuseIdentifier:@"Email"];
    }
    v10 = -[NSMutableArray objectAtIndex:](self->_emailAliases, "objectAtIndex:", [v7 row]);
    v11 = [v9 textLabel];
    [v11 setText:v10];

    if ([v7 row] == self->_indexOfDefaultEmailAlias) {
      uint64_t v12 = 3;
    }
    else {
      uint64_t v12 = 0;
    }
    [v9 setAccessoryType:v12];
  }

  return v9;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return [(EmailAliasListController *)self isEditing] ^ 1;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  id v7 = [v6 row];
  if (v7 >= [(NSMutableArray *)self->_emailAliases count])
  {
    [(EmailAliasListController *)self startAddingEmailAlias];
  }
  else
  {
    id v8 = +[NSIndexPath indexPathForRow:self->_indexOfDefaultEmailAlias inSection:0];
    if (([v8 isEqual:v6] & 1) == 0)
    {
      id v9 = [v11 cellForRowAtIndexPath:v8];
      [v9 setAccessoryType:0];

      v10 = [v11 cellForRowAtIndexPath:v6];
      [v10 setAccessoryType:3];
    }
    [v11 deselectRowAtIndexPath:v6 animated:1];
    self->_unint64_t indexOfDefaultEmailAlias = (unint64_t)[v6 row];
  }
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)ECEmailAddress);
  id v6 = [v4 text];
  id v7 = [v5 initWithString:v6];

  if (v7)
  {
    id v8 = [(EmailAliasListController *)self tableView];
    [v8 beginUpdates];

    emailAliases = self->_emailAliases;
    v10 = [v4 text];
    [(NSMutableArray *)emailAliases addObject:v10];

    self->_addingEmailAlias = 0;
    if (self->_indexOfDefaultEmailAlias == 0x7FFFFFFFFFFFFFFFLL)
    {
      self->_unint64_t indexOfDefaultEmailAlias = 0;
      id v11 = [(EmailAliasListController *)self tableView];
      uint64_t v12 = +[NSIndexPath indexPathForRow:self->_indexOfDefaultEmailAlias inSection:0];
      v32 = v12;
      unint64_t v13 = +[NSArray arrayWithObjects:&v32 count:1];
      [v11 reloadRowsAtIndexPaths:v13 withRowAnimation:100];
    }
    v14 = [(EmailAliasListController *)self tableView];
    objc_super v15 = +[NSIndexPath indexPathForRow:(char *)[(NSMutableArray *)self->_emailAliases count] - 1 inSection:0];
    v31 = v15;
    v16 = +[NSArray arrayWithObjects:&v31 count:1];
    [v14 reloadRowsAtIndexPaths:v16 withRowAnimation:100];

    v17 = [(EmailAliasListController *)self tableView];
    v18 = +[NSIndexPath indexPathForRow:(char *)[(NSMutableArray *)self->_emailAliases count] - 1 inSection:0];
    v30 = v18;
    v19 = +[NSArray arrayWithObjects:&v30 count:1];
    [v17 insertRowsAtIndexPaths:v19 withRowAnimation:100];

    v20 = [(EmailAliasListController *)self tableView];
    [v20 endUpdates];
  }
  else
  {
    v21 = +[NSBundle bundleForClass:objc_opt_class()];
    v22 = [v21 localizedStringForKey:@"INVALID_EMAIL_ADDRESS_TITLE" value:&stru_B9F70 table:@"AccountPreferences"];
    v23 = +[NSBundle bundleForClass:objc_opt_class()];
    v24 = [v23 localizedStringForKey:@"INVALID_EMAIL_ADDRESS_BODY" value:&stru_B9F70 table:@"AccountPreferences"];
    v25 = +[UIAlertController alertControllerWithTitle:v22 message:v24 preferredStyle:1];

    v26 = +[NSBundle bundleForClass:objc_opt_class()];
    v27 = [v26 localizedStringForKey:@"OK" value:&stru_B9F70 table:@"AccountPreferences"];
    v28 = +[UIAlertAction actionWithTitle:v27 style:1 handler:0];
    [v25 addAction:v28];

    [(EmailAliasListController *)self presentViewController:v25 animated:1 completion:0];
  }

  return v7 != 0;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  if ((unint64_t)[(NSMutableArray *)self->_emailAliases count] < 2)
  {
    v10 = 0;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    id v6 = [(EmailAliasListController *)self specifier];
    id v7 = [WeakRetained emailAliasListController:self accountTypeForSpecifier:v6];

    id v8 = +[NSBundle bundleForClass:objc_opt_class()];
    id v9 = [v8 localizedStringForKey:@"DEFAULT_EMAIL_EXPLANATION" value:&stru_B9F70 table:@"AccountPreferences"];

    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v7);
  }

  return v10;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  int64_t v7 = 0;
  if (![(EmailAliasListController *)self disableEmailAliasListChanges])
  {
    id v6 = [v5 row];
    if (v6 < [(NSMutableArray *)self->_emailAliases count]
      && (unint64_t)[(NSMutableArray *)self->_emailAliases count] > 1)
    {
      int64_t v7 = 1;
    }
  }

  return v7;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v10 = v9;
  if (a4 == 2)
  {
    [(EmailAliasListController *)self startAddingEmailAlias];
  }
  else if (a4 == 1)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_6C4B8;
    v13[3] = &unk_B94A8;
    v13[4] = self;
    id v14 = v9;
    id v15 = v8;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_6C5B0;
    v11[3] = &unk_B9A48;
    id v12 = v15;
    [v12 _performBatchUpdates:v13 completion:v11];
  }
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [v5 row];
  LOBYTE(self) = v6 < [(NSMutableArray *)self->_emailAliases count];

  return (char)self;
}

- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  id v6 = a5;
  int64_t v7 = (char *)[v6 row];
  id v8 = v6;
  if (v7 > (char *)[(NSMutableArray *)self->_emailAliases count] - 1)
  {
    id v8 = +[NSIndexPath indexPathForRow:(char *)[(NSMutableArray *)self->_emailAliases count] - 1 inSection:0];
  }

  return v8;
}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  if (self->_indexOfDefaultEmailAlias == 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = 0;
  }
  else
  {
    v10 = -[NSMutableArray objectAtIndex:](self->_emailAliases, "objectAtIndex:");
  }
  -[NSMutableArray ef_moveObjectAtIndex:toIndex:](self->_emailAliases, "ef_moveObjectAtIndex:toIndex:", [v8 row], objc_msgSend(v9, "row"));
  self->_unint64_t indexOfDefaultEmailAlias = (unint64_t)[(NSMutableArray *)self->_emailAliases indexOfObject:v10];
}

- (EmailAliasListControllerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (EmailAliasListControllerDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (id)specifier
{
  return self->_specifier;
}

- (void)setSpecifier:(id)a3
{
}

- (BOOL)disableEmailAliasListChanges
{
  return self->_disableEmailAliasListChanges;
}

- (void)setDisableEmailAliasListChanges:(BOOL)a3
{
  self->_disableEmailAliasListChanges = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_specifier, 0);
  objc_destroyWeak((id *)&self->_dataSource);

  objc_storeStrong((id *)&self->_emailAliases, 0);
}

@end