@interface CKContextCompleter
- (CKContextCompleter)initWithResponse:(id)a3;
- (id)_resultsMatching:(id)a3;
- (id)queriesMatching:(id)a3;
- (id)resultsMatching:(id)a3;
- (id)resultsMatchingTags:(id)a3;
- (void)dealloc;
- (void)discard;
- (void)logEngagement:(id)a3 forInput:(id)a4;
- (void)logEngagement:(id)a3 forInput:(id)a4 completion:(id)a5;
- (void)logResultsShown:(unint64_t)a3 serverOverride:(BOOL)a4;
- (void)logResultsShown:(unint64_t)a3 serverOverride:(BOOL)a4 forInput:(id)a5;
- (void)logTransactionSuccessfulForInput:(id)a3;
- (void)logTransactionSuccessfulForInput:(id)a3 completion:(id)a4;
@end

@implementation CKContextCompleter

- (CKContextCompleter)initWithResponse:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v21.receiver = self;
    v21.super_class = (Class)CKContextCompleter;
    v6 = [(CKContextCompleter *)&v21 init];
    if (v6)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG)) {
        -[CKContextCompleter initWithResponse:]((uint64_t)v5);
      }
      objc_storeStrong((id *)&v6->_response, a3);
      ignorePrefix = v6->_ignorePrefix;
      v6->_ignorePrefix = 0;

      v6->_creationTime = mach_continuous_approximate_time();
      v6->_likelyUnsolicited = +[CKContextClient isLikelyUnsolicitedUserInteraction];
      uint64_t v8 = [v5 hideCompletionsAfterDate];
      hideCompletionsAfterDate = v6->_hideCompletionsAfterDate;
      v6->_hideCompletionsAfterDate = (NSDate *)v8;

      v10 = v6->_hideCompletionsAfterDate;
      BOOL v12 = 0;
      if (v10)
      {
        [(NSDate *)v10 timeIntervalSinceNow];
        if (v11 < 0.0) {
          BOOL v12 = 1;
        }
      }
      v6->_hideCompletions = v12;
      uint64_t v14 = [MEMORY[0x1E4F1CA20] currentLocale];
      searchLocale = v6->_searchLocale;
      v6->_searchLocale = (NSLocale *)v14;

      uint64_t v16 = [v5 results];
      couldHaveShown = v6->_couldHaveShown;
      v6->_couldHaveShown = (NSArray *)v16;

      uint64_t v18 = [(CKContextCompleter *)v6 _resultsMatching:0];
      zkwResults = v6->_zkwResults;
      v6->_zkwResults = (NSMutableArray *)v18;

      v6->_mustPrefixMatchLength = [v5 mustPrefixMatchLength];
    }
    self = v6;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)resultsMatching:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 length])
  {
    atomic_fetch_add((atomic_ullong *volatile)&self->_inputKeystrokes, 1uLL);
    couldHaveShown = self->_couldHaveShown;
    if (couldHaveShown) {
      BOOL v6 = [(NSArray *)couldHaveShown count] != 0;
    }
    else {
      BOOL v6 = 0;
    }
    uint64_t v8 = [(CKContextCompleter *)self _resultsMatching:v4];
    if (self->_mustPrefixMatchLength)
    {
      if ([v4 length] >= self->_mustPrefixMatchLength)
      {
        unint64_t v9 = atomic_load(&self->_inputKeystrokes);
        if (v9 >= self->_mustPrefixMatchLength) {
          goto LABEL_38;
        }
      }
    }
    if (v8) {
      goto LABEL_11;
    }
    if (self->_hideCompletions)
    {
      uint64_t v8 = 0;
      goto LABEL_38;
    }
    ignorePrefix = self->_ignorePrefix;
    self->_ignorePrefix = 0;

    v32 = self->_input;
    v33 = v32;
    if (!v6
      || ![(NSString *)v32 length]
      || [v4 rangeOfString:v33]
      || ([(CKContextCompleter *)self _resultsMatching:v33],
          (uint64_t v8 = (NSMutableArray *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      uint64_t v8 = self->_zkwResults;
    }
    v34 = (NSString *)[v4 copy];
    input = self->_input;
    self->_input = v34;

    if (v8)
    {
LABEL_11:
      if (v8 != self->_zkwResults)
      {
        id v36 = v4;
        v10 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", -[NSMutableArray count](v8, "count"));
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        long long v44 = 0u;
        uint64_t v8 = v8;
        uint64_t v11 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v41 objects:v46 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v42;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v42 != v13) {
                objc_enumerationMutation(v8);
              }
              v15 = *(void **)(*((void *)&v41 + 1) + 8 * i);
              uint64_t v16 = [v15 title];
              uint64_t v17 = [v16 length];

              if (v17)
              {
                uint64_t v18 = [v15 title];
                [v10 addObject:v18];
              }
            }
            uint64_t v12 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v41 objects:v46 count:16];
          }
          while (v12);
        }

        long long v39 = 0u;
        long long v40 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        v19 = self->_zkwResults;
        uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v37 objects:v45 count:16];
        if (v20)
        {
          uint64_t v21 = v20;
          uint64_t v22 = *(void *)v38;
          do
          {
            for (uint64_t j = 0; j != v21; ++j)
            {
              if (*(void *)v38 != v22) {
                objc_enumerationMutation(v19);
              }
              v24 = *(void **)(*((void *)&v37 + 1) + 8 * j);
              v25 = [v24 title];
              uint64_t v26 = [v25 length];

              if (v26)
              {
                v27 = [v24 title];
                char v28 = [v10 containsObject:v27];

                if ((v28 & 1) == 0) {
                  [(NSMutableArray *)v8 addObject:v24];
                }
              }
            }
            uint64_t v21 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v37 objects:v45 count:16];
          }
          while (v21);
        }

        id v4 = v36;
      }
    }
  }
  else
  {
    if (self->_hideZKW) {
      zkwResults = 0;
    }
    else {
      zkwResults = self->_zkwResults;
    }
    uint64_t v8 = zkwResults;
    if ([(NSString *)self->_input length]) {
      atomic_fetch_add((atomic_ullong *volatile)&self->_inputKeystrokes, 1uLL);
    }
    v29 = self->_input;
    self->_input = (NSString *)&stru_1EF81F168;
  }
