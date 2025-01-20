@interface HUFeatureOnboarder
- (BOOL)hasPerformedPostProcessing;
- (BOOL)restart;
- (HUConfigurationViewController)_currentViewControllerForTests;
- (HUFeatureOnboarder)initWithFeatures:(id)a3 usageOptions:(id)a4;
- (HUFeatureOnboarder)initWithGroupedFeatures:(id)a3 usageOptions:(id)a4;
- (HUFeatureOnboardingConfigurator)configurator;
- (NAFuture)completionFuture;
- (NSDictionary)initialUsageOptions;
- (NSMutableArray)allRemainingFlowGroups;
- (NSMutableDictionary)userInputResults;
- (UINavigationController)navController;
- (id)_findNextAppropriateFlowByRemovingFlow:(id)a3 currentOnboardingFlowClass:(Class)a4 usageOptions:(id)a5;
- (id)_subclass_buildAllFlowGroupsFromFeatureGroups:(id)a3 usageOptions:(id)a4;
- (id)getNextViewControllerForOnboardingInput:(id)a3 currentOnboardingFlowClass:(Class)a4;
- (id)getPostProcessingFlowsForResults:(id)a3;
- (void)_skipAnyFlowsNoLongerRequired;
- (void)configuratorDidFinish:(id)a3;
- (void)configuratorDidUpdateViewController:(id)a3;
- (void)restartCurrentOnboarding;
- (void)setAllRemainingFlowGroups:(id)a3;
- (void)setCompletionFuture:(id)a3;
- (void)setConfigurator:(id)a3;
- (void)setHasPerformedPostProcessing:(BOOL)a3;
- (void)setInitialUsageOptions:(id)a3;
- (void)setNavController:(id)a3;
- (void)setRestart:(BOOL)a3;
- (void)setUserInputResults:(id)a3;
- (void)set_currentViewControllerForTests:(id)a3;
- (void)startOnboardingWithPresentingViewController:(id)a3 usageOptions:(id)a4;
@end

@implementation HUFeatureOnboarder

- (HUFeatureOnboarder)initWithFeatures:(id)a3 usageOptions:(id)a4
{
  v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a4;
  v8 = [v6 arrayWithObject:a3];
  v9 = [(HUFeatureOnboarder *)self initWithGroupedFeatures:v8 usageOptions:v7];

  return v9;
}

- (HUFeatureOnboarder)initWithGroupedFeatures:(id)a3 usageOptions:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (![v7 count])
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"HUFeatureOnboarder.m", 95, @"Invalid parameter not satisfying: %@", @"featureGroups.count != 0" object file lineNumber description];
  }
  v22.receiver = self;
  v22.super_class = (Class)HUFeatureOnboarder;
  v9 = [(HUFeatureOnboarder *)&v22 init];
  if (v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CA60] dictionary];
    userInputResults = v9->_userInputResults;
    v9->_userInputResults = (NSMutableDictionary *)v10;

    objc_storeStrong((id *)&v9->_initialUsageOptions, a4);
    uint64_t v12 = [(HUFeatureOnboarder *)v9 _subclass_buildAllFlowGroupsFromFeatureGroups:v7 usageOptions:v9->_initialUsageOptions];
    allRemainingFlowGroups = v9->_allRemainingFlowGroups;
    v9->_allRemainingFlowGroups = (NSMutableArray *)v12;

    v14 = [(HUFeatureOnboarder *)v9 allRemainingFlowGroups];
    uint64_t v15 = [v14 count];

    if (!v15)
    {
      v21 = [MEMORY[0x1E4F28B00] currentHandler];
      [v21 handleFailureInMethod:a2, v9, @"HUFeatureOnboarder.m", 106, @"Invalid parameter not satisfying: %@", @"self.allRemainingFlowGroups.count != 0" object file lineNumber description];
    }
    v16 = (NAFuture *)objc_alloc_init(MEMORY[0x1E4F7A0D8]);
    completionFuture = v9->_completionFuture;
    v9->_completionFuture = v16;

    if (([MEMORY[0x1E4F69758] isInternalTest] & 1) == 0)
    {
      id v18 = objc_alloc_init(MEMORY[0x1E4F42BF8]);
      [(HUFeatureOnboarder *)v9 setNavController:v18];
    }
  }

  return v9;
}

