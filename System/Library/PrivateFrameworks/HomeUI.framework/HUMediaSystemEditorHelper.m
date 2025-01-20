@interface HUMediaSystemEditorHelper
- (HFMediaSystemBuilder)mediaSystemBuilder;
- (HUMediaSystemEditorHelper)initWithDelegate:(id)a3;
- (HUMediaSystemEditorHelperDelegate)delegate;
- (NAFuture)accountArbitrationFuture;
- (NAFuture)inFlightCommitFuture;
- (id)_authKitContextGenerator;
- (id)_checkIfAccessoriesNeedSoftwareUpdateToSupportPairing;
- (id)_executeAppleMusicAccountReconcilationForMediaSystemBuilder:(id)a3;
- (id)_executePreferredMediaUserReconcilationForMediaSystemBuilder:(id)a3;
- (id)_promptForRoomChange;
- (id)createMediaSystem;
- (id)createMediaSystemWithAccessory:(id)a3;
- (void)_configureMediaSystemBuilderToMoveHomePodsToRoom:(id)a3;
- (void)setAccountArbitrationFuture:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInFlightCommitFuture:(id)a3;
@end

@implementation HUMediaSystemEditorHelper

- (HUMediaSystemEditorHelper)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HUMediaSystemEditorHelper;
  v5 = [(HUMediaSystemEditorHelper *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (HFMediaSystemBuilder)mediaSystemBuilder
{
  v2 = [(HUMediaSystemEditorHelper *)self delegate];
  v3 = [v2 mediaSystemBuilder];

  return (HFMediaSystemBuilder *)v3;
}

- (id)createMediaSystemWithAccessory:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [(HUMediaSystemEditorHelper *)self inFlightCommitFuture];
  if (v6
    && (v7 = (void *)v6,
        [(HUMediaSystemEditorHelper *)self inFlightCommitFuture],
        objc_super v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = [v8 isFinished],
        v8,
        v7,
        (v9 & 1) == 0))
  {
    v22 = HFLogForCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      v31 = v23;
      _os_log_impl(&dword_1BE345000, v22, OS_LOG_TYPE_INFO, "Skipping '%@'; createNewMediaSystem already in progress.",
        buf,
        0xCu);
    }
    v21 = 0;
  }
  else
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v10 = [(HUMediaSystemEditorHelper *)self mediaSystemBuilder];
    v11 = [v10 accessories];

    uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v26 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          v17 = [(HUMediaSystemEditorHelper *)self mediaSystemBuilder];
          v18 = [v17 firstSetupSourceAccessory];

          if (v16 != v18)
          {
            v19 = [(HUMediaSystemEditorHelper *)self mediaSystemBuilder];
            [v19 removeAccessory:v16];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v13);
    }

    v20 = [(HUMediaSystemEditorHelper *)self mediaSystemBuilder];
    [v20 addAccessory:v5];

    v21 = [(HUMediaSystemEditorHelper *)self createMediaSystem];
  }

  return v21;
}

