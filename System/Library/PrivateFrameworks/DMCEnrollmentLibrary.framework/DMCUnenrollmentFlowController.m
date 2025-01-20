@interface DMCUnenrollmentFlowController
- (BOOL)isAppleMAID;
- (DMCEnrollmentFlowMCBridge)managedConfigurationHelper;
- (DMCUnenrollmentFlowController)initWithPresenter:(id)a3 managedConfigurationHelper:(id)a4;
- (DMCUnenrollmentFlowPresenter)presenter;
- (NSString)altDSID;
- (NSString)personaID;
- (NSString)profileIdentifier;
- (id)_interactiveUnenrollmentSteps;
- (id)_nameForStep:(unint64_t)a3;
- (id)_silentUnenrollmentSteps;
- (id)unenrollmentCompletionHandler;
- (void)_askForPasscodeIfNeeded;
- (void)_askForUserConfirmationIsAppleMAID:(BOOL)a3;
- (void)_flowTerminatedWithError:(id)a3 canceled:(BOOL)a4;
- (void)_preflightUnenrollmentWithAccoutAltDSID:(id)a3;
- (void)_resetToInitialStepsWithSilent:(BOOL)a3;
- (void)_uninstallEnrollmentProfileWithIdentifier:(id)a3 personaID:(id)a4 altDSID:(id)a5 isAppleMAID:(BOOL)a6;
- (void)_workerQueue_flowCompleted;
- (void)_workerQueue_performFlowStep:(unint64_t)a3;
- (void)setAltDSID:(id)a3;
- (void)setIsAppleMAID:(BOOL)a3;
- (void)setManagedConfigurationHelper:(id)a3;
- (void)setPersonaID:(id)a3;
- (void)setPresenter:(id)a3;
- (void)setProfileIdentifier:(id)a3;
- (void)setUnenrollmentCompletionHandler:(id)a3;
- (void)unenrollAccountWithAltDSID:(id)a3 silent:(BOOL)a4 completionHandler:(id)a5;
@end

@implementation DMCUnenrollmentFlowController

- (DMCUnenrollmentFlowController)initWithPresenter:(id)a3 managedConfigurationHelper:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DMCUnenrollmentFlowController;
  v9 = [(DMCEnrollmentFlowControllerBase *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_presenter, a3);
    objc_storeStrong((id *)&v10->_managedConfigurationHelper, a4);
  }

  return v10;
}

- (void)unenrollAccountWithAltDSID:(id)a3 silent:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  [(DMCUnenrollmentFlowController *)self setAltDSID:a3];
  [(DMCUnenrollmentFlowController *)self setUnenrollmentCompletionHandler:v8];

  [(DMCUnenrollmentFlowController *)self _resetToInitialStepsWithSilent:v5];
  [(DMCEnrollmentFlowControllerBase *)self _pollNextStep];
}

- (void)_resetToInitialStepsWithSilent:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DMCUnenrollmentFlowController;
  [(DMCEnrollmentFlowControllerBase *)&v6 _resetToInitialSteps];
  if (a3) {
    [(DMCUnenrollmentFlowController *)self _silentUnenrollmentSteps];
  }
  else {
  BOOL v5 = [(DMCUnenrollmentFlowController *)self _interactiveUnenrollmentSteps];
  }
  [(DMCEnrollmentFlowControllerBase *)self _appendSteps:v5];
}

