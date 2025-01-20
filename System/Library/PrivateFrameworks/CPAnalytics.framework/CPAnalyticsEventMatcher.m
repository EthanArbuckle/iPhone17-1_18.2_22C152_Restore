@interface CPAnalyticsEventMatcher
+ (id)eventMatcherWithConfiguration:(id)a3;
+ (id)eventMatcherWithEventName:(id)a3;
+ (id)eventMatcherWithEventName:(id)a3 properties:(id)a4;
- (BOOL)doesMatch:(id)a3;
- (CPAnalyticsEventMatcher)initWithConfig:(id)a3;
- (NSArray)conditionalChecks;
- (NSDictionary)eventPropertiesToMatch;
- (NSString)eventKeyToMatch;
- (id)_validateAndParseConditionalChecks:(id)a3;
- (id)_validateAndParseEventKey:(id)a3;
- (id)_validateAndParseEventProperties:(id)a3;
@end

@implementation CPAnalyticsEventMatcher

+ (id)eventMatcherWithEventName:(id)a3 properties:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if ([v6 length])
  {
    id v8 = objc_alloc((Class)a1);
    v12[0] = @"key";
    v12[1] = @"properties";
    v13[0] = v6;
    v13[1] = v7;
    v9 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
    v10 = (void *)[v8 initWithConfig:v9];
  }
  else
  {
    v9 = CPAnalyticsLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v6;
      _os_log_error_impl(&dword_215355000, v9, OS_LOG_TYPE_ERROR, "Invalid event name for event matcher: %@", buf, 0xCu);
    }
    v10 = 0;
  }

  return v10;
}

+ (id)eventMatcherWithEventName:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = objc_alloc((Class)a1);
    v9 = @"key";
    id v10 = v4;
    id v6 = [NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
    id v7 = (void *)[v5 initWithConfig:v6];
  }
  else
  {
    id v6 = CPAnalyticsLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v4;
      _os_log_error_impl(&dword_215355000, v6, OS_LOG_TYPE_ERROR, "Invalid event name for event matcher: %@", buf, 0xCu);
    }
    id v7 = 0;
  }

  return v7;
}

+ (id)eventMatcherWithConfiguration:(id)a3
{
  v28[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 count] != 1) {
    goto LABEL_28;
  }
  id v5 = [v4 allKeys];
  id v6 = [v5 firstObject];

  if ([@"and" isEqual:v6] & 1) != 0 || (objc_msgSend(@"all", "isEqual:", v6))
  {
    int v7 = 0;
    uint64_t v8 = 1;
  }
  else if (([@"or" isEqual:v6] & 1) != 0 {
         || ([@"any" isEqual:v6] & 1) != 0)
  }
  {
    int v7 = 0;
    uint64_t v8 = 2;
  }
  else
  {
    if (([@"not" isEqual:v6] & 1) == 0) {
      goto LABEL_27;
    }
    int v7 = 1;
    uint64_t v8 = 3;
  }
  uint64_t v9 = [v4 objectForKeyedSubscript:v6];
  id v10 = (void *)v9;
  if (v7)
  {
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v28[0] = v10;
        uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:1];

        id v10 = (void *)v11;
      }
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_27:
LABEL_28:
    v20 = (CPAnalyticsCompoundEventMatcher *)[objc_alloc((Class)a1) initWithConfig:v4];
    goto LABEL_29;
  }
  uint64_t v22 = v8;
  id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v13 = v10;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v24 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v19 = [a1 eventMatcherWithConfiguration:v18];
          if (v19) {
            [v12 addObject:v19];
          }
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v15);
  }

  v20 = [[CPAnalyticsCompoundEventMatcher alloc] initWithType:v22 subEventMatchers:v12];
  if (!v20) {
    goto LABEL_28;
  }
LABEL_29:

  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conditionalChecks, 0);
  objc_storeStrong((id *)&self->_eventPropertiesToMatch, 0);
  objc_storeStrong((id *)&self->_eventKeyToMatch, 0);
}

- (NSArray)conditionalChecks
{
  return self->_conditionalChecks;
}

- (NSDictionary)eventPropertiesToMatch
{
  return self->_eventPropertiesToMatch;
}

- (NSString)eventKeyToMatch
{
  return self->_eventKeyToMatch;
}