- (id)createMediaSystem
{
  uint64_t v3 = [(HUMediaSystemEditorHelper *)self inFlightCommitFuture];
  if (v3
    && (id v4 = (void *)v3,
        [(HUMediaSystemEditorHelper *)self inFlightCommitFuture],
        id v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v5 isFinished],
        v5,
        v4,
        (v6 & 1) == 0))
  {
    v17 = [(HUMediaSystemEditorHelper *)self inFlightCommitFuture];
  }
  else
  {
    v7 = [(HUMediaSystemEditorHelper *)self delegate];
    [v7 mediaSystemEditorHelperDidBeginCommitting:self];

    objc_super v8 = [(HUMediaSystemEditorHelper *)self mediaSystemBuilder];
    objc_initWeak(&location, self);
    char v9 = [(HUMediaSystemEditorHelper *)self _checkIfAccessoriesNeedSoftwareUpdateToSupportPairing];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __46__HUMediaSystemEditorHelper_createMediaSystem__block_invoke;
    v29[3] = &unk_1E638C540;
    v29[4] = self;
    v10 = [v9 flatMap:v29];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __46__HUMediaSystemEditorHelper_createMediaSystem__block_invoke_2;
    v27[3] = &unk_1E638BAA8;
    v27[4] = self;
    id v11 = v8;
    id v28 = v11;
    uint64_t v12 = [v10 flatMap:v27];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __46__HUMediaSystemEditorHelper_createMediaSystem__block_invoke_3;
    v26[3] = &unk_1E6388A88;
    v26[4] = self;
    uint64_t v13 = [v12 flatMap:v26];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __46__HUMediaSystemEditorHelper_createMediaSystem__block_invoke_4;
    v24[3] = &unk_1E638BAA8;
    v24[4] = self;
    id v14 = v11;
    id v25 = v14;
    v15 = [v13 flatMap:v24];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __46__HUMediaSystemEditorHelper_createMediaSystem__block_invoke_5;
    v22[3] = &unk_1E6388A88;
    id v16 = v14;
    id v23 = v16;
    v17 = [v15 flatMap:v22];

    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __46__HUMediaSystemEditorHelper_createMediaSystem__block_invoke_6;
    v20[3] = &unk_1E63867B0;
    objc_copyWeak(&v21, &location);
    id v18 = (id)[v17 addCompletionBlock:v20];
    [(HUMediaSystemEditorHelper *)self setInFlightCommitFuture:v17];
    objc_destroyWeak(&v21);

    objc_destroyWeak(&location);
  }

  return v17;
}

uint64_t __46__HUMediaSystemEditorHelper_createMediaSystem__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _promptForRoomChange];
}

uint64_t __46__HUMediaSystemEditorHelper_createMediaSystem__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _executeAppleMusicAccountReconcilationForMediaSystemBuilder:*(void *)(a1 + 40)];
}

id __46__HUMediaSystemEditorHelper_createMediaSystem__block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) accountArbitrationFuture];

  if (v2) {
    [*(id *)(a1 + 32) accountArbitrationFuture];
  }
  else {
  uint64_t v3 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }

  return v3;
}

uint64_t __46__HUMediaSystemEditorHelper_createMediaSystem__block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _executePreferredMediaUserReconcilationForMediaSystemBuilder:*(void *)(a1 + 40)];
}

uint64_t __46__HUMediaSystemEditorHelper_createMediaSystem__block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) commitItem];
}

void __46__HUMediaSystemEditorHelper_createMediaSystem__block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setInFlightCommitFuture:0];
  char v9 = [MEMORY[0x1E4F7A0F0] mainThreadScheduler];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __46__HUMediaSystemEditorHelper_createMediaSystem__block_invoke_7;
  v10[3] = &unk_1E63862A0;
  objc_copyWeak(&v11, v7);
  [v9 performBlock:v10];

  objc_destroyWeak(&v11);
}

void __46__HUMediaSystemEditorHelper_createMediaSystem__block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained delegate];
  [v1 mediaSystemEditorHelperDidEndCommitting:WeakRetained];
}

