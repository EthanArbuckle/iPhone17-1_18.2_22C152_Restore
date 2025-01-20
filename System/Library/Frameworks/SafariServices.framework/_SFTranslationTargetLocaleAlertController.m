@interface _SFTranslationTargetLocaleAlertController
+ (id)translationAlertControllerWithDelegate:(id)a3 localeIdentifiers:(id)a4;
- (NSMutableDictionary)localeIdentifierToAlertActionMap;
- (_SFTranslationTargetLocaleAlertController)initWithTranslationContext:(id)a3;
- (_SFTranslationTargetLocaleAlertControllerDelegate)delegate;
- (id)analyticsHandler;
- (void)_setUpWithLocaleIdentifiers:(id)a3;
- (void)_translationAvailabilityDidChange:(id)a3;
- (void)configurePopoverWithSourceInfo:(id)a3;
- (void)setAnalyticsHandler:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLocaleIdentifierToAlertActionMap:(id)a3;
- (void)translationAlertController:(id)a3 didSelectLocale:(id)a4;
- (void)translationAlertController:(id)a3 validateTargetLocale:(id)a4 completionHandler:(id)a5;
- (void)translationAvailabilityDidChange;
@end

@implementation _SFTranslationTargetLocaleAlertController

+ (id)translationAlertControllerWithDelegate:(id)a3 localeIdentifiers:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [a1 alertControllerWithTitle:0 message:0 preferredStyle:0];
  [v8 setDelegate:v7];

  [v8 _setUpWithLocaleIdentifiers:v6];

  return v8;
}

- (void)_setUpWithLocaleIdentifiers:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA60] dictionary];
  localeIdentifierToAlertActionMap = self->_localeIdentifierToAlertActionMap;
  self->_localeIdentifierToAlertActionMap = v5;

  objc_initWeak(&location, self);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v4;
  uint64_t v7 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v7)
  {
    uint64_t v23 = *(void *)v36;
    v21 = v29;
    do
    {
      uint64_t v8 = 0;
      uint64_t v24 = v7;
      do
      {
        if (*(void *)v36 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v35 + 1) + 8 * v8);
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __73___SFTranslationTargetLocaleAlertController__setUpWithLocaleIdentifiers___block_invoke;
        v33[3] = &unk_1E5C72938;
        objc_copyWeak(&v34, &location);
        v33[4] = v9;
        v10 = (void *)MEMORY[0x1AD0C36A0](v33);
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __73___SFTranslationTargetLocaleAlertController__setUpWithLocaleIdentifiers___block_invoke_2;
        v31[3] = &unk_1E5C74350;
        objc_copyWeak(&v32, &location);
        v11 = (void *)MEMORY[0x1AD0C36A0](v31);
        v12 = -[_SFTranslationTargetLocaleAlertActionContentViewController initWithLocaleIdentifier:]([_SFTranslationTargetLocaleAlertActionContentViewController alloc], "initWithLocaleIdentifier:", v9, v21);
        v13 = objc_msgSend(MEMORY[0x1E4FB1410], "sf_actionWithContentViewController:style:handler:shouldDismissHandler:", v12, 0, v10, v11);
        [v13 setEnabled:0];
        [(NSMutableDictionary *)self->_localeIdentifierToAlertActionMap setObject:v13 forKeyedSubscript:v9];
        [(_SFTranslationTargetLocaleAlertController *)self addAction:v13];
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        if (objc_opt_respondsToSelector())
        {
          v28[0] = MEMORY[0x1E4F143A8];
          v28[1] = 3221225472;
          v29[0] = __73___SFTranslationTargetLocaleAlertController__setUpWithLocaleIdentifiers___block_invoke_3;
          v29[1] = &unk_1E5C72678;
          id v30 = v13;
          [WeakRetained translationAlertController:self validateTargetLocale:v9 completionHandler:v28];
        }
        objc_destroyWeak(&v32);

        objc_destroyWeak(&v34);
        ++v8;
      }
      while (v24 != v8);
      uint64_t v7 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v7);
  }

  v15 = (void *)MEMORY[0x1E4FB1410];
  v16 = _WBSLocalizedString();
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __73___SFTranslationTargetLocaleAlertController__setUpWithLocaleIdentifiers___block_invoke_5;
  v27[3] = &unk_1E5C72898;
  v27[4] = self;
  v17 = [v15 actionWithTitle:v16 style:0 handler:v27];
  [(_SFTranslationTargetLocaleAlertController *)self addAction:v17];

  v18 = (void *)MEMORY[0x1E4FB1410];
  v19 = _WBSLocalizedString();
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __73___SFTranslationTargetLocaleAlertController__setUpWithLocaleIdentifiers___block_invoke_6;
  v25[3] = &unk_1E5C72B18;
  objc_copyWeak(&v26, &location);
  v20 = [v18 actionWithTitle:v19 style:1 handler:v25];
  [(_SFTranslationTargetLocaleAlertController *)self addAction:v20];

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
}

