@interface GKChallengeEventHandler
+ (GKChallengeEventHandler)challengeEventHandler;
- (GKChallengeEventHandlerUIDelegate)uiDelegate;
- (GKChallengeInternal)pendingCompletedChallenge;
- (GKChallengeInternal)pendingReceivedChallenge;
- (id)delegate;
- (void)challengeCompleted:(id)a3;
- (void)challengeReceived:(id)a3;
- (void)completedChallengeSelected:(id)a3;
- (void)receivedChallengeSelected:(id)a3;
- (void)setDelegate:(id)delegate;
- (void)setPendingCompletedChallenge:(id)a3;
- (void)setPendingReceivedChallenge:(id)a3;
- (void)setUiDelegate:(id)a3;
- (void)showBannerForChallenge:(id)a3 complete:(id)a4;
@end

@implementation GKChallengeEventHandler

+ (GKChallengeEventHandler)challengeEventHandler
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__GKChallengeEventHandler_challengeEventHandler__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (challengeEventHandler_onceToken != -1) {
    dispatch_once(&challengeEventHandler_onceToken, block);
  }
  v2 = (void *)challengeEventHandler_sSharedChallengeEventHandler;

  return (GKChallengeEventHandler *)v2;
}

uint64_t __48__GKChallengeEventHandler_challengeEventHandler__block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(GKChallengeEventHandler);
  v3 = (void *)challengeEventHandler_sSharedChallengeEventHandler;
  challengeEventHandler_sSharedChallengeEventHandler = (uint64_t)v2;

  id v4 = objc_alloc_init((Class)[*(id *)(a1 + 32) uiDelegateClass]);
  v5 = (void *)_block_invoke_sUIDelegate;
  _block_invoke_sUIDelegate = (uint64_t)v4;

  uint64_t v6 = _block_invoke_sUIDelegate;
  v7 = (void *)challengeEventHandler_sSharedChallengeEventHandler;

  return [v7 setUiDelegate:v6];
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (void)setDelegate:(id)delegate
{
  id obj = delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  id v6 = obj;
  if (WeakRetained != obj)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);

    id v6 = obj;
    if (v7 != obj)
    {
      id v5 = objc_storeWeak((id *)&self->_delegate, obj);
      if (self->_pendingReceivedChallenge)
      {
        -[GKChallengeEventHandler receivedChallengeSelected:](self, "receivedChallengeSelected:");
        id v5 = (id)[(GKChallengeEventHandler *)self setPendingReceivedChallenge:0];
      }
      id v6 = obj;
      if (self->_pendingCompletedChallenge)
      {
        -[GKChallengeEventHandler completedChallengeSelected:](self, "completedChallengeSelected:");
        id v5 = (id)[(GKChallengeEventHandler *)self setPendingCompletedChallenge:0];
        id v6 = obj;
      }
    }
  }

  MEMORY[0x1F41817F8](v5, v6);
}

- (void)receivedChallengeSelected:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v7 = v4;
    id v5 = [(GKChallengeEventHandler *)self delegate];
    if (v5)
    {
      if (objc_opt_respondsToSelector())
      {
        id v6 = +[GKChallenge challengeForInternalRepresentation:v7];
        [v5 localPlayerDidSelectChallenge:v6];
      }
    }
    else
    {
      [(GKChallengeEventHandler *)self setPendingReceivedChallenge:v7];
    }

    id v4 = v7;
  }
}

- (void)completedChallengeSelected:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v14 = v4;
    id v5 = [(GKChallengeEventHandler *)self delegate];
    if (v5)
    {
      id v6 = +[GKChallenge challengeForInternalRepresentation:v14];
      id v7 = [v6 receivingPlayer];
      v8 = [v7 internal];
      v9 = [v8 playerID];
      v10 = +[GKLocalPlayer localPlayer];
      v11 = [v10 internal];
      v12 = [v11 playerID];
      int v13 = [v9 isEqualToString:v12];

      if (v13)
      {
        if (objc_opt_respondsToSelector()) {
          [v5 localPlayerDidCompleteChallenge:v6];
        }
      }
      else if (objc_opt_respondsToSelector())
      {
        [v5 remotePlayerDidCompleteChallenge:v6];
      }
    }
    else
    {
      [(GKChallengeEventHandler *)self setPendingCompletedChallenge:v14];
    }

    id v4 = v14;
  }
}

- (void)challengeReceived:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_12;
  }
  id v5 = +[GKChallenge challengeForInternalRepresentation:v4];
  id v6 = [(GKChallengeEventHandler *)self delegate];
  id v7 = [MEMORY[0x1E4F28B50] mainBundle];
  v8 = [v7 infoDictionary];

  v9 = [v8 objectForKey:@"GKShowChallengeBanners"];
  v10 = v9;
  if (v9)
  {
    int v11 = [v9 BOOLValue];
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      if (!v11) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_8:
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __45__GKChallengeEventHandler_challengeReceived___block_invoke;
    v12[3] = &unk_1E646F558;
    v12[4] = self;
    id v13 = v5;
    id v14 = v4;
    [(GKChallengeEventHandler *)self showBannerForChallenge:v13 complete:v12];

    goto LABEL_9;
  }
  if ([v6 shouldShowBannerForLocallyReceivedChallenge:v5]) {
    goto LABEL_8;
  }
