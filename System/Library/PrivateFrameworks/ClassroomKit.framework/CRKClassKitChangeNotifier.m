@interface CRKClassKitChangeNotifier
- (BOOL)updateObservedTrustedPersonIDsWithRoster:(id)a3;
- (CRKClassKitChangeNotifier)initWithRequirements:(id)a3;
- (CRKClassKitChangeNotifierDelegate)delegate;
- (CRKClassKitRosterRequirements)requirements;
- (NSSet)observedTrustedPersonIDs;
- (id)generalObserverToken;
- (id)makeObserverBlock;
- (id)trustedPersonIDsInRoster:(id)a3;
- (id)trustedPersonObserverToken;
- (void)dataChanged;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setGeneralObserverToken:(id)a3;
- (void)setObservedTrustedPersonIDs:(id)a3;
- (void)setTrustedPersonObserverToken:(id)a3;
- (void)startObservingGeneralChanges;
- (void)stopObservingGeneralChanges;
- (void)stopObservingTrustedPersons;
@end

@implementation CRKClassKitChangeNotifier

- (void)dealloc
{
  v3 = [(CRKClassKitChangeNotifier *)self generalObserverToken];
  v4 = [(CRKClassKitChangeNotifier *)self trustedPersonObserverToken];
  v5 = [(CRKClassKitChangeNotifier *)self requirements];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__CRKClassKitChangeNotifier_dealloc__block_invoke;
  block[3] = &unk_2646F42C0;
  id v11 = v3;
  id v12 = v5;
  id v13 = v4;
  id v6 = v4;
  id v7 = v5;
  id v8 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);

  v9.receiver = self;
  v9.super_class = (Class)CRKClassKitChangeNotifier;
  [(CRKClassKitChangeNotifier *)&v9 dealloc];
}

uint64_t __36__CRKClassKitChangeNotifier_dealloc__block_invoke(uint64_t result)
{
  uint64_t v1 = result;
  if (*(void *)(result + 32)) {
    result = objc_msgSend(*(id *)(result + 40), "removeObserver:");
  }
  if (*(void *)(v1 + 48))
  {
    v2 = *(void **)(v1 + 40);
    return objc_msgSend(v2, "removeObserver:");
  }
  return result;
}

- (CRKClassKitChangeNotifier)initWithRequirements:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CRKClassKitChangeNotifier;
  id v6 = [(CRKClassKitChangeNotifier *)&v11 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_requirements, a3);
    uint64_t v8 = objc_opt_new();
    observedTrustedPersonIDs = v7->_observedTrustedPersonIDs;
    v7->_observedTrustedPersonIDs = (NSSet *)v8;

    [(CRKClassKitChangeNotifier *)v7 startObservingGeneralChanges];
  }

  return v7;
}

- (BOOL)updateObservedTrustedPersonIDsWithRoster:(id)a3
{
  uint64_t v4 = [(CRKClassKitChangeNotifier *)self trustedPersonIDsInRoster:a3];
  uint64_t v5 = [(CRKClassKitChangeNotifier *)self observedTrustedPersonIDs];
  if (v5 | v4
    && (id v6 = (void *)v5,
        [(CRKClassKitChangeNotifier *)self observedTrustedPersonIDs],
        id v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v7 isEqual:v4],
        v7,
        v6,
        (v8 & 1) == 0))
  {
    [(CRKClassKitChangeNotifier *)self setObservedTrustedPersonIDs:v4];
    [(CRKClassKitChangeNotifier *)self stopObservingTrustedPersons];
    v10 = [(CRKClassKitChangeNotifier *)self requirements];
    objc_super v11 = [(CRKClassKitChangeNotifier *)self makeObserverBlock];
    id v12 = [v10 addObserverForPersonIDs:v4 observerBlock:v11];
    [(CRKClassKitChangeNotifier *)self setTrustedPersonObserverToken:v12];

    BOOL v9 = 1;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)startObservingGeneralChanges
{
  id v5 = [(CRKClassKitChangeNotifier *)self requirements];
  v3 = [(CRKClassKitChangeNotifier *)self makeObserverBlock];
  uint64_t v4 = [v5 addGeneralObserver:v3];
  [(CRKClassKitChangeNotifier *)self setGeneralObserverToken:v4];
}

