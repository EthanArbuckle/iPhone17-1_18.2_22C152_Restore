@interface _SFBookmarkInfoViewController
- (BOOL)_bookmarkIsInFavoritesFolder:(id)a3;
- (BOOL)_isIndexPathForNewFolderRow:(id)a3;
- (BOOL)_showBookmarkAppearanceSwitch;
- (BOOL)bookmarkInfoViewControllerCanSaveBookmarkChanges:(id)a3;
- (BOOL)bookmarkInfoViewControllerShouldUseTranslucentAppearance:(id)a3;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)canSaveChanges;
- (BOOL)hasTranslucentAppearance;
- (BOOL)isEditingField;
- (BOOL)tableView:(id)a3 canFocusRowAtIndexPath:(id)a4;
- (BOOL)titleCellHasText;
- (CGPoint)_centerForIconView;
- (UIEdgeInsets)_cellInset;
- (WebBookmark)bookmark;
- (_SFBookmarkInfoViewController)initWithBookmark:(id)a3 childBookmarks:(id)a4 inCollection:(id)a5 addingBookmark:(BOOL)a6 toFavorites:(BOOL)a7 willBeDisplayedModally:(BOOL)a8;
- (_SFBookmarkInfoViewController)initWithBookmark:(id)a3 inCollection:(id)a4 addingBookmark:(BOOL)a5;
- (_SFBookmarkInfoViewControllerDelegate)delegate;
- (id)_cellForExpandedFolderAtIndex:(int64_t)a3 withTableView:(id)a4;
- (id)_cellForNewFolderRowWithTableView:(id)a3;
- (id)_cellForParentBookmarkWithTableView:(id)a3;
- (id)_cellForShowTitleSwitch:(id)a3;
- (id)_dequeueFolderPickerCellFromTableView:(id)a3;
- (id)_iconForViewCellGivenBookmark:(id)a3 syntheticFolder:(id)a4;
- (id)_titleCell;
- (id)backgroundColorUsingTranslucentAppearance:(BOOL)a3;
- (id)syntheticBookmarkProviderForBookmarkInfoViewController:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int64_t)_numberOfExpandedFolderPickerRows;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_addActionsForTextFields;
- (void)_bookmarksDidReload:(id)a3;
- (void)_createCellsIfNeeded;
- (void)_createNewFolder;
- (void)_didBeginEditingTextField:(id)a3;
- (void)_didChangeEditingTextField:(id)a3;
- (void)_editField:(unint64_t)a3;
- (void)_reloadFolderInfoForced:(BOOL)a3;
- (void)_removeActionsForTextFields;
- (void)_returnWasPressedInTextField:(id)a3;
- (void)_saveButtonPressed;
- (void)_setFolderPickerExpanded:(BOOL)a3 animated:(BOOL)a4;
- (void)_showTitleSwitchPressed:(id)a3;
- (void)_updateCellValues;
- (void)_updateIconViewFrame;
- (void)_updateLastSelectedFolder;
- (void)_updateNavigationTitle;
- (void)_updateSaveButton;
- (void)_valuesChanged;
- (void)bookmarkInfoViewController:(id)a3 didFinishWithResult:(BOOL)a4;
- (void)bookmarkTextEntryTableViewController:(id)a3 dismissedWithText:(id)a4;
- (void)cancel;
- (void)dealloc;
- (void)didRotateFromInterfaceOrientation:(int64_t)a3;
- (void)loadView;
- (void)reloadData;
- (void)saveChanges;
- (void)setBookmark:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setParent:(id)a3 syntheticParentFolder:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateBookmarkIcon;
- (void)updateLastSelectedSyntheticFolder;
- (void)updateTranslucentAppearance;
- (void)validateCommand:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation _SFBookmarkInfoViewController

- (_SFBookmarkInfoViewController)initWithBookmark:(id)a3 childBookmarks:(id)a4 inCollection:(id)a5 addingBookmark:(BOOL)a6 toFavorites:(BOOL)a7 willBeDisplayedModally:(BOOL)a8
{
  BOOL v8 = a8;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  v35.receiver = self;
  v35.super_class = (Class)_SFBookmarkInfoViewController;
  v17 = [(_SFBookmarkInfoViewController *)&v35 initWithStyle:2];
  if (v17)
  {
    uint64_t v18 = [v14 copy];
    bookmark = v17->_bookmark;
    v17->_bookmark = (WebBookmark *)v18;

    objc_storeStrong((id *)&v17->_childBookmarks, a4);
    v17->_addingBookmark = a6;
    v17->_addingToFavorites = a7;
    v17->_enableAddFolder = [v14 isFolder] ^ 1;
    v20 = v17->_bookmark;
    if (v20)
    {
      uint64_t v21 = objc_msgSend(v16, "bookmarkWithID:", -[WebBookmark parentID](v20, "parentID"));
      parentBookmark = v17->_parentBookmark;
      v17->_parentBookmark = (WebBookmark *)v21;

      v20 = v17->_bookmark;
    }
    if ([(WebBookmark *)v20 subtype] == 1) {
      v17->_lastSelectedSyntheticFolderID = [(WebBookmark *)v17->_bookmark parentID];
    }
    objc_storeStrong((id *)&v17->_collection, a5);
    v23 = [(_SFBookmarkInfoViewController *)v17 navigationItem];
    [(_SFBookmarkInfoViewController *)v17 _updateNavigationTitle];
    if (v8)
    {
      id v24 = objc_alloc(MEMORY[0x1E4FB14A8]);
      v25 = objc_msgSend(v24, "initWithBarButtonSystemItem:target:action:", objc_msgSend(MEMORY[0x1E4FB14A8], "_sf_popoverCancelButtonItem"), v17, sel_cancel);
      [v25 setAccessibilityIdentifier:@"BookmarkInfoCancelButton"];
      [v23 setLeftBarButtonItem:v25];
      id v26 = objc_alloc(MEMORY[0x1E4FB14A8]);
      v27 = _WBSLocalizedString();
      uint64_t v28 = [v26 initWithTitle:v27 style:2 target:v17 action:sel__saveButtonPressed];
      saveButton = v17->_saveButton;
      v17->_saveButton = (UIBarButtonItem *)v28;

      [(UIBarButtonItem *)v17->_saveButton setAccessibilityIdentifier:@"BookmarkInfoSaveButton"];
      [v23 setRightBarButtonItem:v17->_saveButton];
    }
    v30 = (UISwitch *)objc_alloc_init(MEMORY[0x1E4FB1CD0]);
    showTitleSwitch = v17->_showTitleSwitch;
    v17->_showTitleSwitch = v30;

    [(UISwitch *)v17->_showTitleSwitch setOn:[(WebBookmark *)v17->_bookmark showIconOnly] ^ 1];
    [(UISwitch *)v17->_showTitleSwitch addTarget:v17 action:sel__showTitleSwitchPressed_ forControlEvents:64];
    v32 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v32 addObserver:v17 selector:sel__bookmarksDidReload_ name:*MEMORY[0x1E4FB6148] object:0];

    v17->_editingField = -1;
    v33 = v17;
  }
  return v17;
}

- (_SFBookmarkInfoViewController)initWithBookmark:(id)a3 inCollection:(id)a4 addingBookmark:(BOOL)a5
{
  return [(_SFBookmarkInfoViewController *)self initWithBookmark:a3 childBookmarks:0 inCollection:a4 addingBookmark:a5 toFavorites:0 willBeDisplayedModally:a5];
}

