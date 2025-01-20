@interface HUUtilityOnboardingFlow
+ (id)needsOnboardingForHome:(id)a3 options:(id)a4;
- (BOOL)shouldAbortAllOnboarding;
- (BOOL)shouldAbortThisOnboardingFlowGroup;
- (HMHome)home;
- (HUConfigurationViewController)initialViewController;
- (HUUtilityOnboardingFlow)initWithUsageOptions:(id)a3 home:(id)a4;
- (NAFuture)onboardingFuture;
- (NAFuture)readyFuture;
- (_TtC6HomeUI24UtilityOnboardingContext)context;
- (id)determineNextViewControllerFromResults:(id)a3;
- (id)processUserInput:(id)a3;
- (unint64_t)currentState;
- (unint64_t)previousState;
- (void)_setThisUserDismissedOnboarding;
- (void)setContext:(id)a3;
- (void)setCurrentState:(unint64_t)a3;
- (void)setHome:(id)a3;
- (void)setInitialViewController:(id)a3;
- (void)setOnboardingFuture:(id)a3;
- (void)setPreviousState:(unint64_t)a3;
- (void)setReadyFuture:(id)a3;
- (void)setShouldAbortAllOnboarding:(BOOL)a3;
- (void)setShouldAbortThisOnboardingFlowGroup:(BOOL)a3;
- (void)updateState:(unint64_t)a3;
@end

@implementation HUUtilityOnboardingFlow

void __58__HUUtilityOnboardingFlow_needsOnboardingForHome_options___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  BOOL v5 = *(unsigned char *)(a1 + 40) == 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__HUUtilityOnboardingFlow_needsOnboardingForHome_options___block_invoke_2;
  v7[3] = &unk_1E6386730;
  id v8 = v3;
  id v6 = v3;
  +[HUHomeEnergyManagerHelper shouldShowConnectAccountBannerFor:v4 checkLocation:v5 completionHandler:v7];
}

void __58__HUUtilityOnboardingFlow_needsOnboardingForHome_options___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [NSNumber numberWithBool:a2];
  [v2 finishWithResult:v3];
}

+ (id)needsOnboardingForHome:(id)a3 options:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    v11 = (void *)MEMORY[0x1E4F7A0D8];
    uint64_t v12 = MEMORY[0x1E4F1CC28];
LABEL_11:
    v16 = [v11 futureWithResult:v12];
    goto LABEL_12;
  }
  if (HFForceUtilityOnboarding())
  {
    v9 = HFLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412546;
      id v23 = a1;
      __int16 v24 = 2112;
      v25 = v10;
      _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "%@:%@ FORCING Utility Onboarding", buf, 0x16u);
LABEL_9:

      goto LABEL_10;
    }
    goto LABEL_10;
  }
  v13 = [v8 objectForKeyedSubscript:@"OnboardingDisplayOption_OnboardingFromUserInput"];
  int v14 = [v13 BOOLValue];

  if (v14)
  {
    v9 = HFLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = NSStringFromSelector(a2);
      v15 = [v7 name];
      *(_DWORD *)buf = 138412802;
      id v23 = a1;
      __int16 v24 = 2112;
      v25 = v10;
      __int16 v26 = 2112;
      v27 = v15;
      _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "%@:%@ true for home(%@) because: onboarding", buf, 0x20u);

      goto LABEL_9;
    }
LABEL_10:

    v11 = (void *)MEMORY[0x1E4F7A0D8];
    uint64_t v12 = MEMORY[0x1E4F1CC38];
    goto LABEL_11;
  }
  v18 = (void *)MEMORY[0x1E4F7A0D8];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __58__HUUtilityOnboardingFlow_needsOnboardingForHome_options___block_invoke;
  v19[3] = &unk_1E6388DB0;
  id v20 = v7;
  char v21 = 0;
  v16 = [v18 futureWithBlock:v19];

LABEL_12:

  return v16;
}