- (id)_promptForRoomChange
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v24 = (id)objc_opt_new();
  v20 = [(HUMediaSystemEditorHelper *)self mediaSystemBuilder];
  uint64_t v3 = [v20 accessories];
  id v21 = objc_msgSend(v3, "na_map:", &__block_literal_global_139);

  if ([v21 count] == 1)
  {
    id v4 = [v21 anyObject];
    [v24 finishWithResult:v4];
  }
  else
  {
    objc_initWeak(&location, self);
    v19 = _HULocalizedStringWithDefaultValue(@"HUMediaSystemEditorGridViewControllerRoomChangeAlertTitle", @"HUMediaSystemEditorGridViewControllerRoomChangeAlertTitle", 1);
    id v23 = objc_msgSend(MEMORY[0x1E4F42728], "alertControllerWithTitle:message:preferredStyle:");
    id v5 = [v21 allObjects];
    id v6 = [v5 sortedArrayUsingComparator:&__block_literal_global_10_0];

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id obj = v6;
    uint64_t v7 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v31 != v8) {
            objc_enumerationMutation(obj);
          }
          v10 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          id v11 = (void *)MEMORY[0x1E4F42720];
          uint64_t v12 = [v10 name];
          v27[0] = MEMORY[0x1E4F143A8];
          v27[1] = 3221225472;
          v27[2] = __49__HUMediaSystemEditorHelper__promptForRoomChange__block_invoke_3;
          v27[3] = &unk_1E6389218;
          objc_copyWeak(&v29, &location);
          v27[4] = v10;
          id v28 = v24;
          uint64_t v13 = [v11 actionWithTitle:v12 style:0 handler:v27];
          [v23 addAction:v13];

          objc_destroyWeak(&v29);
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
      }
      while (v7);
    }

    id v14 = (void *)MEMORY[0x1E4F42720];
    v15 = _HULocalizedStringWithDefaultValue(@"HUAlertCancel", @"HUAlertCancel", 1);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __49__HUMediaSystemEditorHelper__promptForRoomChange__block_invoke_4;
    v25[3] = &unk_1E6385188;
    id v26 = v24;
    id v16 = [v14 actionWithTitle:v15 style:1 handler:v25];
    [v23 addAction:v16];

    v17 = [(HUMediaSystemEditorHelper *)self delegate];
    [v17 mediaSystemEditorHelper:self needsToPresentViewController:v23 animated:1 completion:0];

    objc_destroyWeak(&location);
  }

  return v24;
}

uint64_t __49__HUMediaSystemEditorHelper__promptForRoomChange__block_invoke(uint64_t a1, void *a2)
{
  return [a2 room];
}

uint64_t __49__HUMediaSystemEditorHelper__promptForRoomChange__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 name];
  id v6 = [v4 name];

  uint64_t v7 = [v5 localizedStandardCompare:v6];
  return v7;
}

void __49__HUMediaSystemEditorHelper__promptForRoomChange__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _configureMediaSystemBuilderToMoveHomePodsToRoom:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) finishWithResult:*(void *)(a1 + 32)];
}

void __49__HUMediaSystemEditorHelper__promptForRoomChange__block_invoke_4(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "na_cancelledError");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 finishWithError:v2];
}

- (void)_configureMediaSystemBuilderToMoveHomePodsToRoom:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F69478];
  id v5 = a3;
  id v6 = [v4 alloc];
  uint64_t v7 = [v5 home];
  uint64_t v8 = (void *)[v6 initWithExistingObject:v5 inHome:v7];

  char v9 = [(HUMediaSystemEditorHelper *)self mediaSystemBuilder];
  [v9 setRoom:v8];

  id v11 = [(HUMediaSystemEditorHelper *)self delegate];
  v10 = [(HUMediaSystemEditorHelper *)self mediaSystemBuilder];
  [v11 mediaSystemEditorHelper:self didModifyMediaSystemBuilder:v10];
}