- (void)_updateNavigationTitle
{
  id v10 = [(_SFBookmarkInfoViewController *)self navigationItem];
  if (self->_addingToFavorites)
  {
    v3 = [(SFSyntheticBookmarkFolder *)self->_syntheticParentBookmarkFolder title];
    if ([v3 length])
    {
      v4 = NSString;
      v5 = _WBSLocalizedString();
      v6 = objc_msgSend(v4, "stringWithFormat:", v5, v3);
      [v10 setTitle:v6];
    }
    else
    {
      v5 = _WBSLocalizedString();
      [v10 setTitle:v5];
    }
  }
  else
  {
    BOOL addingBookmark = self->_addingBookmark;
    [(WebBookmark *)self->_bookmark isFolder];
    if (!addingBookmark)
    {
      BOOL v8 = _WBSLocalizedString();
      [v10 setTitle:v8];

      v9 = v10;
      self->_saveWhenDismissed = 1;
      goto LABEL_10;
    }
    v3 = _WBSLocalizedString();
    [v10 setTitle:v3];
  }

  v9 = v10;
LABEL_10:
}

- (void)_saveButtonPressed
{
  [(_SFBookmarkInfoViewController *)self saveChanges];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained bookmarkInfoViewController:self didFinishWithResult:1];
  }
}

- (void)cancel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained bookmarkInfoViewController:self didFinishWithResult:0];
  }
}

- (void)_returnWasPressedInTextField:(id)a3
{
  if ([(_SFBookmarkInfoViewController *)self _sf_canEditFields])
  {
    [(_SFBookmarkInfoViewController *)self _saveButtonPressed];
    v4 = (void *)*MEMORY[0x1E4FB2608];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __62___SFBookmarkInfoViewController__returnWasPressedInTextField___block_invoke;
    v5[3] = &unk_1E5C724D8;
    v5[4] = self;
    [v4 _performBlockAfterCATransactionCommits:v5];
  }
}

- (void)_showTitleSwitchPressed:(id)a3
{
  uint64_t v4 = [(WebBookmark *)self->_bookmark showIconOnly] ^ 1;
  bookmark = self->_bookmark;

  [(WebBookmark *)bookmark setShowIconOnly:v4];
}

- (UIEdgeInsets)_cellInset
{
  v2 = [(_SFBookmarkInfoViewController *)self tableView];
  [v2 separatorInset];
  double v4 = v3 + 15.0 + 60.0;
  double v5 = *MEMORY[0x1E4FB2F28];

  double v6 = 0.0;
  double v7 = 0.0;
  double v8 = v4;
  double v9 = v5;
  result.right = v9;
  result.bottom = v7;
  result.left = v8;
  result.top = v6;
  return result;
}

- (void)_createCellsIfNeeded
{
  if (!self->_titleCell)
  {
    double v3 = [[_SFBookmarkTextEntryTableViewCell alloc] initWithText:0 autocapitalizationType:2 autocorrectionType:0];
    titleCell = self->_titleCell;
    self->_titleCell = v3;

    double v5 = [(_SFBookmarkTextEntryTableViewCell *)self->_titleCell editableTextField];
    double v6 = _WBSLocalizedString();
    [v5 setPlaceholder:v6];

    [v5 setAccessibilityIdentifier:@"BookmarkInfoTitleTextField"];
    double v7 = [v5 textInputTraits];
    [v7 setEnablesReturnKeyOnNonWhiteSpaceContent:1];

    [v5 addTarget:self action:sel__didBeginEditingTextField_ forControlEvents:0x10000];
    [v5 addTarget:self action:sel__didChangeEditingTextField_ forControlEvents:0x20000];
  }
  if (!self->_addressCell)
  {
    double v8 = [[_SFBookmarkTextEntryTableViewCell alloc] initWithText:0 autocapitalizationType:0 autocorrectionType:1];
    addressCell = self->_addressCell;
    self->_addressCell = v8;

    id v11 = [(_SFBookmarkTextEntryTableViewCell *)self->_addressCell editableTextField];
    [v11 setKeyboardType:3];
    id v10 = _WBSLocalizedString();
    [v11 setPlaceholder:v10];

    [v11 setAccessibilityIdentifier:@"BookmarkInfoAddressTextField"];
    [v11 addTarget:self action:sel__didBeginEditingTextField_ forControlEvents:0x10000];
    [v11 addTarget:self action:sel__didChangeEditingTextField_ forControlEvents:0x20000];
  }
}

- (void)loadView
{
  v8.receiver = self;
  v8.super_class = (Class)_SFBookmarkInfoViewController;
  [(_SFBookmarkInfoViewController *)&v8 loadView];
  double v3 = [(_SFBookmarkInfoViewController *)self tableView];
  [v3 setAccessibilityIdentifier:@"BookmarkInfoTableView"];
  [v3 setRowHeight:*MEMORY[0x1E4FB2F28]];
  [v3 setEstimatedRowHeight:44.0];
  [v3 setEstimatedSectionHeaderHeight:0.0];
  [v3 setEstimatedSectionFooterHeight:0.0];
  if (([(WebBookmark *)self->_bookmark isFolder] & 1) == 0)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F785A8]);
    double v5 = (_SFSiteIconView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), 60.0, 60.0);
    iconImageView = self->_iconImageView;
    self->_iconImageView = v5;

    double v7 = [(_SFSiteIconView *)self->_iconImageView layer];
    [v7 setZPosition:1.0];

    [v3 addSubview:self->_iconImageView];
    [(_SFSiteIconView *)self->_iconImageView setBookmark:self->_bookmark];
  }
  [(_SFBookmarkInfoViewController *)self reloadData];
}

- (id)_titleCell
{
  v2 = [(_SFBookmarkInfoViewController *)self tableView];
  double v3 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:0];
  id v4 = [v2 cellForRowAtIndexPath:v3];

  return v4;
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_SFBookmarkInfoViewController;
  [(SFPopoverSizingTableViewController *)&v6 viewWillAppear:a3];
  id v4 = [(_SFBookmarkInfoViewController *)self tableView];
  [v4 reloadData];

  double v5 = [(_SFBookmarkTextEntryTableViewCell *)self->_addressCell editableTextField];
  [v5 setEnabled:!self->_addingBookmark];

  if (self->_folderPickerExpanded) {
    [(_SFBookmarkInfoViewController *)self _setFolderPickerExpanded:0 animated:0];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_SFBookmarkInfoViewController;
  [(_SFBookmarkInfoViewController *)&v5 viewWillDisappear:a3];
  [(_SFBookmarkInfoViewController *)self _removeActionsForTextFields];
  if (self->_saveWhenDismissed
    && (([(_SFBookmarkInfoViewController *)self isBeingDismissed] & 1) != 0
     || [(_SFBookmarkInfoViewController *)self isMovingFromParentViewController]))
  {
    [(_SFBookmarkInfoViewController *)self saveChanges];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained bookmarkInfoViewController:self didFinishWithResult:1];
    }
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(_SFBookmarkInfoViewController *)self _addActionsForTextFields];
  if (([(_SFBookmarkInfoViewController *)self _isInPopoverPresentation] & 1) != 0
    || [(_SFBookmarkInfoViewController *)self _sf_canEditFields])
  {
    objc_super v5 = [(_SFBookmarkInfoViewController *)self _titleCell];
    objc_super v6 = [v5 editableTextField];
    [v6 becomeFirstResponder];
  }
  v7.receiver = self;
  v7.super_class = (Class)_SFBookmarkInfoViewController;
  [(SFPopoverSizingTableViewController *)&v7 viewDidAppear:v3];
}

- (void)viewDidLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)_SFBookmarkInfoViewController;
  [(SFPopoverSizingTableViewController *)&v5 viewDidLayoutSubviews];
  textFieldToRestoreFirstResponder = self->_textFieldToRestoreFirstResponder;
  if (textFieldToRestoreFirstResponder)
  {
    [(UITextField *)textFieldToRestoreFirstResponder becomeFirstResponder];
    id v4 = self->_textFieldToRestoreFirstResponder;
    self->_textFieldToRestoreFirstResponder = 0;
  }
}

