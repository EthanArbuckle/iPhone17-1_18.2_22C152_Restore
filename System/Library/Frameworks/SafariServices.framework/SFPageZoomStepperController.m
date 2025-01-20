@interface SFPageZoomStepperController
- (SFPageZoomStepperController)initWithDocument:(id)a3 preferenceManager:(id)a4;
- (id)didSetValueHandler;
- (id)longestTextForButton:(int64_t)a3;
- (void)_pageZoomChanged:(id)a3;
- (void)_updateButtonsEnabledOnMainQueueWithZoomFactor:(double)a3;
- (void)_updateButtonsEnabledWithZoomFactor:(double)a3;
- (void)dealloc;
- (void)decrementValue:(id)a3;
- (void)incrementValue:(id)a3;
- (void)prepareStepper:(id)a3;
- (void)resetValue:(id)a3;
- (void)setDidSetValueHandler:(id)a3;
@end

@implementation SFPageZoomStepperController

- (SFPageZoomStepperController)initWithDocument:(id)a3 preferenceManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SFPageZoomStepperController;
  v8 = [(SFPageZoomStepperController *)&v15 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_tab, v6);
    objc_storeStrong((id *)&v9->_preferenceManager, a4);
    v10 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E4F28EE0]);
    percentFormatter = v9->_percentFormatter;
    v9->_percentFormatter = v10;

    [(NSNumberFormatter *)v9->_percentFormatter setNumberStyle:3];
    v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 addObserver:v9 selector:sel__pageZoomChanged_ name:*MEMORY[0x1E4F992F8] object:v7];

    v13 = v9;
  }

  return v9;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SFPageZoomStepperController;
  [(SFPageZoomStepperController *)&v4 dealloc];
}

- (void)prepareStepper:(id)a3
{
  p_stepper = &self->_stepper;
  id v5 = a3;
  objc_storeWeak((id *)p_stepper, v5);
  id v6 = [MEMORY[0x1E4FB1818] systemImageNamed:@"textformat.size.smaller"];
  [v5 setImage:v6 forButton:1];

  id v7 = [MEMORY[0x1E4FB1818] systemImageNamed:@"textformat.size.larger"];
  [v5 setImage:v7 forButton:0];

  v8 = [(NSNumberFormatter *)self->_percentFormatter stringFromNumber:&unk_1EFBDE728];
  [v5 setText:v8 forButton:2];

  preferenceManager = self->_preferenceManager;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tab);
  v11 = [WeakRetained URLForPerSitePreferences];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __46__SFPageZoomStepperController_prepareStepper___block_invoke;
  v12[3] = &unk_1E5C72260;
  v12[4] = self;
  [(WBSPageZoomPreferenceManager *)preferenceManager getPageZoomFactorForURL:v11 usingBlock:v12];
}

uint64_t __46__SFPageZoomStepperController_prepareStepper___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateButtonsEnabledWithZoomFactor:");
}

- (void)incrementValue:(id)a3
{
  preferenceManager = self->_preferenceManager;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tab);
  id v6 = [WeakRetained URLForPerSitePreferences];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__SFPageZoomStepperController_incrementValue___block_invoke;
  v7[3] = &unk_1E5C72288;
  v7[4] = self;
  [(WBSPageZoomPreferenceManager *)preferenceManager zoomInOnURL:v6 completionHandler:v7];
}

void __46__SFPageZoomStepperController_incrementValue___block_invoke(uint64_t a1, int a2)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateButtonsEnabledWithZoomFactor:");
  if (a2)
  {
    id v3 = [MEMORY[0x1E4F98948] sharedLogger];
    [v3 didModifyPerSitePreferencesWithPreferenceIdentifier:*MEMORY[0x1E4F997D8] modificationLevel:1 type:0 method:0];
  }
}

- (void)decrementValue:(id)a3
{
  preferenceManager = self->_preferenceManager;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tab);
  id v6 = [WeakRetained URLForPerSitePreferences];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__SFPageZoomStepperController_decrementValue___block_invoke;
  v7[3] = &unk_1E5C72288;
  v7[4] = self;
  [(WBSPageZoomPreferenceManager *)preferenceManager zoomOutOnURL:v6 completionHandler:v7];
}

void __46__SFPageZoomStepperController_decrementValue___block_invoke(uint64_t a1, int a2)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateButtonsEnabledWithZoomFactor:");
  if (a2)
  {
    id v3 = [MEMORY[0x1E4F98948] sharedLogger];
    [v3 didModifyPerSitePreferencesWithPreferenceIdentifier:*MEMORY[0x1E4F997D8] modificationLevel:1 type:0 method:0];
  }
}

- (void)resetValue:(id)a3
{
  preferenceManager = self->_preferenceManager;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tab);
  id v6 = [WeakRetained URLForPerSitePreferences];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__SFPageZoomStepperController_resetValue___block_invoke;
  v7[3] = &unk_1E5C72288;
  v7[4] = self;
  [(WBSPageZoomPreferenceManager *)preferenceManager resetZoomLevelOnURL:v6 completionHandler:v7];
}