- (id)_executePreferredMediaUserReconcilationForMediaSystemBuilder:(id)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(HUMediaSystemEditorHelper *)self mediaSystemBuilder];
  id v6 = [v5 accessories];

  uint64_t v7 = objc_opt_new();
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v60 objects:v65 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v61;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v61 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = [*(id *)(*((void *)&v60 + 1) + 8 * i) preferredMediaUser];
        objc_msgSend(v7, "na_safeAddObject:", v13);
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v60 objects:v65 count:16];
    }
    while (v10);
  }

  if (objc_msgSend(v7, "hmf_isEmpty"))
  {
    id v14 = (void *)MEMORY[0x1E4F7A0D8];
LABEL_21:
    v17 = [v14 futureWithNoResult];
    goto LABEL_22;
  }
  if ([v7 count] == 1)
  {
    v15 = (void *)MEMORY[0x1E4F7A0D8];
    id v16 = [v7 anyObject];
    v17 = [v15 futureWithResult:v16];

    goto LABEL_22;
  }
  uint64_t v18 = [v7 count];
  uint64_t v19 = [v8 count];
  id v14 = (void *)MEMORY[0x1E4F7A0D8];
  if (v18 != v19) {
    goto LABEL_21;
  }
  v41 = self;
  v42 = v4;
  v44 = objc_opt_new();
  v40 = objc_opt_new();
  v20 = (void *)MEMORY[0x1E4F42728];
  id v21 = _HULocalizedStringWithDefaultValue(@"HUMediaSystemEditorViewControllerPrimaryUserSelectionAlertTitle", @"HUMediaSystemEditorViewControllerPrimaryUserSelectionAlertTitle", 1);
  v22 = [v20 alertControllerWithTitle:v21 message:0 preferredStyle:1];

  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id obj = v7;
  uint64_t v23 = [obj countByEnumeratingWithState:&v56 objects:v64 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v57;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v57 != v25) {
          objc_enumerationMutation(obj);
        }
        long long v27 = *(void **)(*((void *)&v56 + 1) + 8 * j);
        id v28 = (void *)MEMORY[0x1E4F42720];
        id v29 = objc_msgSend(v27, "name", v40);
        v53[0] = MEMORY[0x1E4F143A8];
        v53[1] = 3221225472;
        v53[2] = __90__HUMediaSystemEditorHelper__executePreferredMediaUserReconcilationForMediaSystemBuilder___block_invoke;
        v53[3] = &unk_1E6389708;
        id v54 = v44;
        v55 = v27;
        long long v30 = [v28 actionWithTitle:v29 style:0 handler:v53];
        [v22 addAction:v30];
      }
      uint64_t v24 = [obj countByEnumeratingWithState:&v56 objects:v64 count:16];
    }
    while (v24);
  }

  long long v31 = (void *)MEMORY[0x1E4F42720];
  long long v32 = _HULocalizedStringWithDefaultValue(@"HUAlertCancel", @"HUAlertCancel", 1);
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __90__HUMediaSystemEditorHelper__executePreferredMediaUserReconcilationForMediaSystemBuilder___block_invoke_2;
  v51[3] = &unk_1E6385188;
  id v33 = v44;
  id v52 = v33;
  v34 = [v31 actionWithTitle:v32 style:1 handler:v51];
  [v22 addAction:v34];

  v35 = [(HUMediaSystemEditorHelper *)v41 delegate];
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __90__HUMediaSystemEditorHelper__executePreferredMediaUserReconcilationForMediaSystemBuilder___block_invoke_3;
  v49[3] = &unk_1E6386018;
  id v36 = v40;
  id v50 = v36;
  [v35 mediaSystemEditorHelper:v41 needsToPresentViewController:v22 animated:1 completion:v49];

  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __90__HUMediaSystemEditorHelper__executePreferredMediaUserReconcilationForMediaSystemBuilder___block_invoke_4;
  v45[3] = &unk_1E638C590;
  id v4 = v42;
  id v46 = v42;
  id v47 = v33;
  id v48 = v36;
  id v37 = v36;
  id v38 = v33;
  v17 = [v38 flatMap:v45];

LABEL_22:

  return v17;
}

uint64_t __90__HUMediaSystemEditorHelper__executePreferredMediaUserReconcilationForMediaSystemBuilder___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithResult:*(void *)(a1 + 40)];
}

void __90__HUMediaSystemEditorHelper__executePreferredMediaUserReconcilationForMediaSystemBuilder___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "na_cancelledError");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 finishWithError:v2];
}

uint64_t __90__HUMediaSystemEditorHelper__executePreferredMediaUserReconcilationForMediaSystemBuilder___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithNoResult];
}

