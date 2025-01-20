@interface CRKConcreteClassKitFacade
+ (id)keyPathsForValuesAffectingAccountState;
+ (id)makePersonSortDescriptorsSortingGivenNameFirst:(BOOL)a3;
- (BOOL)ownsError:(id)a3;
- (CRKClassKitAccountStateProvider)accountStateProvider;
- (CRKConcreteClassKitFacade)init;
- (id)classDataObserverWithSortDescriptors:(id)a3;
- (id)dataStore;
- (id)locationsObserverWithSortDescriptors:(id)a3;
- (id)makeClassWithLocationID:(id)a3 name:(id)a4;
- (id)makeDataObserverWithObjectType:(Class)a3 predicate:(id)a4 sortDescriptors:(id)a5;
- (id)makeInstructorQueryForSearchString:(id)a3 locationIDs:(id)a4 sortingGivenNameFirst:(BOOL)a5 pageSize:(int64_t)a6;
- (id)makePredicateForObjectIDs:(id)a3;
- (id)makePredicatesForObjectIDs:(id)a3;
- (id)makeQueryForLocationsAllowingEasyStudentSignInForPersonID:(id)a3;
- (id)makeQueryForPersonsWithIdentifiers:(id)a3;
- (id)makeQueryForPersonsWithRole:(int64_t)a3 locationIDs:(id)a4 searchString:(id)a5 sortingGivenNameFirst:(BOOL)a6 pageSize:(int64_t)a7;
- (id)makeStudentQueryForSearchString:(id)a3 locationIDs:(id)a4 sortingGivenNameFirst:(BOOL)a5 pageSize:(int64_t)a6;
- (id)objectIDsOfInstructorsInClass:(id)a3;
- (id)objectIDsOfMembersInClass:(id)a3 withRole:(unint64_t)a4;
- (id)objectIDsOfStudentsInClass:(id)a3;
- (id)personObserverWithPersonIDs:(id)a3 sortDescriptors:(id)a4;
- (id)subscribeToClassMembershipChangeEvents:(id)a3;
- (id)subscribeToCurrentUserDidChangeEvents:(id)a3;
- (int64_t)accountState;
- (void)addInstructor:(id)a3 toClass:(id)a4;
- (void)addPerson:(id)a3 withRole:(unint64_t)a4 toClass:(id)a5;
- (void)addStudent:(id)a3 toClass:(id)a4;
- (void)currentUserWithCompletion:(id)a3;
- (void)deregisterDataObserver:(id)a3;
- (void)enrolledClassesWithCompletion:(id)a3;
- (void)executeQuery:(id)a3;
- (void)instructedClassesWithCompletion:(id)a3;
- (void)instructorsInClassWithObjectID:(id)a3 completion:(id)a4;
- (void)locationsWithManagePermissionsForUserWithObjectID:(id)a3 completion:(id)a4;
- (void)locationsWithObjectIDs:(id)a3 completion:(id)a4;
- (void)registerDataObserver:(id)a3;
- (void)removeClass:(id)a3 completion:(id)a4;
- (void)removeInstructor:(id)a3 fromClass:(id)a4;
- (void)removePerson:(id)a3 withRole:(unint64_t)a4 fromClass:(id)a5;
- (void)removeStudent:(id)a3 fromClass:(id)a4;
- (void)saveClass:(id)a3 completion:(id)a4;
- (void)studentsInClassWithObjectID:(id)a3 completion:(id)a4;
- (void)syncServerConfigWithCompletion:(id)a3;
@end

@implementation CRKConcreteClassKitFacade

- (CRKConcreteClassKitFacade)init
{
  v6.receiver = self;
  v6.super_class = (Class)CRKConcreteClassKitFacade;
  v2 = [(CRKConcreteClassKitFacade *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    accountStateProvider = v2->_accountStateProvider;
    v2->_accountStateProvider = (CRKClassKitAccountStateProvider *)v3;
  }
  return v2;
}

+ (id)keyPathsForValuesAffectingAccountState
{
  return (id)[MEMORY[0x263EFFA08] setWithObject:@"accountStateProvider.accountState"];
}

- (int64_t)accountState
{
  v2 = [(CRKConcreteClassKitFacade *)self accountStateProvider];
  int64_t v3 = [v2 accountState];

  return v3;
}

- (BOOL)ownsError:(id)a3
{
  int64_t v3 = [a3 domain];
  char v4 = [v3 isEqualToString:*MEMORY[0x263EFCEB0]];

  return v4;
}

- (void)registerDataObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(CRKConcreteClassKitFacade *)self dataStore];
  [v5 registerDataObserver:v4];
}