- (void)_workerQueue_performFlowStep:(unint64_t)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  BOOL v5 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v6 = v5;
    id v7 = [(DMCUnenrollmentFlowController *)self _nameForStep:a3];
    int v13 = 138543362;
    v14 = v7;
    _os_log_impl(&dword_225D9B000, v6, OS_LOG_TYPE_DEFAULT, "Will perform unenrollment step: %{public}@", (uint8_t *)&v13, 0xCu);
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [MEMORY[0x263F38BB8] currentPersonaID];
    v9 = [MEMORY[0x263F38BB8] currentPersonaTypeString];
    int v13 = 136315906;
    v14 = "-[DMCUnenrollmentFlowController _workerQueue_performFlowStep:]";
    __int16 v15 = 1024;
    int v16 = 64;
    __int16 v17 = 2114;
    v18 = v8;
    __int16 v19 = 2114;
    v20 = v9;
    _os_log_impl(&dword_225D9B000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "%s (L: %d): Current persona ID: %{public}@, type: %{public}@", (uint8_t *)&v13, 0x26u);
  }
  [(DMCEnrollmentFlowControllerBase *)self setCurrentStep:a3];
  switch(a3)
  {
    case 0uLL:
      v10 = [(DMCUnenrollmentFlowController *)self altDSID];
      [(DMCUnenrollmentFlowController *)self _preflightUnenrollmentWithAccoutAltDSID:v10];
      goto LABEL_10;
    case 1uLL:
      [(DMCUnenrollmentFlowController *)self _askForUserConfirmationIsAppleMAID:[(DMCUnenrollmentFlowController *)self isAppleMAID]];
      break;
    case 2uLL:
      [(DMCUnenrollmentFlowController *)self _askForPasscodeIfNeeded];
      break;
    case 3uLL:
      v10 = [(DMCUnenrollmentFlowController *)self profileIdentifier];
      v11 = [(DMCUnenrollmentFlowController *)self personaID];
      objc_super v12 = [(DMCUnenrollmentFlowController *)self altDSID];
      [(DMCUnenrollmentFlowController *)self _uninstallEnrollmentProfileWithIdentifier:v10 personaID:v11 altDSID:v12 isAppleMAID:[(DMCUnenrollmentFlowController *)self isAppleMAID]];

LABEL_10:
      break;
    default:
      return;
  }
}

- (void)_workerQueue_flowCompleted
{
  v3 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_225D9B000, v3, OS_LOG_TYPE_DEFAULT, "Unenrollment flow completed!", v7, 2u);
  }
  v4 = [(DMCUnenrollmentFlowController *)self presenter];
  [v4 dismissUnenrollmentScene];

  BOOL v5 = [(DMCUnenrollmentFlowController *)self unenrollmentCompletionHandler];

  if (v5)
  {
    objc_super v6 = [(DMCUnenrollmentFlowController *)self unenrollmentCompletionHandler];
    v6[2](v6, 1, 0, 0);

    [(DMCUnenrollmentFlowController *)self setUnenrollmentCompletionHandler:0];
  }
}

- (void)_flowTerminatedWithError:(id)a3 canceled:(BOOL)a4
{
  id v6 = a3;
  id v7 = [(DMCEnrollmentFlowControllerBase *)self workerQueue];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __67__DMCUnenrollmentFlowController__flowTerminatedWithError_canceled___block_invoke;
  v9[3] = &unk_264778628;
  BOOL v12 = a4;
  id v10 = v6;
  v11 = self;
  id v8 = v6;
  [v7 queueBlock:v9];
}

void __67__DMCUnenrollmentFlowController__flowTerminatedWithError_canceled___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v2 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = *(unsigned __int8 *)(a1 + 48);
    int v8 = 138543618;
    uint64_t v9 = v3;
    __int16 v10 = 1024;
    int v11 = v4;
    _os_log_impl(&dword_225D9B000, v2, OS_LOG_TYPE_DEFAULT, "Unenrollment flow terminated with error: %{public}@, canceled: %d", (uint8_t *)&v8, 0x12u);
  }
  BOOL v5 = [*(id *)(a1 + 40) presenter];
  [v5 dismissUnenrollmentScene];

  id v6 = [*(id *)(a1 + 40) unenrollmentCompletionHandler];

  if (v6)
  {
    id v7 = [*(id *)(a1 + 40) unenrollmentCompletionHandler];
    v7[2](v7, 0, *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));

    [*(id *)(a1 + 40) setUnenrollmentCompletionHandler:0];
  }
}

- (id)_interactiveUnenrollmentSteps
{
  return &unk_26D985F00;
}

- (id)_silentUnenrollmentSteps
{
  return &unk_26D985F18;
}

