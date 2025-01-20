@interface FBKBugFormStub
+ (id)bugFormStubsMatchingBuild:(id)a3 forPlatform:(id)a4 withStubs:(id)a5;
+ (id)bugFormStubsMatchingBuild:(id)a3 withStubs:(id)a4;
+ (id)entityName;
+ (id)fetchRequest;
+ (id)predicateForAllStubs;
+ (id)predicateForStub:(id)a3;
+ (id)predicateForTeam:(id)a3;
+ (id)sortDescriptor;
+ (id)uniquingKey;
- (NSSet)stubsWithMatchingID;
- (NSSet)teamsMatchingFormID;
- (id)debugDescription;
- (id)preferredTeamForStubPreferringTeam:(id)a3;
- (id)signatureDescription;
- (void)setPropertiesFromJSONObject:(id)a3;
@end

@implementation FBKBugFormStub

+ (id)bugFormStubsMatchingBuild:(id)a3 forPlatform:(id)a4 withStubs:(id)a5
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v32 = a3;
  id v7 = a4;
  id v8 = a5;
  v31 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9C0]), "initWithCapacity:", objc_msgSend(v8, "count"));
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    unint64_t v12 = 0;
    uint64_t v13 = *(void *)v34;
LABEL_3:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v34 != v13) {
        objc_enumerationMutation(v9);
      }
      v15 = *(void **)(*((void *)&v33 + 1) + 8 * v14);
      if (objc_msgSend(v15, "forcePicker", v31))
      {
        v28 = +[FBKLog appHandle];
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          v29 = [v15 ID];
          *(_DWORD *)buf = 138543362;
          v38 = v29;
          _os_log_impl(&dword_22A36D000, v28, OS_LOG_TYPE_DEFAULT, "Found form ID [%{public}@] with always_show_picker = true; forcing picker.",
            buf,
            0xCu);
        }
        v27 = 0;
        v26 = v31;
        goto LABEL_25;
      }
      if (v7)
      {
        v16 = [v15 platform];
        int v17 = [v16 isEqualToString:v7];

        if (!v17) {
          goto LABEL_18;
        }
      }
      v18 = [v15 buildPrefix];
      if (![v18 length]) {
        break;
      }
      v19 = [v15 buildPrefix];
      int v20 = [v32 hasPrefix:v19];

      if (!v20) {
        goto LABEL_15;
      }
      v21 = [v15 buildPrefix];
      uint64_t v22 = [v21 length];

      if (v22 != v12)
      {
        v23 = [v15 buildPrefix];
        unint64_t v24 = [v23 length];

        if (v24 > v12)
        {
          [v31 removeAllObjects];
          [v31 addObject:v15];
          v25 = [v15 buildPrefix];
          unint64_t v12 = [v25 length];
        }
        goto LABEL_18;
      }
LABEL_17:
      [v31 addObject:v15];
LABEL_18:
      if (v11 == ++v14)
      {
        uint64_t v11 = [v9 countByEnumeratingWithState:&v33 objects:v39 count:16];
        if (v11) {
          goto LABEL_3;
        }
        goto LABEL_20;
      }
    }

LABEL_15:
    if (!v7 || v12) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_20:

  v26 = v31;
  if ([v31 count])
  {
    v27 = [MEMORY[0x263EFFA08] setWithSet:v31];
  }
  else
  {
    v27 = 0;
  }
LABEL_25:

  return v27;
}

+ (id)bugFormStubsMatchingBuild:(id)a3 withStubs:(id)a4
{
  return (id)[a1 bugFormStubsMatchingBuild:a3 forPlatform:0 withStubs:a4];
}

+ (id)sortDescriptor
{
  if (sortDescriptor_onceToken != -1) {
    dispatch_once(&sortDescriptor_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)sortDescriptor__sortDescriptor;

  return v2;
}

void __32__FBKBugFormStub_sortDescriptor__block_invoke()
{
  v5[3] = *MEMORY[0x263EF8340];
  v0 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:@"priority" ascending:1];
  v1 = objc_msgSend(objc_alloc(MEMORY[0x263F08B30]), "initWithKey:ascending:", @"platform", 1, v0);
  v5[1] = v1;
  v2 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:@"name" ascending:1];
  v5[2] = v2;
  uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:3];
  v4 = (void *)sortDescriptor__sortDescriptor;
  sortDescriptor__sortDescriptor = v3;
}

