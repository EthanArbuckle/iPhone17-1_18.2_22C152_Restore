@interface SLMicroBlogComposeViewController
+ (id)serviceBundle;
- (BOOL)_countMediaAttachmentsTowardCharacterCount;
- (BOOL)isContentValid;
- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (SLMicroBlogComposeViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (SLMicroBlogSheetDelegate)microBlogSheetDelegate;
- (id)_accountConfigurationItem;
- (id)_locationConfigurationItem;
- (id)_mentionsSearchString;
- (id)_placeViewController;
- (id)completeText:(id)a3 withAttachments:(id)a4;
- (id)configurationItems;
- (int)_charactersRemainingWithText:(id)a3;
- (int)characterCountForEnteredText:(id)a3 attachments:(id)a4;
- (int64_t)_characterCountForText:(id)a3;
- (void)_beginLoadingAccountProfileImages;
- (void)_dismissMentionsViewController;
- (void)_hostApplicationDidEnterBackground;
- (void)_hostApplicationWillEnterForeground;
- (void)_performLocationAction;
- (void)_presentAccountPickerController;
- (void)_presentMentionsViewControllerIfApplicableForSearchString:(id)a3;
- (void)_presentMentionsViewControllerWithSearchString:(id)a3;
- (void)_presentNoAccountsAlertIfNecessaryAndReady;
- (void)_presentPlaceViewController;
- (void)accountsViewController:(id)a3 didSelectAccountUserRecord:(id)a4;
- (void)applyMention:(id)a3;
- (void)didSelectPost;
- (void)loadView;
- (void)mentionsViewController:(id)a3 finishedWithResult:(id)a4;
- (void)noteLocationInfoChanged:(id)a3;
- (void)placeViewController:(id)a3 didSelectPlace:(id)a4;
- (void)placeViewController:(id)a3 willDisappear:(BOOL)a4;
- (void)presentationAnimationDidFinish;
- (void)setGeotagStatus:(int)a3;
- (void)setMicroBlogSheetDelegate:(id)a3;
- (void)textViewDidChange:(id)a3;
- (void)textViewDidChangeSelection:(id)a3;
- (void)updateGeotagStatus;
- (void)updateShortenedURLCost;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SLMicroBlogComposeViewController

- (void)loadView
{
  v4.receiver = self;
  v4.super_class = (Class)SLMicroBlogComposeViewController;
  [(SLComposeServiceViewController *)&v4 loadView];
  v3 = [(SLComposeServiceViewController *)self textView];
  [v3 setKeyboardType:9];
}

- (void)viewDidAppear:(BOOL)a3
{
  v13.receiver = self;
  v13.super_class = (Class)SLMicroBlogComposeViewController;
  [(SLComposeServiceViewController *)&v13 viewDidAppear:a3];
  [(SLMicroBlogComposeViewController *)self updateShortenedURLCost];
  objc_super v4 = [(SLMicroBlogComposeViewController *)self microBlogSheetDelegate];
  [v4 beginPotentialLocationUse];

  objc_initWeak(&location, self);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  v9 = __50__SLMicroBlogComposeViewController_viewDidAppear___block_invoke;
  v10 = &unk_1E6467AC0;
  objc_copyWeak(&v11, &location);
  v5 = (void *)MEMORY[0x1C876A6A0](&v7);
  v6 = [(SLMicroBlogComposeViewController *)self microBlogSheetDelegate];
  [v6 setLocationInformationChangedBlock:v5];

  [(SLMicroBlogComposeViewController *)self updateGeotagStatus];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __50__SLMicroBlogComposeViewController_viewDidAppear___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained noteLocationInfoChanged:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SLMicroBlogComposeViewController;
  [(SLComposeServiceViewController *)&v5 viewWillDisappear:a3];
  objc_super v4 = [(SLMicroBlogComposeViewController *)self microBlogSheetDelegate];
  [v4 endPotentialLocationUse];
}

- (void)_beginLoadingAccountProfileImages
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  objc_super v4 = self->_serviceAccountTypeIdentifier;
  _SLLog(v2, 7, @"MicroBlog for %@ – _beginLoadingAccountProfileImages");
  id WeakRetained = objc_loadWeakRetained((id *)&self->_microBlogSheetDelegate);
  objc_initWeak(&location, self->_accountViewController);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  objc_super v5 = self->_accountUserRecords;
  uint64_t v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16, v4);
  if (v6)
  {
    uint64_t v7 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v10 = [v9 profileImageCache];
        BOOL v11 = v10 == 0;

        if (v11)
        {
          objc_super v13 = objc_msgSend(v9, "screen_name");
          _SLLog(v2, 7, @"MicroBlog for %@ – fetching profile image for %@");

          v12 = objc_msgSend(v9, "screen_name", v4, v13);
          v15[0] = MEMORY[0x1E4F143A8];
          v15[1] = 3221225472;
          v15[2] = __69__SLMicroBlogComposeViewController__beginLoadingAccountProfileImages__block_invoke;
          v15[3] = &unk_1E6467B10;
          v16 = v4;
          v17 = v9;
          objc_copyWeak(&v18, &location);
          [WeakRetained fetchProfileImageDataForScreenName:v12 completion:v15];

          objc_destroyWeak(&v18);
        }
      }
      uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v6);
  }

  objc_destroyWeak(&location);
}