- (void)didRotateFromInterfaceOrientation:(int64_t)a3
{
  if ([(_SFBookmarkInfoViewController *)self _sf_canEditFields])
  {
    id v5 = [(_SFBookmarkInfoViewController *)self _titleCell];
    id v4 = [v5 editableTextField];
    [v4 becomeFirstResponder];
  }
  else
  {
    id v5 = [(_SFBookmarkInfoViewController *)self firstResponder];
    [v5 resignFirstResponder];
  }
}

- (void)_bookmarksDidReload:(id)a3
{
  id v4 = self->_parentBookmark;
  collection = self->_collection;
  id v11 = v4;
  objc_super v6 = [(WebBookmark *)v4 UUID];
  objc_super v7 = [(WebBookmarkCollection *)collection bookmarkWithUUID:v6];
  parentBookmark = self->_parentBookmark;
  self->_parentBookmark = v7;

  if (!self->_parentBookmark)
  {
    double v9 = [(WebBookmarkCollection *)self->_collection rootBookmark];
    id v10 = self->_parentBookmark;
    self->_parentBookmark = v9;
  }
  [(_SFBookmarkInfoViewController *)self reloadData];
}

- (BOOL)titleCellHasText
{
  v2 = [(_SFBookmarkTextEntryTableViewCell *)self->_titleCell editableTextField];
  BOOL v3 = [v2 text];
  BOOL v4 = [v3 length] != 0;

  return v4;
}

- (void)reloadData
{
  [(_SFBookmarkInfoViewController *)self _createCellsIfNeeded];
  BOOL v3 = [(_SFBookmarkTextEntryTableViewCell *)self->_titleCell editableTextField];
  BOOL v4 = [(WebBookmark *)self->_bookmark localizedTitle];
  [v3 setText:v4];

  id v5 = [(_SFBookmarkTextEntryTableViewCell *)self->_addressCell editableTextField];
  objc_super v6 = (void *)MEMORY[0x1E4F1CB10];
  objc_super v7 = [(WebBookmark *)self->_bookmark address];
  objc_super v8 = objc_msgSend(v6, "safari_URLWithDataAsString:", v7);
  double v9 = objc_msgSend(v8, "safari_userVisibleString");
  [v5 setText:v9];

  if (([(WebBookmark *)self->_bookmark isFolder] & 1) == 0) {
    [(_SFBookmarkInfoViewController *)self updateBookmarkIcon];
  }
  [(_SFBookmarkInfoViewController *)self _reloadFolderInfoForced:1];
  [(_SFBookmarkInfoViewController *)self _updateCellValues];
  id v10 = [(_SFBookmarkInfoViewController *)self tableView];
  [v10 reloadData];
}

- (void)updateLastSelectedSyntheticFolder
{
  BOOL v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  BOOL v4 = [v3 stringForKey:*MEMORY[0x1E4F78A08]];
  int v5 = [v4 integerValue];

  if (v5)
  {
    self->_lastSelectedSyntheticFolderID = v5;
    [(_SFBookmarkInfoViewController *)self reloadData];
  }
}

- (CGPoint)_centerForIconView
{
  BOOL v3 = [(_SFBookmarkInfoViewController *)self tableView];
  [v3 rectForSection:0];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  double v11 = v10;
  [v3 rectForHeaderInSection:0];
  double v13 = v12;
  [v3 rectForFooterInSection:0];
  double v15 = v14;
  id v16 = [(_SFBookmarkInfoViewController *)self view];
  int v17 = objc_msgSend(v16, "_sf_usesLeftToRightLayout");

  if (v17)
  {
    [v3 _sectionContentInset];
    [v3 separatorInset];
  }
  else
  {
    [v3 separatorInset];
    [v3 _sectionContentInset];
  }
  v25.size.height = v11 - v13 - v15;
  v25.origin.x = v5;
  v25.origin.y = v7;
  v25.size.width = v9;
  CGRectGetMidY(v25);
  _SFRoundPointToPixels();
  double v19 = v18;
  double v21 = v20;

  double v22 = v19;
  double v23 = v21;
  result.y = v23;
  result.x = v22;
  return result;
}

- (void)_updateIconViewFrame
{
  iconImageView = self->_iconImageView;
  [(_SFBookmarkInfoViewController *)self _centerForIconView];

  -[_SFSiteIconView setCenter:](iconImageView, "setCenter:");
}

- (void)updateBookmarkIcon
{
}

- (void)_updateCellValues
{
  double v15 = self->_titleCell;
  BOOL v3 = [(_SFBookmarkTextEntryTableViewCell *)v15 editableTextField];
  double v4 = self->_addressCell;
  CGFloat v5 = [(_SFBookmarkTextEntryTableViewCell *)v4 editableTextField];
  if ([(_SFBookmarkInfoViewController *)self _sf_canEditFields])
  {
    [v3 setUserInteractionEnabled:1];
    [v5 setUserInteractionEnabled:1];
    [(_SFBookmarkTextEntryTableViewCell *)v15 setAccessoryType:0];
    [(_SFBookmarkTextEntryTableViewCell *)v4 setAccessoryType:0];
    [(_SFBookmarkTextEntryTableViewCell *)v15 setSelectionStyle:0];
    uint64_t v6 = 0;
  }
  else
  {
    [v3 setUserInteractionEnabled:0];
    [v5 setUserInteractionEnabled:0];
    [(_SFBookmarkTextEntryTableViewCell *)v15 setAccessoryType:1];
    [(_SFBookmarkTextEntryTableViewCell *)v4 setAccessoryType:!self->_addingBookmark];
    [(_SFBookmarkTextEntryTableViewCell *)v15 setSelectionStyle:2];
    uint64_t v6 = 2 * !self->_addingBookmark;
  }
  [(_SFBookmarkTextEntryTableViewCell *)v4 setSelectionStyle:v6];
  if (([(WebBookmark *)self->_bookmark isFolder] & 1) == 0)
  {
    [(_SFBookmarkInfoViewController *)self _cellInset];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    -[_SFBookmarkTextEntryTableViewCell setSeparatorInset:](v15, "setSeparatorInset:");
    -[_SFBookmarkTextEntryTableViewCell setSeparatorInset:](v4, "setSeparatorInset:", v8, v10, v12, v14);
  }
  [(_SFBookmarkInfoViewController *)self _updateSaveButton];
}

- (void)setBookmark:(id)a3
{
  double v4 = (WebBookmark *)a3;
  if (self->_bookmark != v4)
  {
    double v8 = v4;
    CGFloat v5 = (WebBookmark *)[(WebBookmark *)v4 copy];
    bookmark = self->_bookmark;
    self->_bookmark = v5;

    double v7 = [(WebBookmarkCollection *)self->_collection bookmarkWithID:[(WebBookmark *)self->_bookmark parentID]];
    [(_SFBookmarkInfoViewController *)self setParent:v7 syntheticParentFolder:self->_syntheticParentBookmarkFolder];

    if ([(WebBookmark *)self->_bookmark subtype] == 1)
    {
      self->_lastSelectedSyntheticFolderID = [(WebBookmark *)self->_bookmark parentID];
      [(_SFBookmarkInfoViewController *)self _reloadFolderInfoForced:1];
    }
    [(_SFSiteIconView *)self->_iconImageView setBookmark:v8];
    [(_SFBookmarkInfoViewController *)self reloadData];
    double v4 = v8;
  }
}