LABEL_38:
  objc_storeStrong((id *)&self->_couldHaveShown, v8);

  return v8;
}

- (id)_resultsMatching:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  input = self->_input;
  self->_input = 0;

  BOOL v6 = self->_response;
  if (v6 && (unint64_t)[v4 length] <= 0xFF)
  {
    if (v4) {
      uint64_t v8 = (__CFString *)[v4 copy];
    }
    else {
      uint64_t v8 = &stru_1EF81F168;
    }
    unint64_t v9 = self->_input;
    self->_input = &v8->isa;

    id v10 = [(CKContextResponse *)v6 results];
    if ([v10 count])
    {
      long long v41 = normalizeForSearch(v4);
      if ([v41 length])
      {
        if (self->_ignorePrefix && (objc_msgSend(v4, "hasPrefix:") & 1) != 0 || self->_hideCompletions)
        {
          id v7 = 0;
        }
        else
        {
          hideCompletionsAfterDate = self->_hideCompletionsAfterDate;
          if (hideCompletionsAfterDate
            && ([(NSDate *)hideCompletionsAfterDate timeIntervalSinceNow], v18 < 0.0))
          {
            id v7 = 0;
            self->_hideCompletions = 1;
          }
          else
          {
            long long v37 = v4;
            long long v38 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v10, "count", v6));
            long long v42 = 0u;
            long long v43 = 0u;
            long long v44 = 0u;
            long long v45 = 0u;
            id v10 = v10;
            uint64_t v40 = [v10 countByEnumeratingWithState:&v42 objects:v50 count:16];
            if (v40)
            {
              uint64_t v39 = *(void *)v43;
              do
              {
                for (uint64_t i = 0; i != v40; ++i)
                {
                  if (*(void *)v43 != v39) {
                    objc_enumerationMutation(v10);
                  }
                  uint64_t v20 = *(void **)(*((void *)&v42 + 1) + 8 * i);
                  uint64_t v21 = [v20 title];
                  uint64_t v22 = normalizeForSearch(v21);

                  if ([v22 length])
                  {
                    uint64_t v23 = [v22 length];
                    if (v23)
                    {
                      unint64_t v24 = v23;
                      uint64_t v25 = 0;
                      char v26 = 0;
                      uint64_t v27 = v23;
                      do
                      {
                        uint64_t v28 = objc_msgSend(v22, "rangeOfString:options:range:locale:", v41, 129, v25, v27, self->_searchLocale);
                        if (!v29) {
                          break;
                        }
                        uint64_t v30 = v28;
                        if (!v28) {
                          goto LABEL_47;
                        }
                        int v31 = [v22 characterAtIndex:v28 - 1];
                        v26 |= v31 == 32;
                        if (v31 == 32)
                        {
                          BOOL v32 = 1;
                        }
                        else
                        {
                          uint64_t v25 = v30 + 1;
                          uint64_t v27 = v24 - (v30 + 1);
                          BOOL v32 = v30 + 1 >= v24;
                        }
                      }
                      while (!v32);
                      if ((v26 & 1) == 0) {
                        goto LABEL_48;
                      }
LABEL_47:
                      [v38 addObject:v20];
                    }
                  }
LABEL_48:
                }
                uint64_t v40 = [v10 countByEnumeratingWithState:&v42 objects:v50 count:16];
              }
              while (v40);
            }

            if ([v38 count])
            {
              id v7 = v38;
              id v4 = v37;
            }
            else
            {
              id v4 = v37;
              v33 = (NSString *)[v37 copy];
              ignorePrefix = self->_ignorePrefix;
              self->_ignorePrefix = v33;

              id v7 = 0;
            }
            BOOL v6 = v36;
          }
        }
      }
      else if ([(CKContextResponse *)self->_response resultsNeedFiltering])
      {
        id v7 = (id)objc_opt_new();
        long long v46 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        id v10 = v10;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v46 objects:v51 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v47;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v47 != v13) {
                objc_enumerationMutation(v10);
              }
              v15 = *(void **)(*((void *)&v46 + 1) + 8 * j);
              if (![v15 minPrefix]) {
                [v7 addObject:v15];
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v46 objects:v51 count:16];
          }
          while (v12);
        }
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          uint64_t v16 = [MEMORY[0x1E4F1CA48] arrayWithArray:v10];

          id v10 = (id)v16;
        }
        id v10 = v10;
        id v7 = v10;
      }
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)resultsMatchingTags:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = self->_response;
  if (v5 && [v4 count])
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1CA48]);
    id v7 = [(CKContextResponse *)v5 results];
    uint64_t v8 = objc_msgSend(v6, "initWithCapacity:", objc_msgSend(v7, "count"));

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v20 = v5;
    unint64_t v9 = [(CKContextResponse *)v5 results];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          uint64_t v15 = [v14 tags];
          if (v15)
          {
            uint64_t v16 = (void *)v15;
            uint64_t v17 = [v14 tags];
            int v18 = [v17 intersectsSet:v4];

            if (v18) {
              [v8 addObject:v14];
            }
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v11);
    }

    id v5 = v20;
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)queriesMatching:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v3 = [(CKContextCompleter *)self resultsMatching:a3];
  id v4 = v3;
  if (v3)
  {
    id v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "query", (void)v13);
          if ([v11 length]) {
            [v5 addObject:v11];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)logResultsShown:(unint64_t)a3 serverOverride:(BOOL)a4
{
}

