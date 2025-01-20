@interface MUActivityViewController
- (BOOL)_canShowWhileLocked;
- (MUActivityViewController)initWithShareItem:(id)a3;
- (MUActivityViewControllerDelegate)activityControllerDelegate;
- (id)_activityHandler;
- (id)_completionHandler;
- (void)setActivityControllerDelegate:(id)a3;
@end

@implementation MUActivityViewController

- (MUActivityViewController)initWithShareItem:(id)a3
{
  id v4 = a3;
  v5 = [v4 activityProviders];
  v6 = [v4 applicationActivities];
  v13.receiver = self;
  v13.super_class = (Class)MUActivityViewController;
  v7 = [(MUActivityViewController *)&v13 initWithActivityItems:v5 applicationActivities:v6];

  if (v7)
  {
    v8 = [v4 excludedActivityTypes];
    [(MUActivityViewController *)v7 setExcludedActivityTypes:v8];

    v9 = [v4 includedActivityTypes];
    [(MUActivityViewController *)v7 setIncludedActivityTypes:v9];

    v10 = [(MUActivityViewController *)v7 _activityHandler];
    [(MUActivityViewController *)v7 setPreCompletionHandler:v10];

    v11 = [(MUActivityViewController *)v7 _completionHandler];
    [(MUActivityViewController *)v7 setCompletionWithItemsHandler:v11];

    [(MUActivityViewController *)v7 setShowKeyboardAutomatically:1];
    [(MUActivityViewController *)v7 setAirDropDelegate:v7];
  }

  return v7;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)_completionHandler
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __46__MUActivityViewController__completionHandler__block_invoke;
  v4[3] = &unk_1E5750D18;
  v4[4] = self;
  v2 = (void *)[v4 copy];
  return v2;
}

void __46__MUActivityViewController__completionHandler__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 activityControllerDelegate];
  [v7 mapkitActivityViewController:*(void *)(a1 + 32) postCompletedActivityOfType:v6 completed:a3];
}

- (id)_activityHandler
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__MUActivityViewController__activityHandler__block_invoke;
  v4[3] = &unk_1E5750D40;
  v4[4] = self;
  v2 = (void *)[v4 copy];
  return v2;
}

void __44__MUActivityViewController__activityHandler__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 activityControllerDelegate];
  [v7 mapkitActivityViewController:*(void *)(a1 + 32) preCompletedActivityOfType:v6 completed:a3];
}

- (MUActivityViewControllerDelegate)activityControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activityControllerDelegate);
  return (MUActivityViewControllerDelegate *)WeakRetained;
}

- (void)setActivityControllerDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end