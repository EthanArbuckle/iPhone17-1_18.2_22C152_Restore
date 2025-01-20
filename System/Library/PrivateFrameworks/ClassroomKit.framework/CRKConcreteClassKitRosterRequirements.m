@interface CRKConcreteClassKitRosterRequirements
+ (id)instructorRosterRequirementsWithClassKitFacade:(id)a3;
+ (id)studentRosterRequirementsWithClassKitFacade:(id)a3;
- (BOOL)generalObserverConstituentsRegistered;
- (BOOL)isForInstructor;
- (BOOL)isForStudent;
- (BOOL)ownsError:(id)a3;
- (CRKCancelable)membershipDidChangeSubscription;
- (CRKCancelable)userDidChangeSubscription;
- (CRKClassKitFacade)classKitFacade;
- (CRKConcreteClassKitRosterRequirements)initWithClassKitFacade:(id)a3 isForInstructor:(BOOL)a4;
- (NSArray)dataObservers;
- (NSMutableDictionary)generalObserversByToken;
- (NSMutableDictionary)personObserversByToken;
- (id)addGeneralObserver:(id)a3;
- (id)addObserverForPersonIDs:(id)a3 observerBlock:(id)a4;
- (id)makeClassWithLocationID:(id)a3 name:(id)a4;
- (id)makeDataChangedBlockWithObserverDescription:(id)a3;
- (id)makeDataObservers;
- (id)makeInstructorQueryForSearchString:(id)a3 locationIDs:(id)a4 sortingGivenNameFirst:(BOOL)a5 pageSize:(int64_t)a6;
- (id)makeQueryForLocationsAllowingEasyStudentSignInForPersonID:(id)a3;
- (id)makeQueryForPersonsWithIdentifiers:(id)a3;
- (id)makeStudentQueryForSearchString:(id)a3 locationIDs:(id)a4 sortingGivenNameFirst:(BOOL)a5 pageSize:(int64_t)a6;
- (id)makeToken;
- (id)objectIDsOfPersonsInClass:(id)a3;
- (id)objectIDsOfTrustedPersonsInClass:(id)a3;
- (int64_t)accountState;
- (void)addNullableObserver:(id)a3 toArray:(id)a4;
- (void)addPerson:(id)a3 toClass:(id)a4;
- (void)addTrustedPerson:(id)a3 toClass:(id)a4;
- (void)callGeneralObserversWithReason:(id)a3;
- (void)classesWithCompletion:(id)a3;
- (void)currentUserWithCompletion:(id)a3;
- (void)dealloc;
- (void)deregisterDataObservers;
- (void)executeQuery:(id)a3;
- (void)locationsWithManagePermissionsForUserWithObjectID:(id)a3 completion:(id)a4;
- (void)locationsWithObjectIDs:(id)a3 completion:(id)a4;
- (void)makeDataObservers;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)personsInClassWithObjectID:(id)a3 completion:(id)a4;
- (void)registerDataObservers;
- (void)registerForCurrentUserChangeNotification;
- (void)registerForMembershipChangeDarwinNotification;
- (void)registerGeneralObserverConstituents;
- (void)removeClass:(id)a3 completion:(id)a4;
- (void)removeGeneralObserver:(id)a3;
- (void)removeObserver:(id)a3;
- (void)removePerson:(id)a3 fromClass:(id)a4;
- (void)removePersonObserver:(id)a3;
- (void)removeTrustedPerson:(id)a3 fromClass:(id)a4;
- (void)saveClass:(id)a3 completion:(id)a4;
- (void)setGeneralObserverConstituentsRegistered:(BOOL)a3;
- (void)setMembershipDidChangeSubscription:(id)a3;
- (void)setUserDidChangeSubscription:(id)a3;
- (void)startObservingAccountState;
- (void)stopObservingAccountState;
- (void)syncServerConfigWithCompletion:(id)a3;
- (void)trustedPersonsInClassWithObjectID:(id)a3 completion:(id)a4;
- (void)unregisterForCurrentUserChangeNotification;
- (void)unregisterForMembershipChangeDarwinNotification;
- (void)unregisterGeneralObserverConstituents;
@end