- (void)logResultsShown:(unint64_t)a3 serverOverride:(BOOL)a4 forInput:(id)a5
{
  BOOL v5 = a4;
  response = self->_response;
  unint64_t v9 = atomic_load(&self->_inputKeystrokes);
  unint64_t v10 = [a5 length];
  if (v10 > 1 && v9 == 1) {
    unint64_t v12 = 0;
  }
  else {
    unint64_t v12 = v9;
  }
  if (v9 >= v10) {
    unint64_t v13 = v10;
  }
  else {
    unint64_t v13 = v12;
  }
  couldHaveShown = self->_couldHaveShown;
  [(CKContextResponse *)response markResultsShown:a3 serverOverride:v5 forInputLength:v13 results:couldHaveShown];
}

- (void)logEngagement:(id)a3 forInput:(id)a4
{
}

- (void)logEngagement:(id)a3 forInput:(id)a4 completion:(id)a5
{
  atomic_store(1u, (unsigned __int8 *)&self->_engaged);
  response = self->_response;
  unint64_t v9 = atomic_load(&self->_inputKeystrokes);
  id v10 = a5;
  id v15 = a3;
  unint64_t v11 = [a4 length];
  if (v11 > 1 && v9 == 1) {
    unint64_t v13 = 0;
  }
  else {
    unint64_t v13 = v9;
  }
  if (v9 >= v11) {
    unint64_t v14 = v11;
  }
  else {
    unint64_t v14 = v13;
  }
  [(CKContextResponse *)response logEngagement:v15 forInputLength:v14 completion:v10 likelyUnsolicited:self->_likelyUnsolicited];
}