- (id)_subclass_buildAllFlowGroupsFromFeatureGroups:(id)a3 usageOptions:(id)a4
{
  v6 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  [v6 handleFailureInMethod:a2, self, @"HUFeatureOnboarder.m", 124, @"%s is an abstract method that must be overriden by subclass %@", "-[HUFeatureOnboarder _subclass_buildAllFlowGroupsFromFeatureGroups:usageOptions:]", objc_opt_class() object file lineNumber description];

  return 0;
}

- (id)getPostProcessingFlowsForResults:(id)a3
{
  return 0;
}

- (void)startOnboardingWithPresentingViewController:(id)a3 usageOptions:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7 && ([MEMORY[0x1E4F69758] isInternalTest] & 1) == 0)
  {
    uint64_t v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"HUFeatureOnboarder.m", 138, @"Invalid parameter not satisfying: %@", @"presentingViewController != nil || [HFUtilities isInternalTest]" object file lineNumber description];

    if (!v8) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  if (v8) {
LABEL_4:
  }
    [(HUFeatureOnboarder *)self setInitialUsageOptions:v8];
LABEL_5:
  objc_initWeak(&location, self);
  v9 = [(HUFeatureOnboarder *)self _findNextAppropriateFlowByRemovingFlow:0 currentOnboardingFlowClass:0 usageOptions:v8];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __79__HUFeatureOnboarder_startOnboardingWithPresentingViewController_usageOptions___block_invoke;
  v13[3] = &unk_1E6387B88;
  objc_copyWeak(v15, &location);
  v15[1] = (id)a2;
  id v10 = v7;
  id v14 = v10;
  id v11 = (id)[v9 addCompletionBlock:v13];

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
}

void __79__HUFeatureOnboarder_startOnboardingWithPresentingViewController_usageOptions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = v3;
  v6 = &unk_1F19F1A10;
  if ([v5 conformsToProtocol:v6]) {
    id v7 = v5;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  v9 = HFLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = NSStringFromSelector(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 138412802;
    id v33 = WeakRetained;
    __int16 v34 = 2112;
    v35 = v10;
    __int16 v36 = 2112;
    id v37 = v8;
    _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "%@:%@: Current Flow: %@", buf, 0x20u);
  }
  if (!v8)
  {
    v24 = HFLogForCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = NSStringFromSelector(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 138412546;
      id v33 = WeakRetained;
      __int16 v34 = 2112;
      v35 = v25;
      _os_log_impl(&dword_1BE345000, v24, OS_LOG_TYPE_DEFAULT, "%@:%@: None of the feature onboarding flows have work to do, so finishing", buf, 0x16u);
    }
    v26 = [WeakRetained completionFuture];
    v27 = [WeakRetained userInputResults];
    [v26 finishWithResult:v27];
    goto LABEL_20;
  }
  id v11 = [v8 initialViewController];

  if (!v11)
  {
    v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:*(void *)(a1 + 48), WeakRetained, @"HUFeatureOnboarder.m", 160, @"Invalid parameter not satisfying: %@", @"currentFeatureOnboardingFlow.initialViewController" object file lineNumber description];
  }
  uint64_t v12 = [HUFeatureOnboardingConfigurator alloc];
  v13 = [v8 initialViewController];
  id v14 = [(HUConfigurator *)v12 initWithConfiguratorDelegate:WeakRetained initialViewController:v13];
  [WeakRetained setConfigurator:v14];

  uint64_t v15 = [WeakRetained configurator];
  v16 = [v8 initialViewController];
  [v16 setDelegate:v15];

  v17 = [v8 initialViewController];
  objc_msgSend(WeakRetained, "set_currentViewControllerForTests:", v17);

  id v18 = [WeakRetained navController];

  if (v18)
  {
    v19 = [v8 initialViewController];
    int v20 = [v19 conformsToProtocol:&unk_1F19C09F0];

    v21 = [WeakRetained navController];
    objc_super v22 = [v8 initialViewController];
    if (v20) {
      id v23 = (id)objc_msgSend(v21, "hu_pushPreloadableViewController:animated:", v22, 0);
    }
    else {
      [v21 pushViewController:v22 animated:0];
    }

    if (([MEMORY[0x1E4F69758] isInternalTest] & 1) == 0)
    {
      v28 = *(void **)(a1 + 32);
      v29 = [WeakRetained navController];
      [v28 presentViewController:v29 animated:1 completion:0];
    }
  }
  v26 = HFLogForCategory();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v27 = NSStringFromSelector(*(SEL *)(a1 + 48));
    v30 = [v8 initialViewController];
    *(_DWORD *)buf = 138413058;
    id v33 = WeakRetained;
    __int16 v34 = 2112;
    v35 = v27;
    __int16 v36 = 2112;
    id v37 = v8;
    __int16 v38 = 2112;
    v39 = v30;
    _os_log_impl(&dword_1BE345000, v26, OS_LOG_TYPE_DEFAULT, "%@:%@: Starting feature onboarding with first flow: %@ & view controller %@", buf, 0x2Au);