- (void)deregisterDataObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(CRKConcreteClassKitFacade *)self dataStore];
  [v5 deregisterDataObserver:v4];
}

- (void)syncServerConfigWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(CRKConcreteClassKitFacade *)self dataStore];
  [v5 syncServerConfigWithCompletion:v4];
}

- (void)instructorsInClassWithObjectID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CRKConcreteClassKitFacade *)self dataStore];
  [v8 personsInClassWithClassID:v7 role:2 completion:v6];
}

- (void)studentsInClassWithObjectID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CRKConcreteClassKitFacade *)self dataStore];
  [v8 personsInClassWithClassID:v7 role:1 completion:v6];
}

- (id)personObserverWithPersonIDs:(id)a3 sortDescriptors:(id)a4
{
  id v5 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K IN %@", a4, *MEMORY[0x263EFCEC0], a3];
  id v6 = [(CRKConcreteClassKitFacade *)self makeDataObserverWithObjectType:objc_opt_class() predicate:v5 sortDescriptors:0];

  return v6;
}

- (void)addStudent:(id)a3 toClass:(id)a4
{
}

- (void)removeStudent:(id)a3 fromClass:(id)a4
{
}

- (id)objectIDsOfStudentsInClass:(id)a3
{
  return [(CRKConcreteClassKitFacade *)self objectIDsOfMembersInClass:a3 withRole:1];
}

- (void)addInstructor:(id)a3 toClass:(id)a4
{
}

- (void)removeInstructor:(id)a3 fromClass:(id)a4
{
}

- (id)objectIDsOfInstructorsInClass:(id)a3
{
  return [(CRKConcreteClassKitFacade *)self objectIDsOfMembersInClass:a3 withRole:2];
}

- (id)classDataObserverWithSortDescriptors:(id)a3
{
  id v4 = a3;
  id v5 = [(CRKConcreteClassKitFacade *)self makeDataObserverWithObjectType:objc_opt_class() predicate:0 sortDescriptors:v4];

  return v5;
}

- (void)enrolledClassesWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(CRKConcreteClassKitFacade *)self dataStore];
  [v5 enrolledClassesWithCompletion:v4];
}

- (void)instructedClassesWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(CRKConcreteClassKitFacade *)self dataStore];
  [v5 instructedClassesWithCompletion:v4];
}

- (void)saveClass:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = v6;
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;
  if (v9)
  {
    v10 = [(CRKConcreteClassKitFacade *)self dataStore];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __50__CRKConcreteClassKitFacade_saveClass_completion___block_invoke;
    v12[3] = &unk_2646F3688;
    id v13 = v7;
    [v10 saveClass:v9 completion:v12];
  }
  else
  {
    v11 = CRKErrorWithCodeAndUserInfo(2, &unk_26D819D80);
    (*((void (**)(id, void *))v7 + 2))(v7, v11);
  }
}

uint64_t __50__CRKConcreteClassKitFacade_saveClass_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeClass:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void (**)(void, void))v7;
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v9 = v6;
    }
    else {
      id v9 = 0;
    }
    id v10 = v9;
    if (v10)
    {
      v11 = [(CRKConcreteClassKitFacade *)self dataStore];
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __52__CRKConcreteClassKitFacade_removeClass_completion___block_invoke;
      v13[3] = &unk_2646F3688;
      v14 = v8;
      [v11 removeClass:v10 completion:v13];
    }
    else
    {
      v12 = CRKErrorWithCodeAndUserInfo(2, &unk_26D819DA8);
      ((void (**)(void, void *))v8)[2](v8, v12);
    }
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

uint64_t __52__CRKConcreteClassKitFacade_removeClass_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)makeClassWithLocationID:(id)a3 name:(id)a4
{
  id v5 = (objc_class *)MEMORY[0x263EFCED0];
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[[v5 alloc] initWithLocation:v7 customName:v6];

  return v8;
}

- (id)subscribeToCurrentUserDidChangeEvents:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  uint64_t v5 = *MEMORY[0x263EFCEA8];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __67__CRKConcreteClassKitFacade_subscribeToCurrentUserDidChangeEvents___block_invoke;
  v9[3] = &unk_2646F36B0;
  id v10 = v3;
  id v6 = v3;
  id v7 = [v4 subscribeToNotificationWithName:v5 object:0 handler:v9];

  return v7;
}

void __67__CRKConcreteClassKitFacade_subscribeToCurrentUserDidChangeEvents___block_invoke(uint64_t a1)
{
}