- (id)_validateAndParseConditionalChecks:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          uint64_t v11 = [CPAnalyticsConditional alloc];
          id v12 = -[CPAnalyticsConditional initWithConfig:](v11, "initWithConfig:", v10, (void)v15);
          if (v12) {
            [v4 addObject:v12];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v7);
    }

    if ([v4 count]) {
      id v13 = (void *)[v4 copy];
    }
    else {
      id v13 = 0;
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (id)_validateAndParseEventProperties:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v5 = objc_msgSend(v3, "allKeys", 0);
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          uint64_t v11 = [v3 objectForKey:v10];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v4 setObject:v11 forKey:v10];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }

    id v12 = (void *)[v4 copy];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)_validateAndParseEventKey:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v3 length]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (BOOL)doesMatch:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(CPAnalyticsEventMatcher *)self eventKeyToMatch];
  if (v5
    && ([v4 name],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 isEqualToString:v5],
        v6,
        !v7))
  {
    BOOL v26 = 0;
  }
  else
  {
    [(CPAnalyticsEventMatcher *)self eventPropertiesToMatch];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v28 = long long v36 = 0u;
    uint64_t v8 = [v28 allKeys];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v34;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v34 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v33 + 1) + 8 * i);
          long long v14 = [v4 propertyForKey:v13];
          if (!v14
            || ([(CPAnalyticsEventMatcher *)self eventPropertiesToMatch],
                long long v15 = objc_claimAutoreleasedReturnValue(),
                [v15 valueForKey:v13],
                long long v16 = objc_claimAutoreleasedReturnValue(),
                v15,
                LODWORD(v15) = [v16 isEqual:v14],
                v16,
                !v15))
          {

            BOOL v26 = 0;
            long long v17 = v28;
            goto LABEL_27;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v33 objects:v38 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    long long v17 = v28;
    if (v5 || [v28 count])
    {
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      uint64_t v8 = [(CPAnalyticsEventMatcher *)self conditionalChecks];
      uint64_t v18 = [v8 countByEnumeratingWithState:&v29 objects:v37 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v30;
        while (2)
        {
          for (uint64_t j = 0; j != v19; ++j)
          {
            if (*(void *)v30 != v20) {
              objc_enumerationMutation(v8);
            }
            uint64_t v22 = *(void **)(*((void *)&v29 + 1) + 8 * j);
            long long v23 = [v22 property];
            long long v24 = [v4 propertyForKey:v23];

            long long v25 = [v22 predicate];
            LODWORD(v23) = [v25 evaluateWithObject:v24];

            if (!v23)
            {
              BOOL v26 = 0;
              goto LABEL_27;
            }
          }
          uint64_t v19 = [v8 countByEnumeratingWithState:&v29 objects:v37 count:16];
          BOOL v26 = 1;
          if (v19) {
            continue;
          }
          break;
        }
      }
      else
      {
        BOOL v26 = 1;
      }
LABEL_27:
    }
    else
    {
      BOOL v26 = 0;
    }
  }
  return v26;
}

- (CPAnalyticsEventMatcher)initWithConfig:(id)a3
{
  id v4 = a3;
  id v5 = [(CPAnalyticsEventMatcher *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"key"];
    uint64_t v7 = [(CPAnalyticsEventMatcher *)v5 _validateAndParseEventKey:v6];
    eventKeyToMatch = v5->_eventKeyToMatch;
    v5->_eventKeyToMatch = (NSString *)v7;

    uint64_t v9 = [v4 objectForKeyedSubscript:@"properties"];
    uint64_t v10 = [(CPAnalyticsEventMatcher *)v5 _validateAndParseEventProperties:v9];
    eventPropertiesToMatch = v5->_eventPropertiesToMatch;
    v5->_eventPropertiesToMatch = (NSDictionary *)v10;

    if (!v5->_eventKeyToMatch && ![(NSDictionary *)v5->_eventPropertiesToMatch count])
    {

      long long v15 = 0;
      goto LABEL_6;
    }
    id v12 = [v4 objectForKeyedSubscript:@"conditionalChecks"];
    uint64_t v13 = [(CPAnalyticsEventMatcher *)v5 _validateAndParseConditionalChecks:v12];
    conditionalChecks = v5->_conditionalChecks;
    v5->_conditionalChecks = (NSArray *)v13;
  }
  long long v15 = v5;
LABEL_6:

  return v15;
}

@end