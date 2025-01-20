@interface CNDuplicateContactsController
+ (id)defaultContactFormatter;
+ (id)defaultContactFormatterForDataSource:(id)a3;
+ (id)os_log;
- (BOOL)canMergeDuplicates;
- (BOOL)hasNewDuplicates;
- (BOOL)isAlreadyFindingDuplicates;
- (BOOL)isBusy;
- (BOOL)isInMergeCooldown:(int64_t)a3;
- (BOOL)isPerformingMerge;
- (BOOL)wantsToDisplayNewDuplicatesBanner:(int64_t)a3;
- (CNContactDataSource)dataSource;
- (CNContactFormatter)contactFormatter;
- (CNContactStore)contactStore;
- (CNDuplicateContactsController)initWithDataSource:(id)a3 environment:(id)a4 delegate:(id)a5;
- (CNDuplicateContactsControllerDelegate)delegate;
- (CNUIContactsEnvironment)environment;
- (_TtC10ContactsUI18DuplicatesUIHelper)duplicatesUIHelper;
- (double)mergeCompletedAt;
- (int64_t)allDuplicatesCount;
- (int64_t)lastIgnoredNewDuplicatesCount;
- (int64_t)newDuplicatesCount;
- (void)decorateBannerViewCell:(id)a3;
- (void)didPerformDuplicatesMerge;
- (void)didSelectMergeAllDuplicates:(id)a3 signaturesToMerge:(id)a4;
- (void)duplicatesDidChange;
- (void)findDuplicates;
- (void)ignoreNewDuplicatesBanner;
- (void)performIgnoreAll;
- (void)performMerge:(id)a3;
- (void)presentDuplicatesUIFailureAlertForController:(id)a3;
- (void)presentSheetBasedMergeForController:(id)a3 showsIgnored:(BOOL)a4;
- (void)refreshManagedDuplicates;
- (void)refreshManagedDuplicatesWithCompletionBlock:(id)a3;
- (void)resetDuplicates;
- (void)setAllDuplicatesCount:(int64_t)a3;
- (void)setContactFormatter:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDuplicatesUIHelper:(id)a3;
- (void)setEnvironment:(id)a3;
- (void)setIsAlreadyFindingDuplicates:(BOOL)a3;
- (void)setIsPerformingMerge:(BOOL)a3;
- (void)setLastIgnoredNewDuplicatesCount:(int64_t)a3;
- (void)setMergeCompletedAt:(double)a3;
- (void)setNewDuplicatesCount:(int64_t)a3;
- (void)updateDuplicatesCounts;
- (void)willPerformDuplicatesMerge:(BOOL)a3;
@end

@implementation CNDuplicateContactsController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_contactFormatter, 0);
  objc_storeStrong((id *)&self->_duplicatesUIHelper, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_dataSource, 0);
}

- (void)setMergeCompletedAt:(double)a3
{
  self->_mergeCompletedAt = a3;
}

- (double)mergeCompletedAt
{
  return self->_mergeCompletedAt;
}

- (void)setIsAlreadyFindingDuplicates:(BOOL)a3
{
  self->_isAlreadyFindingDuplicates = a3;
}

- (BOOL)isAlreadyFindingDuplicates
{
  return self->_isAlreadyFindingDuplicates;
}

- (int64_t)allDuplicatesCount
{
  return self->_allDuplicatesCount;
}

- (int64_t)newDuplicatesCount
{
  return self->_newDuplicatesCount;
}

- (void)setEnvironment:(id)a3
{
}

- (CNUIContactsEnvironment)environment
{
  return self->_environment;
}

- (void)setContactFormatter:(id)a3
{
}

- (CNContactFormatter)contactFormatter
{
  return self->_contactFormatter;
}

- (void)setDuplicatesUIHelper:(id)a3
{
}

- (_TtC10ContactsUI18DuplicatesUIHelper)duplicatesUIHelper
{
  return self->_duplicatesUIHelper;
}