id __90__HUMediaSystemEditorHelper__executePreferredMediaUserReconcilationForMediaSystemBuilder___block_invoke_4(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setPreferredMediaUser:a2];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __90__HUMediaSystemEditorHelper__executePreferredMediaUserReconcilationForMediaSystemBuilder___block_invoke_5;
  v6[3] = &unk_1E638C568;
  uint64_t v3 = *(void **)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  id v4 = [v3 flatMap:v6];

  return v4;
}

id __90__HUMediaSystemEditorHelper__executePreferredMediaUserReconcilationForMediaSystemBuilder___block_invoke_5(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)_executeAppleMusicAccountReconcilationForMediaSystemBuilder:(id)a3
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v37 = a3;
  uint64_t v3 = [(HUMediaSystemEditorHelper *)self mediaSystemBuilder];
  id v38 = [v3 accessories];

  int v4 = objc_msgSend(v38, "na_all:", &__block_literal_global_25_2);
  id v5 = objc_msgSend(v38, "na_map:", &__block_literal_global_27_0);
  id v6 = objc_opt_new();
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v61 objects:v66 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v62;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v62 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void **)(*((void *)&v61 + 1) + 8 * i);
        uint64_t v12 = [v11 username];
        [v6 setObject:v11 forKey:v12];
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v61 objects:v66 count:16];
    }
    while (v8);
  }

  uint64_t v13 = (void *)MEMORY[0x1E4F1CAD0];
  id v14 = [v6 allValues];
  v39 = [v13 setWithArray:v14];

  if ([v39 count])
  {
    if ([v39 count] == 1) {
      int v15 = v4;
    }
    else {
      int v15 = 0;
    }
    id v16 = (void *)MEMORY[0x1E4F7A0D8];
    if (v15 == 1)
    {
      v17 = [v39 anyObject];
      uint64_t v18 = [v16 futureWithResult:v17];
    }
    else
    {
      v41 = objc_opt_new();
      v35 = objc_opt_new();
      if (v4)
      {
        uint64_t v19 = (void *)MEMORY[0x1E4F42728];
        v20 = _HULocalizedStringWithDefaultValue(@"HUMediaSystemEditorViewControllerAccountSelectionAlertTitle", @"HUMediaSystemEditorViewControllerAccountSelectionAlertTitle", 1);
        v42 = [v19 alertControllerWithTitle:v20 message:0 preferredStyle:1];

        long long v59 = 0u;
        long long v60 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        id obj = v39;
        uint64_t v21 = [obj countByEnumeratingWithState:&v57 objects:v65 count:16];
        if (v21)
        {
          uint64_t v22 = *(void *)v58;
          do
          {
            for (uint64_t j = 0; j != v21; ++j)
            {
              if (*(void *)v58 != v22) {
                objc_enumerationMutation(obj);
              }
              uint64_t v24 = *(void **)(*((void *)&v57 + 1) + 8 * j);
              uint64_t v25 = (void *)MEMORY[0x1E4F42720];
              id v26 = objc_msgSend(v24, "username", v35);
              v54[0] = MEMORY[0x1E4F143A8];
              v54[1] = 3221225472;
              v54[2] = __89__HUMediaSystemEditorHelper__executeAppleMusicAccountReconcilationForMediaSystemBuilder___block_invoke_3;
              v54[3] = &unk_1E6389708;
              id v55 = v41;
              long long v56 = v24;
              long long v27 = [v25 actionWithTitle:v26 style:0 handler:v54];
              [v42 addAction:v27];
            }
            uint64_t v21 = [obj countByEnumeratingWithState:&v57 objects:v65 count:16];
          }
          while (v21);
        }

        id v28 = (void *)MEMORY[0x1E4F42720];
        id v29 = _HULocalizedStringWithDefaultValue(@"HUAlertCancel", @"HUAlertCancel", 1);
        v52[0] = MEMORY[0x1E4F143A8];
        v52[1] = 3221225472;
        v52[2] = __89__HUMediaSystemEditorHelper__executeAppleMusicAccountReconcilationForMediaSystemBuilder___block_invoke_4;
        v52[3] = &unk_1E6385188;
        id v53 = v41;
        long long v30 = [v28 actionWithTitle:v29 style:1 handler:v52];
        [v42 addAction:v30];

        long long v31 = [(HUMediaSystemEditorHelper *)self delegate];
        v50[0] = MEMORY[0x1E4F143A8];
        v50[1] = 3221225472;
        v50[2] = __89__HUMediaSystemEditorHelper__executeAppleMusicAccountReconcilationForMediaSystemBuilder___block_invoke_5;
        v50[3] = &unk_1E6386018;
        id v51 = v35;
        [v31 mediaSystemEditorHelper:self needsToPresentViewController:v42 animated:1 completion:v50];
      }
      else
      {
        [v35 finishWithNoResult];
        v42 = [v39 anyObject];
        [v41 finishWithResult:v42];
      }

      objc_initWeak(&location, self);
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __89__HUMediaSystemEditorHelper__executeAppleMusicAccountReconcilationForMediaSystemBuilder___block_invoke_6;
      v43[3] = &unk_1E638C5E0;
      objc_copyWeak(&v48, &location);
      id v44 = v38;
      id v45 = v37;
      id v32 = v41;
      id v46 = v32;
      id v33 = v35;
      id v47 = v33;
      uint64_t v18 = [v32 flatMap:v43];

      objc_destroyWeak(&v48);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    uint64_t v18 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }

  return v18;
}