@implementation CRKConcreteClassKitRosterRequirements

- (void)dealloc
{
  [(CRKConcreteClassKitRosterRequirements *)self unregisterGeneralObserverConstituents];
  v3.receiver = self;
  v3.super_class = (Class)CRKConcreteClassKitRosterRequirements;
  [(CRKConcreteClassKitRosterRequirements *)&v3 dealloc];
}

+ (id)studentRosterRequirementsWithClassKitFacade:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithClassKitFacade:v4 isForInstructor:0];

  return v5;
}

+ (id)instructorRosterRequirementsWithClassKitFacade:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithClassKitFacade:v4 isForInstructor:1];

  return v5;
}

- (CRKConcreteClassKitRosterRequirements)initWithClassKitFacade:(id)a3 isForInstructor:(BOOL)a4
{
  id v7 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CRKConcreteClassKitRosterRequirements;
  v8 = [(CRKConcreteClassKitRosterRequirements *)&v17 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_classKitFacade, a3);
    v9->_forInstructor = a4;
    uint64_t v10 = objc_opt_new();
    generalObserversByToken = v9->_generalObserversByToken;
    v9->_generalObserversByToken = (NSMutableDictionary *)v10;

    uint64_t v12 = objc_opt_new();
    personObserversByToken = v9->_personObserversByToken;
    v9->_personObserversByToken = (NSMutableDictionary *)v12;

    uint64_t v14 = [(CRKConcreteClassKitRosterRequirements *)v9 makeDataObservers];
    dataObservers = v9->_dataObservers;
    v9->_dataObservers = (NSArray *)v14;
  }
  return v9;
}

- (BOOL)ownsError:(id)a3
{
  id v4 = a3;
  v5 = [(CRKConcreteClassKitRosterRequirements *)self classKitFacade];
  char v6 = [v5 ownsError:v4];

  return v6;
}

- (void)syncServerConfigWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(CRKConcreteClassKitRosterRequirements *)self classKitFacade];
  [v5 syncServerConfigWithCompletion:v4];
}

- (BOOL)isForStudent
{
  return ![(CRKConcreteClassKitRosterRequirements *)self isForInstructor];
}

- (void)removeGeneralObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(CRKConcreteClassKitRosterRequirements *)self generalObserversByToken];
  [v5 setObject:0 forKeyedSubscript:v4];

  char v6 = [(CRKConcreteClassKitRosterRequirements *)self generalObserversByToken];
  uint64_t v7 = [v6 count];

  if (!v7)
  {
    [(CRKConcreteClassKitRosterRequirements *)self unregisterGeneralObserverConstituents];
  }
}

- (void)removePersonObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(CRKConcreteClassKitRosterRequirements *)self personObserversByToken];
  id v7 = [v5 objectForKeyedSubscript:v4];

  [v7 cancel];
  char v6 = [(CRKConcreteClassKitRosterRequirements *)self personObserversByToken];
  [v6 setObject:0 forKeyedSubscript:v4];
}

- (id)makeToken
{
  return (id)[MEMORY[0x263F08C38] UUID];
}

- (void)registerGeneralObserverConstituents
{
  if (![(CRKConcreteClassKitRosterRequirements *)self generalObserverConstituentsRegistered])
  {
    [(CRKConcreteClassKitRosterRequirements *)self setGeneralObserverConstituentsRegistered:1];
    [(CRKConcreteClassKitRosterRequirements *)self registerDataObservers];
    [(CRKConcreteClassKitRosterRequirements *)self registerForCurrentUserChangeNotification];
    [(CRKConcreteClassKitRosterRequirements *)self registerForMembershipChangeDarwinNotification];
    [(CRKConcreteClassKitRosterRequirements *)self startObservingAccountState];
  }
}