- (void)setParent:(id)a3 syntheticParentFolder:(id)a4
{
  id v11 = a3;
  id v7 = a4;
  double v8 = [(WebBookmark *)self->_parentBookmark UUID];
  double v9 = [v11 UUID];
  if (![v8 isEqual:v9])
  {

    goto LABEL_5;
  }
  char v10 = WBSIsEqual();

  if ((v10 & 1) == 0)
  {
LABEL_5:
    objc_storeStrong((id *)&self->_parentBookmark, a3);
    objc_storeStrong((id *)&self->_syntheticParentBookmarkFolder, a4);
    self->_didSelectFolder = 1;
    [(_SFBookmarkInfoViewController *)self _updateNavigationTitle];
  }
}

- (void)saveChanges
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  self->_saveWhenDismissed = 0;
  if ([(_SFBookmarkInfoViewController *)self canSaveChanges])
  {
    BOOL v3 = [(_SFBookmarkTextEntryTableViewCell *)self->_titleCell editableTextField];
    [v3 resignFirstResponder];

    double v4 = [(_SFBookmarkTextEntryTableViewCell *)self->_titleCell editableTextField];
    CGFloat v5 = [v4 text];
    uint64_t v6 = objc_msgSend(v5, "_web_stringByTrimmingWhitespace");

    [(WebBookmark *)self->_bookmark setTitle:v6];
    id v7 = [(_SFBookmarkTextEntryTableViewCell *)self->_addressCell editableTextField];
    double v8 = [v7 text];

    [(WebBookmark *)self->_bookmark setAddress:v8];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v10 = [WeakRetained syntheticBookmarkProviderForBookmarkInfoViewController:self];

    uint64_t v11 = [(WebBookmark *)self->_bookmark subtype];
    double v12 = [(SFSyntheticBookmarkFolder *)self->_syntheticParentBookmarkFolder bookmarkList];
    uint64_t v13 = [v12 folderID];
    if (v11 == 1)
    {
      if ([(WebBookmark *)self->_bookmark parentID] == v13)
      {
        double v14 = [(WebBookmark *)self->_bookmark UUID];
        [v10 updateScopedBookmarkWithUUID:v14 title:v6 address:v8];

LABEL_43:
        return;
      }
      if (v12) {
        goto LABEL_8;
      }
      v41 = v10;
      v43 = [(WebBookmark *)self->_bookmark UUID];
      id v22 = objc_alloc(MEMORY[0x1E4FB60E0]);
      uint64_t v23 = [(WebBookmark *)self->_parentBookmark identifier];
      id v24 = [(WebBookmarkCollection *)self->_collection configuration];
      CGRect v25 = (WebBookmark *)objc_msgSend(v22, "initWithTitle:address:parentID:collectionType:", v6, v8, v23, objc_msgSend(v24, "collectionType"));
      bookmark = self->_bookmark;
      self->_bookmark = v25;
    }
    else
    {
      if (v12)
      {
LABEL_8:
        v44 = v12;
        id v15 = objc_alloc(MEMORY[0x1E4FB60E0]);
        [v10 deviceIdentifier];
        v17 = id v16 = v10;
        double v18 = [(WebBookmarkCollection *)self->_collection configuration];
        double v19 = objc_msgSend(v15, "initWithTitle:address:parentID:subtype:deviceIdentifier:collectionType:", v6, v8, v13, 1, v17, objc_msgSend(v18, "collectionType"));

        char v10 = v16;
        [v16 insertPerTabGroupBookmark:v19 inPerTabGroupBookmarkFolderWithID:v13];
        [(_SFBookmarkInfoViewController *)self _updateLastSelectedFolder];
        double v20 = self->_bookmark;
        if (v11 == 1)
        {
          double v21 = [(WebBookmark *)v20 UUID];
          [v16 deleteScopedBookmarkWithUUID:v21 completionHandler:0];
        }
        else if ([(WebBookmark *)v20 isInserted])
        {
          [(WebBookmarkCollection *)self->_collection deleteBookmark:self->_bookmark];
        }

LABEL_42:
        double v12 = v44;
        goto LABEL_43;
      }
      v41 = v10;
      v43 = 0;
    }
    v44 = 0;
    int v42 = [MEMORY[0x1E4FB60E8] isLockedSync];
    v45 = v8;
    if ((v42 & 1) != 0
      || ([MEMORY[0x1E4FB60E8] lockSync] & 1) != 0
      || ([(WebBookmark *)self->_bookmark isInserted] & 1) != 0
      || ([MEMORY[0x1E4F78290] sharedFeatureManager],
          v27 = objc_claimAutoreleasedReturnValue(),
          int v28 = [v27 isInMemoryBookmarkChangeTrackingAvailable],
          v27,
          !v28))
    {
      int v30 = [(WebBookmark *)self->_parentBookmark identifier];
      if (v30 != [(WebBookmark *)self->_bookmark parentID]) {
        [(WebBookmarkCollection *)self->_collection moveBookmark:self->_bookmark toFolderWithID:[(WebBookmark *)self->_parentBookmark identifier]];
      }
      int v29 = 0;
    }
    else
    {
      int v29 = 1;
    }
    v31 = v6;
    if (([(WebBookmarkCollection *)self->_collection shouldFetchIconForBookmark:self->_bookmark] & 1) == 0)
    {
      [(WebBookmark *)self->_bookmark setIconData:0];
      [(WebBookmark *)self->_bookmark _sf_setIconKeyColor:0];
      [(WebBookmark *)self->_bookmark setFetchedIconData:0];
    }
    if (v29)
    {
      [(WebBookmarkCollection *)self->_collection addBookmarkInMemory:self->_bookmark toFolderWithID:[(WebBookmark *)self->_parentBookmark identifier]];
      v32 = [MEMORY[0x1E4F98948] sharedLogger];
      objc_msgSend(v32, "didAddNumberOfBookmarksInMemory:", -[NSArray count](self->_childBookmarks, "count") + 1);
    }
    else
    {
      [(WebBookmarkCollection *)self->_collection saveBookmark:self->_bookmark];
    }
    if (v43) {
      [v41 deleteScopedBookmarkWithUUID:v43 completionHandler:0];
    }
    uint64_t v33 = [(WebBookmark *)self->_bookmark identifier];
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    v34 = self->_childBookmarks;
    uint64_t v35 = [(NSArray *)v34 countByEnumeratingWithState:&v46 objects:v50 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v47;
      do
      {
        for (uint64_t i = 0; i != v36; ++i)
        {
          if (*(void *)v47 != v37) {
            objc_enumerationMutation(v34);
          }
          uint64_t v39 = *(void *)(*((void *)&v46 + 1) + 8 * i);
          collection = self->_collection;
          if (v29) {
            [(WebBookmarkCollection *)collection addBookmarkInMemory:v39 toFolderWithID:v33];
          }
          else {
            [(WebBookmarkCollection *)collection saveAndMoveBookmark:v39 toFolderID:v33];
          }
        }
        uint64_t v36 = [(NSArray *)v34 countByEnumeratingWithState:&v46 objects:v50 count:16];
      }
      while (v36);
    }

    if (((v42 | v29) & 1) == 0) {
      [MEMORY[0x1E4FB60E8] unlockSync];
    }
    [(_SFBookmarkInfoViewController *)self _updateLastSelectedFolder];

    uint64_t v6 = v31;
    double v8 = v45;
    char v10 = v41;
    goto LABEL_42;
  }
}

- (void)_updateLastSelectedFolder
{
  if (self->_didSelectFolder)
  {
    id v8 = [(WebBookmark *)self->_parentBookmark UUID];
    if ([(WebBookmarkCollection *)self->_collection bookmarkIsFavoritesFolder:self->_parentBookmark])
    {
      id v3 = (id)*MEMORY[0x1E4F78A10];

      id v8 = v3;
    }
    double v4 = [(SFSyntheticBookmarkFolder *)self->_syntheticParentBookmarkFolder bookmarkList];
    CGFloat v5 = v4;
    if (v4)
    {
      uint64_t v6 = objc_msgSend(NSString, "stringWithFormat:", @"%d", objc_msgSend(v4, "folderID"));

      id v8 = (id)v6;
    }
    id v7 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    [v7 setObject:v8 forKey:*MEMORY[0x1E4F78A08]];
  }
}

