@interface CRKPersonaMatchEnforcingClassKitFacade
+ (id)keyPathsForValuesAffectingAccountState;
- (BOOL)isPersonaEligible;
- (CRKClassKitCurrentUserProvider)currentUserProvider;
- (CRKPersonaMatchEnforcingClassKitFacade)initWithClassKitFacade:(id)a3;
- (int64_t)modifiedAccountState;
- (int64_t)nextAccountState;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setModifiedAccountState:(int64_t)a3;
- (void)startObserving;
- (void)stopObserving;
- (void)updateAccountState;
@end

@implementation CRKPersonaMatchEnforcingClassKitFacade

- (void)dealloc
{
  [(CRKPersonaMatchEnforcingClassKitFacade *)self stopObserving];
  v3.receiver = self;
  v3.super_class = (Class)CRKPersonaMatchEnforcingClassKitFacade;
  [(CRKPersonaMatchEnforcingClassKitFacade *)&v3 dealloc];
}

- (CRKPersonaMatchEnforcingClassKitFacade)initWithClassKitFacade:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKPersonaMatchEnforcingClassKitFacade;
  v5 = [(CRKClassKitFacadeDecoratorBase *)&v9 initWithClassKitFacade:v4];
  if (v5)
  {
    v6 = [[CRKClassKitCurrentUserProvider alloc] initWithClassKitFacade:v4];
    currentUserProvider = v5->_currentUserProvider;
    v5->_currentUserProvider = v6;

    [(CRKPersonaMatchEnforcingClassKitFacade *)v5 startObserving];
    [(CRKPersonaMatchEnforcingClassKitFacade *)v5 updateAccountState];
  }

  return v5;
}

- (void)startObserving
{
  objc_super v3 = [(CRKPersonaMatchEnforcingClassKitFacade *)self currentUserProvider];
  [v3 addObserver:self forKeyPath:@"currentUser" options:0 context:@"CRKPersonaMatchEnforcingClassKitFacadeObservationContext"];

  id v4 = [(CRKClassKitFacadeDecoratorBase *)self underlyingClassKitFacade];
  [v4 addObserver:self forKeyPath:@"accountState" options:0 context:@"CRKPersonaMatchEnforcingClassKitFacadeObservationContext"];
}

- (void)stopObserving
{
  objc_super v3 = [(CRKPersonaMatchEnforcingClassKitFacade *)self currentUserProvider];
  [v3 removeObserver:self forKeyPath:@"currentUser" context:@"CRKPersonaMatchEnforcingClassKitFacadeObservationContext"];

  id v4 = [(CRKClassKitFacadeDecoratorBase *)self underlyingClassKitFacade];
  [v4 removeObserver:self forKeyPath:@"accountState" context:@"CRKPersonaMatchEnforcingClassKitFacadeObservationContext"];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == @"CRKPersonaMatchEnforcingClassKitFacadeObservationContext")
  {
    [(CRKPersonaMatchEnforcingClassKitFacade *)self updateAccountState];
  }
  else
  {
    uint64_t v9 = v6;
    uint64_t v10 = v7;
    v8.receiver = self;
    v8.super_class = (Class)CRKPersonaMatchEnforcingClassKitFacade;
    -[CRKPersonaMatchEnforcingClassKitFacade observeValueForKeyPath:ofObject:change:context:](&v8, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)updateAccountState
{
  int64_t v3 = [(CRKPersonaMatchEnforcingClassKitFacade *)self nextAccountState];
  if ([(CRKPersonaMatchEnforcingClassKitFacade *)self modifiedAccountState] != v3)
  {
    [(CRKPersonaMatchEnforcingClassKitFacade *)self setModifiedAccountState:v3];
  }
}

- (int64_t)nextAccountState
{
  int64_t v3 = [(CRKClassKitFacadeDecoratorBase *)self underlyingClassKitFacade];
  int64_t v4 = [v3 accountState];

  if (v4 == 2 && ![(CRKPersonaMatchEnforcingClassKitFacade *)self isPersonaEligible]) {
    return 0;
  }
  return v4;
}

- (BOOL)isPersonaEligible
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v2 = [(CRKPersonaMatchEnforcingClassKitFacade *)self currentUserProvider];
  int64_t v3 = [v2 currentUser];

  if (v3 && [v3 requiresPersonaMatch] && (objc_msgSend(v3, "hasMatchingPersona") & 1) == 0)
  {
    if (_CRKLogASM_onceToken_29 != -1) {
      dispatch_once(&_CRKLogASM_onceToken_29, &__block_literal_global_97);
    }
    uint64_t v6 = (void *)_CRKLogASM_logObj_29;
    BOOL v4 = 0;
    if (os_log_type_enabled((os_log_t)_CRKLogASM_logObj_29, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = v6;
      int v8 = 138543362;
      uint64_t v9 = objc_opt_class();
      _os_log_impl(&dword_224C00000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: persona is ineligible because it doesn't match the ClassKit persona and a match is required", (uint8_t *)&v8, 0xCu);

      BOOL v4 = 0;
    }
  }
  else
  {
    BOOL v4 = 1;
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

@end