- (id)subscribeToClassMembershipChangeEvents:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  uint64_t v5 = *MEMORY[0x263EFCEC8];
  id v6 = [NSString stringWithUTF8String:*MEMORY[0x263EFCEC8]];
  id v7 = [v4 subscribeToNotificationWithName:v6 handler:v3];

  if (v7)
  {
    id v8 = v7;
  }
  else
  {
    id v9 = objc_msgSend(NSString, "stringWithFormat:", @"Could not subscribe to darwin notification %s.", v5);
    id v8 = +[CRKEmptySubscription errorSubscriptionWithReason:v9];
  }

  return v8;
}

- (void)currentUserWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CRKConcreteClassKitFacade *)self dataStore];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__CRKConcreteClassKitFacade_currentUserWithCompletion___block_invoke;
  v7[3] = &unk_2646F36D8;
  id v8 = v4;
  id v6 = v4;
  [v5 currentUserWithCompletion:v7];
}

uint64_t __55__CRKConcreteClassKitFacade_currentUserWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)locationsObserverWithSortDescriptors:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CRKConcreteClassKitFacade *)self makeDataObserverWithObjectType:objc_opt_class() predicate:0 sortDescriptors:v4];

  return v5;
}

- (void)locationsWithManagePermissionsForUserWithObjectID:(id)a3 completion:(id)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  id v6 = (objc_class *)MEMORY[0x263EFCF10];
  id v7 = a4;
  id v8 = a3;
  id v9 = (void *)[[v6 alloc] initWithOptions:4 behaviors:3];
  id v10 = NSStringFromCLSASMPrivilegeType();
  v13[0] = v8;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
  [v9 requirePrivilege:v10 onPersonIDs:v11];

  v12 = [MEMORY[0x263EFCF00] queryWithSearchSpecification:v9];

  [v12 setCompletion:v7];
  [(CRKConcreteClassKitFacade *)self executeQuery:v12];
}

- (void)locationsWithObjectIDs:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    id v8 = [(CRKConcreteClassKitFacade *)self makePredicateForObjectIDs:v6];
    id v17 = 0;
    id v9 = [MEMORY[0x263EFCF00] queryWithObjectType:objc_opt_class() predicate:v8 error:&v17];
    id v10 = v17;
    if (v9)
    {
      uint64_t v12 = MEMORY[0x263EF8330];
      uint64_t v13 = 3221225472;
      v14 = __63__CRKConcreteClassKitFacade_locationsWithObjectIDs_completion___block_invoke;
      v15 = &unk_2646F3400;
      id v16 = v7;
      [v9 setCompletion:&v12];
      v11 = [(CRKConcreteClassKitFacade *)self dataStore];
      [v11 executeQuery:v9];
    }
    else
    {
      (*((void (**)(id, void, id))v7 + 2))(v7, 0, v10);
    }
  }
  else
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, MEMORY[0x263EFFA68], 0);
  }
}

uint64_t __63__CRKConcreteClassKitFacade_locationsWithObjectIDs_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)makeStudentQueryForSearchString:(id)a3 locationIDs:(id)a4 sortingGivenNameFirst:(BOOL)a5 pageSize:(int64_t)a6
{
  return [(CRKConcreteClassKitFacade *)self makeQueryForPersonsWithRole:6 locationIDs:a4 searchString:a3 sortingGivenNameFirst:a5 pageSize:a6];
}

- (id)makeInstructorQueryForSearchString:(id)a3 locationIDs:(id)a4 sortingGivenNameFirst:(BOOL)a5 pageSize:(int64_t)a6
{
  return [(CRKConcreteClassKitFacade *)self makeQueryForPersonsWithRole:4 locationIDs:a4 searchString:a3 sortingGivenNameFirst:a5 pageSize:a6];
}

- (id)makeQueryForPersonsWithIdentifiers:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc(MEMORY[0x263EFCF10]) initWithOptions:1 behaviors:1];
  uint64_t v5 = [v4 predicateForPersonsWithObjectIDs:v3];
  id v10 = 0;
  id v6 = [MEMORY[0x263EFCF00] queryWithObjectType:objc_opt_class() predicate:v5 error:&v10];
  id v7 = v10;
  if (!v6)
  {
    id v8 = _CRKLogASM_2();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      [(CRKConcreteClassKitFacade *)v3 makeQueryForPersonsWithIdentifiers:v8];
    }
  }

  return v6;
}