LABEL_20:
  }
}

- (id)_findNextAppropriateFlowByRemovingFlow:(id)a3 currentOnboardingFlowClass:(Class)a4 usageOptions:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  id v11 = HFLogForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [(HUFeatureOnboarder *)self allRemainingFlowGroups];
    *(_DWORD *)buf = 138412546;
    v32 = v12;
    __int16 v33 = 2112;
    Class v34 = a4;
    _os_log_impl(&dword_1BE345000, v11, OS_LOG_TYPE_DEFAULT, "allRemainingFlowGroups: %@, currentOnboardingFlowClass: %@", buf, 0x16u);
  }
  v13 = [(HUFeatureOnboarder *)self allRemainingFlowGroups];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __101__HUFeatureOnboarder__findNextAppropriateFlowByRemovingFlow_currentOnboardingFlowClass_usageOptions___block_invoke;
  v26[3] = &unk_1E6387C00;
  id v14 = v9;
  id v27 = v14;
  id v15 = v10;
  id v28 = v15;
  v29 = self;
  SEL v30 = a2;
  v16 = objc_msgSend(v13, "na_flatMap:", v26);

  objc_initWeak((id *)buf, self);
  v17 = (void *)MEMORY[0x1E4F7A0D8];
  id v18 = [MEMORY[0x1E4F7A0F0] mainThreadScheduler];
  v19 = [v17 combineAllFutures:v16 ignoringErrors:1 scheduler:v18];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __101__HUFeatureOnboarder__findNextAppropriateFlowByRemovingFlow_currentOnboardingFlowClass_usageOptions___block_invoke_114;
  v23[3] = &unk_1E6387C90;
  objc_copyWeak(v25, (id *)buf);
  v25[1] = a4;
  id v20 = v14;
  id v24 = v20;
  v21 = [v19 flatMap:v23];

  objc_destroyWeak(v25);
  objc_destroyWeak((id *)buf);

  return v21;
}

id __101__HUFeatureOnboarder__findNextAppropriateFlowByRemovingFlow_currentOnboardingFlowClass_usageOptions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 containsObject:*(void *)(a1 + 32)])
  {
    v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __101__HUFeatureOnboarder__findNextAppropriateFlowByRemovingFlow_currentOnboardingFlowClass_usageOptions___block_invoke_2;
    v6[3] = &unk_1E6387BD8;
    id v7 = *(id *)(a1 + 40);
    long long v8 = *(_OWORD *)(a1 + 48);
    v4 = objc_msgSend(v3, "na_map:", v6);
  }

  return v4;
}

id __101__HUFeatureOnboarder__findNextAppropriateFlowByRemovingFlow_currentOnboardingFlowClass_usageOptions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 onboardingFuture];
  char v5 = [v4 isFinished];

  if (v5)
  {
    v6 = 0;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_respondsToSelector())
    {
      id v7 = objc_opt_class();
      long long v8 = [MEMORY[0x1E4F691A0] sharedDispatcher];
      id v9 = [v8 home];
      if (*(void *)(a1 + 32)) {
        uint64_t v10 = *(void *)(a1 + 32);
      }
      else {
        uint64_t v10 = MEMORY[0x1E4F1CC08];
      }
      id v11 = [v7 needsOnboardingForHome:v9 options:v10];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __101__HUFeatureOnboarder__findNextAppropriateFlowByRemovingFlow_currentOnboardingFlowClass_usageOptions___block_invoke_3;
      v18[3] = &unk_1E6387BB0;
      id v12 = v3;
      id v19 = v12;
      long long v20 = *(_OWORD *)(a1 + 40);
      v13 = [v11 flatMap:v18];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      id v15[2] = __101__HUFeatureOnboarder__findNextAppropriateFlowByRemovingFlow_currentOnboardingFlowClass_usageOptions___block_invoke_110;
      v15[3] = &unk_1E6387BB0;
      id v16 = v12;
      long long v17 = *(_OWORD *)(a1 + 40);
      v6 = [v13 flatMap:v15];
    }
    else
    {
      v6 = [MEMORY[0x1E4F7A0D8] futureWithResult:v3];
    }
  }

  return v6;
}