- (HUUtilityOnboardingFlow)initWithUsageOptions:(id)a3 home:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)HUUtilityOnboardingFlow;
  id v8 = [(HUUtilityOnboardingFlow *)&v21 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_home, a4);
    v9->_currentState = 0;
    v10 = [[_TtC6HomeUI24UtilityOnboardingContext alloc] initWithHome:v7];
    context = v9->_context;
    v9->_context = v10;

    objc_initWeak(&location, v9);
    uint64_t v12 = (NAFuture *)objc_alloc_init(MEMORY[0x1E4F7A0D8]);
    readyFuture = v9->_readyFuture;
    v9->_readyFuture = v12;

    int v14 = (void *)MEMORY[0x1E4F7A0D8];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __53__HUUtilityOnboardingFlow_initWithUsageOptions_home___block_invoke;
    v18[3] = &unk_1E638A320;
    objc_copyWeak(&v19, &location);
    uint64_t v15 = [v14 futureWithBlock:v18];
    onboardingFuture = v9->_onboardingFuture;
    v9->_onboardingFuture = (NAFuture *)v15;

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v9;
}

void __53__HUUtilityOnboardingFlow_initWithUsageOptions_home___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _setThisUserDismissedOnboarding];
  v1 = [HUUtilityOnboardingIntroViewController alloc];
  v2 = [WeakRetained context];
  id v3 = [(HUUtilityOnboardingIntroViewController *)v1 initWithContext:v2];
  [WeakRetained setInitialViewController:v3];

  uint64_t v4 = [WeakRetained readyFuture];
  [v4 finishWithResult:MEMORY[0x1E4F1CC38]];
}

- (void)_setThisUserDismissedOnboarding
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v7 = @"HUHomeFeatureOnboardingKey_UtilityDiscovery_FinishedOnboarding";
  v8[0] = MEMORY[0x1E4F1CC38];
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  uint64_t v4 = [(HUUtilityOnboardingFlow *)self home];
  id v5 = +[HUHomeFeatureOnboardingUtilities home:v4 processHomeFeatureOnboarderResults:v3];

  id v6 = [(HUUtilityOnboardingFlow *)self home];
  +[HUHomeEnergyManagerHelper setHasDismissedConnectAccountBannerWithHome:v6];
}

