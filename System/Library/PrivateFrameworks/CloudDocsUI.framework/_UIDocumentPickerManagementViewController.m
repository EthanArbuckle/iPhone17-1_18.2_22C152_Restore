@interface _UIDocumentPickerManagementViewController
- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4;
- (NSArray)allPickers;
- (NSArray)fileTypes;
- (_UIDocumentPickerManagementViewController)initWithCoder:(id)a3;
- (_UIDocumentPickerManagementViewController)initWithFileTypes:(id)a3 mode:(unint64_t)a4;
- (_UIDocumentPickerManagementViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_UIDocumentPickerManagementViewController)initWithStyle:(int64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)mode;
- (void)_doneButtonPressed;
- (void)_updateContentSize;
- (void)setAllPickers:(id)a3;
- (void)setFileTypes:(id)a3;
- (void)setMode:(unint64_t)a3;
- (void)switchToggled:(id)a3;
- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation _UIDocumentPickerManagementViewController

- (_UIDocumentPickerManagementViewController)initWithFileTypes:(id)a3 mode:(unint64_t)a4
{
  id v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)_UIDocumentPickerManagementViewController;
  v7 = [(_UIContainerHuggingTableViewController *)&v20 initWithStyle:0];
  if (v7)
  {
    v8 = +[_UIDocumentPickerDescriptor manageablePickersForMode:a4 documentTypes:v6];
    [(_UIDocumentPickerManagementViewController *)v7 setAllPickers:v8];

    [(_UIDocumentPickerManagementViewController *)v7 setFileTypes:v6];
    [(_UIDocumentPickerManagementViewController *)v7 setMode:a4];
    v9 = [(_UIDocumentPickerManagementViewController *)v7 tableView];
    [v9 registerClass:objc_opt_class() forCellReuseIdentifier:@"com.apple.UIKit.fileprovider.default"];

    v10 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
    v11 = [v10 localizedStringForKey:@"Manage Locations" value:@"Manage Locations" table:@"Localizable"];
    [(_UIDocumentPickerManagementViewController *)v7 setTitle:v11];

    v12 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:0 target:v7 action:sel__doneButtonPressed];
    v13 = [(_UIDocumentPickerManagementViewController *)v7 navigationItem];
    [v13 setRightBarButtonItem:v12];

    [(_UIDocumentPickerManagementViewController *)v7 setEditing:1 animated:0];
    v14 = [(_UIDocumentPickerManagementViewController *)v7 tableView];
    [v14 setAlwaysBounceVertical:0];

    double v15 = *MEMORY[0x263F1D600];
    v16 = [(_UIDocumentPickerManagementViewController *)v7 tableView];
    [v16 setRowHeight:v15];

    v17 = [(_UIDocumentPickerManagementViewController *)v7 tableView];
    [v17 reloadData];

    [(_UIDocumentPickerManagementViewController *)v7 _updateContentSize];
    v18 = [(_UIDocumentPickerManagementViewController *)v7 tableView];
    [v18 reloadData];
  }
  return v7;
}

- (void)_updateContentSize
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __63___UIDocumentPickerManagementViewController__updateContentSize__block_invoke;
  v2[3] = &unk_26492CC78;
  v2[4] = self;
  [MEMORY[0x263F1CB60] performWithoutAnimation:v2];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(_UIDocumentPickerManagementViewController *)self _updateContentSize];
  v5.receiver = self;
  v5.super_class = (Class)_UIDocumentPickerManagementViewController;
  [(_UIDocumentPickerManagementViewController *)&v5 viewWillAppear:v3];
}

- (_UIDocumentPickerManagementViewController)initWithStyle:(int64_t)a3
{
  return [(_UIDocumentPickerManagementViewController *)self initWithFileTypes:0 mode:0];
}

- (_UIDocumentPickerManagementViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return [(_UIDocumentPickerManagementViewController *)self initWithFileTypes:0 mode:0];
}

- (_UIDocumentPickerManagementViewController)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UIDocumentPickerManagementViewController;
  return [(_UIDocumentPickerManagementViewController *)&v4 initWithCoder:a3];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v3 = [(_UIDocumentPickerManagementViewController *)self tableView];
  [v3 reloadData];
}

