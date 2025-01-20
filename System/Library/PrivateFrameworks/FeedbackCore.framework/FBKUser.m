@interface FBKUser
+ (id)createUserFromUserLoginInfo:(id)a3 forEnvironment:(signed __int16)a4 inContext:(id)a5;
+ (id)entityName;
+ (id)keyPathsForValuesAffectingOnlyPublic;
+ (id)uniqueFormStubsWithPreferredTeam:(id)a3 withForms:(id)a4;
- (BOOL)hasForms;
- (BOOL)hasManagedTeams;
- (BOOL)hasManyManagedTeams;
- (BOOL)isInAnyProgram;
- (BOOL)isUnauthenticatedUser;
- (BOOL)onlyPublic;
- (NSSet)activeManagedTeams;
- (NSSet)activeTeams;
- (NSSet)managedTeams;
- (NSSet)teamsContainingContent;
- (NSString)fullName;
- (id)bugFormStubsForPickerWithPredicate:(id)a3 team:(id)a4;
- (id)draftFormResponseIDs;
- (id)uniqueFormStubsWithPreferredTeam:(id)a3;
@end

@implementation FBKUser

+ (id)entityName
{
  return @"User";
}

+ (id)keyPathsForValuesAffectingOnlyPublic
{
  v2 = objc_opt_new();

  return v2;
}

+ (id)createUserFromUserLoginInfo:(id)a3 forEnvironment:(signed __int16)a4 inContext:(id)a5
{
  uint64_t v6 = a4;
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  v10 = [a1 entityName];
  v11 = [v8 participantID];
  v12 = [v9 feedbackObjectWithEntityName:v10 remoteID:v11 creatingIfNeeded:1];

  v13 = [v8 username];
  [v12 setUsername:v13];

  v14 = [v8 givenName];
  [v12 setGivenName:v14];

  v15 = [v8 familyName];
  [v12 setFamilyName:v15];

  [v12 setEnvironment:v6];
  objc_msgSend(v12, "setIsSystemAccount:", objc_msgSend(v8, "isSystemAccount"));
  objc_msgSend(v12, "setIsAppleConnectUser:", objc_msgSend(v8, "isAppleConnectLogin"));
  [v12 setDidFetchFormStubs:0];
  [v12 setDidFetchContentItems:0];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v16 = objc_msgSend(v12, "teams", 0);
  uint64_t v17 = [v16 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v23 != v19) {
          objc_enumerationMutation(v16);
        }
        [*(id *)(*((void *)&v22 + 1) + 8 * i) setDidFetchFormItems:0];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v18);
  }

  return v12;
}

- (BOOL)onlyPublic
{
  return 0;
}

- (id)draftFormResponseIDs
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v3 = [(FBKUser *)self formResponseContentItems];

  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263EFF9C0]);
    v5 = [(FBKUser *)self formResponseContentItems];
    uint64_t v6 = objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v7 = [(FBKUser *)self formResponseContentItems];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v16 + 1) + 8 * i) ID];
          [v6 addObject:v12];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v9);
    }

    v13 = [MEMORY[0x263EFFA08] setWithSet:v6];
  }
  else
  {
    v14 = +[FBKLog appHandle];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22A36D000, v14, OS_LOG_TYPE_INFO, "no items found, no form draft IDs", buf, 2u);
    }

    v13 = objc_opt_new();
  }

  return v13;
}

- (BOOL)isInAnyProgram
{
  v3 = [(FBKUser *)self contentItems];
  if ([v3 count])
  {

    return 1;
  }
  id v4 = [(FBKUser *)self bugFormStubs];
  uint64_t v5 = [v4 count];

  if (v5) {
    return 1;
  }
  v7 = +[FBKLog appHandle];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_22A36D000, v7, OS_LOG_TYPE_DEFAULT, "User is not in any programs", v8, 2u);
  }

  return 0;
}

- (BOOL)hasForms
{
  v2 = [(FBKUser *)self bugFormStubs];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)isUnauthenticatedUser
{
  v2 = [(FBKUser *)self username];
  BOOL v3 = v2 == 0;

  return v3;
}

- (NSSet)managedTeams
{
  v2 = [(FBKUser *)self teams];
  BOOL v3 = [MEMORY[0x263F08A98] predicateWithFormat:@"teamTypeEnum != %@", &unk_26DE1EA08];
  id v4 = [v2 filteredSetUsingPredicate:v3];

  return (NSSet *)v4;
}

- (BOOL)hasManagedTeams
{
  v2 = [(FBKUser *)self activeManagedTeams];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)hasManyManagedTeams
{
  v2 = [(FBKUser *)self activeManagedTeams];
  BOOL v3 = (unint64_t)[v2 count] > 1;

  return v3;
}

- (NSSet)activeTeams
{
  v2 = [(FBKUser *)self teams];
  BOOL v3 = [MEMORY[0x263F08A98] predicateWithFormat:@"statusEnum == %@", &unk_26DE1EA08];
  id v4 = [v2 filteredSetUsingPredicate:v3];

  return (NSSet *)v4;
}