- (id)processUserInput:(id)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = NSStringFromSelector(a2);
    *(_DWORD *)v64 = 138412802;
    *(void *)&v64[4] = self;
    *(_WORD *)&v64[12] = 2112;
    *(void *)&v64[14] = v7;
    *(_WORD *)&v64[22] = 2112;
    unint64_t v65 = (unint64_t)v5;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@ with input results: %@", v64, 0x20u);
  }
  id v8 = [v5 objectForKeyedSubscript:@"HUUtilityDiscoveryOnboardingKey_UserInput"];
  unint64_t v9 = [v8 integerValue];
  v10 = HFLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = NSStringFromSelector(a2);
    unint64_t currentState = self->_currentState;
    *(_DWORD *)v64 = 138412802;
    *(void *)&v64[4] = self;
    *(_WORD *)&v64[12] = 2112;
    *(void *)&v64[14] = v11;
    *(_WORD *)&v64[22] = 2048;
    unint64_t v65 = currentState;
    _os_log_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEFAULT, "%@: Starting %@ with current state -> %lu", v64, 0x20u);
  }
  unint64_t v13 = self->_currentState;
  switch(v13)
  {
    case 0uLL:
    case 2uLL:
      int v14 = HFLogForCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = NSStringFromSelector(a2);
        *(_DWORD *)v64 = 138412546;
        *(void *)&v64[4] = v15;
        *(_WORD *)&v64[12] = 2112;
        *(void *)&v64[14] = v8;
        _os_log_impl(&dword_1BE345000, v14, OS_LOG_TYPE_DEFAULT, "%@ -> Start & user input=%@", v64, 0x16u);
      }
      BOOL v16 = v9 == 0;
      uint64_t v17 = 3;
      goto LABEL_20;
    case 1uLL:
      v18 = [(HUUtilityOnboardingFlow *)self onboardingFuture];
      [v18 finishWithNoResult];
      goto LABEL_10;
    case 3uLL:
      v40 = HFLogForCategory();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        v41 = NSStringFromSelector(a2);
        *(_DWORD *)v64 = 138412546;
        *(void *)&v64[4] = v41;
        *(_WORD *)&v64[12] = 2112;
        *(void *)&v64[14] = v8;
        _os_log_impl(&dword_1BE345000, v40, OS_LOG_TYPE_DEFAULT, "%@ -> DoUtilityLookup & user input=%@", v64, 0x16u);
      }
      unint64_t v13 = 5;
      switch(v9)
      {
        case 0uLL:
          goto LABEL_43;
        case 3uLL:
          goto LABEL_59;
        case 7uLL:
          goto LABEL_77;
        case 8uLL:
          [(UtilityOnboardingContext *)self->_context populateFieldsFromMeContact];
          if ([(UtilityOnboardingContext *)self->_context quickLookupHasAllFields]) {
            BOOL v60 = [(UtilityOnboardingContext *)self->_context allRequiredFieldsComplete];
          }
          else {
            BOOL v60 = 0;
          }
          v61 = HFLogForCategory();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v64 = 67109120;
            *(_DWORD *)&v64[4] = v60;
            _os_log_impl(&dword_1BE345000, v61, OS_LOG_TYPE_DEFAULT, "MeCard contains all the keys? --> %{BOOL}d", v64, 8u);
          }

          BOOL v57 = !v60;
          uint64_t v58 = 6;
          uint64_t v59 = 4;
          goto LABEL_91;
        case 9uLL:
          goto LABEL_94;
        default:
          v18 = HFLogForCategory();
          if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_10;
          }
          objc_super v21 = NSStringFromSelector(a2);
          *(_DWORD *)v64 = 138412546;
          *(void *)&v64[4] = self;
          *(_WORD *)&v64[12] = 2112;
          *(void *)&v64[14] = v21;
          v22 = "%@:%@ Invalid User Input in DoUtilityLookup";
          goto LABEL_84;
      }
    case 4uLL:
      v42 = HFLogForCategory();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        v43 = NSStringFromSelector(a2);
        *(_DWORD *)v64 = 138412546;
        *(void *)&v64[4] = v43;
        *(_WORD *)&v64[12] = 2112;
        *(void *)&v64[14] = v8;
        _os_log_impl(&dword_1BE345000, v42, OS_LOG_TYPE_DEFAULT, "%@ -> Quick Lookup & user input=%@", v64, 0x16u);
      }
      if (v9)
      {
        if (v9 == 7)
        {
LABEL_78:
          v55 = [v5 objectForKeyedSubscript:@"HUUtilityDiscoveryOnboardingKey_Error"];
          BOOL v56 = +[HUHomeEnergyManagerHelper accountNotFound:v55];

          BOOL v57 = !v56;
          uint64_t v58 = 15;
          uint64_t v59 = 7;
LABEL_91:
          if (v57) {
            unint64_t v13 = v58;
          }
          else {
            unint64_t v13 = v59;
          }
        }
        else if (v9 == 10)
        {
          unint64_t v13 = 6;
        }
        else
        {
          unint64_t v13 = 1;
        }
      }
      else
      {
        unint64_t v13 = 8;
      }
      goto LABEL_94;
    case 5uLL:
      id v19 = HFLogForCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        id v20 = NSStringFromSelector(a2);
        *(_DWORD *)v64 = 138412546;
        *(void *)&v64[4] = v20;
        *(_WORD *)&v64[12] = 2112;
        *(void *)&v64[14] = v8;
        _os_log_impl(&dword_1BE345000, v19, OS_LOG_TYPE_DEFAULT, "%@ -> OAuth Login & user input=%@", v64, 0x16u);
      }
      if (v9)
      {
        if (v9 == 7)
        {
LABEL_77:
          unint64_t v13 = 15;
        }
        else
        {
          v18 = HFLogForCategory();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            objc_super v21 = NSStringFromSelector(a2);
            *(_DWORD *)v64 = 138412546;
            *(void *)&v64[4] = self;
            *(_WORD *)&v64[12] = 2112;
            *(void *)&v64[14] = v21;
            v22 = "%@:%@ Invalid User Input in OAuth Login";
LABEL_84:
            _os_log_impl(&dword_1BE345000, v18, OS_LOG_TYPE_DEFAULT, v22, v64, 0x16u);
          }
LABEL_10:

LABEL_59:
          unint64_t v13 = 1;
        }
      }
      else
      {
LABEL_43:
        unint64_t v13 = 10;
      }