void __69__SLMicroBlogComposeViewController__beginLoadingAccountProfileImages__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = objc_msgSend(*(id *)(a1 + 40), "screen_name");
  v10 = (void *)v9;
  if (!v6 || v7)
  {
    _SLLog(v3, 7, @"MicroBlog for %@ – failed to get profile image data for %@ with error %{public}@");
  }
  else
  {
    uint64_t v13 = v9;
    _SLLog(v3, 7, @"MicroBlog for %@ – got profile image data for %@");

    BOOL v11 = objc_msgSend(MEMORY[0x1E4F42A80], "imageWithData:", v6, v8, v13);
    [*(id *)(a1 + 40) setProfileImageCache:v11];

    v12 = [*(id *)(a1 + 40) profileImageCache];
    v14 = objc_msgSend(*(id *)(a1 + 40), "screen_name");
    _SLLog(v3, 7, @"MicroBlog for %@ – built profile image %@ for %@");

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__SLMicroBlogComposeViewController__beginLoadingAccountProfileImages__block_invoke_2;
    block[3] = &unk_1E6467AE8;
    objc_copyWeak(&v16, (id *)(a1 + 48));
    block[4] = *(void *)(a1 + 40);
    dispatch_async(MEMORY[0x1E4F14428], block);
    objc_destroyWeak(&v16);
  }
}

void __69__SLMicroBlogComposeViewController__beginLoadingAccountProfileImages__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained didUpdateAccountUserRecord:*(void *)(a1 + 32)];
}

- (void)_presentAccountPickerController
{
  serviceAccountTypeIdentifier = self->_serviceAccountTypeIdentifier;
  _SLLog(v2, 7, @"MicroBlog for %@ – _presentAccountPickerController");
  objc_super v4 = objc_alloc_init(SLMicroBlogAccountsTableViewController);
  accountViewController = self->_accountViewController;
  self->_accountViewController = v4;

  -[SLMicroBlogAccountsTableViewController setSelectionDelegate:](self->_accountViewController, "setSelectionDelegate:", self, serviceAccountTypeIdentifier);
  [(SLMicroBlogComposeViewController *)self _beginLoadingAccountProfileImages];
  [(SLMicroBlogAccountsTableViewController *)self->_accountViewController setAccountUserRecords:self->_accountUserRecords];
  [(SLMicroBlogAccountsTableViewController *)self->_accountViewController setCurrentAccountUserRecord:self->_selectedAccountUserRecord];
  id v6 = self->_accountViewController;

  [(SLComposeServiceViewController *)self pushConfigurationViewController:v6];
}

- (void)accountsViewController:(id)a3 didSelectAccountUserRecord:(id)a4
{
  id v6 = (SLMicroBlogUserRecord *)a4;
  serviceAccountTypeIdentifier = self->_serviceAccountTypeIdentifier;
  _SLLog(v4, 7, @"MicroBlog for %@ – didSelectAccountUserRecord %@");
  selectedAccountUserRecord = self->_selectedAccountUserRecord;
  self->_selectedAccountUserRecord = v6;
  uint64_t v8 = v6;

  uint64_t v9 = [(SLMicroBlogUserRecord *)self->_selectedAccountUserRecord screen_name];
  [(SLComposeSheetConfigurationItem *)self->_accountConfigurationItem setValue:v9];

  id v12 = [(NSArray *)self->_accountIdentifiers objectAtIndex:[(NSArray *)self->_accountUserRecords indexOfObject:v8]];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_microBlogSheetDelegate);
  [WeakRetained setActiveAccountIdentifier:v12];
  [(SLComposeServiceViewController *)self popConfigurationViewController];
}

- (id)_accountConfigurationItem
{
  accountUserRecords = self->_accountUserRecords;
  if (accountUserRecords)
  {
    uint64_t v5 = [(NSArray *)accountUserRecords count];
    _SLLog(v2, 7, @"MicroBlog for %@ – got countOfAccounts %d from _accountUserRecords");
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F179C8] countOfAccountsWithAccountTypeIdentifier:self->_serviceAccountTypeIdentifier];
    serviceAccountTypeIdentifier = self->_serviceAccountTypeIdentifier;
    _SLLog(v2, 7, @"MicroBlog for %@ – got countOfAccounts %d from account store cache");
    if (v5 == -1)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F179C8]);
      objc_msgSend(v6, "updateExistenceCacheOfAccountWithTypeIdentifier:", self->_serviceAccountTypeIdentifier, serviceAccountTypeIdentifier, -1);
      id v7 = [v6 accountTypeWithAccountTypeIdentifier:self->_serviceAccountTypeIdentifier];
      uint64_t v8 = [v6 accountsWithAccountType:v7];
      uint64_t v5 = [v8 count];

      _SLLog(v2, 7, @"MicroBlog for %@ – got countOfAccounts %d from account store");
    }
  }
  accountConfigurationItem = self->_accountConfigurationItem;
  if (v5 < 2)
  {
    self->_accountConfigurationItem = 0;
  }
  else if (!accountConfigurationItem)
  {
    objc_initWeak(&location, self);
    v10 = objc_alloc_init(SLComposeSheetConfigurationItem);
    BOOL v11 = self->_accountConfigurationItem;
    self->_accountConfigurationItem = v10;

    id v12 = SLSocialFrameworkBundle();
    uint64_t v13 = [v12 localizedStringForKey:@"ACCOUNT_LABEL_TITLE" value:&stru_1F1E28690 table:@"Localizable"];
    [(SLComposeSheetConfigurationItem *)self->_accountConfigurationItem setTitle:v13];

    [(SLComposeSheetConfigurationItem *)self->_accountConfigurationItem setValue:&stru_1F1E28690];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __61__SLMicroBlogComposeViewController__accountConfigurationItem__block_invoke;
    v18[3] = &unk_1E6467720;
    objc_copyWeak(&v19, &location);
    [(SLComposeSheetConfigurationItem *)self->_accountConfigurationItem setTapHandler:v18];
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  if (self->_accountConfigurationItem)
  {
    v14 = [(SLMicroBlogUserRecord *)self->_selectedAccountUserRecord screen_name];
    [(SLComposeSheetConfigurationItem *)self->_accountConfigurationItem setValue:v14];

    v15 = self->_accountConfigurationItem;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

void __61__SLMicroBlogComposeViewController__accountConfigurationItem__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _presentAccountPickerController];
}

