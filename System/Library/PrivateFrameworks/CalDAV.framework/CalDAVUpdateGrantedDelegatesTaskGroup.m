@interface CalDAVUpdateGrantedDelegatesTaskGroup
- (CalDAVGetGrantedDelegatesTaskGroup)getGrantedDelegatesTaskGroup;
- (CalDAVUpdateGrantedDelegatesTaskGroup)initWithAccountInfoProvider:(id)a3 addWriteURLs:(id)a4 addReadURLs:(id)a5 removeURLs:(id)a6 taskManager:(id)a7;
- (NSSet)addReadURLs;
- (NSSet)addWriteURLs;
- (NSSet)removeURLs;
- (NSSet)updatedReadURLs;
- (NSSet)updatedWriteURLs;
- (int)state;
- (void)_fetchExistingGrantedDelegates;
- (void)_finishWithError:(id)a3 state:(int)a4;
- (void)_populateUpdatesFromFetched:(id)a3 allowWrite:(BOOL)a4;
- (void)_updateDelegatesWithAllowWrite:(BOOL)a3;
- (void)propPatchTask:(id)a3 parsedResponses:(id)a4 error:(id)a5;
- (void)setAddReadURLs:(id)a3;
- (void)setAddWriteURLs:(id)a3;
- (void)setGetGrantedDelegatesTaskGroup:(id)a3;
- (void)setRemoveURLs:(id)a3;
- (void)setState:(int)a3;
- (void)setUpdatedReadURLs:(id)a3;
- (void)setUpdatedWriteURLs:(id)a3;
- (void)taskGroup:(id)a3 didFinishWithError:(id)a4;
@end

@implementation CalDAVUpdateGrantedDelegatesTaskGroup

- (CalDAVUpdateGrantedDelegatesTaskGroup)initWithAccountInfoProvider:(id)a3 addWriteURLs:(id)a4 addReadURLs:(id)a5 removeURLs:(id)a6 taskManager:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CalDAVUpdateGrantedDelegatesTaskGroup;
  v15 = [(CoreDAVTaskGroup *)&v18 initWithAccountInfoProvider:a3 taskManager:a7];
  v16 = v15;
  if (v15)
  {
    [(CalDAVUpdateGrantedDelegatesTaskGroup *)v15 setState:0];
    [(CalDAVUpdateGrantedDelegatesTaskGroup *)v16 setAddWriteURLs:v12];
    [(CalDAVUpdateGrantedDelegatesTaskGroup *)v16 setAddReadURLs:v13];
    [(CalDAVUpdateGrantedDelegatesTaskGroup *)v16 setRemoveURLs:v14];
  }

  return v16;
}

- (void)_finishWithError:(id)a3 state:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  [(CalDAVUpdateGrantedDelegatesTaskGroup *)self setState:v4];
  if (v4 == 6)
  {
    v7 = [MEMORY[0x263F34B30] sharedLogging];
    v8 = [v7 logHandleForAccountInfoProvider:0];
    v9 = v8;
    if (v8 && os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = (objc_class *)objc_opt_class();
      v11 = NSStringFromClass(v10);
      int v12 = 138543362;
      id v13 = v11;
      _os_log_impl(&dword_213CEC000, v9, OS_LOG_TYPE_ERROR, "Finishing %{public}@ early because state machine reached an unexpected state.", (uint8_t *)&v12, 0xCu);
    }
  }
  [(CoreDAVTaskGroup *)self finishCoreDAVTaskGroupWithError:v6 delegateCallbackBlock:0];
}

- (void)_fetchExistingGrantedDelegates
{
  [(CalDAVUpdateGrantedDelegatesTaskGroup *)self setState:1];
  v3 = [(CoreDAVTaskGroup *)self accountInfoProvider];
  id v11 = [v3 principalURL];

  uint64_t v4 = [CalDAVGetGrantedDelegatesTaskGroup alloc];
  v5 = [(CoreDAVTaskGroup *)self accountInfoProvider];
  id v6 = [(CoreDAVTaskGroup *)self taskManager];
  v7 = [(CalDAVGetGrantedDelegatesTaskGroup *)v4 initWithAccountInfoProvider:v5 principalURL:v11 taskManager:v6];
  [(CalDAVUpdateGrantedDelegatesTaskGroup *)self setGetGrantedDelegatesTaskGroup:v7];

  v8 = [(CalDAVUpdateGrantedDelegatesTaskGroup *)self getGrantedDelegatesTaskGroup];
  [v8 setFetchPrincipalDetails:0];

  v9 = [(CalDAVUpdateGrantedDelegatesTaskGroup *)self getGrantedDelegatesTaskGroup];
  [v9 setDelegate:self];

  v10 = [(CalDAVUpdateGrantedDelegatesTaskGroup *)self getGrantedDelegatesTaskGroup];
  [v10 startTaskGroup];
}