- (void)setIsPerformingMerge:(BOOL)a3
{
  self->_isPerformingMerge = a3;
}

- (BOOL)isPerformingMerge
{
  return self->_isPerformingMerge;
}

- (void)setDelegate:(id)a3
{
}

- (CNDuplicateContactsControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNDuplicateContactsControllerDelegate *)WeakRetained;
}

- (CNContactDataSource)dataSource
{
  return self->_dataSource;
}

- (void)didSelectMergeAllDuplicates:(id)a3 signaturesToMerge:(id)a4
{
}

- (void)didPerformDuplicatesMerge
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    [v6 didPerformDuplicatesMerge:self];
  }
}

- (void)willPerformDuplicatesMerge:(BOOL)a3
{
  if (a3
    && (id v4 = objc_loadWeakRetained((id *)&self->_delegate),
        char v5 = objc_opt_respondsToSelector(),
        v4,
        (v5 & 1) != 0))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained willPerformDuplicatesMergeAll:self];
  }
  else
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    char v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) == 0) {
      return;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained willPerformDuplicatesMerge:self];
  }
}

- (void)duplicatesDidChange
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int64_t v3 = [(CNDuplicateContactsController *)self newDuplicatesCount];
  if (v3 != [(CNDuplicateContactsController *)self lastIgnoredNewDuplicatesCount])
  {
    id v4 = objc_msgSend((id)objc_opt_class(), "os_log");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      int v8 = 134218240;
      int64_t v9 = [(CNDuplicateContactsController *)self lastIgnoredNewDuplicatesCount];
      __int16 v10 = 2048;
      int64_t v11 = [(CNDuplicateContactsController *)self newDuplicatesCount];
      _os_log_debug_impl(&dword_18B625000, v4, OS_LOG_TYPE_DEBUG, "Unignoring duplicates banner. Duplicates count updated from %ld to %ld", (uint8_t *)&v8, 0x16u);
    }

    [(CNDuplicateContactsController *)self setLastIgnoredNewDuplicatesCount:0];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    [v7 duplicatesDidChange:self];
  }
}

- (void)performIgnoreAll
{
  self->_mergeCompletedAt = 0.0;
  *(_WORD *)&self->_isPerformingMerge = 0;
  [(CNDuplicateContactsController *)self updateDuplicatesCounts];
}

- (void)performMerge:(id)a3
{
  id v4 = a3;
  char v5 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  char v6 = [v5 featureFlags];
  int v7 = [v6 isFeatureEnabled:8];

  if (v7 && ![(CNDuplicateContactsController *)self isBusy])
  {
    self->_isPerformingMerge = 1;
    -[CNDuplicateContactsController willPerformDuplicatesMerge:](self, "willPerformDuplicatesMerge:", -[CNDuplicateContactsController allDuplicatesCount](self, "allDuplicatesCount") == [v4 count]);
    if ((unint64_t)[v4 count] >= 0x1F5) {
      uint64_t v8 = 3;
    }
    else {
      uint64_t v8 = 4;
    }
    int64_t v9 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
    __int16 v10 = [v9 schedulerProvider];
    int64_t v11 = [v10 backgroundSchedulerWithQualityOfService:v8];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __46__CNDuplicateContactsController_performMerge___block_invoke;
    v12[3] = &unk_1E549BF80;
    id v13 = v4;
    v14 = self;
    [v11 performBlock:v12];
  }
}