id __101__HUFeatureOnboarder__findNextAppropriateFlowByRemovingFlow_currentOnboardingFlowClass_usageOptions___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([a2 BOOLValue])
  {
    if (objc_opt_respondsToSelector()) {
      [*(id *)(a1 + 32) readyFuture];
    }
    else {
    id v3 = [MEMORY[0x1E4F7A0D8] futureWithResult:MEMORY[0x1E4F1CC38]];
    }
    v4 = HFLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      id v7 = NSStringFromSelector(*(SEL *)(a1 + 48));
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138412802;
      uint64_t v10 = v6;
      __int16 v11 = 2112;
      id v12 = v7;
      __int16 v13 = 2112;
      uint64_t v14 = v8;
      _os_log_debug_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEBUG, "%@:%@ checking if flow is ready %@", (uint8_t *)&v9, 0x20u);
    }
  }
  else
  {
    id v3 = [MEMORY[0x1E4F7A0D8] futureWithResult:MEMORY[0x1E4F1CC28]];
  }

  return v3;
}

id __101__HUFeatureOnboarder__findNextAppropriateFlowByRemovingFlow_currentOnboardingFlowClass_usageOptions___block_invoke_110(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([a2 BOOLValue])
  {
    id v3 = [MEMORY[0x1E4F7A0D8] futureWithResult:*(void *)(a1 + 32)];
  }
  else
  {
    v4 = HFLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      id v7 = NSStringFromSelector(*(SEL *)(a1 + 48));
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138412802;
      uint64_t v10 = v6;
      __int16 v11 = 2112;
      id v12 = v7;
      __int16 v13 = 2112;
      uint64_t v14 = v8;
      _os_log_debug_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEBUG, "%@:%@ skipping flow (either doesn't need onboarding or is not ready): %@", (uint8_t *)&v9, 0x20u);
    }
    id v3 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }

  return v3;
}

id __101__HUFeatureOnboarder__findNextAppropriateFlowByRemovingFlow_currentOnboardingFlowClass_usageOptions___block_invoke_114(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __101__HUFeatureOnboarder__findNextAppropriateFlowByRemovingFlow_currentOnboardingFlowClass_usageOptions___block_invoke_2_115;
  v18[3] = &__block_descriptor_40_e35_B16__0___HUFeatureOnboardingFlow__8lu32l8;
  void v18[4] = *(void *)(a1 + 48);
  char v5 = objc_msgSend(v3, "na_firstObjectPassingTest:", v18);
  if (!v5)
  {
    char v5 = objc_msgSend(v3, "na_firstObjectPassingTest:", &__block_literal_global_51);
  }
  uint64_t v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 48);
    *(_DWORD *)buf = 138412546;
    long long v20 = v5;
    __int16 v21 = 2112;
    uint64_t v22 = v7;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "First unfinished flow: %@ (previous flow %@)", buf, 0x16u);
  }

  if (*(void *)(a1 + 32))
  {
    uint64_t v8 = [WeakRetained allRemainingFlowGroups];
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    uint64_t v15 = __101__HUFeatureOnboarder__findNextAppropriateFlowByRemovingFlow_currentOnboardingFlowClass_usageOptions___block_invoke_119;
    id v16 = &unk_1E6387C68;
    id v17 = *(id *)(a1 + 32);
    int v9 = objc_msgSend(v8, "na_firstObjectPassingTest:", &v13);

    uint64_t v10 = objc_msgSend(WeakRetained, "allRemainingFlowGroups", v13, v14, v15, v16);
    [v10 removeObject:v9];
  }
  if (v5) {
    [MEMORY[0x1E4F7A0D8] futureWithResult:v5];
  }
  else {
  __int16 v11 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }

  return v11;
}