- (void)_preflightUnenrollmentWithAccoutAltDSID:(id)a3
{
  id v4 = a3;
  BOOL v5 = [MEMORY[0x263EFB210] defaultStore];
  id v6 = objc_msgSend(v5, "dmc_remoteManagementAccountForAltDSID:", v4);

  if (v6)
  {
    id v7 = objc_msgSend(v6, "dmc_managementProfileIdentifier");
    -[DMCUnenrollmentFlowController setIsAppleMAID:](self, "setIsAppleMAID:", objc_msgSend(v6, "dmc_enrollmentMethod") == 1);
  }
  else
  {
    int v8 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_225D9B000, v8, OS_LOG_TYPE_ERROR, "RM account is missing!", buf, 2u);
    }
    id v7 = 0;
  }
  if (![v7 length])
  {
    uint64_t v9 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)__int16 v15 = 0;
      _os_log_impl(&dword_225D9B000, v9, OS_LOG_TYPE_ERROR, "No profile identifier from the RM account!", v15, 2u);
    }
    __int16 v10 = [MEMORY[0x263EFB210] defaultStore];
    int v11 = objc_msgSend(v10, "dmc_iCloudAccountForRemoteManagingAccountWithAltDSID:", v4);

    if (v11)
    {
      uint64_t v12 = objc_msgSend(v11, "dmc_personaIdentifier");
      [(DMCUnenrollmentFlowController *)self setPersonaID:v12];

      id v6 = v11;
    }
    else
    {
      int v13 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_225D9B000, v13, OS_LOG_TYPE_ERROR, "No iCloud account found!", v14, 2u);
      }
      id v6 = 0;
    }
  }
  [(DMCUnenrollmentFlowController *)self setProfileIdentifier:v7];
  [(DMCEnrollmentFlowControllerBase *)self _pollNextStep];
}

- (void)_askForUserConfirmationIsAppleMAID:(BOOL)a3
{
  objc_initWeak(&location, self);
  id v4 = [(DMCUnenrollmentFlowController *)self presenter];
  BOOL v5 = [(DMCUnenrollmentFlowController *)self isAppleMAID];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __68__DMCUnenrollmentFlowController__askForUserConfirmationIsAppleMAID___block_invoke;
  v6[3] = &unk_2647788F8;
  objc_copyWeak(&v7, &location);
  [v4 requestUserConfirmationIsAppleMAID:v5 completionHandler:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __68__DMCUnenrollmentFlowController__askForUserConfirmationIsAppleMAID___block_invoke(uint64_t a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v5 = [WeakRetained workerQueue];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __68__DMCUnenrollmentFlowController__askForUserConfirmationIsAppleMAID___block_invoke_2;
    v6[3] = &unk_2647788D0;
    void v6[4] = v4;
    char v7 = a2;
    [v5 queueBlock:v6];
  }
}

uint64_t __68__DMCUnenrollmentFlowController__askForUserConfirmationIsAppleMAID___block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) currentStep] != 1)
  {
    v2 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315138;
      id v6 = "-[DMCUnenrollmentFlowController _askForUserConfirmationIsAppleMAID:]_block_invoke_2";
      _os_log_impl(&dword_225D9B000, v2, OS_LOG_TYPE_ERROR, "completionHandler in %s was excuted multiple times!", (uint8_t *)&v5, 0xCu);
    }
  }
  uint64_t v3 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 40)) {
    return [v3 _pollNextStep];
  }
  else {
    return [v3 _flowTerminatedWithError:0 canceled:1];
  }
}

- (void)_askForPasscodeIfNeeded
{
  uint64_t v3 = [(DMCUnenrollmentFlowController *)self managedConfigurationHelper];
  int v4 = [v3 isDevicePasscodeSet];

  if (v4)
  {
    objc_initWeak(&location, self);
    int v5 = [(DMCUnenrollmentFlowController *)self presenter];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __56__DMCUnenrollmentFlowController__askForPasscodeIfNeeded__block_invoke;
    v6[3] = &unk_264778650;
    objc_copyWeak(&v7, &location);
    [v5 requestDevicePasscodeWithCompletionHandler:v6];

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  else
  {
    [(DMCEnrollmentFlowControllerBase *)self _pollNextStep];
  }
}

void __56__DMCUnenrollmentFlowController__askForPasscodeIfNeeded__block_invoke(uint64_t a1, uint64_t a2, char a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = [WeakRetained workerQueue];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __56__DMCUnenrollmentFlowController__askForPasscodeIfNeeded__block_invoke_2;
    v7[3] = &unk_2647788D0;
    v7[4] = v5;
    char v8 = a3;
    [v6 queueBlock:v7];
  }
}