- (void)_performLocationAction
{
  if (self->_currentPlace)
  {
    [(SLMicroBlogComposeViewController *)self _presentPlaceViewController];
  }
  else
  {
    uint64_t v3 = [(SLMicroBlogComposeViewController *)self microBlogSheetDelegate];
    [v3 setGeotagStatus:1];

    [(SLMicroBlogComposeViewController *)self setGeotagStatus:1];
  }
}

- (id)_locationConfigurationItem
{
  locationConfigurationItem = self->_locationConfigurationItem;
  if (!locationConfigurationItem)
  {
    objc_initWeak(&location, self);
    uint64_t v4 = objc_alloc_init(SLComposeSheetConfigurationItem);
    uint64_t v5 = self->_locationConfigurationItem;
    self->_locationConfigurationItem = v4;

    id v6 = SLSocialFrameworkBundle();
    id v7 = [v6 localizedStringForKey:@"SHEET_LOCATION_ACTION_TITLE" value:&stru_1F1E28690 table:@"Localizable"];
    [(SLComposeSheetConfigurationItem *)self->_locationConfigurationItem setTitle:v7];

    uint64_t v8 = SLSocialFrameworkBundle();
    uint64_t v9 = [v8 localizedStringForKey:@"SHEET_LOCATION_NO_VALUE" value:&stru_1F1E28690 table:@"Localizable"];
    [(SLComposeSheetConfigurationItem *)self->_locationConfigurationItem setValue:v9];

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __62__SLMicroBlogComposeViewController__locationConfigurationItem__block_invoke;
    v11[3] = &unk_1E6467720;
    objc_copyWeak(&v12, &location);
    [(SLComposeSheetConfigurationItem *)self->_locationConfigurationItem setTapHandler:v11];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
    locationConfigurationItem = self->_locationConfigurationItem;
  }

  return locationConfigurationItem;
}

void __62__SLMicroBlogComposeViewController__locationConfigurationItem__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _performLocationAction];
}

- (id)configurationItems
{
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = [(SLMicroBlogComposeViewController *)self _accountConfigurationItem];
  if (v4) {
    [v3 addObject:v4];
  }
  uint64_t v5 = [(SLMicroBlogComposeViewController *)self _locationConfigurationItem];
  if (self->_locationConfigurationItem) {
    [v3 addObject:v5];
  }

  return v3;
}

- (SLMicroBlogSheetDelegate)microBlogSheetDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_microBlogSheetDelegate);

  return (SLMicroBlogSheetDelegate *)WeakRetained;
}

- (void)setMicroBlogSheetDelegate:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_microBlogSheetDelegate);

  if (WeakRetained != v4)
  {
    objc_storeWeak((id *)&self->_microBlogSheetDelegate, v4);
    id v6 = [v4 serviceAccountTypeIdentifier];
    serviceAccountTypeIdentifier = self->_serviceAccountTypeIdentifier;
    self->_serviceAccountTypeIdentifier = v6;

    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __62__SLMicroBlogComposeViewController_setMicroBlogSheetDelegate___block_invoke;
    v8[3] = &unk_1E6467B60;
    id v9 = v4;
    v10 = self;
    [v9 fetchSessionInfo:v8];
  }
}

void __62__SLMicroBlogComposeViewController_setMicroBlogSheetDelegate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__SLMicroBlogComposeViewController_setMicroBlogSheetDelegate___block_invoke_2;
  v10[3] = &unk_1E6467B38;
  id v11 = *(id *)(a1 + 32);
  id v12 = v5;
  uint64_t v7 = *(void *)(a1 + 40);
  id v13 = v6;
  uint64_t v14 = v7;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v10);
}

