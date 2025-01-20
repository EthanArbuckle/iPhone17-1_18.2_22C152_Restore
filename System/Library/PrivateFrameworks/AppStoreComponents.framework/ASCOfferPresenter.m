@interface ASCOfferPresenter
- (ASCAppOfferStateMachine)offerStateMachine;
- (ASCOffer)offer;
- (ASCOfferPresenter)initWithView:(id)a3;
- (ASCOfferPresenter)initWithView:(id)a3 context:(id)a4;
- (ASCOfferPresenterObserver)observer;
- (ASCOfferPresenterView)view;
- (ASCOfferPresenterViewState)savedStateForConfirm;
- (ASCPresenterContext)context;
- (BOOL)clearConfirmForNewStateIfNeeded;
- (BOOL)confirmOfferActionIfNeeded;
- (BOOL)viewAppForAppDistributionOffer;
- (NSString)description;
- (NSString)mostRecentAppState;
- (void)confirmOfferActionIfNeeded;
- (void)offerStateDidChange:(id)a3 withMetadata:(id)a4 isActionable:(BOOL)a5;
- (void)offerStatusTextDidChange:(id)a3;
- (void)performOfferAction;
- (void)setMostRecentAppState:(id)a3;
- (void)setObserver:(id)a3;
- (void)setOffer:(id)a3;
- (void)setOfferStateMachine:(id)a3;
- (void)setSavedStateForConfirm:(id)a3;
@end

@implementation ASCOfferPresenter

- (ASCOfferPresenter)initWithView:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)ASCOfferPresenter;
  v8 = [(ASCOfferPresenter *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_view, v6);
    objc_storeStrong((id *)&v9->_context, a4);
    objc_storeStrong((id *)&v9->_mostRecentAppState, @"unknown");
  }

  return v9;
}

- (ASCOfferPresenter)initWithView:(id)a3
{
  id v4 = a3;
  v5 = +[ASCPresenterContext sharedContext];
  id v6 = [(ASCOfferPresenter *)self initWithView:v4 context:v5];

  return v6;
}

- (void)setOfferStateMachine:(id)a3
{
  v8 = (ASCAppOfferStateMachine *)a3;
  p_offerStateMachine = &self->_offerStateMachine;
  id v6 = self->_offerStateMachine;
  if (v8 && v6)
  {
    char v7 = [(ASCAppOfferStateMachine *)v6 isEqual:v8];

    if (v7) {
      goto LABEL_10;
    }
  }
  else
  {

    if (v6 == v8) {
      goto LABEL_10;
    }
  }
  if (*p_offerStateMachine) {
    [(ASCAppOfferStateMachine *)*p_offerStateMachine removeDelegate:self];
  }
  objc_storeStrong((id *)&self->_offerStateMachine, a3);
  if (*p_offerStateMachine) {
    [(ASCAppOfferStateMachine *)*p_offerStateMachine addDelegate:self];
  }
LABEL_10:
}

- (void)setOffer:(id)a3
{
  id v4 = (ASCOffer *)a3;
  offer = self->_offer;
  v25 = v4;
  if (!v4 || !offer)
  {
    if (offer == v4) {
      goto LABEL_14;
    }
LABEL_6:
    [(ASCOfferPresenter *)self setMostRecentAppState:@"unknown"];
    id v6 = (ASCOffer *)[(ASCOffer *)v25 copyWithZone:0];
    char v7 = self->_offer;
    self->_offer = v6;

    [(ASCOfferPresenter *)self clearConfirmForNewStateIfNeeded];
    v8 = [(ASCOfferPresenter *)self view];
    [v8 setOfferEnabled:1];

    char v9 = [(ASCOffer *)v25 flags];
    v10 = [(ASCOfferPresenter *)self view];
    objc_super v11 = v10;
    if ((v9 & 8) != 0) {
      v12 = @" ";
    }
    else {
      v12 = 0;
    }
    [v10 setOfferStatus:v12];

    if (v25)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v13 = v25;
        [(ASCOfferPresenter *)self setOfferStateMachine:0];
        v14 = [(ASCOfferPresenter *)self view];
        v15 = [(ASCOffer *)v13 action];
        [v14 setOfferInteractive:v15 != 0];

        v16 = [(ASCOfferPresenter *)self view];
        v17 = [(ASCOffer *)v13 metadata];

        [v16 setOfferMetadata:v17];
      }
      else
      {
        v21 = [(ASCOfferPresenter *)self view];
        [v21 setOfferInteractive:1];

        v22 = [(ASCOfferPresenter *)self context];
        v23 = [v22 appOfferStateCenter];
        v24 = [v23 stateMachineForOffer:v25];
        [(ASCOfferPresenter *)self setOfferStateMachine:v24];
      }
    }
    else
    {
      v18 = [(ASCOfferPresenter *)self view];
      [v18 setOfferInteractive:1];

      v19 = [(ASCOfferPresenter *)self view];
      v20 = +[ASCOfferMetadata emptyMetadata];
      [v19 setOfferMetadata:v20];

      [(ASCOfferPresenter *)self setOfferStateMachine:0];
    }
    goto LABEL_14;
  }
  if (([(ASCOffer *)offer isEqual:v4] & 1) == 0) {
    goto LABEL_6;
  }
