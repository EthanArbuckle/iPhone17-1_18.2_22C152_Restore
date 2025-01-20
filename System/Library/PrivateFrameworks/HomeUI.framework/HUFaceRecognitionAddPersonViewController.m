@interface HUFaceRecognitionAddPersonViewController
- (BOOL)shouldHideFooterBelowSection:(int64_t)a3;
- (BOOL)shouldHideHeaderAboveSection:(int64_t)a3;
- (Class)cellClassForItem:(id)a3 indexPath:(id)a4;
- (HUFaceRecognitionAddPersonItemManager)addPersonItemManager;
- (HUFaceRecognitionAddPersonViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4 searchBar:(id)a5 searchBarPosition:(unint64_t)a6;
- (HUFaceRecognitionAddPersonViewController)initWithSignificantEvent:(id)a3 home:(id)a4;
- (HUFaceRecognitionAddPersonViewControllerDelegate)delegate;
- (UIBarButtonItem)doneButton;
- (unint64_t)automaticDisablingReasonsForItem:(id)a3;
- (void)_donePressed:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateForSearch;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation HUFaceRecognitionAddPersonViewController

- (HUFaceRecognitionAddPersonViewController)initWithSignificantEvent:(id)a3 home:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 faceClassification];

  if (!v8) {
    NSLog(&cfstr_FaceClassifica.isa, v6);
  }
  v9 = [[HUFaceRecognitionAddPersonItemManager alloc] initWithSignificantEvent:v6 home:v7 delegate:0];

  addPersonItemManager = self->_addPersonItemManager;
  self->_addPersonItemManager = v9;

  v11 = objc_alloc_init(HUFaceRecognitionAddPersonSearchBar);
  v12 = self->_addPersonItemManager;
  v23.receiver = self;
  v23.super_class = (Class)HUFaceRecognitionAddPersonViewController;
  v13 = [(HUSearchableItemTableViewController *)&v23 initWithItemManager:v12 tableViewStyle:0 searchBar:v11 searchBarPosition:0];
  if (v13)
  {
    uint64_t v14 = [objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:0 target:v13 action:sel__donePressed_];
    doneButton = v13->_doneButton;
    v13->_doneButton = (UIBarButtonItem *)v14;

    v16 = _HULocalizedStringWithDefaultValue(@"HUFaceRecognitionAddPersonViewControllerTitle", @"HUFaceRecognitionAddPersonViewControllerTitle", 1);
    [(HUFaceRecognitionAddPersonViewController *)v13 setTitle:v16];

    v17 = [(HUFaceRecognitionAddPersonViewController *)v13 addPersonItemManager];
    v18 = [v17 faceCropImageFuture];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __74__HUFaceRecognitionAddPersonViewController_initWithSignificantEvent_home___block_invoke;
    v21[3] = &unk_1E63859A8;
    v22 = v11;
    id v19 = (id)[v18 addSuccessBlock:v21];
  }
  return v13;
}

void __74__HUFaceRecognitionAddPersonViewController_initWithSignificantEvent_home___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 faceCropView];
  [v4 setImage:v3];
}

- (HUFaceRecognitionAddPersonViewController)initWithItemManager:(id)a3 tableViewStyle:(int64_t)a4 searchBar:(id)a5 searchBarPosition:(unint64_t)a6
{
  v8 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5, a6);
  v9 = NSStringFromSelector(sel_initWithSignificantEvent_home_);
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUFaceRecognitionAddPersonViewController.m", 51, @"%s is unavailable; use %@ instead",
    "-[HUFaceRecognitionAddPersonViewController initWithItemManager:tableViewStyle:searchBar:searchBarPosition:]",
    v9);

  return 0;
}