void __42__SFPageZoomStepperController_resetValue___block_invoke(uint64_t a1, char a2, double a3)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__SFPageZoomStepperController_resetValue___block_invoke_2;
  block[3] = &unk_1E5C722B0;
  block[4] = *(void *)(a1 + 32);
  *(double *)&block[5] = a3;
  char v4 = a2;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __42__SFPageZoomStepperController_resetValue___block_invoke_2(uint64_t a1)
{
  double v2 = *(double *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  char v4 = [WeakRetained webView];
  [v4 _setViewScale:v2];

  [*(id *)(a1 + 32) _updateButtonsEnabledOnMainQueueWithZoomFactor:*(double *)(a1 + 40)];
  if (*(unsigned char *)(a1 + 48))
  {
    id v5 = [MEMORY[0x1E4F98948] sharedLogger];
    [v5 didModifyPerSitePreferencesWithPreferenceIdentifier:*MEMORY[0x1E4F997D8] modificationLevel:1 type:1 method:0];
  }
}

- (id)longestTextForButton:(int64_t)a3
{
  if (a3 == 2)
  {
    percentFormatter = self->_percentFormatter;
    char v4 = [MEMORY[0x1E4F98C68] pageZoomFactors];
    id v5 = [v4 lastObject];
    id v6 = [(NSNumberFormatter *)percentFormatter stringFromNumber:v5];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)_updateButtonsEnabledWithZoomFactor:(double)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __67__SFPageZoomStepperController__updateButtonsEnabledWithZoomFactor___block_invoke;
  v3[3] = &unk_1E5C722D8;
  v3[4] = self;
  *(double *)&v3[5] = a3;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

uint64_t __67__SFPageZoomStepperController__updateButtonsEnabledWithZoomFactor___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateButtonsEnabledOnMainQueueWithZoomFactor:*(double *)(a1 + 40)];
}

- (void)_updateButtonsEnabledOnMainQueueWithZoomFactor:(double)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stepper);
  percentFormatter = self->_percentFormatter;
  id v7 = [NSNumber numberWithDouble:a3];
  v8 = [(NSNumberFormatter *)percentFormatter stringFromNumber:v7];

  preferenceManager = self->_preferenceManager;
  id v10 = objc_loadWeakRetained((id *)&self->_tab);
  v11 = [v10 URLForPerSitePreferences];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __78__SFPageZoomStepperController__updateButtonsEnabledOnMainQueueWithZoomFactor___block_invoke;
  v14[3] = &unk_1E5C72328;
  id v15 = WeakRetained;
  v16 = self;
  id v17 = v8;
  id v12 = v8;
  id v13 = WeakRetained;
  [(WBSPageZoomPreferenceManager *)preferenceManager getAvailableActionsForURL:v11 usingBlock:v14];

  [v13 setText:v12 forButton:2];
}

void __78__SFPageZoomStepperController__updateButtonsEnabledOnMainQueueWithZoomFactor___block_invoke(uint64_t a1, uint64_t a2)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__SFPageZoomStepperController__updateButtonsEnabledOnMainQueueWithZoomFactor___block_invoke_2;
  v7[3] = &unk_1E5C72300;
  id v4 = *(id *)(a1 + 32);
  uint64_t v11 = a2;
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = *(void **)(a1 + 48);
  id v8 = v4;
  uint64_t v9 = v5;
  id v10 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

uint64_t __78__SFPageZoomStepperController__updateButtonsEnabledOnMainQueueWithZoomFactor___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setEnabled:*(_DWORD *)(a1 + 56) & 1 forButton:0];
  [*(id *)(a1 + 32) setEnabled:(*(void *)(a1 + 56) >> 1) & 1 forButton:1];
  [*(id *)(a1 + 32) setEnabled:(*(void *)(a1 + 56) >> 2) & 1 forButton:2];
  uint64_t result = *(void *)(*(void *)(a1 + 40) + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)_pageZoomChanged:(id)a3
{
  id v4 = [a3 userInfo];
  uint64_t v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F99170]];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__SFPageZoomStepperController__pageZoomChanged___block_invoke;
  block[3] = &unk_1E5C72350;
  id v9 = v5;
  id v10 = self;
  id v11 = v4;
  id v6 = v4;
  id v7 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __48__SFPageZoomStepperController__pageZoomChanged___block_invoke(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 16));
  id v4 = [WeakRetained URLForPerSitePreferences];
  uint64_t v5 = objc_msgSend(v4, "safari_userVisibleHostWithoutWWWSubdomain");
  LODWORD(v2) = [v2 isEqualToString:v5];

  if (v2)
  {
    id v6 = [*(id *)(a1 + 48) objectForKeyedSubscript:*MEMORY[0x1E4F992F0]];
    [v6 doubleValue];
    double v8 = v7;

    id v9 = *(void **)(a1 + 40);
    [v9 _updateButtonsEnabledOnMainQueueWithZoomFactor:v8];
  }
}

- (id)didSetValueHandler
{
  return self->_didSetValueHandler;
}

- (void)setDidSetValueHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didSetValueHandler, 0);
  objc_destroyWeak((id *)&self->_stepper);
  objc_storeStrong((id *)&self->_percentFormatter, 0);
  objc_destroyWeak((id *)&self->_tab);

  objc_storeStrong((id *)&self->_preferenceManager, 0);
}

@end