LABEL_14:
}

- (BOOL)clearConfirmForNewStateIfNeeded
{
  v3 = [(ASCOfferPresenter *)self savedStateForConfirm];

  if (v3)
  {
    id v4 = [(ASCOfferPresenter *)self savedStateForConfirm];
    v5 = [v4 metadata];

    id v6 = [(ASCOfferPresenter *)self view];
    [v6 setOfferMetadata:v5];

    char v7 = [(ASCOfferPresenter *)self savedStateForConfirm];
    v8 = [v7 theme];

    char v9 = [(ASCOfferPresenter *)self view];
    [v9 setOfferTheme:v8];

    v10 = [(ASCOfferPresenter *)self view];
    [v10 endOfferModalState];

    [(ASCOfferPresenter *)self setSavedStateForConfirm:0];
  }
  return v3 != 0;
}

- (BOOL)confirmOfferActionIfNeeded
{
  if ([(ASCOfferPresenter *)self clearConfirmForNewStateIfNeeded]) {
    return 0;
  }
  id v4 = [(ASCOfferPresenter *)self offer];
  v5 = [v4 titles];
  id v6 = [v5 objectForKeyedSubscript:@"confirmation"];

  if (!v6
    || ([(ASCOfferPresenter *)self offer],
        char v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v7 flags],
        v7,
        (v8 & 4) != 0))
  {
    BOOL v3 = 0;
  }
  else
  {
    char v9 = [(ASCOfferPresenter *)self mostRecentAppState];
    if (([v9 isEqualToString:@"buyable"] & 1) != 0
      || [v9 isEqualToString:@"unknown"])
    {
      v10 = [(ASCOfferPresenter *)self view];
      objc_super v11 = [v10 saveOfferState];

      BOOL v3 = v11 != 0;
      if (v11)
      {
        v12 = [v11 metadata];
        if ([v12 isText])
        {
          id v13 = v12;
          v14 = [(ASCOfferPresenter *)self view];
          v15 = [v13 subtitle];

          v16 = +[ASCOfferMetadata textMetadataWithTitle:v6 subtitle:v15];
          [v14 setOfferMetadata:v16];
        }
        else
        {
          v14 = [(ASCOfferPresenter *)self view];
          v15 = +[ASCOfferMetadata textMetadataWithTitle:v6 subtitle:0];
          [v14 setOfferMetadata:v15];
        }

        v17 = [(ASCOfferPresenter *)self view];
        v18 = [v11 theme];
        v19 = +[ASCOfferTheme confirmationForTheme:v18];
        [v17 setOfferTheme:v19];

        objc_initWeak(&location, self);
        v20 = [(ASCOfferPresenter *)self view];
        uint64_t v22 = MEMORY[0x1E4F143A8];
        uint64_t v23 = 3221225472;
        v24 = __47__ASCOfferPresenter_confirmOfferActionIfNeeded__block_invoke;
        v25 = &unk_1E645D7E8;
        objc_copyWeak(&v26, &location);
        [v20 beginOfferModalStateWithCancelBlock:&v22];

        -[ASCOfferPresenter setSavedStateForConfirm:](self, "setSavedStateForConfirm:", v11, v22, v23, v24, v25);
        objc_destroyWeak(&v26);
        objc_destroyWeak(&location);
      }
      else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        -[ASCOfferPresenter confirmOfferActionIfNeeded](self);
      }
    }
    else
    {
      BOOL v3 = 0;
    }
  }
  return v3;
}

void __47__ASCOfferPresenter_confirmOfferActionIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained clearConfirmForNewStateIfNeeded];
}

