@interface CNGeminiPickerController
- (CNGeminiChannel)preferredGeminiChannel;
- (CNGeminiPickerController)initWithGeminiResult:(id)a3;
- (NSIndexPath)selectedIndexPath;
- (NSMutableArray)geminiChannels;
- (UITableViewController)tableViewController;
- (id)geminiChannelForIndexPath:(id)a3;
- (id)indexPathForGeminiChannel:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)cancelPicker:(id)a3;
- (void)didPickItem;
- (void)prepareCell:(id)a3 atIndexPath:(id)a4;
- (void)setGeminiChannels:(id)a3;
- (void)setGeminiResult:(id)a3;
- (void)setGeminiResult:(id)a3 reload:(BOOL)a4;
- (void)setPreferredGeminiChannel:(id)a3;
- (void)setSelectedIndexPath:(id)a3;
- (void)setTableViewController:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CNGeminiPickerController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedIndexPath, 0);
  objc_storeStrong((id *)&self->_preferredGeminiChannel, 0);
  objc_storeStrong((id *)&self->_geminiChannels, 0);

  objc_storeStrong((id *)&self->_tableViewController, 0);
}

- (void)setSelectedIndexPath:(id)a3
{
}

- (NSIndexPath)selectedIndexPath
{
  return self->_selectedIndexPath;
}

- (void)setPreferredGeminiChannel:(id)a3
{
}

- (CNGeminiChannel)preferredGeminiChannel
{
  return self->_preferredGeminiChannel;
}

- (void)setGeminiChannels:(id)a3
{
}

- (NSMutableArray)geminiChannels
{
  return self->_geminiChannels;
}

- (void)setTableViewController:(id)a3
{
}

- (UITableViewController)tableViewController
{
  return self->_tableViewController;
}