- (void)_updateSaveButton
{
  BOOL v3 = [(_SFBookmarkInfoViewController *)self canSaveChanges];
  saveButton = self->_saveButton;

  [(UIBarButtonItem *)saveButton setEnabled:v3];
}

- (BOOL)canSaveChanges
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ![WeakRetained bookmarkInfoViewControllerCanSaveBookmarkChanges:self])
  {
    BOOL v10 = 0;
  }
  else
  {
    double v4 = [(_SFBookmarkTextEntryTableViewCell *)self->_titleCell editableTextField];
    CGFloat v5 = [v4 text];
    uint64_t v6 = objc_msgSend(v5, "_web_stringByTrimmingWhitespace");

    id v7 = [(_SFBookmarkTextEntryTableViewCell *)self->_addressCell editableTextField];
    id v8 = [v7 text];
    double v9 = objc_msgSend(v8, "_web_stringByTrimmingWhitespace");

    if ([v6 length]) {
      BOOL v10 = (-[WebBookmark isFolder](self->_bookmark, "isFolder") & 1) != 0 || [v9 length] != 0;
    }
    else {
      BOOL v10 = 0;
    }
  }
  return v10;
}

- (void)_editField:(unint64_t)a3
{
  self->_editingField = a3;
  if (a3 == 1)
  {
    double v14 = [_SFBookmarkTextEntryTableViewController alloc];
    id v8 = [(WebBookmark *)self->_bookmark address];
    double v9 = v14;
    uint64_t v10 = 1;
    uint64_t v11 = v8;
    uint64_t v12 = 0;
    uint64_t v13 = 1;
    goto LABEL_5;
  }
  if (!a3)
  {
    bookmark = self->_bookmark;
    CGFloat v5 = [(_SFBookmarkTextEntryTableViewCell *)self->_titleCell editableTextField];
    uint64_t v6 = [v5 text];
    [(WebBookmark *)bookmark setTitle:v6];

    id v7 = [_SFBookmarkTextEntryTableViewController alloc];
    id v8 = [(WebBookmark *)self->_bookmark localizedTitle];
    double v9 = v7;
    uint64_t v10 = 0;
    uint64_t v11 = v8;
    uint64_t v12 = 2;
    uint64_t v13 = 0;
LABEL_5:
    id v16 = [(_SFBookmarkTextEntryTableViewController *)v9 initWithBookmarkInfoViewField:v10 text:v11 autocapitalizationType:v12 autocorrectionType:v13 delegate:self];

    goto LABEL_7;
  }
  id v16 = 0;
LABEL_7:
  id v15 = [(_SFBookmarkInfoViewController *)self navigationController];
  [v15 pushViewController:v16 animated:1];
}

- (void)_createNewFolder
{
  id v3 = objc_alloc(MEMORY[0x1E4FB60E0]);
  uint64_t v4 = [(WebBookmark *)self->_bookmark parentID];
  CGFloat v5 = [(WebBookmarkCollection *)self->_collection configuration];
  id v8 = (id)objc_msgSend(v3, "initFolderWithParentID:collectionType:", v4, objc_msgSend(v5, "collectionType"));

  uint64_t v6 = [[_SFBookmarkInfoViewController alloc] initWithBookmark:v8 inCollection:self->_collection addingBookmark:1];
  [(_SFBookmarkInfoViewController *)v6 setDelegate:self];
  id v7 = [(_SFBookmarkInfoViewController *)self navigationController];
  [v7 pushViewController:v6 animated:1];
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if ([v5 section] != 1
    && (([(_SFBookmarkInfoViewController *)self _sf_canEditFields] & 1) != 0
     || [v5 row] && self->_addingBookmark))
  {
    id v6 = 0;
  }
  else
  {
    id v6 = v5;
  }

  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v20 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 section];
  uint64_t v8 = [v6 row];
  uint64_t v9 = v8;
  if (v7 == 1)
  {
    if ([(_SFBookmarkInfoViewController *)self _isIndexPathForNewFolderRow:v6])
    {
      [(_SFBookmarkInfoViewController *)self _createNewFolder];
    }
    else
    {
      if (self->_folderPickerExpanded)
      {
        uint64_t v12 = [MEMORY[0x1E4F28D58] indexPathForRow:self->_selectedFolderIndex inSection:1];
        uint64_t v13 = [v20 cellForRowAtIndexPath:v12];
        [v13 setAccessoryType:0];

        double v14 = [v20 cellForRowAtIndexPath:v6];
        [v14 setAccessoryType:3];

        id v15 = [(NSArray *)self->_folders objectAtIndexedSubscript:v9];
        id v16 = [v15 bookmark];
        int v17 = [v15 syntheticFolder];
        [(_SFBookmarkInfoViewController *)self setParent:v16 syntheticParentFolder:v17];
      }
      double v18 = [(_SFBookmarkTextEntryTableViewCell *)self->_titleCell editableTextField];
      [v18 resignFirstResponder];

      double v19 = [(_SFBookmarkTextEntryTableViewCell *)self->_addressCell editableTextField];
      [v19 resignFirstResponder];

      [(_SFBookmarkInfoViewController *)self _setFolderPickerExpanded:!self->_folderPickerExpanded animated:1];
    }
  }
  else
  {
    if (v8 == 1)
    {
      uint64_t v10 = self;
      uint64_t v11 = 1;
    }
    else
    {
      if (v8) {
        goto LABEL_12;
      }
      uint64_t v10 = self;
      uint64_t v11 = 0;
    }
    [(_SFBookmarkInfoViewController *)v10 _editField:v11];
  }
LABEL_12:
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (self->_addingToFavorites) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 3;
  }
  return v3
       - ([(_SFBookmarkInfoViewController *)self _showBookmarkAppearanceSwitch] ^ 1);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 2)
  {
    int64_t v7 = [(_SFBookmarkInfoViewController *)self _showBookmarkAppearanceSwitch];
  }
  else if (a4 == 1)
  {
    if (self->_folderPickerExpanded) {
      int64_t v7 = [(_SFBookmarkInfoViewController *)self _numberOfExpandedFolderPickerRows];
    }
    else {
      int64_t v7 = 1;
    }
  }
  else if (a4)
  {
    int64_t v7 = 0;
  }
  else if ([(WebBookmark *)self->_bookmark isFolder])
  {
    int64_t v7 = 1;
  }
  else
  {
    int64_t v7 = 2;
  }

  return v7;
}

- (int64_t)_numberOfExpandedFolderPickerRows
{
  return [(NSArray *)self->_folders count] + self->_enableAddFolder;
}

- (BOOL)_isIndexPathForNewFolderRow:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_folderPickerExpanded && [v4 section] == 1)
  {
    uint64_t v6 = [v5 row];
    BOOL v7 = v6 == [(NSArray *)self->_folders count];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 section])
  {
    if ([v7 section] == 2)
    {
      id v8 = [(_SFBookmarkInfoViewController *)self _cellForShowTitleSwitch:v6];
    }
    else if ([(_SFBookmarkInfoViewController *)self _isIndexPathForNewFolderRow:v7])
    {
      id v8 = [(_SFBookmarkInfoViewController *)self _cellForNewFolderRowWithTableView:v6];
    }
    else
    {
      if (self->_folderPickerExpanded) {
        -[_SFBookmarkInfoViewController _cellForExpandedFolderAtIndex:withTableView:](self, "_cellForExpandedFolderAtIndex:withTableView:", [v7 row], v6);
      }
      else {
      id v8 = [(_SFBookmarkInfoViewController *)self _cellForParentBookmarkWithTableView:v6];
      }
    }
  }
  else
  {
    uint64_t v9 = [v7 row];
    uint64_t v10 = &OBJC_IVAR____SFBookmarkInfoViewController__addressCell;
    if (!v9) {
      uint64_t v10 = &OBJC_IVAR____SFBookmarkInfoViewController__titleCell;
    }
    id v8 = *(id *)((char *)&self->super.super.super.super.super.isa + *v10);
  }
  uint64_t v11 = v8;

  return v11;
}