- (void)_doneButtonPressed
{
  id v3 = [(_UIDocumentPickerManagementViewController *)self navigationController];
  id v2 = (id)[v3 popViewControllerAnimated:1];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  objc_super v4 = [(_UIDocumentPickerManagementViewController *)self allPickers];
  int64_t v5 = [v4 count];

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a4;
  v7 = [a3 dequeueReusableCellWithIdentifier:@"com.apple.UIKit.fileprovider.default" forIndexPath:v6];
  v8 = [(_UIDocumentPickerManagementViewController *)self allPickers];
  uint64_t v9 = [v6 row];

  v10 = [v8 objectAtIndex:v9];

  v11 = [v10 localizedName];
  v12 = [v7 textLabel];
  [v12 setText:v11];

  unint64_t v13 = [(_UIDocumentPickerManagementViewController *)self mode];
  v14 = [(_UIDocumentPickerManagementViewController *)self fileTypes];
  id v23 = 0;
  [v10 pickerEnabledForMode:v13 documentTypes:v14 reason:&v23];
  id v15 = v23;

  v16 = [v7 detailTextLabel];
  [v16 setText:v15];

  objc_msgSend(v7, "setShowNewlyAdded:", objc_msgSend(v10, "isNewlyAdded"));
  v17 = [v10 identifier];
  int v18 = [v17 isEqualToString:*MEMORY[0x263F1D878]];

  v19 = [v7 editingAccessoryView];
  if (!v19 && (v18 & 1) == 0)
  {
    id v20 = objc_alloc(MEMORY[0x263F1CA10]);
    v19 = objc_msgSend(v20, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [v7 setEditingAccessoryView:v19];
    v21 = [v7 editingAccessoryView];
    [v21 addTarget:self action:sel_switchToggled_ forControlEvents:4096];
  }
  if (v18) {
    [v7 setEditingAccessoryView:0];
  }
  objc_msgSend(v19, "setOn:", objc_msgSend(v10, "enabled"));

  return v7;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  uint64_t v9 = [(_UIDocumentPickerManagementViewController *)self allPickers];
  uint64_t v10 = [v7 row];

  id v14 = [v9 objectAtIndex:v10];

  v11 = [(_UIDocumentPickerManagementViewController *)self traitCollection];
  [v11 displayScale];
  v12 = objc_msgSend(v14, "imageWithScale:");
  unint64_t v13 = [v8 imageView];

  [v13 setImage:v12];
}

- (void)switchToggled:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(_UIDocumentPickerManagementViewController *)self tableView];
  [v4 bounds];
  objc_msgSend(v5, "convertPoint:fromView:", v4);
  double v7 = v6;
  double v9 = v8;

  uint64_t v10 = [(_UIDocumentPickerManagementViewController *)self tableView];
  objc_msgSend(v10, "indexPathForRowAtPoint:", v7, v9);
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  v11 = [(_UIDocumentPickerManagementViewController *)self allPickers];
  v12 = objc_msgSend(v11, "objectAtIndex:", objc_msgSend(v14, "row"));

  uint64_t v13 = [v4 isOn];
  [v12 setEnabled:v13];
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  id v5 = a4;
  double v6 = [(_UIDocumentPickerManagementViewController *)self allPickers];
  uint64_t v7 = [v5 row];

  double v8 = [v6 objectAtIndex:v7];

  double v9 = [v8 identifier];
  LOBYTE(v7) = [v9 isEqualToString:*MEMORY[0x263F1D878]];

  if (v7)
  {
    BOOL v10 = 0;
  }
  else
  {
    v11 = [(_UIDocumentPickerManagementViewController *)self allPickers];
    uint64_t v12 = [v11 count];

    uint64_t v13 = [(_UIDocumentPickerManagementViewController *)self allPickers];
    BOOL v14 = [v13 indexOfObjectPassingTest:&__block_literal_global_3] != 0x7FFFFFFFFFFFFFFFLL;

    BOOL v10 = (unint64_t)(v12 - v14) > 1;
  }

  return v10;
}

- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  id v6 = a5;
  uint64_t v7 = [v6 row];
  double v8 = [(_UIDocumentPickerManagementViewController *)self allPickers];
  uint64_t v9 = [v8 indexOfObjectPassingTest:&__block_literal_global_35];

  if (v7 == v9)
  {
    objc_msgSend(MEMORY[0x263F088C8], "indexPathForRow:inSection:", objc_msgSend(v6, "row") + 1, 0);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v10 = v6;
  }
  v11 = v10;

  return v11;
}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  uint64_t v9 = [(_UIDocumentPickerManagementViewController *)self allPickers];
  id v13 = (id)[v9 mutableCopy];

  id v10 = objc_msgSend(v13, "objectAtIndex:", objc_msgSend(v8, "row"));
  uint64_t v11 = [v8 row];

  [v13 removeObjectAtIndex:v11];
  uint64_t v12 = [v7 row];

  [v13 insertObject:v10 atIndex:v12];
  [(_UIDocumentPickerManagementViewController *)self setAllPickers:v13];
  +[_UIDocumentPickerDescriptor setOrderFromPickers:v13];
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  return 0;
}

- (NSArray)allPickers
{
  return self->_allPickers;
}

- (void)setAllPickers:(id)a3
{
}

- (NSArray)fileTypes
{
  return self->_fileTypes;
}

- (void)setFileTypes:(id)a3
{
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileTypes, 0);

  objc_storeStrong((id *)&self->_allPickers, 0);
}

@end