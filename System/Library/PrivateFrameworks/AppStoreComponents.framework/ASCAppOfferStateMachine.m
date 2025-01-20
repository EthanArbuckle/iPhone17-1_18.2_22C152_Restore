@interface ASCAppOfferStateMachine
- (ASCAppOfferSavedState)mostRecentState;
- (ASCAppOfferSavedState)overrideState;
- (ASCAppOfferStateCenter)stateCenter;
- (ASCAppOfferStateMachine)initWithOffer:(id)a3 stateCenter:(id)a4;
- (ASCOffer)offer;
- (NSMutableArray)delegates;
- (NSString)mostRecentStatusText;
- (id)performActionWithActivity:(id)a3 inContext:(id)a4;
- (void)addDelegate:(id)a3;
- (void)dealloc;
- (void)enumerateDelegatesUsingBlock:(id)a3;
- (void)installTemporaryWaitingState;
- (void)invalidateTemporaryStateForcingUpdate:(BOOL)a3;
- (void)offerStateDidChange:(id)a3 withMetadata:(id)a4 flags:(int64_t)a5;
- (void)offerStatusTextDidChange:(id)a3;
- (void)removeDelegate:(id)a3;
- (void)setMostRecentState:(id)a3;
- (void)setMostRecentStatusText:(id)a3;
- (void)setOverrideState:(id)a3;
- (void)viewAppForAppDistributionOffer:(id)a3;
@end

@implementation ASCAppOfferStateMachine

- (ASCAppOfferStateMachine)initWithOffer:(id)a3 stateCenter:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ASCAppOfferStateMachine;
  v8 = [(ASCAppOfferStateMachine *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copyWithZone:0];
    offer = v8->_offer;
    v8->_offer = (ASCOffer *)v9;

    objc_storeWeak((id *)&v8->_stateCenter, v7);
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    delegates = v8->_delegates;
    v8->_delegates = v11;
  }
  return v8;
}

- (void)dealloc
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    id v3 = [(ASCAppOfferStateMachine *)self stateCenter];
    id v4 = [(ASCAppOfferStateMachine *)self offer];
    [v3 stopObservingStateForOffer:v4];
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v12 = self;
      _os_log_impl(&dword_1C2B8D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "%@ is being destroyed on background thread", buf, 0xCu);
    }
    v5 = [(ASCAppOfferStateMachine *)self stateCenter];
    id v6 = [(ASCAppOfferStateMachine *)self offer];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __34__ASCAppOfferStateMachine_dealloc__block_invoke;
    block[3] = &unk_1E645D920;
    id v9 = v5;
    id v10 = v6;
    id v4 = v6;
    id v3 = v5;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  v7.receiver = self;
  v7.super_class = (Class)ASCAppOfferStateMachine;
  [(ASCAppOfferStateMachine *)&v7 dealloc];
}

uint64_t __34__ASCAppOfferStateMachine_dealloc__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) stopObservingStateForOffer:*(void *)(a1 + 40)];
}

- (void)addDelegate:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  v5 = [MEMORY[0x1E4F29238] valueWithWeakObject:v4];
  id v6 = [(ASCAppOfferStateMachine *)self delegates];
  char v7 = [v6 containsObject:v5];

  if ((v7 & 1) == 0)
  {
    v8 = [(ASCAppOfferStateMachine *)self delegates];
    [v8 addObject:v5];

    id v9 = [(ASCAppOfferStateMachine *)self mostRecentState];

    if (v9)
    {
      id v10 = [(ASCAppOfferStateMachine *)self mostRecentState];
      v11 = [v10 state];
      v12 = [(ASCAppOfferStateMachine *)self mostRecentState];
      uint64_t v13 = [v12 metadata];
      objc_super v14 = [(ASCAppOfferStateMachine *)self mostRecentState];
      objc_msgSend(v4, "offerStateDidChange:withMetadata:isActionable:", v11, v13, objc_msgSend(v14, "isActionable"));
    }
    v15 = [(ASCAppOfferStateMachine *)self mostRecentStatusText];

    if (v15)
    {
      v16 = [(ASCAppOfferStateMachine *)self mostRecentStatusText];
      [v4 offerStatusTextDidChange:v16];
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
      -[ASCAppOfferStateMachine addDelegate:]();
    }
  }
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  v5 = [MEMORY[0x1E4F29238] valueWithWeakObject:v4];
  id v6 = [(ASCAppOfferStateMachine *)self delegates];
  uint64_t v7 = [v6 indexOfObject:v5];

  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = [(ASCAppOfferStateMachine *)self delegates];
    [v8 removeObjectAtIndex:v7];

    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
      -[ASCAppOfferStateMachine removeDelegate:]();
    }
  }
}