- (void)_updateDelegatesWithAllowWrite:(BOOL)a3
{
  v3 = self;
  uint64_t v38 = *MEMORY[0x263EF8340];
  if (a3)
  {
    [(CalDAVUpdateGrantedDelegatesTaskGroup *)self setState:3];
    uint64_t v4 = @"calendar-proxy-write/";
    [(CalDAVUpdateGrantedDelegatesTaskGroup *)v3 updatedWriteURLs];
  }
  else
  {
    [(CalDAVUpdateGrantedDelegatesTaskGroup *)self setState:2];
    uint64_t v4 = @"calendar-proxy-read/";
    [(CalDAVUpdateGrantedDelegatesTaskGroup *)v3 updatedReadURLs];
  v5 = };
  id v6 = [(CoreDAVTaskGroup *)v3 accountInfoProvider];
  v7 = [v6 principalURL];
  v8 = [v7 CDVfixedURLByAppendingPathComponent:v4];

  id v9 = objc_alloc(MEMORY[0x263F34AF8]);
  uint64_t v10 = *MEMORY[0x263F34E10];
  id v11 = (void *)[v9 initWithNameSpace:*MEMORY[0x263F34E10] andName:*MEMORY[0x263F34E40]];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v12 = v5;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    v30 = v8;
    v31 = v4;
    v32 = v3;
    v15 = 0;
    uint64_t v16 = *(void *)v34;
    uint64_t v17 = *MEMORY[0x263F34E50];
    do
    {
      uint64_t v18 = 0;
      v19 = v15;
      do
      {
        if (*(void *)v34 != v16) {
          objc_enumerationMutation(v12);
        }
        v20 = *(void **)(*((void *)&v33 + 1) + 8 * v18);
        v15 = (void *)[objc_alloc(MEMORY[0x263F34AF8]) initWithNameSpace:v10 andName:v17];

        v21 = [v20 CDVRawPath];
        v22 = [v21 dataUsingEncoding:4];
        [v15 setPayload:v22];

        v23 = [v11 extraChildItems];
        [v23 addObject:v15];

        ++v18;
        v19 = v15;
      }
      while (v14 != v18);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v14);

    uint64_t v4 = v31;
    v3 = v32;
    v8 = v30;
  }

  id v24 = objc_alloc(MEMORY[0x263F34B88]);
  v25 = [MEMORY[0x263EFFA08] setWithObject:v11];
  v26 = (void *)[v24 initWithPropertiesToSet:v25 andRemove:0 atURL:v8];

  v27 = [(CoreDAVTaskGroup *)v3 outstandingTasks];
  [v27 addObject:v26];

  v28 = [(CoreDAVTaskGroup *)v3 accountInfoProvider];
  [v26 setAccountInfoProvider:v28];

  [v26 setDelegate:v3];
  v29 = [(CoreDAVTaskGroup *)v3 taskManager];
  [v29 submitQueuedCoreDAVTask:v26];
}

- (void)_populateUpdatesFromFetched:(id)a3 allowWrite:(BOOL)a4
{
  BOOL v4 = a4;
  id v12 = a3;
  if (v4)
  {
    id v6 = [(CalDAVUpdateGrantedDelegatesTaskGroup *)self addWriteURLs];
    [(CalDAVUpdateGrantedDelegatesTaskGroup *)self addReadURLs];
  }
  else
  {
    id v6 = [(CalDAVUpdateGrantedDelegatesTaskGroup *)self addReadURLs];
    [(CalDAVUpdateGrantedDelegatesTaskGroup *)self addWriteURLs];
  v7 = };
  v8 = [MEMORY[0x263EFF9C0] setWithSet:v6];
  [v8 minusSet:v12];
  id v9 = (void *)MEMORY[0x263EFF9C0];
  uint64_t v10 = [(CalDAVUpdateGrantedDelegatesTaskGroup *)self removeURLs];
  id v11 = [v9 setWithSet:v10];

  [v11 unionSet:v7];
  [v11 intersectSet:v12];
  if ([v8 count] || objc_msgSend(v11, "count"))
  {
    [v8 unionSet:v12];
    [v8 minusSet:v11];
  }
  else
  {

    v8 = 0;
  }
  if (v4) {
    [(CalDAVUpdateGrantedDelegatesTaskGroup *)self setUpdatedWriteURLs:v8];
  }
  else {
    [(CalDAVUpdateGrantedDelegatesTaskGroup *)self setUpdatedReadURLs:v8];
  }
}

