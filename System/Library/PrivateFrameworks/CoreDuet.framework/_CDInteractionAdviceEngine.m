@interface _CDInteractionAdviceEngine
+ (id)interactionAdviceEngineWithStore:(id)a3;
- (_CDInteractionAdviceEngine)initWithStore:(id)a3;
- (_CDSocialInteractionAdvisor)socialAdvisor;
- (_CDTemporalInteractionAdvisor)temporalAdvisor;
- (id)adviseInteractionsForDate:(id)a3 usingSettings:(id)a4;
- (id)adviseInteractionsForKeywordsInString:(id)a3 usingSettings:(id)a4;
- (id)adviseInteractionsUsingSettings:(id)a3;
- (id)adviseSocialInteractionsForDate:(id)a3 andSeedContacts:(id)a4 usingSettings:(id)a5;
- (id)rankCandidateContacts:(id)a3 usingSettings:(id)a4;
- (void)tuneSocialAdvisorUsingSettings:(id)a3 heartBeatHandler:(id)a4;
@end

@implementation _CDInteractionAdviceEngine

- (id)rankCandidateContacts:(id)a3 usingSettings:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v32 = a4;
  v31 = (void *)MEMORY[0x192FB2F20]();
  v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  char v7 = 0;
  if (![v5 count])
  {
LABEL_11:
    v13 = v32;
    v14 = [v32 seedIdentifiers];
    v26 = [v14 allObjects];

    if ([v26 count])
    {
      v15 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSObject count](v26, "count"));
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      v29 = v26;
      v16 = v26;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v33 objects:v37 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v34;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v34 != v19) {
              objc_enumerationMutation(v16);
            }
            v21 = [[_CDContact alloc] initWithIdentifier:*(void *)(*((void *)&v33 + 1) + 8 * i) type:0 customIdentifier:0 displayName:0 displayType:0 personId:0 personIdType:0];
            [v15 addObject:v21];
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v33 objects:v37 count:16];
        }
        while (v18);
      }

      v22 = [(_CDInteractionAdviceEngine *)self socialAdvisor];
      v13 = v32;
      v9 = [v22 rankContacts:v6 withSeedContacts:v15 usingSettings:v32];

      v26 = v29;
      if (v7) {
        goto LABEL_20;
      }
    }
    else
    {
      v24 = [(_CDInteractionAdviceEngine *)self temporalAdvisor];
      v9 = [v24 rankContacts:v6 usingSettings:v32];

      if (v7)
      {
LABEL_20:
        id v23 = [v9 valueForKey:@"identifier"];
LABEL_23:
        v25 = v23;
        goto LABEL_29;
      }
    }
    id v23 = v9;
    v9 = v23;
    goto LABEL_23;
  }
  uint64_t v8 = 0;
  while (1)
  {
    v9 = [v5 objectAtIndexedSubscript:v8];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass)
    {
      id v11 = v9;
      v12 = [[_CDContact alloc] initWithIdentifier:v11 type:0 customIdentifier:0 displayName:0 displayType:0 personId:0 personIdType:0];

      [v6 addObject:v12];
      if (!v8) {
        goto LABEL_9;
      }
      goto LABEL_5;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      break;
    }
    [v6 addObject:v9];
    if (!v8)
    {
LABEL_9:
      char v7 = isKindOfClass;
      goto LABEL_10;
    }
LABEL_5:
    if ((v7 & 1) != (isKindOfClass & 1))
    {
      v26 = +[_CDLogging interactionChannel];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        -[_CDInteractionAdviceEngine rankCandidateContacts:usingSettings:]();
      }
      goto LABEL_28;
    }
LABEL_10:

    if (++v8 >= (unint64_t)[v5 count]) {
      goto LABEL_11;
    }
  }
  v26 = +[_CDLogging interactionChannel];
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
    -[_CDInteractionAdviceEngine rankCandidateContacts:usingSettings:]();
  }
LABEL_28:
  v25 = 0;
  v13 = v32;
LABEL_29:

  return v25;
}