BOOL __101__HUFeatureOnboarder__findNextAppropriateFlowByRemovingFlow_currentOnboardingFlowClass_usageOptions___block_invoke_2_115(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 conformsToProtocol:&unk_1F19F1A10]) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;
  uint64_t v6 = v5;
  if (*(void *)(a1 + 32))
  {
    if (v5) {
      BOOL v7 = objc_opt_class() == *(void *)(a1 + 32);
    }
    else {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = v5 != 0;
  }

  return v7;
}

BOOL __101__HUFeatureOnboarder__findNextAppropriateFlowByRemovingFlow_currentOnboardingFlowClass_usageOptions___block_invoke_3_118(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 conformsToProtocol:&unk_1F19F1A10]) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  BOOL v4 = v3 != 0;

  return v4;
}

uint64_t __101__HUFeatureOnboarder__findNextAppropriateFlowByRemovingFlow_currentOnboardingFlowClass_usageOptions___block_invoke_119(uint64_t a1, void *a2)
{
  return [a2 containsObject:*(void *)(a1 + 32)];
}

- (void)_skipAnyFlowsNoLongerRequired
{
  id v3 = [(HUFeatureOnboarder *)self allRemainingFlowGroups];
  BOOL v4 = objc_msgSend(v3, "na_arrayByFlattening");

  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__HUFeatureOnboarder__skipAnyFlowsNoLongerRequired__block_invoke;
  v5[3] = &unk_1E6387CB8;
  v5[4] = self;
  objc_msgSend(v4, "na_each:", v5);
}

void __51__HUFeatureOnboarder__skipAnyFlowsNoLongerRequired__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [v6 onboardingFuture];
  char v4 = [v3 isFinished];

  if (v4 & 1) == 0 && (objc_opt_respondsToSelector())
  {
    id v5 = [*(id *)(a1 + 32) userInputResults];
    [v6 checkIfStillRequiredFromCurrentResults:v5];
  }
}

- (void)configuratorDidUpdateViewController:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v7 = NSStringFromSelector(a2);
    uint64_t v8 = [v5 currentViewController];
    int v18 = 138412802;
    id v19 = self;
    __int16 v20 = 2112;
    __int16 v21 = v7;
    __int16 v22 = 2112;
    uint64_t v23 = v8;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@: HUFeatureOnboardingConfigurator advanced to %@", (uint8_t *)&v18, 0x20u);
  }
  int v9 = [(HUFeatureOnboarder *)self configurator];
  uint64_t v10 = [v5 currentViewController];
  [v10 setDelegate:v9];

  __int16 v11 = [v5 currentViewController];
  [(HUFeatureOnboarder *)self set_currentViewControllerForTests:v11];

  id v12 = [(HUFeatureOnboarder *)self navController];

  if (v12)
  {
    uint64_t v13 = [v5 currentViewController];
    int v14 = [v13 conformsToProtocol:&unk_1F19C09F0];

    uint64_t v15 = [(HUFeatureOnboarder *)self navController];
    id v16 = [v5 currentViewController];
    if (v14) {
      id v17 = (id)objc_msgSend(v15, "hu_pushPreloadableViewController:animated:", v16, 1);
    }
    else {
      [v15 pushViewController:v16 animated:1];
    }
  }
}

- (void)configuratorDidFinish:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    id v12 = self;
    __int16 v13 = 2112;
    int v14 = v6;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@: HUFeatureOnboardingConfigurator FINISHED", buf, 0x16u);
  }
  BOOL v7 = [(HUFeatureOnboarder *)self navController];

  if (v7)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__HUFeatureOnboarder_configuratorDidFinish___block_invoke;
    block[3] = &unk_1E6386018;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  [(HUFeatureOnboarder *)self set_currentViewControllerForTests:0];
  uint64_t v8 = [(HUFeatureOnboarder *)self completionFuture];
  int v9 = [(HUFeatureOnboarder *)self userInputResults];
  [v8 finishWithResult:v9];
}

void __44__HUFeatureOnboarder_configuratorDidFinish___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) navController];
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", objc_msgSend(*(id *)(a1 + 32), "restart") ^ 1, 0);
}

