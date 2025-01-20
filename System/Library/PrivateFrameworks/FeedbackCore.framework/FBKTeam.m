@interface FBKTeam
+ (id)entityName;
+ (id)fetchRequest;
+ (id)personalTeamForUser:(id)a3 inContext:(id)a4;
+ (id)sortDescriptors;
- (BOOL)canStartNewFeedback;
- (BOOL)hasContent;
- (id)shortDescription;
- (id)teamFormStubMatchingFromFormStub:(id)a3;
- (void)prepareForDeletion;
- (void)setPropertiesFromJSONObject:(id)a3;
@end

@implementation FBKTeam

+ (id)personalTeamForUser:(id)a3 inContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [a1 entityName];
  v9 = [v7 feedbackObjectWithEntityName:v8 remoteID:&unk_26DE1E7E0 creatingIfNeeded:0];

  v10 = [v9 permissions];
  char v11 = [v10 canDelete];

  if (v11)
  {
    if (v9)
    {
LABEL_12:
      id v14 = v9;
      v28 = v14;
      goto LABEL_13;
    }
  }
  else
  {
    v12 = +[FBKLog appHandle];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22A36D000, v12, OS_LOG_TYPE_DEFAULT, "Personal team has stale permissions. Reseting", buf, 2u);
    }
  }
  v13 = [a1 entityName];
  id v14 = [v7 feedbackObjectWithEntityName:v13 remoteID:&unk_26DE1E7E0 creatingIfNeeded:1];

  v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v16 = [v15 localizedStringForKey:@"PERSONAL_TEAM_TITLE" value:&stru_26DDF6A30 table:@"CommonStrings"];
  [v14 setName:v16];

  [v14 setRoleEnum:2];
  [v14 setTeamTypeEnum:0];
  [v14 setUser:v6];
  v17 = +[FBKTeamPermissions personalTeamPermissions];
  [v14 setPermissions:v17];

  v18 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"ORIGINATOR", @"ASSIGNEE", 0);
  [v14 setStakeholders:v18];

  [v14 setDidFetchFormItems:0];
  [v14 setTypeString:0];
  id v30 = 0;
  [v7 save:&v30];
  id v19 = v30;
  if (!v19)
  {
    v9 = v14;
    goto LABEL_12;
  }
  v20 = v19;
  v21 = +[FBKLog appHandle];
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
    +[FBKTeam personalTeamForUser:inContext:]((uint64_t)v20, v21, v22, v23, v24, v25, v26, v27);
  }

  v28 = 0;
LABEL_13:

  return v28;
}

+ (id)entityName
{
  return @"Team";
}

- (void)setPropertiesFromJSONObject:(id)a3
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"name"];
  if (v5) {
    [(FBKTeam *)self setName:v5];
  }
  id v6 = [v4 objectForKeyedSubscript:@"role_enum"];
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 unsignedIntegerValue];
    if ((unint64_t)(v8 - 1) >= 2) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = v8;
    }
    [(FBKTeam *)self setRoleEnum:v9];
  }
  v10 = [v4 objectForKeyedSubscript:@"type"];
  if (v10)
  {
    [(FBKTeam *)self setTypeString:v10];
    [(FBKTeam *)self setTeamTypeEnum:1000];
  }
  char v11 = [v4 objectForKeyedSubscript:@"permissions"];
  if (v11)
  {
    v12 = [[FBKTeamPermissions alloc] initWithJSONObject:v11];
    [(FBKTeam *)self setPermissions:v12];
  }
  v13 = [v4 objectForKeyedSubscript:@"stakeholders"];
  if (v13)
  {
    v29 = v11;
    id v30 = v10;
    v31 = self;
    id v32 = v4;
    id v14 = [MEMORY[0x263EFF9C0] setWithCapacity:2];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v15 = v13;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v33 objects:v39 count:16];
    if (!v16) {
      goto LABEL_27;
    }
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v34;
    while (1)
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v34 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        v21 = [v20 uppercaseString];
        if (([v21 isEqualToString:@"ORIGINATOR"] & 1) != 0
          || ([v21 isEqualToString:@"ASSIGNEE"] & 1) != 0)
        {
          if (v21)
          {
            [v14 addObject:v21];
            goto LABEL_25;
          }
        }
        else
        {
        }
        v21 = +[FBKLog appHandle];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v38 = v20;
          _os_log_error_impl(&dword_22A36D000, v21, OS_LOG_TYPE_ERROR, "Tried to parse [%{public}@] as stakeholder, but failed.", buf, 0xCu);
        }