- (void)enumerateDelegatesUsingBlock:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  id v6 = [(ASCAppOfferStateMachine *)self delegates];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __56__ASCAppOfferStateMachine_enumerateDelegatesUsingBlock___block_invoke;
  uint64_t v13 = &unk_1E645D948;
  id v14 = v5;
  id v15 = v4;
  id v7 = v4;
  id v8 = v5;
  [v6 enumerateObjectsUsingBlock:&v10];

  id v9 = [(ASCAppOfferStateMachine *)self delegates];
  [v9 removeObjectsAtIndexes:v8];
}

void __56__ASCAppOfferStateMachine_enumerateDelegatesUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = [a2 weakObjectValue];
  if (v5) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else {
    [*(id *)(a1 + 32) addIndex:a3];
  }
}

- (void)offerStateDidChange:(id)a3 withMetadata:(id)a4 flags:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  uint64_t v10 = [(ASCAppOfferStateMachine *)self mostRecentState];
  uint64_t v11 = [(ASCAppOfferStateMachine *)self overrideState];
  if (v11)
  {
    v12 = (void *)v11;
    uint64_t v13 = [(ASCAppOfferStateMachine *)self overrideState];
    id v14 = [v13 state];
    if ([v8 isEqualToString:v14])
    {
      v25 = v10;
      id v15 = [(ASCAppOfferStateMachine *)self overrideState];
      v16 = [v15 metadata];
      if ([v9 isEqual:v16])
      {
        v17 = [(ASCAppOfferStateMachine *)self overrideState];
        uint64_t v24 = [v17 flags];

        uint64_t v10 = v25;
        if (v24 == a5) {
          goto LABEL_9;
        }
        goto LABEL_8;
      }

      uint64_t v10 = v25;
    }
  }
LABEL_8:
  v18 = [[ASCAppOfferSavedState alloc] initWithState:v8 metadata:v9 flags:a5];
  [(ASCAppOfferStateMachine *)self setMostRecentState:v18];

LABEL_9:
  v19 = [(ASCAppOfferStateMachine *)self mostRecentState];
  int v20 = [v19 isLoadingFullState];

  if (!v20 || !v10)
  {
    v21 = [(ASCAppOfferStateMachine *)self overrideState];
    if (v21) {
      [(ASCAppOfferStateMachine *)self overrideState];
    }
    else {
    v22 = [(ASCAppOfferStateMachine *)self mostRecentState];
    }

    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __66__ASCAppOfferStateMachine_offerStateDidChange_withMetadata_flags___block_invoke;
    v26[3] = &unk_1E645D970;
    id v27 = v22;
    id v23 = v22;
    [(ASCAppOfferStateMachine *)self enumerateDelegatesUsingBlock:v26];
  }
}

void __66__ASCAppOfferStateMachine_offerStateDidChange_withMetadata_flags___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v6 = [v3 state];
  id v5 = [*(id *)(a1 + 32) metadata];
  objc_msgSend(v4, "offerStateDidChange:withMetadata:isActionable:", v6, v5, objc_msgSend(*(id *)(a1 + 32), "isActionable"));
}

- (void)offerStatusTextDidChange:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  [(ASCAppOfferStateMachine *)self setMostRecentStatusText:v4];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__ASCAppOfferStateMachine_offerStatusTextDidChange___block_invoke;
  v6[3] = &unk_1E645D970;
  id v7 = v4;
  id v5 = v4;
  [(ASCAppOfferStateMachine *)self enumerateDelegatesUsingBlock:v6];
}

uint64_t __52__ASCAppOfferStateMachine_offerStatusTextDidChange___block_invoke(uint64_t a1, void *a2)
{
  return [a2 offerStatusTextDidChange:*(void *)(a1 + 32)];
}