- (id)_dequeueFolderPickerCellFromTableView:(id)a3
{
  uint64_t v3 = [a3 dequeueReusableCellWithIdentifier:@"BookmarkFolderItemTableViewCell"];
  if (!v3)
  {
    uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:0 reuseIdentifier:@"BookmarkFolderItemTableViewCell"];
    +[_SFFolderPickerTableViewCellLayoutManager indentationWidth];
    objc_msgSend(v3, "setIndentationWidth:");
    id v4 = objc_alloc_init(_SFFolderPickerTableViewCellLayoutManager);
    [v3 setLayoutManager:v4];

    id v5 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:*MEMORY[0x1E4FB28C8] scale:3];
    id v6 = [v3 imageView];
    [v6 setPreferredSymbolConfiguration:v5];
  }

  return v3;
}

- (id)_cellForShowTitleSwitch:(id)a3
{
  id v4 = [a3 dequeueReusableCellWithIdentifier:@"BookmarkShowTitleSwitch"];
  if (!v4) {
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:0 reuseIdentifier:@"BookmarkShowTitleSwitch"];
  }
  id v5 = _WBSLocalizedString();
  id v6 = [v4 textLabel];
  [v6 setText:v5];

  [v4 setAccessoryView:self->_showTitleSwitch];
  [(UISwitch *)self->_showTitleSwitch setAccessibilityIdentifier:@"BookmarkShowTitleSwitch"];

  return v4;
}

- (id)_cellForNewFolderRowWithTableView:(id)a3
{
  uint64_t v3 = [(_SFBookmarkInfoViewController *)self _dequeueFolderPickerCellFromTableView:a3];
  id v4 = _WBSLocalizedString();
  id v5 = [v3 textLabel];
  [v5 setText:v4];

  id v6 = objc_msgSend(MEMORY[0x1E4FB1618], "sf_safariAccentColor");
  id v7 = [v3 textLabel];
  [v7 setTextColor:v6];

  id v8 = [MEMORY[0x1E4FB1818] systemImageNamed:@"plus"];
  uint64_t v9 = [v3 imageView];
  [v9 setImage:v8];

  [v3 setIndentationLevel:0];
  [v3 setAccessoryType:1];
  [v3 setTintAdjustmentMode:0];
  [v3 setAccessibilityIdentifier:@"BookmarkInfoLocationNewFolder"];
  [v3 setUserInteractionEnabled:1];

  return v3;
}

- (id)_cellForExpandedFolderAtIndex:(int64_t)a3 withTableView:(id)a4
{
  id v6 = a4;
  id v7 = [(NSArray *)self->_folders objectAtIndexedSubscript:a3];
  id v8 = [v7 syntheticFolder];
  uint64_t v9 = v8;
  if (v8)
  {
    uint64_t v10 = [v8 bookmarkList];
    if (v10) {
      uint64_t v11 = [(WebBookmark *)self->_bookmark isFolder] ^ 1;
    }
    else {
      uint64_t v11 = 0;
    }
  }
  else
  {
    uint64_t v11 = 1;
  }
  uint64_t v12 = [(_SFBookmarkInfoViewController *)self _dequeueFolderPickerCellFromTableView:v6];
  uint64_t v13 = [v7 title];
  double v14 = [v12 textLabel];
  [v14 setText:v13];

  if (v11) {
    [MEMORY[0x1E4FB1618] labelColor];
  }
  else {
  id v15 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  }
  id v16 = [v12 textLabel];
  [v16 setTextColor:v15];

  int v17 = [v7 bookmark];
  double v18 = [(_SFBookmarkInfoViewController *)self _iconForViewCellGivenBookmark:v17 syntheticFolder:v9];
  double v19 = [v12 imageView];
  [v19 setImage:v18];

  objc_msgSend(v12, "setIndentationLevel:", objc_msgSend(v7, "depth"));
  int64_t selectedFolderIndex = self->_selectedFolderIndex;
  BOOL v21 = selectedFolderIndex == a3;
  BOOL v22 = selectedFolderIndex != a3;
  if (v21) {
    uint64_t v23 = 3;
  }
  else {
    uint64_t v23 = 0;
  }
  [v12 setAccessoryType:v23];
  [v12 setTintAdjustmentMode:2 * v22];
  [v12 setAccessibilityIdentifier:@"BookmarkInfoLocationFolderChoice"];
  [v12 setUserInteractionEnabled:v11];

  return v12;
}

- (id)_cellForParentBookmarkWithTableView:(id)a3
{
  id v5 = [(_SFBookmarkInfoViewController *)self _dequeueFolderPickerCellFromTableView:a3];
  syntheticParentBookmarkFolder = self->_syntheticParentBookmarkFolder;
  if (syntheticParentBookmarkFolder) {
    goto LABEL_4;
  }
  if (self->_parentBookmark)
  {
    syntheticParentBookmarkFolder = 0;
LABEL_4:
    id v7 = 0;
    goto LABEL_5;
  }
  id v7 = [(NSArray *)self->_folders objectAtIndexedSubscript:0];
  syntheticParentBookmarkFolder = self->_syntheticParentBookmarkFolder;
LABEL_5:
  uint64_t v8 = [(SFSyntheticBookmarkFolder *)syntheticParentBookmarkFolder title];
  uint64_t v9 = (void *)v8;
  if (v8)
  {
    int v10 = 0;
    uint64_t v11 = (void *)v8;
  }
  else
  {
    uint64_t v12 = [(WebBookmark *)self->_parentBookmark localizedTitle];
    uint64_t v3 = (void *)v12;
    if (v12)
    {
      int v10 = 0;
      uint64_t v11 = (void *)v12;
    }
    else
    {
      uint64_t v11 = [v7 title];
      int v10 = 1;
    }
  }
  uint64_t v13 = [v5 textLabel];
  [v13 setText:v11];

  if (v10) {
  if (!v9)
  }

  parentBookmark = self->_parentBookmark;
  id v15 = parentBookmark;
  if (!parentBookmark)
  {
    id v15 = [v7 bookmark];
  }
  id v16 = [(_SFBookmarkInfoViewController *)self _iconForViewCellGivenBookmark:v15 syntheticFolder:self->_syntheticParentBookmarkFolder];
  int v17 = [v5 imageView];
  [v17 setImage:v16];

  if (!parentBookmark) {
  [v5 setIndentationLevel:0];
  }
  [v5 setAccessoryType:0];
  [v5 setTintAdjustmentMode:0];
  [v5 setAccessibilityIdentifier:@"BookmarkInfoLocationFolderPicker"];
  [v5 setUserInteractionEnabled:1];

  return v5;
}

- (id)_iconForViewCellGivenBookmark:(id)a3 syntheticFolder:(id)a4
{
  id v6 = a3;
  id v7 = (NSString *)*MEMORY[0x1E4FB27B0];
  uint64_t v8 = [MEMORY[0x1E4FB1438] sharedApplication];
  uint64_t v9 = [v8 preferredContentSizeCategory];
  NSComparisonResult v10 = UIContentSizeCategoryCompareToCategory(v7, v9);

  if (v10 == NSOrderedAscending)
  {
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x1E4FB1818];
    if (a4)
    {
      uint64_t v12 = @"star.square.on.square";
    }
    else if ([(_SFBookmarkInfoViewController *)self _bookmarkIsInFavoritesFolder:v6])
    {
      uint64_t v12 = @"star";
    }
    else
    {
      uint64_t v12 = @"folder";
    }
    uint64_t v13 = [v11 systemImageNamed:v12];
  }

  return v13;
}