- (id)makeQueryForLocationsAllowingEasyStudentSignInForPersonID:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = (void *)[objc_alloc(MEMORY[0x263EFCF10]) initWithOptions:4 behaviors:1];
  uint64_t v5 = NSStringFromCLSASMPrivilegeType();
  v10[0] = v3;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  [v4 requirePrivilege:v5 onPersonIDs:v6];

  id v7 = [MEMORY[0x263EFCF00] queryWithSearchSpecification:v4];
  if (!v7)
  {
    id v8 = _CRKLogASM_2();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CRKConcreteClassKitFacade makeQueryForLocationsAllowingEasyStudentSignInForPersonID:]((uint64_t)v3, v8);
    }
  }

  return v7;
}

- (void)executeQuery:(id)a3
{
  id v11 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v5 = [MEMORY[0x263F08690] currentHandler];
    id v6 = [NSString stringWithUTF8String:"-[CRKConcreteClassKitFacade executeQuery:]"];
    id v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    id v9 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v9);
    [v5 handleFailureInFunction:v6, @"CRKConcreteClassKitFacade.m", 304, @"expected %@, got %@", v8, v10 file lineNumber description];
  }
  id v4 = [(CRKConcreteClassKitFacade *)self dataStore];
  [v4 executeQuery:v11];
}

- (id)makeDataObserverWithObjectType:(Class)a3 predicate:(id)a4 sortDescriptors:(id)a5
{
  id v7 = (void *)MEMORY[0x263EFCF08];
  id v8 = a5;
  id v9 = [v7 querySpecificationWithObjectType:a3 predicate:a4];
  [v9 setSortDescriptors:v8];

  id v14 = 0;
  id v10 = (void *)[objc_alloc(MEMORY[0x263EFCED8]) initWithQuerySpecification:v9 error:&v14];
  id v11 = v14;
  if (!v10)
  {
    uint64_t v12 = _CRKLogASM_2();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[CRKConcreteClassKitFacade makeDataObserverWithObjectType:predicate:sortDescriptors:]();
    }
  }

  return v10;
}

- (void)addPerson:(id)a3 withRole:(unint64_t)a4 toClass:(id)a5
{
  id v21 = a3;
  id v7 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v9 = [MEMORY[0x263F08690] currentHandler];
    id v10 = [NSString stringWithUTF8String:"-[CRKConcreteClassKitFacade addPerson:withRole:toClass:]"];
    id v11 = (objc_class *)objc_opt_class();
    uint64_t v12 = NSStringFromClass(v11);
    uint64_t v13 = (objc_class *)objc_opt_class();
    id v14 = NSStringFromClass(v13);
    [v9 handleFailureInFunction:v10, @"CRKConcreteClassKitFacade.m", 330, @"expected %@, got %@", v12, v14 file lineNumber description];
  }
  id v8 = v7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v15 = [MEMORY[0x263F08690] currentHandler];
    id v16 = [NSString stringWithUTF8String:"-[CRKConcreteClassKitFacade addPerson:withRole:toClass:]"];
    id v17 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v17);
    v19 = (objc_class *)objc_opt_class();
    v20 = NSStringFromClass(v19);
    [v15 handleFailureInFunction:v16, @"CRKConcreteClassKitFacade.m", 331, @"expected %@, got %@", v18, v20 file lineNumber description];
  }
  [v8 addPerson:v21 withRole:a4];
}

- (void)removePerson:(id)a3 withRole:(unint64_t)a4 fromClass:(id)a5
{
  id v21 = a3;
  id v7 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v9 = [MEMORY[0x263F08690] currentHandler];
    id v10 = [NSString stringWithUTF8String:"-[CRKConcreteClassKitFacade removePerson:withRole:fromClass:]"];
    id v11 = (objc_class *)objc_opt_class();
    uint64_t v12 = NSStringFromClass(v11);
    uint64_t v13 = (objc_class *)objc_opt_class();
    id v14 = NSStringFromClass(v13);
    [v9 handleFailureInFunction:v10, @"CRKConcreteClassKitFacade.m", 336, @"expected %@, got %@", v12, v14 file lineNumber description];
  }
  id v8 = v7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v15 = [MEMORY[0x263F08690] currentHandler];
    id v16 = [NSString stringWithUTF8String:"-[CRKConcreteClassKitFacade removePerson:withRole:fromClass:]"];
    id v17 = (objc_class *)objc_opt_class();
    v18 = NSStringFromClass(v17);
    v19 = (objc_class *)objc_opt_class();
    v20 = NSStringFromClass(v19);
    [v15 handleFailureInFunction:v16, @"CRKConcreteClassKitFacade.m", 337, @"expected %@, got %@", v18, v20 file lineNumber description];
  }
  [v8 removePerson:v21 withRole:a4];
}