+ (id)entityName
{
  return @"BugFormStub";
}

+ (id)uniquingKey
{
  return @"signature";
}

- (void)setPropertiesFromJSONObject:(id)a3
{
  id v30 = a3;
  [(FBKManagedLocalIDObject *)self setPropertiesForLocalIDKeys:v30];
  v4 = [v30 objectForKeyedSubscript:@"build_prefix"];
  uint64_t v5 = FBKNilIfNSNull(v4);

  if (v5) {
    [(FBKBugFormStub *)self setBuildPrefix:v5];
  }
  v6 = [v30 objectForKeyedSubscript:@"description"];
  uint64_t v7 = FBKNilIfNSNull(v6);

  if (v7) {
    [(FBKBugFormStub *)self setFormDescription:v7];
  }
  id v8 = [v30 objectForKeyedSubscript:@"name"];
  uint64_t v9 = FBKNilIfNSNull(v8);

  if (v9) {
    [(FBKBugFormStub *)self setName:v9];
  }
  uint64_t v10 = [v30 objectForKeyedSubscript:@"platform"];
  uint64_t v11 = FBKNilIfNSNull(v10);

  if (v11) {
    [(FBKBugFormStub *)self setPlatform:v11];
  }
  unint64_t v12 = [v30 objectForKeyedSubscript:@"priority"];
  uint64_t v13 = FBKNilIfNSNull(v12);

  if (v13) {
    uint64_t v14 = v13;
  }
  else {
    uint64_t v14 = &unk_26DE1E738;
  }
  [(FBKBugFormStub *)self setPriority:v14];
  v15 = [v30 objectForKeyedSubscript:@"plugins"];
  v16 = FBKNilIfNSNull(v15);

  if (v16)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v17 = objc_msgSend(v16, "ded_selectItemsPassingTest:", &__block_literal_global_30);
      [(FBKBugFormStub *)self setPluginIDs:v17];
    }
  }
  v18 = objc_msgSend(v30, "objectForKeyedSubscript:", @"signature", v9);
  v19 = FBKNilIfNSNull(v18);

  if (v19)
  {
    if ([v19 length]) {
      int v20 = v19;
    }
    else {
      int v20 = 0;
    }
    [(FBKBugFormStub *)self setSignature:v20];
  }
  v21 = (void *)v7;
  uint64_t v22 = [v30 objectForKeyedSubscript:@"always_show_picker"];
  v23 = FBKNilIfNSNull(v22);

  unint64_t v24 = (void *)v5;
  if (v23) {
    uint64_t v25 = [v23 BOOLValue];
  }
  else {
    uint64_t v25 = 0;
  }
  [(FBKBugFormStub *)self setForcePicker:v25];
  v26 = [v30 objectForKeyedSubscript:@"tat"];
  v27 = FBKNilIfNSNull(v26);

  if (v27)
  {
    if ([v27 length]) {
      v28 = v27;
    }
    else {
      v28 = 0;
    }
    [(FBKBugFormStub *)self setTat:v28];
  }
}

uint64_t __46__FBKBugFormStub_setPropertiesFromJSONObject___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)signatureDescription
{
  uint64_t v3 = NSString;
  v4 = [(FBKManagedLocalIDObject *)self ID];
  uint64_t v5 = [v4 intValue];
  v6 = [(FBKBugFormStub *)self pluginIDs];
  uint64_t v7 = [v6 componentsJoinedByString:@","];
  id v8 = [(FBKBugFormStub *)self signature];
  uint64_t v9 = [v3 stringWithFormat:@"Stub [%i] <%@:%@>", v5, v7, v8];

  return v9;
}

