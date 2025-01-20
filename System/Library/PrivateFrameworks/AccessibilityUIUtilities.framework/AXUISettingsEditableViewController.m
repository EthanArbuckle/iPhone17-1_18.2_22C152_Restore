@interface AXUISettingsEditableViewController
- (BOOL)canEditTable;
- (id)makeSpecifiers;
- (id)specifiers;
- (void)_addDoneButton;
- (void)_configureEditButton;
- (void)_donePressed;
- (void)_editPressed;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 didEndEditingRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willBeginEditingRowAtIndexPath:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AXUISettingsEditableViewController

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AXUISettingsEditableViewController;
  [(AXUISettingsEditableViewController *)&v4 viewWillAppear:a3];
  [(AXUISettingsEditableViewController *)self _configureEditButton];
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x1E4F92F08];
  objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = [(AXUISettingsEditableViewController *)self makeSpecifiers];
    v6 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3) = v5;

    [(AXUISettingsEditableViewController *)self _configureEditButton];
    objc_super v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)tableView:(id)a3 willBeginEditingRowAtIndexPath:(id)a4
{
  [(AXUISettingsBaseListController *)self setEditing:1 animated:1];
  [(AXUISettingsEditableViewController *)self _configureEditButton];
}

- (void)tableView:(id)a3 didEndEditingRowAtIndexPath:(id)a4
{
  [(AXUISettingsBaseListController *)self setEditing:0 animated:1];
  [(AXUISettingsEditableViewController *)self _configureEditButton];
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  if (a4 == 1)
  {
    v6 = [(AXUISettingsEditableViewController *)self specifierAtIndexPath:a5];
    [(AXUISettingsEditableViewController *)self removeDataForSpecifier:v6];
    [(AXUISettingsEditableViewController *)self removeSpecifier:v6 animated:1];
    if (![(AXUISettingsEditableViewController *)self canEditTable]) {
      AXPerformBlockAsynchronouslyOnMainThread();
    }
  }
}

uint64_t __85__AXUISettingsEditableViewController_tableView_commitEditingStyle_forRowAtIndexPath___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _donePressed];
}

- (id)makeSpecifiers
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (BOOL)canEditTable
{
  return 0;
}

- (void)_addDoneButton
{
  id v4 = (id)[objc_allocWithZone(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel__donePressed];
  uint64_t v3 = [(AXUISettingsEditableViewController *)self navigationItem];
  [v3 setRightBarButtonItem:v4];
}

- (void)_configureEditButton
{
  if ([(AXUISettingsEditableViewController *)self canEditTable])
  {
    if ([(AXUISettingsEditableViewController *)self isEditing])
    {
      [(AXUISettingsEditableViewController *)self _addDoneButton];
      return;
    }
    id v4 = (id)[objc_allocWithZone(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:2 target:self action:sel__editPressed];
    uint64_t v3 = [(AXUISettingsEditableViewController *)self navigationItem];
    [v3 setRightBarButtonItem:v4];
  }
  else
  {
    id v4 = [(AXUISettingsEditableViewController *)self navigationItem];
    [v4 setRightBarButtonItem:0];
  }
}

- (void)_editPressed
{
  [(AXUISettingsBaseListController *)self setEditing:1 animated:1];
  [(AXUISettingsEditableViewController *)self _addDoneButton];
}

- (void)_donePressed
{
  [(AXUISettingsBaseListController *)self setEditing:0 animated:1];
  uint64_t v3 = [(AXUISettingsEditableViewController *)self table];
  [v3 setEditing:0 animated:1];

  [(AXUISettingsEditableViewController *)self _configureEditButton];
}

@end