BOOL __89__HUMediaSystemEditorHelper__executeAppleMusicAccountReconcilationForMediaSystemBuilder___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 remoteLoginHandler];
  uint64_t v3 = [v2 loggedInAccount];
  BOOL v4 = v3 != 0;

  return v4;
}

id __89__HUMediaSystemEditorHelper__executeAppleMusicAccountReconcilationForMediaSystemBuilder___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 remoteLoginHandler];
  uint64_t v3 = [v2 loggedInAccount];

  return v3;
}

uint64_t __89__HUMediaSystemEditorHelper__executeAppleMusicAccountReconcilationForMediaSystemBuilder___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithResult:*(void *)(a1 + 40)];
}

void __89__HUMediaSystemEditorHelper__executeAppleMusicAccountReconcilationForMediaSystemBuilder___block_invoke_4(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "na_cancelledError");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 finishWithError:v2];
}

uint64_t __89__HUMediaSystemEditorHelper__executeAppleMusicAccountReconcilationForMediaSystemBuilder___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithNoResult];
}

id __89__HUMediaSystemEditorHelper__executeAppleMusicAccountReconcilationForMediaSystemBuilder___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v3 = (id *)(a1 + 64);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  id v6 = objc_alloc(MEMORY[0x1E4F68EF0]);
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = [WeakRetained _authKitContextGenerator];
  uint64_t v9 = (void *)[v6 initWithAccessories:v7 account:v4 contextGenerator:v8];

  [*(id *)(a1 + 40) setAccountArbitrator:v9];
  uint64_t v10 = [v9 pendingArbitrationExecutionFuture];
  [WeakRetained setAccountArbitrationFuture:v10];

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __89__HUMediaSystemEditorHelper__executeAppleMusicAccountReconcilationForMediaSystemBuilder___block_invoke_7;
  v14[3] = &unk_1E638C5B8;
  uint64_t v11 = *(void **)(a1 + 48);
  id v15 = *(id *)(a1 + 56);
  uint64_t v12 = [v11 flatMap:v14];

  return v12;
}

id __89__HUMediaSystemEditorHelper__executeAppleMusicAccountReconcilationForMediaSystemBuilder___block_invoke_7(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)_authKitContextGenerator
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__HUMediaSystemEditorHelper__authKitContextGenerator__block_invoke;
  aBlock[3] = &unk_1E638C630;
  aBlock[4] = self;
  id v2 = _Block_copy(aBlock);

  return v2;
}

