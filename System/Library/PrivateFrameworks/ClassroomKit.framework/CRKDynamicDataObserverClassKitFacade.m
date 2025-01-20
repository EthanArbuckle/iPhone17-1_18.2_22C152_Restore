@interface CRKDynamicDataObserverClassKitFacade
+ (id)dynamicDataObserverFacadeWithClassKitFacade:(id)a3 expectedUserRole:(int64_t)a4;
- (BOOL)dataObserversAreRegistered;
- (CRKClassKitCurrentUserProvider)currentUserProvider;
- (CRKDynamicDataObserverClassKitFacade)initWithClassKitFacade:(id)a3 expectedUserRole:(int64_t)a4;
- (NSMutableArray)dataObservers;
- (int64_t)expectedUserRole;
- (void)addDataObserver:(id)a3;
- (void)dealloc;
- (void)deregisterDataObservers;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)registerDataObservers;
- (void)removeDataObserver:(id)a3;
- (void)setDataObserversAreRegistered:(BOOL)a3;
- (void)startObservingCurrentUser;
- (void)stopObservingCurrentUser;
- (void)updateCurrentUserState;
@end

@implementation CRKDynamicDataObserverClassKitFacade

- (void)dealloc
{
  [(CRKDynamicDataObserverClassKitFacade *)self stopObservingCurrentUser];
  [(CRKDynamicDataObserverClassKitFacade *)self deregisterDataObservers];
  v3.receiver = self;
  v3.super_class = (Class)CRKDynamicDataObserverClassKitFacade;
  [(CRKDynamicDataObserverClassKitFacade *)&v3 dealloc];
}

+ (id)dynamicDataObserverFacadeWithClassKitFacade:(id)a3 expectedUserRole:(int64_t)a4
{
  id v5 = a3;
  v6 = (void *)[objc_alloc((Class)objc_opt_class()) initWithClassKitFacade:v5 expectedUserRole:a4];

  [v6 startObservingCurrentUser];

  return v6;
}

- (CRKDynamicDataObserverClassKitFacade)initWithClassKitFacade:(id)a3 expectedUserRole:(int64_t)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CRKDynamicDataObserverClassKitFacade;
  v7 = [(CRKClassKitFacadeDecoratorBase *)&v14 initWithClassKitFacade:v6];
  v8 = v7;
  if (v7)
  {
    v7->_expectedUserRole = a4;
    uint64_t v9 = objc_opt_new();
    dataObservers = v8->_dataObservers;
    v8->_dataObservers = (NSMutableArray *)v9;

    v11 = [[CRKClassKitCurrentUserProvider alloc] initWithClassKitFacade:v6];
    currentUserProvider = v8->_currentUserProvider;
    v8->_currentUserProvider = v11;
  }
  return v8;
}

- (void)updateCurrentUserState
{
  objc_super v3 = [(CRKDynamicDataObserverClassKitFacade *)self currentUserProvider];
  id v5 = [v3 currentUser];

  if ([(CRKDynamicDataObserverClassKitFacade *)self expectedUserRole] == 1
    && ([v5 isStudent] & 1) != 0)
  {
    int v4 = 1;
  }
  else
  {
    if ([(CRKDynamicDataObserverClassKitFacade *)self expectedUserRole] != 2)
    {
      [v5 hasEDUAccount];
      goto LABEL_10;
    }
    int v4 = [v5 isInstructor];
  }
  if ([v5 hasEDUAccount] && v4)
  {
    [(CRKDynamicDataObserverClassKitFacade *)self registerDataObservers];
    goto LABEL_11;
  }
LABEL_10:
  [(CRKDynamicDataObserverClassKitFacade *)self deregisterDataObservers];
LABEL_11:
}