- (void)performOfferAction
{
  BOOL v3 = [(ASCOfferPresenter *)self offerStateMachine];
  if (v3)
  {
    if (![(ASCOfferPresenter *)self confirmOfferActionIfNeeded])
    {
      id v4 = [(ASCOfferPresenter *)self view];
      [v4 setOfferInteractive:0];

      objc_initWeak(&location, self);
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __39__ASCOfferPresenter_performOfferAction__block_invoke;
      v28[3] = &unk_1E645E980;
      objc_copyWeak(&v30, &location);
      id v29 = v3;
      v5 = (void *)MEMORY[0x1C8768F90](v28);
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __39__ASCOfferPresenter_performOfferAction__block_invoke_4;
      v26[3] = &unk_1E645D6C8;
      id v6 = v5;
      id v27 = v6;
      char v7 = (void *)MEMORY[0x1C8768F90](v26);
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __39__ASCOfferPresenter_performOfferAction__block_invoke_5;
      v23[3] = &unk_1E645E9A8;
      objc_copyWeak(&v25, &location);
      char v8 = v7;
      id v24 = v8;
      char v9 = (void *)MEMORY[0x1C8768F90](v23);
      v10 = [(ASCOfferPresenter *)self observer];

      if (v10)
      {
        objc_super v11 = [(ASCOfferPresenter *)self mostRecentAppState];
        v12 = [(ASCOfferPresenter *)self observer];
        id v13 = [(ASCOfferPresenter *)self offer];
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __39__ASCOfferPresenter_performOfferAction__block_invoke_10;
        v21[3] = &unk_1E645DCB0;
        id v22 = v9;
        [v12 offerPresenterPreprocessOffer:v13 inState:v11 completionBlock:v21];
      }
      else if ([MEMORY[0x1E4F29060] isMainThread])
      {
        v8[2](v8);
      }
      else
      {
        dispatch_async(MEMORY[0x1E4F14428], v8);
      }

      objc_destroyWeak(&v25);
      objc_destroyWeak(&v30);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    uint64_t v14 = [(ASCOfferPresenter *)self offer];
    if (v14)
    {
      v15 = (void *)v14;
      v16 = [(ASCOfferPresenter *)self offer];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        v18 = [(ASCOfferPresenter *)self offer];
        v19 = [v18 action];

        if (v19)
        {
          v20 = [v18 action];
          v20[2]();
        }
      }
    }
  }
}

void __39__ASCOfferPresenter_performOfferAction__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    [*(id *)(a1 + 32) invalidateTemporaryStateForcingUpdate:0];
    v5 = objc_alloc_init(ASCMetricsActivity);
    id v6 = objc_alloc_init(ASCOfferContext);
    char v7 = [WeakRetained observer];
    char v8 = [WeakRetained offer];
    char v9 = [WeakRetained mostRecentAppState];
    v16 = v6;
    v17 = v5;
    [v7 offerPresenterWillPerformActionOfOffer:v8 inState:v9 withActivity:&v17 inContext:&v16 withPaymentSheetView:0];
    v10 = v17;

    objc_super v11 = v16;
    v12 = [*(id *)(a1 + 32) performActionWithActivity:v10 inContext:v11];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __39__ASCOfferPresenter_performOfferAction__block_invoke_2;
    v13[3] = &unk_1E645E958;
    objc_copyWeak(&v15, (id *)(a1 + 40));
    id v14 = *(id *)(a1 + 32);
    [v12 addFinishBlock:v13];

    objc_destroyWeak(&v15);
  }
}

void __39__ASCOfferPresenter_performOfferAction__block_invoke_2(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __39__ASCOfferPresenter_performOfferAction__block_invoke_3;
  v2[3] = &unk_1E645E930;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  id v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], v2);

  objc_destroyWeak(&v4);
}

void __39__ASCOfferPresenter_performOfferAction__block_invoke_3(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained offerStateMachine];
  v5 = *(void **)(a1 + 32);

  if (v4 == v5)
  {
    id v7 = objc_loadWeakRetained(v2);
    id v6 = [v7 view];
    [v6 setOfferInteractive:1];
  }
}

uint64_t __39__ASCOfferPresenter_performOfferAction__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __39__ASCOfferPresenter_performOfferAction__block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v3)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        __39__ASCOfferPresenter_performOfferAction__block_invoke_5_cold_1(v3);
      }
      v5 = [WeakRetained view];
      [v5 setOfferInteractive:1];
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
}

