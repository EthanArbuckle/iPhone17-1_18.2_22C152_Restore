@interface HUMediaSourceListViewController
- (BOOL)shouldHideHeaderAboveSection:(int64_t)a3;
- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4;
- (BOOL)tableView:(id)a3 shouldHaveFullLengthBottomSeparatorForSection:(int64_t)a4;
- (Class)cellClassForItem:(id)a3 indexPath:(id)a4;
- (HUMediaSourceListDelegate)delegate;
- (MPPlaybackArchive)currentPlaybackSelection;
- (id)errorAlertControllerForResolveError:(id)a3;
- (id)initForMediaProfileContainers:(id)a3 forTarget:(unint64_t)a4;
- (void)dismissViewController;
- (void)mediaPickerDidCancel;
- (void)mediaPickerDidPickPlaybackArchive:(id)a3;
- (void)setCurrentPlaybackSelection:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation HUMediaSourceListViewController

- (id)initForMediaProfileContainers:(id)a3 forTarget:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [[HUMediaSourceListItemManager alloc] initForMediaProfileContainers:v6 delegate:self forTarget:a4];

  v21.receiver = self;
  v21.super_class = (Class)HUMediaSourceListViewController;
  v8 = [(HUItemTableViewController *)&v21 initWithItemManager:v7 tableViewStyle:0];
  if (v8)
  {
    v9 = HFLocalizedString();
    v10 = [(HUMediaSourceListViewController *)v8 navigationItem];
    [v10 setTitle:v9];

    id v11 = objc_alloc(MEMORY[0x1E4F427C0]);
    v12 = HFLocalizedString();
    v13 = (void *)[v11 initWithTitle:v12 style:0 target:v8 action:sel_dismissViewController];
    v14 = [(HUMediaSourceListViewController *)v8 navigationItem];
    [v14 setLeftBarButtonItem:v13];

    v15 = [(HUMediaSourceListViewController *)v8 tableView];
    [v15 setSectionHeaderTopPadding:0.0];

    v16 = [(HUMediaSourceListViewController *)v8 tableView];
    v17 = [v16 separatorColor];

    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", 0.0, 0.0, 0.0, 0.5);
    [v18 setBackgroundColor:v17];
    v19 = [(HUMediaSourceListViewController *)v8 tableView];
    [v19 setTableHeaderView:v18];
  }
  return v8;
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HUMediaSourceListViewController;
  [(HUItemTableViewController *)&v6 viewWillAppear:a3];
  v4 = [(HUMediaSourceListViewController *)self navigationController];
  v5 = [v4 navigationBar];
  [v5 setPrefersLargeTitles:1];
}

- (void)dismissViewController
{
  id v2 = [(HUMediaSourceListViewController *)self navigationController];
  [v2 dismissViewControllerAnimated:1 completion:0];
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  return (Class)objc_opt_class();
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v6 = a3;
  [v6 setIconDisplayStyle:1];
  v5 = [v6 contentMetrics];
  objc_msgSend(v5, "setIconSize:", 32.0, 32.0);

  [v6 setHideDescriptionIcon:1];
  [v6 setSeparatorInsetLinesUpWithText:1];
}

- (void)updateCell:(id)a3 forItem:(id)a4 indexPath:(id)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUMediaSourceListViewController;
  [(HUItemTableViewController *)&v11 updateCell:v10 forItem:a4 indexPath:a5 animated:v6];
  [v10 updateUIWithAnimation:v6];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v35.receiver = self;
  v35.super_class = (Class)HUMediaSourceListViewController;
  id v6 = a4;
  id v7 = a3;
  [(HUItemTableViewController *)&v35 tableView:v7 didSelectRowAtIndexPath:v6];
  objc_msgSend(v7, "deselectRowAtIndexPath:animated:", v6, 1, v35.receiver, v35.super_class);

  v8 = [(HUItemTableViewController *)self itemManager];
  v9 = [v8 displayedItemAtIndexPath:v6];

  objc_opt_class();
  id v10 = v9;
  if (objc_opt_isKindOfClass()) {
    objc_super v11 = v10;
  }
  else {
    objc_super v11 = 0;
  }
  id v12 = v11;

  if (v12)
  {
    if ([v12 success])
    {
      uint64_t v13 = [v12 pickerViewController];
      if (v13)
      {
        v14 = (void *)v13;
        [v12 setDelegate:self];
        if ([v12 continuousPicker])
        {
          v15 = [(HUMediaSourceListViewController *)self view];
          [v15 frame];
          double v17 = v16;
          double v19 = v18;
          double v21 = v20;
          double v23 = v22;
          v24 = [v14 view];
          objc_msgSend(v24, "setFrame:", v17, v19, v21, v23);

          v25 = [(HUMediaSourceListViewController *)self navigationController];
          [v25 pushViewController:v14 animated:1];

LABEL_24:
          goto LABEL_25;
        }
        [v14 setModalPresentationStyle:2];
        v31 = [(HUMediaSourceListViewController *)self view];
        [v31 frame];
        objc_msgSend(v14, "setPreferredContentSize:", v32, v33);

LABEL_18:
        [(HUMediaSourceListViewController *)self presentViewController:v14 animated:1 completion:0];
        goto LABEL_24;
      }
      v28 = HFLogForCategory();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v37 = v12;
        _os_log_impl(&dword_1BE345000, v28, OS_LOG_TYPE_DEFAULT, "Media source %@ resolved successfully, but no picker view controller", buf, 0xCu);
      }

      v29 = [v12 resolveError];
      v30 = [(HUMediaSourceListViewController *)self errorAlertControllerForResolveError:v29];

      if (v30)
      {
        [(HUMediaSourceListViewController *)self presentViewController:v30 animated:1 completion:0];
      }
      else
      {
        v34 = HFLogForCategory();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v37 = v12;
          _os_log_impl(&dword_1BE345000, v34, OS_LOG_TYPE_DEFAULT, "Media source %@ failed to resolve, but no alert view controller for the error", buf, 0xCu);
        }
      }
    }
    else
    {
      v26 = [v12 resolveError];
      v14 = [(HUMediaSourceListViewController *)self errorAlertControllerForResolveError:v26];

      if (v14) {
        goto LABEL_18;
      }
      v27 = HFLogForCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v37 = v12;
        _os_log_impl(&dword_1BE345000, v27, OS_LOG_TYPE_DEFAULT, "Media source %@ failed to resolve, but no alert view controller for the error", buf, 0xCu);
      }
    }
    v14 = 0;
    goto LABEL_24;
  }