- (_SFTranslationTargetLocaleAlertController)initWithTranslationContext:(id)a3
{
  id v4 = a3;
  v5 = [(id)objc_opt_class() alertControllerWithTitle:0 message:0 preferredStyle:0];

  if (v5)
  {
    [(UIAlertController *)v5 setImageIfNecessaryWithName:@"alert-translation"];
    objc_storeWeak((id *)&v5->_translationContext, v4);
    objc_storeWeak((id *)&v5->_delegate, v5);
    id v6 = [v4 availableTargetLocaleIdentifiers];
    [(_SFTranslationTargetLocaleAlertController *)v5 _setUpWithLocaleIdentifiers:v6];

    uint64_t v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:v5 selector:sel__translationAvailabilityDidChange_ name:*MEMORY[0x1E4F99728] object:v4];

    uint64_t v8 = v5;
  }

  return v5;
}

- (void)configurePopoverWithSourceInfo:(id)a3
{
  id v4 = a3;
  id v6 = [[_SFPopoverPresentationDelegate alloc] initWithSourceInfo:v4];

  [(_SFTranslationTargetLocaleAlertController *)self setModalPresentationStyle:7];
  v5 = [(_SFTranslationTargetLocaleAlertController *)self popoverPresentationController];
  [(_SFPopoverPresentationDelegate *)v6 attachToPopoverPresentationController:v5];
}

- (void)translationAvailabilityDidChange
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    objc_initWeak(&location, self);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v4 = [(NSMutableDictionary *)self->_localeIdentifierToAlertActionMap allKeys];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v12;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v4);
          }
          uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * v7);
          v9[0] = MEMORY[0x1E4F143A8];
          v9[1] = 3221225472;
          v9[2] = __77___SFTranslationTargetLocaleAlertController_translationAvailabilityDidChange__block_invoke;
          v9[3] = &unk_1E5C73B70;
          objc_copyWeak(&v10, &location);
          v9[4] = v8;
          [WeakRetained translationAlertController:self validateTargetLocale:v8 completionHandler:v9];
          objc_destroyWeak(&v10);
          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v16 count:16];
      }
      while (v5);
    }

    objc_destroyWeak(&location);
  }
}

- (void)_translationAvailabilityDidChange:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __79___SFTranslationTargetLocaleAlertController__translationAvailabilityDidChange___block_invoke;
  v6[3] = &unk_1E5C72238;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

- (void)translationAlertController:(id)a3 didSelectLocale:(id)a4
{
  id v6 = a4;
  if ([v6 length])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_translationContext);
    [WeakRetained requestTranslatingWebpageToLocale:v6 completionHandler:0];
  }
}

- (void)translationAlertController:(id)a3 validateTargetLocale:(id)a4 completionHandler:(id)a5
{
  p_translationContext = &self->_translationContext;
  id v7 = a5;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_translationContext);
  [WeakRetained validateTargetLocale:v8 completionHandler:v7];
}

- (_SFTranslationTargetLocaleAlertControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_SFTranslationTargetLocaleAlertControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (id)analyticsHandler
{
  return self->_analyticsHandler;
}

- (void)setAnalyticsHandler:(id)a3
{
}

- (NSMutableDictionary)localeIdentifierToAlertActionMap
{
  return self->_localeIdentifierToAlertActionMap;
}

- (void)setLocaleIdentifierToAlertActionMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localeIdentifierToAlertActionMap, 0);
  objc_storeStrong(&self->_analyticsHandler, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_destroyWeak((id *)&self->_translationContext);
}

@end