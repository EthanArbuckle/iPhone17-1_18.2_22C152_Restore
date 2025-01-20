@interface CRKDataSeparationBlockingClassKitFacade
+ (id)keyPathsForValuesAffectingAccountState;
+ (id)observedKeyPathsOnCurrentUserProvider;
- (CRKClassKitCurrentUserProvider)currentUserProvider;
- (CRKDataSeparationBlockingClassKitFacade)initWithClassKitFacade:(id)a3;
- (int64_t)modifiedAccountState;
- (int64_t)nextAccountState;
- (void)dealloc;
- (void)nextAccountState;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setModifiedAccountState:(int64_t)a3;
- (void)startObserving;
- (void)stopObserving;
- (void)updateAccountState;
@end

@implementation CRKDataSeparationBlockingClassKitFacade

- (void)dealloc
{
  [(CRKDataSeparationBlockingClassKitFacade *)self stopObserving];
  v3.receiver = self;
  v3.super_class = (Class)CRKDataSeparationBlockingClassKitFacade;
  [(CRKDataSeparationBlockingClassKitFacade *)&v3 dealloc];
}

- (CRKDataSeparationBlockingClassKitFacade)initWithClassKitFacade:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKDataSeparationBlockingClassKitFacade;
  v5 = [(CRKClassKitFacadeDecoratorBase *)&v9 initWithClassKitFacade:v4];
  if (v5)
  {
    v6 = [[CRKClassKitCurrentUserProvider alloc] initWithClassKitFacade:v4];
    currentUserProvider = v5->_currentUserProvider;
    v5->_currentUserProvider = v6;

    [(CRKDataSeparationBlockingClassKitFacade *)v5 startObserving];
    [(CRKDataSeparationBlockingClassKitFacade *)v5 updateAccountState];
  }

  return v5;
}

+ (id)observedKeyPathsOnCurrentUserProvider
{
  return (id)objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"currentUser", @"currentUserFetched", 0);
}

- (void)startObserving
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  objc_super v3 = objc_msgSend((id)objc_opt_class(), "observedKeyPathsOnCurrentUserProvider", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * v7);
        objc_super v9 = [(CRKDataSeparationBlockingClassKitFacade *)self currentUserProvider];
        [v9 addObserver:self forKeyPath:v8 options:0 context:@"CRKDataSeparationBlockingClassKitFacadeObservationContext"];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  v10 = [(CRKClassKitFacadeDecoratorBase *)self underlyingClassKitFacade];
  [v10 addObserver:self forKeyPath:@"accountState" options:0 context:@"CRKDataSeparationBlockingClassKitFacadeObservationContext"];
}

- (void)stopObserving
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  objc_super v3 = objc_msgSend((id)objc_opt_class(), "observedKeyPathsOnCurrentUserProvider", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * v7);
        objc_super v9 = [(CRKDataSeparationBlockingClassKitFacade *)self currentUserProvider];
        [v9 removeObserver:self forKeyPath:v8 context:@"CRKDataSeparationBlockingClassKitFacadeObservationContext"];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  v10 = [(CRKClassKitFacadeDecoratorBase *)self underlyingClassKitFacade];
  [v10 removeObserver:self forKeyPath:@"accountState" context:@"CRKDataSeparationBlockingClassKitFacadeObservationContext"];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == @"CRKDataSeparationBlockingClassKitFacadeObservationContext")
  {
    [(CRKDataSeparationBlockingClassKitFacade *)self updateAccountState];
  }
  else
  {
    uint64_t v9 = v6;
    uint64_t v10 = v7;
    v8.receiver = self;
    v8.super_class = (Class)CRKDataSeparationBlockingClassKitFacade;
    -[CRKDataSeparationBlockingClassKitFacade observeValueForKeyPath:ofObject:change:context:](&v8, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)updateAccountState
{
  int64_t v3 = [(CRKDataSeparationBlockingClassKitFacade *)self nextAccountState];
  if ([(CRKDataSeparationBlockingClassKitFacade *)self modifiedAccountState] != v3)
  {
    [(CRKDataSeparationBlockingClassKitFacade *)self setModifiedAccountState:v3];
  }
}

- (int64_t)nextAccountState
{
  int64_t v3 = [(CRKClassKitFacadeDecoratorBase *)self underlyingClassKitFacade];
  int64_t v4 = [v3 accountState];

  if (v4 == 2)
  {
    uint64_t v5 = [(CRKDataSeparationBlockingClassKitFacade *)self currentUserProvider];
    uint64_t v6 = [v5 currentUser];
    int v7 = [v6 hasDataSeparatedAccount];

    if (v7)
    {
      if (_CRKLogASM_onceToken_12 != -1) {
        dispatch_once(&_CRKLogASM_onceToken_12, &__block_literal_global_29);
      }
      objc_super v8 = (void *)_CRKLogASM_logObj_12;
      if (os_log_type_enabled((os_log_t)_CRKLogASM_logObj_12, OS_LOG_TYPE_ERROR)) {
        -[CRKDataSeparationBlockingClassKitFacade nextAccountState](v8);
      }
      return 0;
    }
    else
    {
      return 2;
    }
  }
  return v4;
}

+ (id)keyPathsForValuesAffectingAccountState
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:@"modifiedAccountState"];
}

- (CRKClassKitCurrentUserProvider)currentUserProvider
{
  return self->_currentUserProvider;
}

- (int64_t)modifiedAccountState
{
  return self->_modifiedAccountState;
}

- (void)setModifiedAccountState:(int64_t)a3
{
  self->_modifiedAccountState = a3;
}

- (void).cxx_destruct
{
}

- (void)nextAccountState
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1 = a1;
  int v2 = 138543362;
  uint64_t v3 = objc_opt_class();
  _os_log_error_impl(&dword_224C00000, v1, OS_LOG_TYPE_ERROR, "%{public}@: overriding account state to ineligible because the current user is data separated", (uint8_t *)&v2, 0xCu);
}

@end