- (id)getNextViewControllerForOnboardingInput:(id)a3 currentOnboardingFlowClass:(Class)a4
{
  id v7 = a3;
  uint64_t v8 = [(HUFeatureOnboarder *)self userInputResults];
  [v8 addEntriesFromDictionary:v7];

  objc_initWeak(&location, self);
  int v9 = [(HUFeatureOnboarder *)self initialUsageOptions];
  uint64_t v10 = [(HUFeatureOnboarder *)self _findNextAppropriateFlowByRemovingFlow:0 currentOnboardingFlowClass:a4 usageOptions:v9];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __89__HUFeatureOnboarder_getNextViewControllerForOnboardingInput_currentOnboardingFlowClass___block_invoke;
  v13[3] = &unk_1E6387D30;
  objc_copyWeak(v14, &location);
  v14[1] = (id)a2;
  __int16 v11 = [v10 flatMap:v13];
  objc_destroyWeak(v14);

  objc_destroyWeak(&location);

  return v11;
}

id __89__HUFeatureOnboarder_getNextViewControllerForOnboardingInput_currentOnboardingFlowClass___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  char v4 = &unk_1F19F1A10;
  if ([v3 conformsToProtocol:v4]) {
    id v5 = v3;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    uint64_t v8 = HFLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = NSStringFromSelector(*(SEL *)(a1 + 40));
      uint64_t v10 = [WeakRetained userInputResults];
      *(_DWORD *)buf = 138413058;
      id v36 = WeakRetained;
      __int16 v37 = 2112;
      __int16 v38 = v9;
      __int16 v39 = 2112;
      id v40 = v6;
      __int16 v41 = 2112;
      v42 = v10;
      _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "%@:%@: Flow \"%@\" processing results %@", buf, 0x2Au);
    }
    if ([v6 shouldAbortAllOnboarding])
    {
      __int16 v11 = HFLogForCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = NSStringFromSelector(*(SEL *)(a1 + 40));
        *(_DWORD *)buf = 138412802;
        id v36 = WeakRetained;
        __int16 v37 = 2112;
        __int16 v38 = v12;
        __int16 v39 = 2112;
        id v40 = v6;
        _os_log_impl(&dword_1BE345000, v11, OS_LOG_TYPE_DEFAULT, "%@:%@: Flow \"%@\" CANCELLED ALL current onboarding before next screen of flow.", buf, 0x20u);
      }
      __int16 v13 = 0;
    }
    else
    {
      __int16 v11 = [WeakRetained userInputResults];
      __int16 v13 = [v6 processUserInput:v11];
    }

    uint64_t v15 = HFLogForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = NSStringFromSelector(*(SEL *)(a1 + 40));
      *(_DWORD *)buf = 138412802;
      id v36 = WeakRetained;
      __int16 v37 = 2112;
      __int16 v38 = v16;
      __int16 v39 = 2112;
      id v40 = v13;
      _os_log_impl(&dword_1BE345000, v15, OS_LOG_TYPE_DEFAULT, "%@:%@: Next viewController: %@", buf, 0x20u);
    }
    if (v13)
    {
      int v14 = [MEMORY[0x1E4F7A0D8] futureWithResult:v13];
    }
    else
    {
      id v17 = [v6 onboardingFuture];
      char v18 = [v17 isFinished];

      if ((v18 & 1) == 0) {
        NSLog(&cfstr_NextViewcontro.isa);
      }
      id v19 = [v6 onboardingFuture];
      char v20 = [v19 isFinished];

      if ((v20 & 1) == 0)
      {
        __int16 v21 = HFLogForCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          SEL v30 = NSStringFromSelector(*(SEL *)(a1 + 40));
          *(_DWORD *)buf = 138412802;
          id v36 = WeakRetained;
          __int16 v37 = 2112;
          __int16 v38 = v30;
          __int16 v39 = 2112;
          id v40 = v6;
          _os_log_error_impl(&dword_1BE345000, v21, OS_LOG_TYPE_ERROR, "%@:%@: Next viewController is nil, but currentFeatureOnboardingFlow.onboardingFuture is not marked as finished. This is likely a programmer error. Forcing future to finish to avoid crashing. %@", buf, 0x20u);
        }
        __int16 v22 = [v6 onboardingFuture];
        [v22 finishWithNoResult];
      }
      [WeakRetained _skipAnyFlowsNoLongerRequired];
      if ([v6 shouldAbortAllOnboarding])
      {
        uint64_t v23 = HFLogForCategory();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v24 = NSStringFromSelector(*(SEL *)(a1 + 40));
          *(_DWORD *)buf = 138412802;
          id v36 = WeakRetained;
          __int16 v37 = 2112;
          __int16 v38 = v24;
          __int16 v39 = 2112;
          id v40 = v6;
          _os_log_impl(&dword_1BE345000, v23, OS_LOG_TYPE_DEFAULT, "%@:%@: Flow \"%@\" CANCELLED ALL current onboarding before next flow.", buf, 0x20u);
        }
        v25 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
        [WeakRetained setHasPerformedPostProcessing:1];
      }
      else
      {
        if ([v6 shouldAbortThisOnboardingFlowGroup])
        {
          v26 = [WeakRetained initialUsageOptions];
          [WeakRetained _findNextAppropriateFlowByRemovingFlow:v6 currentOnboardingFlowClass:0 usageOptions:v26];
        }
        else
        {
          uint64_t v27 = objc_opt_class();
          v26 = [WeakRetained initialUsageOptions];
          [WeakRetained _findNextAppropriateFlowByRemovingFlow:0 currentOnboardingFlowClass:v27 usageOptions:v26];
        v25 = };
      }
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __89__HUFeatureOnboarder_getNextViewControllerForOnboardingInput_currentOnboardingFlowClass___block_invoke_129;
      v31[3] = &unk_1E6387D08;
      objc_copyWeak(v34, (id *)(a1 + 32));
      v34[1] = *(id *)(a1 + 40);
      id v28 = v25;
      id v32 = v28;
      id v33 = v6;
      int v14 = [v28 flatMap:v31];

      objc_destroyWeak(v34);
    }
  }
  else
  {
    int v14 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }

  return v14;
}

