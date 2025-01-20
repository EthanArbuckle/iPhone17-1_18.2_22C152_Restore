@interface MUICategoryGroupingPreferenceController
- (BOOL)shouldDisableGroupingForBucket:(int64_t)a3;
- (BOOL)shouldDisableGroupingInPromotions;
- (BOOL)shouldDisableGroupingInTransactions;
- (BOOL)shouldDisableGroupingInUpdates;
- (EFCancelable)shouldDisableGroupingInPromotionsUserDefaultsObserver;
- (EFCancelable)shouldDisableGroupingInTransactionsUserDefaultsObserver;
- (EFCancelable)shouldDisableGroupingInUpdatesUserDefaultsObserver;
- (MUICategoryGroupingPreferenceController)initWithDelegate:(id)a3;
- (MUICategoryGroupingPreferenceControllerDelegate)delegate;
- (void)disableGrouping:(BOOL)a3 forBucket:(int64_t)a4;
- (void)setDelegate:(id)a3;
- (void)setShouldDisableGroupingInPromotions:(BOOL)a3;
- (void)setShouldDisableGroupingInPromotionsUserDefaultsObserver:(id)a3;
- (void)setShouldDisableGroupingInTransactions:(BOOL)a3;
- (void)setShouldDisableGroupingInTransactionsUserDefaultsObserver:(id)a3;
- (void)setShouldDisableGroupingInUpdates:(BOOL)a3;
- (void)setShouldDisableGroupingInUpdatesUserDefaultsObserver:(id)a3;
@end

@implementation MUICategoryGroupingPreferenceController

- (MUICategoryGroupingPreferenceController)initWithDelegate:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)MUICategoryGroupingPreferenceController;
  v5 = [(MUICategoryGroupingPreferenceController *)&v25 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
    uint64_t v8 = *MEMORY[0x1E4F60180];
    v6->_shouldDisableGroupingInTransactions = [v7 BOOLForKey:*MEMORY[0x1E4F60180]];
    uint64_t v9 = *MEMORY[0x1E4F60188];
    v6->_shouldDisableGroupingInUpdates = [v7 BOOLForKey:*MEMORY[0x1E4F60188]];
    uint64_t v10 = *MEMORY[0x1E4F60178];
    v6->_shouldDisableGroupingInPromotions = [v7 BOOLForKey:*MEMORY[0x1E4F60178]];
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v6);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __60__MUICategoryGroupingPreferenceController_initWithDelegate___block_invoke;
    v22[3] = &unk_1E6D11EE0;
    objc_copyWeak(&v23, &location);
    uint64_t v11 = objc_msgSend(v7, "ef_observeKeyPath:options:autoCancelToken:usingBlock:", v8, 1, 1, v22);
    shouldDisableGroupingInTransactionsUserDefaultsObserver = v6->_shouldDisableGroupingInTransactionsUserDefaultsObserver;
    v6->_shouldDisableGroupingInTransactionsUserDefaultsObserver = (EFCancelable *)v11;

    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __60__MUICategoryGroupingPreferenceController_initWithDelegate___block_invoke_2;
    v20[3] = &unk_1E6D11EE0;
    objc_copyWeak(&v21, &location);
    uint64_t v13 = objc_msgSend(v7, "ef_observeKeyPath:options:autoCancelToken:usingBlock:", v9, 1, 1, v20);
    shouldDisableGroupingInUpdatesUserDefaultsObserver = v6->_shouldDisableGroupingInUpdatesUserDefaultsObserver;
    v6->_shouldDisableGroupingInUpdatesUserDefaultsObserver = (EFCancelable *)v13;

    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __60__MUICategoryGroupingPreferenceController_initWithDelegate___block_invoke_3;
    v18[3] = &unk_1E6D11EE0;
    objc_copyWeak(&v19, &location);
    uint64_t v15 = objc_msgSend(v7, "ef_observeKeyPath:options:autoCancelToken:usingBlock:", v10, 1, 1, v18);
    shouldDisableGroupingInPromotionsUserDefaultsObserver = v6->_shouldDisableGroupingInPromotionsUserDefaultsObserver;
    v6->_shouldDisableGroupingInPromotionsUserDefaultsObserver = (EFCancelable *)v15;

    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
  return v6;
}

