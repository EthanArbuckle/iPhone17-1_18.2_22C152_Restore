@interface NSManagedObjectContext(Convenience)
- (id)createFeedbackObjectWithEntityName:()Convenience remoteID:;
- (id)feedbackObjectWithEntityName:()Convenience remoteID:creatingIfNeeded:;
- (id)feedbackObjectsWithEntityName:()Convenience remoteIDs:creatingIfNeeded:;
- (id)findFeedbackObjectWithEntityName:()Convenience remoteID:;
- (id)findFeedbackObjectsWithEntityName:()Convenience remoteIDs:;
- (id)findLocalIDFeedbackObjectsWithEntityName:()Convenience serverID:;
- (id)tryFindingObjectInContextWithID:()Convenience andEntityName:;
@end

@implementation NSManagedObjectContext(Convenience)

- (id)feedbackObjectWithEntityName:()Convenience remoteID:creatingIfNeeded:
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [a1 findFeedbackObjectWithEntityName:v8 remoteID:v9];
  v11 = (void *)v10;
  if (a5 && !v10)
  {
    v11 = [a1 createFeedbackObjectWithEntityName:v8 remoteID:v9];
  }

  return v11;
}

- (id)createFeedbackObjectWithEntityName:()Convenience remoteID:
{
  v6 = (void *)MEMORY[0x263EFF240];
  id v7 = a4;
  id v8 = [v6 insertNewObjectForEntityForName:a3 inManagedObjectContext:a1];
  [v8 setValue:v7 forKey:@"remoteID"];

  return v8;
}

- (id)findFeedbackObjectWithEntityName:()Convenience remoteID:
{
  id v6 = a4;
  id v7 = (objc_class *)MEMORY[0x263EFF260];
  id v8 = a3;
  id v9 = (void *)[[v7 alloc] initWithEntityName:v8];
  uint64_t v10 = [MEMORY[0x263F08A98] predicateWithFormat:@"remoteID = %@", v6];
  [v9 setPredicate:v10];

  [v9 setFetchLimit:1];
  v11 = [a1 tryFindingObjectInContextWithID:v6 andEntityName:v8];

  if (v11)
  {
    id v12 = v11;
    id v13 = 0;
    v14 = 0;
  }
  else
  {
    id v17 = 0;
    v14 = [a1 executeFetchRequest:v9 error:&v17];
    id v13 = v17;
    if (v13)
    {
      v15 = +[FBKLog appHandle];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[NSManagedObjectContext(Convenience) findFeedbackObjectWithEntityName:remoteID:](v6);
      }
    }
    if ([v14 count])
    {
      id v12 = [v14 objectAtIndexedSubscript:0];
    }
    else
    {
      id v12 = 0;
    }
  }

  return v12;
}

- (id)findLocalIDFeedbackObjectsWithEntityName:()Convenience serverID:
{
  id v6 = a4;
  id v7 = (objc_class *)MEMORY[0x263EFF260];
  id v8 = a3;
  id v9 = (void *)[[v7 alloc] initWithEntityName:v8];

  uint64_t v10 = [MEMORY[0x263F08A98] predicateWithFormat:@"serverID = %@", v6];
  [v9 setPredicate:v10];

  id v15 = 0;
  v11 = [a1 executeFetchRequest:v9 error:&v15];
  id v12 = v15;
  if (v12)
  {
    id v13 = +[FBKLog appHandle];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[NSManagedObjectContext(Convenience) findLocalIDFeedbackObjectsWithEntityName:serverID:](v6);
    }
  }

  return v11;
}

- (id)tryFindingObjectInContextWithID:()Convenience andEntityName:
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v20 = a4;
  if (v6)
  {
    [a1 registeredObjects];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          if ((objc_msgSend(v12, "isFault", v20) & 1) == 0 && (objc_msgSend(v12, "isDeleted") & 1) == 0)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v13 = v12;
              uint64_t v14 = [v13 ID];
              if (v14)
              {
                id v15 = (void *)v14;
                v16 = [v13 ID];
                if ([v16 isEqualToNumber:v6])
                {
                  [v13 entityName];
                  v18 = id v17 = v6;
                  char v21 = [v18 isEqualToString:v20];

                  id v6 = v17;
                  if (v21) {
                    goto LABEL_19;
                  }
                }
                else
                {
                }
              }
            }
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v9);
    }
    id v13 = 0;