void __62__SLMicroBlogComposeViewController_setMicroBlogSheetDelegate___block_invoke_2(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [*(id *)(a1 + 32) serviceAccountTypeIdentifier];
  uint64_t v26 = *(void *)(a1 + 40);
  uint64_t v27 = *(void *)(a1 + 48);
  _SLLog(v1, 7, @"MicroBlog for %@ – fetched session info %@\nand got error %{public}@");

  id v4 = objc_msgSend(*(id *)(a1 + 40), "objectForKey:", @"accountEntries", v3, v26, v27);
  uint64_t v5 = *(void *)(a1 + 56);
  id v6 = *(void **)(v5 + 1208);
  uint64_t v7 = MEMORY[0x1E4F1CBF0];
  *(void *)(v5 + 1208) = MEMORY[0x1E4F1CBF0];

  uint64_t v8 = *(void *)(a1 + 56);
  id v9 = *(void **)(v8 + 1216);
  *(void *)(v8 + 1216) = v7;

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v4;
  uint64_t v10 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v30 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        v15 = *(void **)(*(void *)(a1 + 56) + 1216);
        id v16 = [v14 objectForKeyedSubscript:@"identifier"];
        uint64_t v17 = [v15 arrayByAddingObject:v16];
        uint64_t v18 = *(void *)(a1 + 56);
        id v19 = *(void **)(v18 + 1216);
        *(void *)(v18 + 1216) = v17;

        long long v20 = objc_alloc_init(SLMicroBlogUserRecord);
        long long v21 = [v14 objectForKeyedSubscript:@"accountDescription"];
        [(SLMicroBlogUserRecord *)v20 setScreen_name:v21];

        uint64_t v22 = [*(id *)(*(void *)(a1 + 56) + 1208) arrayByAddingObject:v20];
        uint64_t v23 = *(void *)(a1 + 56);
        v24 = *(void **)(v23 + 1208);
        *(void *)(v23 + 1208) = v22;

        uint64_t v25 = [v14 objectForKeyedSubscript:@"active"];
        LODWORD(v21) = [v25 BOOLValue];

        if (v21) {
          objc_storeStrong((id *)(*(void *)(a1 + 56) + 1224), v20);
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v11);
  }

  [*(id *)(a1 + 56) reloadConfigurationItems];
  [*(id *)(a1 + 56) _presentNoAccountsAlertIfNecessaryAndReady];
}

- (void)presentationAnimationDidFinish
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_microBlogSheetDelegate);
  [WeakRetained stopDeferringExpensiveOperations];
  [(SLMicroBlogComposeViewController *)self _presentNoAccountsAlertIfNecessaryAndReady];
  if (objc_opt_respondsToSelector()) {
    [WeakRetained ensureUserRecordStore];
  }
}

- (void)_presentNoAccountsAlertIfNecessaryAndReady
{
  if ([(SLComposeServiceViewController *)self wasPresented])
  {
    accountUserRecords = self->_accountUserRecords;
    if (accountUserRecords)
    {
      if (![(NSArray *)accountUserRecords count])
      {
        _SLLog(v2, 7, @"MicroBlog for %@ – presenting no accounts alert");
        [(SLMicroBlogComposeViewController *)self presentNoAccountsAlert];
      }
    }
  }
}

- (SLMicroBlogComposeViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SLMicroBlogComposeViewController;
  id v4 = [(SLComposeServiceViewController *)&v7 initWithNibName:a3 bundle:a4];
  uint64_t v5 = v4;
  if (v4)
  {
    v4->_shortenedURLCost = 22;
    v4->_maxURLLength = -1;
    [(SLComposeServiceViewController *)v4 setMaxImageAttachmentSize:307200];
  }
  return v5;
}

- (void)_hostApplicationWillEnterForeground
{
  _SLLog(v2, 7, @"SLMicroBlogComposeViewController _hostApplicationWillEnterForeground");
  v5.receiver = self;
  v5.super_class = (Class)SLMicroBlogComposeViewController;
  [(SLMicroBlogComposeViewController *)&v5 _hostApplicationWillEnterForeground];
  id v4 = [(SLMicroBlogComposeViewController *)self microBlogSheetDelegate];
  [v4 beginPotentialLocationUse];
}

- (void)_hostApplicationDidEnterBackground
{
  _SLLog(v2, 7, @"SLMicroBlogComposeViewController _hostApplicationDidEnterBackground");
  v5.receiver = self;
  v5.super_class = (Class)SLMicroBlogComposeViewController;
  [(SLMicroBlogComposeViewController *)&v5 _hostApplicationDidEnterBackground];
  id v4 = [(SLMicroBlogComposeViewController *)self microBlogSheetDelegate];
  [v4 endPotentialLocationUse];
}

- (int)_charactersRemainingWithText:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(SLComposeServiceViewController *)self attachments];
  LODWORD(self) = [(SLMicroBlogComposeViewController *)self characterCountForEnteredText:v4 attachments:v5];

  return 140 - self;
}

- (BOOL)isContentValid
{
  uint64_t v3 = self;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (self->_maxURLLength == -1)
  {
    char v15 = 1;
  }
  else
  {
    int64_t maxURLLength = self->_maxURLLength;
    _SLLog(v2, 7, @"_maxURLLength is %i");
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v4 = v3;
    id obj = [(SLComposeServiceViewController *)v3 attachments];
    uint64_t v5 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v29;
      char v8 = 1;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v29 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          if ([v10 type] == 4
            || [v10 type] == 5
            || [v10 type] == 6
            || [v10 type] == 7)
          {
            uint64_t v11 = [v10 payload];
            uint64_t v12 = [v11 absoluteString];
            unint64_t v13 = [v12 length];
            unint64_t v14 = v4->_maxURLLength;

            if (v13 > v14) {
              char v8 = 0;
            }
          }
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v6);
    }
    else
    {
      char v8 = 1;
    }

    char v15 = v8 & 1;
    uint64_t v3 = v4;
  }
  id v16 = [(SLComposeServiceViewController *)v3 textView];
  uint64_t v17 = [v16 text];
  if ([v17 length])
  {
  }
  else
  {
    uint64_t v18 = [(SLComposeServiceViewController *)v3 attachments];
    uint64_t v19 = [v18 count];

    if (!v19) {
      char v15 = 0;
    }
  }
  long long v20 = [(SLComposeServiceViewController *)v3 textView];
  long long v21 = [v20 text];
  uint64_t v22 = [(SLMicroBlogComposeViewController *)v3 _charactersRemainingWithText:v21];

  if ((int)v22 >= 0) {
    BOOL v23 = v15;
  }
  else {
    BOOL v23 = 0;
  }
  v24 = [NSNumber numberWithInt:v22];
  [(SLComposeServiceViewController *)v3 setCharactersRemaining:v24];

  return v23;
}