- (void)registerDataObservers
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (![(CRKDynamicDataObserverClassKitFacade *)self dataObserversAreRegistered])
  {
    [(CRKDynamicDataObserverClassKitFacade *)self setDataObserversAreRegistered:1];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    objc_super v3 = [(CRKDynamicDataObserverClassKitFacade *)self dataObservers];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v11;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * v7);
          uint64_t v9 = [(CRKClassKitFacadeDecoratorBase *)self underlyingClassKitFacade];
          [v9 registerDataObserver:v8];

          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v5);
    }
  }
}

- (void)deregisterDataObservers
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if ([(CRKDynamicDataObserverClassKitFacade *)self dataObserversAreRegistered])
  {
    [(CRKDynamicDataObserverClassKitFacade *)self setDataObserversAreRegistered:0];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    objc_super v3 = [(CRKDynamicDataObserverClassKitFacade *)self dataObservers];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v11;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * v7);
          uint64_t v9 = [(CRKClassKitFacadeDecoratorBase *)self underlyingClassKitFacade];
          [v9 deregisterDataObserver:v8];

          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v5);
    }
  }
}

- (void)addDataObserver:(id)a3
{
  id v9 = a3;
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    uint64_t v7 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v8 = NSStringFromSelector(a2);
    [v7 handleFailureInMethod:a2, self, @"CRKDynamicDataObserverClassKitFacade.m", 100, @"%@ must be called from the main thread", v8 object file lineNumber description];
  }
  uint64_t v5 = [(CRKDynamicDataObserverClassKitFacade *)self dataObservers];
  [v5 addObject:v9];

  if ([(CRKDynamicDataObserverClassKitFacade *)self dataObserversAreRegistered])
  {
    uint64_t v6 = [(CRKClassKitFacadeDecoratorBase *)self underlyingClassKitFacade];
    [v6 registerDataObserver:v9];
  }
}

- (void)removeDataObserver:(id)a3
{
  id v9 = a3;
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    uint64_t v7 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v8 = NSStringFromSelector(a2);
    [v7 handleFailureInMethod:a2, self, @"CRKDynamicDataObserverClassKitFacade.m", 110, @"%@ must be called from the main thread", v8 object file lineNumber description];
  }
  uint64_t v5 = [(CRKDynamicDataObserverClassKitFacade *)self dataObservers];
  [v5 removeObject:v9];

  if ([(CRKDynamicDataObserverClassKitFacade *)self dataObserversAreRegistered])
  {
    uint64_t v6 = [(CRKClassKitFacadeDecoratorBase *)self underlyingClassKitFacade];
    [v6 deregisterDataObserver:v9];
  }
}

- (void)startObservingCurrentUser
{
  id v3 = [(CRKDynamicDataObserverClassKitFacade *)self currentUserProvider];
  [v3 addObserver:self forKeyPath:@"currentUser" options:4 context:@"ObservationContext"];
}

- (void)stopObservingCurrentUser
{
  id v3 = [(CRKDynamicDataObserverClassKitFacade *)self currentUserProvider];
  [v3 removeObserver:self forKeyPath:@"currentUser" context:@"ObservationContext"];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == @"ObservationContext")
  {
    [(CRKDynamicDataObserverClassKitFacade *)self updateCurrentUserState];
  }
  else
  {
    uint64_t v9 = v6;
    uint64_t v10 = v7;
    v8.receiver = self;
    v8.super_class = (Class)CRKDynamicDataObserverClassKitFacade;
    -[CRKDynamicDataObserverClassKitFacade observeValueForKeyPath:ofObject:change:context:](&v8, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (int64_t)expectedUserRole
{
  return self->_expectedUserRole;
}

- (CRKClassKitCurrentUserProvider)currentUserProvider
{
  return self->_currentUserProvider;
}

- (BOOL)dataObserversAreRegistered
{
  return self->_dataObserversAreRegistered;
}

- (void)setDataObserversAreRegistered:(BOOL)a3
{
  self->_dataObserversAreRegistered = a3;
}

- (NSMutableArray)dataObservers
{
  return self->_dataObservers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataObservers, 0);

  objc_storeStrong((id *)&self->_currentUserProvider, 0);
}

@end