LABEL_25:
}

- (BOOL)shouldHideHeaderAboveSection:(int64_t)a3
{
  return 1;
}

- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4
{
  return 1;
}

- (BOOL)tableView:(id)a3 shouldHaveFullLengthBottomSeparatorForSection:(int64_t)a4
{
  return 0;
}

- (id)errorAlertControllerForResolveError:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    v4 = HFLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v3;
      _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "Media source failed to resolve, show alert view controller for parameters %@", buf, 0xCu);
    }

    objc_opt_class();
    v5 = [v3 objectForKeyedSubscript:@"HUMediaPickerUnavailablePromptActionTitleKey"];
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
    uint64_t v7 = v6;

    uint64_t v8 = [v3 objectForKeyedSubscript:@"HUMediaPickerUnavailablePromptMessageKey"];
    if (!(v7 | v8))
    {
      uint64_t v7 = _HULocalizedStringWithDefaultValue(@"HUUnknownError", @"HUUnknownError", 1);
      uint64_t v8 = HFLocalizedString();
    }
    v9 = (void *)v8;
    id v10 = [MEMORY[0x1E4F42728] alertControllerWithTitle:v7 message:v8 preferredStyle:1];
    objc_super v11 = (void *)MEMORY[0x1E4F42720];
    id v12 = _HULocalizedStringWithDefaultValue(@"HUOkTitle", @"HUOkTitle", 1);
    uint64_t v13 = [v11 actionWithTitle:v12 style:0 handler:0];
    [v10 addAction:v13];

    objc_opt_class();
    v14 = [v3 objectForKeyedSubscript:@"HUMediaPickerUnavailablePromptActionTitleKey"];
    if (objc_opt_isKindOfClass()) {
      v15 = v14;
    }
    else {
      v15 = 0;
    }
    id v16 = v15;

    objc_opt_class();
    double v17 = [v3 objectForKeyedSubscript:@"HUMediaPickerUnavailablePromptActionURLKey"];
    if (objc_opt_isKindOfClass()) {
      double v18 = v17;
    }
    else {
      double v18 = 0;
    }
    id v19 = v18;

    if (v16 && v19)
    {
      double v20 = (void *)MEMORY[0x1E4F42720];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __71__HUMediaSourceListViewController_errorAlertControllerForResolveError___block_invoke;
      v23[3] = &unk_1E6385188;
      id v24 = v19;
      double v21 = [v20 actionWithTitle:v16 style:0 handler:v23];
      [v10 addAction:v21];
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

void __71__HUMediaSourceListViewController_errorAlertControllerForResolveError___block_invoke(uint64_t a1)
{
  id v3 = [MEMORY[0x1E4F69378] sharedInstance];
  id v2 = (id)[v3 openURL:*(void *)(a1 + 32)];
}

- (void)mediaPickerDidPickPlaybackArchive:(id)a3
{
  id v4 = a3;
  [(HUMediaSourceListViewController *)self presentedViewController];

  id v5 = [(HUMediaSourceListViewController *)self delegate];
  [v5 mediaPickerDidPickPlaybackArchive:v4];
}

- (void)mediaPickerDidCancel
{
  id v3 = [(HUMediaSourceListViewController *)self presentedViewController];

  if (v3)
  {
    id v4 = [(HUMediaSourceListViewController *)self presentedViewController];
    [v4 dismissViewControllerAnimated:1 completion:0];
  }
}

- (HUMediaSourceListDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUMediaSourceListDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MPPlaybackArchive)currentPlaybackSelection
{
  return (MPPlaybackArchive *)objc_getProperty(self, a2, 1160, 1);
}

- (void)setCurrentPlaybackSelection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentPlaybackSelection, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end