- (id)completeText:(id)a3 withAttachments:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = (id)[a3 mutableCopy];
  if (!v6) {
    id v6 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v12, "type", (void)v16) == 4
          || [v12 type] == 5
          || [v12 type] == 6
          || [v12 type] == 7)
        {
          if ([v6 length]) {
            [v6 appendString:@" "];
          }
          unint64_t v13 = [v12 payload];
          unint64_t v14 = [v13 absoluteString];
          [v6 appendString:v14];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  return v6;
}

- (int64_t)_characterCountForText:(id)a3
{
  id v4 = a3;
  id v5 = [(SLMicroBlogComposeViewController *)self microBlogSheetDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(SLMicroBlogComposeViewController *)self microBlogSheetDelegate];
    int64_t v8 = [v7 characterCountForText:v4 shortenedURLCost:self->_shortenedURLCost];
  }
  else
  {
    int64_t v8 = 0;
  }

  return v8;
}

- (BOOL)_countMediaAttachmentsTowardCharacterCount
{
  uint64_t v3 = [(SLMicroBlogComposeViewController *)self microBlogSheetDelegate];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 1;
  }
  id v5 = [(SLMicroBlogComposeViewController *)self microBlogSheetDelegate];
  char v6 = [v5 countMediaAttachmentsTowardCharacterCount];

  return v6;
}

- (int)characterCountForEnteredText:(id)a3 attachments:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [(SLMicroBlogComposeViewController *)self completeText:a3 withAttachments:v6];
  int v8 = [(SLMicroBlogComposeViewController *)self _characterCountForText:v7];
  if ([(SLMicroBlogComposeViewController *)self _countMediaAttachmentsTowardCharacterCount])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          if ((objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "type", (void)v15) & 0xFFFFFFFFFFFFFFFCLL) != 4) {
            v8 += LODWORD(self->_shortenedURLCost) + 1;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v11);
    }
  }
  return v8;
}

- (void)updateShortenedURLCost
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__SLMicroBlogComposeViewController_updateShortenedURLCost__block_invoke;
  v5[3] = &unk_1E6467BB0;
  v5[4] = self;
  uint64_t v3 = (void *)MEMORY[0x1C876A6A0](v5, a2);
  char v4 = [(SLMicroBlogComposeViewController *)self microBlogSheetDelegate];
  [v4 fetchCurrentUrlLimits:v3];
}

void __58__SLMicroBlogComposeViewController_updateShortenedURLCost__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __58__SLMicroBlogComposeViewController_updateShortenedURLCost__block_invoke_2;
  v10[3] = &unk_1E6467B88;
  uint64_t v13 = a2;
  uint64_t v14 = a3;
  uint64_t v8 = *(void *)(a1 + 32);
  id v11 = v7;
  uint64_t v12 = v8;
  id v9 = v7;
  dispatch_async(MEMORY[0x1E4F14428], v10);
}

uint64_t __58__SLMicroBlogComposeViewController_updateShortenedURLCost__block_invoke_2(void *a1)
{
  _SLLog(v1, 7, @"updateShortenedURLCost got tcoLength %d maxURLLength %d error %{public}@");
  if (!a1[4])
  {
    *(void *)(a1[5] + 1272) = a1[6];
    *(void *)(a1[5] + 1280) = a1[7];
  }
  uint64_t v3 = (void *)a1[5];

  return [v3 validateContent];
}

- (void)_presentPlaceViewController
{
  if (!self->_isPresentingPlaces)
  {
    uint64_t v3 = [(SLMicroBlogComposeViewController *)self _placeViewController];
    [(SLComposeServiceViewController *)self pushConfigurationViewController:v3];

    self->_isPresentingPlaces = 1;
  }
}

- (void)updateGeotagStatus
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__SLMicroBlogComposeViewController_updateGeotagStatus__block_invoke;
  v5[3] = &unk_1E6467C00;
  v5[4] = self;
  uint64_t v3 = (void *)MEMORY[0x1C876A6A0](v5, a2);
  char v4 = [(SLMicroBlogComposeViewController *)self microBlogSheetDelegate];
  [v4 fetchGeotagStatus:v3];
}

void __54__SLMicroBlogComposeViewController_updateGeotagStatus__block_invoke(uint64_t a1, int a2)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __54__SLMicroBlogComposeViewController_updateGeotagStatus__block_invoke_2;
  v2[3] = &unk_1E6467BD8;
  int v3 = a2;
  v2[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], v2);
}

uint64_t __54__SLMicroBlogComposeViewController_updateGeotagStatus__block_invoke_2(uint64_t a1)
{
  _SLLog(v1, 6, @"Geotag status updated to %i");
  int v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(unsigned int *)(a1 + 40);

  return [v3 setGeotagStatus:v4];
}

