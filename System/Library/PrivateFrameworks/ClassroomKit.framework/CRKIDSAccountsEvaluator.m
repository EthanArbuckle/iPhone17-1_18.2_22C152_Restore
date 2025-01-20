@interface CRKIDSAccountsEvaluator
- (CRKIDSAccountsEvaluator)initWithIDSLocalPrimitives:(id)a3;
- (CRKIDSAccountsState)state;
- (CRKIDSLocalPrimitives)IDSLocalPrimitives;
- (NSArray)observedAccounts;
- (void)beginObservingAccounts:(id)a3;
- (void)beginObservingKnownAccountChanges;
- (void)dealloc;
- (void)endObservingAccounts:(id)a3;
- (void)endObservingKnownAccountChanges;
- (void)knownAccountsDidChange;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)observedAccountDidChange:(id)a3;
- (void)setObservedAccounts:(id)a3;
- (void)setState:(id)a3;
- (void)updateState;
@end

@implementation CRKIDSAccountsEvaluator

- (void)dealloc
{
  [(CRKIDSAccountsEvaluator *)self endObservingKnownAccountChanges];
  v3 = [(CRKIDSAccountsEvaluator *)self observedAccounts];
  [(CRKIDSAccountsEvaluator *)self endObservingAccounts:v3];

  v4.receiver = self;
  v4.super_class = (Class)CRKIDSAccountsEvaluator;
  [(CRKIDSAccountsEvaluator *)&v4 dealloc];
}

- (CRKIDSAccountsEvaluator)initWithIDSLocalPrimitives:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRKIDSAccountsEvaluator;
  v6 = [(CRKIDSAccountsEvaluator *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_IDSLocalPrimitives, a3);
    observedAccounts = v7->_observedAccounts;
    v7->_observedAccounts = (NSArray *)MEMORY[0x263EFFA68];

    [(CRKIDSAccountsEvaluator *)v7 beginObservingKnownAccountChanges];
    [(CRKIDSAccountsEvaluator *)v7 knownAccountsDidChange];
  }

  return v7;
}

- (void)knownAccountsDidChange
{
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    v6 = [MEMORY[0x263F08690] currentHandler];
    v7 = NSStringFromSelector(a2);
    [v6 handleFailureInMethod:a2, self, @"CRKIDSAccountsEvaluator.m", 62, @"%@ must be called from the main thread", v7 object file lineNumber description];
  }
  objc_super v4 = [(CRKIDSAccountsEvaluator *)self IDSLocalPrimitives];
  id v8 = [v4 accounts];

  id v5 = [(CRKIDSAccountsEvaluator *)self observedAccounts];
  [(CRKIDSAccountsEvaluator *)self endObservingAccounts:v5];

  [(CRKIDSAccountsEvaluator *)self beginObservingAccounts:v8];
  [(CRKIDSAccountsEvaluator *)self setObservedAccounts:v8];
  [(CRKIDSAccountsEvaluator *)self updateState];
}

- (void)observedAccountDidChange:(id)a3
{
  if ((objc_msgSend(MEMORY[0x263F08B88], "isMainThread", a3) & 1) == 0)
  {
    id v5 = [MEMORY[0x263F08690] currentHandler];
    v6 = NSStringFromSelector(a2);
    [v5 handleFailureInMethod:a2, self, @"CRKIDSAccountsEvaluator.m", 75, @"%@ must be called from the main thread", v6 object file lineNumber description];
  }

  [(CRKIDSAccountsEvaluator *)self updateState];
}

- (void)beginObservingKnownAccountChanges
{
  id v3 = [(CRKIDSAccountsEvaluator *)self IDSLocalPrimitives];
  [v3 addObserver:self forKeyPath:@"accounts" options:0 context:@"CRKIDSAccountsEvaluatorContext"];
}

- (void)endObservingKnownAccountChanges
{
  id v3 = [(CRKIDSAccountsEvaluator *)self IDSLocalPrimitives];
  [v3 removeObserver:self forKeyPath:@"accounts" context:@"CRKIDSAccountsEvaluatorContext"];
}

- (void)beginObservingAccounts:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) addObserver:self forKeyPath:@"active" options:0 context:@"CRKIDSAccountsEvaluatorContext"];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)endObservingAccounts:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) removeObserver:self forKeyPath:@"active" context:@"CRKIDSAccountsEvaluatorContext"];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  long long v11 = v10;
  if (a6 == @"CRKIDSAccountsEvaluatorContext")
  {
    if ([v10 isEqualToString:@"accounts"])
    {
      [(CRKIDSAccountsEvaluator *)self knownAccountsDidChange];
    }
    else if ([v11 isEqualToString:@"active"])
    {
      [(CRKIDSAccountsEvaluator *)self updateState];
    }
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)CRKIDSAccountsEvaluator;
    [(CRKIDSAccountsEvaluator *)&v12 observeValueForKeyPath:v10 ofObject:a4 change:a5 context:a6];
  }
}

- (void)updateState
{
  id v3 = [(CRKIDSAccountsEvaluator *)self IDSLocalPrimitives];
  id v4 = [v3 accounts];
  uint64_t v8 = +[CRKIDSAccountsState stateForAccounts:v4];

  uint64_t v5 = [(CRKIDSAccountsEvaluator *)self state];
  if (v5 | v8)
  {
    uint64_t v6 = [(CRKIDSAccountsEvaluator *)self state];
    char v7 = [v6 isEqual:v8];

    if ((v7 & 1) == 0) {
      [(CRKIDSAccountsEvaluator *)self setState:v8];
    }
  }
}

- (CRKIDSAccountsState)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
}

- (CRKIDSLocalPrimitives)IDSLocalPrimitives
{
  return self->_IDSLocalPrimitives;
}

- (NSArray)observedAccounts
{
  return self->_observedAccounts;
}

- (void)setObservedAccounts:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observedAccounts, 0);
  objc_storeStrong((id *)&self->_IDSLocalPrimitives, 0);

  objc_storeStrong((id *)&self->_state, 0);
}

@end