LABEL_94:
      -[HUUtilityOnboardingFlow updateState:](self, "updateState:", v13, *(_OWORD *)v64, *(void *)&v64[16]);
      v62 = [(HUUtilityOnboardingFlow *)self determineNextViewControllerFromResults:v5];

      return v62;
    case 6uLL:
      v44 = HFLogForCategory();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        v45 = NSStringFromSelector(a2);
        *(_DWORD *)v64 = 138412546;
        *(void *)&v64[4] = v45;
        *(_WORD *)&v64[12] = 2112;
        *(void *)&v64[14] = v8;
        _os_log_impl(&dword_1BE345000, v44, OS_LOG_TYPE_DEFAULT, "%@ -> TAF & user input=%@", v64, 0x16u);
      }
      unint64_t v13 = 8;
      switch(v9)
      {
        case 0uLL:
          goto LABEL_94;
        case 2uLL:
          unint64_t v13 = 4;
          break;
        case 6uLL:
          unint64_t v13 = 3;
          break;
        case 7uLL:
          goto LABEL_78;
        default:
          goto LABEL_59;
      }
      goto LABEL_94;
    case 7uLL:
      v46 = HFLogForCategory();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        v47 = NSStringFromSelector(a2);
        *(_DWORD *)v64 = 138412546;
        *(void *)&v64[4] = v47;
        *(_WORD *)&v64[12] = 2112;
        *(void *)&v64[14] = v8;
        _os_log_impl(&dword_1BE345000, v46, OS_LOG_TYPE_DEFAULT, "%@ -> Account Not Found & user input=%@", v64, 0x16u);
      }
      if (v9 >= 0xB) {
        goto LABEL_59;
      }
      unint64_t v13 = qword_1BEA1A2E8[v9];
      goto LABEL_94;
    case 8uLL:
      v48 = HFLogForCategory();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
      {
        v49 = NSStringFromSelector(a2);
        *(_DWORD *)v64 = 138412546;
        *(void *)&v64[4] = v49;
        *(_WORD *)&v64[12] = 2112;
        *(void *)&v64[14] = v8;
        _os_log_impl(&dword_1BE345000, v48, OS_LOG_TYPE_DEFAULT, "%@ -> OTPSelection & user input=%@", v64, 0x16u);
      }
      uint64_t v27 = 9;
      uint64_t v28 = 15;
      BOOL v29 = v9 == 6;
      uint64_t v30 = 1;
      uint64_t v31 = 6;
      goto LABEL_66;
    case 9uLL:
      v50 = HFLogForCategory();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        v51 = NSStringFromSelector(a2);
        *(_DWORD *)v64 = 138412546;
        *(void *)&v64[4] = v51;
        *(_WORD *)&v64[12] = 2112;
        *(void *)&v64[14] = v8;
        _os_log_impl(&dword_1BE345000, v50, OS_LOG_TYPE_DEFAULT, "%@ -> EnterOTP & user input=%@", v64, 0x16u);
      }
      uint64_t v27 = 10;
      uint64_t v28 = 15;
      BOOL v29 = v9 == 6;
      uint64_t v30 = 1;
      uint64_t v31 = 8;
      goto LABEL_66;
    case 0xAuLL:
      id v23 = HFLogForCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v24 = NSStringFromSelector(a2);
        *(_DWORD *)v64 = 138412546;
        *(void *)&v64[4] = v24;
        *(_WORD *)&v64[12] = 2112;
        *(void *)&v64[14] = v8;
        _os_log_impl(&dword_1BE345000, v23, OS_LOG_TYPE_DEFAULT, "%@ -> GetTermsConsent & user input=%@", v64, 0x16u);
      }
      BOOL v16 = v9 == 0;
      uint64_t v17 = 11;