void __39__ASCOfferPresenter_performOfferAction__block_invoke_10(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __39__ASCOfferPresenter_performOfferAction__block_invoke_2_12;
    v4[3] = &unk_1E645DC60;
    id v6 = *(id *)(a1 + 32);
    id v5 = v3;
    dispatch_async(MEMORY[0x1E4F14428], v4);
  }
}

uint64_t __39__ASCOfferPresenter_performOfferAction__block_invoke_2_12(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (BOOL)viewAppForAppDistributionOffer
{
  uint64_t v3 = [(ASCOfferPresenter *)self offer];
  if (v3)
  {
    id v4 = (void *)v3;
    id v5 = [(ASCOfferPresenter *)self offer];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v7 = [(ASCOfferPresenter *)self offer];
      char v8 = [(ASCOfferPresenter *)self offerStateMachine];
      [v8 viewAppForAppDistributionOffer:v7];

      LOBYTE(v3) = 1;
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (void)offerStateDidChange:(id)a3 withMetadata:(id)a4 isActionable:(BOOL)a5
{
  BOOL v5 = a5;
  id v14 = a3;
  id v8 = a4;
  [(ASCOfferPresenter *)self clearConfirmForNewStateIfNeeded];
  char v9 = [(ASCOfferPresenter *)self view];
  [v9 setOfferEnabled:v5];

  v10 = [(ASCOfferPresenter *)self view];
  [v10 setOfferMetadata:v8];

  id v11 = [(ASCOfferPresenter *)self mostRecentAppState];
  if (!v14 || !v11)
  {

    if (v11 == v14) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  char v12 = [v14 isEqual:v11];

  if ((v12 & 1) == 0)
  {
LABEL_6:
    id v13 = [(ASCOfferPresenter *)self observer];
    [v13 offerPresenterDidObserveChangeToState:v14];

    [(ASCOfferPresenter *)self setMostRecentAppState:v14];
  }
LABEL_7:
}

- (void)offerStatusTextDidChange:(id)a3
{
  id v4 = a3;
  id v5 = [(ASCOfferPresenter *)self view];
  [v5 setOfferStatus:v4];
}

- (NSString)description
{
  uint64_t v3 = [[ASCDescriber alloc] initWithObject:self];
  id v4 = [(ASCOfferPresenter *)self offer];
  [(ASCDescriber *)v3 addSensitiveObject:v4 withName:@"offer"];

  id v5 = [(ASCDescriber *)v3 finalizeDescription];

  return (NSString *)v5;
}

- (ASCOfferPresenterObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);

  return (ASCOfferPresenterObserver *)WeakRetained;
}

- (void)setObserver:(id)a3
{
}

- (ASCOffer)offer
{
  return self->_offer;
}

- (ASCOfferPresenterView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);

  return (ASCOfferPresenterView *)WeakRetained;
}

- (ASCPresenterContext)context
{
  return self->_context;
}

- (ASCAppOfferStateMachine)offerStateMachine
{
  return self->_offerStateMachine;
}

- (NSString)mostRecentAppState
{
  return self->_mostRecentAppState;
}

- (void)setMostRecentAppState:(id)a3
{
}

- (ASCOfferPresenterViewState)savedStateForConfirm
{
  return self->_savedStateForConfirm;
}

- (void)setSavedStateForConfirm:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_savedStateForConfirm, 0);
  objc_storeStrong((id *)&self->_mostRecentAppState, 0);
  objc_storeStrong((id *)&self->_offerStateMachine, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_view);
  objc_storeStrong((id *)&self->_offer, 0);

  objc_destroyWeak((id *)&self->_observer);
}

- (void)confirmOfferActionIfNeeded
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1 = [a1 view];
  int v2 = 138412290;
  uint64_t v3 = v1;
  _os_log_error_impl(&dword_1C2B8D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Offer presenter view %@ did not provide offer state for two phase buy", (uint8_t *)&v2, 0xCu);
}

void __39__ASCOfferPresenter_performOfferAction__block_invoke_5_cold_1(void *a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v1 = [a1 localizedDescription];
  int v2 = 138412290;
  uint64_t v3 = v1;
  _os_log_error_impl(&dword_1C2B8D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Offer preprocessing failed with error: %@", (uint8_t *)&v2, 0xCu);
}

@end