- (id)adviseInteractionsUsingSettings:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x192FB2F20]();
  v6 = [v4 seedIdentifiers];
  char v7 = [v6 allObjects];

  uint64_t v8 = [v4 interactionDate];
  v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [MEMORY[0x1E4F1C9C8] date];
  }
  id v11 = v10;

  v12 = +[_CDLogging interactionChannel];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[_CDInteractionAdviceEngine adviseInteractionsUsingSettings:]();
  }

  if ([v7 count])
  {
    v25 = v5;
    v13 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v14 = v7;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v27 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = [[_CDContact alloc] initWithIdentifier:*(void *)(*((void *)&v26 + 1) + 8 * i) type:0 customIdentifier:0 displayName:0 displayType:0 personId:0 personIdType:0];
          [v13 addObject:v19];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v16);
    }

    v20 = +[_CDLogging interactionChannel];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      -[_CDInteractionAdviceEngine adviseInteractionsUsingSettings:]();
    }

    v21 = [(_CDInteractionAdviceEngine *)self socialAdvisor];
    v22 = [v21 adviseInteractionsForDate:v11 andSeedContacts:v13 usingSettings:v4];

    id v5 = v25;
  }
  else
  {
    id v23 = +[_CDLogging interactionChannel];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      -[_CDInteractionAdviceEngine adviseInteractionsUsingSettings:]();
    }

    v13 = [(_CDInteractionAdviceEngine *)self temporalAdvisor];
    v22 = [v13 adviseInteractionsForDate:v11 usingSettings:v4];
  }

  return v22;
}

+ (id)interactionAdviceEngineWithStore:(id)a3
{
  id v3 = a3;
  id v4 = [[_CDInteractionAdviceEngine alloc] initWithStore:v3];

  return v4;
}

- (_CDInteractionAdviceEngine)initWithStore:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_CDInteractionAdviceEngine;
  v6 = [(_CDInteractionAdviceEngine *)&v11 init];
  char v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_store, a3);
    temporalAdvisor = v7->_temporalAdvisor;
    v7->_temporalAdvisor = 0;

    socialAdvisor = v7->_socialAdvisor;
    v7->_socialAdvisor = 0;
  }
  return v7;
}

- (id)adviseInteractionsForDate:(id)a3 usingSettings:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(_CDInteractionAdviceEngine *)self temporalAdvisor];
  v9 = [v8 adviseInteractionsForDate:v7 usingSettings:v6];

  return v9;
}

- (id)adviseInteractionsForKeywordsInString:(id)a3 usingSettings:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queryAdvisor = self->_queryAdvisor;
  if (!queryAdvisor)
  {
    v9 = [[_CDQueryInteractionAdvisor alloc] initWithStore:self->_store];
    id v10 = self->_queryAdvisor;
    self->_queryAdvisor = v9;

    queryAdvisor = self->_queryAdvisor;
  }
  objc_super v11 = [(_CDQueryInteractionAdvisor *)queryAdvisor adviseInteractionsForKeywordsInString:v6 usingSettings:v7];

  return v11;
}

- (id)adviseSocialInteractionsForDate:(id)a3 andSeedContacts:(id)a4 usingSettings:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  objc_super v11 = [(_CDInteractionAdviceEngine *)self socialAdvisor];
  v12 = [v11 adviseInteractionsForDate:v10 andSeedContacts:v9 usingSettings:v8];

  return v12;
}

- (void)tuneSocialAdvisorUsingSettings:(id)a3 heartBeatHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_CDInteractionAdviceEngine *)self socialAdvisor];
  [v8 tuneUsingSettings:v7 heartBeatHandler:v6];
}

- (_CDSocialInteractionAdvisor)socialAdvisor
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_socialAdvisor)
  {
    id v3 = [[_CDSocialInteractionAdvisor alloc] initWithStore:v2->_store];
    socialAdvisor = v2->_socialAdvisor;
    v2->_socialAdvisor = v3;
  }
  objc_sync_exit(v2);

  id v5 = v2->_socialAdvisor;
  return v5;
}

- (_CDTemporalInteractionAdvisor)temporalAdvisor
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_temporalAdvisor)
  {
    id v3 = [[_CDTemporalInteractionAdvisor alloc] initWithStore:v2->_store];
    temporalAdvisor = v2->_temporalAdvisor;
    v2->_temporalAdvisor = v3;
  }
  objc_sync_exit(v2);

  id v5 = v2->_temporalAdvisor;
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryAdvisor, 0);
  objc_storeStrong((id *)&self->_socialAdvisor, 0);
  objc_storeStrong((id *)&self->_temporalAdvisor, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

- (void)rankCandidateContacts:usingSettings:.cold.1()
{
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_18ECEB000, v0, OS_LOG_TYPE_ERROR, "All candidate contacts must be the same type", v1, 2u);
}

- (void)rankCandidateContacts:usingSettings:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_18ECEB000, v0, OS_LOG_TYPE_ERROR, "Cannot rank invalid contact type : %@", v1, 0xCu);
}

- (void)adviseInteractionsUsingSettings:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0(&dword_18ECEB000, v0, v1, "Using temporal advisor", v2, v3, v4, v5, v6);
}

- (void)adviseInteractionsUsingSettings:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0(&dword_18ECEB000, v0, v1, "Using social advisor", v2, v3, v4, v5, v6);
}

- (void)adviseInteractionsUsingSettings:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3_0(&dword_18ECEB000, v0, v1, "Advising interactions using settings : %@", v2, v3, v4, v5, v6);
}

@end