void __46__CNDuplicateContactsController_performMerge___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1BAA8]);
  if ([MEMORY[0x1E4F1B9E0] applyMergeResultToSaveRequest:v2 signatures:*(void *)(a1 + 32)])
  {
    int64_t v3 = [*(id *)(a1 + 40) contactStore];
    id v12 = 0;
    [v3 executeSaveRequest:v2 error:&v12];
    id v4 = v12;

    if (v4)
    {
      char v5 = objc_msgSend((id)objc_opt_class(), "os_log");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = [*(id *)(a1 + 32) count];
        __int16 v10 = [v4 localizedDescription];
        *(_DWORD *)buf = 134218242;
        uint64_t v14 = v9;
        __int16 v15 = 2112;
        v16 = v10;
        _os_log_error_impl(&dword_18B625000, v5, OS_LOG_TYPE_ERROR, "Could not merge %lu duplicates. %@", buf, 0x16u);
      }
    }
    else
    {
      [MEMORY[0x1E4F1B9E0] updateRecentImagesDatabaseForSignatures:*(void *)(a1 + 32)];
      [MEMORY[0x1E4F1B9E0] updateRecentPostersDatabaseForSignatures:*(void *)(a1 + 32)];
    }
    char v6 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
    int v7 = [v6 timeProvider];
    [v7 timestamp];
    objc_msgSend(*(id *)(a1 + 40), "setMergeCompletedAt:");

    uint64_t v8 = *(void **)(a1 + 40);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __46__CNDuplicateContactsController_performMerge___block_invoke_31;
    v11[3] = &unk_1E549B1C0;
    v11[4] = v8;
    [v8 refreshManagedDuplicatesWithCompletionBlock:v11];
  }
}

uint64_t __46__CNDuplicateContactsController_performMerge___block_invoke_31(uint64_t a1)
{
  [*(id *)(a1 + 32) didPerformDuplicatesMerge];
  id v2 = *(void **)(a1 + 32);

  return [v2 setIsPerformingMerge:0];
}

- (void)decorateBannerViewCell:(id)a3
{
  BOOL isPerformingMerge = self->_isPerformingMerge;
  id v5 = a3;
  id v6 = v5;
  if (isPerformingMerge) {
    [v5 updateWithState:1];
  }
  else {
    objc_msgSend(v5, "updateWithCount:", -[CNDuplicateContactsController newDuplicatesCount](self, "newDuplicatesCount"));
  }
}

- (void)presentDuplicatesUIFailureAlertForController:(id)a3
{
  int64_t v3 = (void *)MEMORY[0x1E4FB1418];
  id v4 = a3;
  id v5 = CNContactsUIBundle();
  id v6 = [v5 localizedStringForKey:@"COULD_NOT_LOAD_DUPLICATES" value:&stru_1ED8AC728 table:@"Localized"];
  id v11 = [v3 alertControllerWithTitle:v6 message:0 preferredStyle:1];

  int v7 = (void *)MEMORY[0x1E4FB1410];
  uint64_t v8 = CNContactsUIBundle();
  uint64_t v9 = [v8 localizedStringForKey:@"OK" value:&stru_1ED8AC728 table:@"Localized"];
  __int16 v10 = [v7 actionWithTitle:v9 style:0 handler:&__block_literal_global_29_62505];

  [v11 addAction:v10];
  [v4 presentViewController:v11 animated:1 completion:0];
}

- (void)presentSheetBasedMergeForController:(id)a3 showsIgnored:(BOOL)a4
{
  BOOL v4 = a4;
  id v8 = a3;
  id v6 = [(DuplicatesUIHelper *)self->_duplicatesUIHelper duplicateContactsListViewController:v4];
  int v7 = v6;
  if (v6)
  {
    [v6 setModalPresentationStyle:2];
    [v8 presentViewController:v7 animated:1 completion:0];
  }
  else
  {
    [(CNDuplicateContactsController *)self presentDuplicatesUIFailureAlertForController:v8];
  }
}

- (BOOL)isInMergeCooldown:(int64_t)a3
{
  if (self->_mergeCompletedAt == 0.0) {
    return 0;
  }
  id v5 = [MEMORY[0x1E4F5A538] defaultProvider];
  [v5 timestamp];
  double v7 = v6;

  return v7 - self->_mergeCompletedAt < (double)a3;
}

- (BOOL)canMergeDuplicates
{
  BOOL v3 = [(CNDuplicateContactsController *)self hasNewDuplicates];
  if (v3) {
    LOBYTE(v3) = ![(CNDuplicateContactsController *)self isBusy];
  }
  return v3;
}