- (void)taskGroup:(id)a3 didFinishWithError:(id)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  if (!a4)
  {
    v7 = [MEMORY[0x263EFF9C0] set];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v8 = [v6 readWritePrincipalDetails];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v29 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = [*(id *)(*((void *)&v28 + 1) + 8 * i) principalURL];
          [v7 addObject:v13];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v10);
    }

    [(CalDAVUpdateGrantedDelegatesTaskGroup *)self _populateUpdatesFromFetched:v7 allowWrite:1];
    [v7 removeAllObjects];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v14 = objc_msgSend(v6, "readOnlyPrincipalDetails", 0);
    uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v25;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v25 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = [*(id *)(*((void *)&v24 + 1) + 8 * j) principalURL];
          [v7 addObject:v19];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v16);
    }

    [(CalDAVUpdateGrantedDelegatesTaskGroup *)self _populateUpdatesFromFetched:v7 allowWrite:0];
    v20 = [(CalDAVUpdateGrantedDelegatesTaskGroup *)self updatedWriteURLs];

    if (v20)
    {
      v21 = self;
      uint64_t v22 = 1;
    }
    else
    {
      v23 = [(CalDAVUpdateGrantedDelegatesTaskGroup *)self updatedReadURLs];

      v21 = self;
      if (!v23)
      {
        [(CalDAVUpdateGrantedDelegatesTaskGroup *)self _finishWithError:0 state:7];
        goto LABEL_22;
      }
      uint64_t v22 = 0;
    }
    [(CalDAVUpdateGrantedDelegatesTaskGroup *)v21 _updateDelegatesWithAllowWrite:v22];
LABEL_22:

    goto LABEL_23;
  }
  [(CalDAVUpdateGrantedDelegatesTaskGroup *)self _finishWithError:a4 state:4];
LABEL_23:
}

- (void)propPatchTask:(id)a3 parsedResponses:(id)a4 error:(id)a5
{
  id v13 = a5;
  id v7 = a3;
  v8 = [(CoreDAVTaskGroup *)self outstandingTasks];
  [v8 removeObject:v7];

  if (v13)
  {
    uint64_t v9 = self;
    id v10 = v13;
    uint64_t v11 = 5;
  }
  else
  {
    if ([(CalDAVUpdateGrantedDelegatesTaskGroup *)self state] == 3)
    {
      id v12 = [(CalDAVUpdateGrantedDelegatesTaskGroup *)self updatedReadURLs];

      if (v12)
      {
        [(CalDAVUpdateGrantedDelegatesTaskGroup *)self _updateDelegatesWithAllowWrite:0];
        goto LABEL_10;
      }
    }
    else if ([(CalDAVUpdateGrantedDelegatesTaskGroup *)self state] != 2)
    {
      uint64_t v9 = self;
      id v10 = 0;
      uint64_t v11 = 6;
      goto LABEL_9;
    }
    uint64_t v9 = self;
    id v10 = 0;
    uint64_t v11 = 7;
  }
LABEL_9:
  [(CalDAVUpdateGrantedDelegatesTaskGroup *)v9 _finishWithError:v10 state:v11];
LABEL_10:
}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_state = a3;
}

- (NSSet)addWriteURLs
{
  return self->_addWriteURLs;
}

- (void)setAddWriteURLs:(id)a3
{
}

- (NSSet)addReadURLs
{
  return self->_addReadURLs;
}

- (void)setAddReadURLs:(id)a3
{
}

- (NSSet)removeURLs
{
  return self->_removeURLs;
}

- (void)setRemoveURLs:(id)a3
{
}

- (NSSet)updatedWriteURLs
{
  return self->_updatedWriteURLs;
}

- (void)setUpdatedWriteURLs:(id)a3
{
}

- (NSSet)updatedReadURLs
{
  return self->_updatedReadURLs;
}

- (void)setUpdatedReadURLs:(id)a3
{
}

- (CalDAVGetGrantedDelegatesTaskGroup)getGrantedDelegatesTaskGroup
{
  return self->_getGrantedDelegatesTaskGroup;
}

- (void)setGetGrantedDelegatesTaskGroup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_getGrantedDelegatesTaskGroup, 0);
  objc_storeStrong((id *)&self->_updatedReadURLs, 0);
  objc_storeStrong((id *)&self->_updatedWriteURLs, 0);
  objc_storeStrong((id *)&self->_removeURLs, 0);
  objc_storeStrong((id *)&self->_addReadURLs, 0);
  objc_storeStrong((id *)&self->_addWriteURLs, 0);
}

@end