- (id)_placeViewController
{
  placeViewController = self->_placeViewController;
  if (!placeViewController)
  {
    uint64_t v4 = [SLSheetPlaceViewController alloc];
    id v5 = [(id)objc_opt_class() serviceBundle];
    id v6 = [(SLSheetPlaceViewController *)v4 initWithPlaceDataSource:0 effectiveBundle:v5];
    id v7 = self->_placeViewController;
    self->_placeViewController = v6;

    [(SLSheetPlaceViewController *)self->_placeViewController setSelectionDelegate:self];
    [(SLSheetPlaceViewController *)self->_placeViewController setSearchEnabled:0];
    placeViewController = self->_placeViewController;
  }

  return placeViewController;
}

- (void)placeViewController:(id)a3 didSelectPlace:(id)a4
{
}

- (void)placeViewController:(id)a3 willDisappear:(BOOL)a4
{
  if (self->_currentPlace)
  {
    id v5 = [(SLMicroBlogComposeViewController *)self _locationConfigurationItem];
    [v5 setValuePending:0];

    id v6 = [(SLMicroBlogComposeViewController *)self _locationConfigurationItem];
    id v7 = [(SLPlace *)self->_currentPlace name];
    [v6 setValue:v7];
  }
  else
  {
    uint64_t v8 = [(SLMicroBlogComposeViewController *)self microBlogSheetDelegate];
    [v8 setGeotagStatus:0];

    [(SLMicroBlogComposeViewController *)self updateGeotagStatus];
  }
  self->_isPresentingPlaces = 0;
}

- (void)setGeotagStatus:(int)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 0:
      id v5 = [(SLMicroBlogComposeViewController *)self _locationConfigurationItem];
      id v6 = SLSocialFrameworkBundle();
      id v7 = v6;
      uint64_t v8 = @"SHEET_LOCATION_NO_VALUE";
      goto LABEL_7;
    case 1:
      id v9 = [(SLMicroBlogComposeViewController *)self _locationConfigurationItem];
      uint64_t v10 = SLSocialFrameworkBundle();
      id v11 = [v10 localizedStringForKey:@"LOCATING" value:&stru_1F1E28690 table:@"Localizable"];
      [v9 setValue:v11];

      uint64_t v12 = [(SLMicroBlogComposeViewController *)self _locationConfigurationItem];
      id v17 = v12;
      uint64_t v13 = 1;
      goto LABEL_8;
    case 2:
      if (self->_currentPlace)
      {
        uint64_t v14 = [(SLMicroBlogComposeViewController *)self _placeViewController];
        v18[0] = self->_currentPlace;
        long long v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
        [v14 setPlaces:v15];

        [v14 setSelectedPlace:self->_currentPlace];
        [(SLMicroBlogComposeViewController *)self _presentPlaceViewController];
      }
      else
      {
        _SLLog(v3, 3, @"We have SLGeotagStatusYes but no place to display. That's wrong.");
      }
      return;
    case 3:
      id v5 = [(SLMicroBlogComposeViewController *)self _locationConfigurationItem];
      id v6 = SLSocialFrameworkBundle();
      id v7 = v6;
      uint64_t v8 = @"SHEET_LOCATION_ACTION_DISALLOWED_VALUE";
LABEL_7:
      long long v16 = [v6 localizedStringForKey:v8 value:&stru_1F1E28690 table:@"Localizable"];
      [v5 setValue:v16];

      uint64_t v12 = [(SLMicroBlogComposeViewController *)self _locationConfigurationItem];
      id v17 = v12;
      uint64_t v13 = 0;
LABEL_8:
      [v12 setValuePending:v13];

      break;
    default:
      return;
  }
}

- (void)noteLocationInfoChanged:(id)a3
{
  id v15 = a3;
  _SLLog(v3, 6, @"noteLocationInfoChanged:%@");
  id v5 = objc_msgSend(v15, "objectForKeyedSubscript:", @"locationGeoString", v15);

  if (v5)
  {
    id v6 = objc_alloc_init(SLPlace);
    currentPlace = self->_currentPlace;
    self->_currentPlace = v6;

    uint64_t v8 = [v15 objectForKeyedSubscript:@"locationGeoString"];
    [(SLPlace *)self->_currentPlace setName:v8];

    [(SLPlace *)self->_currentPlace setIdentifier:@"currentPlaceIdentifier"];
    uint64_t v9 = [v15 objectForKeyedSubscript:@"latitude"];
    if (v9
      && (uint64_t v10 = (void *)v9,
          [v15 objectForKeyedSubscript:@"longitude"],
          id v11 = objc_claimAutoreleasedReturnValue(),
          v11,
          v10,
          v11))
    {
      uint64_t v12 = [v15 objectForKeyedSubscript:@"latitude"];
      [v12 doubleValue];
      -[SLPlace setLatitude:](self->_currentPlace, "setLatitude:");

      uint64_t v13 = [v15 objectForKeyedSubscript:@"longitude"];
      [v13 doubleValue];
      -[SLPlace setLongitude:](self->_currentPlace, "setLongitude:");
    }
    else
    {
      [(SLPlace *)self->_currentPlace setLatitude:-180.0];
      [(SLPlace *)self->_currentPlace setLongitude:-180.0];
    }
  }
  uint64_t v14 = [v15 objectForKey:@"geotagStatus"];
  -[SLMicroBlogComposeViewController setGeotagStatus:](self, "setGeotagStatus:", [v14 intValue]);
}