id __53__HUMediaSystemEditorHelper__authKitContextGenerator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = [a2 remoteLoginHandler];
  uint64_t v7 = objc_msgSend(v6, "hu_appleMusicInAppAuthenticationContext");
  uint64_t v8 = [MEMORY[0x1E4F7A0F0] mainThreadScheduler];
  uint64_t v9 = [v7 reschedule:v8];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __53__HUMediaSystemEditorHelper__authKitContextGenerator__block_invoke_2;
  v14[3] = &unk_1E638C608;
  uint64_t v10 = *(void *)(a1 + 32);
  id v15 = v5;
  uint64_t v16 = v10;
  id v11 = v5;
  uint64_t v12 = [v9 flatMap:v14];

  return v12;
}

id __53__HUMediaSystemEditorHelper__authKitContextGenerator__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _HULocalizedStringWithDefaultValue(@"HUAppleMusicPromptTitle", @"HUAppleMusicPromptTitle", 1);
  [v3 setTitle:v4];

  id v5 = *(void **)(a1 + 32);
  if (v5)
  {
    id v6 = [v5 username];
    [v3 setUsername:v6];

    [v3 setIsUsernameEditable:0];
    uint64_t v7 = _HULocalizedStringWithDefaultValue(@"HUAppleMusicPromptReason", @"HUAppleMusicPromptReason", 1);
    uint64_t v8 = [*(id *)(a1 + 32) username];
    uint64_t v9 = [v7 stringByAppendingFormat:@"\n\n%@", v8];
    [v3 setReason:v9];
  }
  else
  {
    uint64_t v7 = _HULocalizedStringWithDefaultValue(@"HUAppleMusicPromptReason", @"HUAppleMusicPromptReason", 1);
    [v3 setReason:v7];
  }

  uint64_t v10 = [*(id *)(a1 + 40) delegate];
  id v11 = [v10 mediaSystemHelperPresentingViewController];
  [v3 setPresentingViewController:v11];

  uint64_t v12 = [MEMORY[0x1E4F7A0D8] futureWithResult:v3];

  return v12;
}

- (id)_checkIfAccessoriesNeedSoftwareUpdateToSupportPairing
{
  id v3 = [(HUMediaSystemEditorHelper *)self mediaSystemBuilder];
  id v4 = [v3 accessories];
  id v5 = objc_msgSend(v4, "na_filter:", &__block_literal_global_47_0);

  if ([v5 count])
  {
    id v6 = [(HUMediaSystemEditorHelper *)self mediaSystemBuilder];
    uint64_t v7 = [v6 firstSetupSourceAccessory];

    uint64_t v8 = [(HUMediaSystemEditorHelper *)self mediaSystemBuilder];
    uint64_t v9 = [v8 accessories];
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CAD0], "na_setWithSafeObject:", v7);
    id v11 = objc_msgSend(v9, "na_setByRemovingObjectsFromSet:", v10);
    uint64_t v12 = [v11 anyObject];

    if (objc_msgSend(v7, "hf_needsSoftwareUpdateToSupportBeingAddedToMediaSystem")) {
      uint64_t v13 = v7;
    }
    else {
      uint64_t v13 = v12;
    }
    id v14 = v13;
    id v15 = objc_opt_new();
    uint64_t v16 = (void *)MEMORY[0x1E4F42728];
    v17 = _HULocalizedStringWithDefaultValue(@"HUMediaAccessoryAudioSettingsViewControllerOTAUpdateRequiredTitle", @"HUMediaAccessoryAudioSettingsViewControllerOTAUpdateRequiredTitle", 1);
    uint64_t v18 = _HULocalizedStringWithDefaultValue(@"HUMediaAccessoryAudioSettingsViewControllerOTAUpdateRequiredMessage", @"HUMediaAccessoryAudioSettingsViewControllerOTAUpdateRequiredMessage", 1);
    uint64_t v19 = [v16 alertControllerWithTitle:v17 message:v18 preferredStyle:1];

    v20 = (void *)MEMORY[0x1E4F42720];
    uint64_t v21 = _HULocalizedStringWithDefaultValue(@"HUMediaAccessoryAudioSettingsViewControllerOTAUpdateRequiredUpdateButton", @"HUMediaAccessoryAudioSettingsViewControllerOTAUpdateRequiredUpdateButton", 1);
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __82__HUMediaSystemEditorHelper__checkIfAccessoriesNeedSoftwareUpdateToSupportPairing__block_invoke_2;
    v37[3] = &unk_1E6385188;
    id v22 = v15;
    id v38 = v22;
    uint64_t v23 = [v20 actionWithTitle:v21 style:0 handler:v37];
    [v19 addAction:v23];

    uint64_t v24 = (void *)MEMORY[0x1E4F42720];
    uint64_t v25 = _HULocalizedStringWithDefaultValue(@"HUMediaAccessoryAudioSettingsViewControllerOTAUpdateRequiredCancelButton", @"HUMediaAccessoryAudioSettingsViewControllerOTAUpdateRequiredCancelButton", 1);
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __82__HUMediaSystemEditorHelper__checkIfAccessoriesNeedSoftwareUpdateToSupportPairing__block_invoke_3;
    v35[3] = &unk_1E6385188;
    id v36 = v22;
    id v26 = v22;
    long long v27 = [v24 actionWithTitle:v25 style:1 handler:v35];
    [v19 addAction:v27];

    id v28 = [(HUMediaSystemEditorHelper *)self delegate];
    [v28 mediaSystemEditorHelper:self needsToPresentViewController:v19 animated:1 completion:0];

    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __82__HUMediaSystemEditorHelper__checkIfAccessoriesNeedSoftwareUpdateToSupportPairing__block_invoke_4;
    v32[3] = &unk_1E638AEC0;
    id v33 = v14;
    v34 = self;
    id v29 = v14;
    long long v30 = [v26 flatMap:v32];
  }
  else
  {
    long long v30 = [MEMORY[0x1E4F7A0D8] futureWithResult:MEMORY[0x1E4F1CC28]];
  }

  return v30;
}