- (void)unregisterGeneralObserverConstituents
{
  if ([(CRKConcreteClassKitRosterRequirements *)self generalObserverConstituentsRegistered])
  {
    [(CRKConcreteClassKitRosterRequirements *)self setGeneralObserverConstituentsRegistered:0];
    [(CRKConcreteClassKitRosterRequirements *)self deregisterDataObservers];
    [(CRKConcreteClassKitRosterRequirements *)self unregisterForCurrentUserChangeNotification];
    [(CRKConcreteClassKitRosterRequirements *)self unregisterForMembershipChangeDarwinNotification];
    [(CRKConcreteClassKitRosterRequirements *)self stopObservingAccountState];
  }
}

- (void)registerForCurrentUserChangeNotification
{
  objc_initWeak(&location, self);
  objc_super v3 = [(CRKConcreteClassKitRosterRequirements *)self userDidChangeSubscription];
  [v3 cancel];

  id v4 = [(CRKConcreteClassKitRosterRequirements *)self classKitFacade];
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  v8 = __81__CRKConcreteClassKitRosterRequirements_registerForCurrentUserChangeNotification__block_invoke;
  v9 = &unk_2646F3D40;
  objc_copyWeak(&v10, &location);
  id v5 = [v4 subscribeToCurrentUserDidChangeEvents:&v6];
  -[CRKConcreteClassKitRosterRequirements setUserDidChangeSubscription:](self, "setUserDidChangeSubscription:", v5, v6, v7, v8, v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __81__CRKConcreteClassKitRosterRequirements_registerForCurrentUserChangeNotification__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained callGeneralObserversWithReason:@"ClassKit current user changed"];
}

- (void)unregisterForCurrentUserChangeNotification
{
  objc_super v3 = [(CRKConcreteClassKitRosterRequirements *)self userDidChangeSubscription];
  [v3 cancel];

  [(CRKConcreteClassKitRosterRequirements *)self setUserDidChangeSubscription:0];
}

- (void)registerForMembershipChangeDarwinNotification
{
  if (![(CRKConcreteClassKitRosterRequirements *)self isForInstructor])
  {
    objc_initWeak(&location, self);
    objc_super v3 = [(CRKConcreteClassKitRosterRequirements *)self membershipDidChangeSubscription];
    [v3 cancel];

    id v4 = [(CRKConcreteClassKitRosterRequirements *)self classKitFacade];
    uint64_t v6 = MEMORY[0x263EF8330];
    uint64_t v7 = 3221225472;
    v8 = __86__CRKConcreteClassKitRosterRequirements_registerForMembershipChangeDarwinNotification__block_invoke;
    v9 = &unk_2646F3D40;
    objc_copyWeak(&v10, &location);
    id v5 = [v4 subscribeToClassMembershipChangeEvents:&v6];
    -[CRKConcreteClassKitRosterRequirements setMembershipDidChangeSubscription:](self, "setMembershipDidChangeSubscription:", v5, v6, v7, v8, v9);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __86__CRKConcreteClassKitRosterRequirements_registerForMembershipChangeDarwinNotification__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained callGeneralObserversWithReason:@"ClassKit class membership changed"];
}

- (void)unregisterForMembershipChangeDarwinNotification
{
  objc_super v3 = [(CRKConcreteClassKitRosterRequirements *)self membershipDidChangeSubscription];
  [v3 cancel];

  [(CRKConcreteClassKitRosterRequirements *)self setMembershipDidChangeSubscription:0];
}