- (BOOL)hasNewDuplicates
{
  return [(CNDuplicateContactsController *)self newDuplicatesCount] > 0;
}

- (BOOL)wantsToDisplayNewDuplicatesBanner:(int64_t)a3
{
  if ([(CNDuplicateContactsController *)self lastIgnoredNewDuplicatesCount] > 0) {
    return 0;
  }
  if ([(CNDuplicateContactsController *)self hasNewDuplicates]) {
    return 1;
  }

  return [(CNDuplicateContactsController *)self isInMergeCooldown:a3];
}

- (void)ignoreNewDuplicatesBanner
{
  int64_t v3 = [(CNDuplicateContactsController *)self newDuplicatesCount];

  [(CNDuplicateContactsController *)self setLastIgnoredNewDuplicatesCount:v3];
}

- (void)setLastIgnoredNewDuplicatesCount:(int64_t)a3
{
  if ([(CNDuplicateContactsController *)self lastIgnoredNewDuplicatesCount] != a3)
  {
    id v4 = [MEMORY[0x1E4F1B9A8] sharedDefaults];
    [v4 setLastIgnoredNewDuplicatesCount:a3];
  }
}

- (int64_t)lastIgnoredNewDuplicatesCount
{
  id v2 = [MEMORY[0x1E4F1B9A8] sharedDefaults];
  int64_t v3 = [v2 lastIgnoredNewDuplicatesCount];

  return v3;
}

- (BOOL)isBusy
{
  return self->_isPerformingMerge || self->_isAlreadyFindingDuplicates;
}

- (void)setAllDuplicatesCount:(int64_t)a3
{
  if (self->_allDuplicatesCount != a3)
  {
    self->_allDuplicatesCount = a3;
    [(CNDuplicateContactsController *)self duplicatesDidChange];
  }
}

- (void)setNewDuplicatesCount:(int64_t)a3
{
  if (self->_newDuplicatesCount != a3)
  {
    self->_newDuplicatesCount = a3;
    [(CNDuplicateContactsController *)self duplicatesDidChange];
  }
}

- (void)updateDuplicatesCounts
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __55__CNDuplicateContactsController_updateDuplicatesCounts__block_invoke;
  v2[3] = &unk_1E549B178;
  v2[4] = self;
  [MEMORY[0x1E4F1B9E0] duplicatesCountsWithCompletionHandler:v2];
}

uint64_t __55__CNDuplicateContactsController_updateDuplicatesCounts__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = [*(id *)(a1 + 32) newDuplicatesCount];
  double v7 = *(void **)(a1 + 32);
  if (v6 == a2)
  {
    uint64_t result = [v7 allDuplicatesCount];
    if (result == a3) {
      return result;
    }
    goto LABEL_5;
  }
  v7[7] = a2;
  if ([*(id *)(a1 + 32) allDuplicatesCount] != a3) {
LABEL_5:
  }
    *(void *)(*(void *)(a1 + 32) + 64) = a3;
  uint64_t v9 = *(void **)(a1 + 32);

  return [v9 duplicatesDidChange];
}

- (void)refreshManagedDuplicatesWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F1B9E0];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __77__CNDuplicateContactsController_refreshManagedDuplicatesWithCompletionBlock___block_invoke;
  v7[3] = &unk_1E549B8C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 refreshManagedDuplicatesWithCompletionHandler:v7];
}

uint64_t __77__CNDuplicateContactsController_refreshManagedDuplicatesWithCompletionBlock___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) updateDuplicatesCounts];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    int64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)refreshManagedDuplicates
{
}

- (void)findDuplicates
{
  int64_t v3 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
  id v4 = [v3 featureFlags];
  int v5 = [v4 isFeatureEnabled:8];

  if (v5)
  {
    if (![(CNDuplicateContactsController *)self isBusy])
    {
      self->_isAlreadyFindingDuplicates = 1;
      id v6 = [MEMORY[0x1E4F5A3D8] currentEnvironment];
      double v7 = [v6 schedulerProvider];
      id v8 = [v7 backgroundScheduler];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __47__CNDuplicateContactsController_findDuplicates__block_invoke;
      v9[3] = &unk_1E549B488;
      v9[4] = self;
      [v8 performBlock:v9];
    }
  }
}