LABEL_20:
      if (v16) {
        unint64_t v13 = v17;
      }
      else {
        unint64_t v13 = 1;
      }
      goto LABEL_94;
    case 0xBuLL:
      v25 = HFLogForCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v26 = NSStringFromSelector(a2);
        *(_DWORD *)v64 = 138412546;
        *(void *)&v64[4] = v26;
        *(_WORD *)&v64[12] = 2112;
        *(void *)&v64[14] = v8;
        _os_log_impl(&dword_1BE345000, v25, OS_LOG_TYPE_DEFAULT, "%@ -> Loading screen & user input=%@", v64, 0x16u);
      }
      uint64_t v27 = 13;
      uint64_t v28 = 15;
      BOOL v29 = v9 == 1;
      uint64_t v30 = 1;
      uint64_t v31 = 12;
LABEL_66:
      if (v29) {
        uint64_t v30 = v31;
      }
      if (v9 != 7) {
        uint64_t v28 = v30;
      }
      if (v9) {
        unint64_t v13 = v28;
      }
      else {
        unint64_t v13 = v27;
      }
      goto LABEL_94;
    case 0xCuLL:
      v32 = HFLogForCategory();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        v33 = NSStringFromSelector(a2);
        *(_DWORD *)v64 = 138412546;
        *(void *)&v64[4] = v33;
        *(_WORD *)&v64[12] = 2112;
        *(void *)&v64[14] = v8;
        _os_log_impl(&dword_1BE345000, v32, OS_LOG_TYPE_DEFAULT, "%@ -> GetServiceLocations & user input=%@", v64, 0x16u);
      }
      uint64_t v34 = 12;
      if (v9 == 7) {
        uint64_t v34 = 15;
      }
      if (v9) {
        unint64_t v13 = v34;
      }
      else {
        unint64_t v13 = 13;
      }
      goto LABEL_94;
    case 0xDuLL:
      v35 = HFLogForCategory();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        v36 = NSStringFromSelector(a2);
        *(_DWORD *)v64 = 138412546;
        *(void *)&v64[4] = v36;
        *(_WORD *)&v64[12] = 2112;
        *(void *)&v64[14] = v8;
        _os_log_impl(&dword_1BE345000, v35, OS_LOG_TYPE_DEFAULT, "%@ -> GetHomeSubscription & user input=%@", v64, 0x16u);
      }
      if (v9)
      {
        v37 = [(HUUtilityOnboardingFlow *)self onboardingFuture];
        [v37 finishWithNoResult];

        unint64_t v13 = 0;
      }
      else
      {
        unint64_t v13 = 14;
      }
      goto LABEL_94;
    case 0xFuLL:
      v52 = HFLogForCategory();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        v53 = NSStringFromSelector(a2);
        *(_DWORD *)v64 = 138412546;
        *(void *)&v64[4] = self;
        *(_WORD *)&v64[12] = 2112;
        *(void *)&v64[14] = v53;
        _os_log_impl(&dword_1BE345000, v52, OS_LOG_TYPE_DEFAULT, "%@:%@ Finishing the onboarding flow due to error", v64, 0x16u);
      }
      v54 = [(HUUtilityOnboardingFlow *)self onboardingFuture];
      [v54 finishWithNoResult];

      [v5 setObject:0 forKeyedSubscript:@"HUUtilityDiscoveryOnboardingKey_Error"];
      goto LABEL_77;
    default:
      v38 = HFLogForCategory();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        v39 = NSStringFromSelector(a2);
        *(_DWORD *)v64 = 138412802;
        *(void *)&v64[4] = self;
        *(_WORD *)&v64[12] = 2112;
        *(void *)&v64[14] = v39;
        *(_WORD *)&v64[22] = 2112;
        unint64_t v65 = (unint64_t)v8;
        _os_log_impl(&dword_1BE345000, v38, OS_LOG_TYPE_DEFAULT, "%@:%@ Unsupported state! %@", v64, 0x20u);
      }
      goto LABEL_94;
  }
}