- (id)makeDataObservers
{
  objc_super v3 = objc_opt_new();
  id v4 = [(CRKConcreteClassKitRosterRequirements *)self classKitFacade];
  id v5 = [v4 classDataObserverWithSortDescriptors:0];

  if (!v5)
  {
    uint64_t v6 = _CRKLogASM_11();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CRKConcreteClassKitRosterRequirements makeDataObservers](v6);
    }
  }
  uint64_t v7 = [(CRKConcreteClassKitRosterRequirements *)self makeDataChangedBlockWithObserverDescription:@"classes"];
  [v5 setDataChanged:v7];

  [(CRKConcreteClassKitRosterRequirements *)self addNullableObserver:v5 toArray:v3];
  if ([(CRKConcreteClassKitRosterRequirements *)self isForInstructor])
  {
    v8 = [(CRKConcreteClassKitRosterRequirements *)self classKitFacade];
    v9 = [v8 locationsObserverWithSortDescriptors:0];

    if (!v9)
    {
      id v10 = _CRKLogASM_11();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[CRKConcreteClassKitRosterRequirements makeDataObservers](v10);
      }
    }
    v11 = [(CRKConcreteClassKitRosterRequirements *)self makeDataChangedBlockWithObserverDescription:@"locations"];
    [v9 setDataChanged:v11];

    [(CRKConcreteClassKitRosterRequirements *)self addNullableObserver:v9 toArray:v3];
  }
  uint64_t v12 = (void *)[v3 copy];

  return v12;
}

- (void)addNullableObserver:(id)a3 toArray:(id)a4
{
  if (a3) {
    objc_msgSend(a4, "addObject:");
  }
}

- (id)makeDataChangedBlockWithObserverDescription:(id)a3
{
  id v4 = [NSString stringWithFormat:@"ClassKit data observer for '%@' fired", a3];
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __85__CRKConcreteClassKitRosterRequirements_makeDataChangedBlockWithObserverDescription___block_invoke;
  v8[3] = &unk_2646F4580;
  objc_copyWeak(&v10, &location);
  id v9 = v4;
  id v5 = v4;
  uint64_t v6 = (void *)MEMORY[0x22A620AF0](v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v6;
}

void __85__CRKConcreteClassKitRosterRequirements_makeDataChangedBlockWithObserverDescription___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __85__CRKConcreteClassKitRosterRequirements_makeDataChangedBlockWithObserverDescription___block_invoke_2;
  v2[3] = &unk_2646F3EC8;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  id v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], v2);

  objc_destroyWeak(&v4);
}

void __85__CRKConcreteClassKitRosterRequirements_makeDataChangedBlockWithObserverDescription___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained callGeneralObserversWithReason:*(void *)(a1 + 32)];
}

- (void)registerDataObservers
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = [(CRKConcreteClassKitRosterRequirements *)self dataObservers];
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
        id v9 = [(CRKConcreteClassKitRosterRequirements *)self classKitFacade];
        [v9 registerDataObserver:v8];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (void)deregisterDataObservers
{
  id v3 = [(CRKConcreteClassKitRosterRequirements *)self dataObservers];
  uint64_t v4 = [(CRKConcreteClassKitRosterRequirements *)self classKitFacade];
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  long long v10 = __64__CRKConcreteClassKitRosterRequirements_deregisterDataObservers__block_invoke;
  long long v11 = &unk_2646F37F0;
  id v5 = v3;
  id v12 = v5;
  id v6 = v4;
  id v13 = v6;
  uint64_t v7 = (void (**)(void))MEMORY[0x22A620AF0](&v8);
  if (objc_msgSend(MEMORY[0x263F08B88], "isMainThread", v8, v9, v10, v11)) {
    v7[2](v7);
  }
  else {
    dispatch_async(MEMORY[0x263EF83A0], v7);
  }
}

void __64__CRKConcreteClassKitRosterRequirements_deregisterDataObservers__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(a1 + 40), "deregisterDataObserver:", *(void *)(*((void *)&v7 + 1) + 8 * v6++), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (int64_t)accountState
{
  id v2 = [(CRKConcreteClassKitRosterRequirements *)self classKitFacade];
  int64_t v3 = [v2 accountState];

  return v3;
}