LABEL_9:
  if (objc_opt_respondsToSelector()) {
    [v6 localPlayerDidReceiveChallenge:v5];
  }

LABEL_12:
}

void __45__GKChallengeEventHandler_challengeReceived___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 localPlayerDidSelectChallenge:*(void *)(a1 + 40)];
  }
  if (!v4) {
    [*(id *)(a1 + 32) setPendingReceivedChallenge:*(void *)(a1 + 48)];
  }
  v2 = +[GKLocalPlayer localPlayer];
  v3 = [v2 eventEmitter];
  [v3 player:v2 wantsToPlayChallenge:*(void *)(a1 + 40)];
}

- (void)challengeCompleted:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_23;
  }
  id v23 = v4;
  id v6 = +[GKChallenge challengeForInternalRepresentation:v4];
  id v7 = [(GKChallengeEventHandler *)self delegate];
  v8 = [MEMORY[0x1E4F28B50] mainBundle];
  v9 = [v8 infoDictionary];

  v21 = v9;
  v10 = [v9 objectForKey:@"GKShowChallengeBanners"];
  int v11 = v10;
  v22 = self;
  if (v10) {
    int v20 = [v10 BOOLValue];
  }
  else {
    int v20 = 1;
  }
  v12 = [v6 receivingPlayer];
  id v13 = [v12 internal];
  id v14 = [v13 playerID];
  v15 = +[GKLocalPlayer localPlayer];
  v16 = [v15 internal];
  v17 = [v16 playerID];
  int v18 = [v14 isEqualToString:v17];

  if (!v18)
  {
    v19 = v22;
    if (objc_opt_respondsToSelector())
    {
      if (([v7 shouldShowBannerForRemotelyCompletedChallenge:v6] & 1) == 0)
      {
LABEL_18:
        if (objc_opt_respondsToSelector()) {
          [v7 remotePlayerDidCompleteChallenge:v6];
        }
        goto LABEL_20;
      }
    }
    else if (!v20)
    {
      goto LABEL_18;
    }
    [(GKChallengeEventHandler *)v22 showBannerForChallenge:v6 complete:0];
    goto LABEL_18;
  }
  v19 = v22;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if (!v20) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  if ([v7 shouldShowBannerForLocallyCompletedChallenge:v6]) {
LABEL_13:
  }
    [(GKChallengeEventHandler *)v22 showBannerForChallenge:v6 complete:0];
LABEL_14:
  if (objc_opt_respondsToSelector()) {
    [v7 localPlayerDidCompleteChallenge:v6];
  }
LABEL_20:
  if (!v7) {
    [(GKChallengeEventHandler *)v19 setPendingCompletedChallenge:v23];
  }

  id v5 = v23;
LABEL_23:

  MEMORY[0x1F41817F8](v4, v5);
}

- (void)showBannerForChallenge:(id)a3 complete:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = [v9 receivingPlayer];
  v8 = [v9 issuingPlayer];
  if ([v9 state] == 1)
  {
    if (objc_opt_respondsToSelector()) {
      [(GKChallengeEventHandlerUIDelegate *)self->_uiDelegate showReceivedBannerForIssuingPlayer:v8 challenge:v9 handler:v6];
    }
  }
  else if ([v7 isLocalPlayer])
  {
    if (objc_opt_respondsToSelector()) {
      [(GKChallengeEventHandlerUIDelegate *)self->_uiDelegate showLocallyCompletedBannerForIssuingPlayer:v8 challenge:v9 handler:v6];
    }
  }
  else if (objc_opt_respondsToSelector())
  {
    [(GKChallengeEventHandlerUIDelegate *)self->_uiDelegate showRemotelyCompletedBannerForReceivingPlayer:v7 challenge:v9 handler:v6];
  }
}

- (GKChallengeEventHandlerUIDelegate)uiDelegate
{
  return self->_uiDelegate;
}

- (void)setUiDelegate:(id)a3
{
}

- (GKChallengeInternal)pendingReceivedChallenge
{
  return self->_pendingReceivedChallenge;
}

- (void)setPendingReceivedChallenge:(id)a3
{
}

- (GKChallengeInternal)pendingCompletedChallenge
{
  return self->_pendingCompletedChallenge;
}

- (void)setPendingCompletedChallenge:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingCompletedChallenge, 0);
  objc_storeStrong((id *)&self->_pendingReceivedChallenge, 0);
  objc_storeStrong((id *)&self->_uiDelegate, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end