void __47__CNDuplicateContactsController_findDuplicates__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) refreshManagedDuplicates];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__CNDuplicateContactsController_findDuplicates__block_invoke_2;
  block[3] = &unk_1E549B488;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __47__CNDuplicateContactsController_findDuplicates__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setIsAlreadyFindingDuplicates:0];
}

- (void)resetDuplicates
{
  if (!self->_isPerformingMerge)
  {
    *(_WORD *)&self->_BOOL isPerformingMerge = 0;
    self->_mergeCompletedAt = 0.0;
  }
}

- (CNContactStore)contactStore
{
  if (objc_opt_respondsToSelector())
  {
    int64_t v3 = [(CNContactDataSource *)self->_dataSource store];
  }
  else
  {
    id v4 = [(CNDuplicateContactsController *)self environment];
    int64_t v3 = [v4 inProcessContactStore];
  }

  return (CNContactStore *)v3;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
  id v5 = a3;
  id v6 = +[CNDuplicateContactsController defaultContactFormatterForDataSource:v5];
  contactFormatter = self->_contactFormatter;
  self->_contactFormatter = v6;

  *(_WORD *)&self->_BOOL isPerformingMerge = 0;
  self->_allDuplicatesCount = 0;
  self->_mergeCompletedAt = 0.0;
  self->_newDuplicatesCount = 0;

  [(CNDuplicateContactsController *)self updateDuplicatesCounts];
}

- (CNDuplicateContactsController)initWithDataSource:(id)a3 environment:(id)a4 delegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)CNDuplicateContactsController;
  id v12 = [(CNDuplicateContactsController *)&v20 init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_environment, a4);
    objc_storeStrong((id *)&v13->_dataSource, a3);
    uint64_t v14 = +[CNDuplicateContactsController defaultContactFormatterForDataSource:v9];
    contactFormatter = v13->_contactFormatter;
    v13->_contactFormatter = (CNContactFormatter *)v14;

    objc_storeWeak((id *)&v13->_delegate, v11);
    *(_WORD *)&v13->_BOOL isPerformingMerge = 0;
    v13->_allDuplicatesCount = 0;
    v13->_mergeCompletedAt = 0.0;
    v13->_newDuplicatesCount = 0;
    v16 = [[_TtC10ContactsUI18DuplicatesUIHelper alloc] initWithDelegate:v13];
    duplicatesUIHelper = v13->_duplicatesUIHelper;
    v13->_duplicatesUIHelper = v16;

    [(CNDuplicateContactsController *)v13 updateDuplicatesCounts];
    v18 = v13;
  }

  return v13;
}

+ (id)defaultContactFormatter
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1B910]);
  [v2 setStyle:0];
  [v2 setEmphasizesPrimaryNameComponent:1];
  [v2 setFallbackStyle:-1];

  return v2;
}

+ (id)defaultContactFormatterForDataSource:(id)a3
{
  id v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([v4 contactFormatter], id v5 = objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    uint64_t v6 = [v4 contactFormatter];
  }
  else
  {
    uint64_t v6 = [a1 defaultContactFormatter];
  }
  double v7 = (void *)v6;

  return v7;
}

+ (id)os_log
{
  if (os_log_cn_once_token_4_62533 != -1) {
    dispatch_once(&os_log_cn_once_token_4_62533, &__block_literal_global_62534);
  }
  id v2 = (void *)os_log_cn_once_object_4_62535;

  return v2;
}

void __39__CNDuplicateContactsController_os_log__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.contacts.deduplication", "duplicates-ui");
  v1 = (void *)os_log_cn_once_object_4_62535;
  os_log_cn_once_object_4_62535 = (uint64_t)v0;
}

@end