- (void)updateForSearch
{
  v8.receiver = self;
  v8.super_class = (Class)HUFaceRecognitionAddPersonViewController;
  [(HUSearchableItemTableViewController *)&v8 updateForSearch];
  id v3 = [(HUSearchableItemTableViewController *)self searchBar];
  id v4 = [v3 searchTextField];
  v5 = [v4 text];
  BOOL v6 = [v5 length] != 0;
  id v7 = [(HUFaceRecognitionAddPersonViewController *)self doneButton];
  [v7 setEnabled:v6];
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v4 = [a3 latestResults];
  [v4 objectForKeyedSubscript:*MEMORY[0x1E4F68860]];

  v5 = objc_opt_class();

  return (Class)v5;
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v6 = a3;
  id v7 = (void *)MEMORY[0x1E4F42B58];
  id v8 = a4;
  v9 = [v7 cellConfiguration];
  v10 = [v8 latestResults];
  v11 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F68AB8]];
  [v9 setText:v11];

  v12 = [v8 latestResults];

  v13 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F68860]];
  [v9 setImage:v13];

  uint64_t v14 = [v9 imageProperties];
  objc_msgSend(v14, "setMaximumSize:", 44.0, 44.0);

  v15 = [v9 imageProperties];
  [v15 setCornerRadius:22.0];

  [v6 setContentConfiguration:v9];
  objc_opt_class();
  id v18 = v6;
  if (objc_opt_isKindOfClass()) {
    v16 = v18;
  }
  else {
    v16 = 0;
  }
  id v17 = v16;

  [v17 setAvatarSize:44.0];
  [v18 setAccessoryType:0];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)HUFaceRecognitionAddPersonViewController;
  [(HUItemTableViewController *)&v21 tableView:v6 didSelectRowAtIndexPath:v7];
  objc_opt_class();
  id v8 = [(HUItemTableViewController *)self itemManager];
  v9 = [v8 displayedItemAtIndexPath:v7];
  if (objc_opt_isKindOfClass()) {
    v10 = v9;
  }
  else {
    v10 = 0;
  }
  id v11 = v10;

  v12 = [v11 person];

  if (v12)
  {
    v13 = [(HUFaceRecognitionAddPersonViewController *)self addPersonItemManager];
    uint64_t v14 = [v13 associateFaceClassificationWithExistingPerson:v11];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __78__HUFaceRecognitionAddPersonViewController_tableView_didSelectRowAtIndexPath___block_invoke;
    v16[3] = &unk_1E63859D0;
    id v17 = v6;
    id v18 = v7;
    id v19 = self;
    id v20 = v11;
    id v15 = (id)[v14 addCompletionBlock:v16];
  }
}

void __78__HUFaceRecognitionAddPersonViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v11 = a3;
  if (v11)
  {
    id v4 = [MEMORY[0x1E4F69110] sharedHandler];
    [v4 handleError:v11];

    [*(id *)(a1 + 32) deselectRowAtIndexPath:*(void *)(a1 + 40) animated:1];
  }
  else
  {
    v5 = [*(id *)(a1 + 48) delegate];

    if (v5)
    {
      id v6 = [*(id *)(a1 + 48) delegate];
      [v6 addPersonViewControllerDidFinish:*(void *)(a1 + 48)];
    }
    id v7 = [*(id *)(a1 + 48) navigationController];
    id v8 = (id)[v7 popViewControllerAnimated:1];
  }
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  objc_msgSend(v9, "na_safeSetObject:forKey:", MEMORY[0x1E4F1CC28], *MEMORY[0x1E4F68288]);
  v10 = [*(id *)(a1 + 56) person];
  objc_msgSend(v9, "na_safeSetObject:forKey:", v10, *MEMORY[0x1E4F68290]);

  objc_msgSend(v9, "na_safeSetObject:forKey:", v11, *MEMORY[0x1E4F68190]);
  [MEMORY[0x1E4F68EE0] sendEvent:4 withData:v9];
}

- (unint64_t)automaticDisablingReasonsForItem:(id)a3
{
  return 1;
}

- (BOOL)shouldHideHeaderAboveSection:(int64_t)a3
{
  return 1;
}