- (BOOL)_bookmarkIsInFavoritesFolder:(id)a3
{
  collection = self->_collection;
  id v4 = a3;
  id v5 = [(WebBookmarkCollection *)collection bookmarksBarBookmark];
  char v6 = [v5 isEqual:v4];

  return v6;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  if (a4)
  {
    if (a4 == 2)
    {
      if ([(_SFBookmarkInfoViewController *)self _showBookmarkAppearanceSwitch])
      {
LABEL_6:
        a4 = _WBSLocalizedString();
        goto LABEL_9;
      }
      a4 = 0;
    }
    else
    {
      if (a4 == 1) {
        goto LABEL_6;
      }
      a4 = (int64_t)&stru_1EFB97EB8;
    }
  }
LABEL_9:

  return (id)a4;
}

- (BOOL)tableView:(id)a3 canFocusRowAtIndexPath:(id)a4
{
  return objc_msgSend(a4, "section", a3) == 1;
}

- (BOOL)_showBookmarkAppearanceSwitch
{
  if (!_SFDeviceIsPad() || self->_addingBookmark) {
    return 0;
  }
  id v5 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  if ([v5 integerForKey:*MEMORY[0x1E4F785E8]])
  {
    char v3 = 0;
  }
  else
  {
    id v6 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    if ([v6 BOOLForKey:*MEMORY[0x1E4F785D8]])
    {
      id v7 = [(NSArray *)self->_folders objectAtIndexedSubscript:self->_selectedFolderIndex];
      uint64_t v8 = [v7 bookmark];
      if ([(_SFBookmarkInfoViewController *)self _bookmarkIsInFavoritesFolder:v8])
      {
        if ([(WebBookmark *)self->_bookmark isFolder])
        {
          uint64_t v9 = [(WebBookmark *)self->_bookmark title];
          NSComparisonResult v10 = (void *)MEMORY[0x1E4FB1EB0];
          uint64_t v11 = [(_SFBookmarkInfoViewController *)self view];
          char v3 = objc_msgSend(v9, "safari_hasLeadingEmojiSafariIsRightToLeft:", objc_msgSend(v10, "_sf_usesLeftToRightLayoutOnView:", v11) ^ 1);
        }
        else
        {
          char v3 = 1;
        }
      }
      else
      {
        char v3 = 0;
      }
    }
    else
    {
      char v3 = 0;
    }
  }
  return v3;
}

- (void)_didBeginEditingTextField:(id)a3
{
}

- (void)_didChangeEditingTextField:(id)a3
{
  id v9 = a3;
  id v4 = [(_SFBookmarkTextEntryTableViewCell *)self->_titleCell editableTextField];

  if (v4 == v9)
  {
    uint64_t v7 = 0;
  }
  else
  {
    id v5 = [(_SFBookmarkTextEntryTableViewCell *)self->_addressCell editableTextField];

    if (v5 != v9)
    {
      id v6 = 0;
      goto LABEL_7;
    }
    uint64_t v7 = 1;
  }
  id v6 = [MEMORY[0x1E4F28D58] indexPathForRow:v7 inSection:0];
LABEL_7:
  [(_SFBookmarkInfoViewController *)self _setFolderPickerExpanded:0 animated:1];
  uint64_t v8 = [(_SFBookmarkInfoViewController *)self tableView];
  [v8 scrollToRowAtIndexPath:v6 atScrollPosition:0 animated:1];
}

- (void)_setFolderPickerExpanded:(BOOL)a3 animated:(BOOL)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  if (self->_folderPickerExpanded != a3)
  {
    BOOL v4 = a4;
    self->_folderPickerExpanded = a3;
    [(_SFBookmarkInfoViewController *)self _reloadFolderInfoForced:0];
    id v6 = [(_SFBookmarkInfoViewController *)self tableView];
    uint64_t v7 = v6;
    if (v4)
    {
      uint64_t v8 = [MEMORY[0x1E4F28D58] indexPathForRow:0 inSection:1];
      v23[0] = v8;
      id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];

      NSComparisonResult v10 = [MEMORY[0x1E4F1CA48] array];
      int64_t v11 = [(_SFBookmarkInfoViewController *)self _numberOfExpandedFolderPickerRows];
      if (v11)
      {
        int64_t v12 = v11;
        for (uint64_t i = 0; i != v12; ++i)
        {
          double v14 = [MEMORY[0x1E4F28D58] indexPathForRow:i inSection:1];
          [v10 addObject:v14];
        }
      }
      [v7 beginUpdates];
      if (self->_folderPickerExpanded) {
        id v15 = v9;
      }
      else {
        id v15 = v10;
      }
      [v7 deleteRowsAtIndexPaths:v15 withRowAnimation:0];
      if (self->_folderPickerExpanded) {
        id v16 = v10;
      }
      else {
        id v16 = v9;
      }
      [v7 insertRowsAtIndexPaths:v16 withRowAnimation:0];
      BOOL v17 = [v7 numberOfSections] < 3;
      if (((v17 ^ [(_SFBookmarkInfoViewController *)self _showBookmarkAppearanceSwitch]) & 1) == 0)
      {
        double v18 = [MEMORY[0x1E4F28D60] indexSetWithIndex:2];
        if ([(_SFBookmarkInfoViewController *)self _showBookmarkAppearanceSwitch]) {
          [v7 insertSections:v18 withRowAnimation:0];
        }
        else {
          [v7 deleteSections:v18 withRowAnimation:0];
        }
      }
      [v7 endUpdates];
    }
    else
    {
      [v6 reloadData];
    }
    if (self->_folderPickerExpanded)
    {
      double v19 = [MEMORY[0x1E4F28D58] indexPathForRow:self->_selectedFolderIndex inSection:1];
      [v7 scrollToRowAtIndexPath:v19 atScrollPosition:0 animated:1];
    }
    id v20 = [(_SFBookmarkInfoViewController *)self sheetPresentationController];
    BOOL v21 = v20;
    if (v4 && v20)
    {
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __67___SFBookmarkInfoViewController__setFolderPickerExpanded_animated___block_invoke;
      v22[3] = &unk_1E5C724D8;
      v22[4] = self;
      [v20 animateChanges:v22];
    }
    else
    {
      [(SFPopoverSizingTableViewController *)self updatePreferredContentSize];
    }
  }
}

- (void)_reloadFolderInfoForced:(BOOL)a3
{
  if (a3 || self->_folderPickerExpanded && !self->_folders)
  {
    if ([(WebBookmark *)self->_bookmark isFolder])
    {
      BOOL v4 = (void *)MEMORY[0x1E4F1CAD0];
      id v5 = objc_msgSend(NSNumber, "numberWithInt:", -[WebBookmark identifier](self->_bookmark, "identifier"));
      id v6 = [v4 setWithObject:v5];
    }
    else
    {
      id v6 = 0;
    }
    uint64_t v7 = [[SFFolderPickerList alloc] initWithBookmarkCollection:self->_collection style:0];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v9 = [WeakRetained syntheticBookmarkProviderForBookmarkInfoViewController:self];
    [(SFFolderPickerList *)v7 setSyntheticBookmarkProvider:v9];

    NSComparisonResult v10 = [(SFFolderPickerList *)v7 folderListItemsIgnoringIdentifiers:v6];
    folders = self->_folders;
    self->_folders = v10;
  }
  int64_t v12 = self->_folders;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __57___SFBookmarkInfoViewController__reloadFolderInfoForced___block_invoke;
  v16[3] = &unk_1E5C75C80;
  v16[4] = self;
  int64_t v13 = [(NSArray *)v12 indexOfObjectPassingTest:v16];
  if (v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
    double v14 = self->_folders;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __57___SFBookmarkInfoViewController__reloadFolderInfoForced___block_invoke_2;
    v15[3] = &unk_1E5C75C80;
    v15[4] = self;
    int64_t v13 = [(NSArray *)v14 indexOfObjectPassingTest:v15];
  }
  self->_int64_t selectedFolderIndex = v13;
}