- (void)startObservingAccountState
{
  id v3 = [(CRKConcreteClassKitRosterRequirements *)self classKitFacade];
  [v3 addObserver:self forKeyPath:@"accountState" options:0 context:@"ObservationContext"];
}

- (void)stopObservingAccountState
{
  id v3 = [(CRKConcreteClassKitRosterRequirements *)self classKitFacade];
  [v3 removeObserver:self forKeyPath:@"accountState" context:@"ObservationContext"];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v12 = a3;
  id v9 = a4;
  if (a6 == @"ObservationContext")
  {
    id v10 = [(CRKConcreteClassKitRosterRequirements *)self classKitFacade];
    if (v10 == v9)
    {
      int v11 = [v12 isEqualToString:@"accountState"];

      if (v11) {
        [(CRKConcreteClassKitRosterRequirements *)self callGeneralObserversWithReason:@"Account state changed"];
      }
    }
    else
    {
    }
  }
}

- (void)callGeneralObserversWithReason:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (([MEMORY[0x263F08B88] isMainThread] & 1) == 0)
  {
    id v13 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v14 = NSStringFromSelector(a2);
    [v13 handleFailureInMethod:a2, self, @"CRKConcreteClassKitRosterRequirements.m", 273, @"%@ must be called from the main thread", v14 object file lineNumber description];
  }
  uint64_t v6 = _CRKLogASM_11();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v21 = v5;
    _os_log_impl(&dword_224C00000, v6, OS_LOG_TYPE_DEFAULT, "Firing roster requirements general observers with reason: '%{public}@'", buf, 0xCu);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v7 = [(CRKConcreteClassKitRosterRequirements *)self generalObserversByToken];
  long long v8 = [v7 allValues];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v15 + 1) + 8 * v12++) + 16))();
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
}

- (id)addGeneralObserver:(id)a3
{
  id v4 = a3;
  [(CRKConcreteClassKitRosterRequirements *)self registerGeneralObserverConstituents];
  id v5 = [(CRKConcreteClassKitRosterRequirements *)self makeToken];
  uint64_t v6 = (void *)MEMORY[0x22A620AF0](v4);

  long long v7 = [(CRKConcreteClassKitRosterRequirements *)self generalObserversByToken];
  [v7 setObject:v6 forKeyedSubscript:v5];

  return v5;
}

- (id)addObserverForPersonIDs:(id)a3 observerBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  long long v8 = [(CRKConcreteClassKitRosterRequirements *)self makeToken];
  uint64_t v9 = [CRKClassKitPersonIDObservation alloc];
  uint64_t v10 = [(CRKConcreteClassKitRosterRequirements *)self classKitFacade];
  uint64_t v11 = [(CRKClassKitPersonIDObservation *)v9 initWithPersonIDs:v7 classKitFacade:v10 block:v6];

  uint64_t v12 = [(CRKConcreteClassKitRosterRequirements *)self personObserversByToken];
  [v12 setObject:v11 forKeyedSubscript:v8];

  return v8;
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  [(CRKConcreteClassKitRosterRequirements *)self removeGeneralObserver:v4];
  [(CRKConcreteClassKitRosterRequirements *)self removePersonObserver:v4];
}

- (id)objectIDsOfPersonsInClass:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CRKConcreteClassKitRosterRequirements *)self isForInstructor];
  id v6 = [(CRKConcreteClassKitRosterRequirements *)self classKitFacade];
  id v7 = v6;
  if (v5) {
    [v6 objectIDsOfInstructorsInClass:v4];
  }
  else {
  long long v8 = [v6 objectIDsOfStudentsInClass:v4];
  }

  return v8;
}