uint64_t __82__HUMediaSystemEditorHelper__checkIfAccessoriesNeedSoftwareUpdateToSupportPairing__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_needsSoftwareUpdateToSupportBeingAddedToMediaSystem");
}

uint64_t __82__HUMediaSystemEditorHelper__checkIfAccessoriesNeedSoftwareUpdateToSupportPairing__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishWithResult:MEMORY[0x1E4F1CC38]];
}

void __82__HUMediaSystemEditorHelper__checkIfAccessoriesNeedSoftwareUpdateToSupportPairing__block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "na_cancelledError");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 finishWithError:v2];
}

id __82__HUMediaSystemEditorHelper__checkIfAccessoriesNeedSoftwareUpdateToSupportPairing__block_invoke_4(uint64_t a1, void *a2)
{
  if (([a2 BOOLValue] & 1) == 0) {
    goto LABEL_4;
  }
  if (*(void *)(a1 + 32))
  {
    id v3 = [*(id *)(a1 + 40) delegate];
    [v3 mediaSystemEditorHelper:*(void *)(a1 + 40) didAbortForAccessoryNeedingUpdate:*(void *)(a1 + 32)];

LABEL_4:
    id v4 = (void *)MEMORY[0x1E4F7A0D8];
    id v5 = objc_msgSend(MEMORY[0x1E4F28C58], "na_cancelledError");
    id v6 = [v4 futureWithError:v5];

    goto LABEL_6;
  }
  id v6 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
LABEL_6:

  return v6;
}

- (HUMediaSystemEditorHelperDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUMediaSystemEditorHelperDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NAFuture)inFlightCommitFuture
{
  return self->_inFlightCommitFuture;
}

- (void)setInFlightCommitFuture:(id)a3
{
}

- (NAFuture)accountArbitrationFuture
{
  return self->_accountArbitrationFuture;
}

- (void)setAccountArbitrationFuture:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountArbitrationFuture, 0);
  objc_storeStrong((id *)&self->_inFlightCommitFuture, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end