- (void)stopObservingGeneralChanges
{
  v3 = [(CRKClassKitChangeNotifier *)self generalObserverToken];

  if (v3)
  {
    uint64_t v4 = [(CRKClassKitChangeNotifier *)self requirements];
    id v5 = [(CRKClassKitChangeNotifier *)self generalObserverToken];
    [v4 removeObserver:v5];

    [(CRKClassKitChangeNotifier *)self setGeneralObserverToken:0];
  }
}

- (void)stopObservingTrustedPersons
{
  v3 = [(CRKClassKitChangeNotifier *)self trustedPersonObserverToken];

  if (v3)
  {
    uint64_t v4 = [(CRKClassKitChangeNotifier *)self requirements];
    id v5 = [(CRKClassKitChangeNotifier *)self trustedPersonObserverToken];
    [v4 removeObserver:v5];

    [(CRKClassKitChangeNotifier *)self setTrustedPersonObserverToken:0];
  }
}

- (id)makeObserverBlock
{
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __46__CRKClassKitChangeNotifier_makeObserverBlock__block_invoke;
  v4[3] = &unk_2646F3D40;
  objc_copyWeak(&v5, &location);
  v2 = (void *)MEMORY[0x22A620AF0](v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);

  return v2;
}

void __46__CRKClassKitChangeNotifier_makeObserverBlock__block_invoke(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__CRKClassKitChangeNotifier_makeObserverBlock__block_invoke_2;
  block[3] = &unk_2646F3D40;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v2);
}

void __46__CRKClassKitChangeNotifier_makeObserverBlock__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dataChanged];
}

- (void)dataChanged
{
  if (_CRKLogASM_onceToken_25 != -1) {
    dispatch_once(&_CRKLogASM_onceToken_25, &__block_literal_global_87);
  }
  v3 = _CRKLogASM_logObj_25;
  if (os_log_type_enabled((os_log_t)_CRKLogASM_logObj_25, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_224C00000, v3, OS_LOG_TYPE_DEFAULT, "ClassKit data changed", v5, 2u);
  }
  uint64_t v4 = [(CRKClassKitChangeNotifier *)self delegate];
  [v4 notifierDidObserveClassKitChange:self];
}

- (id)trustedPersonIDsInRoster:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = objc_opt_new();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v19 = v3;
  id v5 = [v3 courses];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        objc_super v11 = [v10 trustedUsers];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v21;
          do
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v21 != v14) {
                objc_enumerationMutation(v11);
              }
              v16 = [*(id *)(*((void *)&v20 + 1) + 8 * j) identifier];
              [v4 addObject:v16];
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
          }
          while (v13);
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v7);
  }

  v17 = (void *)[v4 copy];

  return v17;
}

- (CRKClassKitChangeNotifierDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CRKClassKitChangeNotifierDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CRKClassKitRosterRequirements)requirements
{
  return self->_requirements;
}

- (id)generalObserverToken
{
  return self->_generalObserverToken;
}

- (void)setGeneralObserverToken:(id)a3
{
}

- (id)trustedPersonObserverToken
{
  return self->_trustedPersonObserverToken;
}

- (void)setTrustedPersonObserverToken:(id)a3
{
}

- (NSSet)observedTrustedPersonIDs
{
  return self->_observedTrustedPersonIDs;
}

- (void)setObservedTrustedPersonIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observedTrustedPersonIDs, 0);
  objc_storeStrong(&self->_trustedPersonObserverToken, 0);
  objc_storeStrong(&self->_generalObserverToken, 0);
  objc_storeStrong((id *)&self->_requirements, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end