- (id)determineNextViewControllerFromResults:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = NSStringFromSelector(a2);
    unint64_t currentState = self->_currentState;
    int v50 = 138412802;
    v51 = self;
    __int16 v52 = 2112;
    unint64_t v53 = (unint64_t)v7;
    __int16 v54 = 2048;
    unint64_t v55 = currentState;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@ Determine next view controller for current state -> %lu", (uint8_t *)&v50, 0x20u);
  }
  switch(self->_currentState)
  {
    case 1uLL:
      unint64_t v9 = HFLogForCategory();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_46;
      }
      NSStringFromSelector(a2);
      v10 = (HUUtilityOnboardingFlow *)objc_claimAutoreleasedReturnValue();
      int v50 = 138412290;
      v51 = v10;
      v11 = "%@ -> CASE: Declined";
      goto LABEL_45;
    case 3uLL:
      uint64_t v15 = HFLogForCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        BOOL v16 = (HUUtilityOnboardingFlow *)objc_claimAutoreleasedReturnValue();
        int v50 = 138412290;
        v51 = v16;
        _os_log_impl(&dword_1BE345000, v15, OS_LOG_TYPE_DEFAULT, "%@ -> CASE: UtilityLookup ", (uint8_t *)&v50, 0xCu);
      }
      uint64_t v17 = [HUUtilityDiscoverySetupViewController alloc];
      uint64_t v12 = [(HUUtilityOnboardingFlow *)self home];
      v18 = [(HUUtilityOnboardingFlow *)self context];
      uint64_t v19 = [(HUUtilityDiscoverySetupViewController *)v17 initWithHome:v12 onboardingContext:v18];
      goto LABEL_53;
    case 4uLL:
      id v20 = HFLogForCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        objc_super v21 = (HUUtilityOnboardingFlow *)objc_claimAutoreleasedReturnValue();
        int v50 = 138412290;
        v51 = v21;
        _os_log_impl(&dword_1BE345000, v20, OS_LOG_TYPE_DEFAULT, "%@ -> CASE: Quick Lookup", (uint8_t *)&v50, 0xCu);
      }
      v22 = HUUtilityOnboardingQuickLookupViewController;
      goto LABEL_41;
    case 5uLL:
      id v23 = HFLogForCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        __int16 v24 = (HUUtilityOnboardingFlow *)objc_claimAutoreleasedReturnValue();
        int v50 = 138412290;
        v51 = v24;
        _os_log_impl(&dword_1BE345000, v23, OS_LOG_TYPE_DEFAULT, "%@ -> CASE: OAuth Login ", (uint8_t *)&v50, 0xCu);
      }
      v22 = HUUtilityOnboardingOAuthLoginViewController;
      goto LABEL_41;
    case 6uLL:
      v25 = HFLogForCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        __int16 v26 = (HUUtilityOnboardingFlow *)objc_claimAutoreleasedReturnValue();
        int v50 = 138412290;
        v51 = v26;
        _os_log_impl(&dword_1BE345000, v25, OS_LOG_TYPE_DEFAULT, "%@ -> CASE: TAF", (uint8_t *)&v50, 0xCu);
      }
      v22 = HUUtilityOnboardingTAFViewController;
      goto LABEL_41;
    case 7uLL:
      uint64_t v27 = HFLogForCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        uint64_t v28 = (HUUtilityOnboardingFlow *)objc_claimAutoreleasedReturnValue();
        int v50 = 138412290;
        v51 = v28;
        _os_log_impl(&dword_1BE345000, v27, OS_LOG_TYPE_DEFAULT, "%@ -> CASE: Account Not Found", (uint8_t *)&v50, 0xCu);
      }
      v22 = HUUtilityOnboardingNoAccountViewController;
      goto LABEL_41;
    case 8uLL:
      BOOL v29 = HFLogForCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        uint64_t v30 = (HUUtilityOnboardingFlow *)objc_claimAutoreleasedReturnValue();
        int v50 = 138412290;
        v51 = v30;
        _os_log_impl(&dword_1BE345000, v29, OS_LOG_TYPE_DEFAULT, "%@ -> CASE: OTP Selection ", (uint8_t *)&v50, 0xCu);
      }
      v22 = HUUtilityOnboardingOTPSelectionViewController;
      goto LABEL_41;
    case 9uLL:
      uint64_t v31 = HFLogForCategory();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v32 = (HUUtilityOnboardingFlow *)objc_claimAutoreleasedReturnValue();
        int v50 = 138412290;
        v51 = v32;
        _os_log_impl(&dword_1BE345000, v31, OS_LOG_TYPE_DEFAULT, "%@ -> CASE: Enter OTP", (uint8_t *)&v50, 0xCu);
      }
      v22 = HUUtilityOnboardingEnterOTPViewController;
      goto LABEL_41;
    case 0xAuLL:
      v33 = HFLogForCategory();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        uint64_t v34 = (HUUtilityOnboardingFlow *)objc_claimAutoreleasedReturnValue();
        int v50 = 138412290;
        v51 = v34;
        _os_log_impl(&dword_1BE345000, v33, OS_LOG_TYPE_DEFAULT, "%@ -> CASE: T&Cs", (uint8_t *)&v50, 0xCu);
      }
      v22 = HUUtilityOnboardingTermsViewController;
      goto LABEL_41;
    case 0xBuLL:
      v35 = HFLogForCategory();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v36 = (HUUtilityOnboardingFlow *)objc_claimAutoreleasedReturnValue();
        int v50 = 138412290;
        v51 = v36;
        _os_log_impl(&dword_1BE345000, v35, OS_LOG_TYPE_DEFAULT, "%@ -> CASE: Loading", (uint8_t *)&v50, 0xCu);
      }
      v22 = HUUtilityOnboardingLoadingViewController;
      goto LABEL_41;
    case 0xCuLL:
      v37 = HFLogForCategory();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v38 = (HUUtilityOnboardingFlow *)objc_claimAutoreleasedReturnValue();
        int v50 = 138412290;
        v51 = v38;
        _os_log_impl(&dword_1BE345000, v37, OS_LOG_TYPE_DEFAULT, "%@ -> CASE: Service Locations", (uint8_t *)&v50, 0xCu);
      }
      v39 = [HUUtilityOnboardingSelectLocationViewController alloc];
      home = self->_home;
      uint64_t v12 = [(HUUtilityOnboardingFlow *)self context];
      uint64_t v41 = [(HUUtilityOnboardingSelectLocationViewController *)v39 initWithHome:home context:v12];
      goto LABEL_42;
    case 0xDuLL:
      v42 = HFLogForCategory();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v43 = (HUUtilityOnboardingFlow *)objc_claimAutoreleasedReturnValue();
        int v50 = 138412290;
        v51 = v43;
        _os_log_impl(&dword_1BE345000, v42, OS_LOG_TYPE_DEFAULT, "%@ -> CASE: GetHomeSubscription ", (uint8_t *)&v50, 0xCu);
      }
      v22 = HUUtilityOnboardingConnectionViewController;