id __89__HUFeatureOnboarder_getNextViewControllerForOnboardingInput_currentOnboardingFlowClass___block_invoke_129(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = v3;
  id v6 = &unk_1F19F1A10;
  if ([v5 conformsToProtocol:v6]) {
    id v7 = v5;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  int v9 = HFLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = NSStringFromSelector(*(SEL *)(a1 + 56));
    *(_DWORD *)buf = 138412802;
    id v29 = WeakRetained;
    __int16 v30 = 2112;
    v31 = v10;
    __int16 v32 = 2112;
    id v33 = v8;
    _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "%@:%@: Next Onboarding Flow: %@", buf, 0x20u);
  }
  id v11 = *(id *)(a1 + 32);
  if (!v8 && ([WeakRetained hasPerformedPostProcessing] & 1) == 0)
  {
    id v12 = [WeakRetained userInputResults];
    __int16 v13 = [WeakRetained getPostProcessingFlowsForResults:v12];

    int v14 = HFLogForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = NSStringFromSelector(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 138412802;
      id v29 = WeakRetained;
      __int16 v30 = 2112;
      v31 = v15;
      __int16 v32 = 2112;
      id v33 = v13;
      _os_log_impl(&dword_1BE345000, v14, OS_LOG_TYPE_DEFAULT, "%@:%@: Adding Post Processing Flow Group: %@", buf, 0x20u);
    }
    [WeakRetained setHasPerformedPostProcessing:1];
    id v16 = [WeakRetained allRemainingFlowGroups];
    objc_msgSend(v16, "na_safeAddObject:", v13);

    id v17 = [WeakRetained initialUsageOptions];
    uint64_t v18 = [WeakRetained _findNextAppropriateFlowByRemovingFlow:0 currentOnboardingFlowClass:0 usageOptions:v17];

    id v19 = HFLogForCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      char v20 = NSStringFromSelector(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 138412802;
      id v29 = WeakRetained;
      __int16 v30 = 2112;
      v31 = v20;
      __int16 v32 = 2112;
      id v33 = 0;
      _os_log_impl(&dword_1BE345000, v19, OS_LOG_TYPE_DEFAULT, "%@:%@: First Post Processing Flow: %@", buf, 0x20u);
    }
    id v11 = (id)v18;
  }
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  id v25[2] = __89__HUFeatureOnboarder_getNextViewControllerForOnboardingInput_currentOnboardingFlowClass___block_invoke_130;
  v25[3] = &unk_1E6387CE0;
  objc_copyWeak(v27, (id *)(a1 + 48));
  id v21 = *(id *)(a1 + 40);
  __int16 v22 = *(void **)(a1 + 56);
  id v26 = v21;
  v27[1] = v22;
  uint64_t v23 = [v11 flatMap:v25];

  objc_destroyWeak(v27);

  return v23;
}

