@interface LPFetcherGroup
- (LPFetcherGroup)initWithPolicy:(int64_t)a3 configuration:(id)a4 description:(id)a5 completionHandler:(id)a6;
- (id)_responsesRespectingPolicy;
- (unint64_t)numberOfActiveFetches;
- (unsigned)loggingID;
- (void)_addFetcher:(id)a3 atIndex:(unint64_t)a4;
- (void)_completed;
- (void)appendFetcher:(id)a3;
- (void)cancel;
- (void)doneAddingFetchers;
- (void)evaluateCompleteness;
- (void)prependFetcher:(id)a3;
- (void)startFetchesIfNeeded;
@end

@implementation LPFetcherGroup

- (LPFetcherGroup)initWithPolicy:(int64_t)a3 configuration:(id)a4 description:(id)a5 completionHandler:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v30.receiver = self;
  v30.super_class = (Class)LPFetcherGroup;
  v13 = [(LPFetcherGroup *)&v30 init];
  v14 = v13;
  v15 = v13;
  if (v13)
  {
    v13->_loggingID = ++initWithPolicy_configuration_description_completionHandler__nextLoggingID;
    v13->_responsePolicy = a3;
    uint64_t v16 = [v10 copy];
    configuration = v15->_configuration;
    v15->_configuration = (LPFetcherConfiguration *)v16;

    v18 = _Block_copy(v12);
    id completionHandler = v15->_completionHandler;
    v15->_id completionHandler = v18;

    objc_storeStrong((id *)&v14->_description, a5);
    v20 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    tasks = v15->_tasks;
    v15->_tasks = v20;

    v22 = [(LPFetcherConfiguration *)v15->_configuration webViewForProcessSharing];

    if (!v22)
    {
      id v23 = objc_alloc(MEMORY[0x1E4F466F0]);
      id v24 = +[LPMetadataProvider _copyDefaultWebViewConfiguration];
      v25 = objc_msgSend(v23, "initWithFrame:configuration:", v24, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      [(LPFetcherConfiguration *)v15->_configuration setWebViewForProcessSharing:v25];
    }
    v26 = [(LPFetcherConfiguration *)v15->_configuration rootEvent];
    v27 = [v26 childWithType:1 subtitle:v11];
    [(LPFetcherConfiguration *)v15->_configuration setRootEvent:v27];

    v28 = v15;
  }

  return v15;
}

- (void)_addFetcher:(id)a3 atIndex:(unint64_t)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void *)MEMORY[0x1E4F1C3A8];
  if (self->_done) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"Trying to add a fetcher to an already-complete LPFetcherGroup."];
  }
  if (self->_doneAddingFetchers) {
    [MEMORY[0x1E4F1CA00] raise:*v7 format:@"Trying to add a fetcher to an LPFetcherGroup on which -doneAddingFetchers was already called."];
  }
  v8 = objc_alloc_init(LPFetcherGroupTask);
  [(LPFetcherGroupTask *)v8 setFetcher:v6];
  v9 = (id)LPLogChannelFetching();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int loggingID = self->_loggingID;
    int v11 = [v6 _loggingID];
    description = self->_description;
    v13[0] = 67109634;
    v13[1] = loggingID;
    __int16 v14 = 1024;
    int v15 = v11;
    __int16 v16 = 2112;
    v17 = description;
    _os_log_impl(&dword_1A35DC000, v9, OS_LOG_TYPE_DEFAULT, "LPFetcherGroup<%d>: adding LPFetcher<%d> for %@", (uint8_t *)v13, 0x18u);
  }

  [(NSMutableArray *)self->_tasks insertObject:v8 atIndex:a4];
  [(LPFetcherGroup *)self startFetchesIfNeeded];
}

- (void)appendFetcher:(id)a3
{
  id v4 = a3;
  [(LPFetcherGroup *)self _addFetcher:v4 atIndex:[(NSMutableArray *)self->_tasks count]];
}

- (void)prependFetcher:(id)a3
{
}

- (unint64_t)numberOfActiveFetches
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = self->_tasks;
  unint64_t v3 = 0;
  uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v7, "hasStarted", (void)v11))
        {
          v8 = [v7 response];
          BOOL v9 = v8 == 0;

          v3 += v9;
        }
      }
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }

  return v3;
}

- (void)startFetchesIfNeeded
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(LPFetcherGroup *)self numberOfActiveFetches];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = self->_tasks;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (([v8 hasStarted] & 1) == 0)
        {
          if (v3 > 5) {
            goto LABEL_11;
          }
          [v8 setHasStarted:1];
          BOOL v9 = [v8 fetcher];
          configuration = self->_configuration;
          v11[0] = MEMORY[0x1E4F143A8];
          v11[1] = 3221225472;
          v11[2] = __38__LPFetcherGroup_startFetchesIfNeeded__block_invoke;
          v11[3] = &unk_1E5B068C0;
          v11[4] = v8;
          v11[5] = self;
          [v9 fetchWithConfiguration:configuration completionHandler:v11];

          ++v3;
        }
      }
      uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