uint64_t __56__DMCUnenrollmentFlowController__askForPasscodeIfNeeded__block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if ([*(id *)(a1 + 32) currentStep] != 2)
  {
    v2 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315138;
      id v6 = "-[DMCUnenrollmentFlowController _askForPasscodeIfNeeded]_block_invoke_2";
      _os_log_impl(&dword_225D9B000, v2, OS_LOG_TYPE_ERROR, "completionHandler in %s was excuted multiple times!", (uint8_t *)&v5, 0xCu);
    }
  }
  uint64_t v3 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 40)) {
    return [v3 _flowTerminatedWithError:0 canceled:1];
  }
  else {
    return [v3 _pollNextStep];
  }
}

- (void)_uninstallEnrollmentProfileWithIdentifier:(id)a3 personaID:(id)a4 altDSID:(id)a5 isAppleMAID:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = [(DMCUnenrollmentFlowController *)self presenter];
  [v13 presentActivityPageForAppleMAID:v6];

  if (v10)
  {
    v14 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_225D9B000, v14, OS_LOG_TYPE_DEFAULT, "Unenrolling with profile identifier...", buf, 2u);
    }
    __int16 v15 = [(DMCUnenrollmentFlowController *)self managedConfigurationHelper];
    [v15 removeProfileWithIdentifier:v10 async:0];
LABEL_5:

    goto LABEL_6;
  }
  if (!v11)
  {
    if (!v12) {
      goto LABEL_6;
    }
    v20 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_225D9B000, v20, OS_LOG_TYPE_DEFAULT, "Unenrolling with altDSID...", v24, 2u);
    }
    __int16 v15 = [MEMORY[0x263EFB210] defaultStore];
    uint64_t v21 = objc_msgSend(v15, "dmc_iCloudAccountForRemoteManagingAccountWithAltDSID:", v12);
    v22 = v21;
    if (v21 && objc_msgSend(v21, "dmc_isPrimaryAccount"))
    {
      v23 = objc_opt_new();
      [v23 signOutAllPrimaryAccounts];
    }
    objc_msgSend(v15, "dmc_removeMAIDRelatedAccountsWithAltDSID:asynchronous:", v12, 1);

    goto LABEL_5;
  }
  int v16 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v26 = 0;
    _os_log_impl(&dword_225D9B000, v16, OS_LOG_TYPE_DEFAULT, "Unenrolling with persona identifier...", v26, 2u);
  }
  __int16 v17 = [(DMCUnenrollmentFlowController *)self managedConfigurationHelper];
  char v18 = [v17 removeProfileAssociatedWithPersonaID:v11];

  if ((v18 & 1) == 0)
  {
    __int16 v19 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_225D9B000, v19, OS_LOG_TYPE_ERROR, "No MDM profile found!", v25, 2u);
    }
    __int16 v15 = [MEMORY[0x263EFB210] defaultStore];
    objc_msgSend(v15, "dmc_removeMAIDRelatedAccountsWithAltDSID:asynchronous:", v12, 1);
    goto LABEL_5;
  }
LABEL_6:
  [(DMCEnrollmentFlowControllerBase *)self _pollNextStep];
}

- (id)_nameForStep:(unint64_t)a3
{
  if (a3 - 1 > 2) {
    return @"PreflightUnenrollment";
  }
  else {
    return off_2647791E8[a3 - 1];
  }
}

- (DMCUnenrollmentFlowPresenter)presenter
{
  return self->_presenter;
}

- (void)setPresenter:(id)a3
{
}

- (DMCEnrollmentFlowMCBridge)managedConfigurationHelper
{
  return self->_managedConfigurationHelper;
}

- (void)setManagedConfigurationHelper:(id)a3
{
}

- (id)unenrollmentCompletionHandler
{
  return self->_unenrollmentCompletionHandler;
}

- (void)setUnenrollmentCompletionHandler:(id)a3
{
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
}

- (NSString)profileIdentifier
{
  return self->_profileIdentifier;
}

- (void)setProfileIdentifier:(id)a3
{
}

- (NSString)personaID
{
  return self->_personaID;
}

- (void)setPersonaID:(id)a3
{
}

- (BOOL)isAppleMAID
{
  return self->_isAppleMAID;
}

- (void)setIsAppleMAID:(BOOL)a3
{
  self->_isAppleMAID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaID, 0);
  objc_storeStrong((id *)&self->_profileIdentifier, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong(&self->_unenrollmentCompletionHandler, 0);
  objc_storeStrong((id *)&self->_managedConfigurationHelper, 0);
  objc_storeStrong((id *)&self->_presenter, 0);
}

@end