id __89__HUFeatureOnboarder_getNextViewControllerForOnboardingInput_currentOnboardingFlowClass___block_invoke_130(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = v3;
  id v6 = &unk_1F19F1A10;
  if ([v5 conformsToProtocol:v6]) {
    id v7 = v5;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  int v9 = [v8 initialViewController];
  if (v8)
  {
    if (v8 == *(id *)(a1 + 32))
    {
      id v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:*(void *)(a1 + 48), WeakRetained, @"HUFeatureOnboarder.m", 529, @"Invalid parameter not satisfying: %@", @"nextOrPostProcessingFeatureOnboardingFlow != currentFeatureOnboardingFlow" object file lineNumber description];
    }
    uint64_t v10 = HFLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = NSStringFromSelector(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 138412802;
      id v18 = WeakRetained;
      __int16 v19 = 2112;
      char v20 = v11;
      __int16 v21 = 2112;
      id v22 = v9;
      _os_log_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEFAULT, "%@:%@: First View Controller of Next Flow: %@", buf, 0x20u);
    }
  }
  id v12 = HFLogForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v13 = NSStringFromSelector(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 138413058;
    id v18 = WeakRetained;
    __int16 v19 = 2112;
    char v20 = v13;
    __int16 v21 = 2112;
    id v22 = v8;
    __int16 v23 = 2112;
    uint64_t v24 = v9;
    _os_log_impl(&dword_1BE345000, v12, OS_LOG_TYPE_DEFAULT, "%@:%@:Starting next onboarding future %@ with initial view controller: %@", buf, 0x2Au);
  }
  if (v9) {
    [MEMORY[0x1E4F7A0D8] futureWithResult:v9];
  }
  else {
  int v14 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }

  return v14;
}

- (void)restartCurrentOnboarding
{
  id v3 = [(HUFeatureOnboarder *)self navController];

  if (v3)
  {
    char v4 = [(HUFeatureOnboarder *)self navController];
    id v5 = (id)[v4 popToRootViewControllerAnimated:0];
  }
  [(HUFeatureOnboarder *)self setRestart:1];
  id v6 = [(HUFeatureOnboarder *)self configurator];
  [(HUFeatureOnboarder *)self configuratorDidFinish:v6];
}

- (NSMutableDictionary)userInputResults
{
  return self->_userInputResults;
}

- (void)setUserInputResults:(id)a3
{
}

- (BOOL)restart
{
  return self->_restart;
}

- (void)setRestart:(BOOL)a3
{
  self->_restart = a3;
}

- (NAFuture)completionFuture
{
  return self->_completionFuture;
}

- (void)setCompletionFuture:(id)a3
{
}

- (HUFeatureOnboardingConfigurator)configurator
{
  return self->_configurator;
}

- (void)setConfigurator:(id)a3
{
}

- (NSDictionary)initialUsageOptions
{
  return self->_initialUsageOptions;
}

- (void)setInitialUsageOptions:(id)a3
{
}

- (NSMutableArray)allRemainingFlowGroups
{
  return self->_allRemainingFlowGroups;
}

- (void)setAllRemainingFlowGroups:(id)a3
{
}

- (UINavigationController)navController
{
  return self->_navController;
}

- (void)setNavController:(id)a3
{
}

- (HUConfigurationViewController)_currentViewControllerForTests
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__currentViewControllerForTests);

  return (HUConfigurationViewController *)WeakRetained;
}

- (void)set_currentViewControllerForTests:(id)a3
{
}

- (BOOL)hasPerformedPostProcessing
{
  return self->_hasPerformedPostProcessing;
}

- (void)setHasPerformedPostProcessing:(BOOL)a3
{
  self->_hasPerformedPostProcessing = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__currentViewControllerForTests);
  objc_storeStrong((id *)&self->_navController, 0);
  objc_storeStrong((id *)&self->_allRemainingFlowGroups, 0);
  objc_storeStrong((id *)&self->_initialUsageOptions, 0);
  objc_storeStrong((id *)&self->_configurator, 0);
  objc_storeStrong((id *)&self->_completionFuture, 0);

  objc_storeStrong((id *)&self->_userInputResults, 0);
}

@end