- (id)performActionWithActivity:(id)a3 inContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ASCAppOfferStateMachine *)self stateCenter];
  id v9 = [(ASCAppOfferStateMachine *)self offer];
  uint64_t v10 = [v8 performActionOfOffer:v9 withActivity:v7 inContext:v6];

  return v10;
}

- (void)viewAppForAppDistributionOffer:(id)a3
{
  id v4 = a3;
  id v5 = [(ASCAppOfferStateMachine *)self stateCenter];
  [v5 viewAppForAppDistributionOffer:v4];
}

- (void)installTemporaryWaitingState
{
  id v12 = [(ASCAppOfferStateMachine *)self mostRecentState];
  id v3 = [v12 state];
  if ([v3 isEqualToString:@"openable"]) {
    goto LABEL_6;
  }
  id v4 = [(ASCAppOfferStateMachine *)self mostRecentState];
  id v5 = [v4 state];
  if ([v5 isEqualToString:@"waiting"])
  {
LABEL_5:

LABEL_6:
    goto LABEL_7;
  }
  id v6 = [(ASCAppOfferStateMachine *)self mostRecentState];
  id v7 = [v6 state];
  if ([v7 isEqualToString:@"installing"])
  {

    goto LABEL_5;
  }
  id v8 = [(ASCAppOfferStateMachine *)self mostRecentState];
  id v9 = [v8 state];
  char v10 = [v9 isEqualToString:@"installed"];

  if (v10) {
    return;
  }
  id v12 = +[ASCOfferMetadata indeterminateProgressMetadata];
  uint64_t v11 = [[ASCAppOfferSavedState alloc] initWithState:@"waiting" metadata:v12 flags:0];
  [(ASCAppOfferStateMachine *)self setOverrideState:v11];

  [(ASCAppOfferStateMachine *)self offerStateDidChange:@"waiting" withMetadata:v12 flags:0];
LABEL_7:
}

- (void)invalidateTemporaryStateForcingUpdate:(BOOL)a3
{
  BOOL v3 = a3;
  [(ASCAppOfferStateMachine *)self setOverrideState:0];
  if (v3)
  {
    id v5 = [(ASCAppOfferStateMachine *)self mostRecentState];

    if (v5)
    {
      id v10 = [(ASCAppOfferStateMachine *)self mostRecentState];
      id v6 = [v10 state];
      id v7 = [(ASCAppOfferStateMachine *)self mostRecentState];
      id v8 = [v7 metadata];
      id v9 = [(ASCAppOfferStateMachine *)self mostRecentState];
      -[ASCAppOfferStateMachine offerStateDidChange:withMetadata:flags:](self, "offerStateDidChange:withMetadata:flags:", v6, v8, [v9 flags]);
    }
  }
}

- (ASCOffer)offer
{
  return self->_offer;
}

- (ASCAppOfferStateCenter)stateCenter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stateCenter);

  return (ASCAppOfferStateCenter *)WeakRetained;
}

- (NSMutableArray)delegates
{
  return self->_delegates;
}

- (ASCAppOfferSavedState)mostRecentState
{
  return self->_mostRecentState;
}

- (void)setMostRecentState:(id)a3
{
}

- (NSString)mostRecentStatusText
{
  return self->_mostRecentStatusText;
}

- (void)setMostRecentStatusText:(id)a3
{
}

- (ASCAppOfferSavedState)overrideState
{
  return self->_overrideState;
}

- (void)setOverrideState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideState, 0);
  objc_storeStrong((id *)&self->_mostRecentStatusText, 0);
  objc_storeStrong((id *)&self->_mostRecentState, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_destroyWeak((id *)&self->_stateCenter);

  objc_storeStrong((id *)&self->_offer, 0);
}

- (void)addDelegate:.cold.1()
{
  uint64_t v1 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_1();
  _os_log_debug_impl(&dword_1C2B8D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%@ added delegate %@", v0, 0x16u);
}

- (void)removeDelegate:.cold.1()
{
  uint64_t v1 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_1();
  _os_log_debug_impl(&dword_1C2B8D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "%@ removed delegate %@", v0, 0x16u);
}

@end