LABEL_11:
}

void __38__LPFetcherGroup_startFetchesIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setResponse:");
  [*(id *)(a1 + 40) evaluateCompleteness];
  [*(id *)(a1 + 40) startFetchesIfNeeded];
}

- (void)doneAddingFetchers
{
  self->_doneAddingFetchers = 1;
  [(LPFetcherGroup *)self evaluateCompleteness];
}

- (void)evaluateCompleteness
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0(&dword_1A35DC000, v0, v1, "LPFetcherGroup<%d>: complete, all fetchers fulfilled", v2, v3, v4, v5, v6);
}

- (id)_responsesRespectingPolicy
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  int64_t responsePolicy = self->_responsePolicy;
  if (responsePolicy)
  {
    if (responsePolicy == 2)
    {
      id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      uint64_t v5 = self->_tasks;
      uint64_t v22 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v38 objects:v47 count:16];
      if (v22)
      {
        uint64_t v23 = *(void *)v39;
LABEL_27:
        uint64_t v24 = 0;
        while (1)
        {
          if (*(void *)v39 != v23) {
            objc_enumerationMutation(v5);
          }
          v25 = *(void **)(*((void *)&v38 + 1) + 8 * v24);
          unint64_t v26 = [v2 count];
          if (v26 >= [(LPFetcherConfiguration *)self->_configuration maximumResponseCount]) {
            break;
          }
          v27 = [v25 response];
          BOOL v28 = v27 == 0;

          if (!v28)
          {
            v29 = [v25 response];
            uint64_t v30 = [v29 state];

            if (v30 == 2)
            {
              v31 = [v25 response];
              [v2 addObject:v31];
            }
          }
          if (v22 == ++v24)
          {
            uint64_t v22 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v38 objects:v47 count:16];
            if (v22) {
              goto LABEL_27;
            }
            break;
          }
        }
      }
    }
    else
    {
      if (responsePolicy != 1) {
        goto LABEL_40;
      }
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      uint64_t v5 = self->_tasks;
      uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v42 objects:v49 count:16];
      if (v6)
      {
        uint64_t v7 = *(void *)v43;
        id v2 = (id)MEMORY[0x1E4F1CBF0];
        while (2)
        {
          for (uint64_t i = 0; i != v6; ++i)
          {
            if (*(void *)v43 != v7) {
              objc_enumerationMutation(v5);
            }
            BOOL v9 = *(void **)(*((void *)&v42 + 1) + 8 * i);
            id v10 = [v9 response];
            BOOL v11 = v10 == 0;

            if (!v11)
            {
              long long v12 = [v9 response];
              uint64_t v13 = [v12 state];

              if (v13 == 2)
              {
                v32 = [v9 response];
                v48 = v32;
                id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v48 count:1];

                goto LABEL_39;
              }
            }
          }
          uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v42 objects:v49 count:16];
          if (v6) {
            continue;
          }
          break;
        }
      }
      else
      {
        id v2 = (id)MEMORY[0x1E4F1CBF0];
      }
    }
  }
  else
  {
    id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    uint64_t v5 = self->_tasks;
    uint64_t v14 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v34 objects:v46 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v35;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v35 != v15) {
            objc_enumerationMutation(v5);
          }
          uint64_t v17 = *(void **)(*((void *)&v34 + 1) + 8 * j);
          uint64_t v18 = objc_msgSend(v17, "response", (void)v34);
          if (v18)
          {
            v19 = [v17 response];
            BOOL v20 = [v19 state] == 2;

            if (v20)
            {
              v21 = [v17 response];
              [v2 addObject:v21];
            }
          }
        }
        uint64_t v14 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v34 objects:v46 count:16];
      }
      while (v14);
    }
  }
LABEL_39:

LABEL_40:

  return v2;
}

- (void)cancel
{
  id completionHandler = self->_completionHandler;
  self->_id completionHandler = 0;

  self->_cancelled = 1;

  [(LPFetcherGroup *)self _completed];
}

- (void)_completed
{
  *(_DWORD *)buf = 67109376;
  *((_DWORD *)buf + 1) = a2;
  *((_WORD *)buf + 4) = 2048;
  *(void *)(buf + 10) = a3;
  _os_log_debug_impl(&dword_1A35DC000, log, OS_LOG_TYPE_DEBUG, "LPFetcherGroup<%d>: complete with %lu responses", buf, 0x12u);
}

- (unsigned)loggingID
{
  return self->_loggingID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_description, 0);
  objc_storeStrong((id *)&self->_tasks, 0);
  objc_storeStrong(&self->_completionHandler, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

@end