void __60__MUICategoryGroupingPreferenceController_initWithDelegate___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F284C8]];
    if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F60CF0] + 16))())
    {

      id v4 = 0;
    }
    objc_msgSend(WeakRetained, "setShouldDisableGroupingInTransactions:", objc_msgSend(v4, "BOOLValue"));
    v5 = [WeakRetained delegate];
    objc_msgSend(v5, "categoryGroupingPreferenceController:shouldDisableGrouping:forBucket:", WeakRetained, objc_msgSend(WeakRetained, "shouldDisableGroupingInTransactions"), 2);
  }
}

void __60__MUICategoryGroupingPreferenceController_initWithDelegate___block_invoke_2(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F284C8]];
    if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F60CF0] + 16))())
    {

      id v4 = 0;
    }
    objc_msgSend(WeakRetained, "setShouldDisableGroupingInUpdates:", objc_msgSend(v4, "BOOLValue"));
    v5 = [WeakRetained delegate];
    objc_msgSend(v5, "categoryGroupingPreferenceController:shouldDisableGrouping:forBucket:", WeakRetained, objc_msgSend(WeakRetained, "shouldDisableGroupingInUpdates"), 3);
  }
}

void __60__MUICategoryGroupingPreferenceController_initWithDelegate___block_invoke_3(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F284C8]];
    if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F60CF0] + 16))())
    {

      id v4 = 0;
    }
    objc_msgSend(WeakRetained, "setShouldDisableGroupingInPromotions:", objc_msgSend(v4, "BOOLValue"));
    v5 = [WeakRetained delegate];
    objc_msgSend(v5, "categoryGroupingPreferenceController:shouldDisableGrouping:forBucket:", WeakRetained, objc_msgSend(WeakRetained, "shouldDisableGroupingInPromotions"), 4);
  }
}

- (BOOL)shouldDisableGroupingForBucket:(int64_t)a3
{
  switch(a3)
  {
    case 4:
      return [(MUICategoryGroupingPreferenceController *)self shouldDisableGroupingInPromotions];
    case 3:
      return [(MUICategoryGroupingPreferenceController *)self shouldDisableGroupingInUpdates];
    case 2:
      return [(MUICategoryGroupingPreferenceController *)self shouldDisableGroupingInTransactions];
  }
  return 1;
}

- (void)disableGrouping:(BOOL)a3 forBucket:(int64_t)a4
{
  BOOL v5 = a3;
  id v6 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  if ((unint64_t)(a4 - 2) <= 2)
  {
    id v7 = v6;
    [v6 setBool:v5 forKey:**((void **)&unk_1E6D12C98 + a4 - 2)];
    id v6 = v7;
  }
}

- (MUICategoryGroupingPreferenceControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MUICategoryGroupingPreferenceControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)shouldDisableGroupingInTransactions
{
  return self->_shouldDisableGroupingInTransactions;
}

- (void)setShouldDisableGroupingInTransactions:(BOOL)a3
{
  self->_shouldDisableGroupingInTransactions = a3;
}

- (BOOL)shouldDisableGroupingInUpdates
{
  return self->_shouldDisableGroupingInUpdates;
}

- (void)setShouldDisableGroupingInUpdates:(BOOL)a3
{
  self->_shouldDisableGroupingInUpdates = a3;
}

- (BOOL)shouldDisableGroupingInPromotions
{
  return self->_shouldDisableGroupingInPromotions;
}

- (void)setShouldDisableGroupingInPromotions:(BOOL)a3
{
  self->_shouldDisableGroupingInPromotions = a3;
}

- (EFCancelable)shouldDisableGroupingInTransactionsUserDefaultsObserver
{
  return self->_shouldDisableGroupingInTransactionsUserDefaultsObserver;
}

- (void)setShouldDisableGroupingInTransactionsUserDefaultsObserver:(id)a3
{
}

- (EFCancelable)shouldDisableGroupingInUpdatesUserDefaultsObserver
{
  return self->_shouldDisableGroupingInUpdatesUserDefaultsObserver;
}

- (void)setShouldDisableGroupingInUpdatesUserDefaultsObserver:(id)a3
{
}

- (EFCancelable)shouldDisableGroupingInPromotionsUserDefaultsObserver
{
  return self->_shouldDisableGroupingInPromotionsUserDefaultsObserver;
}

- (void)setShouldDisableGroupingInPromotionsUserDefaultsObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shouldDisableGroupingInPromotionsUserDefaultsObserver, 0);
  objc_storeStrong((id *)&self->_shouldDisableGroupingInUpdatesUserDefaultsObserver, 0);
  objc_storeStrong((id *)&self->_shouldDisableGroupingInTransactionsUserDefaultsObserver, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end