LABEL_19:
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (id)feedbackObjectsWithEntityName:()Convenience remoteIDs:creatingIfNeeded:
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [a1 findFeedbackObjectsWithEntityName:v8 remoteIDs:v9];
  v11 = v10;
  if (a5 && (uint64_t v12 = [v10 count], v12 != objc_msgSend(v9, "count")))
  {
    id v29 = v9;
    uint64_t v14 = (void *)[v9 mutableCopy];
    id v15 = (void *)[v11 mutableCopy];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v16 = v11;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v35 != v19) {
            objc_enumerationMutation(v16);
          }
          char v21 = [*(id *)(*((void *)&v34 + 1) + 8 * i) remoteID];
          [v14 removeObject:v21];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v18);
    }

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v22 = v14;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v31;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v31 != v25) {
            objc_enumerationMutation(v22);
          }
          uint64_t v27 = [a1 createFeedbackObjectWithEntityName:v8 remoteID:*(void *)(*((void *)&v30 + 1) + 8 * j)];
          [v15 addObject:v27];
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v30 objects:v38 count:16];
      }
      while (v24);
    }

    id v13 = (id)[v15 copy];
    id v9 = v29;
  }
  else
  {
    id v13 = v11;
  }

  return v13;
}

- (id)findFeedbackObjectsWithEntityName:()Convenience remoteIDs:
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9C0]), "initWithCapacity:", objc_msgSend(v7, "count"));
  id v9 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9C0]), "initWithCapacity:", objc_msgSend(v7, "count"));
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        id v16 = [a1 tryFindingObjectInContextWithID:v15 andEntityName:v6];
        if (v16)
        {
          uint64_t v17 = v9;
          uint64_t v18 = v16;
        }
        else
        {
          uint64_t v17 = v8;
          uint64_t v18 = v15;
        }
        [v17 addObject:v18];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v12);
  }

  if ([v8 count])
  {
    uint64_t v19 = (void *)[objc_alloc(MEMORY[0x263EFF260]) initWithEntityName:v6];
    id v20 = [MEMORY[0x263F08A98] predicateWithFormat:@"remoteID IN %@", v8];
    [v19 setPredicate:v20];

    id v26 = 0;
    char v21 = [a1 executeFetchRequest:v19 error:&v26];
    id v22 = v26;

    if (v21)
    {
      uint64_t v23 = [MEMORY[0x263EFFA08] setWithArray:v21];

      goto LABEL_16;
    }
  }
  else
  {
    id v22 = 0;
  }
  uint64_t v23 = objc_opt_new();
LABEL_16:
  [v9 unionSet:v23];
  if (v22)
  {
    uint64_t v24 = +[FBKLog model];
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[NSManagedObjectContext(Convenience) findFeedbackObjectsWithEntityName:remoteIDs:]((uint64_t)v22, v24);
    }
  }

  return v9;
}

- (void)findFeedbackObjectWithEntityName:()Convenience remoteID:.cold.1(void *a1)
{
  [a1 intValue];
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_7(&dword_22A36D000, v1, v2, "Error finding feedbackObject with ID [%i] error [%@]", v3, v4, v5, v6, v7);
}

- (void)findLocalIDFeedbackObjectsWithEntityName:()Convenience serverID:.cold.1(void *a1)
{
  [a1 intValue];
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_1_7(&dword_22A36D000, v1, v2, "Error finding feedbackObjects with ID [%i] error [%@]", v3, v4, v5, v6, v7);
}

- (void)findFeedbackObjectsWithEntityName:()Convenience remoteIDs:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22A36D000, a2, OS_LOG_TYPE_ERROR, "Error finding objects in bulk %@", (uint8_t *)&v2, 0xCu);
}

@end