- (id)objectIDsOfTrustedPersonsInClass:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CRKConcreteClassKitRosterRequirements *)self isForInstructor];
  id v6 = [(CRKConcreteClassKitRosterRequirements *)self classKitFacade];
  id v7 = v6;
  if (v5) {
    [v6 objectIDsOfStudentsInClass:v4];
  }
  else {
  long long v8 = [v6 objectIDsOfInstructorsInClass:v4];
  }

  return v8;
}

- (void)currentUserWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(CRKConcreteClassKitRosterRequirements *)self classKitFacade];
  [v5 currentUserWithCompletion:v4];
}

- (void)classesWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CRKConcreteClassKitRosterRequirements *)self isForInstructor];
  id v6 = [(CRKConcreteClassKitRosterRequirements *)self classKitFacade];
  id v7 = v6;
  if (v5) {
    [v6 instructedClassesWithCompletion:v4];
  }
  else {
    [v6 enrolledClassesWithCompletion:v4];
  }
}

- (void)personsInClassWithObjectID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [(CRKConcreteClassKitRosterRequirements *)self isForInstructor];
  uint64_t v9 = [(CRKConcreteClassKitRosterRequirements *)self classKitFacade];
  id v10 = v9;
  if (v8) {
    [v9 instructorsInClassWithObjectID:v7 completion:v6];
  }
  else {
    [v9 studentsInClassWithObjectID:v7 completion:v6];
  }
}

- (void)trustedPersonsInClassWithObjectID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [(CRKConcreteClassKitRosterRequirements *)self isForInstructor];
  uint64_t v9 = [(CRKConcreteClassKitRosterRequirements *)self classKitFacade];
  id v10 = v9;
  if (v8) {
    [v9 studentsInClassWithObjectID:v7 completion:v6];
  }
  else {
    [v9 instructorsInClassWithObjectID:v7 completion:v6];
  }
}

- (void)executeQuery:(id)a3
{
  id v4 = a3;
  id v5 = [(CRKConcreteClassKitRosterRequirements *)self classKitFacade];
  [v5 executeQuery:v4];
}

- (void)addPerson:(id)a3 toClass:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [(CRKConcreteClassKitRosterRequirements *)self isForInstructor];
  uint64_t v9 = [(CRKConcreteClassKitRosterRequirements *)self classKitFacade];
  id v10 = v9;
  if (v8) {
    [v9 addInstructor:v7 toClass:v6];
  }
  else {
    [v9 addStudent:v7 toClass:v6];
  }
}

- (void)removePerson:(id)a3 fromClass:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [(CRKConcreteClassKitRosterRequirements *)self isForInstructor];
  uint64_t v9 = [(CRKConcreteClassKitRosterRequirements *)self classKitFacade];
  id v10 = v9;
  if (v8) {
    [v9 removeInstructor:v7 fromClass:v6];
  }
  else {
    [v9 removeStudent:v7 fromClass:v6];
  }
}

- (void)addTrustedPerson:(id)a3 toClass:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [(CRKConcreteClassKitRosterRequirements *)self isForInstructor];
  uint64_t v9 = [(CRKConcreteClassKitRosterRequirements *)self classKitFacade];
  id v10 = v9;
  if (v8) {
    [v9 addStudent:v7 toClass:v6];
  }
  else {
    [v9 addInstructor:v7 toClass:v6];
  }
}

- (void)removeTrustedPerson:(id)a3 fromClass:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [(CRKConcreteClassKitRosterRequirements *)self isForInstructor];
  uint64_t v9 = [(CRKConcreteClassKitRosterRequirements *)self classKitFacade];
  id v10 = v9;
  if (v8) {
    [v9 removeStudent:v7 fromClass:v6];
  }
  else {
    [v9 removeInstructor:v7 fromClass:v6];
  }
}