- (BOOL)isEditingField
{
  return self->_editingField != -1;
}

- (void)_valuesChanged
{
  if (![(_SFBookmarkInfoViewController *)self isEditingField])
  {
    [(_SFBookmarkInfoViewController *)self _updateSaveButton];
  }
}

- (void)_addActionsForTextFields
{
  char v3 = [(_SFBookmarkTextEntryTableViewCell *)self->_titleCell editableTextField];
  [v3 addTarget:self action:sel__returnWasPressedInTextField_ forControlEvents:0x80000];

  BOOL v4 = [(_SFBookmarkTextEntryTableViewCell *)self->_addressCell editableTextField];
  [v4 addTarget:self action:sel__returnWasPressedInTextField_ forControlEvents:0x80000];

  id v5 = [(_SFBookmarkTextEntryTableViewCell *)self->_titleCell editableTextField];
  [v5 addTarget:self action:sel__valuesChanged forControlEvents:0x20000];

  id v6 = [(_SFBookmarkTextEntryTableViewCell *)self->_addressCell editableTextField];
  [v6 addTarget:self action:sel__valuesChanged forControlEvents:0x20000];
}

- (void)_removeActionsForTextFields
{
  char v3 = [(_SFBookmarkTextEntryTableViewCell *)self->_titleCell editableTextField];
  [v3 removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];

  id v4 = [(_SFBookmarkTextEntryTableViewCell *)self->_addressCell editableTextField];
  [v4 removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];
}

- (void)bookmarkTextEntryTableViewController:(id)a3 dismissedWithText:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  unint64_t editingField = self->_editingField;
  if (editingField == 1)
  {
    [(WebBookmark *)self->_bookmark setAddress:v6];
  }
  else if (!editingField)
  {
    [(WebBookmark *)self->_bookmark setTitle:v6];
  }
  [(_SFBookmarkInfoViewController *)self reloadData];
  self->_unint64_t editingField = -1;
}

- (void)dealloc
{
  char v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)_SFBookmarkInfoViewController;
  [(_SFBookmarkInfoViewController *)&v4 dealloc];
}

- (void)viewWillLayoutSubviews
{
  if (([(WebBookmark *)self->_bookmark isFolder] & 1) == 0) {
    [(_SFBookmarkInfoViewController *)self _updateIconViewFrame];
  }

  [(_SFBookmarkInfoViewController *)self _updateCellValues];
}

- (BOOL)hasTranslucentAppearance
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([WeakRetained bookmarkInfoViewControllerShouldUseTranslucentAppearance:self] & 1) != 0)
  {
    BOOL v4 = 1;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)_SFBookmarkInfoViewController;
    BOOL v4 = [(SFPopoverSizingTableViewController *)&v6 hasTranslucentAppearance];
  }

  return v4;
}

- (void)updateTranslucentAppearance
{
  uint64_t v3 = 1112;
  BOOL v4 = [(_SFBookmarkTextEntryTableViewCell *)self->_titleCell editableTextField];
  int v5 = [v4 isFirstResponder];

  if (v5
    || (uint64_t v3 = 1120,
        [(_SFBookmarkTextEntryTableViewCell *)self->_addressCell editableTextField],
        objc_super v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 isFirstResponder],
        v6,
        v7))
  {
    id v8 = [*(id *)((char *)&self->super.super.super.super.super.isa + v3) editableTextField];
    textFieldToRestoreFirstResponder = self->_textFieldToRestoreFirstResponder;
    self->_textFieldToRestoreFirstResponder = v8;
  }
  v10.receiver = self;
  v10.super_class = (Class)_SFBookmarkInfoViewController;
  [(SFPopoverSizingTableViewController *)&v10 updateTranslucentAppearance];
}

- (id)backgroundColorUsingTranslucentAppearance:(BOOL)a3
{
  if (a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)_SFBookmarkInfoViewController;
    uint64_t v3 = [(SFPopoverSizingTableViewController *)&v5 backgroundColorUsingTranslucentAppearance:1];
  }
  else
  {
    uint64_t v3 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
  }

  return v3;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  if (sel_cancelKeyPressed == a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    char v9 = objc_opt_respondsToSelector();
  }
  else
  {
    if (sel_saveKeyPressed == a3)
    {
      unsigned __int8 v7 = [(_SFBookmarkInfoViewController *)self canSaveChanges];
    }
    else
    {
      v11.receiver = self;
      v11.super_class = (Class)_SFBookmarkInfoViewController;
      unsigned __int8 v7 = [(_SFBookmarkInfoViewController *)&v11 canPerformAction:a3 withSender:v6];
    }
    char v9 = v7;
  }

  return v9 & 1;
}

- (void)validateCommand:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_SFBookmarkInfoViewController;
  [(_SFBookmarkInfoViewController *)&v6 validateCommand:v4];
  if ((char *)[v4 action] == sel_saveKeyPressed)
  {
    objc_super v5 = _WBSLocalizedString();
    [v4 setDiscoverabilityTitle:v5];
  }
}

- (void)bookmarkInfoViewController:(id)a3 didFinishWithResult:(BOOL)a4
{
  if (a4)
  {
    objc_super v5 = (id *)a3;
    objc_super v6 = [v5 bookmark];
    parentBookmark = self->_parentBookmark;
    self->_parentBookmark = v6;

    objc_storeStrong((id *)&self->_syntheticParentBookmarkFolder, v5[135]);
    self->_didSelectFolder = 1;
    self->_folderPickerExpanded = 0;
    [(_SFBookmarkInfoViewController *)self _reloadFolderInfoForced:1];
    id v8 = [(_SFBookmarkInfoViewController *)self tableView];
    [v8 reloadData];
  }
  id v10 = [(_SFBookmarkInfoViewController *)self navigationController];
  id v9 = (id)[v10 popViewControllerAnimated:1];
}

- (BOOL)bookmarkInfoViewControllerCanSaveBookmarkChanges:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    char v5 = [WeakRetained bookmarkInfoViewControllerCanSaveBookmarkChanges:self];
  }
  else {
    char v5 = 1;
  }

  return v5;
}

- (BOOL)bookmarkInfoViewControllerShouldUseTranslucentAppearance:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    char v5 = [WeakRetained bookmarkInfoViewControllerShouldUseTranslucentAppearance:self];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (id)syntheticBookmarkProviderForBookmarkInfoViewController:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = [WeakRetained syntheticBookmarkProviderForBookmarkInfoViewController:self];

  return v5;
}

- (_SFBookmarkInfoViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_SFBookmarkInfoViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (WebBookmark)bookmark
{
  return self->_bookmark;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bookmark, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_showTitleSwitch, 0);
  objc_storeStrong((id *)&self->_saveButton, 0);
  objc_storeStrong((id *)&self->_textFieldToRestoreFirstResponder, 0);
  objc_storeStrong((id *)&self->_folders, 0);
  objc_storeStrong((id *)&self->_iconImageView, 0);
  objc_storeStrong((id *)&self->_addressCell, 0);
  objc_storeStrong((id *)&self->_titleCell, 0);
  objc_storeStrong((id *)&self->_childBookmarks, 0);
  objc_storeStrong((id *)&self->_syntheticParentBookmarkFolder, 0);
  objc_storeStrong((id *)&self->_parentBookmark, 0);

  objc_storeStrong((id *)&self->_collection, 0);
}

@end