- (id)objectIDsOfMembersInClass:(id)a3 withRole:(unint64_t)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = objc_opt_new();
  id v7 = v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v17 = [MEMORY[0x263F08690] currentHandler];
    v18 = [NSString stringWithUTF8String:"-[CRKConcreteClassKitFacade objectIDsOfMembersInClass:withRole:]"];
    v19 = (objc_class *)objc_opt_class();
    v20 = NSStringFromClass(v19);
    id v21 = (objc_class *)objc_opt_class();
    v22 = NSStringFromClass(v21);
    [v17 handleFailureInFunction:v18, @"CRKConcreteClassKitFacade.m", 344, @"expected %@, got %@", v20, v22 file lineNumber description];
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v8 = [v7 classMembers];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if (([v13 roles] & a4) != 0)
        {
          id v14 = [v13 personID];
          [v6 addObject:v14];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v10);
  }

  v15 = (void *)[v6 copy];

  return v15;
}

+ (id)makePersonSortDescriptorsSortingGivenNameFirst:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = objc_opt_new();
  id v5 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"givenName" ascending:1];
  uint64_t v6 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"familyName" ascending:1];
  id v7 = (void *)v6;
  if (v3) {
    id v8 = v5;
  }
  else {
    id v8 = (void *)v6;
  }
  if (v3) {
    uint64_t v9 = (void *)v6;
  }
  else {
    uint64_t v9 = v5;
  }
  [v4 addObject:v8];
  [v4 addObject:v9];
  uint64_t v10 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"appleID" ascending:1];
  [v4 addObject:v10];

  uint64_t v11 = (void *)[v4 copy];

  return v11;
}

- (id)makeQueryForPersonsWithRole:(int64_t)a3 locationIDs:(id)a4 searchString:(id)a5 sortingGivenNameFirst:(BOOL)a6 pageSize:(int64_t)a7
{
  BOOL v8 = a6;
  id v11 = a5;
  id v12 = a4;
  uint64_t v13 = [(id)objc_opt_class() makePersonSortDescriptorsSortingGivenNameFirst:v8];
  id v14 = objc_alloc(MEMORY[0x263EFCF10]);
  if (v11) {
    v15 = (void *)[v14 initWithOptions:1 behaviors:3 searchString:v11];
  }
  else {
    v15 = (void *)[v14 initWithOptions:1 behaviors:3];
  }
  id v16 = v15;
  [v15 requireRoleType:a3 atLocationIDs:v12];

  [v16 setPersonSortDescriptors:v13];
  id v17 = [MEMORY[0x263EFCF00] queryWithSearchSpecification:v16];
  [v17 setFetchLimit:a7];

  return v17;
}

- (id)makePredicateForObjectIDs:(id)a3
{
  BOOL v3 = (void *)MEMORY[0x263F08730];
  id v4 = [(CRKConcreteClassKitFacade *)self makePredicatesForObjectIDs:a3];
  id v5 = [v3 orPredicateWithSubpredicates:v4];

  return v5;
}

- (id)makePredicatesForObjectIDs:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    uint64_t v9 = *MEMORY[0x263EFCEC0];
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v11 = [MEMORY[0x263F08A98] predicateWithFormat:@"%K = %@", v9, *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14];
        [v4 addObject:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  id v12 = (void *)[v4 copy];

  return v12;
}

- (id)dataStore
{
  return (id)[MEMORY[0x263EFCEE0] shared];
}

- (CRKClassKitAccountStateProvider)accountStateProvider
{
  return self->_accountStateProvider;
}

- (void).cxx_destruct
{
}

- (void)makeQueryForPersonsWithIdentifiers:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  [a1 count];
  OUTLINED_FUNCTION_0_0();
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_224C00000, a3, OS_LOG_TYPE_ERROR, "Failed to create CLSQuery for %lu person IDs: %{public}@", v5, 0x16u);
}

- (void)makeQueryForLocationsAllowingEasyStudentSignInForPersonID:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_224C00000, a2, OS_LOG_TYPE_ERROR, "Failed to create CLSQuery for organizations allowing Easy MAID Sign In for user with object ID: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)makeDataObserverWithObjectType:predicate:sortDescriptors:.cold.1()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_0();
  uint64_t v3 = v0;
  _os_log_error_impl(&dword_224C00000, v1, OS_LOG_TYPE_ERROR, "Failed to create ClassKit data observer for type %{public}@: %{public}@", v2, 0x16u);
}

@end