LABEL_41:
      id v44 = [v22 alloc];
      uint64_t v12 = [(HUUtilityOnboardingFlow *)self context];
      uint64_t v41 = [v44 initWithContext:v12];
LABEL_42:
      v45 = (void *)v41;
      goto LABEL_54;
    case 0xEuLL:
      unint64_t v9 = HFLogForCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v10 = (HUUtilityOnboardingFlow *)objc_claimAutoreleasedReturnValue();
        int v50 = 138412290;
        v51 = v10;
        v11 = "%@ -> CASE: Onboarding completed successfully. ";
LABEL_45:
        _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v50, 0xCu);
      }
LABEL_46:

      uint64_t v12 = [(HUUtilityOnboardingFlow *)self onboardingFuture];
      [v12 finishWithNoResult];
      goto LABEL_47;
    case 0xFuLL:
      v46 = HFLogForCategory();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        v47 = (HUUtilityOnboardingFlow *)objc_claimAutoreleasedReturnValue();
        int v50 = 138412290;
        v51 = v47;
        _os_log_impl(&dword_1BE345000, v46, OS_LOG_TYPE_DEFAULT, "%@ -> CASE: Error", (uint8_t *)&v50, 0xCu);
      }
      if (self->_previousState == self->_currentState)
      {
        v45 = 0;
      }
      else
      {
        v48 = [HUUtilityOnboardingErrorViewController alloc];
        uint64_t v12 = [(HUUtilityOnboardingFlow *)self context];
        v18 = [v5 objectForKeyedSubscript:@"HUUtilityDiscoveryOnboardingKey_Error"];
        uint64_t v19 = [(HUUtilityOnboardingErrorViewController *)v48 initWithContext:v12 error:v18];
LABEL_53:
        v45 = (void *)v19;

LABEL_54:
      }

      return v45;
    default:
      uint64_t v12 = HFLogForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        unint64_t v13 = (HUUtilityOnboardingFlow *)objc_claimAutoreleasedReturnValue();
        unint64_t v14 = self->_currentState;
        int v50 = 138412546;
        v51 = v13;
        __int16 v52 = 2048;
        unint64_t v53 = v14;
        _os_log_impl(&dword_1BE345000, v12, OS_LOG_TYPE_DEFAULT, "%@ -> CASE: %lu does not present a view controller ", (uint8_t *)&v50, 0x16u);
      }