- (id)preferredTeamForStubPreferringTeam:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(FBKBugFormStub *)self teams];
  uint64_t v6 = [v5 count];

  if (!v6)
  {
    uint64_t v7 = (void *)MEMORY[0x263EFF940];
    uint64_t v8 = *MEMORY[0x263EFF498];
    uint64_t v9 = [(FBKManagedLocalIDObject *)self ID];
    objc_msgSend(v7, "raise:format:", v8, @"Form stub [%lu] belongs to no teams.", objc_msgSend(v9, "unsignedIntegerValue"));
  }
  if (v4
    && ([(FBKBugFormStub *)self teams],
        uint64_t v10 = objc_claimAutoreleasedReturnValue(),
        int v11 = [v10 containsObject:v4],
        v10,
        v11))
  {
    unint64_t v12 = +[FBKLog model];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = [(FBKManagedLocalIDObject *)self ID];
      uint64_t v14 = [v13 integerValue];
      v15 = [v4 ID];
      *(_DWORD *)buf = 134218240;
      uint64_t v34 = v14;
      __int16 v35 = 2048;
      uint64_t v36 = [v15 integerValue];
      _os_log_impl(&dword_22A36D000, v12, OS_LOG_TYPE_DEFAULT, "Preferred team for stub [%ld] with ID: [%ld]", buf, 0x16u);
    }
    id v16 = v4;
  }
  else
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    int v17 = [(FBKBugFormStub *)self teams];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v29;
      while (2)
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v29 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          if (![v22 teamType])
          {
            unint64_t v24 = +[FBKLog model];
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v25 = [(FBKManagedLocalIDObject *)self ID];
              uint64_t v26 = [v25 integerValue];
              *(_DWORD *)buf = 134217984;
              uint64_t v34 = v26;
              _os_log_impl(&dword_22A36D000, v24, OS_LOG_TYPE_DEFAULT, "Preferred team for stub [%ld] unavailable, choosing personal team", buf, 0xCu);
            }
            id v23 = v22;
            goto LABEL_20;
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (v19) {
          continue;
        }
        break;
      }
    }

    int v17 = [(FBKBugFormStub *)self teams];
    id v23 = [v17 anyObject];
LABEL_20:
    id v16 = v23;
  }

  return v16;
}

- (NSSet)stubsWithMatchingID
{
  uint64_t v3 = [(FBKBugFormStub *)self user];
  id v4 = [v3 bugFormStubs];
  uint64_t v5 = (void *)MEMORY[0x263F08A98];
  uint64_t v6 = [(FBKBugFormStub *)self serverID];
  uint64_t v7 = [v5 predicateWithFormat:@"serverID == %@", v6];
  uint64_t v8 = [v4 filteredSetUsingPredicate:v7];

  return (NSSet *)v8;
}

- (NSSet)teamsMatchingFormID
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(FBKBugFormStub *)self stubsWithMatchingID];
  id v4 = (void *)MEMORY[0x263EFF9C0];
  uint64_t v5 = [(FBKBugFormStub *)self user];
  uint64_t v6 = [v5 teams];
  uint64_t v7 = objc_msgSend(v4, "setWithCapacity:", objc_msgSend(v6, "count"));

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v3;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "teams", (void)v16);
        [v7 unionSet:v13];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  uint64_t v14 = [MEMORY[0x263EFFA08] setWithSet:v7];

  return (NSSet *)v14;
}

- (id)debugDescription
{
  uint64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [(FBKManagedLocalIDObject *)self ID];
  uint64_t v7 = [(FBKBugFormStub *)self signature];
  id v8 = [v3 stringWithFormat:@"%@: %@ - %@", v5, v6, v7];

  return v8;
}

+ (id)predicateForStub:(id)a3
{
  return (id)[MEMORY[0x263F08A98] predicateWithFormat:@"self = %@", a3];
}

+ (id)predicateForTeam:(id)a3
{
  id v3 = a3;
  if (+[FBKSharedConstants listsFormsFetchedByTat]) {
    id v4 = @"%@ IN teams";
  }
  else {
    id v4 = @"%@ IN teams AND self.wasFetchedByTat == NO";
  }
  uint64_t v5 = objc_msgSend(MEMORY[0x263F08A98], "predicateWithFormat:", v4, v3);

  return v5;
}

+ (id)predicateForAllStubs
{
  if (+[FBKSharedConstants listsFormsFetchedByTat]) {
    [MEMORY[0x263F08A98] predicateWithValue:1];
  }
  else {
  id v2 = [MEMORY[0x263F08A98] predicateWithFormat:@"self.wasFetchedByTat == NO"];
  }

  return v2;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"BugFormStub"];
}

@end