- (void)_presentMentionsViewControllerWithSearchString:(id)a3
{
  id v5 = a3;
  _SLLog(v3, 7, @"_presentMentionsViewController");
  id v6 = [SLMicroBlogMentionsViewController alloc];
  id v7 = [(SLMicroBlogComposeViewController *)self microBlogSheetDelegate];
  uint64_t v8 = [(SLMicroBlogMentionsViewController *)v6 initWithSheetDelegate:v7];
  mentionsViewController = self->_mentionsViewController;
  self->_mentionsViewController = v8;

  [(SLMicroBlogMentionsViewController *)self->_mentionsViewController setDelegate:self];
  [(SLMicroBlogMentionsViewController *)self->_mentionsViewController setSearchString:v5];

  uint64_t v10 = self->_mentionsViewController;

  [(SLComposeServiceViewController *)self setAutoCompletionViewController:v10];
}

- (void)_presentMentionsViewControllerIfApplicableForSearchString:(id)a3
{
  id v4 = a3;
  id v5 = [(SLMicroBlogComposeViewController *)self microBlogSheetDelegate];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __94__SLMicroBlogComposeViewController__presentMentionsViewControllerIfApplicableForSearchString___block_invoke;
  v7[3] = &unk_1E6467C50;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 recordsMatchingPrefixString:v6 completion:v7];
}

uint64_t __94__SLMicroBlogComposeViewController__presentMentionsViewControllerIfApplicableForSearchString___block_invoke(uint64_t a1, void *a2)
{
  if ([a2 count])
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __94__SLMicroBlogComposeViewController__presentMentionsViewControllerIfApplicableForSearchString___block_invoke_2;
    v5[3] = &unk_1E6467C28;
    uint64_t v3 = *(void **)(a1 + 40);
    v5[4] = *(void *)(a1 + 32);
    id v6 = v3;
    dispatch_async(MEMORY[0x1E4F14428], v5);
  }
  return 0;
}

void __94__SLMicroBlogComposeViewController__presentMentionsViewControllerIfApplicableForSearchString___block_invoke_2(uint64_t a1)
{
  uint64_t v3 = [*(id *)(a1 + 32) _mentionsSearchString];
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 1184);
  id v7 = (id)v3;
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = v3;
  _SLLog(v1, 7, @"Mentions got initial recordsMatchingPrefixString: '%@' response. latestMentionsString '%@' _mentionsViewController %@");
  if (!*(void *)(*(void *)(a1 + 32) + 1184))
  {
    if (objc_msgSend(v7, "length", v4, v5, v6))
    {
      [*(id *)(a1 + 32) _presentMentionsViewControllerWithSearchString:*(void *)(a1 + 40)];
      if (([v7 isEqualToString:*(void *)(a1 + 40)] & 1) == 0) {
        [*(id *)(*(void *)(a1 + 32) + 1184) setSearchString:v7];
      }
    }
  }
}

- (void)_dismissMentionsViewController
{
  mentionsViewController = self->_mentionsViewController;
  self->_mentionsViewController = 0;

  [(SLComposeServiceViewController *)self setAutoCompletionViewController:0];
}

- (void)mentionsViewController:(id)a3 finishedWithResult:(id)a4
{
  if (a4) {
    [(SLMicroBlogComposeViewController *)self applyMention:a4];
  }

  [(SLMicroBlogComposeViewController *)self _dismissMentionsViewController];
}

- (void)applyMention:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SLComposeServiceViewController *)self textView];
  uint64_t v6 = [v5 selectedRange];
  uint64_t v8 = v7;

  uint64_t v9 = [(SLComposeServiceViewController *)self textView];
  uint64_t v10 = [v9 text];

  unint64_t mentionStartLocation = self->_mentionStartLocation;
  objc_msgSend(v10, "stringByReplacingCharactersInRange:withString:", mentionStartLocation, v6 + v8 - mentionStartLocation, v4);
  id v16 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v12 = [v4 length];
  unint64_t v13 = v12 + mentionStartLocation;
  uint64_t v14 = [(SLComposeServiceViewController *)self textView];
  [v14 setText:v16];

  id v15 = [(SLComposeServiceViewController *)self textView];
  objc_msgSend(v15, "setSelectedRange:", v13, 0);

  [(SLComposeServiceViewController *)self validateContent];
}

- (id)_mentionsSearchString
{
  uint64_t v3 = [(SLComposeServiceViewController *)self textView];
  unint64_t v4 = [v3 selectedRange];
  uint64_t v6 = v5;

  unint64_t mentionStartLocation = self->_mentionStartLocation;
  if (v4 >= mentionStartLocation)
  {
    unint64_t v9 = v6 + v4 - mentionStartLocation;
    uint64_t v10 = [(SLComposeServiceViewController *)self textView];
    id v11 = [v10 text];
    objc_msgSend(v11, "substringWithRange:", mentionStartLocation, v9);
    uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v8 = &stru_1F1E28690;
  }

  return v8;
}