- (void)logTransactionSuccessfulForInput:(id)a3
{
}

- (void)logTransactionSuccessfulForInput:(id)a3 completion:(id)a4
{
  response = self->_response;
  unint64_t v7 = atomic_load(&self->_inputKeystrokes);
  id v12 = a4;
  unint64_t v8 = [a3 length];
  if (v8 > 1 && v7 == 1) {
    unint64_t v10 = 0;
  }
  else {
    unint64_t v10 = v7;
  }
  if (v7 >= v8) {
    unint64_t v11 = v8;
  }
  else {
    unint64_t v11 = v10;
  }
  [(CKContextResponse *)response logTransactionSuccessfulForInputLength:v11 completion:v12 likelyUnsolicited:self->_likelyUnsolicited];
}

- (void)discard
{
  input = self->_input;
  self->_input = 0;

  if ((atomic_exchange((atomic_uchar *volatile)&self->_discarded, 1u) & 1) == 0)
  {
    unsigned __int8 v4 = atomic_load((unsigned __int8 *)&self->_engaged);
    if ((v4 & 1) != 0
      || (unint64_t v5 = atomic_load(&self->_inputKeystrokes)) != 0
      && ([(NSString *)self->_input length] || (unint64_t v6 = atomic_load(&self->_inputKeystrokes), v6 != 1)))
    {
      response = self->_response;
      BOOL likelyUnsolicited = self->_likelyUnsolicited;
      [(CKContextResponse *)response discardAndLogCompleter:self likelyUnsolicited:likelyUnsolicited];
    }
  }
}

- (void)dealloc
{
  [(CKContextCompleter *)self discard];
  v3.receiver = self;
  v3.super_class = (Class)CKContextCompleter;
  [(CKContextCompleter *)&v3 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zkwResults, 0);
  objc_storeStrong((id *)&self->_hideCompletionsAfterDate, 0);
  objc_storeStrong((id *)&self->_input, 0);
  objc_storeStrong((id *)&self->_couldHaveShown, 0);
  objc_storeStrong((id *)&self->_searchLocale, 0);
  objc_storeStrong((id *)&self->_ignorePrefix, 0);
  objc_storeStrong((id *)&self->_response, 0);
}

- (void)initWithResponse:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 134217984;
  uint64_t v2 = a1;
  _os_log_debug_impl(&dword_1A45F4000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "New CKContextCompleter for response %p", (uint8_t *)&v1, 0xCu);
}

@end