- (BOOL)shouldHideFooterBelowSection:(int64_t)a3
{
  return 1;
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)HUFaceRecognitionAddPersonViewController;
  [(HUSearchableItemTableViewController *)&v8 viewDidLoad];
  [(HUTableViewController *)self setSectionContentInsetFollowsLayoutMargins:0];
  id v3 = [(HUFaceRecognitionAddPersonViewController *)self navigationController];
  id v4 = [v3 navigationBar];
  [v4 setTranslucent:0];

  v5 = [(HUFaceRecognitionAddPersonViewController *)self doneButton];
  id v6 = [(HUFaceRecognitionAddPersonViewController *)self navigationItem];
  [v6 setRightBarButtonItem:v5];

  id v7 = [(HUFaceRecognitionAddPersonViewController *)self doneButton];
  [v7 setEnabled:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HUFaceRecognitionAddPersonViewController;
  [(HUItemTableViewController *)&v6 viewDidAppear:a3];
  id v4 = [(HUSearchableItemTableViewController *)self searchBar];
  v5 = [v4 searchTextField];
  [v5 becomeFirstResponder];
}

- (void)_donePressed:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v24 = self;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@: Done pressed", buf, 0xCu);
  }

  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  objc_msgSend(v5, "na_safeSetObject:forKey:", MEMORY[0x1E4F1CC38], *MEMORY[0x1E4F68288]);
  objc_super v6 = [(HUFaceRecognitionAddPersonViewController *)self addPersonItemManager];
  id v7 = [v6 faceClassification];
  objc_super v8 = [v7 person];

  objc_msgSend(v5, "na_safeSetObject:forKey:", v8, *MEMORY[0x1E4F68290]);
  id v9 = [(HUSearchableItemTableViewController *)self searchBar];
  v10 = [v9 searchTextField];
  id v11 = [v10 text];

  v12 = [(HUFaceRecognitionAddPersonViewController *)self doneButton];
  [v12 setEnabled:0];

  v13 = [(HUFaceRecognitionAddPersonViewController *)self addPersonItemManager];
  uint64_t v14 = [v13 associateFaceClassificationWithNewPersonNamed:v11];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __57__HUFaceRecognitionAddPersonViewController__donePressed___block_invoke;
  v21[3] = &unk_1E63859F8;
  void v21[4] = self;
  id v15 = v5;
  id v22 = v15;
  v16 = [v14 addSuccessBlock:v21];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __57__HUFaceRecognitionAddPersonViewController__donePressed___block_invoke_2;
  v19[3] = &unk_1E6385A20;
  v19[4] = self;
  id v20 = v15;
  id v17 = v15;
  id v18 = (id)[v16 addFailureBlock:v19];
}

uint64_t __57__HUFaceRecognitionAddPersonViewController__donePressed___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) delegate];
    [v3 addPersonViewControllerDidFinish:*(void *)(a1 + 32)];
  }
  id v4 = [*(id *)(a1 + 32) navigationController];
  id v5 = (id)[v4 popViewControllerAnimated:1];

  objc_super v6 = (void *)MEMORY[0x1E4F68EE0];
  uint64_t v7 = *(void *)(a1 + 40);

  return [v6 sendEvent:4 withData:v7];
}

uint64_t __57__HUFaceRecognitionAddPersonViewController__donePressed___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 doneButton];
  [v5 setEnabled:1];

  objc_super v6 = [MEMORY[0x1E4F69110] sharedHandler];
  [v6 handleError:v4];

  objc_msgSend(*(id *)(a1 + 40), "na_safeSetObject:forKey:", v4, *MEMORY[0x1E4F68190]);
  uint64_t v7 = (void *)MEMORY[0x1E4F68EE0];
  uint64_t v8 = *(void *)(a1 + 40);

  return [v7 sendEvent:4 withData:v8];
}

- (HUFaceRecognitionAddPersonViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUFaceRecognitionAddPersonViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HUFaceRecognitionAddPersonItemManager)addPersonItemManager
{
  return self->_addPersonItemManager;
}

- (UIBarButtonItem)doneButton
{
  return self->_doneButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_addPersonItemManager, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end