LABEL_47:
      v45 = 0;
      goto LABEL_54;
  }
}

- (void)updateState:(unint64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = NSStringFromSelector(a2);
    unint64_t previousState = self->_previousState;
    unint64_t currentState = self->_currentState;
    int v10 = 138413314;
    v11 = self;
    __int16 v12 = 2112;
    unint64_t v13 = v7;
    __int16 v14 = 2048;
    unint64_t v15 = currentState;
    __int16 v16 = 2048;
    unint64_t v17 = a3;
    __int16 v18 = 2048;
    unint64_t v19 = previousState;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@ updating homeEnergyOnboardingState=%lu with state=%lu\t previous state=%lu", (uint8_t *)&v10, 0x34u);
  }
  self->_unint64_t previousState = self->_currentState;
  self->_unint64_t currentState = a3;
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
}

- (NAFuture)onboardingFuture
{
  return self->_onboardingFuture;
}

- (void)setOnboardingFuture:(id)a3
{
}

- (HUConfigurationViewController)initialViewController
{
  return self->_initialViewController;
}

- (void)setInitialViewController:(id)a3
{
}

- (NAFuture)readyFuture
{
  return self->_readyFuture;
}

- (void)setReadyFuture:(id)a3
{
}

- (unint64_t)previousState
{
  return self->_previousState;
}

- (void)setPreviousState:(unint64_t)a3
{
  self->_unint64_t previousState = a3;
}

- (unint64_t)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(unint64_t)a3
{
  self->_unint64_t currentState = a3;
}

- (BOOL)shouldAbortThisOnboardingFlowGroup
{
  return self->_shouldAbortThisOnboardingFlowGroup;
}

- (void)setShouldAbortThisOnboardingFlowGroup:(BOOL)a3
{
  self->_shouldAbortThisOnboardingFlowGroup = a3;
}

- (BOOL)shouldAbortAllOnboarding
{
  return self->_shouldAbortAllOnboarding;
}

- (void)setShouldAbortAllOnboarding:(BOOL)a3
{
  self->_shouldAbortAllOnboarding = a3;
}

- (_TtC6HomeUI24UtilityOnboardingContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_readyFuture, 0);
  objc_storeStrong((id *)&self->_initialViewController, 0);
  objc_storeStrong((id *)&self->_onboardingFuture, 0);

  objc_storeStrong((id *)&self->_home, 0);
}

@end