- (NSSet)activeManagedTeams
{
  BOOL v3 = (void *)MEMORY[0x263EFF9C0];
  id v4 = [(FBKUser *)self managedTeams];
  uint64_t v5 = [v3 setWithSet:v4];

  uint64_t v6 = [(FBKUser *)self activeTeams];
  [v5 intersectSet:v6];

  return (NSSet *)v5;
}

- (NSSet)teamsContainingContent
{
  v2 = [(FBKUser *)self teams];
  BOOL v3 = [MEMORY[0x263F08A98] predicateWithFormat:@"hasContent == YES"];
  id v4 = [v2 filteredSetUsingPredicate:v3];

  return (NSSet *)v4;
}

- (NSString)fullName
{
  if (fullName_onceToken_0 != -1) {
    dispatch_once(&fullName_onceToken_0, &__block_literal_global_42);
  }
  id v3 = objc_alloc_init(MEMORY[0x263F08A68]);
  id v4 = [(FBKUser *)self familyName];
  [v3 setFamilyName:v4];

  uint64_t v5 = [(FBKUser *)self givenName];
  [v3 setGivenName:v5];

  uint64_t v6 = [(id)fullName_nameFormatter stringFromPersonNameComponents:v3];

  return (NSString *)v6;
}

uint64_t __19__FBKUser_fullName__block_invoke()
{
  fullName_nameFormatter = (uint64_t)objc_alloc_init(MEMORY[0x263F08A78]);

  return MEMORY[0x270F9A758]();
}

- (id)uniqueFormStubsWithPreferredTeam:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = [(FBKUser *)self bugFormStubs];
  v7 = [v5 uniqueFormStubsWithPreferredTeam:v4 withForms:v6];

  return v7;
}

+ (id)uniqueFormStubsWithPreferredTeam:(id)a3 withForms:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v6, "count"));
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v8 = v6;
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
        v13 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        v14 = objc_msgSend(v13, "ID", (void)v23);
        v15 = [v7 objectForKey:v14];

        if (!v15
          || ([v13 teams],
              long long v16 = objc_claimAutoreleasedReturnValue(),
              int v17 = [v16 containsObject:v5],
              v16,
              v17))
        {
          long long v18 = [v13 ID];
          [v7 setObject:v13 forKey:v18];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v10);
  }

  long long v19 = (void *)MEMORY[0x263EFFA08];
  v20 = [v7 allValues];
  v21 = [v19 setWithArray:v20];

  return v21;
}

- (id)bugFormStubsForPickerWithPredicate:(id)a3 team:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(FBKUser *)self bugFormStubs];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    if (!v6)
    {
      uint64_t v10 = +[FBKLog model];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        -[FBKUser bugFormStubsForPickerWithPredicate:team:](v10);
      }

      id v6 = [MEMORY[0x263F08A98] predicateWithValue:0];
    }
    uint64_t v11 = [(FBKUser *)self bugFormStubs];
    v12 = [v11 filteredSetUsingPredicate:v6];

    v13 = +[FBKLog appHandle];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[FBKUser bugFormStubsForPickerWithPredicate:team:](v12, v13);
    }

    v14 = [(id)objc_opt_class() uniqueFormStubsWithPreferredTeam:v7 withForms:v12];
    v15 = +[FBKLog appHandle];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      long long v16 = [v14 valueForKeyPath:@"debugDescription"];
      int v21 = 138412290;
      uint64_t v22 = v16;
      _os_log_impl(&dword_22A36D000, v15, OS_LOG_TYPE_INFO, "Showing stubs in picker: %@", (uint8_t *)&v21, 0xCu);
    }
    int v17 = [v14 allObjects];
    long long v18 = +[FBKBugFormStub sortDescriptor];
    long long v19 = [v17 sortedArrayUsingDescriptors:v18];
  }
  else
  {
    v12 = +[FBKLog model];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[FBKUser bugFormStubsForPickerWithPredicate:team:](v12);
    }
    long long v19 = (void *)MEMORY[0x263EFFA68];
  }

  return v19;
}

- (void)bugFormStubsForPickerWithPredicate:(os_log_t)log team:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22A36D000, log, OS_LOG_TYPE_ERROR, "bugFormStubsForPickerWithPredicate found no stubs", v1, 2u);
}

- (void)bugFormStubsForPickerWithPredicate:(void *)a1 team:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = [a1 valueForKeyPath:@"debugDescription"];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_debug_impl(&dword_22A36D000, a2, OS_LOG_TYPE_DEBUG, "Predicate filtered stubs: %@", (uint8_t *)&v4, 0xCu);
}

- (void)bugFormStubsForPickerWithPredicate:(os_log_t)log team:.cold.3(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_22A36D000, log, OS_LOG_TYPE_FAULT, "bugFormStubsForPickerWithPredicate: called with nil predicate, defaulting to none predicate.", v1, 2u);
}

@end