- (id)makeStudentQueryForSearchString:(id)a3 locationIDs:(id)a4 sortingGivenNameFirst:(BOOL)a5 pageSize:(int64_t)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = [(CRKConcreteClassKitRosterRequirements *)self classKitFacade];
  id v13 = [v12 makeStudentQueryForSearchString:v11 locationIDs:v10 sortingGivenNameFirst:v7 pageSize:a6];

  return v13;
}

- (id)makeInstructorQueryForSearchString:(id)a3 locationIDs:(id)a4 sortingGivenNameFirst:(BOOL)a5 pageSize:(int64_t)a6
{
  BOOL v7 = a5;
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = [(CRKConcreteClassKitRosterRequirements *)self classKitFacade];
  id v13 = [v12 makeInstructorQueryForSearchString:v11 locationIDs:v10 sortingGivenNameFirst:v7 pageSize:a6];

  return v13;
}

- (id)makeQueryForPersonsWithIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = [(CRKConcreteClassKitRosterRequirements *)self classKitFacade];
  id v6 = [v5 makeQueryForPersonsWithIdentifiers:v4];

  return v6;
}

- (id)makeQueryForLocationsAllowingEasyStudentSignInForPersonID:(id)a3
{
  id v4 = a3;
  id v5 = [(CRKConcreteClassKitRosterRequirements *)self classKitFacade];
  id v6 = [v5 makeQueryForLocationsAllowingEasyStudentSignInForPersonID:v4];

  return v6;
}

- (id)makeClassWithLocationID:(id)a3 name:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [(CRKConcreteClassKitRosterRequirements *)self classKitFacade];
  uint64_t v9 = [v8 makeClassWithLocationID:v7 name:v6];

  return v9;
}

- (void)saveClass:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CRKConcreteClassKitRosterRequirements *)self classKitFacade];
  [v8 saveClass:v7 completion:v6];
}

- (void)removeClass:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CRKConcreteClassKitRosterRequirements *)self classKitFacade];
  [v8 removeClass:v7 completion:v6];
}

- (void)locationsWithManagePermissionsForUserWithObjectID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CRKConcreteClassKitRosterRequirements *)self classKitFacade];
  [v8 locationsWithManagePermissionsForUserWithObjectID:v7 completion:v6];
}

- (void)locationsWithObjectIDs:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CRKConcreteClassKitRosterRequirements *)self classKitFacade];
  [v8 locationsWithObjectIDs:v7 completion:v6];
}

- (CRKClassKitFacade)classKitFacade
{
  return self->_classKitFacade;
}

- (BOOL)isForInstructor
{
  return self->_forInstructor;
}

- (CRKCancelable)membershipDidChangeSubscription
{
  return self->_membershipDidChangeSubscription;
}

- (void)setMembershipDidChangeSubscription:(id)a3
{
}

- (CRKCancelable)userDidChangeSubscription
{
  return self->_userDidChangeSubscription;
}

- (void)setUserDidChangeSubscription:(id)a3
{
}

- (NSArray)dataObservers
{
  return self->_dataObservers;
}

- (NSMutableDictionary)generalObserversByToken
{
  return self->_generalObserversByToken;
}

- (NSMutableDictionary)personObserversByToken
{
  return self->_personObserversByToken;
}

- (BOOL)generalObserverConstituentsRegistered
{
  return self->_generalObserverConstituentsRegistered;
}

- (void)setGeneralObserverConstituentsRegistered:(BOOL)a3
{
  self->_generalObserverConstituentsRegistered = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personObserversByToken, 0);
  objc_storeStrong((id *)&self->_generalObserversByToken, 0);
  objc_storeStrong((id *)&self->_dataObservers, 0);
  objc_storeStrong((id *)&self->_userDidChangeSubscription, 0);
  objc_storeStrong((id *)&self->_membershipDidChangeSubscription, 0);

  objc_storeStrong((id *)&self->_classKitFacade, 0);
}

- (void)makeDataObservers
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_224C00000, log, OS_LOG_TYPE_ERROR, "Class observer is nil", v1, 2u);
}

@end