LABEL_25:
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v33 objects:v39 count:16];
      if (!v17)
      {
LABEL_27:

        uint64_t v22 = [MEMORY[0x263EFFA08] setWithSet:v14];
        self = v31;
        [(FBKTeam *)v31 setStakeholders:v22];

        id v4 = v32;
        v10 = v30;
        char v11 = v29;
        break;
      }
    }
  }
  uint64_t v23 = [v4 objectForKeyedSubscript:@"status"];
  uint64_t v24 = v23;
  if (v23)
  {
    uint64_t v25 = [v23 lowercaseString];
    if ([v25 isEqualToString:@"active"])
    {
      uint64_t v26 = 0;
    }
    else if (([v25 isEqualToString:@"closed"] & 1) != 0 {
           || ![v25 isEqualToString:@"disabled"])
    }
    {
      uint64_t v26 = 1;
    }
    else
    {
      uint64_t v27 = +[FBKLog model];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        -[FBKTeam setPropertiesFromJSONObject:](v27);
      }

      uint64_t v26 = 2;
    }

    [(FBKTeam *)self setStatusEnum:v26];
    if ([(FBKTeam *)self status] == 2)
    {
      v28 = +[FBKLog model];
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        -[FBKTeam setPropertiesFromJSONObject:](self, v28);
      }
    }
  }
}

+ (id)sortDescriptors
{
  v8[4] = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"statusEnum" ascending:1];
  v8[0] = v2;
  v3 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"teamTypeEnum" ascending:1];
  v8[1] = v3;
  id v4 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"name" ascending:1];
  v8[2] = v4;
  v5 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"remoteID" ascending:0];
  v8[3] = v5;
  id v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:4];

  return v6;
}

- (BOOL)hasContent
{
  v3 = [(FBKTeam *)self contentItems];
  if ([v3 count])
  {
    BOOL v4 = 1;
  }
  else
  {
    v5 = [(FBKTeam *)self forms];
    BOOL v4 = [v5 count] != 0;
  }
  return v4;
}

