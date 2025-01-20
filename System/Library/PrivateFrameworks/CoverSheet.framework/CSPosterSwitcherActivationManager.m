@interface CSPosterSwitcherActivationManager
- (BOOL)handleEvent:(id)a3;
- (BOOL)hasBeenCoachedSinceReset;
- (BOOL)wouldHandleButtonEvent:(id)a3;
- (CSPosterSwitcherActivationManager)initWithSource:(id)a3 delegate:(id)a4 unlockRequester:(id)a5;
- (CSPosterSwitcherActivationManagerDelegate)delegate;
- (CSPosterSwitcherActivationSource)source;
- (CSUnlockRequesting)unlockRequester;
- (void)_failActivationWithReason:(unint64_t)a3 completion:(id)a4;
- (void)_presentCoachingMessage:(unint64_t)a3;
- (void)_resetUnauthenticatedActivationAttemptCount;
- (void)activateWithHandler:(id)a3 onFailure:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setHasBeenCoachedSinceReset:(BOOL)a3;
- (void)setSource:(id)a3;
- (void)setUnlockRequester:(id)a3;
@end

@implementation CSPosterSwitcherActivationManager

- (CSPosterSwitcherActivationManager)initWithSource:(id)a3 delegate:(id)a4 unlockRequester:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CSPosterSwitcherActivationManager;
  v11 = [(CSPosterSwitcherActivationManager *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_source, v8);
    objc_storeWeak((id *)&v12->_delegate, v9);
    objc_storeStrong((id *)&v12->_unlockRequester, a5);
    v12->_hasBeenCoachedSinceReset = 0;
  }

  return v12;
}

- (void)activateWithHandler:(id)a3 onFailure:(id)a4
{
  v6 = (void (**)(void))a3;
  v7 = (void (**)(id, __CFString *, void))a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_source);
  id v9 = [WeakRetained posterSwitcherPresentationStatus];

  uint64_t v10 = [v9 state];
  switch(v10)
  {
    case 2:
      v7[2](v7, @"Poster switcher is already presented", 0);
      break;
    case 1:
      v6[2](v6);
      break;
    case 0:
      uint64_t v11 = [v9 notReadyReason];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __67__CSPosterSwitcherActivationManager_activateWithHandler_onFailure___block_invoke;
      v12[3] = &unk_1E6ADA458;
      objc_super v14 = v6;
      v15 = v7;
      id v13 = v9;
      [(CSPosterSwitcherActivationManager *)self _failActivationWithReason:v11 completion:v12];

      break;
  }
}

void __67__CSPosterSwitcherActivationManager_activateWithHandler_onFailure___block_invoke(uint64_t a1, int a2, char a3)
{
  if (a2)
  {
    v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v4();
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 48);
    NSStringForCSPosterSwitcherPresentationNotReadyReason([*(id *)(a1 + 32) notReadyReason]);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    if (a3) {
      uint64_t v7 = 0;
    }
    else {
      uint64_t v7 = [*(id *)(a1 + 32) shouldProvideNotReadyFeedback];
    }
    (*(void (**)(uint64_t, id, uint64_t))(v6 + 16))(v6, v8, v7);
  }
}

- (BOOL)wouldHandleButtonEvent:(id)a3
{
  return 0;
}

- (BOOL)handleEvent:(id)a3
{
  uint64_t v4 = [a3 type];
  if (v4 == 25 || v4 == 12) {
    [(CSPosterSwitcherActivationManager *)self _resetUnauthenticatedActivationAttemptCount];
  }
  return 0;
}

- (void)_resetUnauthenticatedActivationAttemptCount
{
  v3 = SBLogDashBoard();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1D839D000, v3, OS_LOG_TYPE_DEFAULT, "PosterSwitcherActivationManager attempt count reset", v4, 2u);
  }

  self->_hasBeenCoachedSinceReset = 0;
}

- (void)_presentCoachingMessage:(unint64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (a3 == 1)
  {
    id v8 = WeakRetained;
    uint64_t v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v7 = [v6 localizedStringForKey:@"POSTER_SWITCHER_UNLOCK_TO_EDIT" value:&stru_1F3020248 table:@"SpringBoardUIServices"];
    [v8 posterSwitcherActivationManager:self didChangeToCoachingText:v7];
  }
  else
  {
    if (a3) {
      goto LABEL_6;
    }
    id v8 = WeakRetained;
    [WeakRetained posterSwitcherActivationManager:self didChangeToCoachingText:0];
  }
  id WeakRetained = v8;
LABEL_6:
}

- (void)_failActivationWithReason:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  if (a3 > 5) {
    goto LABEL_4;
  }
  if (a3 != 2)
  {
    [(CSPosterSwitcherActivationManager *)self _resetUnauthenticatedActivationAttemptCount];
LABEL_4:
    (*((void (**)(id, void, void))v6 + 2))(v6, 0, 0);
    goto LABEL_5;
  }
  if (self->_hasBeenCoachedSinceReset)
  {
    uint64_t v7 = [(CSUnlockRequesting *)self->_unlockRequester createUnlockRequest];
    [v7 setIntent:2];
    [v7 setSource:25];
    [v7 setWantsBiometricPresentation:1];
    [v7 setConfirmedNotInPocket:1];
    unlockRequester = self->_unlockRequester;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __74__CSPosterSwitcherActivationManager__failActivationWithReason_completion___block_invoke;
    v10[3] = &unk_1E6AD9000;
    v10[4] = self;
    id v11 = v6;
    [(CSUnlockRequesting *)unlockRequester unlockWithRequest:v7 completion:v10];
  }
  else
  {
    self->_hasBeenCoachedSinceReset = 1;
    [(CSPosterSwitcherActivationManager *)self _presentCoachingMessage:1];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    (*((void (**)(id, void, void))v6 + 2))(v6, 0, [WeakRetained userPresenceDetectedSinceWake] ^ 1);
  }
LABEL_5:
}

void __74__CSPosterSwitcherActivationManager__failActivationWithReason_completion___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) _resetUnauthenticatedActivationAttemptCount];
    dispatch_time_t v3 = dispatch_time(0, 150000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74__CSPosterSwitcherActivationManager__failActivationWithReason_completion___block_invoke_2;
    block[3] = &unk_1E6AD8B78;
    id v6 = *(id *)(a1 + 40);
    dispatch_after(v3, MEMORY[0x1E4F14428], block);
  }
  else
  {
    uint64_t v4 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v4();
  }
}

uint64_t __74__CSPosterSwitcherActivationManager__failActivationWithReason_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (CSPosterSwitcherActivationSource)source
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_source);

  return (CSPosterSwitcherActivationSource *)WeakRetained;
}

- (void)setSource:(id)a3
{
}

- (CSPosterSwitcherActivationManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CSPosterSwitcherActivationManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CSUnlockRequesting)unlockRequester
{
  return self->_unlockRequester;
}

- (void)setUnlockRequester:(id)a3
{
}

- (BOOL)hasBeenCoachedSinceReset
{
  return self->_hasBeenCoachedSinceReset;
}

- (void)setHasBeenCoachedSinceReset:(BOOL)a3
{
  self->_hasBeenCoachedSinceReset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unlockRequester, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_destroyWeak((id *)&self->_source);
}

@end