- (void)viewWillAppear:(BOOL)a3
{
  v23.receiver = self;
  v23.super_class = (Class)CNGeminiPickerController;
  [(CNGeminiPickerController *)&v23 viewWillAppear:a3];
  v4 = [(CNGeminiPickerController *)self navigationBar];
  objc_msgSend(v4, "_cnui_applyContactStyle");

  v5 = [(UITableViewController *)self->_tableViewController tableView];
  objc_msgSend(v5, "_cnui_applyContactStyle");

  v6 = CNContactsUIBundle();
  v7 = [v6 localizedStringForKey:@"PREFERRED_LINE_PICKER_TITLE" value:&stru_1ED8AC728 table:@"Localized-GEMINI"];
  v8 = [(UITableViewController *)self->_tableViewController navigationItem];
  [v8 setTitle:v7];

  v9 = [(UITableViewController *)self->_tableViewController navigationItem];
  [v9 setLargeTitleDisplayMode:2];

  if ([(UIViewController *)self ab_shouldShowNavBarButtons])
  {
    v10 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:1 target:self action:sel_cancelPicker_];
    v11 = [(UITableViewController *)self->_tableViewController navigationItem];
    [v11 setLeftBarButtonItem:v10];

    v12 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:self action:sel_donePicker_];
    v13 = [(UITableViewController *)self->_tableViewController navigationItem];
    [v13 setRightBarButtonItem:v12];
  }
  if ([(UIViewController *)self ab_shouldUseTransparentBackgroundInPopovers])
  {
    v14 = +[CNUIColorRepository popoverBackgroundColor];
    v15 = [(CNGeminiPickerController *)self tableViewController];
    v16 = [v15 tableView];
    [v16 setBackgroundColor:v14];

    v17 = [(UITableViewController *)self->_tableViewController tableView];
    v18 = [v17 backgroundColor];
    v19 = [(CNGeminiPickerController *)self tableViewController];
    v20 = [v19 tableView];
    [v20 setSectionIndexBackgroundColor:v18];
  }
  v21 = [(CNGeminiPickerController *)self tableViewController];
  v22 = [v21 tableView];
  [v22 reloadData];
}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v14 = a3;
  id v7 = a4;
  objc_msgSend(v7, "_cnui_applyContactStyle");
  if (-[UIViewController ab_shouldUseTransparentBackgroundInPopovers](self, "ab_shouldUseTransparentBackgroundInPopovers")|| ([v14 backgroundColor], v8 = objc_claimAutoreleasedReturnValue(), objc_msgSend(MEMORY[0x1E4FB1618], "clearColor"), v9 = objc_claimAutoreleasedReturnValue(), int v10 = objc_msgSend(v8, "isEqual:", v9), v9, v8, v10))
  {
    v11 = [(CNGeminiPickerController *)self tableViewController];
    v12 = [v11 tableView];
    v13 = [v12 backgroundColor];
    [v7 setBackgroundColor:v13];
  }
  else
  {
    v11 = +[CNUIColorRepository contactStyleDefaultBackgroundColor];
    [v7 setBackgroundColor:v11];
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v17 = a4;
  id v6 = a3;
  if ([(UIViewController *)self ab_shouldShowNavBarButtons])
  {
    id v7 = [(CNGeminiPickerController *)self selectedIndexPath];

    if (v7 != v17)
    {
      v8 = [(CNGeminiPickerController *)self tableViewController];
      v9 = [v8 tableView];
      int v10 = [(CNGeminiPickerController *)self selectedIndexPath];
      v11 = [v9 cellForRowAtIndexPath:v10];
      [v11 setAccessoryType:0];

      v12 = [(CNGeminiPickerController *)self tableViewController];
      v13 = [v12 tableView];
      id v14 = [v13 cellForRowAtIndexPath:v17];
      [v14 setAccessoryType:3];

      [(CNGeminiPickerController *)self setSelectedIndexPath:v17];
    }
    v15 = [v6 indexPathForSelectedRow];
    [v6 deselectRowAtIndexPath:v15 animated:0];
  }
  else
  {
    [(CNGeminiPickerController *)self setSelectedIndexPath:v17];
    [(CNGeminiPickerController *)self didPickItem];
    v16 = [v6 indexPathForSelectedRow];
    [v6 deselectRowAtIndexPath:v16 animated:0];

    [(CNGeminiPickerController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [v5 section];
  if (v6) {
    uint64_t v7 = 3;
  }
  else {
    uint64_t v7 = 0;
  }
  v8 = (Class *)0x1E4FB1D08;
  if (v6) {
    v8 = (Class *)&off_1E5495188;
  }
  v9 = (void *)[objc_alloc(*v8) initWithStyle:v7 reuseIdentifier:0];
  [(CNGeminiPickerController *)self prepareCell:v9 atIndexPath:v5];
  id v10 = [(CNGeminiPickerController *)self selectedIndexPath];

  if (v10 == v5) {
    [v9 setAccessoryType:3];
  }

  return v9;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id v5 = CNContactsUIBundle();
  uint64_t v6 = v5;
  if (a4) {
    uint64_t v7 = @"PREFERRED_LINE_PICKER_ALWAYS_USE_FOOTER";
  }
  else {
    uint64_t v7 = @"PREFERRED_LINE_PICKER_LAST_USED_FOOTER";
  }
  v8 = [v5 localizedStringForKey:v7 value:&stru_1ED8AC728 table:@"Localized-GEMINI"];

  return v8;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if (a4)
  {
    v4 = CNContactsUIBundle();
    id v5 = [v4 localizedStringForKey:@"PREFERRED_LINE_PICKER_ALWAYS_USE_HEADER" value:&stru_1ED8AC728 table:@"Localized-GEMINI"];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (!a4) {
    return 1;
  }
  v4 = [(CNGeminiPickerController *)self geminiChannels];
  int64_t v5 = [v4 count];

  return v5;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  v3 = [(CNGeminiPickerController *)self geminiChannels];
  if ([v3 count]) {
    int64_t v4 = 2;
  }
  else {
    int64_t v4 = 1;
  }

  return v4;
}

- (void)prepareCell:(id)a3 atIndexPath:(id)a4
{
  id v32 = a3;
  id v6 = a4;
  if ([v6 section])
  {
    uint64_t v7 = [(CNGeminiPickerController *)self geminiChannelForIndexPath:v6];
    int v8 = [v7 isAvailable];
    v9 = @"PREFERRED_LINE_PICKER_ALWAYS_USE_LABEL_UNAVAILABLE-%@";
    if (v8) {
      v9 = @"PREFERRED_LINE_PICKER_ALWAYS_USE_LABEL-%@";
    }
    id v10 = NSString;
    v11 = v9;
    v12 = CNContactsUIBundle();
    v13 = [v12 localizedStringForKey:v11 value:&stru_1ED8AC728 table:@"Localized-GEMINI"];
    id v14 = [v7 localizedLabel];
    v15 = objc_msgSend(v10, "stringWithFormat:", v13, v14);

    v16 = (void *)MEMORY[0x1E4F1BA70];
    id v17 = [v7 handle];
    v18 = [v16 phoneNumberWithStringValue:v17];
    v19 = [v18 formattedInternationalStringValue];

    v20 = NSString;
    v21 = CNContactsUIBundle();
    v22 = [v21 localizedStringForKey:v11 value:&stru_1ED8AC728 table:@"Localized-GEMINI"];

    objc_super v23 = [v7 localizedBadgeLabel];
    v24 = objc_msgSend(v20, "stringWithFormat:", v22, v23);

    objc_opt_class();
    id v25 = v32;
    if (objc_opt_isKindOfClass()) {
      v26 = v25;
    }
    else {
      v26 = 0;
    }
    id v27 = v26;

    [v27 setText:v15 detailText:v19 badgeText:v24];
  }
  else
  {
    uint64_t v7 = CNContactsUIBundle();
    v15 = [v7 localizedStringForKey:@"PREFERRED_LINE_PICKER_LAST_USED_VALUE" value:&stru_1ED8AC728 table:@"Localized-GEMINI"];
    v19 = [v32 textLabel];
    [v19 setText:v15];
  }

  v28 = [(CNGeminiPickerController *)self tableViewController];
  v29 = [v28 tableView];
  int64_t v30 = -[CNGeminiPickerController tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", v29, [v6 section]);
  uint64_t v31 = [v6 row] + 1;

  if (v30 == v31) {
    objc_msgSend(v32, "setSeparatorInset:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
  }
}

- (id)geminiChannelForIndexPath:(id)a3
{
  id v4 = a3;
  if ([v4 section] == 1)
  {
    int64_t v5 = [(CNGeminiPickerController *)self geminiChannels];
    id v6 = objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v4, "row"));
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)indexPathForGeminiChannel:(id)a3
{
  if (!a3)
  {
    id v6 = (void *)MEMORY[0x1E4F28D58];
    goto LABEL_5;
  }
  id v4 = [(CNGeminiPickerController *)self geminiChannels];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __54__CNGeminiPickerController_indexPathForGeminiChannel___block_invoke;
  v10[3] = &unk_1E5496ED8;
  v10[4] = self;
  int64_t v5 = objc_msgSend(v4, "_cn_indexOfFirstObjectPassingTest:", v10);

  id v6 = (void *)MEMORY[0x1E4F28D58];
  if (v5 == (void *)0x7FFFFFFFFFFFFFFFLL)
  {
    a3 = 0;
LABEL_5:
    uint64_t v7 = 0;
    goto LABEL_7;
  }
  a3 = v5;
  uint64_t v7 = 1;
LABEL_7:
  int v8 = [v6 indexPathForRow:a3 inSection:v7];

  return v8;
}

uint64_t __54__CNGeminiPickerController_indexPathForGeminiChannel___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 channelIdentifier];
  id v4 = [*(id *)(a1 + 32) preferredGeminiChannel];
  int64_t v5 = [v4 channelIdentifier];
  uint64_t v6 = [v3 isEqualToString:v5];

  return v6;
}

- (void)cancelPicker:(id)a3
{
  id v4 = [(CNGeminiPickerController *)self delegate];
  [v4 pickerDidCancel:self];
}

- (void)didPickItem
{
  v3 = [(CNGeminiPickerController *)self selectedIndexPath];
  id v6 = [(CNGeminiPickerController *)self geminiChannelForIndexPath:v3];

  if (v6 && ![v6 isAvailable])
  {
    id v4 = [(CNGeminiPickerController *)self delegate];
    [v4 pickerDidCancel:self];
  }
  else
  {
    id v4 = [(CNGeminiPickerController *)self delegate];
    int64_t v5 = [v6 senderIdentity];
    [v4 picker:self didPickItem:v5];
  }
}

- (void)setGeminiResult:(id)a3 reload:(BOOL)a4
{
  BOOL v4 = a4;
  id v18 = a3;
  id v6 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v7 = [v18 availableChannels];
  int v8 = [v6 arrayWithArray:v7];
  geminiChannels = self->_geminiChannels;
  self->_geminiChannels = v8;

  uint64_t v10 = [v18 usage];
  if (v10 == 1)
  {
    v11 = [v18 channel];
  }
  else
  {
    v11 = 0;
  }
  p_preferredGeminiChannel = &self->_preferredGeminiChannel;
  objc_storeStrong((id *)&self->_preferredGeminiChannel, v11);
  if (v10 == 1) {

  }
  if (*p_preferredGeminiChannel && ([(CNGeminiChannel *)*p_preferredGeminiChannel isAvailable] & 1) == 0) {
    [(NSMutableArray *)self->_geminiChannels addObject:*p_preferredGeminiChannel];
  }
  v13 = [(CNGeminiPickerController *)self preferredGeminiChannel];
  id v14 = [(CNGeminiPickerController *)self indexPathForGeminiChannel:v13];
  selectedIndexPath = self->_selectedIndexPath;
  self->_selectedIndexPath = v14;

  if (v4)
  {
    v16 = [(CNGeminiPickerController *)self tableViewController];
    id v17 = [v16 tableView];
    [v17 reloadData];
  }
}

- (void)setGeminiResult:(id)a3
{
}

- (CNGeminiPickerController)initWithGeminiResult:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CNGeminiPickerController;
  int64_t v5 = [(CNGeminiPickerController *)&v12 initWithNibName:0 bundle:0];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4FB1D18]) initWithStyle:1];
    tableViewController = v5->_tableViewController;
    v5->_tableViewController = (UITableViewController *)v6;

    int v8 = [(UITableViewController *)v5->_tableViewController tableView];
    [v8 setDelegate:v5];
    [v8 setDataSource:v5];
    [(CNGeminiPickerController *)v5 setGeminiResult:v4 reload:0];
    v9 = [(CNGeminiPickerController *)v5 tableViewController];
    [(CNGeminiPickerController *)v5 pushViewController:v9 animated:0];

    uint64_t v10 = v5;
  }

  return v5;
}

@end