- (BOOL)canStartNewFeedback
{
  if (![(FBKTeam *)self didFetchFormItems]) {
    return 0;
  }
  v3 = [(FBKTeam *)self forms];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (id)shortDescription
{
  v3 = NSString;
  BOOL v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [(FBKTeam *)self remoteID];
  unint64_t v7 = [(FBKTeam *)self teamType];
  switch(v7)
  {
    case 1uLL:
      uint64_t v8 = @"dev";
      break;
    case 2uLL:
      uint64_t v8 = @"ent";
      break;
    case 3uLL:
      uint64_t v8 = @"edu";
      break;
    case 4uLL:
      uint64_t v8 = @"custom";
      break;
    default:
      if (v7 == 1000) {
        uint64_t v8 = @"unknown";
      }
      else {
        uint64_t v8 = @"personal";
      }
      break;
  }
  uint64_t v9 = [(FBKTeam *)self name];
  v10 = [v3 stringWithFormat:@"%@ ID: %@ type: %@ name: %@", v5, v6, v8, v9];

  return v10;
}

- (void)prepareForDeletion
{
  v2 = self;
  uint64_t v33 = *MEMORY[0x263EF8340];
  v29.receiver = self;
  v29.super_class = (Class)FBKTeam;
  [(FBKTeam *)&v29 prepareForDeletion];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v3 = [(FBKTeam *)v2 forms];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v25 objects:v32 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v26;
    unint64_t v7 = &off_264873000;
    uint64_t v24 = v3;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v26 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if (([v9 isDeleted] & 1) == 0)
        {
          v10 = [v9 teams];
          if ([v10 count] == 1
            && ([v10 anyObject],
                char v11 = objc_claimAutoreleasedReturnValue(),
                int v12 = [v11 isEqual:v2],
                v11,
                v12))
          {
            v13 = [v7[197] model];
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              id v14 = [v9 ID];
              uint64_t v15 = [v14 integerValue];
              *(_DWORD *)buf = 134217984;
              uint64_t v31 = v15;
              _os_log_impl(&dword_22A36D000, v13, OS_LOG_TYPE_INFO, "Deleting form [%ld] because it belongs to no teams anymore.", buf, 0xCu);
            }
            uint64_t v16 = [(FBKTeam *)v2 managedObjectContext];
            [v16 deleteObject:v9];
          }
          else
          {
            uint64_t v17 = [MEMORY[0x263F08A98] predicateWithFormat:@"isDeleted == NO"];
            uint64_t v16 = [v10 filteredSetUsingPredicate:v17];

            if (![v16 count])
            {
              uint64_t v18 = [v7[197] model];
              if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
              {
                [v9 ID];
                id v19 = v2;
                v21 = v20 = v7;
                uint64_t v22 = [v21 integerValue];
                *(_DWORD *)buf = 134217984;
                uint64_t v31 = v22;
                _os_log_impl(&dword_22A36D000, v18, OS_LOG_TYPE_INFO, "Deleting form [%ld] because it belongs to no teams anymore or all of its teams are marked for deletion.", buf, 0xCu);

                unint64_t v7 = v20;
                v2 = v19;
                v3 = v24;
              }

              uint64_t v23 = [(FBKTeam *)v2 managedObjectContext];
              [v23 deleteObject:v9];
            }
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v25 objects:v32 count:16];
    }
    while (v5);
  }
}

- (id)teamFormStubMatchingFromFormStub:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = v4;
  if (!v4)
  {
    unint64_t v7 = +[FBKLog model];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[FBKTeam teamFormStubMatchingFromFormStub:](v7, v15, v16, v17, v18, v19, v20, v21);
    }
    goto LABEL_17;
  }
  uint64_t v6 = [v4 serverID];

  if (!v6)
  {
    unint64_t v7 = +[FBKLog model];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[FBKTeam teamFormStubMatchingFromFormStub:](v7, v22, v23, v24, v25, v26, v27, v28);
    }
LABEL_17:
    id v8 = 0;
    goto LABEL_18;
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  unint64_t v7 = [(FBKTeam *)self forms];
  id v8 = (id)[v7 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v31;
    while (2)
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(v7);
        }
        char v11 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        int v12 = [v11 serverID];
        v13 = [v5 serverID];
        char v14 = [v12 isEqualToNumber:v13];

        if (v14)
        {
          id v8 = v11;
          goto LABEL_18;
        }
      }
      id v8 = (id)[v7 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_18:

  return v8;
}

+ (id)fetchRequest
{
  return (id)[MEMORY[0x263EFF260] fetchRequestWithEntityName:@"Team"];
}

+ (void)personalTeamForUser:(uint64_t)a3 inContext:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setPropertiesFromJSONObject:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = [a1 ID];
  uint64_t v5 = [v4 integerValue];
  uint64_t v6 = [a1 name];
  int v7 = 134218242;
  uint64_t v8 = v5;
  __int16 v9 = 2114;
  v10 = v6;
  _os_log_error_impl(&dword_22A36D000, a2, OS_LOG_TYPE_ERROR, "Disabled team information: [%ld – %{public}@]", (uint8_t *)&v7, 0x16u);
}

- (void)setPropertiesFromJSONObject:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22A36D000, log, OS_LOG_TYPE_ERROR, "Got a disabled team. This is a server bug.", v1, 2u);
}

- (void)teamFormStubMatchingFromFormStub:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)teamFormStubMatchingFromFormStub:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end