- (void)didSelectPost
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v24.receiver = self;
  v24.super_class = (Class)SLMicroBlogComposeViewController;
  [(SLComposeServiceViewController *)&v24 didSelectPost];
  unint64_t v4 = objc_alloc_init(SLMicroBlogStatus);
  uint64_t v5 = [(SLComposeServiceViewController *)self textView];
  uint64_t v6 = [v5 text];
  uint64_t v7 = [(SLComposeServiceViewController *)self attachments];
  uint64_t v8 = [(SLMicroBlogComposeViewController *)self completeText:v6 withAttachments:v7];
  [(SLMicroBlogStatus *)v4 setStatusText:v8];

  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v11 = [(SLComposeServiceViewController *)self attachments];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ([v16 type])
        {
          if ([v16 type] != 2) {
            continue;
          }
          id v17 = [v16 payload];
          if (v17)
          {
            long long v18 = v10;
LABEL_12:
            [v18 addObject:v17];
          }
        }
        else
        {
          id v17 = [v16 payload];
          if (v17)
          {
            long long v18 = v9;
            goto LABEL_12;
          }
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v13);
  }

  [(SLMicroBlogStatus *)v4 setImageData:v9];
  [(SLMicroBlogStatus *)v4 setImageAssetURLs:v10];
  long long v19 = [(SLMicroBlogComposeViewController *)self microBlogSheetDelegate];
  [v19 sendStatus:v4 completion:&__block_literal_global_3];

  if (![(SLMicroBlogComposeViewController *)self _hostProcessIdentifier])
  {
    _SLLog(v2, 6, @"hostPid is 0 - obtaining pid of current process instead");
    getpid();
  }
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v10 = a3;
  id v11 = a5;
  long long v19 = [v10 markedTextRange];
  NSUInteger v18 = length;
  _SLLog(v5, 7, @"SLMicroBlogComposeViewController textView:shouldChangeInRange: %d %d replacementText: %@ (markedTextRange %@)");

  if (!self->_mentionsViewController)
  {
    BOOL v13 = 0;
    if (location)
    {
      if (location != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v12 = objc_msgSend(v10, "markedTextRange", location, v18, v11, v19);
        BOOL v13 = v12 == 0;
      }
      if (location != 0x7FFFFFFFFFFFFFFFLL) {
    }
      }
    if (v13)
    {
      uint64_t v14 = [v10 text];
      if (location - 1 < [v14 length])
      {
        id v15 = objc_msgSend(v14, "substringWithRange:", location - 1, 1);
        if ([v15 isEqualToString:@"@"] && objc_msgSend(v11, "length"))
        {
          id v16 = [MEMORY[0x1E4F28B88] alphanumericCharacterSet];
          if (objc_msgSend(v16, "characterIsMember:", objc_msgSend(v11, "characterAtIndex:", 0)))
          {
            self->_unint64_t mentionStartLocation = location;
            self->_mentionPendingStart = 1;
            _SLLog(v5, 7, @"SLMicroBlogComposeViewController setting _mentionPendingStart to YES");
          }
        }
      }
    }
  }

  return 1;
}

- (void)textViewDidChange:(id)a3
{
  mentionsViewController = self->_mentionsViewController;
  BOOL mentionPendingStart = self->_mentionPendingStart;
  id v7 = a3;
  id v10 = [v7 markedTextRange];
  _SLLog(v3, 7, @"SLMicroBlogComposeViewController textViewDidChange: _mentionsViewController %lx _mentionPendingStart %d (markedTextRange %@)");

  v11.receiver = self;
  v11.super_class = (Class)SLMicroBlogComposeViewController;
  -[SLComposeServiceViewController textViewDidChange:](&v11, sel_textViewDidChange_, v7, mentionsViewController, mentionPendingStart, v10);
  uint64_t v8 = [v7 markedTextRange];

  if (!v8)
  {
    if (!self->_mentionsViewController && self->_mentionPendingStart)
    {
      id v9 = [(SLMicroBlogComposeViewController *)self _mentionsSearchString];
      [(SLMicroBlogComposeViewController *)self _presentMentionsViewControllerIfApplicableForSearchString:v9];
    }
    self->_BOOL mentionPendingStart = 0;
  }
}

- (void)textViewDidChangeSelection:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [v5 selectedRange];
  [v5 selectedRange];
  uint64_t v8 = v7;
  id v10 = [v5 markedTextRange];
  _SLLog(v3, 7, @"SLMicroBlogComposeViewController textViewDidChangeSelection to %d %d (markedTextRange %@)");

  if (self->_mentionsViewController)
  {
    id v9 = objc_msgSend(v5, "markedTextRange", v6, v8, v10);

    if (!v9)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __63__SLMicroBlogComposeViewController_textViewDidChangeSelection___block_invoke;
      block[3] = &unk_1E6467288;
      block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

void __63__SLMicroBlogComposeViewController_textViewDidChangeSelection___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (!v2[148]) {
    return;
  }
  id v5 = [v2 _mentionsSearchString];
  if (![v5 length])
  {
    unint64_t v4 = *(id **)(a1 + 32);
    goto LABEL_7;
  }
  uint64_t v3 = [v5 rangeOfString:@" "];
  unint64_t v4 = *(id **)(a1 + 32);
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_7:
    [v4 _dismissMentionsViewController];
    goto LABEL_8;
  }
  [v4[148] setSearchString:v5];
LABEL_8:
}

+ (id)serviceBundle
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentPlace, 0);
  objc_storeStrong((id *)&self->_placeViewController, 0);
  objc_storeStrong((id *)&self->_accountViewController, 0);
  objc_storeStrong((id *)&self->_locationConfigurationItem, 0);
  objc_storeStrong((id *)&self->_accountConfigurationItem, 0);
  objc_storeStrong((id *)&self->_selectedAccountUserRecord, 0);
  objc_storeStrong((id *)&self->_accountIdentifiers, 0);
  objc_storeStrong((id *)&self->_accountUserRecords, 0);
  objc_storeStrong((id *)&self->_mentionsViewController, 0);
  objc_storeStrong((id *)&self->_serviceAccountTypeIdentifier, 0);

  objc_destroyWeak((id *)&self->_microBlogSheetDelegate);
}

@end